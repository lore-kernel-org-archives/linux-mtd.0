Received: from 5.mo69.mail-out.ovh.net ([46.105.43.105])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cuixV-0004p6-F0
 for linux-mtd@lists.infradead.org; Sun, 02 Apr 2017 17:06:35 +0000
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 2C2DF1D4C2
 for <linux-mtd@lists.infradead.org>; Sun,  2 Apr 2017 19:06:11 +0200 (CEST)
Subject: Re: [PATCH v5 2/6] mtd: m25p80: add support of SPI 1-2-2 and 1-4-4
 protocols
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, jartur@cadence.com, kdasu.kdev@gmail.com,
 mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <3426fd033830e2df15eae27c1b5284983961fa8e.1490220411.git.cyrille.pitchen@atmel.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <278ef3b6-599a-5254-932d-33ceb1b73a88@wedev4u.fr>
Date: Sun, 2 Apr 2017 19:05:58 +0200
MIME-Version: 1.0
In-Reply-To: <3426fd033830e2df15eae27c1b5284983961fa8e.1490220411.git.cyrille.pitchen@atmel.com>
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
> Before this patch, m25p80_read() supported few SPI protocols:
> - regular SPI 1-1-1
> - SPI Dual Output 1-1-2
> - SPI Quad Output 1-1-4
> On the other hand, m25p80_write() only supported SPI 1-1-1.
> 
> This patch updates both m25p80_read() and m25p80_write() functions to let
> them support SPI 1-2-2 and SPI 1-4-4 protocols for Fast Read and Page
> Program SPI commands.
> 
> It adopts a conservative approach to avoid regressions. Hence the new
> implementations try to be as close as possible to the old implementations,
> so the main differences are:
> - the tx_nbits values now being set properly for the spi_transfer
>   structures carrying the (op code + address/dummy) bytes
> - and the spi_transfer structure being split into 2 spi_transfer
>   structures when the numbers of I/O lines are different for op code and
>   for address/dummy byte transfers on the SPI bus.
> 
> Besides, the current spi-nor framework supports neither the SPI 2-2-2 nor
> the SPI 4-4-4 protocols. So, for now, we don't need to update the
> m25p80_{read|write}_reg() functions as SPI 1-1-1 is the only one possible
> protocol.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Applied to github/spi-nor
