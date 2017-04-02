Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cuiyT-0005J4-0H
 for linux-mtd@lists.infradead.org; Sun, 02 Apr 2017 17:07:34 +0000
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id BAA431BD5F
 for <linux-mtd@lists.infradead.org>; Sun,  2 Apr 2017 19:07:11 +0200 (CEST)
Subject: Re: [PATCH v5 3/6] mtd: spi-nor: add spi_nor_init() function
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, jartur@cadence.com, kdasu.kdev@gmail.com,
 mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <8d88fd247815979bee2a6d3be50fa57a80c2f229.1490220411.git.cyrille.pitchen@atmel.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <8648b581-d279-3d89-2a28-271e76cdbf73@wedev4u.fr>
Date: Sun, 2 Apr 2017 19:06:58 +0200
MIME-Version: 1.0
In-Reply-To: <8d88fd247815979bee2a6d3be50fa57a80c2f229.1490220411.git.cyrille.pitchen@atmel.com>
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

Le 23/03/2017 à 00:33, Cyrille Pitchen a écrit :
> This patch extracts some chunks from spi_nor_scan() and moves them into
> a new spi_nor_init() function.
> 
> Indeed, spi_nor_init() regroups all the required SPI flash commands to be
> sent to the SPI flash memory before performing any runtime operations
> (Fast Read, Page Program, Sector Erase, ...). Hence spi_nor_init():
> 1) removes the flash protection if applicable for certain vendors.
> 2) sets the Quad Enable bit, if needed, before using Quad SPI protocols.
> 3) makes the memory enter its (stateful) 4-byte address mode, if needed,
>    for SPI flash memory > 128Mbits not supporting the 4-byte address
>    instruction set.
> 
> spi_nor_scan() now ends by calling spi_nor_init() once the probe phase has
> completed. Further patches could also use spi_nor_init() to implement the
> mtd->_resume() handler for the spi-nor framework.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Applied to github/spi-nor
