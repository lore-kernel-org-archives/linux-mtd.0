Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7626DC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 22:06:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B70208DB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 22:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SI0F51l0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B70208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnvHA31eXAwhfYTA85q1ytgOlqC7sY2sYZCRsonnEiw=; b=SI0F51l0whmx+j
	7C/1m+FDm/g+krOWKg7orrRyfaCiPasK1CVCJ6ImUNK87ugd5JKkvOCw2iEOdLkmeN/s885OyOZnz
	LliGfoPX/RVYbXm6vt07tNycABfHw5qqW2304T1Cc6OZWRWIIovHe2YNN2HbLuU48EoKb1RKCMkW1
	ctVbOv8G4jdhDJgWxCLZ0EQgRolLCugAGQ/EqsWX+41oGhaIo7gOFZmwRuChnQSJRSTYdfrjRvMGz
	p8c5YFPKNtbS+I4C/5wBAqHRcKwEG0mEpBVpfJb1lbip+nz0b+1TlQqv5mUMraDhiBEBby0nzMkLA
	d6EzE31oC6yySxiddFlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdhi9-0008G1-TL; Tue, 26 May 2020 22:06:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdhi6-0008FE-Mt
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 22:06:12 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 47BA4261217;
 Tue, 26 May 2020 23:06:09 +0100 (BST)
Date: Wed, 27 May 2020 00:06:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 25/28] mtd: rawnand: hynix: Implement
 ->choose_data_interface() for H27UCG8T2ATR-BC
Message-ID: <20200527000606.2c26f977@collabora.com>
In-Reply-To: <20200526191725.7591-26-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-26-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_150610_882912_83812C46 
X-CRM114-Status: GOOD (  18.44  )
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

On Tue, 26 May 2020 21:17:22 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This chip supports ONFI SDR timing mode 4, implement the new hook to
> advertize it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_hynix.c | 16 ++++++++++++++++
>  drivers/mtd/nand/raw/nand_ids.c   |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
> index 7d1be53f27f3..d61a55121962 100644
> --- a/drivers/mtd/nand/raw/nand_hynix.c
> +++ b/drivers/mtd/nand/raw/nand_hynix.c
> @@ -673,6 +673,19 @@ static void hynix_nand_cleanup(struct nand_chip *chip)
>  	nand_set_manufacturer_data(chip, NULL);
>  }
>  
> +static int
> +h27ucg8t2atrbc_choose_data_interface(struct nand_chip *chip,
> +				     struct nand_data_interface *iface)
> +{
> +	int ret;
> +
> +	ret = onfi_fill_data_interface(chip, iface, NAND_SDR_IFACE, 4);
> +	if (ret)
> +		return ret;
> +
> +	return nand_choose_best_sdr_timings(chip, iface, NULL);
> +}
> +
>  static int hynix_nand_init(struct nand_chip *chip)
>  {
>  	struct hynix_nand *hynix;
> @@ -689,6 +702,9 @@ static int hynix_nand_init(struct nand_chip *chip)
>  
>  	nand_set_manufacturer_data(chip, hynix);
>  
> +	if (!strcmp("H27UCG8T2ATR-BC", chip->parameters.model))
> +		chip->ops.choose_data_interface = h27ucg8t2atrbc_choose_data_interface;

Same here. You either have to compare against "H27UCG8T2ATR-BC 64G 3.3V
8-bit" or use strncmp. This being said, I wonder if comparing the ID is
not simpler.

> +
>  	ret = hynix_nand_rr_init(chip);
>  	if (ret)
>  		hynix_nand_cleanup(chip);
> diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
> index c729a8bc895d..3b890d55703d 100644
> --- a/drivers/mtd/nand/raw/nand_ids.c
> +++ b/drivers/mtd/nand/raw/nand_ids.c
> @@ -50,7 +50,7 @@ struct nand_flash_dev nand_flash_ids[] = {
>  	{"H27UCG8T2ATR-BC 64G 3.3V 8-bit",
>  		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
>  		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
> -		  NAND_ECC_INFO(40, SZ_1K), 4 },
> +		  NAND_ECC_INFO(40, SZ_1K) },
>  

Ultimately we should have those vendor specific entries defined in each
vendor driver rather than declared here (not asking that for this
series though).

>  	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
>  	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
