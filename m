Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244E9C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 18:50:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 754FB23124
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 18:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 754FB23124
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fvI3TrR1MzllcDewv9QqaYeOjNW6NucYpAsAIjkzqoM=; b=1Tjq3H4uav6yng6rYlngpXnRz
	jArgS2OgVW8BsY0MD5LbmxOtSmrewIBTMQezyInd2F9m10p0abhriYstYPgKymnb+r7B52M8v75Rd
	3F274C5sQ4lx5g9SNVu877Vzg4mfuipn35wS3zYUJ0t6vYvm3Q2wPKSle3597lSKMyMciTBE2W8k7
	XWm20S6alx8jPnFlxOOyu3eI3ziC+/nJvXs5h8LpGU6p3Ulrqw2kK7njnqEWbt2eCK/CoTU1xti1C
	3hx2QmGycgSDrPFma1woh31uNFMPfqUmHlgB2mHyDvTzY+wmm7WkgqfrCTiLGhj4Zx4xe0lubf7XE
	nlOtZym6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxDrw-0003rd-0A; Wed, 06 Jan 2021 18:49:16 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxDrt-0003r3-7i
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 18:49:14 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kxDra-0005fm-00; Wed, 06 Jan 2021 19:48:54 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 4B798C0808; Wed,  6 Jan 2021 19:48:39 +0100 (CET)
Date: Wed, 6 Jan 2021 19:48:39 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] Remove support for TX49xx
Message-ID: <20210106184839.GA7773@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_134913_493685_5D3EE5DC 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, linux-ide@vger.kernel.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-spi <linux-spi@vger.kernel.org>, linux-rtc@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev <netdev@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dmaengine <dmaengine@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 06, 2021 at 09:37:11AM +0100, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> CC Nemoto-san (de-facto TX49XX maintainer)
> 
> On Tue, Jan 5, 2021 at 3:03 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > I couldn't find any buyable product other than reference boards using
> > TX49xx CPUs. And since nobody showed interest in keeping support for
> > it, it's time to remove it.
> 
> I have an RBTX4927 development board in my board farm, boot-test every
> bi-weekly renesas-drivers release on it, and fix kernel issues when they
> appear.
> 
> Is that sufficient to keep it?

for me it is. But now we probaly need some reverts then...

I wonder whether you have seen my mail about the removal

https://lore.kernel.org/linux-mips/20201207105627.GA15866@alpha.franken.de

and my call for people owning MIPS machines

https://lore.kernel.org/linux-mips/20200227144910.GA25011@alpha.franken.de/

Still "unclaimed" machines are

IMG Pistachio SoC based boards (MACH_PISTACHIO(
Toshiba TX39 series based machines (MACH_TX39XX)
NEC VR4100 series based machines (MACH_VR41XX)
Netlogic XLR/XLS based systems (NLM_XLR_BOARD)
Netlogic XLP based systems (NLM_XLP_BOARD)
Sibyte BCM91120C-CRhine (SIBYTE_CRHINE)
Sibyte BCM91120x-Carmel (SIBYTE_CARMEL)
Sibyte BCM91125C-CRhone (SIBYTE_CRHONE)
Sibyte BCM91125E-Rhone (SIBYTE_RHONE)
Sibyte BCM91250C2-LittleSur (SIBYTE_LITTLESUR)
Sibyte BCM91250E-Sentosa (SIBYTE_SENTOSA)

Is there something on this list you also regulary use ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
