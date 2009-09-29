Received: from mail.perches.com ([173.55.12.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsUq6-000565-PX
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 05:01:31 +0000
From: Joe Perches <joe@perches.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] fs/ubifs: Use %pUX to print UUIDs
Date: Mon, 28 Sep 2009 22:01:10 -0700
Message-Id: <5cf449befe715a79ad0bfaf41ad74f65892134f5.1254193019.git.joe@perches.com>
In-Reply-To: <cover.1254193019.git.joe@perches.com>
References: <cover.1254193019.git.joe@perches.com>
Cc: Steven Whitehouse <swhiteho@redhat.com>,
	Artem Bityutskiy <dedekind@infradead.org>,
	Matt Mackall <mpm@selenic.com>, Alex Elder <aelder@sgi.com>,
	xfs-masters@oss.sgi.com, Jeff Garzik <jgarzik@redhat.com>,
	Neil Brown <neilb@suse.de>, Laurent Pinchart <laurent.pinchart@skynet.be>,
	linux-mtd@lists.infradead.org, Huang Ying <ying.huang@intel.com>,
	Ingo Molnar <mingo@elte.hu>, Adrian Hunter <adrian.hunter@nokia.com>,
	Christoph Hellwig <hch@lst.de>,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	Harvey Harrison <harvey.harrison@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/ubifs/debug.c |    9 ++-------
 fs/ubifs/super.c |    7 +------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index dbc093a..b16779e 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -350,13 +350,8 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 		       le32_to_cpu(sup->fmt_version));
 		printk(KERN_DEBUG "\ttime_gran      %u\n",
 		       le32_to_cpu(sup->time_gran));
-		printk(KERN_DEBUG "\tUUID           %02X%02X%02X%02X-%02X%02X"
-		       "-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X\n",
-		       sup->uuid[0], sup->uuid[1], sup->uuid[2], sup->uuid[3],
-		       sup->uuid[4], sup->uuid[5], sup->uuid[6], sup->uuid[7],
-		       sup->uuid[8], sup->uuid[9], sup->uuid[10], sup->uuid[11],
-		       sup->uuid[12], sup->uuid[13], sup->uuid[14],
-		       sup->uuid[15]);
+		printk(KERN_DEBUG "\tUUID           %pUX\n",
+		       sup->uuid);
 		break;
 	}
 	case UBIFS_MST_NODE:
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 333e181..7d59ab7 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1393,12 +1393,7 @@ static int mount_ubifs(struct ubifs_info *c)
 		c->leb_size, c->leb_size >> 10);
 	dbg_msg("data journal heads:  %d",
 		c->jhead_cnt - NONDATA_JHEADS_CNT);
-	dbg_msg("UUID:                %02X%02X%02X%02X-%02X%02X"
-	       "-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X",
-	       c->uuid[0], c->uuid[1], c->uuid[2], c->uuid[3],
-	       c->uuid[4], c->uuid[5], c->uuid[6], c->uuid[7],
-	       c->uuid[8], c->uuid[9], c->uuid[10], c->uuid[11],
-	       c->uuid[12], c->uuid[13], c->uuid[14], c->uuid[15]);
+	dbg_msg("UUID:                %pUX", c->uuid);
 	dbg_msg("big_lpt              %d", c->big_lpt);
 	dbg_msg("log LEBs:            %d (%d - %d)",
 		c->log_lebs, UBIFS_LOG_LNUM, c->log_last);
-- 
1.6.3.1.10.g659a0.dirty
