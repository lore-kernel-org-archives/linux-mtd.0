Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR5WP-0000gy-SW
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 19:54:31 +0000
Date: Fri, 21 Mar 2014 15:54:03 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH] UBI: fix rb_tree node comparison in add_map
Message-ID: <20140321195403.GA32529@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The comparisons used in add_vol() shouldn't be identical.  Pretty sure
the following is correct but it is completely untested.

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/mtd/ubi/fastmap.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

NOTE: I stumbled upon this code while implementing some rb_tree code
      (and looking for some existing rb_tree code as a reference).

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index ead8613..60c7a20 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -125,9 +125,9 @@ static struct ubi_ainf_volume *add_vol(struct ubi_attach_info *ai, int vol_id,
 		parent = *p;
 		av = rb_entry(parent, struct ubi_ainf_volume, rb);
 
-		if (vol_id > av->vol_id)
+		if (vol_id < av->vol_id)
 			p = &(*p)->rb_left;
-		else if (vol_id > av->vol_id)
+		else
 			p = &(*p)->rb_right;
 	}
 
