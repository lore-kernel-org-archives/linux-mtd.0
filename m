Return-Path: <SRS0=uqc5=GK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4224CC433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 16:42:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D696723403
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 16:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D696723403
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AALwNwl9SzX0Mijod+VTBi7cWDfDRBEOIcs74XsNwYU=; b=0E2fp/NtVZLTZxGb+w54DjVim
	08/ojVD3j5g9JLcXcWgGsNJygIQrOZQDi9ocjQt2fGPtB63gynkwpo8wiTRVEXUSgNYcfmXrNX2Cr
	1m8iUpvf5/oo2MWk26OVsznJ+EOmuFJJKV4H460gxozPAsqS5jr+d4Z/jR5kVu/vfpwmZp1nVipSM
	6Qphaq0SiKKH2fpmi2/dI7OvM6Wsc3RDIWcs0rNLeB24B3v6eQZ7ahH06mV2sAlQfsovI4fuGP3eZ
	Sx/8Opu2neC5cc+i5BwPqO7zYI6Dagk7/VPPjT+yOVF/a9o1f/GkF0mfVhHPN6mei+/4UptU73yxH
	p4rNhiiUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxYLI-0007Ye-IG; Thu, 07 Jan 2021 16:40:56 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxYLG-0007Y6-Oj
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2021 16:40:55 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kxYL4-0000Tv-00; Thu, 07 Jan 2021 17:40:42 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 98E5BC080E; Thu,  7 Jan 2021 17:40:15 +0100 (CET)
Date: Thu, 7 Jan 2021 17:40:15 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 05/10] dma: tx49 removal
Message-ID: <20210107164015.GA12533@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-6-tsbogend@alpha.franken.de>
 <b84dadc2e98b1986dc800c5f6f202880ed905b38.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b84dadc2e98b1986dc800c5f6f202880ed905b38.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_114055_061844_38C9FDAA 
X-CRM114-Status: GOOD (  16.80  )
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
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org,
 linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 "David S.  Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 06, 2021 at 11:10:38AM -0800, Joe Perches wrote:
> On Tue, 2021-01-05 at 15:02 +0100, Thomas Bogendoerfer wrote:
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> []
> > diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
> []
> > @@ -26,11 +26,6 @@
> > =A0=A0* DMA channel.
> > =A0=A0*/
> > =A0
> > =

> > -#ifdef CONFIG_MACH_TX49XX
> > -static inline bool txx9_dma_have_SMPCHN(void)
> > -{
> > -	return true;
> > -}
> > =A0#define TXX9_DMA_USE_SIMPLE_CHAIN
> > =A0#else
> > =A0static inline bool txx9_dma_have_SMPCHN(void)
> =

> This doesn't look like it compiles as there's now an #else
> without an #if

you are right, no idea what I had in mind while doing that.

Vinod,

as this patch series found a still active user of the platform,
could you drop the patch from your tree, or do you want a revert
from me ?

Thomas.

-- =

Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
