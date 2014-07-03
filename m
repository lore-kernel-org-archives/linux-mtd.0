Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2bfS-0006IW-CQ
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 07:42:55 +0000
Received: by mail-la0-f50.google.com with SMTP id pv20so7921808lab.9
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jul 2014 00:42:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1401745115-7449-1-git-send-email-andrea.adami@gmail.com>
References: <1401745115-7449-1-git-send-email-andrea.adami@gmail.com>
Date: Thu, 3 Jul 2014 09:42:31 +0200
Message-ID: <CAAQYJAuD1DHnycrhmh72WGg54ZaHDrVoXseVfFWXgfttrPdH=Q@mail.gmail.com>
Subject: Fwd: [RESEND PATCH] mtd: cfi_cmdset_0001.c: add support for Sharp
 LH28F640BF NOR
From: Andrea Adami <andrea.adami@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this one was part of a patchset composed of 3 patches, see
https://lkml.org/lkml/2014/6/3/763

The other two have been merged in 3.16-rc3:
9218310  ARM: 8084/1: sa1100: collie: revert back to cfi_probe
3abe742 ARM: 8085/1: sa1100: collie: add top boot mtd partition

Now the actual situation with 3.16-rc3 is bad, the nor is locked at
boot and buffer write is broken.

Ideally the present patch should be sent upstream as fix for the next -rc.

Thanks

Andrea

---------- Forwarded message ----------
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, Jun 2, 2014 at 11:38 PM
Subject: [RESEND PATCH] mtd: cfi_cmdset_0001.c: add support for Sharp
LH28F640BF NOR
To: linux-mtd@lists.infradead.org
Cc: Andrea Adami <andrea.adami@gmail.com>


This family of chips was long ago supported by the pre-cfi driver.
CFI code tested on several Zaurus SL-5500 (Collie) 2x16 on 32 bit bus.

Function is_LH28F640BF() mimics is_m29ew() from cmdset_0002.c

Buffer write fixes as seen in 2007 patch c/o
Anti Sullin <anti.sullin <at> artecdesign.ee>
http://comments.gmane.org/gmane.linux.ports.arm.kernel/36733

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c
index e4ec355..a7543ba 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -52,6 +52,11 @@
 /* Atmel chips */
 #define AT49BV640D     0x02de
 #define AT49BV640DT    0x02db
+/* Sharp chips */
+#define LH28F640BFHE_PTTL90    0x00b0
+#define LH28F640BFHE_PBTL90    0x00b1
+#define LH28F640BFHE_PTTL70A   0x00b2
+#define LH28F640BFHE_PBTL70A   0x00b3

 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t,
size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t,
size_t, size_t *, const u_char *);
@@ -258,6 +263,36 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
                (cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
 };

+static int is_LH28F640BF(struct cfi_private *cfi)
+{
+       /* Sharp LH28F640BF Family */
+       if (cfi->mfr == CFI_MFR_SHARP && (
+           cfi->id == LH28F640BFHE_PTTL90 || cfi->id == LH28F640BFHE_PBTL90 ||
+           cfi->id == LH28F640BFHE_PTTL70A || cfi->id == LH28F640BFHE_PBTL70A))
+               return 1;
+       return 0;
+}
+
+static void fixup_LH28F640BF(struct mtd_info *mtd)
+{
+       struct map_info *map = mtd->priv;
+       struct cfi_private *cfi = map->fldrv_priv;
+       struct cfi_pri_intelext *extp = cfi->cmdset_priv;
+
+       /* Reset the Partition Configuration Register on LH28F640BF
+        * to a single partition (PCR = 0x000): PCR is embedded into A0-A15. */
+       if (is_LH28F640BF(cfi)) {
+               printk(KERN_INFO "Reset Partition Config. Register: 1
Partition of 4 planes\n");
+               map_write(map, CMD(0x60), 0);
+               map_write(map, CMD(0x04), 0);
+
+               /* We have set one single partition thus
+                * Simultaneous Operations are not allowed */
+               printk(KERN_INFO "cfi_cmdset_0001: Simultaneous
Operations disabled\n");
+               extp->FeatureSupport &= ~512;
+       }
+}
+
 static void fixup_use_point(struct mtd_info *mtd)
 {
        struct map_info *map = mtd->priv;
@@ -309,6 +344,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
        { CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
        { CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
        { CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
+       { CFI_MFR_SHARP, CFI_ID_ANY, fixup_unlock_powerup_lock },
+       { CFI_MFR_SHARP, CFI_ID_ANY, fixup_LH28F640BF },
        { 0, 0, NULL }
 };

@@ -1649,6 +1686,12 @@ static int __xipram do_write_buffer(struct
map_info *map, struct flchip *chip,
        initial_adr = adr;
        cmd_adr = adr & ~(wbufsize-1);

+       /* Sharp LH28F640BF chips need the first address for the
+        * Page Buffer Program command. See Table 5 of
+        * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701) */
+       if (is_LH28F640BF(cfi))
+               cmd_adr = adr;
+
        /* Let's determine this according to the interleave only once */
        write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ?
CMD(0xe8) : CMD(0xe9);

--
1.9.1
