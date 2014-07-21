Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9KV7-0008OO-92
 for linux-mtd@lists.infradead.org; Mon, 21 Jul 2014 20:48:01 +0000
From: Jonas Gorski <jogo@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: physmap: allow setting no_unaligned_access for !OF
Date: Mon, 21 Jul 2014 22:47:27 +0200
Message-Id: <1405975648-25375-3-git-send-email-jogo@openwrt.org>
In-Reply-To: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
References: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 Gregory Fong <gregory.0xf0@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Similar to physmap_of, allow preventing unaligned accesses to physmap
also for non OF enabled platforms.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 drivers/mtd/maps/physmap.c  | 3 +++
 include/linux/mtd/physmap.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index f73cd46..410190c 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -153,6 +153,9 @@ static int physmap_flash_probe(struct platform_device *dev)
 
 		simple_map_init(&info->map[i]);
 
+		if (physmap_data->no_unaligned_access)
+			info->map[i].phys = NO_XIP;
+
 		probe_type = rom_probe_types;
 		if (physmap_data->probe_type == NULL) {
 			for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++)
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index aa6a263..719889d 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -31,6 +31,7 @@ struct physmap_flash_data {
 	char                    *probe_type;
 	struct mtd_partition	*parts;
 	const char * const	*part_probe_types;
+	int			no_unaligned_access;
 };
 
 #endif /* __LINUX_MTD_PHYSMAP__ */
-- 
2.0.0
