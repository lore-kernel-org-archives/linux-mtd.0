Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NszRG-0000sm-Cz
	for linux-mtd@lists.infradead.org; Sat, 20 Mar 2010 14:14:12 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: kernel-janitors@vger.kernel.org
Date: Sat, 20 Mar 2010 15:12:42 +0100
Message-Id: <1269094385-16114-2-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
Subject: [PATCH 01/24] mtd/maps/pismo: remove dangling pointer and a leak
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Wolfram Sang <w.sang@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-i2c@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While looking for drivers which forgot to clear i2c_clientdata before freeing
the data structure it points to, I found that the pismo driver even has a leak
on the probe error path.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: David Woodhouse <David.Woodhouse@intel.com>
---
 drivers/mtd/maps/pismo.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index 30e12c8..86081bc 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -233,6 +233,7 @@ static int __devexit pismo_remove(struct i2c_client *client)
 	/* FIXME: set_vpp needs saner arguments */
 	pismo_setvpp_remove_fix(pismo);
 
+	i2c_set_clientdata(client, NULL);
 	kfree(pismo);
 
 	return 0;
@@ -271,7 +272,7 @@ static int __devinit pismo_probe(struct i2c_client *client,
 	ret = pismo_eeprom_read(client, &eeprom, 0, sizeof(eeprom));
 	if (ret < 0) {
 		dev_err(&client->dev, "error reading EEPROM: %d\n", ret);
-		return ret;
+		goto exit_free;
 	}
 
 	dev_info(&client->dev, "%.15s board found\n", eeprom.board);
@@ -282,6 +283,11 @@ static int __devinit pismo_probe(struct i2c_client *client,
 				      pdata->cs_addrs[i]);
 
 	return 0;
+
+ exit_free:
+	i2c_set_clientdata(client, NULL);
+	kfree(prismo);
+	return ret;
 }
 
 static const struct i2c_device_id pismo_id[] = {
-- 
1.7.0
