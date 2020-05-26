Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E723C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:28:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B19E20870
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPksL0fe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B19E20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEm8WFLSdypsr0kHiJ4sWcJUX0xlfvxgjykvObazRBY=; b=jPksL0fezciYhP
	J/pRGaAAuzP0u1xyxW147v9UY3HiZLcxXTW3GCYcanuEHjT5oDkGo3/G7s3rCGfqZIgq6a8qRi2qm
	R/sjIixu/ty+2Fs7/4aqs3uAk1Kwia9SJo4EW+9DIywMhCXO03HvIbcdmdz5bFaMWBk8nbEreGf2H
	guXYZcpALgDBmsdiqZzjQH6Ou0DXmL+SKhoLHxsoOr/nYMsKPI5lyRg7sicu+gDInLNhfvwKpkYqb
	iw483RMZFARN0d5nZB1E0V3Ts2Q3M476YC1H4Xz0xgLLGZtulH3rb7Yso7Yma17b6EDKxiO8wyLZ4
	U7uSY3mmdmkC2v+3BEKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdh7f-0008Jk-UR; Tue, 26 May 2020 21:28:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdh7d-0008JJ-43
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 21:28:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 874002A3589;
 Tue, 26 May 2020 22:28:27 +0100 (BST)
Date: Tue, 26 May 2020 23:28:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 19/28] mtd: rawnand: legacy: Use a helper to access
 the timings
Message-ID: <20200526232823.2fcc0e0d@collabora.com>
In-Reply-To: <20200526191725.7591-20-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-20-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_142829_290629_283BC76D 
X-CRM114-Status: GOOD (  17.77  )
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

On Tue, 26 May 2020 21:17:16 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Do not access the SDR timings directly but use nand_get_sdr_timings()
> instead. This way, future patching over this helper will be easier.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_legacy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
> index 8b91aa7773d8..34b4c944f6a6 100644
> --- a/drivers/mtd/nand/raw/nand_legacy.c
> +++ b/drivers/mtd/nand/raw/nand_legacy.c
> @@ -354,6 +354,8 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
>  
>  static void nand_ccs_delay(struct nand_chip *chip)
>  {
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->data_interface);
> +
>  	/*
>  	 * The controller already takes care of waiting for tCCS when the RNDIN
>  	 * or RNDOUT command is sent, return directly.
> @@ -366,7 +368,7 @@ static void nand_ccs_delay(struct nand_chip *chip)
>  	 * (which should be safe for all NANDs).
>  	 */
>  	if (nand_controller_has_setup_data_iface(chip))
> -		ndelay(chip->data_interface.timings.sdr.tCCS_min / 1000);
> +		ndelay(sdr->tCCS_min / 1000);
>  	else
>  		ndelay(500);
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
