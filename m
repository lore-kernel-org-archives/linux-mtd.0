Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7487C38A2A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 00:22:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6E520735
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 00:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mOZWX0sd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6E520735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vWU9bofPcAJVIAyUwCneesi7wdQC+PpwanVNMGAv18=; b=mOZWX0sdS2b4T1
	vsudfceGcJ4QtnqDl3KPmnrjKITeK3g2kHPkm2jFH/pGEYVPAsujRWccHJ/hYgVFS/MaLGmRUKbJc
	x8b9v57FIOUdn/Rj2C6KL6iXq4e5M0fTeEPl91qOMUg9xsvOUHu8Qn3jZG7bUoID0OyaNDLZmDMk8
	qIg3GNRTDNrZ0Cqu9X5R/ri+n7VhAnz4fHf7XPn49EJhW+qGMWtyATivEw8D0T6DukQ2CRyXTFF24
	Pr9QDloy6Eux0Rb8k41a9+mmbKeIjOzgEoL5U7KNqIgqCA6J98x64JuZRDUL+vp5h1gQxIprcWmH9
	WRmwM/W3fWhTDV6E5lAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWUIi-0003iT-68; Thu, 07 May 2020 00:22:08 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWUIf-0003hv-9A; Thu, 07 May 2020 00:22:05 +0000
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: "Ramuthevar,Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <35cf7227-0045-9916-7994-a5763367aab3@infradead.org>
Date: Wed, 6 May 2020 17:22:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Content-Language: en-US
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
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de, richard@nod.at,
 brendanhiggins@google.com, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 boris.brezillon@collabora.com, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/6/20 5:15 PM, Ramuthevar,Vadivel MuruganX wrote:
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index a80a46bb5b8b..a026bec28f39 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -457,6 +457,14 @@ config MTD_NAND_CADENCE
>  	  Enable the driver for NAND flash on platforms using a Cadence NAND
>  	  controller.
>  
> +config MTD_NAND_INTEL_LGM
> +	tristate "Support for NAND controller on Intel LGM SoC"
> +	depends on OF || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  Enables support for NAND Flash chips on Intel's LGM SoC.
> +          NAND flash interfaced through the External Bus Unit.

Please use one tab + 2 spaces for indentation in the line above.

> +
>  comment "Misc"
>  
>  config MTD_SM_COMMON


-- 
~Randy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
