Received: from [210.241.255.67] (helo=mail.cable.net.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aoy3Z-0005wF-MR
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2004 04:57:34 +0000
Message-ID: <005101c3ec6a$85b05440$030910ac@linuxer>
From: "Pham Huy Vu" <vuph@mail.cable.net.tw>
To: "Jonas Holmberg" <jonas.holmberg@axis.com>
References: <00e301c3eb42$8dfbbc80$030910ac@linuxer>
	<20040204195334.GC1256@axis.com>
Date: Fri, 6 Feb 2004 12:34:17 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Copy files to jffs2 partition have problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jonas,
Thanks for your reply,

I select CFI to probe my flash, The kernel can detect it like below
...............
awtel_flash device: 400000 at e0000000
awtel_flash: ioremap is e0000000
buswidth is 2
Number of erase regions: 2
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
No Vpp line
Typical byte/word write timeout: 16 탎
Maximum byte/word write timeout: 512 탎
Full buffer write not supported
Typical block erase timeout: 1024 탎
Maximum block erase timeout: 16384 탎
Chip erase not supported
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 63 blocks
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
MX FLASH: Swapping erase regions for broken CFI table.
number of CFI chips: 1
phymap 0 cfi_probe: mymtd is 1fcb420
Creating 5 MTD partitions on "MX FLASH":
0x00000000-0x00400000 : "Whole partition"
mtd: Giving out device 0 to Whole partition
0x00000000-0x00010000 : "Bios partition"
mtd: Giving out device 1 to Bios partition
0x00010000-0x001f0000 : "Kernel partition"
mtd: Giving out device 2 to Kernel partition
0x00200000-0x003e0000 : "Voip partition"
mtd: Giving out device 3 to Voip partition
0x003e0000-0x003f0000 : "Configuration partition"
mtd: Giving out device 4 to Configuration partition
...............
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00010000 "Whole partition"
mtd1: 00010000 00010000 "Bios partition"
mtd2: 001e0000 00010000 "Kernel partition"
mtd3: 001e0000 00010000 "Voip partition"
mtd4: 00010000 00010000 "Configuration partition"
--------
I also got that problem ( cp: write: Input/output error ) when copy files
#cp /tmp/abc /var/flash/
cp: write: Input/output error
#dmesg
....
Last[3] is 10, datum is 14000010
Write of 71 bytes at 0x000fe494 failed. returned 0, retlen 68
.....
I think mtd driver is ok,
I just think the jffs2 fs or mkfs.jffs2 have bugs???

Please help me find out problem.

My uClinux:
#dmesg
Linux version 2.4.19-uc1 (vuph@devel.sunyard-vietnam.com) (gcc version
2.95.3 20
010315 (release)(ColdFire patches - 20010318 from
http://fiddes.net/coldfire/)(u
Clinux XIP and shared lib patches from http://www.snapgear.com/)) #1873
22:14:59
....
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis
Communications
 AB.
....
# mkfs.jffs2 -v
mkfs.jffs2 revision 1.20

The mtd version 2002/03/22 07:10:34

Thanks.

----mark pham----

----- Original Message -----
From: "Jonas Holmberg" <jonas.holmberg@axis.com>
To: "Pham Huy Vu" <vuph@mail.cable.net.tw>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, February 05, 2004 3:53 AM
Subject: Re: Copy files to jffs2 partition have problem


> On Thu, Feb 05, 2004 at 01:15:52AM +0800, Pham Huy Vu wrote:
> [snip]
> > In amd_flash.c:
> > static const struct amd_flash_info table[] = {
> > ....
> >     //This my flash setup
> >         mfr_id: MANUFACTURER_MX,
> >         dev_id: MX29LV320T,
> >         name: "MXIC MX29LV320T",
> >         size: 0x00400000,
> >         numeraseregions: 3,
> >         regions: {
> >             { offset: 0x000000, erasesize: 0x10000, numblocks: 48 },
> >             { offset: 0x300000, erasesize: 0x10000, numblocks: 15 },
> >             { offset: 0x3f0000, erasesize: 0x02000, numblocks:  8 },
>
> Hmm, I wonder why this isn't
>
>      { offset: 0x000000, erasesize: 0x10000, numblocks: 63 },
>      { offset: 0x3f0000, erasesize: 0x02000, numblocks:  8 },
>
> Because of two banks? Make sure this layout is correct (check the
> datasheet). I have seen commits to the table in amd_flash.c that were
> wrong before. If your flash chip supports CFI, try using the
> CFI-driver. Otherwise try jedec_probe.c instead. amd_flash is
> obsolete.
>
> Another piece of probably useless information:
> I resently tested another, 64Mbit, MX-flash that didn't work with the
> CFI-driver because thay had gotten the number of eraseregions wrong in
> the CFI-table (in flash). A new, corrected version of the chip was
> released, but with exactly the same device ID, grrr. (Got any
> unused baseball bats left, David?)
>
> [snap]
> > MX FLASH: write to 0x3a59c0 failed. datum = 14000010, verify = 10
>
> With buswidth 2 you can only write 16-bits. That's probably why verify
> is 0x0010. I don't know why jffs2 tries to write 0x14000010, though.
>
> /Jonas
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
