Received: from mail-eopbgr40096.outbound.protection.outlook.com ([40.107.4.96]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJQRs-0006dC-St
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2016 19:51:47 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "nicolas.ferre@atmel.com" <nicolas.ferre@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mar.krzeminski@gmail.com" <mar.krzeminski@gmail.com>
Subject: Odp.: [PATCH v4 0/8] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
Date: Tue, 20 Dec 2016 19:51:21 +0000
Message-ID: <AM4PR0701MB2130E92644C8C4A359715F36FE900@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <cover.1479736401.git.cyrille.pitchen@atmel.com>
 <AM4PR0701MB21304810DE7FBE18431901FFFE9B0@AM4PR0701MB2130.eurprd07.prod.outlook.com>,
 <71cfda0f-5dd5-cbbc-c6eb-b6ebfa80f1ca@atmel.com>
In-Reply-To: <71cfda0f-5dd5-cbbc-c6eb-b6ebfa80f1ca@atmel.com>
Content-Language: pl-PL
Content-Type: text/plain; charset="iso-8859-1"
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


> Hi Marcin,
>
> Le 13/12/2016 =E0 10:46, Krzeminski, Marcin (Nokia - PL/Wroclaw) a =E9cri=
t :
> >=20
> >=20
> >> -----Original Message-----
> >> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Beha=
lf
> >> Of Cyrille Pitchen
> >> Sent: Monday, November 21, 2016 3:16 PM
> >> To: computersforpeace@gmail.com; marek.vasut@gmail.com;
> >> boris.brezillon@free-electrons.com; richard@nod.at; linux-
> >> mtd@lists.infradead.org
> >> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>; nicolas.ferre@atmel.c=
om;
> >> linux-kernel@vger.kernel.org
> >> Subject: [PATCH v4 0/8] mtd: spi-nor: parse SFDP tables to setup (Q)SP=
I
> >> memories
> >>
> >> Hi all,
> >>
> >> This series extends support of SPI protocols to new protocols such as =
SPI x-2-
> >> 2 and SPI x-4-4. Also spi_nor_scan() tries now to select the right op =
codes,
> >> timing parameters (number of mode and dummy cycles) and erase sector
> >> size by parsing the Serial Flash Discoverable Parameter (SFDP) tables,=
 when
> >> available, as defined in the JEDEC JESD216 specifications.
> >>
> >> When SFDP tables are not available, legacy settings are still used for
> >> backward compatibility (SPI and earlier QSPI memories).
> >>
> >> Support of SPI memories >128Mbits is also improved by using the 4byte
> >> address instruction set, when available. Using those dedicated op code=
s is
> >> stateless as opposed to enter the 4byte address mode, hence a better
> >> compatibility with some boot loaders which expect to use 3byte address=
 op
> >> codes.
> >>
> >>
> >> This series was tested on a Atmel sama5d2 xplained board with the atme=
l-
> >> qspi.c driver. Except for SST memories, the SPI bus clock was set to 8=
3MHz.
> >> The config MTD_SPI_NOR_USE_4K_SECTORS was selected.
> >>
> >> For my tests, I used some shell scripts using mtd_debug and sha1sum to
> >> check the data integrity.
> >>
> >> e.g:
> >> #!/bin/sh
> >>
> >> mtd_debug erase /dev/mtd5 0 0x780000
> >> mtd_debug write /dev/mtd5 0 7674703 sama5d4_doc11238.pdf mtd_debug
> >> read /dev/mtd5 0 7674703 sama5d4_tmp.pdf
> >>
> >> sha1sum sama5d4_doc11238.pdf sama5d4_tmp.pdf
> >>
> >>
> >> Depending on the actual memory size, I may have used other partitions
> >> (/dev/mtd4) and input file size (2880044 and 320044 bytes).
> >>
> >>
> >> The series was tested with the following QSPI memories:
> >>
> >> Spansion/Cypress:
> >> - s25fl127s  OK
> >> - s25fl512s  OK
> >> - s25fl164k  OK
> >>
> >> Micron:
> >> - n25q128a   OK
> >> - n25q512    OK
> >> - n25q01g    OK
> >>
> >> Macronix:
> >> - mx25v1635f OK
> >> - mx25l3235f OK
> >> - mx25l3273f OK
> >> - mx25l6433f OK
> >> - mx25l6473f OK
> >> - mx25l12835f        OK
> >> - mx25l12845g        OK
> >> - mx25l12873g        OK
> >> - mx25l25645g        OK
> >> - mx25l25673g        OK
> >> - mx25l51245g        OK
> >> - mx66l1g45g OK
> >>
> >> SST:
> >> - sst26vf016b        OK
> >> - sst26vf032b        OK
> >> - sst26vf064b        OK
> >>
> >>
> >> Best regards,
> >>
> >> Cyrille
> >>
> > Hello,
> >=20
> > I have tested this series on:
> > mx66u51235f OK
> > mt25qu01g OK(1)
> > s25fs512s FAILED(2)
> >=20
> > (1) - There is a problem with Die Erase command. There is no 4byte vers=
ion. I workarounded it by enabling 4byte mode before send, and disabled jus=
t after.
> > Resigning from Die Erase is bad idea because of erase speed. Having sta=
teless mode is also bad, so some better idea that my workaround could be ni=
ce.
> > (2) - Totally failed because this chip does not support 64KiB sectors, =
but still reports that command for erasing that kind of sector is available=
,
> > moreover it is the same as command for erasing 256KiB sector. Solution =
for this, and for other flash could be that preferred sector size
> > is a parameter for spi-nor framework.
> >=20
>
> OK, I need to develop another patch adding support with the Sector Map
> Parameter Table, which is optional (1) when all erase sectors share a
> common size but becomes mandatory (2) when those erase sectors have
> different sizes.
>
> Looking at the datasheet of the Cypress S25FS512S, this memory falls into
> case (2), meaning that even without the SFDP patch, the current spi-nor
> framework is not able to implement erase operations properly. Indeed
> spi_nor_erase() assumes an uniform erase sector size.

Yes, I have rewritten version that try to support erase regions.
>
> However this SFDP patch, when combined with the previous patch of the
> series adding support to the SPI 1-4-4 protocol, already fixes another
> issue of the S25FS512S part: this memory doesn't support the Fast Read
> 1-1-4 (6Bh) command at all but only the Fast Read 1-4-4 (EBh).

Indeed, I could removed my patch for that and it still worked :).
>
> I think the support of the Sector Map Parameter Table should be sent in a
> dedicated patch otherwise there would be to many modifications in a singl=
e
> patch making it even harder to review.

