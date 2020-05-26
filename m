Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3313C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6A720707
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwHmy899"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6A720707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hd/JUn4HMem5Hodb+DmyTvsj8FjNUvuy2997mxqIDho=; b=VwHmy899u7ahM+
	FKpW6ybAvyxnt55cD9CHlqWWb3S1W50o9G3zTluJcZAQhrEneuaf2w2HLsdgtD6MzvSiYPtp0eEUZ
	P66qDL1QiLaBNcMDIgfHI5jYEI0HHW7kBy0KR5UTVX5fEQbhIxxn1fnbFyb0+ySS8w5mjtqnijaUn
	pPBuaiD6x4HFtfJ0p+B7YuOLKhde90sgTKs51iXP8c1+CQF/FJofal+E92+In+dd++AlQ0WSjAKEN
	NTPz8ScQ+zj5WoiDmZREOeq3wjk3sZFAMboaWTjzP7ZTEo/gPa5HGLU0wZbPJ3z85M6aDwRXReIL1
	XirG2iED/faynTgrFvMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdhXG-0007sh-Ib; Tue, 26 May 2020 21:54:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdhXE-0007pi-C2
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 21:54:57 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BD9A32A22AA;
 Tue, 26 May 2020 22:54:54 +0100 (BST)
Date: Tue, 26 May 2020 23:54:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 23/28] mtd: rawnand: toshiba: Implement
 ->choose_data_interface() for TC58TEG5DCLTA00
Message-ID: <20200526235452.761377bb@collabora.com>
In-Reply-To: <20200526191725.7591-24-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-24-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_145456_547895_EB4FE9AA 
X-CRM114-Status: GOOD (  16.05  )
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

On Tue, 26 May 2020 21:17:20 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Implement this hook for the tc58teg5dclta00 NAND chip and stop setting
> ->default_timing_mode.  
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_toshiba.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
> index 302d4a6e175b..fe2bc20972a9 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -193,11 +193,24 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
>  	}
>  }
>  
> +static int
> +tc58teg5dclta00_choose_data_interface(struct nand_chip *chip,
> +				      struct nand_data_interface *iface)
> +{
> +	int ret;
> +
> +	ret = onfi_fill_data_interface(chip, iface, NAND_SDR_IFACE, 5);
> +	if (ret)
> +		return ret;
> +
> +	return nand_choose_best_sdr_timings(chip, iface, NULL);
> +}
> +
>  static int tc58teg5dclta00_init(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  
> -	chip->onfi_timing_mode_default = 5;
> +	chip->ops.choose_data_interface = &tc58teg5dclta00_choose_data_interface;
>  	chip->options |= NAND_NEED_SCRAMBLING;
>  	mtd_set_pairing_scheme(mtd, &dist3_pairing_scheme);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
