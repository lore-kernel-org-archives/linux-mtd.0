Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZaE5-0005ud-DT
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 06:18:42 +0000
Received: by mail-ee0-f54.google.com with SMTP id d49so6150627eek.13
 for <linux-mtd@lists.infradead.org>; Sun, 13 Apr 2014 23:18:16 -0700 (PDT)
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC2C82@DBDE04.ent.ti.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: RE: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
From: Helmut Schaa <helmut.schaa@googlemail.com>
Date: Mon, 14 Apr 2014 08:18:09 +0200
To: "Gupta, Pekon" <pekon@ti.com>,Scott Wood <scottwood@freescale.com>
Message-ID: <951d14ea-6f8c-420a-8ddc-019a47965717@email.android.com>
Cc: "Huang Shijie \(b32955@freescale.com\)" <b32955@freescale.com>,
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



On 14. April 2014 07:55:30 MESZ, "Gupta, Pekon" <pekon@ti.com> wrote:
>>From: Scott Wood [mailto:scottwood@freescale.com]
>>>On Fri, 2014-04-11 at 06:35 +0000, Gupta, Pekon wrote:
>>> As per [1] and [2], If the subpage is _not_ supported then
>VID-header offset
>>> should be aligned to  PAGE_SIZE boundary. And it has implications on
>LEB size
>>> calculation too. I don't know how it was working earlier but if the
>earlier
>>> UBI images were using 512 as VID Header offset even without subpage
>>> Support then it's incorrect configuration.
>>
>>I believe what was happening before was full page writes with only
>>subpage content (the rest left at 0xff).
>>
>Yes, that is possible, sorry I missed that nand_do_write_ops() does
>0xff padding
>for non-page aligned writes. In that case replicating
>fsl_elbc_write_page() for
>chip->ecc.write_subpage should also work and maintain backward
>compatibility.
>
>(not compile tested)

JFI, I'm in vacation till next week and don't have access to the affected system. Will do a test once I'm back.
Helmut

>------------------------------------
>diff --git a/drivers/mtd/nand/fsl_elbc_nand.c
>b/drivers/mtd/nand/fsl_elbc_nand.c
>index a21252c..cc79ce4 100644
>--- a/drivers/mtd/nand/fsl_elbc_nand.c
>+++ b/drivers/mtd/nand/fsl_elbc_nand.c
>@@ -723,6 +723,19 @@ static int fsl_elbc_write_page(struct mtd_info
>*mtd, struct nand_chip *chip,
>        return 0;
> }
>
>+/* ECC will be calculated automatically, and errors will be detected
>in
>+ * waitfunc.
>+ */
>+static int fsl_elbc_write_subpage(struct mtd_info *mtd, struct
>nand_chip *chip,
>+                               uint32_t offset, uint32_t data_len,
>+                               const uint8_t *buf, int oob_required)
>+{
>+       fsl_elbc_write_buf(mtd, buf, mtd->writesize);
>+       fsl_elbc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
>+
>+       return 0;
>+}
>+
> static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
> {
>        struct fsl_lbc_ctrl *ctrl = priv->ctrl;
>@@ -762,6 +775,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd
>*priv)
>
>        chip->ecc.read_page = fsl_elbc_read_page;
>        chip->ecc.write_page = fsl_elbc_write_page;
>+       chip->ecc.write_subpage = fsl_elbc_write_subpage;
>
>        /* If CS Base Register selects full hardware ECC then use it */
>        if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
>
>------------------------------------
>
>with regards, pekon

-- 
Diese Nachricht wurde von meinem Android-Mobiltelefon mit K-9 Mail gesendet.
