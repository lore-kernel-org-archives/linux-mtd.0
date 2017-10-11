Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2C2j-00012h-Oa
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 08:07:14 +0000
Subject: Re: [PATCH v2 00/10] spi-nor: intel-spi: Various fixes and
 enhancements
To: Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
References: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <d7d472f0-353f-da9f-9a2a-6c963dc03db3@wedev4u.fr>
Date: Wed, 11 Oct 2017 10:06:44 +0200
MIME-Version: 1.0
In-Reply-To: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 11/09/2017 à 11:41, Bin Meng a écrit :
> This series does several bug fixes and clean ups against the intel-spi
> spi-nor driver, as well as enhancements to make the driver independent
> on the underlying BIOS/bootloader.
> 
> At present the driver uses the HW sequencer for the read/write/erase on
> all supported platforms, read_reg/write_reg for BXT, and the SW sequencer
> for read_reg/write_reg for BYT/LPT. The way the driver uses the HW and SW
> sequencer relies on some programmed register settings and hence creates
> unneeded dependencies with the underlying BIOS/bootloader. For example,
> the driver unfortunately does not work as expected when booting from
> Intel Baytrail FSP based bootloaders like U-Boot, as the Baytrail FSP
> does not set up some SPI controller settings to make the driver happy.
> Now such limitation has been removed with this series.
> 
> Changes in v2:
> - Add stable kernel tags in the commit message (patch [03/10])
> - Fix typo of 'operatoin' (patch [10/10])
> - Add Mika Westerberg's 'Acked-by' tag
> 
> Bin Meng (10):
>   spi-nor: intel-spi: Fix number of protected range registers for
>     BYT/LPT
>   spi-nor: intel-spi: Remove useless 'buf' parameter in the HW/SW cycle
>   spi-nor: intel-spi: Fix broken software sequencing codes
>   spi-nor: intel-spi: Check transfer length in the HW/SW cycle
>   spi-nor: intel-spi: Use SW sequencer for BYT/LPT
>   spi-nor: intel-spi: Remove 'Atomic Cycle Sequence' in
>     intel_spi_write()
>   spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS
>   spi-nor: intel-spi: Remove the unnecessary HSFSTS register RW
>   spi-nor: intel-spi: Rename swseq to swseq_reg in 'struct intel_spi'
>   spi-nor: intel-spi: Fall back to use SW sequencer to erase
> 
>  drivers/mtd/spi-nor/intel-spi.c | 209 +++++++++++++++++++++++++++++-----------
>  1 file changed, 151 insertions(+), 58 deletions(-)
> 
Series applied to the spi-nor/next branch of l2-mtd

Thanks!
