Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhLRr-00033m-2s
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 16:08:59 +0000
Received: by mail-ig0-f169.google.com with SMTP id hl10so1572855igb.4
 for <linux-mtd@lists.infradead.org>; Mon, 05 May 2014 09:08:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACA532@DBDE04.ent.ti.com>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D46@DBDE04.ent.ti.com>
 <CAGXE3d8H=y3LeW54kwZg04-Edm-KkNbqXLCduNuPfAOrLymO+A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D89@DBDE04.ent.ti.com>
 <1397086473.20280.33.camel@snotra.buserror.net>
 <5dc1853e-694c-4add-bd62-e0c2a66f4c95@email.android.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC2146@DBDE04.ent.ti.com>
 <CAGXE3d8892D5JjFvs0Yxz6bpMciudq_95zeaKogYQqi2yMV7Pg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC2697@DBDE04.ent.ti.com>
 <1397247023.20280.144.camel@snotra.buserror.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAC2C82@DBDE04.ent.ti.com>
 <951d14ea-6f8c-420a-8ddc-019a47965717@email.android.com>
 <20980858CB6D3A4BAE95CA194937D5E73EACA532@DBDE04.ent.ti.com>
Date: Mon, 5 May 2014 18:08:37 +0200
Message-ID: <CAGXE3d-g3ACtY0GK2hbSEtBs2LOLzxKmbbTgWJSf7f9GuBk8Tw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
From: Helmut Schaa <helmut.schaa@googlemail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: Scott Wood <scottwood@freescale.com>,
 "Huang Shijie \(b32955@freescale.com\)" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Mon, May 5, 2014 at 10:46 AM, Gupta, Pekon <pekon@ti.com> wrote:
> Any update on below patch? Does this maintain compatibility to
> existing UBIFS images ?

Patch works fine with a VID header offset of 512 and without the crash :)

Feel free to add my

Reported-by: Helmut Schaa <helmut.schaa@googlemail>
Tested-by: Helmut Schaa <helmut.schaa@googlemail>

when sending the patch.

Thanks,
Helmut

> with regards, Pekon
>
>
>
>>>------------------------------------
>>>diff --git a/drivers/mtd/nand/fsl_elbc_nand.c
>>>b/drivers/mtd/nand/fsl_elbc_nand.c
>>>index a21252c..cc79ce4 100644
>>>--- a/drivers/mtd/nand/fsl_elbc_nand.c
>>>+++ b/drivers/mtd/nand/fsl_elbc_nand.c
>>>@@ -723,6 +723,19 @@ static int fsl_elbc_write_page(struct
>>mtd_info
>>>*mtd, struct nand_chip *chip,
>>>        return 0;
>>> }
>>>
>>>+/* ECC will be calculated automatically, and errors will be detected
>>>in
>>>+ * waitfunc.
>>>+ */
>>>+static int fsl_elbc_write_subpage(struct mtd_info *mtd, struct
>>>nand_chip *chip,
>>>+                               uint32_t offset, uint32_t data_len,
>>>+                               const uint8_t *buf, int oob_required)
>>>+{
>>>+       fsl_elbc_write_buf(mtd, buf, mtd->writesize);
>>>+       fsl_elbc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
>>>+
>>>+       return 0;
>>>+}
>>>+
>>> static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>>> {
>>>        struct fsl_lbc_ctrl *ctrl = priv->ctrl;
>>>@@ -762,6 +775,7 @@ static int fsl_elbc_chip_init(struct
>>fsl_elbc_mtd
>>>*priv)
>>>
>>>        chip->ecc.read_page = fsl_elbc_read_page;
>>>        chip->ecc.write_page = fsl_elbc_write_page;
>>>+       chip->ecc.write_subpage = fsl_elbc_write_subpage;
>>>
>>>        /* If CS Base Register selects full hardware ECC then use it */
>>>        if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
>>>
>>>------------------------------------
