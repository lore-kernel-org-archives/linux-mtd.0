Received: from emc.emcraft.com ([80.240.96.158])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1Fbu8f-00013s-Kr
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 02:50:14 -0400
Received: from emc.emcraft.com ([127.0.0.1] helo=[::1])
	by emc.emcraft.com with esmtp (Exim 4.10) id 1Fbu6A-0007qH-00
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 10:47:34 +0400
From: Dmitry Bazhenov <atrey@emcraft.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 5 May 2006 10:50:24 +0400
MIME-Version: 1.0
Message-Id: <200605051050.24227.atrey@emcraft.com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: JFFS2 has possible race when setting file attributes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everybody!

It seems like there is a potential race in the function jffs2_do_setattr() in 
the case when attributes of a symlink are updated. The symlink metadata is 
read without having f->sem locked.
The following patch should fix the race.

--- a/fs/jffs2/fs.c     2006-04-29 18:51:53.000000000 +0400
+++ b/fs/jffs2/fs.c     2006-05-04 17:32:09.000000000 +0400
@@ -56,15 +56,20 @@ static int jffs2_do_setattr (struct inod
                mdatalen = sizeof(dev);
                D1(printk(KERN_DEBUG "jffs2_setattr(): Writing %d bytes of 
kdev_t\n", mdatalen));
        } else if (S_ISLNK(inode->i_mode)) {
+               down(&f->sem);
                mdatalen = f->metadata->size;
                mdata = kmalloc(f->metadata->size, GFP_USER);
-               if (!mdata)
+               if (!mdata) {
+                       up(&f->sem);
                        return -ENOMEM;
+               }
                ret = jffs2_read_dnode(c, f, f->metadata, mdata, 0, mdatalen);
                if (ret) {
+                       up(&f->sem);
                        kfree(mdata);
                        return ret;
                }
+               up(&f->sem);
                D1(printk(KERN_DEBUG "jffs2_setattr(): Writing %d bytes of 
symlink target\n", mdatalen));
        }


Regards,
Dmitry
