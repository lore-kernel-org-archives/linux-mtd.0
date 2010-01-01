Received: from mail-gx0-f223.google.com ([209.85.217.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NQeQA-0001Yt-Um
	for linux-mtd@lists.infradead.org; Fri, 01 Jan 2010 10:07:55 +0000
Received: by gxk23 with SMTP id 23so14787367gxk.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Jan 2010 02:07:50 -0800 (PST)
Message-ID: <4B3DC972.1020702@gmail.com>
Date: Fri, 01 Jan 2010 18:07:46 +0800
From: Wan ZongShun <mcuos.com@gmail.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] ARM: NUC900: rename mtd nand driver name
Content-Type: multipart/mixed; boundary="------------050403090204010504090000"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050403090204010504090000
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit


Re-sent it to linux-mtd list.

--------------050403090204010504090000
Content-Type: message/rfc822;
 name="[PATCH] ARM: NUC900: rename mtd nand driver name.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="[PATCH] ARM: NUC900: rename mtd nand driver name.eml"

X-Mozilla-Keys: 
Message-ID: <4B3DC883.5060405@gmail.com>
Date: Fri, 01 Jan 2010 18:03:47 +0800
From: Wan ZongShun <mcuos.com@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
 NUC900-LINUX <nuc900@googlegroups.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] ARM: NUC900: rename mtd nand driver name
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit

Dear David,

Due to I have renamed the platform_device.name,so this patch changes
this nand driver platform_driver name.

Signed-off-by: Wan ZongShun <mcuos.com@gmail.com>

---
 drivers/mtd/nand/w90p910_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/w90p910_nand.c
b/drivers/mtd/nand/w90p910_nand.c
index 7680e73..c2e9b68 100644
--- a/drivers/mtd/nand/w90p910_nand.c
+++ b/drivers/mtd/nand/w90p910_nand.c
@@ -358,7 +358,7 @@ static struct platform_driver w90p910_nand_driver = {
 	.probe		= w90p910_nand_probe,
 	.remove		= __devexit_p(w90p910_nand_remove),
 	.driver		= {
-		.name	= "w90p910-fmi",
+		.name	= "nuc900-fmi",
 		.owner	= THIS_MODULE,
 	},
 };
@@ -379,4 +379,4 @@ module_exit(w90p910_nand_exit);
 MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
 MODULE_DESCRIPTION("w90p910 nand driver!");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:w90p910-fmi");
+MODULE_ALIAS("platform:nuc900-fmi");
-- 
1.5.6.3


--------------050403090204010504090000--
