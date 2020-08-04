Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E03DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 11:53:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C912086A
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 11:53:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fx5tbaaa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C912086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=18s8IKjvA/K1CKa7RcNeJ10ztcFRQYa5u3gsTIb0MPY=; b=Fx5tbaaaYo4t3Q7qqJwoKZc2x
	ewjelYOMsyzr67AYiDx5is9tboZ6ACJYPsNUB71yjXAas2uESs/3313zN01JKjiKpCAfF7lirWdaR
	iRZBJPIUxU0ymLF6JjoNwKMf75SRp3xDmuuEKSiDFQShqti+DUNu1Y5IX5DPkgLzab4MCd4LiAm95
	zpHkwi1w+8mpRSm6HSlUhwEQCTAAxZdh7SDSmn1TNDm2EL0TOjIxSnY2Q/FgCoSFLfUeP54jYpbB+
	Yr3+EHr2wslHo2mLcAXfcmAXkPozl1UkvlaUR4R8nahziLkBYchigqQ0Up+EF3SjRJLRous6Gc9UB
	y+pRyRuOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2vUq-0008IX-39; Tue, 04 Aug 2020 11:52:44 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2vUn-0008IC-9A
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 11:52:42 +0000
IronPort-SDR: iZPsISh0tVQF5phbZWh6nrd+k0cSqo7KIb0GBpfUgndVXvTe2SOV0ePf3Dvg0vYCNHtoRgkaaA
 zctTK7FrFk7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="151519969"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; d="scan'208";a="151519969"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 04:52:39 -0700
IronPort-SDR: 5j8lkSutCNkcZJP6Z22txQhbEEyybEd3JikPty+wtafuTyns5+9QrI47aQw9fxslKMosrmzW2t
 GxfCGB2fWp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; d="scan'208";a="396550686"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 04 Aug 2020 04:52:34 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 04 Aug 2020 14:52:33 +0300
Date: Tue, 4 Aug 2020 14:52:33 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daniel Gutson <daniel.gutson@eclypsium.com>
Subject: Re: [PATCH] Remove attempt by intel-spi-pci to turn the SPI flash
 chip writeable
Message-ID: <20200804115233.GO1375436@lahna.fi.intel.com>
References: <20200803134449.72502-1-daniel.gutson@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803134449.72502-1-daniel.gutson@eclypsium.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_075241_480773_E1944B40 
X-CRM114-Status: GOOD (  27.99  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Aug 03, 2020 at 10:44:49AM -0300, Daniel Gutson wrote:
> Currently, the intel-spi-pci driver tries to unconditionally set
> the SPI chip writeable. After discussing in the LKML, the original
> author decided that it was better  to remove the attempt.
> 
> Context, the intel-spi has a module argument that controls
> whether the driver attempts to turn the SPI flash chip writeable.
> The default value is FALSE (don't try to make it writeable).
> However, this flag applies only for a number of devices, coming from the
> platform driver, whereas the devices detected through the PCI driver
> (intel-spi-pci) are not subject to this check since the configuration
> takes place in intel-spi-pci which doesn't have an argument.
> 
> This patch removes the code that attempts to turn the SPI chip writeable.

I think you should make the $subject to follow the convention used in
the SPI-NOR subsystem. You can see it running following command:

  $ git log --oneline drivers/mtd/spi-nor/controllers/intel-spi-pci.c

In this case I think it should be:

  mtd: spi-nor: intel-spi: Do not try to make the SPI flash chip writable

or something like that.

The patch itself looks good, one minor comment below.

> 
> Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> index 81329f680bec..d721ba4e8b41 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> @@ -41,13 +41,7 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
>  	if (!info)
>  		return -ENOMEM;
>  
> -	/* Try to make the chip read/write */
>  	pci_read_config_dword(pdev, BCR, &bcr);
> -	if (!(bcr & BCR_WPD)) {
> -		bcr |= BCR_WPD;
> -		pci_write_config_dword(pdev, BCR, bcr);
> -		pci_read_config_dword(pdev, BCR, &bcr);
> -	}
>  	info->writeable = !!(bcr & BCR_WPD);

Perhaps we should log this in debug level (dev_dbg()) so when debugging
possible issues we can see that the chip is write protected by the BIOS.

>  
>  	ispi = intel_spi_probe(&pdev->dev, &pdev->resource[0], info);
> -- 
> 2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
