Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898C3C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 20:42:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 371F923133
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 20:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 371F923133
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/+FdYsWjsEnXZRjUq8014HyLtGrCT1wSlWDXy23trDI=; b=uMnPnp+1YVy5kDpBK6FagQ9yQ
	ZCzR8ZFVrnPLxFET3ISGcSTS8zDCzRk3WCSbol7JZROZFVd+EJqKF045VrDxcRL+xXlbQAfLG5xik
	mSt8wuBZrSVGI2e8guhPbLauPvijeE+Zqk2lHfJ5RgS88Mb0NnXCij3jnV+OMVNsz5X+96KrUlcl4
	vwrukvIjVt9QPWb7pQ9DrLdJNG4R2IsEXCTjGVcRH+vtuLtlUH+hZaLKxkClmI9pJdjWUHfICzG5r
	X/0P2XvSp4UMou3p33nURmUHoO1lJI/C13xquIDBxBI8epvBXabeFNWzPoStc2SK/c/1U6fYrQwMv
	1CW7RKj8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxFch-0005yq-PA; Wed, 06 Jan 2021 20:41:39 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxFce-0005yK-Oa
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 20:41:37 +0000
Received: by mail-ot1-f52.google.com with SMTP id i6so4296050otr.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2021 12:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+nn1mS9duynrGzRRIiFhGe9v+GbfGVRWJu+NZK2hPWU=;
 b=jb2hUQPnostxVaUIb+nDb9S2AJasDJC5w7aQ18M/hYblTa9/tqrFwwGL9JERYkgtQl
 9iJ+K2BItUInuVc/AR7adGc3swfyxDGzxQNbJfd3/7yo1iNbuK+h8N4iXVwAicYxqHRN
 Xx/o7ZLJ+Ox8xM8EDiSf+UnhccBBRLfDrP09t9QbC6kCCqvammUlGvSvrXfQG6dc2Xm5
 QGBpNZdFPvkZs6+4B5BAyqVGHilUs31zmDmRPeUZyQ9Ed4G9rAVN9NZe+qrkGQTdejp7
 tXvQ4tMH1aPLVQbQO9uLWEzH9QLG4pH0E4QN8XSyzOMj0EzearcAO2IcWtrMWgy8klmm
 v6CA==
X-Gm-Message-State: AOAM53100d+zEMJBA51l8gMYGG32RUIAaiPkvGVvd6J3iJhfm/5v2ZQT
 xZUeb4a2WC0gQXOemw4tkIiwN+aWWQvacjn5viI=
X-Google-Smtp-Source: ABdhPJzU2VNqomItTpW9N5EsZUcSxwbWydRvzmZvuW0h6PN+1EDrO5WVGcImI85plCOq8i6uJPLffPJf+e8BxB/lkhA=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr4549619oth.250.1609965695506; 
 Wed, 06 Jan 2021 12:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
 <20210106184839.GA7773@alpha.franken.de>
In-Reply-To: <20210106184839.GA7773@alpha.franken.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jan 2021 21:41:24 +0100
Message-ID: <CAMuHMdV86BES7dmWr-7j1jbtoSy0bH1J0e5W41p8evagi0Nqcw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Remove support for TX49xx
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_154136_824836_5DD55E78 
X-CRM114-Status: GOOD (  23.89  )
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

Hi Thomas,

On Wed, Jan 6, 2021 at 7:49 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Wed, Jan 06, 2021 at 09:37:11AM +0100, Geert Uytterhoeven wrote:
> > On Tue, Jan 5, 2021 at 3:03 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > > I couldn't find any buyable product other than reference boards using
> > > TX49xx CPUs. And since nobody showed interest in keeping support for
> > > it, it's time to remove it.
> >
> > I have an RBTX4927 development board in my board farm, boot-test every
> > bi-weekly renesas-drivers release on it, and fix kernel issues when they
> > appear.
> >
> > Is that sufficient to keep it?
>
> for me it is. But now we probaly need some reverts then...

Indeed. Fortunately not all of it, as some removals were TX4938-only.

> I wonder whether you have seen my mail about the removal
>
> https://lore.kernel.org/linux-mips/20201207105627.GA15866@alpha.franken.de
>
> and my call for people owning MIPS machines
>
> https://lore.kernel.org/linux-mips/20200227144910.GA25011@alpha.franken.de/

Sorry, I'm not following the linux-mips list that closely, so I hadn't
seen them.  It's always a good idea to CC linux-kernel, and perhaps the
few people who last touched the affected files.

> Still "unclaimed" machines are
>
> IMG Pistachio SoC based boards (MACH_PISTACHIO(
> Toshiba TX39 series based machines (MACH_TX39XX)
> NEC VR4100 series based machines (MACH_VR41XX)
> Netlogic XLR/XLS based systems (NLM_XLR_BOARD)
> Netlogic XLP based systems (NLM_XLP_BOARD)
> Sibyte BCM91120C-CRhine (SIBYTE_CRHINE)
> Sibyte BCM91120x-Carmel (SIBYTE_CARMEL)
> Sibyte BCM91125C-CRhone (SIBYTE_CRHONE)
> Sibyte BCM91125E-Rhone (SIBYTE_RHONE)
> Sibyte BCM91250C2-LittleSur (SIBYTE_LITTLESUR)
> Sibyte BCM91250E-Sentosa (SIBYTE_SENTOSA)
>
> Is there something on this list you also regulary use ?

No, I don't have anything from the list above.
The RBTX4927 is basically my last MIPS-based system I do boot
current kernels on.

In active use, not for development:
  - Ubiquiti EdgeRouter-X (Ralink-based).

Stored in my attic:
  - NetGear WNDR4300 (AtherOS-based),
  - MikroTik Routerboard 150 (ADMtek-based, no (longer?) supported upstream),
  - NEC DDB VRC-5476 (upstream support removed 15 years ago ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
