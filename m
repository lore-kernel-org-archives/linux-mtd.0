Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D75BC3A5A7
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXvb1vyI2Iv6Fuqmk7D8W3jGI0P2+k/TvnTu/s/QYuQ=; b=pfqpE+3bq9MegI
	tx4ytKzR+pWQ/shENbHphN1Ldk61FUwTMUY9uiIkGHcs8fEUL3WcrTP3QF6vfFiprpffYxA7nrhgL
	3EHPmNizDqJN6tl/v4KOlmfzcA22q4NxdIaRXME+RgXqWEm9rVp+cHdykLaA6Oof3mOo48HObvdS4
	REaJM2IBKfTYefKMF4+POInudcl7UlvoHq/j+M/3AblFmWhBbdtANzr+IV5apqmhzujBODNVNylxz
	igVNklQa2GAAt5YEF/742i13mW32L1aWgIkuLW/F22FhxsAlJDHvUSmHj85VgAO1w3i1NKgaOW0br
	GgumcZIENyDjGJf9gBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Jxt-005RXM-EB; Thu, 08 Dec 2022 16:41:41 +0000
Received: from smtp-out-05.comm2000.it ([212.97.32.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3JxX-005RA1-L0; Thu, 08 Dec 2022 16:41:21 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-05.comm2000.it (Postfix) with ESMTPSA id E9E8A825E0E;
	Thu,  8 Dec 2022 17:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670517676;
	bh=MGqMe6BXHhrUSxKHY7PoPpSFfKzeQ+lcsCV605kXZyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0gWjV0LFFvQ4mYVT/KEaf98mcFxvQ/Z00lesQaSifF1BUNfx27TyH9oz07wdYUzhd
	 No7zusuVqTfwHpd7wpWWT1Sxspw2zbTl7//CWR8iEp1ZvedcBkr0I91DdAcXw8gkEY
	 Qu2pCDf7xwGviRS0gg6PEwtZKDsj7wCvgWSZ6bsTieDlnRf0j/C0i+Zs4nD2KK1EMZ
	 YVi4q+kWD1zo6pNPjVpn2C38Huk3XzF+pD5ogBNkmvAfOX4OaGbBhajimVHWAKNrLX
	 h9GL1Y4xss6/g0kUIMmUBNRYYUFs90Bn/8WSxG//aXoRcpgZ6Co87fCz8Ea12W8tdd
	 iAi//h2nXaKmw==
Date: Thu, 8 Dec 2022 17:40:49 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Marek Vasut <marex@denx.de>, Francesco Dolcini <francesco@dolcini.it>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org, stable@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <Y5ITkZtKWHzWaLS4@francesco-nb.int.toradex.com>
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221208115124.6cc7a8bf@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208115124.6cc7a8bf@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_084119_910656_159DF36B 
X-CRM114-Status: GOOD (  15.81  )
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

+ Arnd

On Thu, Dec 08, 2022 at 11:51:24AM +0100, Miquel Raynal wrote:
> marex@denx.de wrote on Mon, 5 Dec 2022 17:26:53 +0100:
> > On 12/5/22 16:23, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > This reverts commit 753395ea1e45c724150070b5785900b6a44bd5fb.
> > > 
> > > It introduced a boot regression on colibri-imx7, and potentially any
> > > other i.MX7 boards with MTD partition list generated into the fdt by
> > > U-Boot.
> > > 
> > > While the commit we are reverting here is not obviously wrong, it fixes
> > > only a dt binding checker warning that is non-functional, while it
> > > introduces a boot regression and there is no obvious fix ready.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
> > > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> > > Link: https://lore.kernel.org/all/20221205144917.6514168a@xps-13/
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> [...]
> > Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> [...]
> > Acked-by: Marek Vasut <marex@denx.de>
> [...]
> 
> As discussed in the above links, boot is broken on imx7 Colibri boards,
> this revert was the most quick and straightforward fix we agreed upon
> with the hope (~ duty?) it would make it in v6.1. Any chance you could
> pick this up rapidly and forward it to Linus? Or should we involve
> him directly (Thorsten?).

Hello Arnd,
FYI - see Miquel explanation above.

Francesco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
