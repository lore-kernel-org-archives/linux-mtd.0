Received: from mail170.messagelabs.com ([216.82.253.227])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T7Djm-0003pa-Cz
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 23:01:23 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Fri, 31 Aug 2012 08:59:48 +1000
Subject: RE: [PATCH] Test for multi-bit error correction
Message-ID: <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 ,<1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>,
 <1346315075.2848.538.camel@sauron.fi.intel.com>
In-Reply-To: <1346315075.2848.538.camel@sauron.fi.intel.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This tests ECC biterror recovery on a single NAND page. Mostly intended
to test ECC hardware and low-level NAND driver.

There are two test modes:

    0 - artificially inserting bit errors until the ECC fails
        This is the default method and fairly quick. It should
        be independent of the quality of the FLASH.

    1 - re-writing the same pattern repeatedly until the ECC fails.
        This method relies on the physics of NAND FLASH to eventually
        generate '0' bits if '1' has been written sufficient times. Depend=
ing
        on the NAND, the first bit errors will appear after 1000 or
        more writes and then will usually snowball, reaching the limits
        of the ECC quickly.

The test stops after 10000 cycles, should your FLASH be exceptionally
good and not generate bit errors before that. Try a different page
offset in that case.

Please note that neither of these tests will significantly 'use up' any FL=
ASH
endurance. Only a maximum of two erase operations will be performed.

Signed-off-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>
---
 drivers/mtd/tests/Makefile          |    1 +
 drivers/mtd/tests/mtd_nandbiterrs.c |  460 ++++++++++++++++++++++++++++++=
+++++
 2 files changed, 461 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/tests/mtd_nandbiterrs.c

diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index b44dcab..bd0065c 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_MTD_TESTS) +=3D mtd_stresstest.o
 obj-$(CONFIG_MTD_TESTS) +=3D mtd_subpagetest.o
 obj-$(CONFIG_MTD_TESTS) +=3D mtd_torturetest.o
 obj-$(CONFIG_MTD_TESTS) +=3D mtd_nandecctest.o
