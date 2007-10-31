Subject: Re: [PATCH] NULLify ->raw after jffs2_mark_node_obsolete().
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1193867924.11355.27.camel@gentoo-jocke.transmode.se>
References: <1193765964-30069-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1193765964-30069-2-git-send-email-Joakim.Tjernlund@transmode.se>
	<1193841682.2651.104.camel@shinybook.infradead.org>
	<1193867924.11355.27.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Wed, 31 Oct 2007 18:14:25 -0400
Message-Id: <1193868865.2651.148.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2007-10-31 at 22:58 +0100, Joakim Tjernlund wrote:
> Well, I just did what I belived you wanted me to do so I did not think
> much about it. I can redo the first patch with the necessary part or
> you can do it with any extra checks you deem necessary. I just want
> some variant in mtd git so I can have the same to avoid conflicts
> later on.

How about this... I also cleaned up the list traversal stuff now we're
not actually removing from the list.

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 4bf8608..87c6f55 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -32,15 +32,18 @@ void jffs2_add_fd_to_list(struct jffs2_sb_info *c, struct jffs2_full_dirent *new
 		if ((*prev)->nhash == new->nhash && !strcmp((*prev)->name, new->name)) {
 			/* Duplicate. Free one */
 			if (new->version < (*prev)->version) {
-				dbg_dentlist("Eep! Marking new dirent node is obsolete, old is \"%s\", ino #%u\n",
+				dbg_dentlist("Eep! Marking new dirent node obsolete, old is \"%s\", ino #%u\n",
 					(*prev)->name, (*prev)->ino);
 				jffs2_mark_node_obsolete(c, new->raw);
 				jffs2_free_full_dirent(new);
 			} else {
-				dbg_dentlist("marking old dirent \"%s\", ino #%u bsolete\n",
+				dbg_dentlist("marking old dirent \"%s\", ino #%u obsolete\n",
 					(*prev)->name, (*prev)->ino);
 				new->next = (*prev)->next;
-				jffs2_mark_node_obsolete(c, ((*prev)->raw));
+				/* It may have been a 'placeholder' deletion dirent, 
+				   if jffs2_can_mark_obsolete() (see jffs2_do_unlink()) */
+				if ((*prev)->raw)
+					jffs2_mark_node_obsolete(c, ((*prev)->raw));
 				jffs2_free_full_dirent(*prev);
 				*prev = new;
 			}
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index ac86c27..bfe18e9 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -575,26 +575,27 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 		jffs2_add_fd_to_list(c, fd, &dir_f->dents);
 		up(&dir_f->sem);
 	} else {
-		struct jffs2_full_dirent **prev = &dir_f->dents;
+		struct jffs2_full_dirent *fd = dir_f->dents;
 		uint32_t nhash = full_name_hash(name, namelen);
 
 		down(&dir_f->sem);
 
-		while ((*prev) && (*prev)->nhash <= nhash) {
-			if ((*prev)->nhash == nhash &&
-			    !memcmp((*prev)->name, name, namelen) &&
-			    !(*prev)->name[namelen]) {
-				struct jffs2_full_dirent *this = *prev;
+		for (fd = dir_f->dents; fd; fd = fd->next) {
+			if (fd->nhash == nhash &&
+			    !memcmp(fd->name, name, namelen) &&
+			    !fd->name[namelen]) {
 
 				D1(printk(KERN_DEBUG "Marking old dirent node (ino #%u) @%08x obsolete\n",
-					  this->ino, ref_offset(this->raw)));
-
-				*prev = this->next;
-				jffs2_mark_node_obsolete(c, (this->raw));
-				jffs2_free_full_dirent(this);
+					  fd->ino, ref_offset(fd->raw)));
+				jffs2_mark_node_obsolete(c, fd->raw);
+				/* We don't want to remove it from the list immediately,
+				   because that screws up getdents()/seek() semantics even
+				   more than they're screwed already. Turn it into a
+				   node-less deletion dirent instead -- a placeholder */
+				fd->raw = NULL;
+				fd->ino = 0;
 				break;
 			}
-			prev = &((*prev)->next);
 		}
 		up(&dir_f->sem);
 	}
@@ -620,7 +621,8 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 					D1(printk(KERN_DEBUG "Removing deletion dirent for \"%s\" from dir ino #%u\n",
 						fd->name, dead_f->inocache->ino));
 				}
-				jffs2_mark_node_obsolete(c, fd->raw);
+				if (fd->raw)
+					jffs2_mark_node_obsolete(c, fd->raw);
 				jffs2_free_full_dirent(fd);
 			}
 		}

-- 
dwmw2
