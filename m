Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB2FC433FE
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Jan 2022 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FZrgsVuRgAFSqEK6mvJhh6YMckUnFxzJBJyQB9kwJQ=; b=rS6xhOocmfsabI
	/NzYlM29WSFyUZZpxFru/QvQnNElngMrIO1di6DlLYe6P1JneFSXne3XcxTWbGg01KJfIZdnKJBZ5
	wxs36rt1qMT7B2kDCVigaEgz7M44JWkscoBj3lrWjsJmyLMNamu6BwSW5424U6ml+VnY8hg19epjz
	X6507gHb8zwC9o5AtDVSlFojH1HOKBZ7U/DXbpqZrcQ3peDdlVF7GWfQmPk9nw1IiKLHTKOxYxi/8
	neGcC+08Xu26AV0U86Ni6qMD9R7nCx8aWdd0dAL5BEFAlWzZ1RZY4dpHZcYj2TAd42YNId2Worcie
	Fpa5HMzKu8VXoi6HwxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n40z8-007pSt-CY; Sun, 02 Jan 2022 13:33:18 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n40yp-007pPD-VR
 for linux-mtd@lists.infradead.org; Sun, 02 Jan 2022 13:33:02 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1n40yi-0002m7-02; Sun, 02 Jan 2022 14:32:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 9641AC0A4B; Sun,  2 Jan 2022 14:27:33 +0100 (CET)
Date: Sun, 2 Jan 2022 14:27:33 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: geert@linux-m68k.org
Subject: Re: [PATCH 2/3] MIPS: TXX9: Remove rbtx4939 board support
Message-ID: <20220102132733.GC3468@alpha.franken.de>
References: <20211130164558.85584-1-tsbogend@alpha.franken.de>
 <20211130164558.85584-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211130164558.85584-2-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_053300_309465_7276BC82 
X-CRM114-Status: GOOD (  11.52  )
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

On Tue, Nov 30, 2021 at 05:45:55PM +0100, Thomas Bogendoerfer wrote:
> No active MIPS user own this board, so let's remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/configs/rbtx49xx_defconfig          |   2 -
>  .../include/asm/mach-tx49xx/mangle-port.h     |   8 -
>  arch/mips/include/asm/txx9/boards.h           |   3 -
>  arch/mips/include/asm/txx9/rbtx4939.h         | 142 -----
>  arch/mips/txx9/Kconfig                        |  12 -
>  arch/mips/txx9/Makefile                       |   1 -
>  arch/mips/txx9/generic/7segled.c              | 123 ----
>  arch/mips/txx9/generic/Makefile               |   1 -
>  arch/mips/txx9/generic/setup.c                |  20 -
>  arch/mips/txx9/rbtx4939/Makefile              |   2 -
>  arch/mips/txx9/rbtx4939/irq.c                 |  95 ---
>  arch/mips/txx9/rbtx4939/prom.c                |  29 -
>  arch/mips/txx9/rbtx4939/setup.c               | 554 ------------------
>  drivers/mtd/maps/Kconfig                      |   6 -
>  drivers/mtd/maps/Makefile                     |   1 -
>  drivers/mtd/maps/rbtx4939-flash.c             | 133 -----
>  16 files changed, 1132 deletions(-)
>  delete mode 100644 arch/mips/include/asm/txx9/rbtx4939.h
>  delete mode 100644 arch/mips/txx9/generic/7segled.c
>  delete mode 100644 arch/mips/txx9/rbtx4939/Makefile
>  delete mode 100644 arch/mips/txx9/rbtx4939/irq.c
>  delete mode 100644 arch/mips/txx9/rbtx4939/prom.c
>  delete mode 100644 arch/mips/txx9/rbtx4939/setup.c
>  delete mode 100644 drivers/mtd/maps/rbtx4939-flash.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
