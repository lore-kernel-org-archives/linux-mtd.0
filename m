Received: from 213-97-242-113.uc.nombres.ttd.es ([213.97.242.113] helo=rebirth.wojtyla.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JICL-0006Ae-00
	for <linux-mtd@lists.infradead.org>; Sat, 15 Jun 2002 19:22:53 +0100
Received: from devil.teleline.es (devil.iqc-services.local [192.168.197.3])
	by rebirth.wojtyla.org (8.11.6/8.8.7) with ESMTP id g5FIFnT05632
	for <linux-mtd@lists.infradead.org>; Sat, 15 Jun 2002 20:15:50 +0200
Message-Id: <5.1.0.14.2.20020615201336.02d5bc70@pop3.iqc-services.com>
Date: Sat, 15 Jun 2002 20:20:25 +0200
To: linux-mtd@lists.infradead.org
From: Securez <securez@teleline.es>
Subject: Problems with MTD, can anybody help?
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I try to use MTD with JFFS in the FLASH memory that my system have on main 
board.
It's a VZ328 based board with uClinux 2.4.17.
The FLASH chips that i use are Amd29LV160B.

The system detect my MTD partitions, but when i use the partition, pased 
some time it produces the next error:
.....
jffs_readdir(): inode: 0x0012d2a0, filp: 0x000e8740
jffs_readdir(): "." 1
jffs_readdir(): ".." 1
jffs_readdir(): "bin" ino: 5
readdir(): up biglock
bad frame format: 00000000
PC: [<30303032>]
SR: 2015  SP: 00149d60  a2: 30303032
d0: 0015a97e    d1: ffffffff    d2: 00000000    d3: 00000001
d4: 00142000    d5: 00000001    a0: 0015a97e    a1: 00149eee
Process cat (pid: 35, stackpage=00149000)
Frame format=0
Stack from 00149d94:
         20122700 02009bba 00000000 00149eee 00142000 00000000 0015a000 
00159000
         000e8660 00130004 00149e6c 02065228 0015a97a 00000001 00000001 
00149ecc
         00000022 00149ecc 00000022 0015a000 00159000 000e8660 00000041 
ffffffff
         001027ea ffefd816 0013dec0 0010280e 00000010 00149f3c ffffffff 
00149e16
         00303031 32333435 36373839 41424344 45464748 494a4b4c 4d4e4f50 
51525354
         55565758 595a000a 30313233 34353637 38396162 63646566 6768696a 
6b6c6d6e
Call Trace:
         [<02009bba>] [<02065228>] [<02067054>] [<02064524>]
         [<02065d56>] [<02065c52>] [<02062696>] [<02019894>]
         [<020029c6>]

I test it with JFFS and JFFS2 and both hangs my board after some time 
working on the partition, :(, i think that the problem can comes in MTD, 
when i try to make a cat /proc/fs/jffs/1f:00/layout it hags my board after 
output some inome information.

I'm a newbye to MTD/JFFS and need some help to locate the erorr, can 
anybody help me.

Regards.
