From: vdoukhan@cbnco.com (Vladimir Doukhanine)
Date: Wed, 05 Feb 2003 09:37:04 -0500
Subject: Is JFFS2 position independent or not?
Message-ID: <oprj4lj2kp7bj7b7@cbnsitar.cbnco.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,
??
I???m just wandering if JFFS2 file system is position independent or not?
??
For instance let's say:
1) I want to copy /dev/mtd2 with a root JFFS2 to /dev/mtd1 then Boot Linux 
from root on /dev/mtd1,
2) I want to copy JFFS2 image from /dev/mtd2 (flash chip physically located 
from ADDR1) to /dev/mtd2 (flash chip type the same, all /dev/mtd* have the 
same size but chip physically located from ADDR2).
??
Thanks,
Vlad
