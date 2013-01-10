Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtL2s-0003Xr-TD
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2013 16:31:59 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 10 Jan 2013 17:31:38 +0100
Message-Id: <1357835498-23904-2-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [PATCH 2/2 v3] mtd/uclinux: add a comment about why uclinux_ram_map
 must not be static
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
document in the code why this is a bad idea and add an extern declaration to
make sparse happy.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Acked-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Greg Ungerer <gerg@uclinux.org>
---
Changes since v2, sent with
Message-Id: 1350027693-19528-2-git-send-email-u.kleine-koenig@pengutronix.de:

- note in the commit log that an extern declaration was added for sparse

 drivers/mtd/maps/uclinux.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index b3a9c54..fe1c83c 100644
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
