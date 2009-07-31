Received: from ey-out-1920.google.com ([74.125.78.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWrTm-0003CK-Ld
	for linux-mtd@lists.infradead.org; Fri, 31 Jul 2009 12:45:03 +0000
Received: by ey-out-1920.google.com with SMTP id 5so520550eyb.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 31 Jul 2009 05:44:55 -0700 (PDT)
Message-ID: <4A72E7FE.6000207@gmail.com>
Date: Fri, 31 Jul 2009 14:47:58 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] slram: Read buffer overflow
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

map[count] is checked before count < SLRAM_MAX_DEVICES_PARAMS

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
declared on drivers/mtd/devices/slram.c:66:

static char *map[SLRAM_MAX_DEVICES_PARAMS];

diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 00248e8..239500b 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -341,7 +341,7 @@ static int init_slram(void)
 #else
 	int count;
 
-	for (count = 0; (map[count]) && (count < SLRAM_MAX_DEVICES_PARAMS);
+	for (count = 0; count < SLRAM_MAX_DEVICES_PARAMS && map[count];
 			count++) {
 	}
 
