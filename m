Received: from www.tglx.de ([62.245.132.106])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PgI99-0000kD-A8
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2011 14:39:28 +0000
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: fix unaligned leb_start value
From: John Ogness <john.ogness@linutronix.de>
Date: Fri, 21 Jan 2011 15:39:02 +0100
Message-ID: <87zkqu1fuh.fsf@vostro.fn.ogness.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Ogness <john.ogness@linutronix.de>

The wrong header size was used in calculating the data offset. The
data offset should be VID header offset + VID header size (aligned to
the minimum I/O unit).

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
This patch is against linux-next-20110121.

Since the value is later aligned, this patch does not fix any real
world problem. But it should be fixed nonetheless.

 drivers/mtd/ubi/build.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index f49e49d..a4f47dd 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -737,7 +737,7 @@ static int io_init(struct ubi_device *ubi)
 	}
 
 	/* Similar for the data offset */
-	ubi->leb_start = ubi->vid_hdr_offset + UBI_EC_HDR_SIZE;
+	ubi->leb_start = ubi->vid_hdr_offset + UBI_VID_HDR_SIZE;
 	ubi->leb_start = ALIGN(ubi->leb_start, ubi->min_io_size);
 
 	dbg_msg("vid_hdr_offset   %d", ubi->vid_hdr_offset);
-- 
1.5.6.5
