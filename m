Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20591C352A1
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Dec 2022 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGJ6ByMI+g9FS7UG+kt3xRjV6Vwxi5lZh58WexAsQus=; b=J81NrndXeDKl4x
	zRSzNE6RVrYET6lL75sq1j4C4M4A7UJRl120E9HQ1beYzbvtHClpNjoJttNDghSx54QXNqHCje2St
	/EX6Ejdh/SJbar8RAEarDMnT7aIbTkLeYTTaLXTtok+hn2Q0xU9Rf3NK4KO2AHZDm89WGtO8f2q0I
	IFfzCSfZJfJr9pUc06++C6nK27eFwPkbzNsA+XEMQIKnIxDV1kQpBI79agKIykaOQxWJO1+MQSIDe
	qzTb84Y7CwehPCdWBMnWNj0RYF4mf0dDvQYMQXsc85OqC3SOf23vFsc7tLuivujJxF7Uj3aITXMC8
	4wKRm04AvF/US7i7m11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2pCO-00EKxY-4z; Wed, 07 Dec 2022 07:50:36 +0000
Received: from smtp-out-06.comm2000.it ([212.97.32.74])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2pCD-00EKgM-4Y; Wed, 07 Dec 2022 07:50:27 +0000
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id F2D9D5631EE;
	Wed,  7 Dec 2022 08:50:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670399412;
	bh=DDTBiWaHnF9iOPxez5l8MrXcNcPFqJ4pfnXgFn4qVxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KzwVfnhmWGbGSVN8eAOv1xsJitCAA/pl+qVCgfUrrJzUw/S/a3i9+I3L6UxzSY+8B
	 uJA6cYs/lFwzb1gmZQpyvTxz5doP5yMCNcyMqIb3UZxuFAMBRrNIgD/TQ58wTJdV3C
	 I7mdRAPA8NNd5JHhX0pwXqC1inz4xdBFDYa/on1Jchzb8JDmMEWqZNmWnpsh5trol6
	 r0UaKbJcXf1EgIAS22V0tFXrdS8Y+DLBo1RJ42REl+0beOjgTubjfnQikmixFDzKOI
	 jEWrB1ODt9QbezmGr+ymK2Ppw1Io7bX8VvY5jki7KDF+Ktwh2r1wtw1NT6KOTEI7n6
	 q8PEPbtUdkxHA==
Date: Wed, 7 Dec 2022 08:49:54 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <Y5BFos83ceVi2pu2@francesco-nb.int.toradex.com>
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221205185859.433d6cbf@xps-13>
 <f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
 <20221205191828.3072d872@xps-13>
 <29260d63-3240-6660-b002-cd00dc051574@denx.de>
 <Y45BZs7dZokgz83I@francesco-nb.int.toradex.com>
 <20221206111643.1af08a9b@xps-13>
 <738f260d-225b-7ecf-20b2-a7541c368d36@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <738f260d-225b-7ecf-20b2-a7541c368d36@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_235025_371316_77D820C6 
X-CRM114-Status: GOOD (  38.79  )
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

On Tue, Dec 06, 2022 at 08:02:45PM +0100, Marek Vasut wrote:
> On 12/6/22 11:16, Miquel Raynal wrote:
> > Hi Francesco,
> 
> Hello everyone,
> 
> > francesco@dolcini.it wrote on Mon, 5 Dec 2022 20:07:18 +0100:
> > 
> > > On Mon, Dec 05, 2022 at 07:52:08PM +0100, Marek Vasut wrote:
> > > > On 12/5/22 19:18, Miquel Raynal wrote:
> > > > > marex@denx.de wrote on Mon, 5 Dec 2022 19:07:14 +0100:
> > > > > > On 12/5/22 18:58, Miquel Raynal wrote:
> > > > > > > , it's not
> > > > > > > complex to do, there are plenty of examples. This would be IMHO a
> > > > > > > better step ahead rather than just a cell change. Anyway, I don't mind
> > > > > > > reverting this once we've sorted this mess out and fixed U-Boot.
> > > > > > 
> > > > > > Won't we still have issues with older bootloader versions which
> > > > > > paste partitions directly into this &gpmi {} node, and which needs
> > > > > > to be fixed up in the parser in the end ?
> > > > > 
> > > > > I believe fdt_fixup_mtdparts() should be killed, so we should no longer
> > > > > have this problem.
> > > > 
> > > > The fdt_fixup_mtdparts is U-Boot code. If contemporary Linux kernel is
> > > > booted with ancient U-Boot, then you would still get defective DT passed to
> > > > Linux, and that should be fixed up by Linux. Removing fdt_fixup_mtdparts()
> > > > from current mainline U-Boot won't solve this problem.
> > > > 
> > > > I think this is also what Francesco is trying to convey (please correct me
> > > > if I'm wrong).
> > 
> > If we can get rid of fdt_fixup_mtdparts(), it means someone has to
> > create the partitions. I guess the easy way would be to just provide
> > mtdparts to Linux like all the other boards and let Linux deal with it.
> 
> This is based on an assumption that the platform kernel command line can be
> updated to insert such a workaround. If Francesco cannot update the
> bootloader, the kernel command line may be immutable all the same.

Exactly.

What I can do is update the latest stuff and enable people to upgrade, eventually.
But here we are talking about a board that is just generally available
in high volume to a multitude of people since years ... in practice the
vast majority of the users will not upgrade it.

> > Then we can just assume in Linux that perhaps if the partitions are
> > invalid (#size-cell is wrong?) then we should just stop their creation
> > and fallback to another mechanism instead of failing entirely. This way
> > no need for hackish changes in the parsers and compatibility is still
> > valid with old U-Boot (if mtdparts was provided on the cmdline, to be
> > checked). Otherwise we'll have to deal with it in Linux, that's a pity.
> 
> I am very much banking toward -- fix it up in the parser, just like any
> other firmware issue.

I agree again.

> Esp. since the fix up is printing a warning, and it is like a 2-liner
> patch.
Here we might assess if we need more to handle the other weird situation
in which a `partitions{}` node is present, U-Boot ignores it and the
kernel fails to detect the partitions. As of today colibri-imx7 is not
affected by this.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
