Received: from wr-out-0506.google.com ([64.233.184.228])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KB6IA-00031a-Kt
	for linux-mtd@lists.infradead.org; Tue, 24 Jun 2008 11:02:30 +0000
Received: by wr-out-0506.google.com with SMTP id 70so2038685wra.22
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Jun 2008 04:02:29 -0700 (PDT)
Message-ID: <fe810cf0806240402p28ee0a3vf89711a6f70dfe13@mail.gmail.com>
Date: Tue, 24 Jun 2008 15:02:29 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: linux-mtd@lists.infradead.org, "David Woodhouse" <dwmw2@infradead.org>
Subject: [BUG] JFFS2 file truncation/replace on full flash issues
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

It seems there are two known issues with JFFS2 working under full
flash condition. They are file truncation and file data replacement
after -ENOSPC was returned. These issues were already reported on this
list (at least truncation bug was) but there are no fixes so far.

JFFS2 fails to reserve space (jffs2_reserve_space), because both file
truncation and file data replacement are treated as generic write
using ALLOC_NORMAL pool.


******* Truncation *******
Actually file truncation leads to decreasing of used space, so IMO
truncation should never return -ENOSPC (except truncation-to-larger
case, of course). I wonder if something simple like patch below can be
considered as a fix the truncation issue?

diff -uNrp a/fs/jffs2/fs.c b/fs/jffs2/fs.c
--- a/fs/jffs2/fs.c	2008-06-24 12:20:35.000000000 +0400
+++ b/fs/jffs2/fs.c	2008-06-24 12:36:27.000000000 +0400
@@ -35,6 +35,7 @@ int jffs2_do_setattr (struct inode *inod
 	int mdatalen = 0;
 	unsigned int ivalid;
 	uint32_t alloclen;
+	int prio;
 	int ret;

 	D1(printk(KERN_DEBUG "jffs2_setattr(): ino #%lu\n", inode->i_ino));
@@ -74,8 +75,9 @@ int jffs2_do_setattr (struct inode *inod
 		return -ENOMEM;
 	}

+	prio = (inode->i_size > iattr->ia_size) ? ALLOC_DELETION : ALLOC_NORMAL;
 	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &alloclen,
-				  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
+				  prio, JFFS2_SUMMARY_INODE_SIZE);
 	if (ret) {
 		jffs2_free_raw_inode(ri);
 		if (S_ISLNK(inode->i_mode & S_IFMT))


I've run a few FS tests and it works fine for me.


******* Replace *******
It seems it is not a JFFS2 case, when replacing several bytes within
the file would lead to the same amount of free space even after gc
cycle. (Consider compression was disabled.) I've played a bit with
jffs2_write_inode_range() trying to make something similar to
truncation case, but failed because continuous replace still leads to
free space reduction.


So are there any comment/suggestions about these issues?

Thank you,
Alexander
