Subject: [PATCH resend] [MTD] CHIPS: Support for M50FLW080A and M50FLW080B
From: Nate Case <ncase@xes-inc.com>
To: dwmw2@infradead.org
Content-Type: text/plain
Date: Wed, 04 Jun 2008 12:15:19 -0500
Message-Id: <1212599719.7559.12.camel@localhost.localdomain>
Mime-Version: 1.0
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

Add support for M50FLW080A and M50FLW080B revisions of LPC flash
devices.

Signed-off-by: Aaron Lindner <alindner@xes-inc.com>
Signed-off-by: Nate Case <ncase@xes-inc.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    4 ++++
 drivers/mtd/chips/jedec_probe.c     |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index fcd1aec..8305ef5 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -50,6 +50,8 @@
 #define I82802AC	0x00ac
 #define MANUFACTURER_ST         0x0020
 #define M50LPW080       0x002F
+#define M50FLW080A	0x0080
+#define M50FLW080B	0x0081
 #define AT49BV640D	0x02de
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
@@ -301,6 +303,8 @@ static struct cfi_fixup jedec_fixup_table[] = {
 	{ MANUFACTURER_INTEL, I82802AB,   fixup_use_fwh_lock, NULL, },
 	{ MANUFACTURER_INTEL, I82802AC,   fixup_use_fwh_lock, NULL, },
 	{ MANUFACTURER_ST,    M50LPW080,  fixup_use_fwh_lock, NULL, },
+	{ MANUFACTURER_ST,    M50FLW080A, fixup_use_fwh_lock, NULL, },
+	{ MANUFACTURER_ST,    M50FLW080B, fixup_use_fwh_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
 static struct cfi_fixup fixup_table[] = {
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index aa07575..99f9ed2 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -141,6 +141,8 @@
 #define M50FW080	0x002D
 #define M50FW016	0x002E
 #define M50LPW080       0x002F
+#define M50FLW080A	0x0080
+#define M50FLW080B	0x0081
 
 /* SST */
 #define SST29EE020	0x0010
@@ -1590,6 +1592,36 @@ static const struct amd_flash_info jedec_table[] = {
 		.nr_regions	= 1,
 		.regions	= {
 			ERASEINFO(0x10000,16),
+		},
+	}, {
+		.mfr_id		= MANUFACTURER_ST,
+		.dev_id		= M50FLW080A,
+		.name		= "ST M50FLW080A",
+		.devtypes	= CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_UNNECESSARY,
+		.dev_size	= SIZE_1MiB,
+		.cmd_set	= P_ID_INTEL_EXT,
+		.nr_regions	= 4,
+		.regions	= {
+			ERASEINFO(0x1000,16),
+			ERASEINFO(0x10000,13),
+			ERASEINFO(0x1000,16),
+			ERASEINFO(0x1000,16),
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_ST,
+		.dev_id		= M50FLW080B,
+		.name		= "ST M50FLW080B",
+		.devtypes	= CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_UNNECESSARY,
+		.dev_size	= SIZE_1MiB,
+		.cmd_set	= P_ID_INTEL_EXT,
+		.nr_regions	= 4,
+		.regions	= {
+			ERASEINFO(0x1000,16),
+			ERASEINFO(0x1000,16),
+			ERASEINFO(0x10000,13),
+			ERASEINFO(0x1000,16),
 		}
 	}, {
 		.mfr_id		= MANUFACTURER_TOSHIBA,
-- 
1.5.4.4
