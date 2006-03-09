Received: from gprs189-60.eurotel.cz ([160.218.189.60] helo=amd.ucw.cz)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHKLa-0007Fl-Bz
	for linux-mtd@lists.infradead.org; Thu, 09 Mar 2006 12:34:31 +0000
Date: Thu, 9 Mar 2006 13:33:23 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Andrew Morton <akpm@osdl.org>, kernel list <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, rpurdie@rpsys.net, lenz@cs.wisc.edu,
	Russell King <rmk@arm.linux.org.uk>
Message-ID: <20060309123323.GA3601@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: 
Subject: [PATCH] Add chip used in collie to jedec_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds flash chip used in Sharp Zaurus sl5500 (collie) to
jedec_probe. Values work for read-only access, but I have not figured
out how to do read-write.

Signed-off-by: Pavel Machek <pavel@suse.cz>

--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -34,6 +34,7 @@
 #define MANUFACTURER_MACRONIX	0x00C2
 #define MANUFACTURER_NEC	0x0010
 #define MANUFACTURER_PMC	0x009D
+#define MANUFACTURER_SHARP	0x00b0
 #define MANUFACTURER_SST	0x00BF
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_TOSHIBA	0x0098
@@ -124,6 +125,9 @@
 #define PM49FL004	0x006E
 #define PM49FL008	0x006A
 
+/* Sharp */
+#define LH28F640BF	0x00b0
+
 /* ST - www.st.com */
 #define M29W800DT	0x00D7
 #define M29W800DB	0x005B
@@ -1267,6 +1271,19 @@ static const struct amd_flash_info jedec
 		.regions	= {
 			ERASEINFO( 0x01000, 256 )
 		}
+	}, {
+		.mfr_id		= MANUFACTURER_SHARP,
+		.dev_id		= LH28F640BF,
+		.name		= "LH28F640BF",
+		.uaddr		= {
+			[0] = MTD_UADDR_UNNECESSARY,    /* x8 */
+		},
+		.DevSize	= SIZE_4MiB,
+		.CmdSet         = P_ID_INTEL_STD,
+		.NumEraseRegions= 1,
+		.regions        = {
+			ERASEINFO(0x40000,16),
+		}
         }, {
 		.mfr_id		= MANUFACTURER_SST,
 		.dev_id		= SST39LF512,

-- 
Web maintainer for suspend.sf.net (www.sf.net/projects/suspend) wanted...
