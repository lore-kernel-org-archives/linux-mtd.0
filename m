Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DA4C624A4
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ksp5xVU+NBlDpLt40HIvYmN3l8+XFT9r97k7cq02Tio=; b=CbqZ8TKFyG1JYN
	Wr0DhHlntSqJUUEDdSYczgS4AgBRhwfXxLloftNKi5tNlux2u+Fz+pDw0vcafG+RPqH0dIOMKCOpt
	Gd9jVXXLhBDqXgU1KUJ0dpqweNROsWT8/20+No6NkCX93S31rcwtKaWibJqNIQfaBh9WyP0xyYCd/
	Py7U0m5irMqyj/Sn9w3xpUsdeRWW7hbDNZBL6eVT5O9Y+KournIK8W9wIumS6kW0QwgYKrMIyIE+/
	qZjIOfySg1R6JzdFNvLS25AjXBrK8KYDhVtWmfBe+pPUT3oCRUGxOtT1CDfF0sirXZXwonayIWxCs
	Y0grkdwgBlwigx8mLuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11jL-00000009MW7-1jfH;
	Mon, 31 Aug 2026 13:07:19 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11jI-00000009MVg-39Jk
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 13:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788181637; x=1819717637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6/vscZ84sW1fUTAC+I6IPslPZth5hZiW4QMeEDVqzFc=;
  b=B3xdzRrgsEAWpXrHuJvXq5jJC3Y6hdafpHAItnXBJX4f/LKS7wBRNSN1
   6t0q8x9cRiQUhEbszbgIOawG7WWb3nf38PNcG+EQomJtJYLxZEVhzOU+T
   JRQXu+vQZOVvb+KIUl45yNvpRI6oBsFih4JbEG3Jr/xk1Xgkk5/UIzIT+
   GGXuo8DG8iOycOt1xMwYT8QOMyaxUnXWwUhyQhYGs41VQ2pSP23SmZFn3
   OjOTqBDhKJn5H/xfkotn+Gdq9GmF7FjaSlzgSN+Gb/BsWrI6W8rJ3GYdd
   1Wr7uG/b4tg2GL6YTUvYW/iSGsg7KWsWnNtUbYBaeE3ciXAtiba5r+mkK
   Q==;
X-CSE-ConnectionGUID: uSUIsmkaQdmtWShb5FMy5g==
X-CSE-MsgGUID: l/u+cWicRiSXk58XowDsyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88793649"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88793649"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:07:17 -0700
X-CSE-ConnectionGUID: b4TMZ87/SOWF/aw21zrwvw==
X-CSE-MsgGUID: qDMR9we+Szm2xt3XEdbShg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="272594617"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 31 Aug 2026 06:07:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EBF1E99; Mon, 31 Aug 2026 15:07:12 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:07:12 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: tjakobsen84@protonmail.com, Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Report platform enforced SPI flash write
 protection
Message-ID: <20260831130712.GL124825@black.igk.intel.com>
References: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com>
 <DL34V3WU5UY1.3FYYB7UPWYY83@kernel.org>
 <20260831125526.GJ124825@black.igk.intel.com>
 <DL35CFJ3BXZ1.2RE00JYDZKXXU@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DL35CFJ3BXZ1.2RE00JYDZKXXU@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_060716_823352_AD7120C7 
X-CRM114-Status: GOOD (  16.78  )
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

On Mon, Aug 31, 2026 at 03:00:36PM +0200, Michael Walle wrote:
> Hi,
> 
> On Mon Aug 31, 2026 at 2:55 PM CEST, Mika Westerberg wrote:
> > Hi,
> >
> > On Mon, Aug 31, 2026 at 02:37:59PM +0200, Michael Walle wrote:
> >> Hi,
> >> 
> >> On Mon Aug 31, 2026 at 2:05 PM CEST, Tobias Jakobsen via B4 Relay wrote:
> >> > Patch 2 adds the only user, spi-intel, which already computes protected
> >> > range state at probe but has had no way to expose it since the SPI MEM
> >> > conversion removed its visibility of the MTD device.
> >> 
> >> Where was it removed, though?
> >
> > After the SPI MEM conversion the driver is a regular SPI driver so it can
> > only use spi_new_device() to add and configure the SPI-NOR chip (via
> > platform data, struct flash_platform_data). Prior this it was creating the
> > MTD device itself.
> 
> Yeah, but it never exposed the _is_locked() op, right?

Ah, yeah that's right :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
