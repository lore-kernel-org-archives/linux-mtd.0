Return-Path: <SRS0=VSS2=W3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C03C3A5A6
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 13:40:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BECFA217D7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 13:40:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K6SXo5i0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BECFA217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASxFhDYn6blRSUc85YTXA2ln4NJbM09Q9ebawUy059k=; b=K6SXo5i03RLNsI
	yXEraizRrgxTMk1D5/UfdnxnLvK1q7H1b1+qYk3PBGU4NiuNTf2uV/uOBkB+nINxEtxP21YrY8HVc
	AtSAXF6Lm7WT9oEeNlj2XGXlkG3eZR1kdQbP1HcJSQsrFkGE49FVfTDgWgd/Hnv1aLLGLafBHapj3
	KtKMVyXrGM0d5w2rGZg30zH0kLfb7czVAYidLXWzRimQGDXIsgiiIrX1WvUCt7k8JUceGjDYuOfOE
	zhbYJHiAtSlLQd8/r5QjkBCP7/zDE0rGhwRXxHVJT8Dn4SmTYo+r+KkTfNPYci3HZrGRT2oWmZLsK
	Q37m7s5S5O7JrCaAE6Aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i43cA-0004Gz-HX; Sat, 31 Aug 2019 13:40:26 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i43c6-0002xA-FN
 for linux-mtd@lists.infradead.org; Sat, 31 Aug 2019 13:40:23 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Aug 2019 06:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,451,1559545200"; d="scan'208";a="198242460"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 31 Aug 2019 06:36:17 -0700
Received: by lahna (sSMTP sendmail emulation); Sat, 31 Aug 2019 16:36:16 +0300
Date: Sat, 31 Aug 2019 16:36:16 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jethro Beekman <jethro@fortanix.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: intel-spi: add support for Intel
 Cannon Lake SPI flash
Message-ID: <20190831133616.GQ3177@lahna.fi.intel.com>
References: <6cc18e41-82a6-942b-6d91-6297f73a33da@fortanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6cc18e41-82a6-942b-6d91-6297f73a33da@fortanix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190831_064022_558019_C2118EC0 
X-CRM114-Status: GOOD (  21.05  )
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
Cc: Enrico Weigelt <info@metux.net>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jethro,

On Sat, Aug 31, 2019 at 05:50:34AM +0000, Jethro Beekman wrote:
> (apologies, resending without S/MIME signature)
> 
> Now that SPI flash controllers without a software sequencer are
> supported, it's trivial to add support for CNL and its PCI ID.
> 
> Signed-off-by: Jethro Beekman <jethro@fortanix.com>
> ---
>    drivers/mtd/spi-nor/intel-spi-pci.c     |  5 +++++
>    drivers/mtd/spi-nor/intel-spi.c         | 11 +++++++++++
>    include/linux/platform_data/intel-spi.h |  1 +
>    3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c 
> b/drivers/mtd/spi-nor/intel-spi-pci.c
> index b83c4ab6..195a09d 100644
> --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> @@ -20,6 +20,10 @@ static const struct intel_spi_boardinfo bxt_info = {
>    	.type = INTEL_SPI_BXT,
>    };
>    +static const struct intel_spi_boardinfo cnl_info = {

Looks like some white space damage. There are couple of similar below as
well.

> +	.type = INTEL_SPI_CNL,
> +};
> +
>    static int intel_spi_pci_probe(struct pci_dev *pdev,
>    			       const struct pci_device_id *id)
>    {
> @@ -67,6 +71,7 @@ static const struct pci_device_id intel_spi_pci_ids[] = {
>    	{ PCI_VDEVICE(INTEL, 0x4b24), (unsigned long)&bxt_info },
>    	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
>    	{ PCI_VDEVICE(INTEL, 0xa224), (unsigned long)&bxt_info },
> +	{ PCI_VDEVICE(INTEL, 0xa324), (unsigned long)&cnl_info },
>    	{ },
>    };
>    MODULE_DEVICE_TABLE(pci, intel_spi_pci_ids);
> diff --git a/drivers/mtd/spi-nor/intel-spi.c 
> b/drivers/mtd/spi-nor/intel-spi.c
> index 195cdca..91b7851 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -108,6 +108,10 @@
>    #define BXT_FREG_NUM			12
>    #define BXT_PR_NUM			6
>    +#define CNL_PR				0x84

Here.

> +#define CNL_FREG_NUM			6
> +#define CNL_PR_NUM			5
> +
>    #define LVSCC				0xc4
>    #define UVSCC				0xc8
>    #define ERASE_OPCODE_SHIFT		8
> @@ -344,6 +348,13 @@ static int intel_spi_init(struct intel_spi *ispi)
>    		ispi->erase_64k = true;
>    		break;
>    +	case INTEL_SPI_CNL:

And here.

> +		ispi->sregs = NULL;
> +		ispi->pregs = ispi->base + CNL_PR;
> +		ispi->nregions = CNL_FREG_NUM;
> +		ispi->pr_num = CNL_PR_NUM;

Does CNL really have a different number of PR and FR regions than the
previous generations?

> +		break;
> +
>    	default:
>    		return -EINVAL;
>    	}
> diff --git a/include/linux/platform_data/intel-spi.h 
> b/include/linux/platform_data/intel-spi.h
> index ebb4f33..7f53a5c 100644
> --- a/include/linux/platform_data/intel-spi.h
> +++ b/include/linux/platform_data/intel-spi.h
> @@ -13,6 +13,7 @@ enum intel_spi_type {
>    	INTEL_SPI_BYT = 1,
>    	INTEL_SPI_LPT,
>    	INTEL_SPI_BXT,
> +	INTEL_SPI_CNL,
>    };
>     /**
> -- 
> 2.7.4
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
