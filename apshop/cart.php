<?php include('header.php')?>
<?php

if (empty($_SESSION['user_id']) && empty($_SESSION['logged_in'])) {
    header('Location: login.php');
  }
?>
  
    <!--================Cart Area =================-->
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <?php if (!empty($_SESSION['cart'])) :?>
                      <table class="table">
                          <thead>
                              <tr>
                                  <th scope="col">Product</th>
                                  <th scope="col">Price</th>
                                  <th scope="col">Quantity</th>
                                  <th scope="col">Total</th>
                                  <th scope="col">Action</th>
                              </tr>
                          </thead>
                          <tbody>
                              <?php
                              require 'config/config.php';

                              $total = 0;
                              foreach ($_SESSION['cart'] as $key => $qty) :
                                $id = str_replace('id','',$key);

                                $stmt = $pdo->prepare("SELECT * FROM products WHERE id=".$id);
                                $stmt->execute();

                                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                                $total += $result['price'] * $qty;
                              ?>
                              <tr>
                                  <td>
                                      <div class="media">
                                          <div class="d-flex">
                                              <img src="admin/images/<?php echo escape($result['image'])?>" width="100" height="110">
                                          </div>
                                          <div class="media-body">
                                              <p><?php echo escape($result['name'])?></p>
                                          </div>
                                      </div>
                                  </td>
                                  <td>
                                      <h5><?php echo escape($result['price'])?></h5>
                                  </td>
                                  <td>
                                      <div class="product_count">
                                          <input type="text" value="<?php echo $qty?>" title="Quantity:" class="input-text qty" readonly>
                                      </div>
                                  </td>
                                  <td>
                                      <h5><?php echo escape($result['price'] * $qty)?></h5>
                                  </td>
                                  <td>
                                    <a style="line-height: 30px;border-radius: 10px;"
                                    class="primary-btn" href="cart_item_clear.php?pid=<?php echo $result['id']?>">Clear</a>
                                  </td>
                              </tr>

                              <?php endforeach ?>

                              <tr>
                                  <td>

                                  </td>
                                  <td>

                                  </td>
                                  <td>

                                  </td>
                                  <td>
                                      <h5>Subtotal</h5>
                                  </td>
                                  <td>
                                      <h5><?php echo $total ?></h5>
                                  </td>
                              </tr>

                              <tr class="out_button_area">
                                  <td>

                                  </td>
                                  <td>

                                  </td>
                                  <td>

                                  </td>
                                  <td>

                                  </td>
                                  <td>
                                      <div class="checkout_btn_inner d-flex align-items-center">
                                          <a class="gray_btn" href="clearall.php">Clear All</a>
                                          <a class="primary-btn" href="index.php">Continue Shopping</a>
                                          <a class="gray_btn" href="sale_order.php">Order Submit</a>
                                      </div>
                                  </td>
                              </tr>
                          </tbody>
                      </table>

                    <?php endif ?>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->

    <!-- start footer Area -->
    <!-- start footer Area -->
  			<!-- End Best Seller -->
              <?php 
                  include('footer.php') 
  
                ?>