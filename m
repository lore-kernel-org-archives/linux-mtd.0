From: Johan Hovold <jhovold@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 7/7] backlight: atmel-pwm-bl: fix deferred probe from __init
Date: Mon, 23 Sep 2013 16:27:32 +0200
Message-Id: <1379946452-25649-8-git-send-email-jhovold@gmail.com>
In-Reply-To: <1379946452-25649-1-git-send-email-jhovold@gmail.com>
References: <20130923134028.GF21013@sirena.org.uk>
 <1379946452-25649-1-git-send-email-jhovold@gmail.com>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-fbdev@vger.kernel.org,
 linux-usb@vger.kernel.org, Mark Brown <broonie@linaro.org>,
 Johan Hovold <jhovold@gmail.com>, linux-pcmcia@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Grant Likely <grant.likely@linaro.org>,
 Richard Purdie <rpurdie@rpsys.net>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move probe out of __init section and don't use platform_driver_probe
which cannot be used with deferred probing.

Since commit e9354576 ("gpiolib: Defer failed gpio requests by default")
this driver might return -EPROBE_DEFER if a gpio_request fails.

Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jingoo Han <jg1.han@samsung.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Signed-off-by: Johan Hovold <jhovold@gmail.com>
---
 drivers/video/backlight/atmel-pwm-bl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/atmel-pwm-bl.c b/drivers/video/backlight/atmel-pwm-bl.c
index 0393d82..f7447f7 100644
--- a/drivers/video/backlight/atmel-pwm-bl.c
+++ b/drivers/video/backlight/atmel-pwm-bl.c
@@ -118,7 +118,7 @@ static const struct backlight_ops atmel_pwm_bl_ops = {
 	.update_status  = atmel_pwm_bl_set_intensity,
 };
 
-static int __init atmel_pwm_bl_probe(struct platform_device *pdev)
+static int atmel_pwm_bl_probe(struct platform_device *pdev)
 {
 	struct backlight_properties props;
 	const struct atmel_pwm_bl_platform_data *pdata;
@@ -202,7 +202,7 @@ err_free_mem:
 	return retval;
 }
 
-static int __exit atmel_pwm_bl_remove(struct platform_device *pdev)
+static int atmel_pwm_bl_remove(struct platform_device *pdev)
 {
 	struct atmel_pwm_bl *pwmbl = platform_get_drvdata(pdev);
 
@@ -220,10 +220,11 @@ static struct platform_driver atmel_pwm_bl_driver = {
 		.name = "atmel-pwm-bl",
 	},
 	/* REVISIT add suspend() and resume() */
-	.remove = __exit_p(atmel_pwm_bl_remove),
+	.probe = atmel_pwm_bl_probe,
+	.remove = atmel_pwm_bl_remove,
 };
 
-module_platform_driver_probe(atmel_pwm_bl_driver, atmel_pwm_bl_probe);
+module_platform_driver(atmel_pwm_bl_driver);
 
 MODULE_AUTHOR("Hans-Christian egtvedt <hans-christian.egtvedt@atmel.com>");
 MODULE_DESCRIPTION("Atmel PWM backlight driver");
-- 
1.8.3.2
