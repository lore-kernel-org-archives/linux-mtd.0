Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvU7G-0003T7-Qw
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2013 14:37:25 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 16 Jan 2013 15:36:56 +0100
Message-Id: <1358347016-507-2-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1358347016-507-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1358347016-507-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [PATCH v4 2/2] mtd/uclinux: add a comment about why uclinux_ram_map
 must not be static
Cc: Mike Frysinger <vapier@gentoo.org>, kernel@pengutronix.de,
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
document in the code why this is a bad idea and add an extern declaration to
make sparse happy.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Acked-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Greg Ungerer <gerg@uclinux.org>
---
No changes between v3 and v4.

Changes since v2,
id:1350027693-19528-2-git-send-email-u.kleine-koenig@pengutronix.de:

 - note in the commit log that an extern declaration was added for sparse

Changes since v1:

 - new patch
---
 drivers/mtd/maps/uclinux.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index f56d0aa..c1af83d 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -29,6 +29,12 @@
 #define MAP_NAME "ram"
 #endif
 
+/*
+ * Blackfin uses uclinux_ram_map during startup, so it must not be static.
+ * Provide a dummy declaration to make sparse happy.
+ */
+extern struct map_info uclinux_ram_map;
+
 struct map_info uclinux_ram_map = {
 	.name = MAP_NAME,
 	.size = 0,
-- 
1.7.10.4
