Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B7BC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:26:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A021320870
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBbGAFoT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A021320870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXIRhRPPHy9ORoSdO+0NnmWHpj2g65KXOYNcQQkRBPQ=; b=XBbGAFoTs3X2Jt
	2q4lNe6fTMAL4lYPhcx3XTsRQx5IFQgTIfiL6w2oX9f7J93Afr/YGBN8I5SXPocCgPH4lHUCuemit
	6KeuUDEEzoWj/2EpIoGDOt51qOnhmlx4ifH/hW5QkbEL22A9ajzWXZkhZ3dAJeI4L/oIq7e94ftnJ
	CYQU5pLDlEvBSZEczZBXGMJfF9vQtBzZ5sZ8MENaL+Tli8qr1E8sYt+oH+LHwZtlD0AzQIt/vdGWv
	XW45g9K4lz7nDkgf6epz5dCgNXYOuUzdUFzPFSwS2kYtkpzbpFQxgBrAI7U97ltmaomoDH72S5cp8
	Mq2fQiKzXng7R/dFF59g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdh63-00080i-3u; Tue, 26 May 2020 21:26:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdh60-00080I-7g
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 21:26:49 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 06DCE2A02A3;
 Tue, 26 May 2020 22:26:47 +0100 (BST)
Date: Tue, 26 May 2020 23:26:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 18/28] mtd: rawnand: marvell: Use a helper to access
 the timings
Message-ID: <20200526232644.6c4c8d78@collabora.com>
In-Reply-To: <20200526191725.7591-19-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-19-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_142648_401437_684DE75D 
X-CRM114-Status: GOOD (  15.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 26 May 2020 21:17:15 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Do not access the SDR timings directly but use nand_get_sdr_timings()
> instead. This way, future patching over this helper will be easier.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 260a0430313e..ebf45a2754f1 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -1096,6 +1096,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
>  						const u8 *oob_buf, bool raw,
>  						int page)
>  {
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->data_interface);
>  	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
>  	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
>  	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
> @@ -1140,8 +1141,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
>  	if (ret)
>  		return ret;
>  
> -	ret = marvell_nfc_wait_op(chip,
> -				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> +	ret = marvell_nfc_wait_op(chip, PSEC_TO_MSEC(sdr->tPROG_max));
>  	return ret;
>  }
>  
> @@ -1562,6 +1562,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
>  					     const u8 *buf,
>  					     int oob_required, int page)
>  {
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->data_interface);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
>  	const u8 *data = buf;
> @@ -1598,8 +1599,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
>  		marvell_nfc_wait_ndrun(chip);
>  	}
>  
> -	ret = marvell_nfc_wait_op(chip,
> -				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> +	ret = marvell_nfc_wait_op(chip, PSEC_TO_MSEC(sdr->tPROG_max));
>  
>  	marvell_nfc_disable_hw_ecc(chip);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
