From: samoutin@hotbox.ru (Alex Samoutin)
Date: Fri, 14 Feb 2003 10:27:26 -0800
Subject: NAND OOB and endians issue.
Message-ID: <003e01c2d456$bba71340$1a00a8c0@itc.intrinsyc.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I am using PPC (IBM 405ep) system with NAND flash. It is big endian
processor.



When I create empty jffs2 image  on board (using mount -t jffs2 /dev/mtd0 on
erased partition) jffs2 write clean marker bytes to the OOB of first sector
of each blocks. According to docs it supposet to be



 Offset (hex) 08 09 0a 0b 0c 0d 0e 0f

Data    85 19 03 20 08 00 00 00

But in reality I have



19 85 20 02 00 00 00 08



(I used nanddump with formatted output to check it)



Ok. Inside jffs2.h   I can define JFFS2_BIG_ENDIAN (instead default
JFFS2_NATIVE_ENDIAN) but result the same. And only if I set
JFFS2_LITTLE_ENDIAN I will get    85 19 03 20 08 00 00 00 pattern.



It is look very strange for me. So, which def for endians I should use?



Alex.
