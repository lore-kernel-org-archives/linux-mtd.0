Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cuix5-0004l3-Gp
 for linux-mtd@lists.infradead.org; Sun, 02 Apr 2017 17:06:09 +0000
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 173321CA5C
 for <linux-mtd@lists.infradead.org>; Sun,  2 Apr 2017 19:05:40 +0200 (CEST)
Subject: Re: [PATCH v5 1/6] mtd: spi-nor: introduce more SPI protocols and the
 Dual Transfer Mode
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, jartur@cadence.com, kdasu.kdev@gmail.com,
 mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <65619c23078469af03e4d53d781a8cffa92d5a61.1490220411.git.cyrille.pitchen@atmel.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <321615f2-4779-40ef-a647-ad78daa79ac3@wedev4u.fr>
Date: Sun, 2 Apr 2017 19:05:25 +0200
MIME-Version: 1.0
In-Reply-To: <65619c23078469af03e4d53d781a8cffa92d5a61.1490220411.git.cyrille.pitchen@atmel.com>
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
> This patch changes the prototype of spi_nor_scan(): its 3rd parameter
> is replaced by a 'struct spi_nor_hwcaps' pointer, which tells the spi-nor
> framework about the actual hardware capabilities supported by the SPI
> controller and its driver.
> 
> Besides, this patch also introduces a new 'struct spi_nor_flash_parameter'
> telling the spi-nor framework about the hardware capabilities supported by
> the SPI flash memory and the associated settings required to use those
> hardware caps.
> 
> Currently the 'struct spi_nor_flash_parameter' is filled with legacy
> values but a later patch will allow to fill it dynamically by reading the
> JESD216 Serial Flash Discoverable Parameter (SFDP) tables from the SPI
> memory.
> 
> With both structures, the spi-nor framework can now compute the best
> match between hardware caps supported by both the (Q)SPI memory and
> controller hence selecting the relevant SPI protocols and op codes for
> (Fast) Read, Page Program and Sector Erase operations.
> 
> The 'struct spi_nor_flash_parameter' also provides the spi-nor framework
> with the number of dummy cycles to be used with each Fast Read commands
> and the erase block size associated to the erase block op codes.
> 
> Finally the 'struct spi_nor_flash_parameter', through the optional
> .enable_quad_io() hook, tells the spi-nor framework how to set the Quad
> Enable (QE) bit of the QSPI memory to enable its Quad SPI features.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Applied to github/spi-nor.
