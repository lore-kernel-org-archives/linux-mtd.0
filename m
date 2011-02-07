Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmTJz-0001B7-2R
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 15:48:11 +0000
In-Reply-To: <8F3BC736-334E-41F2-96D3-7651B4B15766@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net> <OF42EF
	<8F3BC736-334E-41F2-96D3-7651B4B15766@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OFAD37107D.0CCE9407-ONC1257830.005516B8-C1257830.0056CE2F@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 7 Feb 2011 16:48:08 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michael Cashwell <mboards@prograde.net> wrote on 2011/02/07 16:10:03:
>
> On Feb 5, 2011, at 2:19 PM, Michael Cashwell wrote:
>
> >> I won't worry about this until you test my patch and still have a problem :) Please test it.
> >
> > My plan is to retest your patch against a pristine copy of the file and report back. Unfortunately this has to wait until Monday as I don't have access to the hardware over the weekend.
>
> OK, I retested Joakim's patch from 4-feb on a clean source file and it doesn't help my problem:
>
> [cashwell@mec-fedora14 linux-2.6.35.7-arm-gum]$ cat ../joakim.patch | patch -p1
> patching file drivers/mtd/chips/cfi_cmdset_0001.c
> Hunk #1 succeeded at 1227 (offset -18 lines).
> Hunk #2 succeeded at 1266 (offset -18 lines).
>
> (The offsets are just that we're on slightly different kernel versions, I assume. It applies OK.)

Yes, I got an extra patch in my driver as my chips both have top and bottom boot sector.


> #### Exporting kernel linux-2.6.35.7-arm-gum to netboot.
> Image Name:   2.6.35.7-gum1
> Created:      Mon Feb  7 08:22:31 2011
> Image Type:   ARM Linux Kernel Image (uncompressed)
> Data Size:    1919908 Bytes = 1874.91 kB = 1.83 MB
> Load Address: 0xA1000000
> Entry Point:  0xA1000000
>
> Booted and then did ubiformat, mount, rsync of about 20MB, and then during the umount of that file system:
>
> UBI error: ubi_io_write: error -30 while writing 1968 bytes to PEB 17:37528, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write data to PEB 17
> UBI warning: ubi_ro_mode: switch to read-only mode
>
> which I'd previously traced to the -EROFS return in do_write_buffer because it thinks it got a block-locked error during write. I've also seen that sometimes see the bad Vpp error too. (Why one of those has a printk and not the other I don't know.)
>

Seems like you have another problem, does it only occur at umount? Perhaps UBI does something at umount
that the driver doesn't agree with?
Anyhow, will submit my patch soon, I hope you still agree that it fixes an bug. Just not your bug :(

I am on PPC BTW.

 Jocke
