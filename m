Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikana.artecdesign.ee)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ETo8F-0000h8-Tr
	for linux-mtd@lists.infradead.org; Sun, 23 Oct 2005 18:16:09 -0400
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=pcy.artec.ee)
	by postikana.artecdesign.ee with esmtp (Exim 3.35 #1 (Debian))
	id 1ETnbY-0003IC-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2005 00:42:12 +0300
Date: Mon, 24 Oct 2005 00:50:06 +0300 (EEST)
From: Olav Kongas <ok@artecdesign.ee>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.63.0510232319490.15242@pcy.artec.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Buffer I/O error - chip access timings in 2.6.13?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Below I describe a problem I have with 2.6.13 kernel. I 
didn't see it on 2.6.7 or 2.6.9. I haven't tested other 
kernels. I have no clue, whether it is a chip 
problem, mtd layer problem, cramfs problem, or am I just 
messing something up. Therefore some information below may 
be irrelevant, please apologize.

The setup: sharp's lh7a400 SoC with a lh28f640bfhe nor 
flash. The flash contains a 4MB root partition with cramfs 
(/dev/mtdblock0) and among other things an area of a few 
blocks (/dev/mtd2), where tarred/gzipped conf data is kept.
At the system boot, the following happens:

1. rootfs (cramfs) is mounted from flash
2. tmpfs is mounted to /tmp, /etc and to a few other directories
3. packed contents are untarred/unzipped into those
   mounted tmpfs filesystems
4. the content of /dev/mtd2 is cat'ed to /tmp into a 
   temporary file.
5. this temporary file is untarred/unzipped into /etc/conf/

With earlier kernels, the board has been working OK after 
these steps. With 2.6.13, after performing successfully the 
steps 1-5 above, there is an executable in the rootfs, whose 
content, if read with 'od -x' is just filled with zeroes. 
When trying to run or read it the first time, the following 
errors show up in log:

Waiting for chip to be ready timed out. Status 3c31
end_request: I/O error, dev mtdblock0, sector 5400
Buffer I/O error on device mtdblock0, logical block 675
Waiting for chip to be ready timed out. Status 3c31
end_request: I/O error, dev mtdblock0, sector 5400
Buffer I/O error on device mtdblock0, logical block 675
Waiting for chip to be ready timed out. Status 3c31
end_request: I/O error, dev mtdblock0, sector 5400
Buffer I/O error on device mtdblock0, logical block 675
Error -3 while decompressing!
c01ae370(-2766468)->c42c5000(4096)

The following can be noted:

A. The rootfs image in the flash is intact after the failure 
ahove (tested with md5sum in the bootloader).

B. I have seen the problem until now only with 2.6.13

C. the same error, pointing to the same sector/logical 
block, is issued on 2 different boards that I have checked.

D. strangely, the problem does not show up, if the contents 
of the /dev/mtd2 is not a valid gzip file and therefore the 
step 5 above fails. In that case the mentioned executable in 
the rootfs is fine.

E. also, I have managed to cure the problem by adding more 
files to the directory, where the problematic executable 
resides

F. until now, I haven't noticed problems with any other file 
in the rootfs, but I can't be sure.

G. 1s sleeps added between and around 4 and 5 have no 
effect.

H. Though I doubt it's a cramfs problem, I applied also the 
two cramfs-related patches submitted for 2.6.14-rc1 (see 
below). No effect.

I am most puzzled about the D above: how can unzipping 
anything into a mounted tmpfs affect file content provided 
by kernel from the cramfs. Is it a timing problem of chip 
access? Does anyone have a clue? Thanks in advance.

Olav

PS. Please keep me CC'ed.

------------------------------------------
Cramfs patches tested:

commit e711700a0e6a6824fcfd5519d6b6982850a648ee
Author: Adrian Bunk <bunk@stusta.de>
Date:   Sat Sep 10 00:27:20 2005 -0700

    [PATCH] fs/cramfs/uncompress.c should #include 
<linux/cramfs_fs.h>
    
    Every file should #include the header with the 
prototypes of the global
    functions it is offering.

commit a97c9bf33f4612e2aed6f000f6b1d268b6814f3c
Author: Dave Johnson 
<djohnson+linux-kernel@sw.starentnetworks.com>
Date:   Tue Sep 6 15:17:40 2005 -0700

    [PATCH] fix cramfs making duplicate entries in inode 
cache
    
    Every time cramfs_lookup() is called to lookup and inode 
for a dentry,
    get_cramfs_inode() will allocate a new inode without 
checking to see if that
    inode already exists in the inode cache.
    
    This is fine the first time, but if the dentry cache 
entry(ies) associated
    with that inode are aged out, but the inode entry is not 
aged out (which can
    be quite common if the inode has buffer cache linked to 
it), cramfs_lookup()
    will be called again and another inode will be allocated 
and added to the
    inode cache creating a duplicate in the inode cache.
    
    The big issue here is that the buffers associated with 
each inode cache entry
    are not shared between the duplicates!
    
    The older inode entries are now orphaned as no dentry 
points to it and won't
    be freed until the buffer cache assoicated with them are 
first freed.  The
    newest entry will have to create all new buffer cache 
for each part of its
    file as the old buffer cache is now orphaned as well.
    
    Patch below fixes this by making get_cramfs_inode() use 
the inode cache before
    blindly creating a new entry every time.  This 
eliminates the duplicate inodes
    and duplicate buffer cache.
