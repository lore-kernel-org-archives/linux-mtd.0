Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772DDC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 06:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZX3vtd/T26eQdAJuzDpkMZmon1rocDR8i9jRZddkOH8=; b=kZUsOdXSvj7bR4
	Dr12PPtxGCzam29rwjIYH8FofJAd8KDMUwQryUWBCPlmY8jKvRP8uRbplPnY+YCNG2u5PfNvNzgRc
	q8Cp7UxH7nKtqbgq0xGZfjkVITqLUZPtqbM7QLZrFPfWflZ6ofNu632HJUIrQ0P9bs5IyMWO4Exhe
	0tFzkBzNqBhlJzMD6iG0YjJnpXxmiJeLGdquMJfk3KS3RLpgyb431d4cabp1cU3TGUpFTSNpekyb+
	fkDGE2N60fQg/d/e+a9LdUaC8vY3lx/J1gRb8fX7elCnmD90APu7CSpgPNQQEi0EnalCDS6+qXdf1
	SIdbQBbuZAj75fobDq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64KH-00DBA3-Pl; Fri, 16 Dec 2022 06:36:09 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64KB-00DB92-UF
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2022 06:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671172563; x=1702708563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vTyDp3WRHQkfKwZUmHm2YaSTJQCuH5GyeO9PrVqb4Ng=;
  b=jBspDd4iYUAxbm2GSKeKGMJdM7DCR/4ygqxBrdICU4nqS630agjyi6Hx
   U0SEUdWRRxT5mkW3VKeAgdztz/QFKHbzRkZIDKhwNFvMJLB8XYP5HoAsT
   QvONlOs+Mgc1YBaEIXJXAiaqVfxqgk1iX2lM/SQDrlIY18T0iFjPLS5E8
   2Y13yTrDG9gMM3gHseGpqgvH4zZGa2lGGKjS5Pn2hqHC8V/w2PM2QNbfn
   BH9Xqo7RpbCIVMUfSArzhhVkZgeiDtVAYTaIW4Rs8oI3kWjs/LGf06WJq
   avEJCjh/i9OPhKncITh+oGyy3sc3izfkLXVMwe4ZOr/j9r9CtOaYbmtSq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="345981623"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="345981623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 22:36:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="627467591"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="627467591"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 15 Dec 2022 22:35:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1FD40F7; Fri, 16 Dec 2022 08:36:26 +0200 (EET)
Date: Fri, 16 Dec 2022 08:36:26 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Tokunori Ikegami <ikegami.t@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi: allow building spi-intel standalone
Message-ID: <Y5wR6qiYGIYDRE6j@black.fi.intel.com>
References: <20221215163950.649791-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215163950.649791-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_223604_002870_A3ED945F 
X-CRM114-Status: GOOD (  12.52  )
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

On Thu, Dec 15, 2022 at 05:39:38PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
> fails to build, as it includes the shared CFI header:
> 
> include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
>    62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
> 
> Use an #ifdef here to guard the settings so the header can be included
> in all configurations.
> 
> Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
