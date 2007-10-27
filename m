Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IljRZ-0000N6-Co
	for linux-mtd@lists.infradead.org; Sat, 27 Oct 2007 12:03:07 +0100
Subject: RE: getdents64 problem in 2.6.23
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1193440660.16168.57.camel@shinybook.infradead.org>
References: <023b01c81824$71647f40$5267a8c0@Jocke>
	<1193440660.16168.57.camel@shinybook.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Sat, 27 Oct 2007 13:02:40 +0200
Message-Id: <1193482960.23594.8.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-10-26 at 19:17 -0400, David Woodhouse wrote:
> On Sat, 2007-10-27 at 01:03 +0200, Joakim Tjernlund wrote:
> > Is this what you mean(just a stupid hack for now)?
> >           //*prev = this->next;
> >             jffs2_mark_node_obsolete(c, (this->raw));
> >             this->raw = NULL;
> >           //jffs2_free_full_dirent(this);
> 
> Yeah, something like that. And we also need to modify
> jffs2_add_fd_to_list() so that if we later add a new dirent which
> _replaces_ this one, it doesn't oops after calling
> jffs2_mark_node_obsolete(c, fd->raw);
> 
> > Perhaps add a jffs2_add_fd_to_list(c, this, &dir_f->dents)?
> 
> Nah, no need for that. It's already _in_ the list.
> 
> > How do I find where the filedescriptor is closed?
> 
> We probably need to implement a release() operation in the
> jffs2_dir_operations (top of dir.c), which will remove the fake
> 'deletion' dirents if !atomic_read(&inode->i_count). Or something like
> that.
> 

Next iteration. I am rather lost in the release function.
Some hints would be great.

 Jocke

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 8353eb9..a658bcb 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -20,6 +20,7 @@
 #include "nodelist.h"
 
 static int jffs2_readdir (struct file *, void *, filldir_t);
+static int jffs2_release (struct inode *, struct file *);
 
 static int jffs2_create (struct inode *,struct dentry *,int,
 			 struct nameidata *);
@@ -39,7 +40,8 @@ const struct file_operations jffs2_dir_operations =
 	.read =		generic_read_dir,
 	.readdir =	jffs2_readdir,
 	.ioctl =	jffs2_ioctl,
-	.fsync =	jffs2_fsync
+	.fsync =	jffs2_fsync,
+	.release =	jffs2_release,
 };
 
 
@@ -174,6 +176,25 @@ static int jffs2_readdir(struct file *filp, void *dirent, filldir_t filldir)
 
 /***********************************************************************/
 
+static int jffs2_release(struct inode *dir_i, struct file *file)
+{
+	//struct jffs2_sb_info *c = JFFS2_SB_INFO(dir_i->i_sb);
+	struct jffs2_inode_info *dir_f = JFFS2_INODE_INFO(dir_i);
+	struct jffs2_full_dirent **prev = &dir_f->dents;
+
+	if (atomic_read(&dir_i->i_count))
+		return 0;
+
+	while (*prev) {
+		D1(printk(KERN_DEBUG "Releasing directory inode:%d\n", (*prev)->ino));
+
+		jffs2_free_full_dirent(*prev);
+		prev = &((*prev)->next);
+	}
+	return 0;
+}
+
+/***********************************************************************/
 
 static int jffs2_create(struct inode *dir_i, struct dentry *dentry, int mode,
 			struct nameidata *nd)
diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 4bf8608..5419023 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -34,13 +34,15 @@ void jffs2_add_fd_to_list(struct jffs2_sb_info *c, struct jffs2_full_dirent *new
 			if (new->version < (*prev)->version) {
 				dbg_dentlist("Eep! Marking new dirent node is obsolete, old is \"%s\", ino #%u\n",
 					(*prev)->name, (*prev)->ino);
-				jffs2_mark_node_obsolete(c, new->raw);
+				if (new->raw)
+					jffs2_mark_node_obsolete(c, new->raw);
 				jffs2_free_full_dirent(new);
 			} else {
 				dbg_dentlist("marking old dirent \"%s\", ino #%u bsolete\n",
 					(*prev)->name, (*prev)->ino);
 				new->next = (*prev)->next;
-				jffs2_mark_node_obsolete(c, ((*prev)->raw));
+				if ((*prev)->raw)
+					jffs2_mark_node_obsolete(c, ((*prev)->raw));
 				jffs2_free_full_dirent(*prev);
 				*prev = new;
 			}
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index 2f56954..11e8b5f 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -591,9 +591,8 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 				D1(printk(KERN_DEBUG "Marking old dirent node (ino #%u) @%08x obsolete\n",
 					  this->ino, ref_offset(this->raw)));
 
-				*prev = this->next;
 				jffs2_mark_node_obsolete(c, (this->raw));
-				jffs2_free_full_dirent(this);
+				this->raw = NULL;
 				break;
 			}
 			prev = &((*prev)->next);
