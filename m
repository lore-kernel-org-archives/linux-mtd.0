Received: from matrixvision.de ([217.160.213.229]
	helo=p15137414.pureserver.info)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlRhQ-0005WU-7r
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 11:48:08 +0000
Received: from rhea.intern.matrix-vision.de (p5083C9E7.dip0.t-ipconnect.de
	[80.131.201.231])	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by p15137414.pureserver.info (Postfix) with ESMTP id 0721F34C214
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jan 2004 12:51:02 +0100 (CET)
From: Howard Gray <rhea@matrix-vision.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 27 Jan 2004 12:47:41 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200401271247.41281.rhea@matrix-vision.de>
Subject: Problem deleting files with NAND/JFFS2 and a possible solution
Reply-To: rhea@matrix-vision.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using kernel 2.4.20 with the latest cvs MTD version. The system is a  
PowerPC-based embedded device with both NOR and NAND flash. I have a 
partition in NAND flash using JFFS2 as the file system. 

If I mount a JFFS2 partition, delete a single file and unmount again, 
everthing is o.k. 

But if I mount the JFFS2 partition, delete a file and then (after a long pause 
to ensure the garbage collector has finished) turn off the device without 
unmounting, the file reappears after the reboot and new mount command. There 
are various variations on this like mounting read-only before unmounting etc. 
(with this device, I cannot assume that a user turns off this device in a 
controlled way....)

It appears as if just deleting a file is not enough to mark any inodes as 
dirty so that kupdated ignores them. It doesn't matter how long you wait for 
the GC to be started because it won't be unless you do something else to the 
file system too, like creating a new file or sending a SIGHUP to the GC. For 
the same reason a "sync" doesn't help either.

After some time I came to the conclusion that there is a problem in the 
function "jffs2_full_dirent" in the file "fs/jffs2/write.c". A call is made 
to "jffs2_flash_writev" which has as its final parameter an inode number 
(assuming alloc_mode is not ALLOC_GC). It looks like this:

write.c: approx. line 282.....

    ret = jffs2_flash_writev(c, vecs, 2, flash_ofs, &retlen,
                 (alloc_mode==ALLOC_GC)?0:fd->ino);

"fd->ino" would appear always to be "0" in the case where a file is just being 
deleted which, in turn,  at the end of "jffs2_flash_writev" stops the inode 
being dirtied (i.e. the superblock's "s_dirt" flag is not set to "1"): Here's 
the call at the wnd of "jffs2_flash_writev":

wbuf.c: approx. line 752.....

    if (c->wbuf_len && ino)
        jffs2_wbuf_dirties_inode(c, ino);


I'm not sufficiently knowledgeable about the internals of JFFS2 to supply a 
proper patch, but it would seem to me that the call to "jffs2_flash_writev" 
in write.c at line 282 should be like this:

Suggestion....
write.c: approx. line 282.....

    ret = jffs2_flash_writev(c, vecs, 2, flash_ofs, &retlen,
                 (alloc_mode==ALLOC_GC)?0:je32_to_cpu(rd->pino));

This would appear to be the inode of the directory entry and this is really 
what we are changing when we delete a file, or am I missing something here ? 
In any case, this change seems to have the desired effect and the problem is 
cured.

Any comments would be appreciated. Thanks.

--
Howard
