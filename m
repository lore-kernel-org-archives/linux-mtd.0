Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB50CDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9tnHsu8BVXp20nscnGmCc6eWZzOZSl3nR1Z6WMgFnk=; b=lUJfGBjA+pbBU0
	+RNlLz7F/GRpfI2muiiG84aDrztxic8NsElNpjAVB2OlQMScBCI7M/KnD4PbKZB1NAKQyb2NRorPk
	WAxlPeSauRffyM+A7UbCWzYbkr+JL653TB+VC8meMSgyuIWA30N/1bnLrohpIJu76q+1xtC1hjquD
	mQvdXCBrIaQutQVE06oiTWyce6iQ9hgf9gaOAIC55Zw+cF9WLE4sGT89/aeSZrjHhQXKMuDbbWM6y
	IxlFDFGYb4soTEAYc5vuy0ZcdtJREAo+gcPsc2KdcbHxYOPom/jmW3PoCRfjYPlKzB+Cq+WdI/bij
	VNVUHTC3VDxdgGs1y/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslhA-00Ci0l-10;
	Tue, 17 Oct 2023 15:09:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslh6-00Ci0M-3D
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 15:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4182E611DB;
	Tue, 17 Oct 2023 15:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAFCC433C7;
	Tue, 17 Oct 2023 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697555355;
	bh=ylrjTPEgeCTXRLNBP7ynR5MjTIiAkIbguL3M2NwS9DQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SxMBs/ZNRNUtSFTs5IgDNLYr/hsh4MyHeROgQpVQlDSBxx4EIm71PGGUnFIiZDuND
	 bqXFnBClEltN85tshZxXyeCUuW/Dh542mqjFNSDUjFtLEUn35fbP4wBxvGut80rcUC
	 PyiKAdHDc3ZJx9ODZpbjBW3XbW8wWh7EAZRJY+svcOOFI3lV6/ybxbu/IKXlV0Wdfi
	 dts+13KkGlxrTS1pVeHUyWq5N4G1Xq52qBIWojrmOu4GtTSPva69Hl1LQ+diPJbkj9
	 a8C06SBWd8YfIdN6DUrmVOBHYunug+uuQiHdvKm//bEIxkqueDts1FqjF0BpAlogpl
	 qZ8Ygcqq5jFYQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc,  pratyush@kernel.org,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Mamta Shukla
 <mamta.shukla@leica-geosystems.com>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: micron-st: use SFDP table for
 mt25qu512a
In-Reply-To: <20231017074711.12167-2-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Tue, 17 Oct 2023 10:47:11 +0300")
References: <20231017074711.12167-1-tudor.ambarus@linaro.org>
	<20231017074711.12167-2-tudor.ambarus@linaro.org>
Date: Tue, 17 Oct 2023 17:09:13 +0200
Message-ID: <mafs0lec1mgkm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_080917_083461_49BE758A 
X-CRM114-Status: GOOD (  15.39  )
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

On Tue, Oct 17 2023, Tudor Ambarus wrote:

> From: Mamta Shukla <mamta.shukla@leica-geosystems.com>
>
[...]
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 756391c906e5..8920547c12bf 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -180,6 +180,18 @@ static const struct flash_info micron_nor_parts[] = {
>  	},
>  };
>  
> +static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
> +				      const struct sfdp_parameter_header *bfpt_header,
> +				      const struct sfdp_bfpt *bfpt)
> +{
> +	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups mt25qu512a_fixups = {
> +	.post_bfpt = mt25qu512a_post_bfpt_fixup,
> +};
> +
>  static const struct flash_info st_nor_parts[] = {
>  	{
>  		.name = "m25p05-nonjedec",
> @@ -407,10 +419,8 @@ static const struct flash_info st_nor_parts[] = {
>  		.name = "mt25qu512a",
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
>  			 SPI_NOR_BP3_SR_BIT6,
> -		.size = SZ_64M,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> -		.fixup_flags = SPI_NOR_4B_OPCODES,

Hmm, I have missed some recent developments in SPI NOR and I was
confused why you did not add a PARSE_SFDP flag. But now I understand
that you just need to drop the .size parameter and it will automatically
use SFDP. So LGTM.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

>  		.mfr_flags = USE_FSR,
> +		.fixups = &mt25qu512a_fixups,
>  	}, {
>  		.id = SNOR_ID(0x20, 0xbb, 0x20),
>  		.name = "n25q512a",

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
