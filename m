Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E88AC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2I613J4GuYLt1Rb7xJ0VIZDFxLTCJ2eT2E0Me7Ps+w=; b=oAfLTSH/pBWF6t
	uPMHjB1aBcuyx+X1ZBFRj1UP6JZfvwaM1TEenpFHDZzPghtO9LGTTy3TTEi9OZ7MwXopJ1YVSQ79p
	6J0IkaxWdaHk4iR+xm7SjMdLuNmv+dbbWgQ47nEuGwxc4PH0HLTGUntWgyIlb1tq9y481hNnSw5D1
	A7PtWNbpuQOHRR/MKOFpSLA3vkuOmk88/uV/9IeRG6kTFa446FqYOhzfpdcGHwvrrC708vjXqzWeJ
	7mNgQXT/zJmfhna0WmKfnvzjZxlfmEHNXnQbf5jxogf3PcjVjsTzP5k284t8PvGyxNt53XekXuv9o
	KBt/tRw52cLVEm0sjcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzijT-007lS5-Jg; Tue, 21 Dec 2021 17:15:23 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzieY-007j63-3V
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 17:10:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 487A51C000D;
 Tue, 21 Dec 2021 17:10:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: Re: [PATCH v6 2/4] mtd: rawnand: renesas: Add new NAND controller
 driver
Date: Tue, 21 Dec 2021 18:10:11 +0100
Message-Id: <20211221171011.20021-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217142033.353599-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd8701fe890ecbab239086e7053d62d0f08587d7c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_091018_336211_5708F24B 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2021-12-17 at 14:20:31 UTC, Miquel Raynal wrote:
> Introduce Renesas NAND controller driver which currently supports the
> following features on R-Car Gen3 and RZ/N1 SoCs:
> - All ONFI timing modes
> - Different configurations of its internal ECC controller
> - On-die (not tested) and software ECC support
> - Several chips (not tested)
> - Subpage accesses
> - DMA and PIO
> 
> This controller was originally provided by Evatronix before being bought
> by Cadence.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
