Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A01C47089
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 19:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfdeNF056F//7jLRHZqyGJvLC5zGdlpC6UTBhtWP2MI=; b=dk0qbwwL0MupRE
	HNx8kZ1/+tNnF1iktfs22A1aVbwz+F1c7l2SIVRjhFcb1bL58Ze1GH61U+gbwyQLf6keo08J1VMNs
	2UzNxjecbpE0k2CPjTk55TFGMZykyotG0eJgLkS8GI7vo0/918FC28WgJUmkzfj0Rr7Y+/ium7etq
	xIU3sP8KpF8C/ZGtRqYeP6H/FoDfoQ6vqt9JnRmDL3MWoyBJpQawiSnoVEtuvj1u62Io4fZYITQST
	LDRGWpNP4x+x81wCzYud27c5Js8rnX1PuRj8Q0AaXPwJvme3k7sFeABq0GdLzrFOCYQMDW4rLjwIK
	Xu4sok1dCzUMPP366Jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Gof-0096F6-1q; Mon, 05 Dec 2022 19:07:49 +0000
Received: from smtp-out-03.comm2000.it ([212.97.32.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GoS-0095m8-D1; Mon, 05 Dec 2022 19:07:38 +0000
Received: from francesco-nb.int.toradex.com (unknown [213.55.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id 43E18B474AA;
	Mon,  5 Dec 2022 20:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670267252;
	bh=2PZUfJSYd8pUEKuEGRJQTqBQHftyQpzKMAjMYXWyBWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=z99rN3uXoOuGkbIA01MARMuQWaogCP7WHvnxIiAcmdKCnlE9dE02ZMl/xs13R+9Yh
	 TEgc3QR+O15gGaIUAwK0DigCJnO3AuGwKDmk35O8yLjJ1jtzXlUD1CAnUZlVGPMkQj
	 KSOz0WkKVoVtxcLZ5xzVhssN0t/3S3uQbX2x0QMwhLYmAx6xw5h2FMxvjGdXN46jmN
	 ynE12mXtO4Cz0Cpuzj1O0bBEBL4QmgSIgQu7zWwXkYFzLDFv8zmuqeXoxvKxh+HuyV
	 6CGmC7k6GZTdMgeTgWuFmhOgoayVKZ+QpcSwzdyuMO1SlmbpdqYULl2XIfiGnq5IDc
	 N8UdzevdkWwAg==
Date: Mon, 5 Dec 2022 20:07:18 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
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
Message-ID: <Y45BZs7dZokgz83I@francesco-nb.int.toradex.com>
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221205185859.433d6cbf@xps-13>
 <f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
 <20221205191828.3072d872@xps-13>
 <29260d63-3240-6660-b002-cd00dc051574@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29260d63-3240-6660-b002-cd00dc051574@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_110736_618582_3F0F0788 
X-CRM114-Status: GOOD (  19.22  )
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

On Mon, Dec 05, 2022 at 07:52:08PM +0100, Marek Vasut wrote:
> On 12/5/22 19:18, Miquel Raynal wrote:
> > marex@denx.de wrote on Mon, 5 Dec 2022 19:07:14 +0100:
> > > On 12/5/22 18:58, Miquel Raynal wrote:
> > > > , it's not
> > > > complex to do, there are plenty of examples. This would be IMHO a
> > > > better step ahead rather than just a cell change. Anyway, I don't mind
> > > > reverting this once we've sorted this mess out and fixed U-Boot.
> > > 
> > > Won't we still have issues with older bootloader versions which
> > > paste partitions directly into this &gpmi {} node, and which needs
> > > to be fixed up in the parser in the end ?
> > 
> > I believe fdt_fixup_mtdparts() should be killed, so we should no longer
> > have this problem.
> 
> The fdt_fixup_mtdparts is U-Boot code. If contemporary Linux kernel is
> booted with ancient U-Boot, then you would still get defective DT passed to
> Linux, and that should be fixed up by Linux. Removing fdt_fixup_mtdparts()
> from current mainline U-Boot won't solve this problem.
> 
> I think this is also what Francesco is trying to convey (please correct me
> if I'm wrong).

Yes, exactly, thanks!

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
