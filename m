Received: from nz-out-0102.google.com ([64.233.162.199])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKADl-0003we-Lm
	for linux-mtd@lists.infradead.org; Mon, 04 Sep 2006 09:54:22 +0100
Received: by nz-out-0102.google.com with SMTP id s1so732317nze
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Sep 2006 01:53:20 -0700 (PDT)
Message-ID: <6d6a94c50609040146k3538ef21x2a6d426f344f1e2e@mail.gmail.com>
Date: Mon, 4 Sep 2006 16:46:44 +0800
From: Aubrey <aubreylee@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Fill more device IDS in the structure of m25p80 driver
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

the structure:
struct flash_info __devinitdata m25p_data [] = {
/* REVISIT: fill in JEDEC ids, for parts that have them */
...
};

has a bunch of missing fields (like the JEDEC ids indicated) ... this
causes problems when actually trying to use some ST parts as it gets
detected incorrectly

The following is the patch.
----------------------------------------------------------------------
Signed-off-by: Aubrey L1 <aubreylee@gmail.com>
---

 * Fill more device IDS in the structure of m25p80 driver.
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index a846614..ef4a731 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -406,13 +406,13 @@ struct flash_info {

 static struct flash_info __devinitdata m25p_data [] = {
        /* REVISIT: fill in JEDEC ids, for parts that have them */
-       { "m25p05", 0x05, 0x0000, 32 * 1024, 2 },
-       { "m25p10", 0x10, 0x0000, 32 * 1024, 4 },
-       { "m25p20", 0x11, 0x0000, 64 * 1024, 4 },
-       { "m25p40", 0x12, 0x0000, 64 * 1024, 8 },
+       { "m25p05", 0x05, 0x2010, 32 * 1024, 2 },
+       { "m25p10", 0x10, 0x2011, 32 * 1024, 4 },
+       { "m25p20", 0x11, 0x2012, 64 * 1024, 4 },
+       { "m25p40", 0x12, 0x2013, 64 * 1024, 8 },
        { "m25p80", 0x13, 0x0000, 64 * 1024, 16 },
-       { "m25p16", 0x14, 0x0000, 64 * 1024, 32 },
-       { "m25p32", 0x15, 0x0000, 64 * 1024, 64 },
+       { "m25p16", 0x14, 0x2015, 64 * 1024, 32 },
+       { "m25p32", 0x15, 0x2016, 64 * 1024, 64 },
        { "m25p64", 0x16, 0x2017, 64 * 1024, 128 },
 };

Regards,
-Aubrey
