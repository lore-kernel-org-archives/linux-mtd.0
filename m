Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AB4C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 05:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNRc8culkpREQuq3Qb9LIHOJems3IHowEpFZd+nHnW4=; b=x+R3spBZe+onZD
	S14oVg2s7UrpVNREhYQMGab1D0g3xcOAomxxhfYdglsqOcL35g5KIvH6Eqcua+rhrzc27aS7/jLDJ
	VmsH8vqjQ8Wm9yLv46uVdTFjDS5mOHc9hRpY2EBEqhaHXyo5E7u4BYPQU8wfZa85nZn9QMVuEVSi6
	jgzncjY371/QcZ6DoVtKs1QTGb+8vImPFFC8SnbQRwwzC9h3UzqOfjt31zvW9iXZvJyC4U5mLktF3
	IRbST82USrTO0Rk/0YtAGSaEnSS6W6f0ZRkrJDqaV7xngorj3e6YcKUuzuXj9oMKdeFzex1njnRjg
	ffAd2ULyK3vONTZD7qOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KD0-007tij-1b;
	Fri, 10 Nov 2023 05:37:34 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KCx-007ti0-2S
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 05:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699594651; x=1731130651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZyHt+VfbPMQzYvTzv5ldHjaRfCK13bx2BmONpzM1eic=;
  b=ZjsL/vigC+BFKFZFvYu1JUAJJBnPpj2IoudiSDZOApsN+fG5Wps71ocT
   EoJdPrHITIyJZAdtZ+TJr3xlhgeSqtv+g9FnisaMYba48OfhGPEfpRYWr
   rFIxaR3hJ9t0gH4Vcu6PXn7DsXDIIwIOhnTuA0r49dXl9JzR8fFNgdIUF
   /CP7kPSKexpOwzKGCyRvgiH+oaq6ojTnm/E8uwOWjXM0GksE09cjZ/U/3
   ZGJP9yp8JcM+NmQQG6VS++IT3/6olEsLInmU0i10rK3Wbf7elLjGMcN6f
   Jhq6ujnsNwCRVZ1gvcm82/Z+AWWfb9qkpA99BtqiwfLZt7SLIKtTQycbh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421226987"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="421226987"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 21:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792776503"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792776503"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2023 21:37:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 77AB114F; Fri, 10 Nov 2023 07:37:21 +0200 (EET)
Date: Fri, 10 Nov 2023 07:37:21 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] spi: Replace -ENOTSUPP with -EOPNOTSUPP in op
 checking
Message-ID: <20231110053721.GG17433@black.fi.intel.com>
References: <20231108094303.46303-1-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231108094303.46303-1-acelan.kao@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_213731_819749_E4D933F0 
X-CRM114-Status: GOOD (  12.90  )
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

On Wed, Nov 08, 2023 at 05:43:02PM +0800, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> No functional changes are introduced by this patch; it's a code cleanup
> to use the correct error code.

Probably good to mention here that this affect only the "SPI MEM"
drivers and the core parts. Also you could explain here that the reaosn
for this is to make sure we use unified "operation not supported" return
code accross these.

Does some kernel-doc need updating as well to make sure the future
drivers will return the correct one if they do not support given
optional operations?

> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> 
> ---
> v5. distinguish -EOPNOTSUPP from -ENOTSUPP
> ---
>  drivers/mtd/nand/spi/core.c | 2 +-
>  drivers/spi/atmel-quadspi.c | 2 +-
>  drivers/spi/spi-ath79.c     | 2 +-
>  drivers/spi/spi-bcm-qspi.c  | 2 +-
>  drivers/spi/spi-mem.c       | 6 +++---
>  drivers/spi/spi-npcm-fiu.c  | 2 +-
>  drivers/spi/spi-ti-qspi.c   | 4 ++--
>  drivers/spi/spi-wpcm-fiu.c  | 2 +-

I think you should include the SPI subsystem maintainer as well, at
least for visibility.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
