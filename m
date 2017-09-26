Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwm2N-0004bJ-4O
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 09:20:23 +0000
Received: by mail-wr0-x242.google.com with SMTP id p37so1977756wrb.5
 for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2017 02:19:58 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Issue with Micron QSPI flash in 4.14-rc1
From: Andras Szemzo <szemzo.andras@gmail.com>
In-Reply-To: <51b9af85-1712-7386-293d-1cfb69510f4f@wedev4u.fr>
Date: Tue, 26 Sep 2017 11:19:55 +0200
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, Richard Weinberger <richard@nod.at>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DB981074-F77C-425A-9071-516DFF927F72@gmail.com>
References: <E36A7C66-EC4D-46FF-A6E1-835E1C466E55@gmail.com>
 <51b9af85-1712-7386-293d-1cfb69510f4f@wedev4u.fr>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 2017. Sep 26., at 1:00, Cyrille Pitchen =
<cyrille.pitchen@wedev4u.fr> wrote:
>=20
> thanks for your report, I'll try to study it more closely and propose =
a
> fixup withing the next few days (thinking about invert the logic of
> SKIP_SFDP to disable the parsing by default and enable it memory by
> memory when needed) but here some comments:
>=20

Ok.

>=20
> The wording used in Micron datasheets is quite confusing. They talk
> about their Quad SPI mode only when using the SPI 4-4-4 protocol,
> whereas other manufacturers and the SFDP specification talk about
> enabling Quad SPI (or Quad Enable requirements) when using any Quad =
SPI
> protocols, that is SPI 1-1-4, SPI 1-4-4 or SPI 4-4-4.
>=20
> The Quad Enable requirement is indeed a procedure to set some bit in
> some manufacturer specific status register so pins #Write Protect and
> #Hold/#Reset are reassigned to function IO2 and IO3.
>=20
> Then Micron memories don't have any quad enable requirement: AFAIK, =
they
> just check the value of the 8bit opcode to decide whether or not =
#Write
> Protect and #Hold/#Reset functions should be disabled and replaced by
> IO2 and IO3 functions. That's why there is nothing special to do with
> Micron memories before using SPI 1-1-4 or SPI 1-4-4.
>=20

Thanks for clarification.

>=20
> Could you please test 2 different things for me?
>=20
> 1 - just add a debug trace in spi_nor_parse_bfpt() to print the =
version
> and length of the BFPT header:
>=20
> +	dev_info(nor->dev, "BFPT version %d.%d (length =3D %u)\n",
> +		 bfpt_header->major,
> +		 bfpt_header->minor,
> +		 bfpt_header->length);
>=20
> With you memory, it should output version 1.0 (length =3D 9). If not, =
the
> SFDP tables of your memory are likely to have been incorrectly
> programmed in factory by Micron. It has already happened with some
> Spansion/Cypress memories.
>=20

Yes, as I wrote in my first mail, it=E2=80=99s JESD216 v1.0 compilant =
only, here is the output from kernel:

atmel_qspi 4007c000.qspi: BFPT version 1.0 (length =3D 9)

> 2 - Comment the SNOR_HWCAPS_READ_1_4_4 and SNOR_HWCAPS_READ_4_4_4
> hardware capabilities in the atmel-quadspi.c driver.
>=20
> For read operations and Quad SPI protocols, let's keep only the SPI
> 1-1-4 (SNOR_HWCAPS_READ_1_1_4).
>=20

After commenting out 1_4_4 and 4_4_4 HWCAPS from the atmel-quadspi =
driver, using 1_1_4 only mode is OK,
my board booted fine. [1]=20
I think this mode is equivalent with static flags only.=20

> This driver was developed and tested for the QSPI controller of =
SAMA5D2
> and I think the controller (IP version) is not quite the same on =
SAMV7.
>=20

I don=E2=80=99t see any difference in the datasheets, but it means =
nothing :)

> I would be surprised that SPI 1-4-4 doesn't work with the Atmel QSPI
> controller of SAMV7 but let's verify it.
>=20

My bootloader code based on the older(no SFDP version) ASF driver, and =
that put
the flash to QUAD mode, and use 4_4_4 mode if I=E2=80=99m right, and =
that one is working as it seen from [1]
(I only had to add switching back to 1_1_1 before booting kernel)

Regards,
Andras

[1]:

xboot v1.0
QSPI boot selected
Trying protocol 0 opcode 0x9f
Found memory with JEDEC ID 0x0020ba20.
Found supported memory with JEDEC ID 0x0020ba20 (N25Q512Ax3).
QSPI Flash: Micron Quad mode disabled, will enable it
QSPI: dt blob: Read from 0x400000 to 0x71000000 size: 24572 bytes
QSPI: Image: Read from 0x00 to 0x70007FC0, size: 3252864 bytes
QSPI Flash: Micron Quad mode enabled, will disable it
starting kernel 0x70008001

