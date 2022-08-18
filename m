Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF220C00140
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Aug 2022 19:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxT7FdsQiYWDiG2fe1IA+lxNiUL7EAHMoUdeBAnDvuU=; b=N12emubEjPulTM
	Tn/VcFP2LF6vhYhLHm92gcjoPATZCRuxaZqSk6dCdocYjEctzbaJp8owYyy//ECYMfSqnb//snCXC
	GW221uSVh3vR06hDcPyigMAtZtQJtIJlxxlcPsDoMWYO7TIQzw8q5JwJh8EFo3+OcyG/Y9N3dCwXC
	lk9ju4Y9wbSNzwjADuO1glYaQb2HhjzA+JWedLBOPMsY8X1rsUVUNa/kKVgcbHZUX5mQruzGGK8lb
	rGxuxwIDf1ElRaXH1AFApaK7sefFw93UMkGK7x+H53GXMGj9s/B0wSYUZPkZN7k3MwJlMqTidQGCc
	vGlhIt+VCqy9fuVWyBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOlb3-008rAJ-GZ; Thu, 18 Aug 2022 19:54:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOlb0-008r7o-LW
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2022 19:54:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A4ECB823F8;
	Thu, 18 Aug 2022 19:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C37C433C1;
	Thu, 18 Aug 2022 19:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660852463;
	bh=Q4j/ldkUS3oz0PjPoevb3lyzgbjtQETxzYQAB0RGhg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmY1FAgfycVwOurFI/KWPi8U+mOm/+xBYdiam/OLvOaETyL/kMzcWJu++kq55EfEP
	 u+3S1UGwZv5tZ0Ad6/Z/STYM0CHIdRnNVUL6KJxEW0nezVXA0/g5vHMglnco4anvRC
	 dzLAyE7FD29ndmxlTgNT4IAiwy6hryG9MMUpAeXz9RkXrNlSPWqTkRX1Iy0ipHrP0T
	 Tx0VJRwrJzX3B+665ouAaDiDVn/FqeWzhkmLK8FF2jZQ3cGwCU4JzXbukH/1Zboy3p
	 0JLhvjkDQWMEwGgr6LGwAETl4t5PH3+IO0JRXTHbJxVc1q/Un47lhdufxDCYrDXH22
	 pRk7OrNPErHYg==
Date: Fri, 19 Aug 2022 01:24:14 +0530
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: sudip.mukherjee@sifive.com, michael@walle.cc,
	linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Update documentation for
 info->fixup_flags
Message-ID: <20220818195414.r5qwhsxb7hrij5e5@yadavpratyush.com>
References: <20220810155924.1366072-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220810155924.1366072-1-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_125426_895618_18C984A1 
X-CRM114-Status: GOOD (  27.59  )
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

Hi,

On 10/08/22 06:59PM, Tudor Ambarus wrote:
> From: Tudor Ambarus <tudor.ambarus@gmail.com>
> 
> fixup_flags should be used when the flash defines the mandatory BFPT
> table, but doesn't define an optional SFDP table from which a
> particular flash parameters is discovered.
> 
> Reported-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@gmail.com>
> ---
>  drivers/mtd/spi-nor/core.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 3f841ec36e56..b87d61a105f7 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -466,10 +466,10 @@ struct spi_nor_fixups {
>   *
>   * @fixup_flags:    flags that indicate support that can be discovered via SFDP
>   *                  ideally, but can not be discovered for this particular flash
> - *                  because the SFDP table that indicates this support is not
> - *                  defined by the flash. In case the table for this support is
> - *                  defined but has wrong values, one should instead use a
> - *                  post_sfdp() hook to set the SNOR_F equivalent flag.
> + *                  because the optional SFDP table that indicates this support
> + *                  is not defined by the flash. In case the table for this
> + *                  support is defined but has wrong values, one should instead
> + *                  use a post_sfdp() hook to set the SNOR_F equivalent flag.

Not sure if it makes much of a difference adding just the word 
"optional". It might be better to explicitly state that it is used when 
the flash defines the mandatory tables but not the optional ones, like 
you do in the commit message.

Anyway, I don't think we should spend too many cycles on this relatively 
trivial patch, so either way is fine by me.

>   *
>   *   SPI_NOR_4B_OPCODES:      use dedicated 4byte address op codes to support
>   *                            memory size above 128Mib.
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
