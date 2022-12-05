Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC0FC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKi1f4Wbzk1LYQFmtF2XFtpHEBOhlKVm7LCqRd6O7gc=; b=SZ5ALP5+QYspsB
	1eXBFq2l0s0hYiYsvxHl8csJ6DUtmqWZELI82ysq/nmkcXT3VZU7MpPy/Xo2/niPMnMCGUVMickKp
	gvM2OqiLjz2vtlcGj2fL2rvs2EW/fjqtTI5P1TwHEkRc0eRnHFf0V6LaikeURBBgTrzNnydO6ZScb
	UoZ0pv1LhvV9yrqqzsWDb5vTTkt1WwXCCmQE3wGMbXPRoTHYAze1o+PIV3zDCw4VEAVbVvc1pkZYR
	P6AYT82er3eO2g21E/FU4tfKzZFe+4qzjuOvWcDbm9HsIeTYJS3Z+EiVR/rl3fJ7RRJD0J0t14msI
	kaE7wHMuDdHfRVjMBbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2G0q-008JnD-GP; Mon, 05 Dec 2022 18:16:20 +0000
Received: from smtp-out-01.comm2000.it ([212.97.32.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2G0e-008Jiz-Kr; Mon, 05 Dec 2022 18:16:10 +0000
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id B475C843CEA;
	Mon,  5 Dec 2022 19:15:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670264165;
	bh=i2fxvVG/OMTVFtDkYPsQVjpZTCVwhtrudWILsoMensE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Slx6qj40YwzzbDrVsAY6atWaqvM2owKNtyiaEGzxmv7VjuTv7Ux2jCHugIGNX/L2Y
	 5pajr20sSnaYTyLnrxrneiiWpiLE8/6Mz+Y6K2IWW2IzUc4SrnXuZd28v6bLMjs5bs
	 byyWPoQqTKxEVuouuWjllj5CKL/nFXIy08ypTlDNEfGT5scozi51wdDsnJx52Ztdfh
	 mjLr3bZbOyeyXijH9858SA6F4U+pcqa6THkze74ZBsVSHZXyInB9Jh+2BpkGTjQ16C
	 GUDfHB6H7ozCnrlhnccVEKiLMo+IFhqFQG3etCgUjDuKpbued4bF+D4uzvnEsjrUjF
	 ZO0bBgVpwgbTg==
Date: Mon, 5 Dec 2022 19:15:56 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>
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
Message-ID: <Y441XJ/aSAt31HD9@francesco-nb.int.toradex.com>
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221205185859.433d6cbf@xps-13>
 <f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_101608_851330_CE2B1655 
X-CRM114-Status: GOOD (  13.57  )
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

On Mon, Dec 05, 2022 at 07:07:14PM +0100, Marek Vasut wrote:
> On 12/5/22 18:58, Miquel Raynal wrote:
> > marex@denx.de wrote on Mon, 5 Dec 2022 17:26:53 +0100:
> > , it's not
> > complex to do, there are plenty of examples. This would be IMHO a
> > better step ahead rather than just a cell change. Anyway, I don't mind
> > reverting this once we've sorted this mess out and fixed U-Boot.
> 
> Won't we still have issues with older bootloader versions which paste
> partitions directly into this &gpmi {} node, and which needs to be fixed up
> in the parser in the end ?

Yes, I think so. While I do agree on printk warning and deprecated
functions and use more modern and less problematic stuff, this should
not come at the cost of failing the boot on board using some old U-Boot
version.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
