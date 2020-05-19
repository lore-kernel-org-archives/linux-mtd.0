Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76519C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 08:39:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47AEA204EA
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 08:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IJ6JQXDE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47AEA204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuF3Xne52tYwnrk+Tn8S5w7nHUcMMns7Y/66oaak6qY=; b=IJ6JQXDEbfLxxI
	aYylFEOowScxUoPbba93pAoTPrw3aQA7+1HPbKmGbbiEbD/OoZYoreaV/m+7SOpz3JkkZXqXAskBB
	4VRHzSmTY1+HbDPiWaXiTnQXvDeZeW+TblVuJEJbEaBOIL3T3OgzZGPXFOqoduFPqAqB/YlQd/piA
	ROONjF4P5jw2kMvJAiTsJVs+B3HvcX7/+kFOCrEX26JQ+WCGceEARjNog97Y6ZD6/NMPC9Itx3JGa
	KXhj6FXijRu6H6y503KLf4Bs369PGnrxHR3alba4ZuDjEkrB4J52hrlMdttBWUjfX9viLtB5YQHGE
	NyRDiFWiup495zIAYIzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaxmb-0001mq-Tr; Tue, 19 May 2020 08:39:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaxmY-0001mB-LS
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 08:39:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CC9A72A06EC;
 Tue, 19 May 2020 09:39:24 +0100 (BST)
Date: Tue, 19 May 2020 10:39:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: micron: Adapt the PAGE READ flow to
 constraint controllers
Message-ID: <20200519103919.50f4417e@collabora.com>
In-Reply-To: <20200519074639.23777-1-miquel.raynal@bootlin.com>
References: <20200519074639.23777-1-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_013926_830930_E974D787 
X-CRM114-Status: GOOD (  26.70  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 19 May 2020 09:46:39 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There are controllers not able to just read data cycles on the
> bus. There are controllers not able to do a change column.
> 
> If we want to support both, we need to check which operation is
> supported first. This is the exact same mechanism that is in use for
> parameter page reads (ONFI/JEDEC) as the same problem occurs.
> 
> Speed testing does not show any throughput penalty so we do not
> optimize more than that. However it is likely that, in the future, a
> more robust and exhaustive test will run at boot time to avoid
> re-checking what is supported and what is not at every call.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

This looks good to me, just one thing to address below and you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_micron.c | 44 ++++++++++++++++++++++++------
>  1 file changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index b2b047b245f4..bbd0ffbae19a 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -192,6 +192,7 @@ static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status,
>  	struct micron_nand *micron = nand_get_manufacturer_data(chip);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	unsigned int step, max_bitflips = 0;
> +	bool use_datain = false;
>  	int ret;
>  
>  	if (!(status & NAND_ECC_STATUS_WRITE_RECOMMENDED)) {
> @@ -211,8 +212,18 @@ static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status,
>  	 * in non-raw mode, even if the user did not request those bytes.
>  	 */
>  	if (!oob_required) {
> -		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
> -					false, false);

Can we add a comment explaining what we're doing here (basically a
condensed version of the commit message).

> +		if (!nand_has_exec_op(chip) ||
> +		    !nand_read_data_op(chip, chip->oob_poi, mtd->oobsize, false,
> +				       true))
> +			use_datain = true;
> +
> +		if (use_datain)
> +			ret = nand_read_data_op(chip, chip->oob_poi,
> +						mtd->oobsize, false, false);
> +		else
> +			ret = nand_change_read_column_op(chip, mtd->writesize,
> +							 chip->oob_poi,
> +							 mtd->oobsize, false);
>  		if (ret)
>  			return ret;
>  	}
> @@ -285,6 +296,7 @@ micron_nand_read_page_on_die_ecc(struct nand_chip *chip, uint8_t *buf,
>  				 int oob_required, int page)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> +	bool use_datain = false;
>  	u8 status;
>  	int ret, max_bitflips = 0;
>  
> @@ -300,14 +312,28 @@ micron_nand_read_page_on_die_ecc(struct nand_chip *chip, uint8_t *buf,
>  	if (ret)
>  		goto out;
>  
> -	ret = nand_exit_status_op(chip);
> -	if (ret)
> -		goto out;

Same here.

> +	if (!nand_has_exec_op(chip) ||
> +	    !nand_read_data_op(chip, buf, mtd->writesize, false, true))
> +		use_datain = true;
>  
> -	ret = nand_read_data_op(chip, buf, mtd->writesize, false, false);
> -	if (!ret && oob_required)
> -		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
> -					false, false);
> +	if (use_datain) {
> +		ret = nand_exit_status_op(chip);
> +		if (ret)
> +			goto out;
> +
> +		ret = nand_read_data_op(chip, buf, mtd->writesize, false,
> +					false);
> +		if (!ret && oob_required)
> +			ret = nand_read_data_op(chip, chip->oob_poi,
> +						mtd->oobsize, false, false);
> +	} else {
> +		ret = nand_change_read_column_op(chip, 0, buf, mtd->writesize,
> +						 false);
> +		if (!ret && oob_required)
> +			ret = nand_change_read_column_op(chip, mtd->writesize,
> +							 chip->oob_poi,
> +							 mtd->oobsize, false);
> +	}
>  
>  	if (chip->ecc.strength == 4)
>  		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
