Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3uCK-0000Hd-Vk
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 21:09:58 +0000
Received: by mail-ob0-f181.google.com with SMTP id uy5so3306552obc.26
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2014 13:09:35 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: m25p80: assign default read command
Date: Thu, 16 Jan 2014 13:09:07 -0800
Message-Id: <1389906547-31959-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the following commit (in -next):

    commit 8552b439aba7f32063755d23f79ca27b4d0a3115
    drivers: mtd: m25p80: convert "bool" read check into an enum

We converted the boolean 'fast_read' property to become an enum
'flash_read', but at the same time, we changed the conditional path so
that it doesn't choose a default value in some cases (technically, we
choose the correct default simply by virtue of devm_kzalloc(), which
zeroes this out to be a NORMAL read operation, but still...).

Fix this by setting a default for the 'else' clause.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/mtd/devices/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 19632e330d36..d0f6475504f5 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -1204,6 +1204,8 @@ static int m25p_probe(struct spi_device *spi)
 		/* If we were instantiated by DT, use it */
 		if (of_property_read_bool(np, "m25p,fast-read"))
 			flash->flash_read = M25P80_FAST;
+		else
+			flash->flash_read = M25P80_NORMAL;
 	} else {
 		/* If we weren't instantiated by DT, default to fast-read */
 		flash->flash_read = M25P80_FAST;
-- 
1.8.3.2
