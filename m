Received: from mail.avantwave.com ([210.17.210.210])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBPlc-0000f8-TY
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2005 23:04:22 -0500
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id j2G3wlXb020951
	for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2005 11:58:47 +0800
Message-ID: <4237B14F.1080106@avantwave.com>
Date: Wed, 16 Mar 2005 12:08:47 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Can not mount root on mtd block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all
    I am using kernel 2.6.10 with patched cvs mtd and my flash mapping 
driver. I also add debug msg on mount_block_root. The return value is 
ENXIO. I am really get mess , because the cfi proded the flash 
successfully, but final result is "no such a device". Does anyone have 
ideas on this?

NOR flash driver (size->0x800000 mem->0x10000000)
NOR Flash 1: Found 1 x8 devices at 0x0 in 8-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
NOR Flash 1: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 5 MTD partitions on "NOR Flash 1":
0x00000000-0x00100000 : "bootloader"
0x00100000-0x00300000 : "kernel"
0x00300000-0x00500000 : "System RFS"
0x00500000-0x00700000 : "User Application"
0x00700000-0x00800000 : "User Data"
mice: PS/2 mouse device common for all mice
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
Initializing IPsec netlink socket
NET: Registered protocol family 1
NET: Registered protocol family 17
*VFS: Tried fs_name = <cramfs> err = -6*
VFS: Cannot open root device "mtdblock2" or unknown-block(0,0)
Please append a correct "root=" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(0,0)

Thanks for helping

best regard
Mike,Lee
