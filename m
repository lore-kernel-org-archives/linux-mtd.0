Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1BBC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 16:05:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD852312F
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 16:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD852312F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mba.ocn.ne.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dsldo06AN9kvIBa4iW9TUiUtKcDgizeUVV99hCPPMmw=; b=Hv7XaZEOFocqWP16Hquiug3Eo
	vCHg6L3DPH03m9gHQpeBjVwlgGuHbMUE/g8dr+bUJ+ohDpRHCvqa+p+x/usD0IBvFOdxDlkCGhxat
	ffann2mnOTuVl23/GuTM1xeMrWTOAj2Uao0juckegNkq0Y9b17/8FCu4ionCAOGEFstXdTtS+mLuy
	DGcf60fNPRXl1cCeQ7L0qKL628v7VYDM8WKHhuupNYcIWBIlyHD3EMFTfwwPoT3CEgVRplUk50Ykl
	nKmQP6Z2dfA4zm8SqEu9rdGJ4neV+AC1QntE6jDGyuBKvZPrROyhGIx3eV80lKk/wp+uiKWeX8x1d
	Gkpaa2Axg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxBHP-0005Z0-Ii; Wed, 06 Jan 2021 16:03:23 +0000
Received: from mogw6101.ocn.ad.jp ([210.163.236.2])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxBHL-0005Wy-Ua
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 16:03:22 +0000
Received: from mf-smf-unw009c1.ocn.ad.jp (mf-smf-unw009c1.ocn.ad.jp
 [153.138.219.105])
 by mogw6101.ocn.ad.jp (Postfix) with ESMTP id 8CCA81E002A;
 Thu,  7 Jan 2021 01:03:15 +0900 (JST)
Received: from ocn-vc-mts-202c1.ocn.ad.jp ([153.138.219.215])
 by mf-smf-unw009c1.ocn.ad.jp with ESMTP
 id xBBQkW5DGUrLKxBHHke1vh; Thu, 07 Jan 2021 01:03:15 +0900
Received: from smtp.ocn.ne.jp ([153.149.227.167])
 by ocn-vc-mts-202c1.ocn.ad.jp with ESMTP
 id xBHGk2ikJIfvlxBHGkV6m2; Thu, 07 Jan 2021 01:03:15 +0900
Received: from localhost (p1601136-ipoe.ipoe.ocn.ne.jp [114.172.254.135])
 by smtp.ocn.ne.jp (Postfix) with ESMTPA;
 Thu,  7 Jan 2021 01:03:14 +0900 (JST)
Date: Thu, 07 Jan 2021 01:03:14 +0900 (JST)
Message-Id: <20210107.010314.1817045693815939591.anemo@mba.ocn.ne.jp>
To: geert@linux-m68k.org
Subject: Re: [PATCH 00/10] Remove support for TX49xx
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_110320_179587_996EA2FC 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, linux-rtc@vger.kernel.org, wim@linux-watchdog.org,
 herbert@gondor.apana.org.au, richard@nod.at, kuba@kernel.org,
 linux@roeck-us.net, linux-watchdog@vger.kernel.org, broonie@kernel.org,
 mpm@selenic.com, dan.j.williams@intel.com, perex@perex.cz,
 a.zummo@towertech.it, tsbogend@alpha.franken.de, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Geert!

On Wed, 6 Jan 2021 09:37:11 +0100, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Thomas,
> 
> CC Nemoto-san (de-facto TX49XX maintainer)
> 
> On Tue, Jan 5, 2021 at 3:03 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
>> I couldn't find any buyable product other than reference boards using
>> TX49xx CPUs. And since nobody showed interest in keeping support for
>> it, it's time to remove it.
> 
> I have an RBTX4927 development board in my board farm, boot-test every
> bi-weekly renesas-drivers release on it, and fix kernel issues when they
> appear.
> 
> Is that sufficient to keep it?

It have been about 10 years since last time I see any TX49 board :-)

AFAIK Geert is the last user of TX49 SoC.
I'm OK with whole TX49xx (and TX39xx) removal if Geert (or any other
users) agreed.

---
Atsushi Nemoto

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
