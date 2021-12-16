Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A621C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivy22x1h8rTVrVwZB0OOxL/iGqs5zCS+vjk9DQfll/A=; b=ZO1hwx9LKlqi0s
	/OtDwYtRZMHv2+R9IynQPTutRn3f0RAhOkwxf1lVpXEYS8oVrCxxD5YSmVMnB4FTq/nXa9OGKjImb
	rAkmWca8e3CdKDikPJNrCG+mLD63+1J7YLcf4J9oSAZH1BgZwcVbI/xrOMR+4ZKJmCIEFKZSyUlKG
	fTktTeyA3bZYG6ysZThgJS8+PD1r3zRyJ8wKEKzPvc8qNEbh0jIGkhmGFTjNoAjANsV+m6X6v0zoy
	HuqM330TR6RzrL0T4enkI/6IDpo+UuHJCa9oIjJcVfmpI7Q6F2KoEoLeOlGvNRwn5BYuiYwn222ez
	cNqb2gsC7J68UcMysBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxoAQ-004svE-UB; Thu, 16 Dec 2021 10:39:18 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxoAO-004sum-61
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 10:39:17 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226319164"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="226319164"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 02:39:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="545931922"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 02:39:09 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 16 Dec 2021 12:39:07 +0200
Date: Thu, 16 Dec 2021 12:39:07 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to
 SPI MEM
Message-ID: <YbsXS0SlrrQc0MGm@lahna>
References: <20211118130543.11179-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211118130543.11179-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_023916_314434_62A99776 
X-CRM114-Status: GOOD (  20.25  )
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

On Thu, Nov 18, 2021 at 04:05:40PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> Based on discussion on the patch I sent some time ago here:
> 
>   http://lists.infradead.org/pipermail/linux-mtd/2021-June/086867.html
> 
> it turns out that the preferred way to deal with the SPI flash controller
> drivers is through SPI MEM which is part of Linux SPI subsystem.
> 
> This series does that for the intel-spi driver. This also renames the
> driver to follow the convention used in the SPI subsystem. The first patch
> improves the write protection handling to be slightly more safer. The
> following two patches do the conversion itself. Note the Intel SPI flash
> controller only allows commands such as read, write and so on and it
> internally uses whatever addressing etc. it figured from the SFDP on the
> flash device.

Any comments on this series? If no, I would appreciate if these could be
merged for v5.17 :)

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
