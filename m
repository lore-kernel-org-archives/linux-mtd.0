Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CACCF3180
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRpOhS1Y9RJ/kVS/wtCq+7GnteqrfxE5g86NZ590res=; b=GtQiVwbLvgjXmo
	JFn3rTYCRJjYDr+bu+PV6DdBbZRvzq5RZQlNsTicWOfaAOPNRDHSBJHMlQ7Uv4BQNzBrTQ8rIi0S4
	6uGWsJ82Vg+u4qWpGnuasoZPMr77Y09jN0Rb0ye0Ow+nK81DZym2s9yZY4eR8kNPBi77jqIVRVUha
	Hbr68+OnonockkL6hqVijleuPdHmOUknBKgNEfzDM5wFYTphqLYwjDjxhCecGXup6De33mQPXf1QC
	7Pdw53ndJ8vHULrEk9Bl35zG7widqIseGFSgtFKvWmLWKn9iFn7BuPvGW8rt1OnUfGxXAG+K399X1
	cxGdOBePkASwFz967pAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjcf-00000004150-0T6C;
	Tue, 01 Oct 2024 20:37:29 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjcb-0000000414M-3olo;
	Tue, 01 Oct 2024 20:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=7fnSGYhniQwLAJoqqmgeDP6zdAognPdAB/UHbLqgj10=; b=nwQ9EuUczb92u4w9
	OxhpSgqKBefhixFpJfhHESG9v2gP0xrDG4pfFb8At2gpuq9hXgrIOtgl6qrjGyT5s39I+Y6QCQY6X
	7lv4o/A/K1m0TnOm8cUnQq7TtDf+0iOlp/udMQ211uEH4rp6Dg6A7ooHpWO41uZuyk6Esskm51emU
	zDxDaipqvy++8DHQiDWlS5pdZPCHes7IV6fti+RsWiJIcuc1mepUwkUHNxsVhhomju+voXmveHG/F
	ACGFonZ8pAOtDedSuViBhxENqhrQPhcINwRRNFgBoU07MJ0sWd5eFZt8Bv6l4ZIgyTAmptrZDBD6f
	mXtk7m27mP9tPrEb1A==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1svjcU-008Jvz-3A;
	Tue, 01 Oct 2024 20:37:18 +0000
Date: Tue, 1 Oct 2024 20:37:18 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: nicolas.ferre@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: of atmel_pmecc_destroy_user
Message-ID: <Zvxdfh3FobjpvcRb@gallifrey>
References: <ZvmIvRJCf6VhHvpo@gallifrey>
 <20240930090817.0a86e538@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930090817.0a86e538@collabora.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 20:36:38 up 146 days,  7:50,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_133726_059227_DCB8E1C6 
X-CRM114-Status: GOOD (  21.13  )
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

* Boris Brezillon (boris.brezillon@collabora.com) wrote:
> Hi David,
> 
> On Sun, 29 Sep 2024 17:05:01 +0000
> "Dr. David Alan Gilbert" <linux@treblig.org> wrote:
> 
> > Hi Boris and co,
> >   One of my scripts noticed that 'atmel_pmecc_destroy_user'
> > isn't called anywhere; I was going to delete it, but hmm, I wonder
> > if it's actually a missing call and leaking (in the unlikely case
> > the device was ever removed).
> > 
> > It was added by your:
> >   commit f88fc122cc34c2545dec9562eaab121494e401ef
> >   Author: Boris Brezillon <bbrezillon@kernel.org>
> >   Date:   Thu Mar 16 09:02:40 2017 +0100
> > 
> >     mtd: nand: Cleanup/rework the atmel_nand driver
> > 
> > and I see the allocation in:
> >      user = kzalloc(size, GFP_KERNEL);
> >        in
> >      nand->pmecc = atmel_pmecc_create_user(nc->pmecc, &req);
> >        called in atmel_nand_pmecc_init
> >          from atmel_nand_ecc_init
> >            from atmel_hsmc_nand_ecc_init
> >  
> > But I don't see any freeing.
> > 
> > (I don't knowingly have hardware to test a fix, although I guess
> > there's probably one somewhere....)
> > 
> > Suggestions?
> 
> There's definitely a leak. I haven't looked at NAND stuff for a while
> though, so I'll let Miquel advise you on where
> atmel_pmecc_destroy_user() should be called.

I see Miquel has posted a fix.

Thanks to both of you!

Dave

> Regards,
> 
> Boris
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
