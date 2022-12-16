Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05021C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+opdQMsTZuGlQ879GwxNV0PzVguy94mHNs1//YSC4PE=; b=eRFZ0GE+LCbqyu
	jWK/aGplwceaF2GXbXr2dVdqkmm5MFbkO/9sY9XhFnSmV7vRBx6mDmTbyotg5FNWz69S9j8wA7CSz
	ufEWYtreOm6pMDLUZK/WWJTIWnkVPxTwbG+4GtMsD2ZWuykjm3SGAyX6j2RAF3KIrudjknAXbaFCj
	meKddPKFJUeHzCzQVQIu70gDAyfiKOYa4J30bMmKQuymWOePaBUIOhk7TsSyeweirU6pA1fni4Bfe
	x6P5tP647+6sH67LQ4kzvcSxvuOA5Mg7KD0TuT3Dn3Gy/rp1FEBU29OqU77PKudY8/+Sk00g9QDJT
	kQNgGH6rbs8HiijdQJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p65Wj-00DSnt-QJ; Fri, 16 Dec 2022 07:53:05 +0000
Received: from smtp-out-08.comm2000.it ([212.97.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p65WX-00DSjI-DV; Fri, 16 Dec 2022 07:52:54 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-08.comm2000.it (Postfix) with ESMTPSA id A9CB6426668;
	Fri, 16 Dec 2022 08:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1671177169;
	bh=HLaXNaF9mrgP2DSCe+1XOpANqOwz9+kAh1gAdGINbZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gvIZykeGYsqzYQGmpktJ/UnYaqy6LxNezbUxGv+MY1T4LWECVJz67SOMBZYOSUQ3b
	 ME65aUaExHrdzqsYD91ULBZVqrRC2ramAlirxP/Ju1uWFlII7LTIqU2HKJsVets3cq
	 IJBeEEl+KWfgRzPWWAlUZnZHNW/w7HrPKErYq3RYy9qwAhf6OIUqrSQ49O2aPNTOg2
	 s2TyPkDvzLN5qsClutosEJBhfvKOWSdwmQoW80m1JhfzPX4ibffwojnkiANf+kGGKB
	 Bd+szTsnxVzJXzlqilCizlt4P/3UKOOWUgJs6QDZM5EGokAzpFizJQi5cqFCoaAL6b
	 XWf6V4fhO1Mbg==
Date: Fri, 16 Dec 2022 08:52:48 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y5wj0BHKBYvNRFFK@francesco-nb.int.toradex.com>
References: <e80377c9-1542-d47d-6d35-2efdc15bcbf8@denx.de>
 <20221202175730.231d75d5@xps-13>
 <7afd364c-33b8-38a9-65a6-015b4360db6b@denx.de>
 <Y43VdPftDbq6cD2L@francesco-nb.int.toradex.com>
 <20221205144917.6514168a@xps-13>
 <ecca019d-b0b7-630c-4221-2684cb51634c@denx.de>
 <20221215081604.5385fa56@xps-13>
 <ac50a1ee-4312-48f6-af78-7b95a77e6fda@denx.de>
 <20221215090446.28363133@xps-13>
 <a54bf573-c14a-a546-10fc-e50274986ff5@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a54bf573-c14a-a546-10fc-e50274986ff5@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_235253_629529_6A629620 
X-CRM114-Status: GOOD (  16.48  )
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

On Fri, Dec 16, 2022 at 01:36:03AM +0100, Marek Vasut wrote:
> On 12/15/22 09:04, Miquel Raynal wrote:
> > > > That would fix all cases and only have an impact on the affected
> > > > boards.
> > > 
> > > Sadly, it does only fix the known cases, not the unknown cases
> > > like downstream forks which never get any bootloader updates ever,
> > > and which you can't find in upstream U-Boot, and which you
> > > therefore cannot easily catch in the arch side fixup.
> > 
> > And ?
> 
> I was under the impression Linux was supposed to deliver the best possible
> experience to its users even on not-perfect hardware, and if there are any
> quirks, the kernel should try to fix them up or work around them as best as
> it can, not dismiss them as broken hardware and fail to boot outright.

I would say something more on this.

We are not talking about Linux not working well on some hardware, we are
talking about breaking hardware that was working fine since ever.
I believe that the Linux has a quite strong point of view on such kind
of regression.

Quoting Linus
> If the kernel used to work for you, the rule is that it continues to work for you.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