+obj-$(CONFIG_MTD_TESTS) +=3D mtd_nandbiterrs.o
diff --git a/drivers/mtd/tests/mtd_nandbiterrs.c b/drivers/mtd/tests/mtd_n=
andbiterrs.c
new file mode 100644
index 0000000..94e908e
--- /dev/null
+++ b/drivers/mtd/tests/mtd_nandbiterrs.c
@@ -0,0 +1,460 @@
+/*
+ * (C)2012 NetCommWireless
+ * Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>
+ *
+ * Test for multi-bit error recovery on a NAND page This mostly tests the=

+ * ECC controller / driver.
+ *
+ * There are two test modes:
+ *
+ *=090 - artificially inserting bit errors until the ECC fails
+ *=09    This is the default method and fairly quick. It should
+ *=09    be independent of the quality of the FLASH.
+ *
+ *=091 - re-writing the same pattern repeatedly until the ECC fails.
+ *=09    This method relies on the physics of NAND FLASH to eventually
+ *=09    generate '0' bits if '1' has been written sufficient times.
+ *=09    Depending on the NAND, the first bit errors will appear after
+ *=09    1000 or more writes and then will usually snowball, reaching the=

+ *=09    limits of the ECC quickly.
+ *
+ *=09    The test stops after 10000 cycles, should your FLASH be
+ *=09    exceptionally good and not generate bit errors before that. Try
+ *=09    a different page in that case.
+ *
+ * Please note that neither of these tests will significantly 'use up' an=
y
+ * FLASH endurance. Only a maximum of two erase operations will be perfor=
med.
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify i=
t
+ * under the terms of the GNU General Public License version 2 as publish=
ed by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WI=
THOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License f=
or
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alon=
g with
+ * this program; see the file COPYING. If not, write to the Free Software=

+ * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ */
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mtd/mtd.h>
+#include <linux/err.h>
+#include <linux/mtd/nand.h>
+#include <linux/slab.h>
+
+#define msg(FMT, VA...) pr_info("mtd_nandbiterrs: "FMT, ##VA)
+
+static int dev;
+module_param(dev, int, S_IRUGO);
+MODULE_PARM_DESC(dev, "MTD device number to use");
+
+static unsigned page_offset;
+module_param(page_offset, uint, S_IRUGO);
+MODULE_PARM_DESC(page_offset, "Page number relative to dev start");
+
+static unsigned seed;
+module_param(seed, uint, S_IRUGO);
+MODULE_PARM_DESC(seed, "Random seed");
+
+static int mode;
+module_param(mode, int, S_IRUGO);
+MODULE_PARM_DESC(mode, "0=3Dincremental errors, 1=3Doverwrite test");
+
+static unsigned max_overwrite =3D 10000;
+
+static loff_t   offset;     /* Offset of the page we're using. */
+static unsigned eraseblock; /* Eraseblock number for our page. */
+
+/* We assume that the ECC can correct up to a certain number
+ * of biterrors per subpage. */
+static unsigned subsize;  /* Size of subpages */
+static unsigned subcount; /* Number of subpages per page */
+
+static struct mtd_info *mtd;   /* MTD device */
+
+static uint8_t *wbuffer; /* One page write / compare buffer */
+static uint8_t *rbuffer; /* One page read buffer */
+
+/* 'random' bytes from known offsets */
+static uint8_t hash(unsigned=20offset)
+{
+=09unsigned v =3D offset;
+=09unsigned char c;
+=09v ^=3D 0x7f7edfd3;
+=09v =3D v ^ (v >> 3);
+=09v =3D v ^ (v >> 5);
+=09v =3D v ^ (v >> 13);
+=09c =3D v & 0xFF;
+=09/* Reverse bits of result. */
+=09c =3D (c & 0x0F) << 4 | (c & 0xF0) >> 4;
+=09c =3D (c & 0x33) << 2 | (c & 0xCC) >> 2;
+=09c =3D (c & 0x55) << 1 | (c & 0xAA) >> 1;
+=09return c;
+}
+
+static int erase_block(void)
+{
+=09int err;
+=09struct erase_info ei;
+=09loff_t addr =3D eraseblock * mtd->erasesize;
+
+=09msg("erase_block\n");
+
+=09memset(&ei, 0, sizeof(struct erase_info));
+=09ei.mtd  =3D mtd;
+=09ei.addr =3D addr;
+=09ei.len  =3D mtd->erasesize;
+
+=09err =3D mtd_erase(mtd, &ei);
+=09if (err || ei.state =3D=3D MTD_ERASE_FAILED) {
+=09=09msg("error %d while erasing\n", err);
+=09=09if (!err)
+=09=09=09err =3D -EIO;
+=09=09return err;
+=09}
+
+=09return 0;
+}
+
+/* Writes wbuffer to page */
+static int write_page(int log)
+{
+=09int err =3D 0;
+=09size_t written;
+
+=09if (log)
+=09=09msg("write_page\n");
+
+=09err =3D mtd_write(mtd, offset, mtd->writesize, &written, wbuffer);
+=09if (err || written !=3D mtd->writesize) {
+=09=09msg("error: write failed at %#llx\n", (long long)offset);
+=09=09if (!err)
+=09=09=09err =3D -EIO;
+=09}
+
+=09return err;
+}
+
+/* Re-writes the data area while leaving the OOB alone. */
+static int rewrite_page(int log)
+{
+=09int err =3D 0;
+=09struct mtd_oob_ops ops;
+
+=09if (log)
+=09=09msg("rewrite page\n");
+
+=09ops.mode      =3D MTD_OPS_RAW; /* No ECC */
+=09ops.len       =3D mtd->writesize;
+=09ops.retlen    =3D 0;
+=09ops.ooblen    =3D 0;
+=09ops.oobretlen =3D 0;
+=09ops.ooboffs   =3D 0;
+=09ops.datbuf    =3D wbuffer;
+=09ops.oobbuf    =3D NULL;
+
+=09err =3D mtd_write_oob(mtd, offset, &ops);
+=09if (err || ops.retlen !=3D mtd->writesize) {
+=09=09msg("error: write_oob failed (%d)\n", err);
+=09=09if (!err)
+=09=09=09err =3D -EIO;
+=09}
+
+=09return err;
+}
+
+/* Reads page into rbuffer. Returns number of corrected bit errors (>=3D0=
)
+ * or error (<0) */
+static int read_page(int log)
+{
+=09int err =3D 0;
+=09size_t read;
+=09struct mtd_ecc_stats oldstats;
+
+=09if (log)
+=09=09msg("read_page\n");
+
+=09/* Saving last mtd stats */
+=09memcpy(&oldstats, &mtd->ecc_stats, sizeof(oldstats));
+
+=09err =3D mtd_read(mtd, offset, mtd->writesize, &read, rbuffer);
+=09if (err =3D=3D -EUCLEAN)
+=09=09err =3D mtd->ecc_stats.corrected - oldstats.corrected;
+
+=09if (err < 0 || read !=3D mtd->writesize) {
+=09=09msg("error: read failed at %#llx\n", (long long)offset);
+=09=09if (err >=3D 0)
+=09=09=09err =3D -EIO;
+=09}
+
+=09return err;
+}
+
+/* Verifies rbuffer against random sequence */
+static int verify_page(int log)
+{
+=09unsigned i, errs =3D 0;
+
+=09if (log)
+=09=09msg("verify_page\n");
+
+=09for (i =3D 0; i < mtd->writesize; i++) {
+=09=09if (rbuffer[i] !=3D hash(i+seed)) {
+=09=09=09msg("Error: page offset %u, expected %02x, got %02x\n",
+=09=09=09=09i, hash(i+seed), rbuffer[i]);
+=09=09=09errs++;
+=09=09}
+=09}
+
+=09if (errs)
+=09=09return -EIO;
+=09else
+=09=09return 0;
+}
+
+#define CBIT(v, n) ((v) & (1 << (n)))
+#define BCLR(v, n) ((v) =3D (v) & ~(1 << (n)))
+
+/* Finds the first '1' bit in wbuffer starting at offset 'byte'
+ * and sets it to '0'. */
+static int insert_biterror(unsigned byte)
+{
+=09int bit;
+
+=09while (byte < mtd->writesize) {
+=09=09for (bit =3D 7; bit >=3D 0; bit--) {
+=09=09=09if (CBIT(wbuffer[byte], bit)) {
+=09=09=09=09BCLR(wbuffer[byte], bit);
+=09=09=09=09msg("Inserted biterror @ %u/%u\n", byte, bit);
+=09=09=09=09return 0;
+=09=09=09}
+=09=09}
+=09=09byte++;
+=09}
+=09msg("biterror: Failed to find a '1' bit\n");
+=09return -EIO;
+}
+
+/* Writes 'random' data to page and then introduces deliberate bit
+ * errors into the page, while verifying each step. */
+static int incremental_errors_test(void)
+{
+=09int err =3D 0;
+=09unsigned i;
+=09unsigned errs_per_subpage =3D 0;
+
+=09msg("incremental biterrors test\n");
+
+=09for (i =3D 0; i < mtd->writesize; i++)
+=09=09wbuffer[i] =3D hash(i+seed);
+
+=09err =3D write_page(1);
+=09if (err)
+=09=09goto exit;
+
+=09while (1) {
+
+=09=09err =3D rewrite_page(1);
+=09=09if (err)
+=09=09=09goto exit;
+
+=09=09err =3D read_page(1);
+=09=09if (err > 0)
+=09=09=09msg("Read reported %d corrected bit errors\n", err);
+=09=09if (err < 0) {
+=09=09=09msg("After %d biterrors per subpage, read reported error %d\n",
+=09=09=09=09errs_per_subpage, err);
+=09=09=09err =3D 0;
+=09=09=09goto exit;
+=09=09}
+
+=09=09err =3D verify_page(1);
+=09=09if (err) {
+=09=09=09msg("ECC failure, read data is incorrect despite read success\n"=
);
+=09=09=09goto exit;
+=09=09}
+
+=09=09msg("Successfully corrected %d bit errors per subpage\n",
+=09=09=09errs_per_subpage);
+
+=09=09for (i =3D 0; i < subcount; i++) {
+=09=09=09err =3D insert_biterror(i * subsize);
+=09=09=09if (err < 0)
+=09=09=09=09goto exit;
+=09=09}
+=09=09errs_per_subpage++;
+=09}
+
+exit:
+=09return err;
+}
+
+
+/* Writes 'random' data to page and then re-writes that same data repeate=
dly.
+   This eventually develops bit errors (bits written as '1' will slowly b=
ecome
+   '0'), which are corrected as far as the ECC is capable of. */
+static int overwrite_test(void)
+{
+=09int err =3D 0;
+=09unsigned i;
+=09unsigned max_corrected =3D 0;
+=09unsigned opno =3D 0;
+=09/* We don't expect more than this many correctable bit errors per
+=09 * page. */
+=09#define MAXBITS 512
+=09static unsigned bitstats[MAXBITS]; /* bit error histogram. */
+
+=09memset(bitstats, 0, sizeof(bitstats));
+
+=09msg("overwrite biterrors test\n");
+
+=09for (i =3D 0; i < mtd->writesize; i++)
+=09=09wbuffer[i] =3D hash(i+seed);
+
+=09err =3D write_page(1);
+=09if (err)
+=09=09goto exit;
+
+=09while (opno < max_overwrite) {
+
+=09=09err =3D rewrite_page(0);
+=09=09if (err)
+=09=09=09break;
+
+=09=09err =3D read_page(0);
+=09=09if (err >=3D 0) {
+=09=09=09if (err >=3D MAXBITS) {
+=09=09=09=09msg("Implausible number of bit errors corrected\n");
+=09=09=09=09err =3D -EIO;
+=09=09=09=09break;
+=09=09=09}
+=09=09=09bitstats[err]++;
+=09=09=09if (err > max_corrected) {
+=09=09=09=09max_corrected =3D err;
+=09=09=09=09msg("Read reported %d corrected bit errors\n",
+=09=09=09=09=09err);
+=09=09=09}
+=09=09} else { /* err < 0 */
+=09=09=09msg("Read reported error %d\n", err);
+=09=09=09err =3D 0;
+=09=09=09break;
+=09=09}
+
+=09=09err =3D verify_page(0);
+=09=09if (err) {
+=09=09=09bitstats[max_corrected] =3D opno;
+=09=09=09msg("ECC failure, read data is incorrect despite read success\n"=
);
+=09=09=09break;
+=09=09}
+
+=09=09opno++;
+=09}
+
+=09/* At this point bitstats[0] contains the number of ops with no bit
+=09 * errors, bitstats[1] the number of ops with 1 bit error, etc. */
+=09msg("Bit error histogram (%d operations total):\n", opno);
+=09for (i =3D 0; i < max_corrected; i++)
+=09=09msg("Page reads with %3d corrected bit errors: %d\n",
+=09=09=09i, bitstats[i]);
+
+exit:
+=09return err;
+}
+
+static int __init mtd_nandbiterrs_init(void)
+{
+=09int err =3D 0;
+
+=09msg("\n");
+=09msg("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
+=09msg("MTD device: %d\n", dev);
+
+=09mtd =3D get_mtd_device(NULL, dev);
+=09if (IS_ERR(mtd)) {
+=09=09err =3D PTR_ERR(mtd);
+=09=09msg("error: cannot get MTD device\n");
+=09=09goto exit_mtddev;
+=09}
+
+=09if (mtd->type !=3D MTD_NANDFLASH) {
+=09=09msg("this test requires NAND flash\n");
+=09=09err =3D -ENODEV;
+=09=09goto exit_nand;
+=09}
+
+=09msg("MTD device size %llu, eraseblock=3D%u, page=3D%u, oob=3D%u\n",
+=09=09(unsigned long long)mtd->size, mtd->erasesize,
+=09=09mtd->writesize, mtd->oobsize);
+
+=09subsize  =3D mtd->writesize >> mtd->subpage_sft;
+=09subcount =3D mtd->writesize / subsize;
+
+=09msg("Device uses %d subpages of %d bytes\n", subcount, subsize);
+
+=09offset     =3D page_offset * mtd->writesize;
+=09eraseblock =3D mtd_div_by_eb(offset, mtd);
+
+=09msg("Using page=3D%u, offset=3D%llu, eraseblock=3D%u\n",
+=09=09page_offset, offset, eraseblock);
+
+=09wbuffer =3D kmalloc(mtd->writesize, GFP_KERNEL);
+=09if (!wbuffer) {
+=09=09err =3D -ENOMEM;
+=09=09goto exit_wbuffer;
+=09}
+
+=09rbuffer =3D kmalloc(mtd->writesize, GFP_KERNEL);
+=09if (!rbuffer) {
+=09=09err =3D -ENOMEM;
+=09=09goto exit_rbuffer;
+=09}
+
+=09err =3D erase_block();
+=09if (err)
+=09=09goto exit_error;
+
+=09if (mode =3D=3D 0)
+=09=09err =3D incremental_errors_test();
+=09else
+=09=09err =3D overwrite_test();
+
+=09if (err)
+=09=09goto exit_error;
+
+=09/* We leave the block un-erased in case of test failure. */
+=09err =3D erase_block();
+=09if (err)
+=09=09goto exit_error;
+
+=09err =3D -EIO;
+=09msg("finished successfully.\n");
+=09msg("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
+
+exit_error:
+=09kfree(rbuffer);
+exit_rbuffer:
+=09kfree(wbuffer);
+exit_wbuffer:
+=09/* Nothing */
+exit_nand:
+=09put_mtd_device(mtd);
+exit_mtddev:
+=09return err;
+}
+
+static void __exit mtd_nandbiterrs_exit(void)
+{
+=09return;
+}
+
+module_init(mtd_nandbiterrs_init);
+module_exit(mtd_nandbiterrs_exit);
+
+MODULE_DESCRIPTION("NAND bit error recovery test");
+MODULE_AUTHOR("Iwo Mergler");
+MODULE_LICENSE("GPL");
--=20
1.7.4.4


______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
