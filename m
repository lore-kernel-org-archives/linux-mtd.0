Received: from mail-ew0-f20.google.com ([209.85.219.20])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LOgrK-0007ao-3J
	for linux-mtd@lists.infradead.org; Sun, 18 Jan 2009 23:15:16 +0000
Received: by ewy13 with SMTP id 13so157732ewy.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jan 2009 15:15:12 -0800 (PST)
Message-ID: <4973B801.5050408@gmail.com>
Date: Mon, 19 Jan 2009 00:15:13 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH] MTD: a negative devlength won't get noticed
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

a negative devlength won't get noticed and clean up:

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
devstart and devlength are unsigned longs and handle_unit() can only
return positive. so a negative devstart won't occur, only a negative
devlength can when (*(szlength) != '+').

for hadle_unit() see
vi drivers/mtd/devices/slram.c +244

diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index a425d09..00248e8 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -267,22 +267,28 @@ static int parse_cmdline(char *devname, char *szstart, char *szlength)
 	if (*(szlength) != '+') {
 		devlength = simple_strtoul(szlength, &buffer, 0);
 		devlength = handle_unit(devlength, buffer) - devstart;
+		if (devlength < devstart)
+			goto err_out;
+
+		devlength -= devstart;
 	} else {
 		devlength = simple_strtoul(szlength + 1, &buffer, 0);
 		devlength = handle_unit(devlength, buffer);
 	}
 	T("slram: devname=%s, devstart=0x%lx, devlength=0x%lx\n",
 			devname, devstart, devlength);
-	if ((devstart < 0) || (devlength < 0) || (devlength % SLRAM_BLK_SZ != 0)) {
-		E("slram: Illegal start / length parameter.\n");
-		return(-EINVAL);
-	}
+	if (devlength % SLRAM_BLK_SZ != 0)
+		goto err_out;
 
 	if ((devstart = register_device(devname, devstart, devlength))){
 		unregister_devices();
 		return((int)devstart);
 	}
 	return(0);
+
+err_out:
+	E("slram: Illegal length parameter.\n");
+	return(-EINVAL);
 }
 
 #ifndef MODULE
