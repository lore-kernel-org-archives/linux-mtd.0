Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CIs8i-0003jC-G8
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2004 13:14:45 -0400
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 420E3229CF
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2004 21:14:10 +0400 (MSD)
Message-ID: <417156E1.9000009@yandex.ru>
Date: Sat, 16 Oct 2004 21:14:09 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 bugfix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've found bug in JFFS2. When there is no free space left on JFFS2 file 
system, and somebody for example tries to creade new directory, JFFS2 
frees memory twice.

See dir.c, jffs2_create(), line 216.

jffs2_do_create returns error.
jffs2_clear_inode(inode) is called and frees the jffs2_sb_info, 
jffs2_full_dnode, etc.
iput(inode) is called, calling in turn the jffs2_clear_inode, and the 
same structures are freed for the second time. This leads to the slab 
cache corruption.

So, the following patch which fixes the problem is proposed.

--- dir.c       2004-10-16 21:02:22.886276648 +0400
+++ dir_corrected.c     2004-10-16 21:03:10.843766654 +0400
@@ -217,7 +217,6 @@
                               dentry->d_name.name, dentry->d_name.len);

         if (ret) {
-               jffs2_clear_inode(inode);
                 make_bad_inode(inode);
                 iput(inode);
                 jffs2_free_raw_inode(ri);

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
