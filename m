Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFavf-0000iC-1C
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 07:51:28 +0000
Date: Mon, 7 May 2018 09:50:53 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: ubifs error with marvell_nand on Armada-98DX4251 (was Re:
 [PATCH] mtd: rawnand: marvell: fix command xtype in BCH write hook)
Message-ID: <20180507095053.249547d0@bbrezillon>
In-Reply-To: <729567d8180a4b70ba9226dcd9eee0b4@svr-chch-ex1.atlnz.lc>
References: <20180503100027.16229-1-miquel.raynal@bootlin.com>
 <f1b88811dd88481da1c1b84341bbc9a5@svr-chch-ex1.atlnz.lc>
 <20180504091001.3e6650d6@xps13>
 <729567d8180a4b70ba9226dcd9eee0b4@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chris,

On Mon, 7 May 2018 03:48:42 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi Miquel,
> 
> On 04/05/18 19:10, Miquel Raynal wrote:
> > Hi Chris,
> > 
> > On Fri, 4 May 2018 00:06:48 +0000, Chris Packham
> > <Chris.Packham@alliedtelesis.co.nz> wrote:  
> >>
> >> I do have one platform that passes the initial detection but starts to
> >> report ubifs errors when mounted.
> >>
> >> Armada-98DX4251 Micron MT29F8G08ABACAWP 1024 MiB 256 KiB 4096 224
> >>
> >> This is probably unrelated to this particular fix. It may be as simple
> >> as something not catering for the Armada-98DX4251 SoC or a genuine
> >> difference between Armada-98DX4251 and Armada-385. 4.16.4 with
> >> pxa3xx_nand works with this combination.  
> 
> I did spot a few problems in the pinctrl driver for this platform, but 
> nothing that was stopping things from working (the bootloader set the 
> MPP functions correctly). I've sent some patches for that.
> 
> > Can you please share more details: the device tree (at least the NAND
> > node), the strength requested, the boot log, the errors?  
> 
> Here's the relevant part of the device tree
> 
> 	nand@d0000 {
> 		compatible = "marvell,armada370-nand";
> 		reg = <0xd0000 0x54>;
> 		#address-cells = <0x1>;
> 		#size-cells = <0x1>;
> 		interrupts = <0x71>;
> 		clocks = <0xc 0x0>;
> 		status = "okay";
> 		num-cs = <0x1>;
> 		marvell,nand-enable-arbiter;
> 		nand-on-flash-bbt;
> 	};
> 
> 	...
> 
> 	dfx-server@ac000000 {
> 		compatible = "marvell,dfx-server", "simple-bus";
> 		#address-cells = <0x1>;
> 		#size-cells = <0x1>;
> 		ranges = <0x0 0x8000000 0x0 0x100000>;
> 		reg = <0x8000000 0x0 0x100000>;
> 		phandle = <0xe>;
> 
> 		corediv-clock@f8268 {
> 			compatible = "marvell,mv98dx3236-corediv-clock";
> 			reg = <0xf8268 0xc>;
> 			#clock-cells = <0x1>;
> 			clocks = <0x9>;
> 			clock-output-names = "nand";
> 			phandle = <0xc>;
> 		};
> 	};
> 
> Boot output
> 
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd3
> nand: Micron MT29F8G08ABACAWP
> nand: 1024 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224
> Bad block table found at page 261952, version 0x01
> Bad block table found at page 261888, version 0x01
> nand_read_bbt: bad block at 0x00003ff80000
> nand_read_bbt: bad block at 0x00003ffc0000
> 
> Error at mount time
> 
> Re-mounting file system...
> UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 1096
> UBIFS error (ubi0:0 pid 1093): check_lpt_type.constprop.6: invalid type 
> (0) in LPT node type 2
> CPU: 0 PID: 1093 Comm: mount Not tainted 4.17.0-rc2-at1+ #1
> Hardware name: Marvell Armada 370/XP (Device Tree)
> [<80110f40>] (unwind_backtrace) from [<8010c350>] (show_stack+0x10/0x14)
> [<8010c350>] (show_stack) from [<805c11b4>] (dump_stack+0x88/0x9c)
> [<805c11b4>] (dump_stack) from [<802dde14>] 
> (check_lpt_type.constprop.6+0x48/0x50)
> [<802dde14>] (check_lpt_type.constprop.6) from [<802dfe70>] 
> (ubifs_lpt_init+0x2cc/0x4d8)
> [<802dfe70>] (ubifs_lpt_init) from [<802c9810>] (ubifs_mount+0x106c/0x1594)
> [<802c9810>] (ubifs_mount) from [<801ef1dc>] (mount_fs+0x14/0xa4)
> [<801ef1dc>] (mount_fs) from [<8020a63c>] (vfs_kern_mount+0x4c/0xf4)
> [<8020a63c>] (vfs_kern_mount) from [<8020d7f0>] (do_mount+0x184/0xb98)
> [<8020d7f0>] (do_mount) from [<8020e584>] (ksys_mount+0x8c/0xbc)
> [<8020e584>] (ksys_mount) from [<80101000>] (ret_fast_syscall+0x0/0x54)
> Exception stack(0xbda63fa8 to 0xbda63ff0)
> 3fa0:                   00000000 00000000 7ea24f4e 7ea24f60 7ea24f48 
> 00008010
> 3fc0: 00000000 00000000 7ea24f48 00000015 7ea24f4e 00008010 00000000 
> 000a5f44
> 3fe0: 76e6b1b0 7ea24af0 00046020 76e6b1c0
> UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops
> mount: mounting ubi0:user on /flash failed: Invalid argument
> 

Can you paste the full boot logs?

> 
> > 
> > Are you sure Linux ECC configuration is aligned with the bootloader's?  
> 
> In this case the bootloader doesn't have any NAND support enabled since 
> this board is always network booting.
> 
> It is likely that an older kernel has set this up with ecc-strength=4. 
> Does flash_erase destroy the ecc data as well or is there some other 
> mtd-util to do this from userland?

There's no metadata describing the ECC setup to use. flash_erase should
place the NAND is a clean state.

> 
> That got me thinking. I ran with the new driver but the following added 
> to the dts
> 
> +       nand-ecc-strength = <4>;
> +       nand-ecc-step-size = <512>;
> 
> After an erase/re-init things were working.
> 
> But then if I have nothing (auto-select) or nand-ecc-strength = <8> 
> (which would be "correct" for this chip) in the dts I get the errors above.

Maybe a problem with the 16bits/1024bytes layout, but what's weird is
that the driver does not report ECC errors.

Regards,

Boris
