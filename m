Received: from f170.pav2.hotmail.com ([64.4.37.170] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18QuAR-0007Ln-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Dec 2002 18:52:39 +0000
From: "invictus rm" <invictus_rm@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: 28F256K3 + mtd/jffs2 ??
Date: Wed, 25 Dec 2002 00:31:14 +0530
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F170WARL902meqniJuS00015896@hotmail.com>
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

hi ,

    While upgrading flash from 32 MB to 64 MB ( to 28F256k3 synchronous 
flash), my mtd/jffs2 seems to have been broken.

    Since the sync flash comes with a feature of sectore lock after every
powerup , i am unlocking the mtd partition before mouting the mtd partition 
.

  But once the filesystem is mounted the df(used) increases to 100% and then 
never comes down (remains at 100%, even though nothing has been written).

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root                15863      9972      5072  66% /
/dev/mtdblock2           51200     51200         0 100% /mnt/jffs2

bash-2.04# mtd_debug info /dev/mtd2
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 52428800 (50M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

bash-2.04# cp /etc/services /mnt/jffs2
Newly-erased block contained word 0x19852003 at offset 0x03140000
Newly-erased block contained word 0x19852003 at offset 0x03100000
Node totlen on flash (0x00000004) != totlen in node ref (0x00000044)
ARGH. About to write node to 0x031c0dc4 on flash, but there's data already 
there
:
0x031c0dc4: 73 20 53 10 48 88 80 c0 00 2f 21 01 c4 47 30 40
ARGH. About to write node to 0x031c1470 on flash, but there's data already 
there
:
0x031c1470: 04 26 81 0a 0d 80 03 81 20 18 3c 64 03 c6 00 22
ARGH. About to write node to 0x031c1b24 on flash, but there's data already 
there
:
0x031c1b24: 9c 48 c8 17 79 0c e7 80 de cf de 31 f4 44 79 d2
ARGH. About to write node to 0x031c1dd0 on flash, but there's data already 
there
:
0x031c1dd0: a8 40 c2 00 c0 02 02 23 0c a6 1a 00 58 22 00 1d

   Is there any change that needs to be done apart from unlocking each 
sector ??
  hoping to get a response

regards
rm



_________________________________________________________________
The new MSN 8: smart spam protection and 3 months FREE*.  
http://join.msn.com/?page=features/junkmail&xAPID=42&PS=47575&PI=7324&DI=7474&SU= 
http://www.hotmail.msn.com/cgi-bin/getmsg&HL=1216hotmailtaglines_smartspamprotection_3mf
