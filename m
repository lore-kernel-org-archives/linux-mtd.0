Received: from bay13-f95.bay13.hotmail.com ([64.4.31.95] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BWxnA-00086Q-Oq
	for linux-mtd@lists.infradead.org; Sun, 06 Jun 2004 09:34:30 -0400
From: =?gb2312?B?1cUgusY=?= <zh_chaohao@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Sun, 06 Jun 2004 13:34:26 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY13-F956aCaeTJlI000039f5c@hotmail.com>
Subject: dual flash banks support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,all

I have an AM33 board and two 16M flash. There are two memory banks on the 
board. My mtd version is mtd-snapshot-20030310. 

My question is, how to make my board support two 16M flash?

I have selected "MTD concatenating support" and set "Physical length of 
flash mapping" to 02000000 in menuconfig.

But when I boot up my board, it reported errors like this.

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

Can someone give me some advice?

Thanks!

_________________________________________________________________
享用世界上最大的电子邮件系统— MSN Hotmail。  http://www.hotmail.com  
