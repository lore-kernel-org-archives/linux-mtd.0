Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2B3C83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:16:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B59206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LHrstwp+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B59206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPINUkU2wE3uw/HljBPS0Q2G25EwzOkxgnnBwUTx8kQ=; b=LHrstwp+v7vGW9
	ao8uhV8F1gL/MlePmo6eMcyFPExQBMsxdds4gHZVF4TojQ5MmIfLJ6PrfdJ7RQgJJs6XVU0CrV+9M
	6XgrQTPPsB5YgmKeMNIeCf6HzJrZUU0gdi3u89JhMXxSyrj9XmKwRFkWvgnHzNI+gqICKLIHyV59J
	tkmTuCuPX5xxzXf7HZopgT1eMsSY59ITUCDmgqyFiuU8ITU8ODyB4qGPfWQUIJqs9NvjdJFivAnHx
	uqIq2NRIBsjpHA23NAgvDArXa6USwLgH8I3Rro7adAnS5FidFmGKgDz/t5y9LtF7h/J7dcWx09RNk
	cXV8Au9RfbES6GaMRpDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTpNO-0005nT-9Q; Wed, 29 Apr 2020 16:15:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTpNL-0005m1-8X
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 16:15:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 41D9D2A227B;
 Wed, 29 Apr 2020 17:15:53 +0100 (BST)
Date: Wed, 29 Apr 2020 18:15:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 10/11] mtd: rawnand: Allow controllers to overload
 soft ECC hooks
Message-ID: <20200429181550.40425ada@collabora.com>
In-Reply-To: <20200429155540.22048-11-miquel.raynal@bootlin.com>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
 <20200429155540.22048-11-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_091555_435516_1822D642 
X-CRM114-Status: GOOD (  15.01  )
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

On Wed, 29 Apr 2020 17:55:39 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Some controller drivers do not support executing regular
> nand_read/write_page_raw() helpers. For that, we created
> nand_monolithic_read/write_page_raw() alternatives. Let's now allow
> the driver to overload the ECC ->read/write_page_raw() hooks.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 2e525cb5a4e4..b265bdd38265 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5206,8 +5206,10 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
>  		ecc->read_page = nand_read_page_swecc;
>  		ecc->read_subpage = nand_read_subpage;
>  		ecc->write_page = nand_write_page_swecc;
> -		ecc->read_page_raw = nand_read_page_raw;
> -		ecc->write_page_raw = nand_write_page_raw;
> +		if (!ecc->read_page_raw)
> +			ecc->read_page_raw = nand_read_page_raw;
> +		if (!ecc->write_page_raw)
> +			ecc->write_page_raw = nand_write_page_raw;
>  		ecc->read_oob = nand_read_oob_std;
>  		ecc->write_oob = nand_write_oob_std;
>  		if (!ecc->size)
> @@ -5229,8 +5231,10 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
>  		ecc->read_page = nand_read_page_swecc;
>  		ecc->read_subpage = nand_read_subpage;
>  		ecc->write_page = nand_write_page_swecc;
> -		ecc->read_page_raw = nand_read_page_raw;
> -		ecc->write_page_raw = nand_write_page_raw;
> +		if (!ecc->read_page_raw)
> +			ecc->read_page_raw = nand_read_page_raw;
> +		if (!ecc->write_page_raw)
> +			ecc->write_page_raw = nand_write_page_raw;
>  		ecc->read_oob = nand_read_oob_std;
>  		ecc->write_oob = nand_write_oob_std;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
