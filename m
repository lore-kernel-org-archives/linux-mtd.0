From: David Howells <dhowells@redhat.com>
Subject: [PATCH 33/59] CRED: Wrap task credential accesses in the JFFS2
	filesystem
To: linux-kernel@vger.kernel.org
Date: Wed, 27 Aug 2008 14:48:32 +0100
Message-ID: <20080827134832.19980.83894.stgit@warthog.procyon.org.uk>
In-Reply-To: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk>
References: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Howells <dhowells@redhat.com>, Serge Hallyn <serue@us.ibm.com>,
	linux-security-module@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wrap access to task credentials so that they can be separated more easily from
the task_struct during the introduction of COW creds.

Change most current->(|e|s|fs)[ug]id to current_(|e|s|fs)[ug]id().

Change some task->e?[ug]id to task_e?[ug]id().  In some places it makes more
sense to use RCU directly rather than a convenient wrapper; these will be
addressed by later patches.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jmorris@namei.org>
Acked-by: Serge Hallyn <serue@us.ibm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---

 fs/jffs2/fs.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)


diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 40e933e..a598de9 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -442,14 +442,14 @@ struct inode *jffs2_new_inode (struct inode *dir_i, int mode, struct jffs2_raw_i
 
 	memset(ri, 0, sizeof(*ri));
 	/* Set OS-specific defaults for new inodes */
-	ri->uid = cpu_to_je16(current->fsuid);
+	ri->uid = cpu_to_je16(current_fsuid());
 
 	if (dir_i->i_mode & S_ISGID) {
 		ri->gid = cpu_to_je16(dir_i->i_gid);
 		if (S_ISDIR(mode))
 			mode |= S_ISGID;
 	} else {
-		ri->gid = cpu_to_je16(current->fsgid);
+		ri->gid = cpu_to_je16(current_fsgid());
 	}
 
 	/* POSIX ACLs have to be processed now, at least partly.
