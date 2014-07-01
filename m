Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1vMr-0006wv-I3
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 10:32:54 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v3 0/3] mtd: Add sysfs entries and account BBT blocks
 properly
Date: Tue, 1 Jul 2014 10:32:23 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF8995@DBDE04.ent.ti.com>
References: <1403618152-4515-1-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1403618152-4515-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
>
>Here's a new round of the patchset to add sysfs entries for the ECC stats
>struct fields. See the discussion around previous version for context:
>
>http://lists.infradead.org/pipermail/linux-mtd/2014-March/052804.html
>
>Changes from v2:
>
>  * As suggested by Pekon Gupta, use "ecc_failures" instead of
>    "uncorrectable_errors".
>
>  * Added documentation for the new sysfs ABI as requested by Greg KH.
>
>Changes from v1:
>
>  * As agreed I've added a sysfs file per field to replace the ecc_stats
>    sysfs file. The current proposal follows the "one file per value" sysf=
s
>    rule, adding the following device attributes:
>    - corrected_bits (ecc_stats.corrected)
>    - uncorrectable_errors (ecc_stats.failed)
>    - bad_blocks (ecc_stats.badblocks)
>    - bbt_blocks (ecc_stats.bbtblocks)
>
>  * Following Brian's request, added small wrapper nand_block_isreserved()
>    that checks if the NAND has a bad block table before querying the numb=
er
>    of reserved blocks.
>
>  * Finally, this new series drops patch: "nand: Account the blocks used b=
y
>    the BBT in the ecc_stats". It's not yet clear how to best deal with th=
e
>    current inconsistencies in MTD master and partition handling.
>
>The first patch adds the sysfs entries. The rest of the patches fixes the
>bbtblock accounting and allows to keep track of the reserved blocks correc=
tly.
>
>This is a very old issue, probably around since the dawn of time,
>and nobody seemed to care much about it. However, with the introduction of
>the sysfs access, it's easier to access this stats and easier to
>see the issue.
>
>Ezequiel Garcia (3):
>  mtd: Add sysfs attributes to expose the ECC stats fields
>  mtd: Introduce mtd_block_isreserved()
>  mtd: Account for BBT blocks when a partition is being allocated
>
> Documentation/ABI/testing/sysfs-class-mtd | 38 ++++++++++++++++++++
> drivers/mtd/mtdcore.c                     | 59 ++++++++++++++++++++++++++=
+++--
> drivers/mtd/mtdpart.c                     | 13 ++++++-
> drivers/mtd/nand/nand_base.c              | 18 ++++++++++
> drivers/mtd/nand/nand_bbt.c               | 14 ++++++++
> include/linux/mtd/mtd.h                   |  2 ++
> include/linux/mtd/nand.h                  |  1 +
> 7 files changed, 142 insertions(+), 3 deletions(-)
>
>--
>1.9.1

- Thanks Ezequiel, This will be helpful for NAND Flash users while debuggin=
g issues,
   And checking NAND flash quality (bit-flips numbers) during production.
- Tested on Beaglebone-Black using 4K NAND cape..
- Needed following fix in OMAP NAND driver to enable BBT creation and scann=
ing.
-------------=20
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f0ed92e..2ad7451 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1663,7 +1663,7 @@ static int omap_nand_probe(struct platform_device *pd=
ev)
        mtd->owner              =3D THIS_MODULE;
        nand_chip               =3D &info->nand;
        nand_chip->ecc.priv     =3D NULL;
-       nand_chip->options      |=3D NAND_SKIP_BBTSCAN;
+       nand_chip->bbt_options  |=3D NAND_BBT_USE_FLASH;

        res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
        nand_chip->IO_ADDR_R =3D devm_ioremap_resource(&pdev->dev, res);
-------------=20

So for whole series
Tested-by: Pekon Gupta <pekon@ti.com>


with regards, pekon
