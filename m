From: samoutin@hotbox.ru (Alex Samoutin)
Date: Fri, 14 Feb 2003 09:59:20 -0800
Subject: ECC calculation bug in nand_write_page()
Message-ID: <001d01c2d452$ce30b2e0$1a00a8c0@itc.intrinsyc.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I found that ECC calculation is worng when we do partial write to sector.

When starting byte !=0 and eccmode == NAND_ECC_SOFT this function made

/* Read back previous written data, if col > 0 */

for correct ECC calculation. It is ok. Hovewer  if col==0 but last !=0 it
would do the same (read back previos written data) for the
tail of block. But it didn't.

Alex
