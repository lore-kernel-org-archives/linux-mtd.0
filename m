Return-Path: <SRS0=THda=RB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A82C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 11:31:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA7421841
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 11:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tzb9ReCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FA7421841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0yh/gDOsfB636QzGHWwJtOup124UtvQI/GcX4PXzwA=; b=Tzb9ReCsMY5fW8
	7h95pB+TGtl1VtGyOopwfgRTFJ4Lq9fww9pqEByPheCp/KMWeqVF71P08/TC2sDbScA6nldh/A/Ew
	Q9cAyn1hCEkRug9ngfJlKDyFwOHl9a99DBAqGb5S9mdbYO4jZEyjLlTjqwRd8iEuLoHz/AW06SRq4
	E1u2T2sjb+7On+H0VgPF0N9BDp+/slP8pTZuVUTF5NKrcKYn5gYGqQ4FFXV+CPkbf+TnCWGtJH6y8
	0bFRT3bGaTUXgGry7KQD3UslSNOTAZwzIqj1aBOj22DpZfi2m1GM7Wua4OVuBXAG9+suAqtX6SBpQ
	dMWXQLmeRG7DB6TnxHaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyaxF-0007qP-NW; Tue, 26 Feb 2019 11:31:21 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyaxC-0007q0-1g
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2019 11:31:19 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2019 03:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,415,1544515200"; d="scan'208";a="120888933"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by orsmga008.jf.intel.com with SMTP; 26 Feb 2019 03:31:12 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 26 Feb 2019 13:31:11 +0200
Date: Tue, 26 Feb 2019 13:31:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] spi-nor: intel-spi: Avoid crossing 4K address boundary
 on read/write
Message-ID: <20190226113111.GO2696@lahna.fi.intel.com>
References: <20190226112334.401-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190226112334.401-1-alexander.sverdlin@nokia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_033118_134579_8C9DD9D3 
X-CRM114-Status: GOOD (  21.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Bin Meng <bmeng.cn@gmail.com>, "Porte,
 Romain \(Nokia - FR/Paris-Saclay\)" <romain.porte@nokia.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Fabreges,
 Pascal \(Nokia - FR/Paris-Saclay\)" <pascal.fabreges@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 26, 2019 at 11:23:49AM +0000, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> It was observed that reads crossing 4K address boundary are failing.
> 
> This limitation is mentioned in Intel documents:
> 
> Intel(R) 9 Series Chipset Family Platform Controller Hub (PCH) Datasheet:
> 
> "5.26.3 Flash Access
> Program Register Access:
> * Program Register Accesses are not allowed to cross a 4 KB boundary..."
> 
> Enhanced Serial Peripheral Interface (eSPI)
> Interface Base Specification (for Client and Server Platforms):
> 
> "5.1.4 Address
> For other memory transactions, the address may start or end at any byte
> boundary. However, the address and payload length combination must not
> cross the naturally aligned address boundary of the corresponding Maximum
> Payload Size. It must not cross a 4 KB address boundary."
> 
> Avoid this by splitting an operation crossing the boundary into two
> operations.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Romain Porte <romain.porte@nokia.com>
> Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/intel-spi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index af0a220..b83ea79 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -632,6 +632,10 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
>  	while (len > 0) {
>  		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
>  
> +		/* Read cannot cross 4K boundary */
> +		if ((from ^ (from + block_size - 1)) & ~(SZ_4K - 1LL))

Don't we have existing macros in kernel.h that can be used here and
below?

> +			block_size -= (from + block_size) & (SZ_4K - 1);
> +
>  		writel(from, ispi->base + FADDR);
>  
>  		val = readl(ispi->base + HSFSTS_CTL);
> @@ -685,6 +689,10 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
>  	while (len > 0) {
>  		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
>  
> +		/* Write cannot cross 4K boundary */
> +		if ((to ^ (to + block_size - 1)) & ~(SZ_4K - 1LL))
> +			block_size -= (to + block_size) & (SZ_4K - 1);
> +
>  		writel(to, ispi->base + FADDR);
>  
>  		val = readl(ispi->base + HSFSTS_CTL);
> -- 
> 2.4.6

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
