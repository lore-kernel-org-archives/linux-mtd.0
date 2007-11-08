Received: from rv-out-0910.google.com ([209.85.198.190])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqFhY-0002uy-Oi
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 17:18:23 -0500
Received: by rv-out-0910.google.com with SMTP id c24so289870rvf
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Nov 2007 14:18:07 -0800 (PST)
Message-ID: <4f09da300711081418w2a10e52bh3f0213c6115cd14c@mail.gmail.com>
Date: Fri, 9 Nov 2007 11:18:07 +1300
From: "Tim Beale" <tlbeale@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: NFS mounting JFFS2 file systems with linux 2.6.23 (exportfs changes)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi,

I'm using NFS to mount a JFFS2 file system, using the patches from:
http://lists.infradead.org/pipermail/linux-mtd/2007-March/017663.html

We recently upgraded our linux kernel from 2.6.16 to 2.6.23 and noticed some
differences in behaviour, mainly "Stale NFS file handle" errors when accessing
sub-directories.

The problem is due to exportfs changes - each file system now implements its
own get_dentry() function and the default get_dentry() would now return
-ESTALE, i.e. changes in commit:
http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.23.y.git;a=commit;
h=5ca29607331fe37980dc3b488793ef8b1409b722
(In the latest kernel source code, a mandatory fh_to_dentry() is now needed).

To avoid the problem I added a jffs2_get_dentry(), diff is below (it's the same
code as the new jfs_get_dentry() and export_iget() prior to above change).

However, note that this doesn't seem to detect stale NFS file handles at all
(i.e. the i_generation check), I take it because JFFS2 doesn't set/use the
i_generation values? To avoid stale file handles, we've turned off directory
attribute caching (acdirmin=0) for our NFS mounts, which seems to work OK (the
extra overhead isn't too much in our setup).

1) Does this change sound OK? Any obvious problems?
2) Are the JFFS2 patches for exportfs going to be added to the kernel source
in the future?

Thanks for your help,
Tim

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 2796503..b5156f4 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -92,8 +92,41 @@ static struct dentry *jffs2_get_parent(struct dentry *child)
        return parent;
 }

+struct dentry *jffs2_get_dentry(struct super_block *sb, void *vobjp)
+{
+       __u32 *objp = vobjp;
+       unsigned long ino = objp[0];
+       __u32 generation = objp[1];
+       struct inode *inode;
+       struct dentry *result;
+
+       if (ino == 0)
+               return ERR_PTR(-ESTALE);
+       inode = iget(sb, ino);
+       if (inode == NULL)
+               return ERR_PTR(-ENOMEM);
+
+       if (is_bad_inode(inode) ||
+           (generation && inode->i_generation != generation)) {
+               result = ERR_PTR(-ESTALE);
+               goto out_iput;
+       }
+
+       result = d_alloc_anon(inode);
+       if (!result) {
+               result = ERR_PTR(-ENOMEM);
+               goto out_iput;
+       }
+       return result;
+
+ out_iput:
+       iput(inode);
+       return result;
+}
+
 static struct export_operations jffs2_export_ops = {
        .get_parent = jffs2_get_parent,
+       .get_dentry = jffs2_get_dentry,
 };
