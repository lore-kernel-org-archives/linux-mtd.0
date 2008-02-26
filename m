Received: from an-out-0708.google.com ([209.85.132.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JU7Wm-0001KE-Gd
	for linux-mtd@lists.infradead.org; Tue, 26 Feb 2008 21:39:56 +0000
Received: by an-out-0708.google.com with SMTP id c3so434374ana.99
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Feb 2008 13:39:54 -0800 (PST)
Message-ID: <97a0a9ac0802261339w6eb6143fx87ddca8bcb0add87@mail.gmail.com>
Date: Tue, 26 Feb 2008 14:39:54 -0700
From: "Gordon Farquharson" <gordonfarquharson@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [NOR] Add support for the ST M29W400DB flash chip
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please could somebody acknowledge this patch. I have sent it to
linux-mtd several times and received no response [1]. It was
originally posted to linux-mtd on 2008-01-08 in the hope that it would
be included in 2.6.25.

Thanks.

[1] http://lists.infradead.org/pipermail/linux-mtd/2008-January/020291.html

---

Add support for the ST M29W400DB flash chip. which is used on the GLAN Tank NAS.

Signed-off-by: Gordon Farquharson <gordonfarquharson@gmail.com>

---

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 4be51a8..51ec937 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -135,6 +135,7 @@
 #define M29W160DT	0x22C4
 #define M29W160DB	0x2249
 #define M29W040B	0x00E3
+#define M29W400DB	0x00EF
 #define M50FW040	0x002C
 #define M50FW080	0x002D
 #define M50FW016	0x002E
@@ -1498,7 +1499,22 @@ static const struct amd_flash_info jedec_table[] = {
 		.regions	= {
 			ERASEINFO(0x10000,8),
 		}
-        }, {
+	}, {
+		.mfr_id		= MANUFACTURER_ST,
+		.dev_id		= M29W400DB,
+		.name		= "ST M29W400DB",
+		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_0x0555_0x02AA,
+		.dev_size	= SIZE_512KiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 4,
+		.regions	= {
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x10000,7)
+		}
+	}, {
 		.mfr_id		= MANUFACTURER_ST,
 		.dev_id		= M50FW040,
 		.name		= "ST M50FW040",

-- 
Gordon Farquharson
GnuPG Key ID: 32D6D676
