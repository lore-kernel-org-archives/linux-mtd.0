Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F29C25B4F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBRJyK8zz8PTF1ifB0umuOnoDUpRjRjtuL85YQQFDJM=; b=D/GaQmfzR48IDe
	BSVaVS72HjNztwKtpnBgncAv/ohdxotw7lAglDu3U5nO/FF+dhakzllc1mWUP+o++022vhWbxzlx0
	h2PkAOz+87mHaWvKz+KgXfMnr8YTJVaMjbbspcEQlv7CM4v1dgS2x55XHCQh+/P2FSgnj+FpmqoaP
	9ghyX5Sb98F57cj9oZcj7+fgn+Tv+vDjlp7jKEcux8cLhgYq3ay+7Y/PVzhO4Mr3LPc15Q3XIXtOj
	aTccY7+k9xS3jkLHw6cZEm5RtWG2n9O7uj6XbsdsmiY4e5CHetmp7CCsSctisnBi+LysbpsxCK+qd
	S+MOMOnQLQ0sNH50bCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4azy-0000000EHNd-3NAn;
	Wed, 08 May 2024 06:41:54 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4azs-0000000EHMQ-3lp7
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 06:41:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4402C1487F8D;
	Wed,  8 May 2024 08:41:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1715150506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=6OoEksKaoMJMftePwSYkDUWexbh0YId9wFcw5AtRcgY=;
	b=cL+qAbNDUpTEsslUQMeMoGb5X9ObZlmWtegaKd/dqNWbonjS5IFBhPy3ccLsUd5priurt4
	mWabOkzvuXlMUiSpdGeQ8OaH24SlRle4NbsBTw0Vx2PrvNhXUfwYng5KWiAUYuoH6fFr3X
	OvrE1zW0WvoykhTEd+ughSXI5QSqMTFcw5bNaN5XclQZYdOwcHHWj24JV7ZuuBs/39pprp
	VM+lRXlWWzdaBf6UrIPKslP/tIOaXJX+UPTurWL4In5SAoRXupJRt4/lL3Cwyv4/CV7W7N
	i7vS/mt/d8HXYoTAA0zdgDyqpWuVkmfXn+/0Ocdkhfhdte8ZKzYn6MQJd1d5Ww==
Date: Wed, 8 May 2024 08:41:44 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
	Steven Seeger <steven.seeger@flightsystems.net>
Subject: Re: [PATCH 2/2] mtd: rawnand: Bypass a couple of sanity checks
 during NAND identification
Message-ID: <20240508-patient-cover-54085f1981d8@thorsis.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org,
	Steven Seeger <steven.seeger@flightsystems.net>
References: <20240507160546.130255-1-miquel.raynal@bootlin.com>
 <20240507160546.130255-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507160546.130255-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_234149_287118_067B112C 
X-CRM114-Status: GOOD (  21.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miquel,

Am Tue, May 07, 2024 at 06:05:46PM +0200 schrieb Miquel Raynal:
> Early during NAND identification, mtd_info fields have not yet been
> initialized (namely, writesize and oobsize) and thus cannot be used for
> sanity checks yet. Of course if there is a misuse of
> nand_change_read_column_op() so early we won't be warned, but there is
> anyway no actual check to perform at this stage as we do not yet know
> the NAND geometry.
> 
> So, if the fields are empty, especially mtd->writesize which is *always*
> set quite rapidly after identification, let's skip the sanity checks.
> 
> nand_change_read_column_op() is subject to be used early for ONFI/JEDEC
> identification in the very unlikely case of:
> - bitflips appearing in the parameter page,
> - the controller driver not supporting simple DATA_IN cycles.
> 
> Fixes: c27842e7e11f ("mtd: rawnand: onfi: Adapt the parameter page read to constraint controllers")
> Fixes: daca31765e8b ("mtd: rawnand: jedec: Adapt the parameter page read to constraint controllers")
> Cc: stable@vger.kernel.org
> Reported-by: Alexander Dahl <ada@thorsis.com>
> Closes: https://lore.kernel.org/linux-mtd/20240306-shaky-bunion-d28b65ea97d7@thorsis.com/
> Reported-by: Steven Seeger <steven.seeger@flightsystems.net>
> Closes: https://lore.kernel.org/linux-mtd/DM6PR05MB4506554457CF95191A670BDEF7062@DM6PR05MB4506.namprd05.prod.outlook.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 248e654ecefd..a66e73cd68cb 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1440,12 +1440,14 @@ int nand_change_read_column_op(struct nand_chip *chip,
>  	if (len && !buf)
>  		return -EINVAL;
>  
> -	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
> -		return -EINVAL;
> +	if (mtd->writesize) {
> +		if ((offset_in_page + len > mtd->writesize + mtd->oobsize))
> +			return -EINVAL;

These doubled (( )) are new and I think not necessary?

Greets
Alex

>  
> -	/* Small page NANDs do not support column change. */
> -	if (mtd->writesize <= 512)
> -		return -ENOTSUPP;
> +		/* Small page NANDs do not support column change. */
> +		if (mtd->writesize <= 512)
> +			return -ENOTSUPP;
> +	}
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_interface_config *conf =
> -- 
> 2.40.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
