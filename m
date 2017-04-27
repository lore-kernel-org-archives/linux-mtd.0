Received: from 19.mo5.mail-out.ovh.net ([46.105.35.78])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3kde-0006u9-9h
 for linux-mtd@lists.infradead.org; Thu, 27 Apr 2017 14:43:24 +0000
Received: from player760.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id DBC05E9F77
 for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2017 16:42:59 +0200 (CEST)
Subject: Re: [PULL] mtd: spi-nor: changes for 4.12
To: Brian Norris <computersforpeace@gmail.com>
References: <963d5dab-f6a5-daea-4e12-8b5fd0f5d1e6@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ludovic Barre <ludovic.Barre@st.com>, Arnd Bergmann <arnd@arndb.de>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <13610ad7-6362-1342-9d96-76a491f279af@wedev4u.fr>
Date: Thu, 27 Apr 2017 16:42:50 +0200
MIME-Version: 1.0
In-Reply-To: <963d5dab-f6a5-daea-4e12-8b5fd0f5d1e6@wedev4u.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Ludovic and Arnd

Hi Brian,

A little patch was sent by Arnd to fix some module compilation issue up.
https://patchwork.ozlabs.org/patch/755980/

As said, in this other thread, I can either

1 -  squash Arnd patch into Ludovic's one in the 'next' branch of
github/spi-nor, create a new tag and send you a new PR.

or

2 - keep Arnd patch as is and send you a new PR: still starting from
4.11-rc1 or from the current for-4.12 tag?

Let me know the solution you prefer :)
Sorry for this additional delay!

Best regards,

Cyrille


Le 27/04/2017 à 00:15, Cyrille Pitchen a écrit :
> Hi Brian,
> 
> this is the spi-nor PR for 4.12. Just few bug fixes in some (Q)SPI controller
> drivers and support to new memory parts.
> Only one new driver for the STM32 QSPI controller.
> 
> I didn't include any of my patches upgrading the spi-nor framework
> since they didn't spend enough time in linux-next.
> 
> Best regards,
> 
> Cyrille
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git://github.com/spi-nor/linux.git tags/spi-nor/for-4.12
> 
> for you to fetch changes up to d3848f3a4c2168c45d80ab0f826517bac22e81cf:
> 
>   mtd: mtk-nor: set controller's address width according to nor flash (2017-04-16 19:16:27 +0200)
> 
> ----------------------------------------------------------------
> This pull request contains the following notable changes:
> - fixes in the hisi SPI controller driver.
> - fixes in the intel SPI controller driver.
> - fixes in the Mediatek SPI controller driver.
> - fixes to some SPI flash memories not supported the Chip Erase command.
> - add support to some new memory parts (Winbond, Macronix, Micron, ESMT).
> - add new driver for the STM32 QSPI controller.
> 
> ----------------------------------------------------------------
> Alexander Kurz (2):
>       drivers mtd: spi-nor: add Winbond W25Q20 variants
>       drivers mtd: spi-nor: add Macronix MX25Ux033E and MX25Ux035 variants
> 
> Alexey Khoroshilov (1):
>       mtd: spi-nor: hisi: do not ignore clk_prepare_enable() failure
> 
> Guochun Mao (1):
>       mtd: mtk-nor: set controller's address width according to nor flash
> 
> L. D. Pinney (1):
>       mtd: spi-nor: Add support for ESMT F25L32QA and F25L64QA
> 
> Ludovic Barre (1):
>       mtd: spi-nor: add driver for STM32 quad spi flash controller
> 
> Mathias Kresin (1):
>       mtd: spi-nor: enable stateless 4b op codes for mx25u25635f
> 
> Nicholas Mc Guire (2):
>       mtd: spi-nor: intel: use true/false for boolean
>       mtd: spi-nor: intel: use ERR_CAST in return statement
> 
> Nobuhiro Iwamatsu (1):
>       mtd: spi-nor: Add support for N25Q256A11
> 
> mar.krzeminski (2):
>       mtd: spi-nor: Fix whole chip erasing for stacked chips.
>       mtd: spi-nor: Disable chip erase for Micron n25q00.
> 
>  drivers/mtd/spi-nor/Kconfig         |   7 ++
>  drivers/mtd/spi-nor/Makefile        |   1 +
>  drivers/mtd/spi-nor/hisi-sfc.c      |   5 +-
>  drivers/mtd/spi-nor/intel-spi.c     |   4 +-
>  drivers/mtd/spi-nor/mtk-quadspi.c   |  27 +++++++
>  drivers/mtd/spi-nor/spi-nor.c       |  18 ++++-
>  drivers/mtd/spi-nor/stm32-quadspi.c | 694 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 750 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
