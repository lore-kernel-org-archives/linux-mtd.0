Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E373C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:10:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00C561163
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E00C561163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyaqAOuyNRCKCQ65AJcLAPOrqyiALlzOaiXw2EhHZKA=; b=Kz8wvJPbdCKmMW1qoT/YNdcn7d
	13pt6QeoNDEmjBCD1wAyDWwzlzInsrazF6GWi0G8ICBAWRril1sUtJCesMdUokxFZi6kw6HZ7Y+Cf
	wjPAJuN9LfJw/PAFNhCReujhuyVoVUQ4jVoWq8g+PN99jKkvqZYBk15hHIsoIo6t/eLRUapsEr/kq
	a5wESJP/h5b8lTdYPl2daJi1BCkx2k7sExj4rPj4hUxB1f01YzNk/CJ6IPfn1DqMAO71cv1oJLiOq
	8oyA59LkgcBrM54cUT8nox8eLgsMf55tnxN6a61etc+3le4aCRAOWZSQ6cfQVv2KCCGpC9l+lVqL+
	2EwWCqoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljlEt-001sb7-BZ; Thu, 20 May 2021 16:09:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljlDG-001rx1-Gc
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 16:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=dqQqf+xwNr5+tc7iMkdvF7M5CEpc+53jAEhWc1nWGf4=; b=O4fvE56+bQ+CC4wW6ftDbaBYM8
 T0OKZdrEHahkm3Oyi7sQM8LNWElLo2T+7ggMhc1q0vdq1bejT/9sRbI6IkS65fYyBOxfcqCmTgKMW
 9r0XyY3utbUb40el6Orkn08zfvbzniGG1MRri5JEfvrHeMAEd2Tnrw8zV4P6DoVPjZL1zEhmi6ECX
 +5S1RERcG/pLLj5EveDcksMqvBALNXC1RxrLryafkj5wm02S1P2g92QHcJk/YMyY8g8ITfRDwRwqj
 azR4tasFoN7GvnOaEAnm5FHdQOfxIkXx6HGuoWoq/9YAWw+z6doSK0SBqb4m8gS8pHWWmsf5w+ewY
 oTRFrhWA==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljlDD-00GUnw-If
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 16:07:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 49F5C6000F;
 Thu, 20 May 2021 16:07:48 +0000 (UTC)
Date: Thu, 20 May 2021 18:07:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Corentin Labbe <clabbe@baylibre.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 R <vigneshr@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: partitions: redboot: fix style issues
Message-ID: <20210520180747.03fd60b8@xps13>
In-Reply-To: <CACRpkdZhhNQupN_4Oh759bKL7sEM9M=yOW1y-mT69ugEkjRMZw@mail.gmail.com>
References: <20210520114851.1274609-1-clabbe@baylibre.com>
 <20210520114851.1274609-2-clabbe@baylibre.com>
 <CACRpkda6ou1SJZzBwHXN_kWofnFw8w7XAkr7VcFO2NrqbQug_Q@mail.gmail.com>
 <20210520173619.26870bc8@xps13>
 <CACRpkdZhhNQupN_4Oh759bKL7sEM9M=yOW1y-mT69ugEkjRMZw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_090751_782379_036D8422 
X-CRM114-Status: GOOD (  16.08  )
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


Linus Walleij <linus.walleij@linaro.org> wrote on Thu, 20 May 2021
18:00:04 +0200:

> On Thu, May 20, 2021 at 5:36 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > Linus Walleij <linus.walleij@linaro.org> wrote on Thu, 20 May 2021
> > 17:24:26 +0200:  
> > > On Thu, May 20, 2021 at 1:49 PM Corentin Labbe <clabbe@baylibre.com> wrote:
> > >  
> > > > This patch fixes easy checkpatch issues.
> > > >
> > > > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>  
> > > (...)  
> > > > -    uint32_t     flash_base;    // Address within FLASH of image  
> > > (...)  
> > > > +       u32       flash_base;    // Address within FLASH of image  
> > >
> > > Does checkpatch complain about this? At one point the MTD maintainer
> > > disliked the u32/u16/u8 types and explicitly wanted to use the C
> > > standard library types, and it's the kind of eccentric maintainer
> > > deviations we accommodate for.  
> >
> > I suppose this happened quite some time ago? :)
> >
> > I've never heard Richard nor Boris complaining about it, nor will I.  
> 
> Yes that was a specific David Woodhouse preference.
> I'm too old!

Don't be sad, the new trend is to be sleek. In the dark I worship
variables declaration in a reverse Christmas tree order ;-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
