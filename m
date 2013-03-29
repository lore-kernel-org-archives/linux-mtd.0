Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ULTeS-0002uh-MV
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2013 07:23:06 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Josh Cartwright <josh.cartwright@ni.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: UBI(FS) issues: how to debug?
Date: Fri, 29 Mar 2013 07:22:57 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9A5A22@DBDE01.ent.ti.com>
References: <20130328185355.GD24548@beefymiracle.amer.corp.natinst.com>
In-Reply-To: <20130328185355.GD24548@beefymiracle.amer.corp.natinst.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20
> My questions are:
>    - Where should we go from here?  Are there tools we're missing that
>      might help us stress UBIFS/UBI/the NAND controller driver/the NAND

[Pekon]: Following are my feedbacks..
Firstly you should identify whether it's a device issue or a buggy driver/
You should not see too many uncorrectable errors, unless your device
has really worn out, because UBIFS does scrubbing in back-ground to
prevent accumulation of bit-flips.
/scrubbing in linux-mtd.infradead.org/doc/ubidesign/ubidesign.pdf

 (1) Please mount UBIFS using 'chk_data_crc' option
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming
This would flag errors as soon as any bit-flip is observed in data portion
of LEB as soon as it is read.

(2) run 'nand bad' command from UBOOT#  to check for bad-blocks.=20

(3) However, best way is to debug via adding prints to generic=20
NAND driver. I use following sample code generally:
--------------
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5138b6b..2be9eb9 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1578,6 +1578,8 @@ static int nand_read(struct mtd_info *mtd, loff_t fro=
m, size_t len,
 {
        struct mtd_oob_ops ops;
        int ret;
+       int corrected   =3D mtd->ecc_stats.corrected;
+       int failed      =3D mtd->ecc_stats.failed;

        nand_get_device(mtd, FL_READING);
        ops.len =3D len;
@@ -1587,6 +1589,15 @@ static int nand_read(struct mtd_info *mtd, loff_t fr=
om, size_t len,
        ret =3D nand_do_read_ops(mtd, from, &ops);
        *retlen =3D ops.retlen;
        nand_release_device(mtd);
+
+       if (corrected !=3D mtd->ecc_stats.corrected)
+               printk(KERN_EMERG "%s: bit-flip corrected %d", __func__,
+                                               mtd->ecc_stats.corrected);
+
+       if (failed !=3D mtd->ecc_stats.failed)
+               printk(KERN_EMERG "%s: bit-flip failed %d", __func__,
+                                               mtd->ecc_stats.failed);
+
        return ret;
 }
--------------

with regards, pekon
