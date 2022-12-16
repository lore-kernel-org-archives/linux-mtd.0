Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CEBC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6R/kUH4DtHDOwQ/laxJTSv9XIxgxLspzhxW06Gjx9/c=; b=HpSspqzbitaWiH
	Jq6T7spitdvCaxlBTduOW30QKyAQ33Y7eHXmz6mGgc/nHQj8XOaMQ2pqatGDJeZBAkEnNMwAFNsOm
	ALxz8HNyq3TOaUZVcSR4T+BgZdtY9LLn+TzciMp6cLnDrDFCXCtrJeFXtOPOPh2Z9ykzgQbm5uJqb
	E2wTLfiZMcW6GTM9W1GViJcbGvxIQeUJuU1dgRHMeW5XIx9Sh52x0KxWYhR+SJt7IzrCqGnHe7W/y
	vdiQB26dhJV/uPF+1RiNY28of4tkn8N/3cDSrRrHgBTcFyem5IKypQPhJDMSUL20y3j3xTvGPrbR1
	9zUHrVytd9kHWlnL9Rkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69yO-00Ex1L-3L; Fri, 16 Dec 2022 12:37:56 +0000
Received: from smtp-out-03.comm2000.it ([212.97.32.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69yB-00Ewww-Ln; Fri, 16 Dec 2022 12:37:45 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id 58526B43495;
	Fri, 16 Dec 2022 13:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1671194258;
	bh=kDORtdg4hjythgYzGqCY1n8MJSAxGyPQa2nVmtNblHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ash002jd2Njm2tORVDlkgLXhBEB+YEbrXj1jTZZLB0+JKH3Gf7IqdT8c99AUEvwTJ
	 OVAZ+nE6tpmM1OiAkC0HbEPr0+1FJAUotKZG1HtMdxyJIPW2XARvtjI8ldjpJRNYlu
	 xthK4C+p7dy3IREqtoI8ceTSddaQZtEqvCD4qlEyrPViHg6s5U09WQUhoaOkxn3Hxo
	 XMvDqY6nEEVNRIP5WtQw012W0aBuIUQ6tvrTROEYC8+IJ85dTocAAG0zYFTDVzRZ8F
	 qJV2SOf5o+BhtwW5jsp1YQUPDH6k1kQi5OF0s+RYFNAIkYaYxsdwLOJTWI9Czt0Ds3
	 XEVd6KzRIV+cw==
Date: Fri, 16 Dec 2022 13:37:31 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
 <6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
 <20221216120155.4b78e5cf@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221216120155.4b78e5cf@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_043743_903683_EBB07999 
X-CRM114-Status: GOOD (  46.97  )
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

On Fri, Dec 16, 2022 at 12:01:55PM +0100, Miquel Raynal wrote:
> marex@denx.de wrote on Fri, 16 Dec 2022 11:46:18 +0100:
> > On 12/16/22 08:45, Francesco Dolcini wrote:
> > > On Thu, Dec 15, 2022 at 08:16:04AM +0100, Miquel Raynal wrote:  
> > >> I am still against piggy hacks in the generic ofpart.c driver, but
> > >> what we could do however is a DT fixup in the init_machine (or the
> > >> dt_fixup) hook for imx7 Colibri, very much like this:
> > >> https://elixir.bootlin.com/linux/latest/source/arch/arm/mach-mvebu/board-v7.c#L111
> > >> Plus a warning there saying "your dt is broken, update your firmware".  
> > > 
> > > I have a couple of concerns/question with this approach:
> > >   - do we have a single point to handle this? Different architectures are
> > >     affected by these issue. Duplicating the fixup code in multiple place
> > >     does not seems a great idea
> > >   - If we believe that the device tree is wrong, in the i.MX7 case
> > >     because of #size-cells should be set to 0 and not 1, we should not
> > >     alter the FDT. Other part of the code could rely on this being
> > >     correctly set to 0 moving forward.
> > > 
> > > If I understood you are proposing to have a fixup at the machine level
> > > that is converting a valid nand-controller node definition to a "broken"
> > > one. Unless I misunderstood you and you are thinking about rewriting the
> > > whole MTD partition from a broken definition to a proper one.
> 
> No, quite the opposite.
>
> Either size-cell is wrong which makes the description totally
> inconsistent (if size-cell is there, it must have a use, otherwise why
> do we keep it?) and we must fix it, or it is right and we should not
> touch it.
> 
> What I propose is to check very early whether the description is
> consistent on the board known to have this problem. If the description
> is wrong, we fix it and the generic parser can then do its work
> properly.

What if we add `nand-chip{}` children in the future (the i.MX nand
controller has nothing implemented not described in the schema so far,
but it is something that is supported by the hw)? Will this idea still
works?

> > > On Thu, Dec 15, 2022 at 09:04:46AM +0100, Miquel Raynal wrote:  
> > >> marex@denx.de wrote on Thu, 15 Dec 2022 08:45:33 +0100:  
> > >>> Sadly, it does only fix the known cases, not the unknown cases like
> > >>> downstream forks which never get any bootloader updates ever, and
> > >>> which you can't find in upstream U-Boot, and which you therefore
> > >>> cannot easily catch in the arch side fixup.  
> > >>
> > >> And ?  
> > > 
> > > I'm not personally and directly concerned, since the machine I care are
> > > all available upstream and known, however this is a general problem with
> > > U-Boot code being at the same time widely used on a range of embedded
> > > products and producing a broken MTD partition list.
> > > 
> > > I think we will just silently break boards and just creating a lot of
> > > issues to people. We would just introduce regression to the users, being
> > > aware of it and deliberately decide to not care and move the problem to
> > > someone else. I do not think this is a good way to go.  
> 
> What?

Let me rephrase, I was not clear enough.

> Since when my proposal is breaking boards? My proposal leads to a
> situation where:
> - If you have a board that has an inconsistent description but worked,
>   it will still work.
> - If you have a board that has a consistent description and worked, it
>   will still work.
> - If your have a board that has an inconsistent description and got
>   broken *recently* by another change (typically you "fix" the DT in
>   Linux to comply with the bindings), then you get a warning that leads
>   you on the right path, you then update your bootloader if you can,
>   but either way you add your machine compatible to the list of devices
>   which need the early fix and your boot is fixed.

This implies that we can proactively catch all the affected boards. I do
not believe this is reasonable and because of that my comment before
about creating regression to the users.

Francesco



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
