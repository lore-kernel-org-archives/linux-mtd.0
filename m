Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF82C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 20:19:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8197061353
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 20:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8197061353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4rJdPPzhIVwP89qDR4pH35Tgp/NJyVxbR8f8dfnIj7k=; b=bZFu2uM67FFbok12O58RR6BMm
	qYPy3LTHw0DanbEZNm/QAi7h5MuwhSJb6/RGxCp0xwN0Uy0p76+z4dVZZWWlkKPxSo2U9R5dJV863
	Bv/lI+aC/ZE3lqYlSqkP6l8Z0aBicz8PXnFi4Cg6cxe+3hCcB+4Ain7O8do1W/Nuw8ytkvC0NQ9ML
	LFLFGJk3nIy58jFd6V+MSU2Z/4/9B3oVfkkDJ3YgzNUvMQhD96JvYrBOsaTJ7tVumX6BnSBGqOj9b
	1GoD3aS1OaNsq6JP+1a7KO5XgqeHGCVTQ3h2DhXfJoce4pxO6ikBksfZWiOx9Q0rx1tT/sIabNKXc
	cxy173hHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgYpH-001FgV-FK; Tue, 11 May 2021 20:17:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgYpD-001FfW-6V
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 20:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pn2T7RjCqlvBKQU9JVCLFMeOwLsu2f1eRwDm6/pzWl0=; b=OhpqLM9QVjUUoDb4fLtsBxwS4H
 BV9cjcLdj1OuKs9kPzyOOlGlB2m9trysVBznJRh0gQ0n+rDBmrV8hPAZTJJ7jjpPxxDJjIEe5qxde
 YzjsBw31Mvl9AqM/5tygxugn6OCzcLmMzJRod0/eYXJ9Bl6QW0EF8G4Y7lC9VZEhBwRVBJ9tmGox/
 VhfLrXoyCPNeVIJSYlAUfB67lbge36EQtLQU8aX+CN1QGXIT3+LrJdbUJXfPy98tjjwYzKf+x/bli
 i1bS5fvjp7K52vilrKaRN+1KbmcoiLzBbiujIi6knUgCnpoWjprDK6jg3tZAznykdV/zh1gOp95wM
 AJ/QEPCA==;
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgYp9-009tlS-86
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 20:17:48 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1lgYoz-0000ck-It; Tue, 11 May 2021 22:17:38 +0200
Date: Tue, 11 May 2021 21:17:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Jan Kara <jack@suse.cz>,
 Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v4] mtd: super: don't rely on mtdblock device minor
Message-ID: <YJrmU6Cw42CZdzAr@makrotopia.org>
References: <20210510121837.14274d4f@xps13> <YG9qzC/SaD7SNWVm@makrotopia.org>
 <YHRj5MUb5MGdPQqw@makrotopia.org> <YJmx3Ru/5oyq6Y1a@makrotopia.org>
 <20210511054955.GA6542@lst.de> <YJo42y+lP9peFlkd@makrotopia.org>
 <20210511164248.GA18867@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511164248.GA18867@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_131747_312981_8FB364E2 
X-CRM114-Status: GOOD (  22.01  )
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

On Tue, May 11, 2021 at 06:42:48PM +0200, Christoph Hellwig wrote:
> On Tue, May 11, 2021 at 08:57:15AM +0100, Daniel Golle wrote:
> > > Why are you changing the legacy lookup method that is clearly deprecated
> > > in favor of the mdt* syntax?
> > 
> > Because it breaks if part_bits != 1 and despite being legacy, it should
> > not break (it would open the wrong MTD device).
> 
> Or we should just drop it if it doesn't even work.

It does work for the (most common) case part_bits == 1.
Dropping it is a good option imho, we would need to make changes in
OpenWrt to no longer depend on it, but well, that's life ;)

> 
> > I do check the major number above to be MTD_BLOCK_MAJOR, and in that
> > case I assume that my expectations towards private structure will hold
> > true. If not, please enlighten me.
> 
> No, you can't.  There's always the chance some other driver grabs
> the major.  Take a look at what e.g. ubd does to grab the IDE major.

IDE with it's 10 majors and a huge load of legacy code involved doesn't
seem to be the prime example... I generally find *_MAJOR being
hard-coded via pre-compiler macros and actually quite a lot of code
seems to make assumptions about the backing driver based on the device
major number used.

Anyway, as the same shortcomming (assuming MTD_BLOCK_MAJOR is only used
by mtdblock driver) also affects the existing code and I'm not aware
of any other way to check the backing driver, I guess dropping that
legacy hack is indeed the only good option left.

MTD folks: please advise if you agree that this would be the way
forward to clean up things for part_bits != 1 to work.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
