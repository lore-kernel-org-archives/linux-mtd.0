Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NBrmV-0004ss-H3
	for linux-mtd@lists.infradead.org; Sat, 21 Nov 2009 15:21:52 +0000
Received: by ewy3 with SMTP id 3so1036582ewy.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 21 Nov 2009 07:21:46 -0800 (PST)
Message-ID: <4B08088C.8050305@gmail.com>
Date: Sat, 21 Nov 2009 16:34:36 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] JFFS2: min/max confusion?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MAX_SUMMARY_SIZE was meant as a limit, not as a minimum

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
 fs/jffs2/summary.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

unless I am mistaken?

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 6caf1e1..800171d 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -23,7 +23,7 @@
 
 int jffs2_sum_init(struct jffs2_sb_info *c)
 {
-	uint32_t sum_size = max_t(uint32_t, c->sector_size, MAX_SUMMARY_SIZE);
+	uint32_t sum_size = min_t(uint32_t, c->sector_size, MAX_SUMMARY_SIZE);
 
 	c->summary = kzalloc(sizeof(struct jffs2_summary), GFP_KERNEL);
 
