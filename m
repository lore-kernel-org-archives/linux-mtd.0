Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C497C3DA7A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 21:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXVXURB/j2+Pz9QkDWbo9iDcwbHpDLrUROpvaaiLxoM=; b=s1gNuQDQGpHCQV
	WkfBCcvfMmdDWd3VMZd7LhU8O8IarkBmy2jw9iytlOz4yFOugShT8OETSpmHx/GjVj5nQIEtmJbKB
	rpAd818JQDCT+jqg3DPTYMGy3vu/CYAkXVBYyFq6VOqn/otoN+jN3NgQsaiqqpSfLcd1Ytc9QWsbG
	2REABpt7Whwr9op9xRh8XGaHCqg28oSYq29piQsD5Ysh2j/jb0xIOotViysbZWRzHErkSS4IC6fg9
	6bvJPFmTCEt4jH9U7qNQl55rr0CqDP3QunnDDhaJ+d6DsVILaXDZP0rhGHOjYa7xujgrVqmkFDGZ5
	E5+/AopB+qFaRN0gMw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYB9-00FJXn-CR; Thu, 05 Jan 2023 21:53:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV4u-00Dfv1-Uy; Thu, 05 Jan 2023 18:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uQYTwAu78uYp2pDZ83va7i41tuWZimqGrLK5DPhpMXU=; b=T8lOJ4nD8mmR75dtGk+1GY91WP
	FFLhHVuLHqZAOWuQTe2r2uWd4opw15e9qtILlvMllkQUdn8Eg1jOQhEQuZ11bV4NPKvfXOySt30nE
	jPq2us/2l+KYnzTc3pTAdlGPjupoMfE+qy8NH4hmej6yUGRf1vOQZ7JyO25XeTIJQln125v9LNmG9
	jQzIYFkTaeXJfqC96e3+tOrjb0E8zGia0OGNA5xY7BSEL0jbNl4KRtUg/INbd1Z6YvdClsLb8HhIx
	89UkdTjYajaBzNG7dJQd2PK6xDArnM7nJSG9L0huv4PPxZiIF8D6qHd6DRXY6Tui4umfhACVsHHBQ
	VZ2h0RZA==;
Received: from smtp-out-08.comm2000.it ([212.97.32.78])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDPnl-001K4R-10;
	Thu, 05 Jan 2023 12:56:59 +0000
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-08.comm2000.it (Postfix) with ESMTPSA id AE8D6420F17;
	Thu,  5 Jan 2023 13:47:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1672922865;
	bh=7bFpsL453HyKnpFTYVsA8GiulGO4aIzlZZqiWerQDnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZuA/8o3DqN/jJk6jp0Tj51u7u0BUh70D58qzkW2BVlmkvtR4wkqVYMSzT2cSUYHq9
	 xOcMctjqR7WTSKViEQCThyk7TesCKm8l3F71rR2jBoResqN2OFb/ywca3LRrhauaTI
	 GudqHDLVbFNGIJpvHJmixP4a9wlRlgTg5XDvKp29yKKLDto8DNK4LNa7DRrKN4pG8H
	 vH6u0VaaobJZ5jl3mR+gsjOOkkP7CCj+A9ff6o/S2xiGr+dkBk1fp8INNvVLoGyNgL
	 /xYccta3YGuOb0LCPTEhJ+j01BpAY/kHZrwFCVJ09IKIdg1e0ImJ29qthltsWMQTVY
	 29g+nq+o5uyxQ==
Date: Thu, 5 Jan 2023 13:47:40 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y7bG7GFDMS6bmQ4d@francesco-nb.int.toradex.com>
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
 <6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
 <20221216120155.4b78e5cf@xps-13>
 <Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
 <20221216143720.3c8923d8@xps-13>
 <fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
 <20221216163501.1c2ace21@xps-13>
 <Y5ydGhn/qYUalamm@francesco-nb.int.toradex.com>
 <20230102104004.6abae6da@xps-13>
 <20230105123334.7f90c289@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230105123334.7f90c289@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_125657_547980_85CB4350 
