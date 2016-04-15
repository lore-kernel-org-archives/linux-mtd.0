Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arBeY-0004fn-4G
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 21:51:51 +0000
Message-ID: <571161A7.1050804@denx.de>
Date: Fri, 15 Apr 2016 23:48:23 +0200
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
CC: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] mtd: spi-nor: fix support of Quad SPI memories
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1460567255.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/13/2016 07:23 PM, Cyrille Pitchen wrote:
> Hi all,
> 
> this series is RFC but has already been tested on a sama5d2x xplained
> board with the Atmel QSPI controller + Micron n25q128a13:
> compatible = "micron,n25q128a13", "jedec,spi-nor";
> 
> This first 3 patches of the series are stable and have already been
> submitted to linux-mtd. They are required as a base for the later
> patches.
> 
> Support of Micron memories has been implemented as an example, other
> memory entries should be updated as needed in the spi_nor_ids[] table.
> 
> This new way to support Quad SPI memories is inspired by the JEDEC
> SFDP standard. However SFDP tables are not provided by all memories and
> some of them badly implement the standard. Also the standard itself
> can tell whether the memory supports the 2-2-2 mode but doesn't provide
> the procedure to enter/leave this mode as provided for the 4-4-4 mode.
> 
> 
> Please note that some commit messages are missing but a review might be
> really helpfull! :)
> 
> Almost all the actual rework is done in patch 4.

For Altera SoCFPGA , Cadence QSPI NOR controller , Terasic SoCkit board:
Tested-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
