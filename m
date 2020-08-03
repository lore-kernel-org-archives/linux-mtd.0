Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAA3C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 10:28:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4F520719
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 10:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k09sQ8tO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B4F520719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=huNVlpbTHd6hxC4nsQESdEJJlIsem9tAU5DfLK811L8=; b=k09sQ8tOPlUTAjAYtZk/uaRy2
	J94ATZdaFOrsX7DCyrAgnUJiTNj89CELc6y5CkiWc6n3elvRHZnFWVp96VJr2u4dfGIXy4s4kZWiy
	cT0Fe4K+VY74DwPSxlUBTPoceFSvouQ3pGU8pREmBJY+eSVa4a4I2cIZgMNr/8yNH1CHYb3QAY56l
	NYLS2fpqaCxyumGx2svYlYBz9kO0SAW2pDe21v7i8vdP8FxBS0ZvYxifBn6DIf1vWTXujbfIooYZR
	TwuSCbsxDksdcGtxYOoJkjRl5gqjIiiJC3MnVC5RIQYqpRh4A1xMs7vG3RIvRkjVT9IPh16ixEIBd
	v4Y2mm0jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Xgd-0000Vb-Hz; Mon, 03 Aug 2020 10:27:19 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Xga-0000Uo-Up
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 10:27:17 +0000
IronPort-SDR: UpbnYXkrfhckuJX3t9y369+z+NJ+DWrfCeHGeU+MoxORbVRkSVGU3WR43bZwzYgc9fpFQOMct2
 SkX2CJMkbLog==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="151283347"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="151283347"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 03:27:15 -0700
IronPort-SDR: H9lYg74O1xebpaI6b6EZdRmjDAQPlOpwirNhgyZ2s0cdTHeBTHCu2D1Fq/0HrZRTKlhci/g4ng
 B8Ov6ZIjMLCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="396009806"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 03 Aug 2020 03:27:11 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Aug 2020 13:27:11 +0300
Date: Mon, 3 Aug 2020 13:27:11 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci
 attempts to turn the SPI flash chip writeable
Message-ID: <20200803102711.GK1375436@lahna.fi.intel.com>
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200803095720.GC1375436@lahna.fi.intel.com>
 <CAD2FfiFt6=OueX3E0g2ckPU+7F69yCmM0+bzF_6UD1sd4E_k_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD2FfiFt6=OueX3E0g2ckPU+7F69yCmM0+bzF_6UD1sd4E_k_A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_062717_167450_7816A2D9 
X-CRM114-Status: GOOD (  17.77  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Daniel Gutson <daniel.gutson@eclypsium.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 03, 2020 at 11:18:12AM +0100, Richard Hughes wrote:
> On Mon, 3 Aug 2020 at 10:57, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > I think instead of this we should simply make it so that the driver
> > never tries to make the chip writable.
> 
> I think this is a good idea, but I wasn't sure if it was an acceptable
> behaviour change. Should the driver still try to set BCR_WPD when
> writing an image (i.e. defer the setting of write enable until later),
> or just not set the BCR register at all? I think your last comment was
> the latter, but wanted to check.

I would say not set it at all. I think it was (my) mistake to set it in
the first place.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
