Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1560C10F6FD9
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2026 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltjEudYRHVRawP7r/6jPpSlE12ZphzF6vZ2qzTSS3uA=; b=PS/AFYlxqytAFv
	wEfSgXO7CQM1CjlkYJioB01+kQhgDryS4OTvgEDlkAIXs1G0LgOD0kpbBMyqg23b79eTY8bu8sUwS
	YZEVh1CJRo6g5OPtHDGPp3dnukX8wE1KNzLSMCwx5wf7/TMtYYICDRatj4Z0v22/ROZVWXkPXtdPu
	H2ADi1Cs9cdLgu2FrxKyszQ74k8s3RmyCsTFrAEkB5qIj2IkIzqUueTWcmUFtPH5AG8mGGbW/Zz0P
	d2HMiSlQRXikEq0bqwvbH+UnSIvgwvThArZyIO7DRnfxZAFbaCLxzCRgclJ14gsYuNOH2QrHh6KiI
	tmw+FP8radpXPV3DPXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7y2X-0000000Fgq6-1rfM;
	Wed, 01 Apr 2026 16:03:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7y2W-0000000Fgpb-15cC
	for linux-mtd@bombadil.infradead.org;
	Wed, 01 Apr 2026 16:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nk9pGpxh0vWpesmCd7JlzF8g1U7htln7n+QL1w8SFVM=; b=NgOgBcQxU7ij1xauDoICSX2zqZ
	+DSmvhCaKXGNdfzO6iNytRWVTQGXUJGQTQL5XkPvij59ZAKWDX7vvdCCZGZpIaTS/npXL0cPRnXQb
	Ngq0T8Swfn0476xOcRhDDYSWajg7I535YyMNglfmgrrpQHLTRYQ9KLmMwHCn2Onc4YdiEJaJ6UANy
	RkvuCY5vXTswSXTQrSiOqUmqnEE6SjTu57ZkHQDMmugRQ0Rs/uZC7dcw4lGlmOE+VaVWEpo+Ojnob
	PVSG9ySZxXLFCrRAPZR2b8aCVOFwK6XmnnmoXcKTAJYSY3W7pFlgzh1R1EkDmDIyXncgk+G1H1wTC
	D+fQH14w==;
