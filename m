Received: from smtp.seznam.cz ([77.75.72.43])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCKaI-0003Cz-2q
	for linux-mtd@lists.infradead.org; Sun, 22 Nov 2009 22:07:10 +0000
Date: Mon, 23 Nov 2009 00:06:50 +0100
From: Ladislav Michl <Ladislav.Michl@seznam.cz>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] fix M29W800D dev_id and uaddr
Message-ID: <20091122230649.GA29911@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Reply-To: Ladislav Michl <ladis@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This one sits in my tree for more than two years...
Using device code found on page 12 (http://www.btdesigner.com/pdfs/M29W800D.pdf)
and unlock address from page 15 MTD subsytem happily detects ST M29W800DB
in 16-bit mode. I do believe original author used only 8-bit mode and thus
didn't hit this bug.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 736a3be..1bec5e1 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -142,8 +142,8 @@
 
 /* ST - www.st.com */
 #define M29F800AB	0x0058
-#define M29W800DT	0x00D7
-#define M29W800DB	0x005B
+#define M29W800DT	0x22D7
+#define M29W800DB	0x225B
 #define M29W400DT	0x00EE
 #define M29W400DB	0x00EF
 #define M29W160DT	0x22C4
@@ -1575,7 +1575,7 @@ static const struct amd_flash_info jedec_table[] = {
 		.dev_id		= M29W800DT,
 		.name		= "ST M29W800DT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
-		.uaddr		= MTD_UADDR_0x5555_0x2AAA,	/* ???? */
+		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
 		.dev_size	= SIZE_1MiB,
 		.cmd_set	= P_ID_AMD_STD,
 		.nr_regions	= 4,
@@ -1590,7 +1590,7 @@ static const struct amd_flash_info jedec_table[] = {
 		.dev_id		= M29W800DB,
 		.name		= "ST M29W800DB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
-		.uaddr		= MTD_UADDR_0x5555_0x2AAA,	/* ???? */
+		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
 		.dev_size	= SIZE_1MiB,
 		.cmd_set	= P_ID_AMD_STD,
 		.nr_regions	= 4,
