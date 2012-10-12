Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMZsM-00047j-BK
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 07:41:42 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd/uclinux: add a comment about why uclinux_ram_map must
 not be static
Date: Fri, 12 Oct 2012 09:41:33 +0200
Message-Id: <1350027693-19528-2-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Frysinger <vapier.adi@gmail.com>, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was (at least) the second person trying to fix a warning by sparse, so
document in the code why this is a bad idea.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

it's a bit exaggerated to claim that sparse is happy now, but at least
we have one warning less :-)

Uwe
 drivers/mtd/maps/uclinux.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index f5e8e9a..18cf6d0 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -23,6 +23,12 @@
 
 /****************************************************************************/
 
+/*
+ * Blackfin uses uclinux_ram_map during startup, so it must not be static.
+ * Provide a dummy declaration to make sparse happy.
+ */
+extern struct map_info uclinux_ram_map;
+
 struct map_info uclinux_ram_map = {
 	.size = 0,
 };
-- 
1.7.10.4
