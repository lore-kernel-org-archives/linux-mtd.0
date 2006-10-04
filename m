Received: from natlemon.rzone.de ([81.169.145.170])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GV2Ee-0008Bb-QH
	for linux-mtd@lists.infradead.org; Wed, 04 Oct 2006 09:36:18 +0100
Received: from f1 (pD9E079DC.dip.t-dialin.net [217.224.121.220])
	by post.webmailer.de (8.13.6/8.13.6) with ESMTP id k948ZAe5011389
	for <linux-mtd@lists.infradead.org>;
	Wed, 4 Oct 2006 10:35:11 +0200 (MEST)
From: Peer Georgi <georgi@conitec.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 dataflash problem
Date: Wed, 4 Oct 2006 10:35:09 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200610041035.09891.georgi@conitec.com>
Reply-To: georgi@conitec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have some problems using  the jffs2 file system on kernel 2.6.18-rc4 on a 
custom at91rm9200 target system.
(FLASH: at45db642; 8MByte dataflash).

Precondition:
  The flash-partition is empty and mounted successfully to /mnt/fs.

What I tried:
  cd /mnt/fs
  echo "hello" > hello

What happend:
  
 cd /mnt/fs
/mnt/fs # echo "hello" > hello
jffs2_flash_writev(): Non-contiguous write to 0083c640
wbuf was previously 0083c220-0083c22c
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c787c000
[00000000] *pgd=20010031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at jffs2_flash_writev+0x178/0x438
LR is at 0x1
pc : [<c0107f7c>]    lr : [<00000001>]    Not tainted
sp : c7cd9d6c  ip : 60000093  fp : c7cd9db8
r10: c5c08048  r9 : c0009438  r8 : 00000000
r7 : 0083c640  r6 : c04afc00  r5 : 0083be00  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 00000d0d  r0 : 00000029
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C000717F  Table: 2787C000  DAC: 00000015
Process sh (pid: 705, stack limit = 0xc7cd8250)
Stack: (0xc7cd9d6c to 0xc7cda000)
9d60:                            00000001 60000013 c04afd1c 00000000 0083c640
9d80: 00000000 00000001 c7cd9de4 c7cd9dac 0083c640 00000000 0083c640 c04afc00
9da0: c7b0d4f8 c0009438 c5c08048 c7cd9e1c c7cd9dc0 c00ffd94 c0107e18 0083c640
9dc0: 00000000 c7cd9dd8 00000004 00000001 00000000 c5c08de4 c04afc2c 00000023
9de0: c7cd9e1c c7b0d4f8 00000044 00000000 00000000 00000000 c5c08048 00000000
9e00: c7b0d4f8 c5c08db8 c7b0d4f8 c04afc00 c7cd9e5c c7cd9e20 c0100740 c00ffc6c
9e20: 00000000 00000000 000018c0 c4c2ef9f c4c2ef9f 00000000 c5c08074 c5c08de4
9e40: c7b0d4f8 c7806154 c7cd8000 00000242 c7cd9e88 c7cd9e60 c00f9c24 c01006a8
9e60: c78061ac 00000005 00000000 000001a4 c5c08de4 c7806154 c7cd9f04 c7cd9eb0
9e80: c7cd9e8c c0084730 c00f9b84 c0020ec4 c7806154 c7bdc304 c7cd9f04 ffffff9c
9ea0: c0020ec4 c7cd9efc c7cd9eb4 c0084ac4 c00846ac 00000242 000001b6 c0036c44
9ec0: 00000000 00000002 000001a4 c0bb40a0 c7806154 00000241 c7cd9f04 00000003
9ee0: ffffff9c c0020ec4 c7cd8000 c039f000 c7cd9f68 c7cd9f00 c0074174 c0084950
9f00: c7cd9f04 c7bdc304 c0bb40a0 11990232 00000005 c039f000 00000300 00000000
9f20: 00000000 c0ba6688 c0ba6680 ffffffe8 c7cd8000 c039f000 c7cd9f68 c7cd9f48
9f40: c007432c c008fa58 00000242 000001b6 c7b6f140 00000241 000001b6 c7cd9f94
9f60: c7cd9f6c c00744a8 c0074158 c7cd804c 0013fe38 0013fd78 0013fdc8 00000005
9f80: c0020ec4 0016b490 c7cd9fa4 c7cd9f98 c007455c c0074464 00000000 c7cd9fa8
9fa0: c0020d20 c0074548 0013fe38 0013fd78 0013fe38 00000241 000001b6 00000000
9fc0: 0013fe38 0013fd78 0013fdc8 be93db24 00000001 00000003 0016b490 0013fe28
9fe0: 00000000 be93d948 00037234 0009fa84 60000010 0013fe38 00000000 00000000
Backtrace:
[<c0107e08>] (jffs2_flash_writev+0x4/0x438) from [<c00ffd94>] 
(jffs2_write_dnode+0x138/0x360)
[<c00ffc5c>] (jffs2_write_dnode+0x0/0x360) from [<c0100740>] 
(jffs2_do_create+0xa8/0x320)
[<c0100698>] (jffs2_do_create+0x0/0x320) from [<c00f9c24>] 
(jffs2_create+0xb0/0x11c)
[<c00f9b74>] (jffs2_create+0x0/0x11c) from [<c0084730>] (vfs_create+0x94/0xc0)
 r8 = C7CD9F04  r7 = C7806154  r6 = C5C08DE4  r5 = 000001A4
 r4 = 00000000
[<c008469c>] (vfs_create+0x0/0xc0) from [<c0084ac4>] (open_namei+0x184/0x6a0)
 r8 = C0020EC4  r7 = FFFFFF9C  r6 = C7CD9F04  r5 = C7BDC304
 r4 = C7806154
[<c0084940>] (open_namei+0x0/0x6a0) from [<c0074174>] (do_filp_open+0x2c/0x48)
[<c0074148>] (do_filp_open+0x0/0x48) from [<c00744a8>] (do_sys_open+0x54/0xe4)
 r5 = 000001B6  r4 = 00000241
[<c0074454>] (do_sys_open+0x0/0xe4) from [<c007455c>] (sys_open+0x24/0x28)
[<c0074538>] (sys_open+0x0/0x28) from [<c0020d20>] (ret_fast_syscall+0x0/0x2c)
Code: 159f02bc 10812003 1bfccc39 e3a03000 (e5833000)


---
The same behavior occurs if I use "dd" indtead of echo.
All worked "fine" on earlyer kernel versions so my question:
Which version of the jffs is included to the "main-line" kernel ?
Is it the current development tree ?  
I tried to build the "current" sources downloadable at the mtd homepage
but without luck. There seems to be many changes accross the MTD-API.

Thanks you for reply!

  Regards,
    Peer Georgi.
