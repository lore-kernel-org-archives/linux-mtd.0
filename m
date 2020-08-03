Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63151C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 10:00:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3166920678
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 10:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJ/gTkVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3166920678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KuBeqv1HkkA1VAnjDeky5pgGSNabQKyyeHccE6+wuFA=; b=hJ/gTkVY8qIc3w9T4rR8fvVGm
	AVFB+ezkWiDmvLDQHftDwSxgz/S35WJtIgtvz6IZOrI7iJlW2OWrm/Ek7ARXBjTFuw/7YotKv0qoy
	feRGaZ2CtQGHDPW5QOCZxKWsLZhnoJSQbdZPulWQDN7t/zydSWYFI4P3WvgPnjU79oPAhWjYH4iZk
	TUXMYxsjdDXiodM8ZfzD93rrYi0BBhACS2AYa9fH72ZCruzDAVlJ7aTt+0Y1IPa7wCezinDHmox+a
	pUFKGLpXUrCMiW8ju6ENtJbmYMOrb8TerXhBPUgVYpvRUNuWxHyAcIWQ9DJEuA/93JXDrdDDhxYYr
	zVyMLrSxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2XFi-0004sd-F6; Mon, 03 Aug 2020 09:59:30 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2XFf-0004jt-Kb
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 09:59:28 +0000
IronPort-SDR: TxVNuykfYHjupoT8f+NEjTpqHRNA/V90+xGl5ynJWlSv0+kNFCZo3BFGLHgfhncOvV24frObiZ
 6/417QcDKosg==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="149870686"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="149870686"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 02:57:24 -0700
IronPort-SDR: MsiKdyIvj4fmPlYeIFCmVI5xosoHyyG+1kksLDAieWifeoY53aYQt2EGOqbylbRPy1hkBTV432
 Fom/VXLNwQXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="396002736"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 03 Aug 2020 02:57:21 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Aug 2020 12:57:20 +0300
Date: Mon, 3 Aug 2020 12:57:20 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daniel Gutson <daniel.gutson@eclypsium.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci
 attempts to turn the SPI flash chip writeable
Message-ID: <20200803095720.GC1375436@lahna.fi.intel.com>
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_055927_828657_D9664B09 
X-CRM114-Status: GOOD (  28.44  )
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

Sorry for the delay, I was on vacation.

On Fri, Jul 24, 2020 at 06:28:53PM -0300, Daniel Gutson wrote:
> Currently, intel-spi has a module argument that controls whether the driver
> attempts to turn the SPI flash chip writeable. The default value
> is FALSE (don't try to make it writeable).
> However, this flag applies only for a number of devices, coming from the
> platform driver, whereas the devices detected through the PCI driver
> (intel-spi-pci) are not subject to this check since the configuration
> takes place in intel-spi-pci which doesn't have an argument.
> 
> That's why I propose this patch to add such argument to intel-spi-pci,
> so the user can control whether the driver tries to make the chip
> writeable or not, being the default FALSE as is the argument of
> intel-spi.
> 
> Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> index 81329f680bec..77e57450f166 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> @@ -24,6 +24,10 @@ static const struct intel_spi_boardinfo cnl_info = {
>  	.type = INTEL_SPI_CNL,
>  };
>  
> +static bool writeable;
> +module_param(writeable, bool, 0);
> +MODULE_PARM_DESC(writeable, "Enable write access to SPI flash chip (default=0)");

I think instead of this we should simply make it so that the driver
never tries to make the chip writable.

> +
>  static int intel_spi_pci_probe(struct pci_dev *pdev,
>  			       const struct pci_device_id *id)
>  {
> @@ -41,12 +45,14 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
>  	if (!info)
>  		return -ENOMEM;
>  
> -	/* Try to make the chip read/write */
> -	pci_read_config_dword(pdev, BCR, &bcr);
> -	if (!(bcr & BCR_WPD)) {
> -		bcr |= BCR_WPD;
> -		pci_write_config_dword(pdev, BCR, bcr);
> +	if (writeable) {
> +		/* Try to make the chip read/write */
>  		pci_read_config_dword(pdev, BCR, &bcr);
> +		if (!(bcr & BCR_WPD)) {
> +			bcr |= BCR_WPD;
> +			pci_write_config_dword(pdev, BCR, bcr);
> +			pci_read_config_dword(pdev, BCR, &bcr);
> +		}
>  	}
>  	info->writeable = !!(bcr & BCR_WPD);

So here we just read the BCR register and then set info->writeable based
on its value.

Then it is up to the BIOS to enable this if it allows writing the flash
chip from the OS side.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
