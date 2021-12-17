Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0C6C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74qptnk9j8ZBxJQRsjy8SBusmQBcNftSg/XSx6VwKYA=; b=orTrxiSj9/Kdtb
	23uHQbzjTMdzUX4U3QaKKVQljBHnYmfZk0vDuIhVJEoms5W/K7RoS0Ih20SS9WTcZlZZipWURJ1fA
	CNWjRa+8txIkuUlGFaROKNzufis6uXPeon7xE2FdX8B05nLQ+NDn31ImR1pU4Esw5Y+/X1ornd1hZ
	wY3Y/d3r8SkruqLhFgIsGur1leLppnN1vMYMQKRc7yfRmFfXSm6HyCyVfufPJ76SWGrNh/wiOgkId
	hAIRfaM4FpvHSnsjEFAJdEWm9HC6e1X/C2PT6NmzmAIl1Uy2ZeJAZoByfBH/YNFYJEnsDp5hqSSzI
	yhqzCRGGX9Cin0o3mRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAkJ-009a5s-Ta; Fri, 17 Dec 2021 10:45:52 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAdb-009YGU-73
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 10:38:56 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="227015667"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="227015667"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 02:38:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="483184755"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 02:38:49 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 17 Dec 2021 12:38:46 +0200
Date: Fri, 17 Dec 2021 12:38:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <Ybxotgb927kpCizL@lahna>
References: <20211118130543.11179-1-mika.westerberg@linux.intel.com>
 <20211118130543.11179-3-mika.westerberg@linux.intel.com>
 <20211216115100.448351e4@collabora.com> <Ybtn1VTsspxdIeT8@lahna>
 <20211216174347.69cf611c@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216174347.69cf611c@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_023855_337793_85F19778 
X-CRM114-Status: GOOD (  10.98  )
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

On Thu, Dec 16, 2021 at 05:43:47PM +0100, Boris Brezillon wrote:
> Why no just
> 
> 	if (iop->mem_op.addr.nbytes != op->addr.nbytes ||
> 	    iop->mem_op.addr.dtr != op->addr.dtr)
> 		return false;
> 
> then?

That would be too simple ;-)

I'll do this change in v5.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
