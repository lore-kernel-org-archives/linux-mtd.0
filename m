Received: from sandeen.net ([63.231.237.45] helo=mail.sandeen.net)
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RY45V-0006MZ-JB
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 23:06:14 +0000
Message-ID: <4EDE9FDE.3040109@sandeen.net>
Date: Tue, 06 Dec 2011 17:06:06 -0600
From: Eric Sandeen <sandeen@sandeen.net>
MIME-Version: 1.0
To: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Subject: [PATCH 4/6] jffs2: fix up error handling for insert_inode_locked
References: <4EDE9D54.1030506@redhat.com>
In-Reply-To: <4EDE9D54.1030506@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

after 250df6ed274d767da844a5d9f05720b804240197
(fs: protect inode->i_state with inode->i_lock), insert_inode_locked()
no longer returns the inode with I_NEW set on failure.  However,
the error handler still calls unlock_new_inode() on failure,
which does a WARN_ON if I_NEW is not set, so any failure spews
a lot of warnings.

We can just drop the unlock_new_inode() if insert_inode_locked()
fails here.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 4b8afe3..2e01238 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -466,7 +466,6 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
 
 	if (insert_inode_locked(inode) < 0) {
 		make_bad_inode(inode);
-		unlock_new_inode(inode);
 		iput(inode);
 		return ERR_PTR(-EINVAL);
 	}
