Received: from ext-ch1gw-3.online-age.net ([216.34.191.37])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AWRpF-0002tv-6N
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2003 02:54:13 +0000
Received: from int-ch1gw-2.online-age.net (int-ch1gw-2 [3.159.232.66])
	id hBH2q1Ae016419	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Dec 2003 21:52:01 -0500 (EST)
Received: from uswaumsxb1medge.med.ge.com (localhost [127.0.0.1])
	id hBH2pxaX028806	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Dec 2003 21:52:00 -0500 (EST)
Message-ID: <77FE4A1FA59FF947845A42194AD667620A0F77@uswaumsx07medge.med.ge.com>
From: "Howard, Michael (MED)" <Michael.Howard@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 16 Dec 2003 20:51:55 -0600
MIME-Version: 1.0
Content-Type: text/plain
Subject: Data lost when copying large binary files to NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a situation here where I mount JFFS2 on top of my NAND device and
certain files will fail to copy over.  Small text files are fine.  The
problem is with large binary files.  I copy to my mounted dir and ls -l
shows the file is entirely there.  I check at the jffs2_flash_writev() and I
find that it has created the new inode and all the data is there.  It also
appears to be correctly fragmented.  It makes its way to the wbuf but I'm
not sure all frags are commited.  I try a sync and umount to flush the wbuf.

Upon remounting, the file is lost or showing a size of 0.  Upon scanning the
flash at mount I will always get "jffs2_get_inode_nodes(): Data CRC failed
on node at ..."  

I don't get any write errors from nand.c upon committing the frags.  My
theory is either the fragments aren't linking to each other, not all the
frags are written to flash or the scan on remount is failing to understand
the inode headers or data. 

Has anyone experienced this and have any ideas?  Any help would be much
appreciated.

Thanks
Mike