Yes, without basic JESD216 parsing it is pointless to even start a work on =
erase region support.
BTW, S25FS512S is tricky, in case when 4KiB sectors are at the beginning yo=
u need
to have at least three erase regions:
- 0 - 32KiB (8x4KiB) - erase with 4KiB_ERASE_CMD
- 32KiB - 256KiB - to mark rest of the firs sector, it need to be erased wi=
t Sector Erase CMD.
- rest, erased with Sector Erase CMD.

Thanks,
Marcin

>
> Thanks for your review, it is very helpful and appreciated :)
>
> Best regards,
>
> Cyrille
>
>
> > My tests covers my use case of mtd/spi-nor framework (ubi, ubifs and jf=
fs2 + some regression).
> >       =20
> > Some small comments in patches.
> >=20
> > Thanks,
> > Marcin
> >=20
> >> ChangeLog:
> >>
> >> v3 -> v4
> >> - replace dev_info() by dev_dbg() in patch 1.
> >> - split former patch 2 into 2 patches:
> >>   + new patch 2 deals with the rename of SPINOR_OP_READ4_* macros
> >>   + new patch 3 deals with the alternative methode to support memory
> >>> 16MiB
> >> - add comment in patch 3 to describe the dichotomic search performed b=
y
> >>   spi_nor_convert_opcode().
> >> - change return type from int to void for m25p80_proto2nbits() in patc=
h 6.
> >> - remove former patches 8 & 9 from the v2 series: the support of the
> >>   Macronix mx66l1g45g memory will be sent in a separated patch.
> >>
> >> v2 -> v3
> >> - tested with new samples: Micron n25q512, n25q01g and Macronix
> >>   mx25v1635f, mx25l3235f, mx25l3273f.
> >> - add "Reviewed-by: Jagan Teki <jagan@openedev.com>" on patch 1.
> >> - add "Tested-by: Vignesh R <vigneshr@ti.com>" on patch 2.
> >> - fix some checkpatch warnings.
> >> - add call of spi_nor_wait_till_ready() in spansion_new_quad_enable()
> >>   and sr2_bit7_quad_enable(), as suggested by Joel Esponde on patch 6.
> >> - test JESD216 rev A (minor 5) instead of rev B (minor 6) with the ret=
urn
> >>   code of spi_nor_parse_sfdp() from spi_nor_init_params() on patch 6.
> >>   The seven additional DWORDs of the Basic Flash Parameter Table were
> >>   introduced in rev A, not rev B, so the 15th DWORD was already availa=
ble
> >>   in rev A. The 15th DWORD provides us with the Quad Enable Requiremen=
ts
> >>   (QER) bits.
> >>   Basic Flash Parameter Table size:
> >>   + JESD216 :  9 DWORDS
> >>   + JESD216A: 16 DWORDS
> >>   + JESD216B: 16 DWORDS
> >>
> >> v1 -> v2
> >> - fix patch 3 to resolve compiler errors on hisi-sfc.c and cadence-qua=
dspi.c
> >>   drivers
> >>
> >>
> >> Cyrille Pitchen (8):
> >>   mtd: spi-nor: improve macronix_quad_enable()
> >>   mtd: spi-nor: rename SPINOR_OP_* macros of the 4-byte address op cod=
es
> >>   mtd: spi-nor: add an alternative method to support memory >16MiB
> >>   mtd: spi-nor: add support of SPI protocols like SPI 1-2-2 and SPI
> >>     1-4-4
> >>   mtd: spi-nor: remove unused set_quad_mode() function
> >>   mtd: m25p80: add support of dual and quad spi protocols to all
> >>     commands
> >>   mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tabl=
es
> >>   mtd: spi-nor: parse SFDP 4-byte Address Instruction Table
> >>
> >>  drivers/mtd/devices/m25p80.c            |  191 ++++--
> >>  drivers/mtd/devices/serial_flash_cmds.h |    7 -
> >>  drivers/mtd/devices/st_spi_fsm.c        |   28 +-
> >>  drivers/mtd/spi-nor/atmel-quadspi.c     |   83 ++-
> >>  drivers/mtd/spi-nor/cadence-quadspi.c   |   18 +-
> >>  drivers/mtd/spi-nor/fsl-quadspi.c       |    8 +-
> >>  drivers/mtd/spi-nor/hisi-sfc.c          |   32 +-
> >>  drivers/mtd/spi-nor/mtk-quadspi.c       |   16 +-
> >>  drivers/mtd/spi-nor/nxp-spifi.c         |   21 +-
> >>  drivers/mtd/spi-nor/spi-nor.c           | 1017
> >> ++++++++++++++++++++++++++++---
> >>  drivers/spi/spi-bcm-qspi.c              |    6 +-
> >>  include/linux/mtd/spi-nor.h             |  164 ++++-
> >>  12 files changed, 1351 insertions(+), 240 deletions(-)
> >>
> >> --
> >> 2.7.4
> >>
> >>
> >> ______________________________________________________
> >> Linux MTD discussion mailing list
> >> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >=20
>