X-CRM114-Status: GOOD (  49.55  )
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

Hello Miquel,

On Thu, Jan 05, 2023 at 12:33:34PM +0100, Miquel Raynal wrote:
> miquel.raynal@bootlin.com wrote on Mon, 2 Jan 2023 10:40:04 +0100:
> > francesco@dolcini.it wrote on Fri, 16 Dec 2022 17:30:18 +0100:
> > > On Fri, Dec 16, 2022 at 04:35:01PM +0100, Miquel Raynal wrote:  
> > > > marex@denx.de wrote on Fri, 16 Dec 2022 15:32:28 +0100:    
> > > > > The second part of the message, as far as I understand it, is
> > > > > "ignore problems this will cause to users of boards we do not know
> > > > > about, let them run into unbootable systems after some linux kernel
> > > > > update,     
> > > > 
> > > > Now you know what kernel update will break them, so you can prevent it
> > > > from happening. 
> > > > 
> > > > For boards without even a dtsi in the kernel, should we care?    
> > > 
> > > Would caring for those boards not be just exact the same as caring for
> > > some UEFI/ACPI mess for which no source code is normally available and
> > > nobody really known at which point the various vendors have forked their
> > > source code from some Intel or AMD or whatever reference code?  
> > 
> > I am sorry I don't know UEFI/ACPI well enough to discuss it.
> > 
> > > IMHO we should care for the multiple reason I have already written in my
> > > previous emails.
> > > 
> > > And honestly, just as a side comment, I would feel way more happy
> > > to know that the elevator control system in the elevator I use everyday
> > > or the chemical industrial plan HMI next to my home is running an up to
> > > date Linux system that is not affected by known security vulnerabilities
> > > and they did stop updating it just because there was some random bug
> > > preventing the updated kernel to boot and nobody had the time/skill to
> > > investigate and fix it. [1]  
> > 
> > The issue comes from a very specific U-Boot function that should have
> > never existed. I hope people working on chemical plants do not make
> > use of these and will not disregard the "your DT is broken there [...]"
> > warning we plan to add right before their updated board will fail. We
> > are not living people in the dark, I agreed for a warning, but I don't
> > think applying the proposed fix blindly is wise and future-proof.
> 
> Let's move forward with this. Let's assume my fears are baseless. We
> might consider the situation where someone tries to hide the partitions
> by setting #size-cell to 0 even wronger and too unlikely. Hopefully we
> will not break any other existing setups by applying an always-on fix.

Nice, good!

> I would still like to see U-Boot partitions handling evolve, at least:
> - fix #size-cells in fdt_fixup_mtd()
> - avoid the fdt_fixup_mtd() call from Collibri boards (ie. an example
>   that can be followed by the other users)

Fine, I can do it. 

However I am just not 100% sure about your proposal, I wonder if we
should just deprecate this function or we should fix it.
The exact end result will depend on the discussion with the U-Boot
folks, but I absolutely agree that the current situation needs to
change. I'll keep you in CC on those patches.

> On Linux side let's fix #size-cells like you proposed without filtering
> against a list of compatibles. We however need to improve the
> heuristics:
> - Do it only when there are partitions declared within a NAND
>   controller node.
> - Change the warning to avoid mentioning backward compatibility, just
>   mention this is utterly wrong and thus the value will be set to 1
>   instead of 0.
> - Mention in the comment above this only works on systems with <4GiB
>   chips.
> If you think about other conditions please feel free to add them.
> 
> Do you concur?
Yes, I do agree.

Side comment, I have been recently busy with other life AND work priorities
and this task was just idling on the bottom of my backlog. I do not see
the situation improving that much in the next few weeks.

Said that patches coming, I am committed to have this sorted out before
the next Linux Kernel merge window, for U-Boot the merge window opens in
3 days and I am already late, let's see, this might be as well
considered a fix that is fine for a late integration.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