Received: from mx.os-c.de ([213.165.83.196] helo=os-cillation.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7y2T-00000000qMP-16ot
	for linux-mtd@lists.infradead.org;
	Wed, 01 Apr 2026 16:03:31 +0000
Received: from core2024.osc.gmbh (ip-094-079-177-042.um30.pools.vodafone-ip.de [94.79.177.42])
	by os-cillation.de (Postfix) with ESMTPSA id EAA44C03BA;
	Wed,  1 Apr 2026 17:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=os-cillation.de;
	s=202409; t=1775058826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nk9pGpxh0vWpesmCd7JlzF8g1U7htln7n+QL1w8SFVM=;
	b=LTDUoNM7VHDIgWwa+2JHihO22XOPOp7Z4UdbimU83p0qFyyAFDqEyeUon/15HVJ7C9uKNC
	k1Lg46IhZMP2Sg3idbWDTDa3UjC4A8McrevfSIpc8VVYp4MQahvm52GyaEceiG/Bk/2Zut
	H3R89nVZKZAbTt2E0rMGHkucQ5NxdCYLRIqb1LNdn/0VByONAsSOiauLvzXXYUpZZx+bVY
	VTPoDtDWo42StKCQ1VU8mGUlH6OMvmAN5v2wD35F20EJnaA0cZL62nAV6NqWdwxzIDJRGo
	ux7LZSB96L0LlRlMX8LLhWOzmw2vMoLz+cte8hh+lYTVy5KLBU+1J2I5l+QNRg==
Authentication-Results: os-cillation.de;
	auth=pass smtp.auth=os-c@schweissgut.net smtp.mailfrom=hd@os-cillation.de
Received: from [192.168.3.45] (hd2022.osc.gmbh [192.168.3.45])
	by core2024.osc.gmbh (Postfix) with ESMTPSA id 5ACAD20010D;
	Wed,  1 Apr 2026 17:53:40 +0200 (CEST)
Message-ID: <40364d66-f8a2-4efb-a4d3-70f0aa3137e2@os-cillation.de>
Date: Wed, 1 Apr 2026 17:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mtd: spi-nor: Fix SST AAI write mode opcode handling
To: Sanjaikumar V S <sanjaikumarvs@gmail.com>, mwalle@kernel.org,
 pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, sanjaikumar.vs@dicortech.com,
 stable@vger.kernel.org, tudor.ambarus@linaro.org, vigneshr@ti.com
References: <20260331095026.38-1-sanjaikumarvs@gmail.com>
Content-Language: en-US
From: Hendrik Donner <hd@os-cillation.de>
Autocrypt: addr=hd@os-cillation.de; keydata=
 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 li+2
In-Reply-To: <20260331095026.38-1-sanjaikumarvs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_170329_458659_01CF6200 
X-CRM114-Status: GOOD (  25.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On 3/31/26 11:50, Sanjaikumar V S wrote:
> From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
> 
> When the SPI controller lacks direct mapping support, the fallback path
> in spi_nor_spimem_write_data() uses nor->write_proto based operation
> template. However, this template uses the standard page program opcode
> set during probe, not the AAI opcode required for SST flash.
> 
> Additionally, controllers that do support direct mapping will also use
> the wrong opcode since the dirmap template is created at probe time
> with the standard page program opcode.
> 
> Fix this by:
> 1. Checking the nodirmap flag in spi_nor_spimem_write_data() to ensure
>     the code falls through to spi_nor_spimem_exec_op() path which builds
>     the operation at runtime with the correct program_opcode.
> 2. Setting nodirmap=true for SST AAI devices in sst_nor_late_init() to
>     disable dirmap and force the runtime opcode path.
> 
> This only affects SST devices with SST_WRITE flag. Other SST devices
> that use standard page program can still benefit from dirmap.
> 
> Fixes: df5c21002cf4 ("mtd: spi-nor: use spi-mem dirmap API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
> ---
> Changes since v4:
> - Disable dirmap for SST AAI devices in sst_nor_late_init() to fix
>    the case when controller supports direct mapping (Pratyush)
> - Updated commit message and subject to reflect the broader fix
> 
> Note: Patch 1/2 from v4 series is already in spi-nor/next.
> 
> I don't have hardware to test the new sst.c change. Hendrik, could you
> please verify this on your SST25VF032B setup?
> 

retested, works the same as v4 on the SST25VF032B, don't have other SST
flashes at hand to test though.

Tested-by: Hendrik Donner <hd@os-cillation.de>
Reviewed-by: Hendrik Donner <hd@os-cillation.de>

Regards,
Hendrik

>   drivers/mtd/spi-nor/core.c |  2 +-
>   drivers/mtd/spi-nor/sst.c  | 10 +++++++++-
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e6c1fda61f57..2e4b167cab57 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -281,7 +281,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
>   	if (spi_nor_spimem_bounce(nor, &op))
>   		memcpy(nor->bouncebuf, buf, op.data.nbytes);
>   
> -	if (nor->dirmap.wdesc) {
> +	if (nor->dirmap.wdesc && !nor->dirmap.wdesc->nodirmap) {
>   		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
>   					      op.data.nbytes, op.data.buf.out);
>   	} else {
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index db02c14ba16f..cd2f04830a6b 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -267,8 +267,16 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>   
>   static int sst_nor_late_init(struct spi_nor *nor)
>   {
> -	if (nor->info->mfr_flags & SST_WRITE)
> +	if (nor->info->mfr_flags & SST_WRITE) {
>   		nor->mtd._write = sst_nor_write;
> +		/*
> +		 * AAI mode requires dynamic opcode changes (BP vs AAI_WP).
> +		 * Disable dirmap to ensure spi_nor_spimem_exec_op() uses
> +		 * the runtime opcode instead of the dirmap template.
> +		 */
> +		if (nor->dirmap.wdesc)
> +			nor->dirmap.wdesc->nodirmap = true;
> +	}
>   
>   	return 0;
>   }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
