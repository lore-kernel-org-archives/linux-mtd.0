Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFX9F-0006Or-CL
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 03:49:15 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: ubifs error with marvell_nand on Armada-98DX4251 (was Re: [PATCH]
 mtd: rawnand: marvell: fix command xtype in BCH write hook)
Date: Mon, 7 May 2018 03:48:42 +0000
Message-ID: <729567d8180a4b70ba9226dcd9eee0b4@svr-chch-ex1.atlnz.lc>
References: <20180503100027.16229-1-miquel.raynal@bootlin.com>
 <f1b88811dd88481da1c1b84341bbc9a5@svr-chch-ex1.atlnz.lc>
 <20180504091001.3e6650d6@xps13>
Content-Language: en-US
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

Hi Miquel,=0A=
=0A=
On 04/05/18 19:10, Miquel Raynal wrote:=0A=
> Hi Chris,=0A=
> =0A=
> On Fri, 4 May 2018 00:06:48 +0000, Chris Packham=0A=
> <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>=0A=
>> I do have one platform that passes the initial detection but starts to=
=0A=
>> report ubifs errors when mounted.=0A=
>>=0A=
>> Armada-98DX4251 Micron MT29F8G08ABACAWP 1024 MiB 256 KiB 4096 224=0A=
>>=0A=
>> This is probably unrelated to this particular fix. It may be as simple=
=0A=
>> as something not catering for the Armada-98DX4251 SoC or a genuine=0A=
>> difference between Armada-98DX4251 and Armada-385. 4.16.4 with=0A=
>> pxa3xx_nand works with this combination.=0A=
=0A=
I did spot a few problems in the pinctrl driver for this platform, but =0A=
nothing that was stopping things from working (the bootloader set the =0A=
MPP functions correctly). I've sent some patches for that.=0A=
=0A=
> Can you please share more details: the device tree (at least the NAND=0A=
> node), the strength requested, the boot log, the errors?=0A=
=0A=
Here's the relevant part of the device tree=0A=
=0A=
	nand@d0000 {=0A=
		compatible =3D "marvell,armada370-nand";=0A=
		reg =3D <0xd0000 0x54>;=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x1>;=0A=
		interrupts =3D <0x71>;=0A=
		clocks =3D <0xc 0x0>;=0A=
		status =3D "okay";=0A=
		num-cs =3D <0x1>;=0A=
		marvell,nand-enable-arbiter;=0A=
		nand-on-flash-bbt;=0A=
	};=0A=
=0A=
	...=0A=
=0A=
	dfx-server@ac000000 {=0A=
		compatible =3D "marvell,dfx-server", "simple-bus";=0A=
		#address-cells =3D <0x1>;=0A=
		#size-cells =3D <0x1>;=0A=
		ranges =3D <0x0 0x8000000 0x0 0x100000>;=0A=
		reg =3D <0x8000000 0x0 0x100000>;=0A=
		phandle =3D <0xe>;=0A=
=0A=
		corediv-clock@f8268 {=0A=
			compatible =3D "marvell,mv98dx3236-corediv-clock";=0A=
			reg =3D <0xf8268 0xc>;=0A=
			#clock-cells =3D <0x1>;=0A=
			clocks =3D <0x9>;=0A=
			clock-output-names =3D "nand";=0A=
			phandle =3D <0xc>;=0A=
		};=0A=
	};=0A=
=0A=
Boot output=0A=
=0A=
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd3=0A=
nand: Micron MT29F8G08ABACAWP=0A=
nand: 1024 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224=0A=
Bad block table found at page 261952, version 0x01=0A=
Bad block table found at page 261888, version 0x01=0A=
nand_read_bbt: bad block at 0x00003ff80000=0A=
nand_read_bbt: bad block at 0x00003ffc0000=0A=
=0A=
Error at mount time=0A=
=0A=
Re-mounting file system...=0A=
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 1096=0A=
UBIFS error (ubi0:0 pid 1093): check_lpt_type.constprop.6: invalid type =0A=
(0) in LPT node type 2=0A=
CPU: 0 PID: 1093 Comm: mount Not tainted 4.17.0-rc2-at1+ #1=0A=
Hardware name: Marvell Armada 370/XP (Device Tree)=0A=
[<80110f40>] (unwind_backtrace) from [<8010c350>] (show_stack+0x10/0x14)=0A=
[<8010c350>] (show_stack) from [<805c11b4>] (dump_stack+0x88/0x9c)=0A=
[<805c11b4>] (dump_stack) from [<802dde14>] =0A=
(check_lpt_type.constprop.6+0x48/0x50)=0A=
[<802dde14>] (check_lpt_type.constprop.6) from [<802dfe70>] =0A=
(ubifs_lpt_init+0x2cc/0x4d8)=0A=
[<802dfe70>] (ubifs_lpt_init) from [<802c9810>] (ubifs_mount+0x106c/0x1594)=
=0A=
[<802c9810>] (ubifs_mount) from [<801ef1dc>] (mount_fs+0x14/0xa4)=0A=
[<801ef1dc>] (mount_fs) from [<8020a63c>] (vfs_kern_mount+0x4c/0xf4)=0A=
[<8020a63c>] (vfs_kern_mount) from [<8020d7f0>] (do_mount+0x184/0xb98)=0A=
[<8020d7f0>] (do_mount) from [<8020e584>] (ksys_mount+0x8c/0xbc)=0A=
[<8020e584>] (ksys_mount) from [<80101000>] (ret_fast_syscall+0x0/0x54)=0A=
Exception stack(0xbda63fa8 to 0xbda63ff0)=0A=
3fa0:                   00000000 00000000 7ea24f4e 7ea24f60 7ea24f48 =0A=
00008010=0A=
3fc0: 00000000 00000000 7ea24f48 00000015 7ea24f4e 00008010 00000000 =0A=
000a5f44=0A=
3fe0: 76e6b1b0 7ea24af0 00046020 76e6b1c0=0A=
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops=0A=
mount: mounting ubi0:user on /flash failed: Invalid argument=0A=
=0A=
=0A=
> =0A=
> Are you sure Linux ECC configuration is aligned with the bootloader's?=0A=
=0A=
In this case the bootloader doesn't have any NAND support enabled since =0A=
this board is always network booting.=0A=
=0A=
It is likely that an older kernel has set this up with ecc-strength=3D4. =
=0A=
Does flash_erase destroy the ecc data as well or is there some other =0A=
mtd-util to do this from userland?=0A=
=0A=
That got me thinking. I ran with the new driver but the following added =0A=
to the dts=0A=
=0A=
+       nand-ecc-strength =3D <4>;=0A=
+       nand-ecc-step-size =3D <512>;=0A=
=0A=
After an erase/re-init things were working.=0A=
=0A=
But then if I have nothing (auto-select) or nand-ecc-strength =3D <8> =0A=
(which would be "correct" for this chip) in the dts I get the errors above.=
=0A=
=0A=
> =0A=
> Thanks,=0A=
> Miqu=E8l=0A=
> =0A=
> =0A=
=0A=
