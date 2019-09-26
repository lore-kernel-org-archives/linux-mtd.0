Return-Path: <SRS0=cKKb=XV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971D4C432C2
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2019 09:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695A2222C0
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2019 09:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QX6wJx94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 695A2222C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=krieglstein.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzfdCKzRNr/O2bPaEM7pczkXd/gkACMClGHnhpqYt5s=; b=QX6wJx94rONeET
	jRc5kkcbhWFS3IZOkbNAYnESghqBHIzR3rwk3uhM4qIxp8L0FqnQCDwPimSur2UdU2vzjrFdjHJus
	omT4kYpkO08nvCrLwzvPkFH/wA9GeaVe1oDx5FjH6WFSSJGNwcRRwzOMUtVoUlTsNkGJ9VYEtuuwn
	jymMMaP1xSwdzzgVe7sOL+3F+hESB0QDjrQiz+cW+I/Qk9yRVvNjd4QxQ6Uadr0QyjxFVaTgMuHRo
	tcI0UxtGVNfRRARdw5qWUdT2+3Dp+sJnk/YEW8xTiqbsTUfSDQOLh0QVkgDRCYJj4iXDerL278cox
	C2ZS/LVQRI0eAtEZepSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDPnw-0001sW-G2; Thu, 26 Sep 2019 09:11:16 +0000
Received: from krieglstein.org ([188.68.35.71])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDPnq-0001r1-V3
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2019 09:11:13 +0000
Received: from dabox.localnet (gateway.hbm.com [213.157.30.2])
 by krieglstein.org (Postfix) with ESMTPSA id B297D401B1;
 Thu, 26 Sep 2019 11:10:34 +0200 (CEST)
From: Tim Sander <tim@krieglstein.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: mtd raw nand denali.c broken for Intel/Altera Cyclone V
Date: Thu, 26 Sep 2019 11:10:34 +0200
Message-ID: <23083624.r2bJSIadJk@dabox>
Organization: Sander and Lightning
In-Reply-To: <CAK7LNARCPwqY+YmUzsHkABpshzzS3tC=fDgp4vZjVgBwS+LKJw@mail.gmail.com>
References: <5143724.5TqzkYX0oI@dabox>
 <9bb2fb0e-a9e7-c389-f9b7-42367485ff83@kernel.org>
 <CAK7LNARCPwqY+YmUzsHkABpshzzS3tC=fDgp4vZjVgBwS+LKJw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_021111_300897_12E6B0D7 
X-CRM114-Status: GOOD (  30.67  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi 

Am Mittwoch, 11. September 2019, 04:37:46 CEST schrieb Masahiro Yamada:
> Hi Dinh,
> 
> On Wed, Sep 11, 2019 at 12:22 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
> > On 9/10/19 8:48 AM, Tim Sander wrote:
> > > Hi
> > > 
> > > I have noticed that my SPF records where not in place after moving the
> > > server, so it seems the mail didn't go to the mailing list. Hopefully
> > > that's fixed now.> > 
> > > Am Dienstag, 10. September 2019, 09:16:37 CEST schrieb Masahiro Yamada:
> > >> On Fri, Sep 6, 2019 at 9:39 PM Tim Sander <tim@krieglstein.org> wrote:
> > >>> Hi
> > >>> 
> > >>> I have noticed that there multiple breakages piling up for the denali
> > >>> nand
> > >>> driver on the Intel/Altera Cyclone V. Unfortunately i had no time to
> > >>> track
> > >>> the mainline kernel closely. So the breakage seems to pile up. I am a
> > >>> little disapointed that Intel is not on the lookout that the kernel
> > >>> works
> > >>> on the chips they are selling. I was really happy about the state of
> > >>> the
> > >>> platform before concerning mainline support.
> > >>> 
> > >>> The failure starts with kernel 4.19 or stable kernel release 4.18.19.
> > >>> The
> > >>> commit is ba4a1b62a2d742df9e9c607ac53b3bf33496508f.
> > >> 
> > >> Just for clarification, this corresponds to
> > >> 0d55c668b218a1db68b5044bce4de74e1bd0f0c8 upstream.
> > >> 
> > >>> The problem here is that
> > >>> our platform works with a zero in the SPARE_AREA_SKIP_BYTES register.
> > >> 
> > >> Please clarify the scope of "our platform".
> > >> (Only you, or your company, or every individual using this chip?)
> > > 
> > > The company i work for uses this chip as a base for multiple products.
> > > 
> > >> First, SPARE_AREA_SKIP_BYTES is not the property of the hardware.
> > >> Rather, it is about the OOB layout, in other words, this parameter
> > >> is defined by software.
> > >> 
> > >> For example, U-Boot supports the Denali NAND driver.
> > >> The SPARE_AREA_SKIP_BYTES is a user-configurable parameter:
> > >> https://github.com/u-boot/u-boot/blob/v2019.10-rc3/drivers/mtd/nand/raw
> > >> /Kcon fig#L112
I am using barebox for booting. I looked at the code and found a comment in 
denali_hw_init: 
         * tell driver how many bit controller will skip before
         * writing ECC code in OOB, this register may be already
         * set by firmware. So we read this value out.
         * if this value is 0, just let it be.

I have checked the barebox code and the denali register SPARE_AREA_SKIP_BYTES 
(offset 0x230) is read only once on booting. I have not found any occurrence of 
the register being set by barebox. So i would concur as the value is zero in 
my case that the boot ROM seems not to set the value. The code in barebox is 
mostly imported from linux in 2015 which is before the reorganization which 
happened on the linux side later on.

> > >> 
> > >> 
> > >> Your platform works with a zero in the SPARE_AREA_SKIP_BYTES register
> > >> because the NAND chip on the board was initialized with a zero
> > >> set to the SPARE_AREA_SKIP_BYTES register.
> > >> 
> > >> If the NAND chip had been initialized with 8
> > >> set to the SPARE_AREA_SKIP_BYTES register, it would have
> > >> been working with 8 to the SPARE_AREA_SKIP_BYTES.
> > >> 
> > >> The Boot ROM is the only (semi-)software that is unconfigurable by
> > >> users,
> > >> so the value of SPARE_AREA_SKIP_BYTES should be aligned with
> > >> the boot ROM.
> > >> I recommend you to check the spec of the boot ROM.
> > > 
> > > We boot from NOR flash. That's why i didn't see a problem booting
> > > probably.
> > > 
> > >> (The maintainer of the platform, Dihn is CC'ed,
> > >> so I hope he will jump in)
> > > 
> > > Yes i hope so too.
> > 
> > I don't have access to a NAND device at the moment. I'll try to find one
> > and debug.
I have hardware available to me, so i would be happy to test any ideas/
guesses.

> Dinh,
> Do you have answers for the following questions?
> 
> 
> - Does the SOCFPGA boot ROM support the NAND boot mode?
> 
> - If so, which value does it use for SPARE_AREA_SKIP_BYTES?

Best regards
Tim





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
