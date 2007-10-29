Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1ImeFH-0001px-JO
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 19:42:17 -0400
Subject: RE: getdents64 problem in 2.6.23
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1193679050.26497.43.camel@gentoo-jocke.transmode.se>
References: <005201c819be$649f47e0$5267a8c0@Jocke>
	<1193617605.2915.84.camel@shinybook.infradead.org>
	<1193662731.26497.4.camel@gentoo-jocke.transmode.se>
	<1193679050.26497.43.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 30 Oct 2007 00:41:34 +0100
Message-Id: <1193701294.26497.48.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?=27J=F6rn?= Engel' <joern@logfs.org>,
	'Jamie Lokier' <jamie@shareable.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-10-29 at 18:30 +0100, Joakim Tjernlund wrote:
> On Mon, 2007-10-29 at 13:58 +0100, Joakim Tjernlund wrote:
> > On Sun, 2007-10-28 at 20:26 -0400, David Woodhouse wrote:
> > > On Mon, 2007-10-29 at 00:58 +0100, Joakim Tjernlund wrote:
> > > > David, before rewriting getdents et. all may I ask you to apply the
> > > > patch I sent today? Then we will have something that works and go
> > > > from there.
> > > 
> > > I'm not happy about having fd->raw still pointing to nodes which may no
> > > longer exist. Can't we set it to NULL (and cope with potential fallout)?
> > 
> > Thats a diffrent story. Now I fixed the bug so it behaves like the 
> > !mark_node_obsolete case. Walking through all ->raw references is
> > something I will save for a rainy dag, I need to fix a few other bugs in
> > our system ATM.
> 
> ehh, my patch may be somewhat wrong, need to reflect a bit on that. I
> might even get to the ->raw = NULL thing :)

ok, this should do it I hope. I also have ->raw = NULL in progess, but I
would like to know if this patch is accpetable to solve this problem.

 Jocke

>From 6fbc572bf34c7834a8a2d6b8a5f22b4f55d3bbea Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Sun, 28 Oct 2007 13:31:58 +0100
Subject: [PATCH] [JFFS2] Fix getdents problem on large directories.

Another fallout from commit a491486a2087ac3dfc00efb4f838c8d684afaf54
rm -rf on a large directory needs to call getdents several times.
The second call would usally return empty, telling the user that
there are no more files to unlink, rmdir then fails since the
directory isn't empty.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/write.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index 2f56954..bee27a9 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -590,10 +590,8 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 
 				D1(printk(KERN_DEBUG "Marking old dirent node (ino #%u) @%08x obsolete\n",
 					  this->ino, ref_offset(this->raw)));
-
-				*prev = this->next;
-				jffs2_mark_node_obsolete(c, (this->raw));
-				jffs2_free_full_dirent(this);
+				jffs2_mark_node_obsolete(c, this->raw);
+				this->ino = 0;
 				break;
 			}
 			prev = &((*prev)->next);
@@ -622,7 +620,6 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 					D1(printk(KERN_DEBUG "Removing deletion dirent for \"%s\" from dir ino #%u\n",
 						fd->name, dead_f->inocache->ino));
 				}
-				jffs2_mark_node_obsolete(c, fd->raw);
 				jffs2_free_full_dirent(fd);
 			}
 		}
-- 
1.5.3.4
