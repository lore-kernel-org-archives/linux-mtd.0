Received: from web41406.mail.yahoo.com ([66.218.93.72])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cx6AC-0003rs-Vf
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2005 11:18:34 -0500
Message-ID: <20050204161831.32323.qmail@web41406.mail.yahoo.com>
Date: Fri, 4 Feb 2005 08:18:31 -0800 (PST)
From: Jeff Stevens <jsteve17@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: MTD JFFS2 Problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to create a jffs2 filesystem, and it seems
to be very flakey.  I have tried creating a jffs2
filesystem using mkfs.jffs2 and then copy it directly
to /dev/mtd0, but when I try to mount it I get a bunch
of errors, and when it finally mounts, the filesystem
acts weird.  So now I am trying a different approach,
where I mount an erased mtdblock0 as jffs2 and then
untar a filesystem on the mounted device.  However,
when I do this it seems to crap out at various points
in the filesystem (I have tried it many times).  Here
is a screen dump:

[root@gtvme ~]# mount -t jffs2 /dev/mtdblock0
/mnt/root
[root@gtvme ~]# cd /mnt/root/
[root@gtvme root]# ls
./  ../
[root@gtvme root]# tar xf /gtvmefs.tar
Write of 1170 bytes at 0x01fa000c failed. returned
-30, retlen 374
Write of 1170 bytes at 0x01fa04a0 failed. returned
-30, retlen 288
Write of 1170 bytes at 0x01fa0934 failed. returned
-30, retlen 740
Write of 2765 bytes at 0x01fa125c failed. returned
-30, retlen 326
Write of 2765 bytes at 0x01fa1d2c failed. returned
-30, retlen 1032
Write of 2765 bytes at 0x01fa27fc failed. returned
-30, retlen 862
Write of 2765 bytes at 0x01fa32cc failed. returned
-30, retlen 116
tar: Write Error: Read-only file system
tar: Invalid tar magic
[root@gtvme root]# Write clean marker to block at
0x00a20000 failed: -30
Write clean marker to block at 0x00820000 failed: -30


I'm not sure what I'm doing wrong.  I seem to be able
to copy things to flash just fine using dd, and
flashcp.  Please help!

Thanks,
   Jeff Stevens


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - 250MB free storage. Do more. Manage less. 
http://info.mail.yahoo.com/mail_250
