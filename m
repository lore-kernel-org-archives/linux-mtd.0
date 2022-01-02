Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8917BC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Jan 2022 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvYIiIj1gbJ4lpzJ4Ilu8j2u1I5g/actPMDcO+Q7VlY=; b=tLIKIJafMT5/JA
	5PWhEXbJOG4JnDapbIyUyfg4OlCdBSJEQriwNGMohznnh2CbR8lXOuSMo9o5V3kCfYPGULzhhFNZl
	ahkVBteO2CajdM9BDQ7LVuv4izzkq0C+zR6ru71tteCaO0omvSjjCg4qZaz5F4tJi57bImbZYcGYs
	ehXUGLRHqzfOl0nQ8Jm2xhxVsRZtQxOgXjq/WJSnOqIEfhul1NgWICmsIQRaqJF6YjguqSGbSVHyd
	RUOzILUwYOCco4dEFpMjwutNpLvRs7+jpiE9FKh/FjSPj9kPCRKXKoufu5+ENxDqJ/0aBwuDPtZIz
	PUiCttv/Y11kBj+gx9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n40yw-007pQF-C1; Sun, 02 Jan 2022 13:33:06 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n40yp-007pPb-W5
 for linux-mtd@lists.infradead.org; Sun, 02 Jan 2022 13:33:02 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1n40yi-0002m7-03; Sun, 02 Jan 2022 14:32:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 785B8C0A4B; Sun,  2 Jan 2022 14:27:57 +0100 (CET)
Date: Sun, 2 Jan 2022 14:27:57 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-crypto@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: geert@linux-m68k.org
Subject: Re: [PATCH 3/3] MIPS: TXX9: Remove TX4939 SoC support
Message-ID: <20220102132757.GD3468@alpha.franken.de>
References: <20211130164558.85584-1-tsbogend@alpha.franken.de>
 <20211130164558.85584-3-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211130164558.85584-3-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_053300_309725_2C8E7164 
X-CRM114-Status: GOOD (  12.20  )
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

On Tue, Nov 30, 2021 at 05:45:56PM +0100, Thomas Bogendoerfer wrote:
> After removal of RBTX4939 board support remove code for the TX4939 SoC.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/pci/Makefile                |   1 -
>  arch/mips/pci/pci-tx4939.c            | 107 -----
>  arch/mips/txx9/Kconfig                |   8 -
>  arch/mips/txx9/generic/Makefile       |   1 -
>  arch/mips/txx9/generic/irq_tx4939.c   | 216 ----------
>  arch/mips/txx9/generic/setup_tx4939.c | 568 --------------------------
>  drivers/char/hw_random/Kconfig        |  13 -
>  drivers/char/hw_random/Makefile       |   1 -
>  drivers/char/hw_random/tx4939-rng.c   | 157 -------
>  drivers/mtd/nand/raw/Kconfig          |   2 +-
>  10 files changed, 1 insertion(+), 1073 deletions(-)
>  delete mode 100644 arch/mips/pci/pci-tx4939.c
>  delete mode 100644 arch/mips/txx9/generic/irq_tx4939.c
>  delete mode 100644 arch/mips/txx9/generic/setup_tx4939.c
>  delete mode 100644 drivers/char/hw_random/tx4939-rng.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