Booting Linux on physical CPU 0x0
Linux version 4.14.0-rc1 (root@devel) (gcc version 4.9.2 ( 4.9.2-10)) =
#42 Tue Sep 26 11:02:55 CEST 2017
CPU: ARMv7-M [410fc271] revision 1 (ARMv7M), cr=3D00000000
CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
OF: fdt: Machine model: SAME70-sampione board
...
400e1e00.serial: ttyS7 at MMIO 0x400e1e00 (irq =3D 45, base_baud =3D =
9375000) is a ATMEL_SERIAL
spi_nor_parse_sfdp
SFDP header signiture: 50444653
SFDP header minor: 00
SFDP header major: 01
SFDP header nph: 00
spi_nor_parse_sfdp:2439
bfpt addr: 0x30
bfpt.dwords[0]: 0xfffb20e5
bfpt.dwords[1]: 0x1fffffff
bfpt.dwords[2]: 0x6b27eb29
bfpt.dwords[3]: 0xbb273b27
bfpt.dwords[4]: 0xffffffff
bfpt.dwords[5]: 0xbb27ffff
bfpt.dwords[6]: 0xeb29ffff
bfpt.dwords[7]: 0xd810200c
bfpt.dwords[8]: 0x00000000
bfpt.dwords[9]: 0x00000000
bfpt.dwords[10]: 0x00000000
bfpt.dwords[11]: 0x00000000
bfpt.dwords[12]: 0x00000000
bfpt.dwords[13]: 0x00000000
bfpt.dwords[14]: 0x00000000
bfpt.dwords[15]: 0x00000000
atmel_qspi 4007c000.qspi: BFPT version 1.0 (length =3D 9)
params->size: 67108864
bfpt_header->length < BFPT_DWORD_MAX
flash_parameter (size): 67108864
flash_parameter (page_size): 256
flash_parameter (hw_caps): 0x103bb
flash_parameter reads #0
        num_mode_clocks: 0
        num_wait_states: 0
        opcode: 3
        proto: 65793
flash_parameter reads #1
        num_mode_clocks: 0
        num_wait_states: 8
        opcode: 11
        proto: 65793
flash_parameter reads #2
        num_mode_clocks: 0
        num_wait_states: 0
        opcode: 0
        proto: 0
flash_parameter reads #3
        num_mode_clocks: 1
        num_wait_states: 7
        opcode: 59
        proto: 65794
flash_parameter reads #4
        num_mode_clocks: 1
        num_wait_states: 7
        opcode: 187
        proto: 66050
flash_parameter reads #5
        num_mode_clocks: 1
        num_wait_states: 7
        opcode: 187
        proto: 131586
flash_parameter reads #6
        num_mode_clocks: 0
        num_wait_states: 0
        opcode: 0
        proto: 0
flash_parameter reads #7
        num_mode_clocks: 1
        num_wait_states: 7
        opcode: 107
        proto: 65796
flash_parameter reads #8
        num_mode_clocks: 1
        num_wait_states: 9
        opcode: 235
        proto: 66564
flash_parameter reads #9
        num_mode_clocks: 1
        num_wait_states: 9
        opcode: 235
        proto: 263172
flash_parameter reads #10
        num_mode_clocks: 0
        num_wait_states: 0
        opcode: 0
        proto: 0
flash_parameter reads #11
        num_mode_clocks: 0
        num_wait_states: 0
        opcode: 0
        proto: 0
flash_parameter reads #12
        num_mode_clocks: 0
        num_wait_states: 0
        opcode: 0
        proto: 0
flash_parameter reads #13
        num_mode_clocks: 0
        num_wait_states: 0
        opcode: 0
        proto: 0
flash_parameter reads #14
        num_mode_clocks: 0
        num_wait_states: 0
        opcode: 0
        proto: 0
flash_parameter page_programs #0
        opcode: 2
        proto: 65793
flash_parameter page_programs #1
        opcode: 0
        proto: 0
flash_parameter page_programs #2
        opcode: 0
        proto: 0
flash_parameter page_programs #3
        opcode: 0
        proto: 0
flash_parameter page_programs #4
        opcode: 0
        proto: 0
flash_parameter page_programs #5
        opcode: 0
        proto: 0
flash_parameter page_programs #6
        opcode: 0
        proto: 0
atmel_qspi 4007c000.qspi: n25q512ax3 (65536 Kbytes)
3 ofpart partitions found on MTD device 4007c000.qspi
Creating 3 MTD partitions on "4007c000.qspi":
0x000000000000-0x000000400000 : "qspi-linux-kernel"
0x000000400000-0x000000420000 : "qspi-device-tree"
0x000000420000-0x000004000000 : "qspi-rootfs"
...
ubi0: scanning is finished
ubi0: attached mtd2 (name "qspi-rootfs", size 59 MiB)
ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
ubi0: VID header offset: 64 (aligned 64), data offset: 128
ubi0: good PEBs: 958, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 10/5, WL threshold: 4096, image sequence =
number: 1092114250
ubi0: available PEBs: 0, total reserved PEBs: 958, PEBs reserved for bad =
PEB handling: 0
at91_rtc 400e1860.rtc: setting system clock to 2012-01-01 00:02:02 UTC =
(1325376122)
atmel_usart 40028000.serial: using dma0chan7 for rx DMA transfers
atmel_usart 40028000.serial: using dma0chan8 for tx DMA transfers
ubi0: background thread "ubi_bgt0d" started, PID 54
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 55
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit =
sizes: 8 bytes/256 bytes
UBIFS (ubi0:0): FS size: 61614336 bytes (58 MiB, 942 LEBs), journal size =
3074176 bytes (2 MiB, 47 LEBs)
UBIFS (ubi0:0): reserved for root: 2910196 bytes (2841 KiB)
UBIFS (ubi0:0): media format: w5/r0 (latest is w5/r0), UUID =
0D954079-87C5-4594-8BB4-E94012E476CA, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:12.
devtmpfs: mounted
Freeing unused kernel memory: 80K
This architecture does not have kernel memory protection.
Starting logging: OK
...=
