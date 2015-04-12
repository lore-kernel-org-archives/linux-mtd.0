Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhQOs-0002Su-EK
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 22:30:47 +0000
Received: by wgso17 with SMTP id o17so63626789wgs.1
 for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2015 15:30:22 -0700 (PDT)
Sender: Tomas Hlavacek <tmshlvck@gmail.com>
From: Tomas Hlavacek <tomas.hlavacek@nic.cz>
To: <linux-mtd@lists.infradead.org>
Subject: Re: Missing support for
 =?iso-8859-1?Q?ECC=5FSOFT=5FBCH_in_fsl-elbc-nand?=
Date: Mon, 13 Apr 2015 00:30:12 +0200
MIME-Version: 1.0
Message-ID: <5a117ed2-8cb4-4f55-9098-ff622066db4e@nic.cz>
In-Reply-To: <55156575.8080704@nic.cz>
References: <55156575.8080704@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: scottwood@freescale.com,
 =?utf-8?B?TWFydGluIFN0cmJhxI1rYQ==?= <martin.strbacka@nic.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Friday, March 27, 2015 3:13:09 PM CEST, Martin Strba=C4=8Dka wrote:
> in our product we have Freescale P2020 SoC together with Micron
> MT29F2G08ABAEAWP NAND. Lately we discovered that the internal driver
> (fsl-elbc-nand) supports only 1-bit HW ECC.

Actually we use the NAND pretty intensively with JFFS2 and we have seen=20
some uncorrectable multiple bitflips with the current HW ECC mode (it means=20=

more than one bit flip in 512B subpage, if I got that right). So we would=20
like to change to software BCH ECC since we have powerful enough CPU.

I would like to discuss two major questions before I submit a patch for=20
this:

1) How to disable HW ECC?

What I have done is this:

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c=20
b/drivers/mtd/nand/fsl_elbc_nand.c
index 04b22fd..e5818ba 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c

@@ -676,6 +691,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info=20
*mtd)
        } else if (mtd->writesize =3D=3D 2048) {
                priv->page_size =3D 1;
                setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
+#ifndef ELBC_ECC_SW_BCH
                /* adjust ecc setup if needed */
                if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) =3D=3D
                    BR_DECC_CHK_GEN) {
@@ -684,6 +700,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info=20
*mtd)
                                           &fsl_elbc_oob_lp_eccm1 :
                                           &fsl_elbc_oob_lp_eccm0;
                }
+#endif
        } else {
                dev_err(priv->dev,
                        "fsl_elbc_init: page size %d is not supported\n",
@@ -774,11 +791,18 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd=20
*priv)
=20
        chip->ecc.read_page =3D fsl_elbc_read_page;
        chip->ecc.write_page =3D fsl_elbc_write_page;
-       chip->ecc.write_subpage =3D fsl_elbc_write_subpage;
=20
+#ifdef ELBC_ECC_SW_BCH
+      =20
out_be32(&lbc->bank[priv->bank].br,(in_be32(&lbc->bank[priv->bank].br) &=20
(~BR_DECC)));
+       chip->ecc.mode =3D NAND_ECC_SOFT_BCH;
+       chip->ecc.size =3D 512;
+       chip->ecc.bytes =3D 13;
+       chip->ecc.strength =3D 8;
+#else
        /* If CS Base Register selects full hardware ECC then use it */
        if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) =3D=3D
            BR_DECC_CHK_GEN) {
+               chip->ecc.write_subpage =3D fsl_elbc_write_subpage;
                chip->ecc.mode =3D NAND_ECC_HW;
                /* put in small page settings and adjust later if needed */
                chip->ecc.layout =3D (priv->fmr & FMR_ECCM) ?
@@ -790,6 +814,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd=20
*priv)
                /* otherwise fall back to default software ECC */
                chip->ecc.mode =3D NAND_ECC_SOFT;
        }
+#endif
=20
        return 0;
 }


It works but I am particularly not sure of line

out_be32(&lbc->bank[priv->bank].br,(in_be32(&lbc->bank[priv->bank].br) &=20
(~BR_DECC)));

Does it make sense? I have been told that on our board there is some=20
unconnected pin that causes that (in_be32(&lbc->bank[priv->bank].br) &=20
BR_DECC) =3D=3D BR_DECC_CHK_GEN is true but I still have to disable HW ECC.

Does it make sense to add Kconf switch "force SW ECC" which would define=20
my ELBC_ECC_SW_BCH?

I would like to point out that the shuffling chip->ecc.write_subpage =3D=20
fsl_elbc_write_subpage; line is needed for subpages to work properly with=20
SW ECC because the write_subpage pointer in elbc_fcm_ctrl is left intact=20
when SW ECC is being initialized and then the ECC does not work for=20
subpages. Not setting it causes that default write_subpage function is=20
used.


2) We need to implement RNDOUT operation for SW ECC / ECC_BCH. My attempt=20
follows:

@@ -335,6 +335,21 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd,=20
unsigned int command,
                fsl_elbc_run_command(mtd);
                return;
=20
+       /* !!! Experimental */
+       case NAND_CMD_RNDOUT:
+               dev_vdbg(priv->dev,
+                       "fsl_elbc_cmdfunc: NAND_CMD_RNDOUT, "
+                       "column: 0x%x.\n", column);
+
+               if ((column < 512) || (priv->page_size && (column < 2048)))=20=

{
+                       elbc_fcm_ctrl->index =3D column;
+                       return;
+               } else {
+                       column -=3D priv->page_size ? 2048 : 512;
+                       page_addr =3D elbc_fcm_ctrl->page;
+                       /* and fall-through to READOOB */
+               }
+
        /* READOOB reads only the OOB because no ECC is performed. */
        case NAND_CMD_READOOB:
                dev_vdbg(priv->dev,

Maybe it is too complicated (?) and it would be sufficient to set=20
elbc_fcm_ctrl->index =3D column both for IB and OOB data? It seems that both=20=

ways work for me.

Cheers,
Tomas
