Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CZtxI-00022H-Na
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2004 11:37:22 -0500
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Aras Vaichas <arasv@magellan-technology.com>
In-Reply-To: <41AD38DA.40008@magellan-technology.com>
References: <41AD38DA.40008@magellan-technology.com>
Content-Type: text/plain
Date: Thu, 02 Dec 2004 09:12:32 -0700
Message-Id: <1102003952.5915.71.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: modprobe cfi_cmdset_0002 fails
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-01 at 14:22 +1100, Aras Vaichas wrote:
> I am running 2.4.27-vrs1 on an AT91RM9200DK.
> 
> I have managed to get the latest MTD code to compile with this kernel version 
> and the kernel boots and executes OK (mostly)
> 
> Before I compiled in the new MTD code, the kernel detected my Smartmedia card 
> and the Dataflash. Now it seems to fail.
> 
> from dmesg:
> 
> ...
> physmap flash device: 200000 at 10000000
> CFI: Found no phys_mapped_flash device at location zero
> reset unlock called 555 2aa
> Search for id:(1f c0) interleave(1) type(2)
> MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
> MTD jedec_match(): check unlock addrs 0x0555 0x02aa
> MTD jedec_match(): 0x0555 0x0aaa did not match
> reset unlock called 555 aaa
> Search for id:(1f c0) interleave(1) type(2)
> MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
> MTD jedec_match(): check unlock addrs 0x0555 0x0aaa
> MTD jedec_match(): check ID's disappear when not in ID mode
> reset unlock called 555 aaa
> MTD jedec_match(): return to ID mode
> MTD jedec_probe_chip(): matched device 0x1f,0xc0 unlock_addrs: 0x0555 0x0aaa
> Found: Atmel AT49BV16X
> reset unlock called 555 aaa
> phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
> 
> The NOR Flash is found OK, and it comes up in /proc/mtd

Yep - looks sane so far.

> kmod: failed to exec /sbin/modprobe -s -k cfi_cmdset_0002, errno = 2
> Support for command set 0002 not present
> gen_probe: No supported Vendor Command Set found
> kmod: failed to exec /sbin/modprobe -s -k map_rom, errno = 2
> ...
> 
> Why does modprobe fail here? Shouldn't this already be compiled into the kernel?

It's only compiled in if it was selected when you configured your
kernel.  You can enable it in this menu:

Main Menu
  Memory Technology Devices (MTD)
    RAM/ROM/Flash chip drivers
      Support for AMD/Fujitsu flash chips

It's called CONFIG_MTD_CFI_AMDSTD in .config

-- 
Thayne Harbaugh
Linux Networx
