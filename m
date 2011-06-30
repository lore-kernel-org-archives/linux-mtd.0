From: Huang Shijie-B32955 <B32955@freescale.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: reply: [PATCH v7 0/3]  add the GPMI controller driver for IMX23/IMX28
Date: Thu, 30 Jun 2011 15:30:48 +0000
Message-ID: <14C4E31473AF7E4B98176CB73615181C19FB66@039-SN1MPN1-006.039d.mgd.msft.net>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "thierry.nolf.barco@gmail.com" <thierry.nolf.barco@gmail.com>,
	"LW@KARO-electronics.de" <LW@KARO-electronics.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolfram:=0A=
=0A=
Thanks for your hard work.=0A=
=0A=
On Wed, Jun 29, 2011 at 04:24:35PM +0800, Huang Shijie wrote:=0A=
> The general-purpose media interface(GPMI) controller is a flexible interf=
ace=0A=
> to up to several NAND flashs.=0A=
>=0A=
> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC accelera=
tor.=0A=
>=0A=
> With the help of BCH, the GPMI controller can choose to do the hardware E=
CC or=0A=
> not.=0A=
>=0A=
> This driver is a _pure_ MTD NAND controller driver now.=0A=
=0A=
It seems writing does not work for me. I use a MX28EVK, NAND is reported as=
:=0A=
=0A=
[    1.670000] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron MT=
29F4G08ABADAWP)=0A=
=0A=
With ubiformat or the mtd_stresstest-module, I get stuff like this:=0A=
=0A=
root@device:~ ubiformat /dev/mtd0=0A=
ubiformat: mtd0 (nand), size 536870912 bytes (512.0 MiB), 4096 eraseblocks =
of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes=0A=
libscan: scanning eraseblock 4095 -- 100 % complete=0A=
ubiformat: 4094 eraseblocks are supposedly empty=0A=
ubiformat: 2 bad eraseblocks found, numbers: 1243, 3935=0A=
ubiformat: formatting eraseblock 2 --  0 % complete=0A=
[  172.430000] [ start_dma_without_bch_irq : 393 ] DMA timeout!!!=0A=
[  173.430000] [ start_dma_with_bch_irq : 424 ] bch timeout!!!=0A=
[  173.430000] [ mil_ecc_write_page : 1647 ] Error in ECC-based write: -110=
=0A=
[  173.440000] [ send_command : 305 ] step 1 error=0A=
[  173.440000] [ mil_cmd_ctrl : 1369 ] Chip: 0, Error -1=0A=
[  173.450000] [ send_command : 305 ] step 1 error=0A=
[  173.450000] [ mil_cmd_ctrl : 1369 ] Chip: 0, Error -1=0A=
[  173.460000] [ read_data : 386 ] step 1 error=0A=
...=0A=
=0A=
Reading works though, mtd_readtest passes. Wild guess: something wrong=0A=
with the safe timings, perhaps?=0A=
---------------------------------------------------------------------------=
---------------------------=0A=
The log shows that it's a DMA failure.=0A=
=0A=
I will debug it when i am free.=0A=
=0A=
Best Regards=0A=
Huang Shijie=0A=
=0A=
=0A=
---------------------------------------------------------------------------=
---------------------------=0A=
=0A=
Regards,=0A=
=0A=
   Wolfram=0A=
=0A=
--=0A=
Pengutronix e.K.                           | Wolfram Sang                |=
=0A=
Industrial Linux Solutions                 | http://www.pengutronix.de/  |=
=0A=
