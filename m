MIME-Version: 1.0
In-Reply-To: <1315450031-6371-1-git-send-email-b32955@freescale.com>
References: <1315450031-6371-1-git-send-email-b32955@freescale.com>
Date: Fri, 9 Sep 2011 21:56:57 +0200
Message-ID: <CAHMSPgPxNxCMjvemzQh0nrtYu7nj9+sYghKzrS3VHYhxDc1ocw@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] add the GPMI controller driver for IMX23/IMX28
From: Koen Beel <koen.beel.barco@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dedekind1@gmail.com, s.hauer@pengutronix.de, w.sang@pengutronix.de,
	marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
	shijie8@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested-by: Koen Beel <koen.beel@barco.com>

On Thu, Sep 8, 2011 at 4:47 AM, Huang Shijie <b32955@freescale.com> wrote:
> The patch set is based on Artem's tree:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://git.infradead.org/users/dedekind/l2-mtd=
-2.6.git
>
> The general-purpose media interface(GPMI) controller is a flexible interf=
ace
> to up to several NAND flashs.
>
> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC accelera=
tor.
>
> With the help of BCH, the GPMI controller can choose to do the hardware E=
CC or
> not.
>
> This driver is a _pure_ MTD NAND controller driver now.
>
>
> The driver depends on another GPMI-NAND device patch set, you can find th=
em at :
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] http://marc.info/?l=3Dlinux-arm-kernel&m=
=3D131416901319573&w=3D2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] http://marc.info/?l=3Dlinux-arm-kernel&m=
=3D131416912319668&w=3D2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] http://marc.info/?l=3Dlinux-arm-kernel&m=
=3D131416891119504&w=3D2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] http://marc.info/?l=3Dlinux-arm-kernel&m=
=3D131416896219539&w=3D2
>
> Test environment:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Using imx23 and imx28 boards for test.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0imx23 :
> =C2=A0 =C2=A0 =C2=A0 =C2=A0console=3DttyAMA0,115200 mtdparts=3Dgpmi-nfc:2=
0m(boot),-(user)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Tested by USB boot and NAND boot.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0imx28 :
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#console=3DttyAMA0,115200 root=3D/dev/mmcblk0p=
3 rw rootwait
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Tested by SD card boot mode.
>
> v11 --> v12:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] remove debug log level mechanism.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] replace BUG/BUG_ON() with pr_err()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] fix compiling warnings
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] optimize the calculation of BCH's geometry=
.
>
> v10 --> v11:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] tiny fixes.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] optimize the calculation of BCH's geometry=
.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] renames
>
> v9 --> v10:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] fix DMA timeout bug by adding custom routi=
ne for reset blocks.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] remove mil{}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] add gpmi_hw_ecclayout.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] add ecc_write_oob() again to prohibit the =
mtd ioctl : MEMWRITEOOB
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] change pr_info to dev_dbg() or pr_err().
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[5] merge the all the dump functions into gpmi=
_dump_info().
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[6] remove parse_mtd_partitions(), and use mtd=
_device_parse_register().
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[7] move the the debug control code from gpmi-=
nand.h to gpmi-nand.c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[8] renames
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[9] others
>
> v8 --> v9:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] remove the ONFI nand code, it will cause t=
he DMA timeout in the ONFI nand.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] remove sysfs entry.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] remove kernel command parameter.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] report to ecclayout that we will use all t=
he page + OOB.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remove the ->ecc_w=
rite_oob().
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] add our own block_markbad() hook.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[5] rename some functions from mil_* to gpmi_*=
.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[6] replace the __raw_readl/__raw_writel to re=
adl/writel.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[7] others
>
> v7 --> v8:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] rename the name from `GPMI-NFC` to `GPMI-N=
AND`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] remove the `hal` layer, and change it to f=
unction library.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] Do not use ~0 to initialize the DMA addres=
s.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] fix the issue : several DMA channels share=
 the same IRQ.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] DMA timeout issue. I use the .config creat=
ed by `make mxs_defconfig`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and the bug never occur. It seem=
s some other module has impact to the
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DMA.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Of course, you should enable the=
 UBIFS,MTD_CHAR and GPMI for
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the .config. You can also disabl=
e the SPIN-LOCK/MUTEX debug features.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[5] add function to print out the GPMI registe=
rs.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[6] others.
>
> v6 --> v7:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] remove the function wrapping the clock.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] use the module_param() for debugging.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] use the new interface of MTD partitions.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replace add_mtd_pa=
rtitions() with mtd_device_register().
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] use pr_info() to print log.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] add `__devinit` for some functions, etc.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[5] add `gpmi_nfc` to control the GPMI-NFC dri=
ver's initialization.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[6] others.
>
> v5 --> v6:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] split out the IMX23/IMX28 arch code to sep=
arate patches.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] fix bug : missing empty item in the end of=
 platform_id array.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] inconsistent identation.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] others
>
> v4 --> v5:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] rename the files.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] fix PM bug
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] remove the rom_helper code, and move the n=
ecessary initialization code
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to the main file.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] change the macros from CPU_IS_* to GPMI_IS=
_*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] remove the default partition layout init c=
ode. revert back the
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition parsing =
command line code.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[5] others
>
> v3 --> v4:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] use the nand_ids{} as the nand database, d=
rop my own database.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] remove the patch for DMA enginer, Shawn wi=
ll submit his own version.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] use the platform_id to distinguish differe=
nt Archs.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] fix the strange coding style.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] others.
>
> v2 --> v3:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] merge the imx23 and imx28 into one file(in=
cluding the header file).
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] remove the unuse registers in the headers.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] fix DMA bugs
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] add bus width field to nand_attr{}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] others
>
> v1 --> v2:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0] merge the common files into the gpmi-nfc-m=
ain.c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] change the code to get the clock.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2] remove the timing in the nand_device_info{=
}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3] fix DMA errors
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4] add the nand_device_info.[ch] to generic c=
ode
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[5] use the chip->onfi_version for the ONFI na=
nd
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[6] useless init
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[7] others
>
> Huang Shijie (3):
> =C2=A0MTD : add the common code for GPMI-NAND controller driver
> =C2=A0MTD : add helper functions library and header files for GPMI NAND
> =C2=A0 =C2=A0driver
> =C2=A0MTD : add GPMI-NAND driver in the config and Makefile
>
> =C2=A0drivers/mtd/nand/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 13 +
> =C2=A0drivers/mtd/nand/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0drivers/mtd/nand/gpmi-nand/Makefile =C2=A0 =C2=A0| =C2=A0 =C2=A03 +
> =C2=A0drivers/mtd/nand/gpmi-nand/bch-regs.h =C2=A0| =C2=A0 84 ++
> =C2=A0drivers/mtd/nand/gpmi-nand/gpmi-lib.c =C2=A0| 1057 ++++++++++++++++=
+++++
> =C2=A0drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 1619 +++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/mtd/nand/gpmi-nand/gpmi-nand.h | =C2=A0273 ++++++
> =C2=A0drivers/mtd/nand/gpmi-nand/gpmi-regs.h | =C2=A0172 ++++
> =C2=A08 files changed, 3222 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 drivers/mtd/nand/gpmi-nand/Makefile
> =C2=A0create mode 100644 drivers/mtd/nand/gpmi-nand/bch-regs.h
> =C2=A0create mode 100644 drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> =C2=A0create mode 100644 drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> =C2=A0create mode 100644 drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> =C2=A0create mode 100644 drivers/mtd/nand/gpmi-nand/gpmi-regs.h
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
