Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660F6C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:46:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3574420FC3
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:46:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3KMUkYPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3574420FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t4Er2RGoqGPliLS0BStekq1YNE2BVp+fnS2P8H25UJ8=; b=3KMUkYPzrxNrSl3Hvs1BmqZjk
	Ic7llVnNOhO10Y5vmGbOYmHb0cuXOCdolL88WDZK37hgKOQLeP5EeF7W/Q1ch087viw8R0JOS1lU8
	l8UhaNaVTJmCm+ciDqiW79ELvPB+olo9fZT3FFZAYuWvpnOBzcc1rQfyMk0OnvVvn1CEXusg9Y497
	GoH0ND7AmZckNihsjCZEopEWWE+J82MjoCeAwKBkYhr5rK7eb4Mii8lxs+c6XDEXnD5FmzQHIrXb9
	nlAADG3lgV2Qil7VvYukMYX/1WOBYkpNoyI++GP2LmZqrHEGO1Q4VNWxwWetmoUuLUiYpCVhQrnf7
	eBoNShNpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA92F-0004Wt-73; Mon, 24 Aug 2020 09:45:03 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA92A-0004Vl-1B
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 09:44:59 +0000
IronPort-SDR: 1stZLW0ryu3PsT7+9iHhn+e6/5gjlAYKYeMrSxB4QgQYLVbpJXC0TKBlSwdWthbXNAcA8KF/nv
 FQVAkVbJmwqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="156923925"
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="156923925"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 02:44:53 -0700
IronPort-SDR: wRXI7XhK5QQaeSQpnPBnrStbcl8NxUyf6Oi3PSlxLixTjXiD8LZxoTcStAxuANtCDp83F56xNw
 DLqigSeyLtjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="402299045"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 24 Aug 2020 02:44:49 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 24 Aug 2020 12:44:48 +0300
Date: Mon, 24 Aug 2020 12:44:48 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI
 flash chip writable
Message-ID: <20200824094448.GE1375436@lahna.fi.intel.com>
References: <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
 <20200819065721.GA1375436@lahna.fi.intel.com>
 <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
 <20200819091123.GE1375436@lahna.fi.intel.com>
 <CAK8P3a19MLfQARXEWzCD-ySq4t9nsyryB+con33HsQ193+muMw@mail.gmail.com>
 <20200824082227.GU1375436@lahna.fi.intel.com>
 <CAK8P3a0==cZDHwZfqvCuvUg9jfjBOBG+AAomE9eqJ2xm-xNLvQ@mail.gmail.com>
 <20200824091542.GC1375436@lahna.fi.intel.com>
 <CAK8P3a2ipcVLOzZ5jsDSmWkm=rsE7UQ8rgTU-o6me+vX+gVa9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2ipcVLOzZ5jsDSmWkm=rsE7UQ8rgTU-o6me+vX+gVa9g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_054458_299003_64C82C8A 
X-CRM114-Status: GOOD (  31.85  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Daniel Gutson <daniel@eclypsium.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 11:31:40AM +0200, Arnd Bergmann wrote:
> On Mon, Aug 24, 2020 at 11:15 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Mon, Aug 24, 2020 at 11:08:33AM +0200, Arnd Bergmann wrote:
> > > On Mon, Aug 24, 2020 at 10:22 AM Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > > On Sat, Aug 22, 2020 at 06:06:03PM +0200, Arnd Bergmann wrote:
> > > > > On Wed, Aug 19, 2020 at 11:11 AM Mika Westerberg
> > > > >
> > > > > The mtd core just checks both the permissions on the device node (which
> > > > > default to 0600 without any special udev rules) and the MTD_WRITEABLE
> > > > > on the underlying device that is controlled by the module parameter
> > > > > in case of intel-spi{,-platform,-pci}.c.
> > > >
> > > > OK, thanks.
> > > >
> > > > Since we cannot really get rid of the module parameter (AFAIK there are
> > > > users for it), I still think we should just make the "writeable" to
> > > > apply to the PCI part as well. That should at least make it consistent,
> > > > and it also solves Daniel's case.
> > >
> > > Can you explain Daniel's case then? I still don't understand what he
> > > actually wants.
> > >
> > > As I keep repeating, the module parameter *does* apply to the pci
> > > driver front-end since it determines whether the driver will disallow
> > > writes to the mtd device without it. The only difference is that the pci
> > > driver will attempt to set the hardware bit without checking the
> > > module parameter first, while the platform driver does not. If the
> > > module parameter is not set however, the state of the hardware
> > > bit is never checked again.
> >
> > I think Daniel wants the PCI driver not to set the hardware bit by
> > default (same as the platform driver).
> 
> Sure, but *why*?

Because this is part of the platform firmware security check patch he is
also working on and, I guess making the flash chip writeable by default
is triggering some of the checks in that patch. Or something along those
lines ;-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
