Received: from smtpout07-01.prod.mesa1.secureserver.net ([64.202.165.230]
	helo=smtpout07-04.prod.mesa1.secureserver.net)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GqExE-0008TJ-4r
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 15:25:56 -0500
Message-ID: <45708FD1.7010708@techmoninc.com>
Date: Fri, 01 Dec 2006 14:25:53 -0600
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: AM29F040 Chip.
Content-Type: multipart/mixed; boundary="------------000500010806030005090508"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000500010806030005090508
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm attempting to install Linux on an older VersaLogic Board. 
VersaLogic has told me that this is impossible and that even if I can 
get the installation to work, they will not support the final product. 
The technical specs of this unit are:  AMD 586 with an AM29F040b flash 
(one 500KB socket and one 2MB on-board flash).  The system is currently 
bootable via flash using a proprietary Flash File System which caldera 
Dr. DOS can read/write as a FAT.  Other system information is available 
upon request (I don't want to clutter up your e-mail too bad).

**I am not a Linux kernel programmer, however, I am a Linux programmer 
and have been with Linux since 1994 (Red Had 0.something), so I'm 
sort-of competent with Linux.

Here is what I have to make happen:  I have to be able to write a boot 
loader and kernel to the lower 448KB of flash, then install some sort of 
file system on the upper 2MB flash, with dynamic access to at least one 
sector of the flash (64K).  The one sector that I would assume to be the 
logical one to address would be the last of the 2MB flash.

What I have done:  I have attempted to boot and read the flash via two 
different kernels, 2.4.33.3 and 2.6.18.  Within neither of these could I 
get the kernel to see the flash.  The documentation of this board was 
(somewhat) helpful to me in that I was able to list the flash as a 
memory mapped from 0xe0000 to 0xeffff.  I put this into the kernel 
configuration as from 0xe0000 with size 0x10000 using 1 bank width.  In 
2.4.33.3 I was able to dump the entire contents of the 2MB flash into 
memory (using cat /dev/mtd0 > mtd0 -- I'm booted into a ramfs).  All of 
the data that I know to be on the flash is there.  I verified this via a 
hex editor.  The 2.6.18 kernel, however allowed me to only access 64K of 
the flash -- which after reading through as much of the documentation as 
I could find/VersaLogic would give me, I found that this was the 
accurate behavior.  I then was pointed to the section of the product 
manual that has the memory mapping of the AM29F040b chip.  There is a 
control register that directs the memory mapping.  The Map and Page 
Control Register (MPCR) is set via BIOS to the 0 offset of the first 
block of the 2MB flash when the CMOS is set for Floppy A: as FLASH 
MEMORY.  I was also able to read the full 512KB of flash which also 
contains the BIOS via same technique, however, I disable the floppy 
drive -> flash memory in BIOS, thus granting me access to the first 
sector of the socketed flash.

What I know from the documentation:  The MPCR has the following layout:
Bit7:  Flash to memory mapper. 0=No mapping, 1=map.
Bit6:  Not used.
Bit5 - Bit0:  If Bit7, then the following table applies:
0 0 0 X X X 8 Pages BBSRAM (My version of this board does not have the 
BBSRAM)
0 1 1 X X X 8 Pages FLASH 0
1 X X X X X 32 Pages FLASH 1

What I think to be my only options:  1) Use loadlin to bring up the 
kernel and the ramfs.  Possibly store my controlling program in one or 
two sectors of the Flash, and store the runtime data in the last flash 
sector.  I would still have to have the extractor program to get my 
controlling (which may be updated later) program from the flash, then 
set the flash to the last memory location and execute the controller 
program.  2) Write/get someone to write a driver that would allow me to 
access FLASH 1 as a block device.  The FAQ says that this is "bad", 
however, I know that there wouldn't be that many writes to the flash, so 
I wouldn't be continuously erasing the blocks.

What I'm asking the community for:  I need some help.  I either need a 
kernel programmer to assist me by writing the modules I'll need, or to 
at least guide me into my very first attempt at kernel module 
programming.  OR. . . maybe I'm attacking this from the completely wrong 
way.  If that be the case, please shed some light on me as I am deep in 
the dark here.

I hope I have given you enough information for you to help me, but not 
too much to annoy you.

Thanks in advance for any assistance you give me,
Andy Kennedy

--------------000500010806030005090508
Content-Type: text/x-vcard; charset=utf-8;
 name="akennedy.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="akennedy.vcf"

begin:vcard
fn:Andy Kennedy
n:;Andy Kennedy
org:TechMon Research Inc.
adr;dom:;;2221 Dianne Drive;Birmingham;AL;35235
email;internet:akennedy@techmoninc.com
title:Sr. Software Engineer
tel;work:(205) 854-9895
tel;cell:(256) 453-1814
version:2.1
end:vcard


--------------000500010806030005090508--
