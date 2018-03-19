Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ey21E-0005Uw-2F
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 21:08:38 +0000
Date: Mon, 19 Mar 2018 22:08:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <nagasureshkumarrelli@gmail.com>
Cc: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <michals@xilinx.com>, <punnaia@xilinx.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [LINUX PATCH v8 1/2] Documentation: nand: pl353: Add
 documentation for controller and driver
Message-ID: <20180319220811.34a99c3d@xps13>
In-Reply-To: <1521024494-30632-1-git-send-email-nagasureshkumarrelli@gmail.com>
References: <1521024494-30632-1-git-send-email-nagasureshkumarrelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi naga,

On Wed, 14 Mar 2018 16:18:14 +0530, <nagasureshkumarrelli@gmail.com>
wrote:

> From: Naga Sureshkumar Relli <nagasure@xilinx.com>
>=20
> Added notes about the controller and driver
>=20
> Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
> ---
> Changes in v8
>  - None
> Changes in v7:
> - None
> Changes in v6:
> - None
> Changes in v5:
> - Fixed the review comments
> Changes in v4:
> - None
> ---
>  Documentation/mtd/nand/pl353-nand.txt | 92 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/mtd/nand/pl353-nand.txt
>=20
> diff --git a/Documentation/mtd/nand/pl353-nand.txt b/Documentation/mtd/na=
nd/pl353-nand.txt
> new file mode 100644
> index 0000000..ac6fbd5
> --- /dev/null
> +++ b/Documentation/mtd/nand/pl353-nand.txt
> @@ -0,0 +1,92 @@
> +This documents provides some notes about the ARM pl353 smc controller us=
ed in
> +Zynq SOC and confined to NAND specific details.
> +
> +Overview of the controller
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +	The SMC (PL353) supports two memory interfaces:
> +	Interface 0 type SRAM.
> +	Interface 1 type NAND.
> +	This configuration supports the following configurable options:
> +	   . 32-bit or 64-bit AXI data width
> +	   . 8-bit, 16-bit, or 32-bit memory data width for interface 0
> +	   . 8-bit, or 16-bit memory data width for interface 1
> +	   . 1-4 chip selects on each interface
> +	   . SLC ECC block for interface 1
> +
> +For more information, refer the below link for TRM
> +http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/
> +DDI0380G_smc_pl350_series_r2p1_trm.pdf

I think it is better to do not break the links?

> +
> +NAND memory accesses
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	. Two phase NAND accesses
> +	. NAND command phase transfers
> +	. NAND data phase transfers
> +
> +Two phase NAND accesses
> +	The SMC defines two phases of commands when transferring data to or from
> +NAND flash.
> +
> +Command phase
> +	Commands and optional address information are written to the NAND flash.
> +The command and address can be associated with either a data phase opera=
tion to
> +write to or read from the array, or a status/ID register transfer.
> +
> +Data phase
> + Data is either written to or read from the NAND flash. This data can be=
 either
> +data transferred to or from the array, or status/ID register information.
> +
> +NAND AXI address setup
> +       AXI address      Command phase      Data phase
> +	[31:24]         Chip address       Chip address
> +	[23]            NoOfAddCycles_2    Reserved
> +	[22]            NoOfAddCycles_1    Reserved
> +	[21]            NoOfAddCycles_0    ClearCS
> +	[20]            End command valid  End command valid
> +	[19]            0                  1
> +	[18:11]         End command        End command
> +	[10:3]          Start command      [10] ECC Last
> +					   [9:3] Reserved
> +	[2:0]           Reserved           Reserved
> +
> +ECC
> +=3D=3D=3D
> +    It operates on a number of 512 byte blocks of NAND memory and can be
> +programmed to store the ECC codes after the data in memory. For writes,
> +the ECC is written to the spare area of the page. For reads, the result =
of
> +a block ECC check are made available to the device driver.
> +
> +------------------------------------------------------------------------
> +|               n * 512 blocks                  | extra  | ecc    |     |
> +|                                               | block  | codes  |     |
> +------------------------------------------------------------------------
> +
> +The ECC calculation uses a simple Hamming code, using 1-bit correction 2=
-bit
> +detection. It starts when a valid read or write command with a 512 byte =
aligned
> +address is detected on the memory interface.
> +
> +Driver details
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	The NAND driver has dependency with the pl353_smc memory controller
> +driver for intializing the nand timing parameters, bus width, ECC modes,

                              ^NAND

> +control and status information.
> +
> +Since the controller expects that the chipselect bit should be cleared f=
or the

                                         ^chip select   ^ would? is?

> +last data transfer i.e last 4 data bytes, the existing nandbase page

What is nandbase?

> +read/write routines for soft ecc and ecc none modes will not work. So, i=
norder

s/ecc/ECC/                                                   in order^

> +to make this driver work, it always updates the ecc mode as HW ECC and c=
an

s/ecc/ECC/

> +implemented the page read/write functions for supporting the SW ECC.

s/can implemented/implements/?

I don't understand this paragraph, can you explain it please? I am not
sure to understand the limitation nor how you address it.

> +
> +HW ECC mode:
> +	Upto 2K page size is supported and beyond that it retuns
> +-ENOSUPPORT error. If the flsh has ONDIE ecc controller then the

    ^ -ENOTSUPP              ^flash   ^on-die ECC

> +priority has given to the ONDIE ecc controller. Also the current

            ^ is given?      ^on-die ECC

> +implementation has support for upto 64 byte oob area

                                  ^up to 64 bytes of OOB data.

> +
> +SW ECC mode:
> +	It supports all the pgae sizes. But since, zynq soc bootrom uses

                            ^ page                 ^Zync SOC

> +HW ECC for the devices that have pgae size <=3D2K so, to avoid any ecc r=
elated

                                    ^ page <=3D 2K,               ECC^

> +issues during boot, prefer HW ECC over SW ECC.

I suppose this means that if no ECC mode is given ie. no nand-ecc-mode
in the DT, the driver will use HW ECC by default, right?

> +
> +For devicetree binding information please refer the below dt binding file
> +Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt.

This file does not exist in my tree.


Thanks for contributing this driver,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
