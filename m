Received: from mx1.redhat.com ([66.187.233.31])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KGFka-0000ve-Qy
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 16:09:09 +0000
From: David Howells <dhowells@redhat.com>
Subject: [PATCH] Fix const assignment in the MTD command line partitioning
	driver
To: dwmw2@infradead.org, akpm@linux-foundation.org
Date: Tue, 08 Jul 2008 17:09:03 +0100
Message-ID: <20080708160902.8200.95442.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: dhowells@redhat.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix const to non-const pointer assignment in the MTD command line partitioning
driver.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 drivers/mtd/cmdlinepart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 68782ab..71bc07f 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -306,7 +306,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 	unsigned long offset;
 	int i;
 	struct cmdline_mtd_partition *part;
-	char *mtd_id = master->name;
+	const char *mtd_id = master->name;
 
 	/* parse command line */
 	if (!cmdline_parsed)
