Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A92C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:07:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D4820678
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FCIjEu45"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D4820678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yOVzopk/LNljGQo9+a74zW5cS2H9kMnxjapcnLpjw60=; b=FCIjEu45Qn0l2B7LLwXi11ibM
	FOJbJIuHqLe9+I0/xAon8faZolACF+O+Tm1D0xlCmChp3Bsq+UAro6+XhuNzUm8aEtsBL/wUh9DP0
	bXtmLlWCYErhE7UBjPktb/tMWXoKfiEkgK9A7vh193HJecGzq+lbO72ZFyuNHUlvVk1Eld+uUQqdO
	d/BY9sMF++g2PlMT2kLsrsHrc4lkRSQfevFSh2BPnGq5JqGU8CcHFXk519yLlNSaaD7Nf92P5vncE
	YqXNtLWQBUOFuPnIL2foEVjZzTDlo+TxFDRNd6AKsG7CqCC41oKimm1gKgWDJCQ70dSsBSV/exbFM
	dvvTcUl2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2aB4-0001Ro-EJ; Mon, 03 Aug 2020 13:06:54 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2aB2-0001RI-QO
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 13:06:53 +0000
IronPort-SDR: qgXoj/5xWSuNj5VhIY5RxPSFDcaUiPdng93amesHWirFb/FSjCrkPWpUL+Jx7WkVXt2ei/PjED
 /jaJBzbpxeOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="132154911"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="132154911"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 06:05:37 -0700
IronPort-SDR: 97bGbyL6YMQTKXS8v/uAnE7kejawVmtdJ7xUNwRv4412nrgH29Uv0FezDr/4/nZGZWddQ6sQa6
 TUAzMI00e65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="396051205"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 03 Aug 2020 06:05:33 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Aug 2020 16:05:32 +0300
Date: Mon, 3 Aug 2020 16:05:32 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daniel Gutson <daniel@eclypsium.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci
 attempts to turn the SPI flash chip writeable
Message-ID: <20200803130532.GY1375436@lahna.fi.intel.com>
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200803095720.GC1375436@lahna.fi.intel.com>
 <CAD2FfiFt6=OueX3E0g2ckPU+7F69yCmM0+bzF_6UD1sd4E_k_A@mail.gmail.com>
 <20200803102711.GK1375436@lahna.fi.intel.com>
 <CAFmMkTHSjQZJNzvUzLHHJ7sUTVX4BV6TwB=P8EO-HNk_cv8RKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFmMkTHSjQZJNzvUzLHHJ7sUTVX4BV6TwB=P8EO-HNk_cv8RKg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_090653_051625_8905369E 
X-CRM114-Status: GOOD (  23.27  )
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
 Richard Hughes <hughsient@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 03, 2020 at 09:58:23AM -0300, Daniel Gutson wrote:
> On Mon, Aug 3, 2020 at 7:27 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > On Mon, Aug 03, 2020 at 11:18:12AM +0100, Richard Hughes wrote:
> > > On Mon, 3 Aug 2020 at 10:57, Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > > I think instead of this we should simply make it so that the driver
> > > > never tries to make the chip writable.
> > >
> > > I think this is a good idea, but I wasn't sure if it was an acceptable
> > > behaviour change. Should the driver still try to set BCR_WPD when
> > > writing an image (i.e. defer the setting of write enable until later),
> > > or just not set the BCR register at all? I think your last comment was
> > > the latter, but wanted to check.
> >
> > I would say not set it at all. I think it was (my) mistake to set it in
> > the first place.
> 
> Do you want me to remove the module parameter from intel-spi too and
> do the same?

No, I think that should still be left there. Then by default it is
read-only and you can only enable writing if the BIOS allows it and that
the user actually requested it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
