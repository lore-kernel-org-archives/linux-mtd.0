Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91005C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 10:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6014720449
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 10:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k6lfin8F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6014720449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4RhVCT5flq7DrMoKCL6IJSjHkbSMOY3NT9zVDc0Jx0=; b=k6lfin8FqVE9KJ
	HBA3/6biowhhq8MQfxq21W1IPERZlT9zHL/IesLoPAma27gnbFRxbgBn4kgb3ru0XD+REzm/Tj7JR
	9GpJmPa6dir1lpNvHkgI8omBk/oYiD1CS2t4Aon3EhRt/RLuwWoaRSWmLHaqZBHvPJqrObNHaLGGg
	HvSQyCzdyYS+f6u59mE1apTyQmwsnxPG7vw4RY6tn2HwM06DamlzYbE4YZmINlF4IhD7vsSdqhdct
	wDUKL64TlmUI4EqsBXMzdyvcHQ7lBw9iPQw0rnJer3v7wvHCT8tfkaUXbQxRX707IMwka+MVBn5t7
	/kxMCUfyXy3Icgpglb8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gywRE-0002Ar-VI; Wed, 27 Feb 2019 10:27:44 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gywRB-0002A6-1A
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2019 10:27:42 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2019 02:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,419,1544515200"; d="scan'208";a="118147955"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by orsmga007.jf.intel.com with SMTP; 27 Feb 2019 02:27:33 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 27 Feb 2019 12:27:32 +0200
Date: Wed, 27 Feb 2019 12:27:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v2] spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Message-ID: <20190227102732.GU2696@lahna.fi.intel.com>
References: <20190226112334.401-1-alexander.sverdlin@nokia.com>
 <20190227095617.20968-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190227095617.20968-1-alexander.sverdlin@nokia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_022741_120978_4A3231D6 
X-CRM114-Status: GOOD (  20.40  )
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

On Wed, Feb 27, 2019 at 09:57:15AM +0000, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
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
> Changelog:
> v2:	More macros! As Mika suggested.
> 
>  drivers/mtd/spi-nor/intel-spi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index af0a220..8c279c4 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -632,6 +632,10 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
>  	while (len > 0) {
>  		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
>  
> +		/* Read cannot cross 4K boundary */
> +		blocksize = min(from + block_size, round_up(from + 1, SZ_4K)) -
> +			    from;

Nit:

It looks better if you put it into one line like:

		blocksize = min(from + block_size, round_up(from + 1, SZ_4K)) - from;


Regardless of that,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
