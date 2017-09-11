Received: from mail-dm3nam03on0059.outbound.protection.outlook.com
 ([104.47.41.59] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drSlU-0004KB-QN
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 17:44:58 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>
CC: "sr@denx.de" <sr@denx.de>
Subject: Re: [PATCH v2 00/10] spi-nor: intel-spi: Various fixes and
 enhancements
Date: Mon, 11 Sep 2017 17:44:31 +0000
Message-ID: <1505151868.31322.98.camel@infinera.com>
References: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <282A0314ABD70E4AB250F062F884B4C5@infinera.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2017-09-11 at 02:41 -0700, Bin Meng wrote:
> This series does several bug fixes and clean ups against the intel-spi
> spi-nor driver, as well as enhancements to make the driver independent
> on the underlying BIOS/bootloader.
>=20
> At present the driver uses the HW sequencer for the read/write/erase on
> all supported platforms, read_reg/write_reg for BXT, and the SW sequencer
> for read_reg/write_reg for BYT/LPT. The way the driver uses the HW and SW
> sequencer relies on some programmed register settings and hence creates
> unneeded dependencies with the underlying BIOS/bootloader. For example,
> the driver unfortunately does not work as expected when booting from
> Intel Baytrail FSP based bootloaders like U-Boot, as the Baytrail FSP
> does not set up some SPI controller settings to make the driver happy.
> Now such limitation has been removed with this series.

Hi Bin

Just starting to test these on Rangeley and got a question: We have two SPI=
 flashes on CS0 resp. CS1=20
and the mtd driver seems to only map the first of those flashes. Is this in=
tentional or
are we missing something?

 Jocke

>=20
> Changes in v2:
> - Add stable kernel tags in the commit message (patch [03/10])
> - Fix typo of 'operatoin' (patch [10/10])
> - Add Mika Westerberg's 'Acked-by' tag
>=20
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
>=20
>  drivers/mtd/spi-nor/intel-spi.c | 209 +++++++++++++++++++++++++++++-----=
------
>  1 file changed, 151 insertions(+), 58 deletions(-)
>=20
