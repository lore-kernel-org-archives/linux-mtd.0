Received: from ug-out-1314.google.com ([66.249.92.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JUz6W-0006MD-9w
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 06:52:24 +0000
Received: by ug-out-1314.google.com with SMTP id 23so154658ugr.45
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Feb 2008 22:52:23 -0800 (PST)
Message-ID: <97a0a9ac0802282245h65967c30lf7cb6e9f87c021b3@mail.gmail.com>
Date: Thu, 28 Feb 2008 23:45:29 -0700
From: "Gordon Farquharson" <gordonfarquharson@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] [NOR] Add support for the ST M29W400DT and
	M29W400DB flash chips
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

Hi Andrew

On Tue, Feb 26, 2008 at 2:39 PM, Gordon Farquharson
<gordonfarquharson@gmail.com> wrote:

>  Add support for the ST M29W400DB flash chip. which is used on the GLAN Tank NAS.
>
>  Signed-off-by: Gordon Farquharson <gordonfarquharson@gmail.com>

Thank you very much for including this patch in your -mm tree. During
my testing, I found that the unlock address in this patch must be
updated because jedec_table[] contains byte addresses [1]. My previous
patch worked with 2.6.23, but doesn't with 2.6.24 and 2.6.25-rc3. In
the updated patch (below), I have also added the top boot device
(M29W400DT) to the table for completeness, and cleaned up a some of
the formatting in the file.

It would be great if you could update the patch in your tree with the
patch below.

Thanks very much.

Gordon

[1] http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=cec80bf2cc5283f2f00c34f474be857e5c9f6f65

---

Add support for the ST M29W400DT and M29W400DB flash chips. The latter
is used on the GLAN Tank NAS.

Signed-off-by: Gordon Farquharson <gordonfarquharson@gmail.com>

---

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 4be51a8..00159f5 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -132,6 +132,8 @@
 #define M29F800AB	0x0058
 #define M29W800DT	0x00D7
 #define M29W800DB	0x005B
+#define M29W400DT	0x00EE
+#define M29W400DB	0x00EF
 #define M29W160DT	0x22C4
 #define M29W160DB	0x2249
 #define M29W040B	0x00E3
@@ -1426,7 +1428,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x08000,1),
 			ERASEINFO(0x10000,15),
 		}
-       }, {
+	}, {
 		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W800DT,
 		.name		= "ST M29W800DT",
@@ -1456,6 +1458,36 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x08000,1),
 			ERASEINFO(0x10000,15)
 		}
+	},  {
+		.mfr_id         = MANUFACTURER_ST,
+		.dev_id         = M29W400DT,
+		.name           = "ST M29W400DT",
+		.devtypes       = CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
+		.uaddr          = MTD_UADDR_0x0AAA_0x0555,
+		.dev_size       = SIZE_512KiB,
+		.cmd_set        = P_ID_AMD_STD,
+		.nr_regions     = 4,
+		.regions        = {
+			ERASEINFO(0x04000,7),
+			ERASEINFO(0x02000,1),
+			ERASEINFO(0x08000,2),
+			ERASEINFO(0x10000,1)
+		}
+	}, {
+		.mfr_id         = MANUFACTURER_ST,
+		.dev_id         = M29W400DB,
+		.name           = "ST M29W400DB",
+		.devtypes       = CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
+		.uaddr          = MTD_UADDR_0x0AAA_0x0555,
+		.dev_size       = SIZE_512KiB,
+		.cmd_set        = P_ID_AMD_STD,
+		.nr_regions     = 4,
+		.regions        = {
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x10000,7)
+		}
 	}, {
 		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W160DT,
@@ -1486,7 +1518,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x08000,1),
 			ERASEINFO(0x10000,31)
 		}
-        }, {
+	}, {
 		.mfr_id		= MANUFACTURER_ST,
 		.dev_id		= M29W040B,
 		.name		= "ST M29W040B",
@@ -1498,7 +1530,7 @@ static const struct amd_flash_info jedec_table[] = {
 		.regions	= {
 			ERASEINFO(0x10000,8),
 		}
-        }, {
+	}, {
 		.mfr_id		= MANUFACTURER_ST,
 		.dev_id		= M50FW040,
 		.name		= "ST M50FW040",
@@ -1510,7 +1542,7 @@ static const struct amd_flash_info jedec_table[] = {
 		.regions	= {
 			ERASEINFO(0x10000,8),
 		}
-        }, {
+	}, {
 		.mfr_id		= MANUFACTURER_ST,
 		.dev_id		= M50FW080,
 		.name		= "ST M50FW080",
@@ -1522,7 +1554,7 @@ static const struct amd_flash_info jedec_table[] = {
 		.regions	= {
 			ERASEINFO(0x10000,16),
 		}
-        }, {
+	}, {
 		.mfr_id		= MANUFACTURER_ST,
 		.dev_id		= M50FW016,
 		.name		= "ST M50FW016",

-- 
Gordon Farquharson
GnuPG Key ID: 32D6D676
