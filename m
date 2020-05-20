Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6330C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 13:50:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BDD207D4
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 13:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Anv1Keeq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59BDD207D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eL2sDBdX6rbYsJXFOw3yqbd17K36b6vqdLnIti95ZSk=; b=Anv1KeeqXTkmps
	qOKPLIBvArnLtLVnUBJhJbcGGxT1wFktdsb/pkDV7YrYyNzYBRpO4GsfHNg+6UAr45lJZEUfOLSUI
	Usod4uYxbLxnYQnP64sqNt1ntf7tmy4jEyg3fclfYY5fRmLPI4hQypEPSl8XbMojdjwF5SLh+fCxH
	QfucDy5a9WBgD7LUne2z+WF/EiNd2v/L1q1zgRjLL+N60KZoak+HrzU1Lm/vvT6SrICaofZDe0grD
	kGKw5kZGdvxjrwnJg6vhDY6RR5PAhC97WoJcKpCIrTdRAF6aWgmEod/imzEom5ehsktJy7QPTHYvN
	tcKMGQh8oIa6xhbJhBjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbP70-0002wI-1f; Wed, 20 May 2020 13:50:22 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbP6w-0002uM-Te; Wed, 20 May 2020 13:50:20 +0000
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M1Hi8-1jeAGd3voY-002oNA; Wed, 20 May 2020 15:50:14 +0200
Received: by mail-qt1-f174.google.com with SMTP id a23so2568945qto.1;
 Wed, 20 May 2020 06:50:13 -0700 (PDT)
X-Gm-Message-State: AOAM530iLmD2oybl050mFhj8h0oHwOHVp3OC2vlZF2Ig8doevWhMWP/R
 vQEN48ls95txqPl9DRDZEhiInGNEVSLn7U1ib0M=
X-Google-Smtp-Source: ABdhPJxxqV4S/myDq6Lb1ySZc31KSiwli3//hoNr/f4xbxhxpiZI/T3i5smvjUgJJOd7REsV9Fmw/UrFMnjryrBKv6c=
X-Received: by 2002:ac8:518f:: with SMTP id c15mr5149554qtn.142.1589982612708; 
 Wed, 20 May 2020 06:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200513170132.1446-1-robert.jarzmik@free.fr>
 <CAK8P3a3E=Fq6ZXLkeQgufeJCP0gZiN1uXA2J=HzpH3D49GOMXQ@mail.gmail.com>
 <87h7waoqin.fsf@belgarion.home>
In-Reply-To: <87h7waoqin.fsf@belgarion.home>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 May 2020 15:49:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2T=PWHFNvat2XDY4Br4v_WSjaooWVZH6mCTHSHdssnLA@mail.gmail.com>
Message-ID: <CAK8P3a2T=PWHFNvat2XDY4Br4v_WSjaooWVZH6mCTHSHdssnLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: pxa: remove Compulab pxa2xx boards
To: Robert Jarzmik <robert.jarzmik@free.fr>
X-Provags-ID: V03:K1:7Pab8Bv04QcLMiigP0i+ue2PcEym4Iv1+FioFuwv3KuBzWKfM1k
 dMAe+EQW2obfK9eU1MHgcaq3mA6p2siGS39NAELvkhj+iv0P6QhUQtSasbc6bK6PDslb9Ho
 gTyVaf63BIv0EdVeREA4LNDnb4fJF80tn3JTnUfu++v9pTDEXeVW5G7XLTWY33ztQH+Cu0y
 rD9SSxZyjeWclT5s8T9dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4Z4hLuAB8Ow=:5TgRZZbhqp9hrIxQ55sAe6
 jnseUpBSb3VCOlmzqUXnr5G3Sh+0ZB702YSdcGGhyxAKUQbvaJ/fkIcGaOQAtatV91xOl2VDP
 9GbT3i8cabVzgEjGRqDm1bHjHqvlytQWyqUOAeC/sPg2aaEGL95v1ZU1sK4XEOz26qWj7Fm1e
 UBzZHabx1tMLIheoSnrtdnL7tK8DrDMFTJW5QuEw3b3AwytcCmf+6q0/cLHkERrtxGNkjBvz2
 +ueCtgeGLYKeRKDT8vrnhO8x0kWNjNyUf32n3q/Q1Znc+jeOqRcftCI62UL4JRC129JHsQaVj
 PApgxs82527q6mWhraw74J8BsfSPrfng/wPREN/WyJoIX/YEhkW4P7g48D4eSGyhG6BoUL1E1
 Xwmd44ij15DENAYDr3xUzaLZtjyR/1Q5lbQ/QTEfECVoq7QW2N5YGW6zquTWlqN6pWpJnQa1R
 27eS7pIZ3r0iYvjwlvThhVqxhbAuMvR3sgs1TtHGVV22eOJMEJmwwXsUz68YK53Awe49Kwjvl
 97cVicptP3N91GWqgw8D+LfSTVf+NDwNVVcMsbXQjR8bNXmtVGccDiSn3Q4rvflF52Kyr2FnK
 pExgZ2jT+Lg0MB9X59lZ4bzw0fRUkOWF52LNmdSF5zxVDeSGcyPcFTAMHXntnzEXDGiMxbEcS
 us7jYeYZQfypkYQixkGIaSG/d3qdP6SSdG538Fypb+I7iHW3Osdo/qePII7PPOL6bRnIMVN30
 yYnEVx1u91jzlzd/uhik39IypDa7t+L64yEVwRivmRiK4m9YOW7RGgK50Z0moLnRNs/qN4iqK
 k56P2LOlEIPNG/nQy5Bm1XZ3xP2YAt0UhxBZzNNRsKJd4uI5nc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_065019_250634_D18A454B 
X-CRM114-Status: GOOD (  16.40  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, igor <igor@compulab.co.il>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Mike Rapoport <mike@compulab.co.il>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 20, 2020 at 12:22 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> >
> > FB_MBX can still be selected, but there are no boards defining
> > the platform data any more, so I'd like to remove that as well.
> That should be dealt with another time, sorry.
>
> >> -static struct spi_board_info spi_board_info[] __initdata = {
> >> -       [0] = {
> >> -               .modalias       = "rtc-max6902",
> >> -               .max_speed_hz   = 1000000,
> >> -               .bus_num        = 1,
> >> -               .chip_select    = 0,
> >
> > Another last reference, so we can remove that the corresponding driver.
> Another patch serie for this as well.

Ok, no problem, as long as someone remembers to do it.

> > Same here, there is still one more user left (MACH_ZIPIT2), though
> > at some point that might get removed if we decide to drop the handhelds
> > with 32MB RAM or less.  That is probably something to be left for
> > another time, but I see that pxa_defconfig produces a 9.5MB kernel
> > image, so this is getting rather tight, and 32MB wasn't much when this
> > got added in 2010.
> Yeah, but no PXA user would ever use the pxa_defconfig kernel :)
> A typical kernel for a PXA board is right now around 4MB, which is very tight
> for 32MB platforms, and just enough for 64MB ones.

Makes sense.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
