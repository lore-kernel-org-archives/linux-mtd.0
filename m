Received: from xproxy.gmail.com ([66.249.82.203])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EGcDj-00060h-8i
	for linux-mtd@lists.infradead.org; Sat, 17 Sep 2005 08:55:21 -0400
Received: by xproxy.gmail.com with SMTP id i26so502786wxd
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Sep 2005 05:55:05 -0700 (PDT)
Message-ID: <5b42f131050917055543f3d84f@mail.gmail.com>
Date: Sat, 17 Sep 2005 20:55:05 +0800
From: Sphinx King <alpharoot@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: ext2 and fat32 can't handle bad block of nand flash?
Reply-To: alpharoot@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
It sounds like we can not use ext2 or fat32 file system on nand flash
if the nand flash has bad blocks.

My board has only one bad block which can be handled by mtd driver
because I saw message like "bad eraseblock ..." during linux booting
up. I've managed to use mke2fs to format the mtdblock as ext2
(although it has bad block). When I copy file to this partition, it
soulds like ext2 still attempts to write data to the bad block
although this bad block is already put into the mtd bad block table.
This finally results in I/O error and the write fails. I also tried
fat32 and got the same result.

After looking into the mtd code, I found the write request (which is
from the up layer) to the bad block is transfered to the function
do_cached_write() in mtdblock.c. In this function mtd might do a
cached_write after it receives data from up layer, ie., it attempts to
read out sector data and do buffering, which will be written back to
the block later. Here the problem comes out. Since the block is bad,
an ECC error occurs which results in the failure of the read. And the
do_cached_write() returns error to inform up layer. However it seems
the up layer will try to write to the bad block again and again
although the write fails. Finally the copy of file completes but the
file is corrupt.

Is my understanding correct? Why ext2 or fat32 trys to write to a bad
block? Can we use ext2 or fat on nand flash if the flash has bad
block?

By reading some doc I was told there is no such problem for jffs2
because jffs2 can handle bad block info. Is it true? Currently I
haven't try jffs2 yet. I will try it in some days.

Can anybody help me on this? Thanks in advance.

--=20
Sphinx
