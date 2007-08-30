Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQmlu-0005hE-SV
	for linux-mtd@lists.infradead.org; Thu, 30 Aug 2007 12:21:35 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH] MTD: Initialise s_flags in get_sb_mtd_aux()
To: dwmw2@infradead.org
Date: Thu, 30 Aug 2007 17:21:19 +0100
Message-ID: <20070830162119.28355.70078.stgit@warthog.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: dhowells@redhat.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Howells <dhowells@redhat.com>

Initialise s_flags in get_sb_mtd_aux() from the flags parameter.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 drivers/mtd/mtdsuper.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index aca3319..9b430f2 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -70,6 +70,8 @@ static int get_sb_mtd_aux(struct file_system_type *fs_type, int flags,
 	DEBUG(1, "MTDSB: New superblock for device %d (\"%s\")\n",
 	      mtd->index, mtd->name);
 
+	sb->s_flags = flags;
+
 	ret = fill_super(sb, data, flags & MS_SILENT ? 1 : 0);
 	if (ret < 0) {
 		up_write(&sb->s_umount);
