From: mark@lakeshoremicro.com (Mark Meade)
Date: Sat, 8 Feb 2003 12:04:58 -0500
Subject: grub-doc patch problem
In-Reply-To: <20030208112409.98886.qmail@web20802.mail.yahoo.com>
References: <20030208112409.98886.qmail@web20802.mail.yahoo.com>
Message-ID: <200302081157.05636.mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Saturday 08 February 2003 06:24 am, tony Tong wrote:
> but now the newest cvs version get more error when
> using 10-08.patch

Use the grub-2003-01-08-doc.patch with the latest GRUB cvs.  You will get 
errors when patching ChangeLog, but those don't matter. 

I tested this combination today, and the patch worked, as well as the 
aclocal/automake/autoconf, configure, and make steps.  The grub_firmware 
output was installed on a 32MB DiskOnChip 2000, and it boots as expected.

Make sure you use automake version 1.5 and autoconf version 2.53.  On some 
systems, this can be specified by exporting WANT_AUTOMAKE_1_5=1 and 
WANT_AUTOCONF_2_5=1. 

See http://lakeshoremicro.com/diskonchip-grub-howto.html for updated 
instructions, but use the 2003-01-08 patch instead of 2002-10-08.




>From Kentropy  Sat Feb  8 13:17:39 2003
From: Kentropy (Kentropy)
Date: Sat, 8 Feb 2003 19:17:39 +0100
Subject: hang into genprobe_ident_chips
Message-ID: <00ed01c2cf9e$5e45a480$0200a8c0@ester>

Hi,
I have problems using an Intel flash TE28F320-C3BC90
My kernel hangs into (gen_probe.c, 125), genprobe_ident_chips( )
Could someone please suggest me what do I have to do to solve this ?
Do I need to add a new flash type in jedec_probe.c ?
TIA


Uncompressing Linux........................................ done, booting the kernel.
Linux version 2.4.19-rmk4-ds2
CPU: Intel XScale-80200 revision 1
<snip>
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications AB.
FLASH virtual address: 0xc4810000
TRACE (cfi_probe.c, 81), cfi_probe_chip: a00
TRACE (cfi_probe.c, 89), cfi_probe_chip: a11
TRACE (cfi_probe.c, 164), cfi_chip_setup: b1
Number of erase regions: 2
TRACE (cfi_probe.c, 173), cfi_chip_setup: b1
TRACE (cfi_probe.c, 181), cfi_chip_setup: b2
TRACE (cfi_probe.c, 193), cfi_chip_setup: b3
TRACE (cfi_probe.c, 204), cfi_chip_setup: b4
Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
Primary Algorithm Table at 0035
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
Vpp Minimum: b.4 V
Vpp Maximum: c.6 V
Typical byte/word write timeout: 32 5s
Maximum byte/word write timeout: 512 5s
Full buffer write not supported
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 8192 ms
Chip erase not supported
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
TRACE (cfi_probe.c, 211), cfi_chip_setup: b5
TRACE (cfi_probe.c, 216), cfi_chip_setup: b6
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
TRACE (cfi_probe.c, 216), cfi_chip_setup: b6
  Erase Region #1: BlockSize 0x10000 bytes, 63 blocks
TRACE (cfi_probe.c, 225), cfi_chip_setup: b7
TRACE (cfi_probe.c, 230), cfi_chip_setup: b8
TRACE (gen_probe.c, 125), genprobe_ident_chips: GPa1

Unable to handle kernel paging request at virtual address c5810000
