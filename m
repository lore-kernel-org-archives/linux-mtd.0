Received: from bay13-f33.bay13.hotmail.com ([64.4.31.33] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BXBSY-0000oS-Fi
	for linux-mtd@lists.infradead.org; Mon, 07 Jun 2004 00:10:12 -0400
From: "zhang hao" <zh_chaohao@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 07 Jun 2004 04:10:03 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY13-F33sztlCMTPXj0003ac94@hotmail.com>
Subject: Help with dual flash devices support 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am an newbie in MTD. I have sent a mail before. Maybe I did not tell the 
problem clearly.

I have an AM33 board and two 16M AMD/Fujitsu type flash cards. Each card is 
16M, 32-bit buswidth, 4-chip(so it is 4*8 ?). My board has two memory 
banks. I want to use my two flash cards on this board.

My kernel is 2.4.18 and has been applied some latest patches. MTD vesion is 
mtd-snapshot-20030110 and cfi_cmdset_0002.c version is 1.61.

In the menutree I have selected 
"Support 32-bit buswidth", 
"Support 4-chip flash interleave", 
"Support for AMD/Fujitsu flash chips",
and set "Physical length of flash mapping" to "02000000".
(from mailing list I got that "MTD concatenating support" did not need to 
select.)

MTD partitions was: 
bootloader 16k
kernel 2032k
rootfs 28M or 30M

My problem is when I use flash to boot the board, it can only detect one 
flash device.

The output info like this:

"FlagaDM flash device: 2000000 at a0000000
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
FlagaDM flash device: Swapping erase regions for broken CFI table.
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
Creating 3 MTD partitions on "FlagaDM flash device":
0x00000000-0x00004000 : "Bootloader"
0x00004000-0x00200000 : "Kernel image"
0x00200000-0x01e00000 : "rootfs"
mtd: partition "rootfs" extends beyond the end of device "FlagaDM flash 
device" -- size tru
ncated to 0xe00000
FlagaDM flash device initialized"

What's the problem?
Is it the version of cfi_cmdset_0002.c too old?
Some previos questions showed interleaved chips were not well supported by 
cfi_cmdset_0002.
Is there anybody succeed in dual AMD/Fujitsu type flash support?
If I update cfi_cmdset_0002.c to 1.98, can this problem be solved?

Thanks!

                  zhanghao

_________________________________________________________________
享用世界上最大的电子邮件系统— MSN Hotmail。  http://www.hotmail.com  
