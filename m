From: asoneofus@nm.ru (A.L. Klyutchenya)
Date: Tue, 1 Apr 2003 02:02:21 +0400
Subject: error in jffs2reader ?
Message-ID: <200304010202.21850.asoneofus@nm.ru>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Having sources MTD from CVS has found the frob, which approached 
to my task (read boot file from MTD NAND+JFFS2, 
CVSROOT/mtd/util/jffs2reader.c). Was it however found very 
unpleasant particularity: program reads only one block from 
file. This only beside me so?
Check:
- shall create image of the disk (from directory OSSCVOIP01)
mkfs.jffs2 -vl -e 0x4000 -o jffs2root.img -r ./OSSCVOIP01 -p
- afterwards, given by program, extract the file.
jffs2reader jffs2root.img -f vmlinus
- a review - do not eqvivalent.
After searching for has found that program takes only one block 
from file (his decompress).

-- 
????????!      
      ____   __
     /   |  / / ?. ?. ????????
    / /| | / /  (asoneofus)
   / /_| |/ /   mail:   asoneofus at kde.ru
  / ____  _ \   www:    http://www.qt.kde.ru
 / /   | | \ \  icq:    113679387
/_/    |_|  \_\ 
