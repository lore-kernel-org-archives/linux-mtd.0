Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DD44l-0005WQ-GN
	for linux-mtd@lists.infradead.org; Sun, 20 Mar 2005 12:18:56 -0500
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id D890E22B01
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Mar 2005 20:18:23 +0300 (MSK)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sun, 20 Mar 2005 20:18:23 +0300
Message-Id: <1111339103.21772.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH] delete root inode's ino_cache
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

here is the test which doen't let JFFS2 to delete the root inode's
inode_cache object. The root inode does not necessary have the
associated inode node on media, so when the file system's data is
removed completely (e.g. we had a non-empty FS, and now we have an empty
FS), the root inode's inode_cache may refer only obsolete nodes ans the
block erase code may free the root inode's inode_cache.

If you run the test I've recently sent which reproduces a 100% GC
thread's CPU consumption twice, you'll probably see oopses caused by the
discussed bug.

I'm not sure if the same effect possible for non-root inodes.

The following is the proposed fix. I assume there that if an inode_cache
is removed, its nlink shouldn't be zero. For the root inode it isn't
possible since it is initialized to 1, not to 0.


Index: erase.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/erase.c,v
retrieving revision 1.73
diff -u -r1.73 erase.c
--- erase.c     17 Mar 2005 20:23:06 -0000      1.73
+++ erase.c     20 Mar 2005 17:00:56 -0000
@@ -278,7 +278,7 @@
                printk("\n");
        });

-       if (ic->nodes == (void *)ic)
+       if (ic->nodes == (void *)ic && ic->nlink == 0)
                jffs2_del_ino_cache(c, ic);
 }

Index: nodemgmt.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodemgmt.c,v
retrieving revision 1.119
diff -u -r1.119 nodemgmt.c
--- nodemgmt.c  28 Feb 2005 08:21:05 -0000      1.119
+++ nodemgmt.c  20 Mar 2005 17:04:20 -0000
@@ -594,7 +594,7 @@
                *p = ref->next_in_ino;
                ref->next_in_ino = NULL;

-               if (ic->nodes == (void *)ic)
+               if (ic->nodes == (void *)ic && ic->nlink == 0)
                        jffs2_del_ino_cache(c, ic);

                spin_unlock(&c->erase_completion_lock);

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
