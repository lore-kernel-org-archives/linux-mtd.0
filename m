Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZG1B-00010y-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 18:08:17 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZG1A-00010s-00
	for mtd@infradead.org; Wed, 13 Sep 2000 18:08:16 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id SAA16608
	for <mtd@infradead.org>; Wed, 13 Sep 2000 18:08:15 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: sbc-mediagx 
In-reply-to: Your message of "Wed, 13 Sep 2000 17:43:22 BST."
             <32401.968863402@passion.cygnus.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_19240312240"
Date: Wed, 13 Sep 2000 18:08:14 +0100
Message-Id: <E13ZG18-00027x-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multipart MIME message.

--==_Exmh_19240312240
Content-Type: text/plain; charset=us-ascii

[...]
>Easy to fix - just that nobody's bothered yet. Patches accepted if you care 
>enough to produce one.

Sure --- I just don't know how. Ditto with the devfs stuff. I'll have a look 
at the rest of the kernel and see how easy/difficult it is. Getting this 
working would be a great bonus for us.

>dg@tao-group.com said:
>>  * The device claims to see only 8MB of my flash medium. 
>
>Odd. Please send the kernel's output while it's probing. How big _is_ the 
>flash?

16MB.

Enclosed, via the wonders of MIME, are the kernel output *and* the output of 
FXINFO.EXE, Datalight's official flash diagnostics program. Also, the ROM 
mutters something about x8 when booting, but it flashes past so quickly I've 
never been able to read anything else.

Having booted Windows and read the documentation, FlashFX seems to use an 
encoding called VBF. The only thing I want VBF for is to boot Linux; there's 
an int13 handler in ROM, so lilo would work. Other than that I'm sure JFFS on 
bare metal would do better.

sbc_mediagx.c seems to have hard-coded `partition' sizes in it. Does it 
override these later? The layout described by FXINFO doesn't match.

[...]
>Please could you bzip2 and send to me the contents of /dev/mtd[012]. I'm 
>not 100% sure what translation layer is used by flashfx, but it might be 
>something I recognise.

Sorry --- there's too much confidential stuff on the disk. I might be able to 
send you bits of it, though.

[...]
>Rarely at the moment. I sync to Linus' kernel frequently, but I'm not
>intending to send him anything more for 2.4. Once the 2.5 series starts, 
>I'll be keeping it reasonably up-to-date. 
>
>AnonCVS access is available. I recommend you use that.

I am, but it's difficult to point other people at. I'd also really like to 
compile this into the kernel, which is hard unless it's been integrated into 
the device tree.

David Given
dg@tao-group.com

--==_Exmh_19240312240
Content-Type: text/plain ; name="fxinfo.txt"; charset=us-ascii
Content-Description: fxinfo.txt
Content-Disposition: attachment; filename="fxinfo.txt"


Disk Info - Displays information about a FlashFx disk
Datalight FlashFx 
V4.02.229  386 DOS
Copyright (c) 93-99
Patent US#5860082

OEM INFORMATION
  Media Type - - - - - - - - - - - - - NOR
  Media Size - - - - - - - - - - - - - 16384K
  Erase Zone Size  - - - - - - - - - - 128K
VBF INFORMATION
  Serial Number  - - - - - - - - - - - 38bf-4a68
  Partition Start (/P Option)  - - - - 256K
  Partition End (/T Option)  - - - - - 16384K
  Partition Size - - - - - - - - - - - 16128K
  Partition Total Units  - - - - - - - 126
  Partition Spare Units (/S Option)  - 1
  Region Size  - - - - - - - - - - - - 492K
  Logical Unit Size  - - - - - - - - - 128K
  Block Size - - - - - - - - - - - - - 512 bytes
  Formatted Size - - - - - - - - - - - 15375K
  VBF Overhead - - - - - - - - - - - - 753K
    Spare Unit(s)  - - - - - - - - - - 128K
    Allocation Map - - - - - - - - - - 187K
    Cushion (/Q Option)  - - - - - - - 437K (~3%)
MEDIA USAGE INFORMATION
  Erases Per Unit  (Max, Avg, Min) - - (399, 166, 18)
  Data Used  - - - - - - - - - - - - - 14979K
  Free Space - - - - - - - - - - - - - 161K
  Recoverable Space  - - - - - - - - - 672K
--==_Exmh_19240312240
Content-Type: application/octet-stream ; name="dmesg"
Content-Description: dmesg
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="dmesg"

INIT_MTD:
SBC-MediaGX flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
SBC-MediaGX flash: Found 2 x8 CFI devices at location 0 in 8 bit mode
Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
Primary Algorithm Table at 0031
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 4.5 V
Vcc Maximum: 5.5 V
No Vpp line
Typical byte/word write timeout: 128 =B5s
Maximum byte/word write timeout: 2048 =B5s
Typical full buffer write timeout: 128 =B5s
Maximum full buffer write timeout: 2048 =B5s
Typical block erase timeout: 1024 =B5s
Maximum block erase timeout: 16384 =B5s
Chip erase not supported
Device size: 0x800000 bytes (8 Mb)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x20
Number of Erase Block Regions: 1
  Erase Region #0: BlockSize 0x20000 bytes, 64 blocks

searching for partitions
mtd: Giving out device 0 to SBC-MediaGX flash boot partition
SBC-MediaGX flash boot partition  Offset: 0x00000000  Size: 0x000a0000
mtd: Giving out device 1 to SBC-MediaGX flash partition 1
SBC-MediaGX flash partition 1  Offset: 0x000a0000  Size: 0x00160000
mtd: Giving out device 2 to SBC-MediaGX flash partition 2
SBC-MediaGX flash partition 2  Offset: 0x00200000  Size: 0x00600000

--==_Exmh_19240312240--




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
