Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F280C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:42:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 400AC20899
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XKcZJwo/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 400AC20899
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWWZwuHzhAnLcBfqaZY4crhA6KAUEtADEs+1NjAkVeg=; b=XKcZJwo/hu5dbj
	fUhBrab71kmfYfGq/wamcLtwBUa+tRtB5sWZKjszaOE20IssWS38B5tQplZcF6kUyFP0tpmufbfZ2
	7z41MGk180Ffv+4qkNbzeSgd+RIdFHGfUKB4b7ZPrx4NACr+rmSca9GfB4LYgdeRVjH9/C4gV4n20
	6q2A2qgGye27/t5bocHQ4o8ovRnQRYXPs1n0fVa9ld8chMidHrZy4XnQQpviUgMQiHTbAudCfRel0
	bZpoqe3MZSLOkGouw0BEE9RJ6IEg0yrlmDB8nZ2sMibh8jnWgqrfcSGHZZ5K0NARMRrq9u/CVzBPO
	op3vnRDA8uwweci1vESg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdhKv-00009R-Mk; Tue, 26 May 2020 21:42:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdhKs-00006I-MN
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 21:42:12 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E3BB22A00DC;
 Tue, 26 May 2020 22:42:08 +0100 (BST)
Date: Tue, 26 May 2020 23:42:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 14/28] mtd: rawnand: timings: Add a helper to find
 the closest ONFI mode
Message-ID: <20200526234205.73021fc2@collabora.com>
In-Reply-To: <20200526191725.7591-15-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-15-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_144210_864145_6D289C69 
X-CRM114-Status: GOOD (  21.33  )
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

On Tue, 26 May 2020 21:17:11 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Vendors are allowed to provide their own set of timings. In this case,
> we provide a way to derive the "closest" timing mode so that, if the
> NAND controller does not support tweaking these parameters, it will be
> able to configure itself anyway.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/internals.h    |  2 ++
>  drivers/mtd/nand/raw/nand_timings.c | 49 +++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index dc84e3b55d48..c7357ae86eeb 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -88,6 +88,8 @@ int onfi_fill_data_interface(struct nand_chip *chip,
>  			     struct nand_data_interface *iface,
>  			     enum nand_data_interface_type type,
>  			     int timing_mode);
> +unsigned int
> +onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
>  int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index ce6bb87db2e8..3c44c4b90536 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -273,6 +273,55 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  	},
>  };
>  
> +/**
> + * onfi_find_closest_sdr_mode - Derive the closest ONFI SDR timing mode given a
> + *                              set of timings
> + * @spec_timings: the timings to challenge
> + */
> +unsigned int
> +onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings)
> +{
> +	const struct nand_sdr_timings *onfi_timings;
> +	int mode;
> +
> +	for (mode = ARRAY_SIZE(onfi_sdr_timings) - 1; mode > 0; mode--) {
> +		onfi_timings = &onfi_sdr_timings[mode].timings.sdr;
> +
> +		if (spec_timings->tCCS_min > onfi_timings->tCCS_min ||
> +		    spec_timings->tADL_min > onfi_timings->tADL_min ||
> +		    spec_timings->tALH_min > onfi_timings->tALH_min ||
> +		    spec_timings->tALS_min > onfi_timings->tALS_min ||
> +		    spec_timings->tAR_min > onfi_timings->tAR_min ||
> +		    spec_timings->tCEH_min > onfi_timings->tCEH_min ||
> +		    spec_timings->tCH_min > onfi_timings->tCH_min ||
> +		    spec_timings->tCLH_min > onfi_timings->tCLH_min ||
> +		    spec_timings->tCLR_min > onfi_timings->tCLR_min ||
> +		    spec_timings->tCLS_min > onfi_timings->tCLS_min ||
> +		    spec_timings->tCOH_min > onfi_timings->tCOH_min ||
> +		    spec_timings->tCS_min > onfi_timings->tCS_min ||
> +		    spec_timings->tDH_min > onfi_timings->tDH_min ||
> +		    spec_timings->tDS_min > onfi_timings->tDS_min ||
> +		    spec_timings->tIR_min > onfi_timings->tIR_min ||
> +		    spec_timings->tRC_min > onfi_timings->tRC_min ||
> +		    spec_timings->tREH_min > onfi_timings->tREH_min ||
> +		    spec_timings->tRHOH_min > onfi_timings->tRHOH_min ||
> +		    spec_timings->tRHW_min > onfi_timings->tRHW_min ||
> +		    spec_timings->tRLOH_min > onfi_timings->tRLOH_min ||
> +		    spec_timings->tRP_min > onfi_timings->tRP_min ||
> +		    spec_timings->tRR_min > onfi_timings->tRR_min ||
> +		    spec_timings->tWC_min > onfi_timings->tWC_min ||
> +		    spec_timings->tWH_min > onfi_timings->tWH_min ||
> +		    spec_timings->tWHR_min > onfi_timings->tWHR_min ||
> +		    spec_timings->tWP_min > onfi_timings->tWP_min ||
> +		    spec_timings->tWW_min > onfi_timings->tWW_min)

Just nitpicking but you could just do the opposite test ('<=' instead of
'>' and '&&' instead of '||') and return mode directly, so you don't
need this continue.

I didn't check if all the _min timings were tested, but assuming that's
the case, you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +			continue;
> +
> +		return mode;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * onfi_fill_data_interface - Initialize a data interface from a given ONFI mode
>   * @chip: The NAND chip


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
