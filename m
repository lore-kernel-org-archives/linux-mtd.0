Received: from send.forptr.21cn.com ([202.105.45.49] helo=21cn.com)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAlMx-00085J-Ka
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 05:29:34 -0400
Date: Thu, 1 Sep 2005 17:28:19 +0800
From: "Liao Kai" <carlliao@21cn.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Message-ID: <zT949098826967.01695@send5.inner-21cn.com>
Subject: NAND  JFFS2 mount umount problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI ALL,

I used the linux-2.6.11 kernel from MIPS-LINUX.ORG. I am not sure which 
snapshot does it merged from. The drivers/mtd/mtdchar.c is:
    $Id: mtdchar.c,v 1.66 2005/01/05 18:05:11 dwmw2 Exp $

I tried to test my NAND flash driver following the steps below:

(1) Format the NAND partition to JFFS2, mount it and read/write for
100 times. There are no error at all.
    $ eraseall -j /dev/mtd/0
    $ mount -t jffs2 /dev/mtdblock/0 /mnt  
      
Then repeat the following step 100 times:
    $ rm -f /mnt/test.rpm
    $ cp -f /test/nand/test.rpm /mnt
    $ cp -f /mnt/test.rpm /test/nand/dump${i}.rpm
    where ${i} are [1..100]
    
After 100 read/write, then umount the NAND partition.

(2) If at each time, first mount /dev/mtdblock/0, copy the test.rpm file out,
then umount /dev/mtdblock/0, about 8 copied files will be corrupted.
    $ eraseall -j /dev/mtd/0
    $ mount -t jffs2 /dev/mtdblock/0 /mnt 
    $ cp -f /test/nand/test.rpm /mnt
    $ umount /mnt
    
Then repeat the following step 100 times:
    $ mount -t jffs2 /dev/mtdblock/0 /mnt
    $ cp -f /mnt/test.rpm /test/nand/dump${i}.rpm
    where ${i} are [1..100]
    $ umount /mnt
    
Could you please give me some hints about this problem? Thanks!

Carl Liao
