Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NweeP-0001zB-FM
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 16:50:50 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 2/3] squashfs: gather everything block device specific
	into block.c
References: <87mxxxltk6.fsf@tac.ki.iif.hu>
	<1269955969-26123-3-git-send-email-wferi@niif.hu>
Date: Tue, 30 Mar 2010 18:50:18 +0200
In-Reply-To: <1269955969-26123-3-git-send-email-wferi@niif.hu> (Ferenc
	Wagner's message of "Tue, 30 Mar 2010 15:32:48 +0200")
Message-ID: <8739zhu52t.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip.lougher@gmail.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-embedded@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
I lost this free somehow.  Does squashfs_put_super() need protection
from multiple invocation?  If not, this kfree could be removed from
there, and the condition from both places.

 fs/squashfs/backend.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/squashfs/backend.c b/fs/squashfs/backend.c
index a6136ca..0ae37ab 100644
--- a/fs/squashfs/backend.c
+++ b/fs/squashfs/backend.c
@@ -24,6 +24,10 @@ int squashfs_find_backend(struct file_system_type *fs_type, int flags,
 
 void squashfs_kill_super(struct super_block *sb)
 {
+	if (sb->s_fs_info) {
+		kfree(sb->s_fs_info);
+		sb->s_fs_info = NULL;
+	}
 #ifdef CONFIG_BLOCK
 	if (sb->s_bdev) {
 		kill_block_super(sb);
-- 
1.6.5
