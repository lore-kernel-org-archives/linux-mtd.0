Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NVgwt-0007W4-WE
	for linux-mtd@lists.infradead.org; Fri, 15 Jan 2010 07:50:32 +0000
From: Barry Song <21cnbao@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 2/2] mtd-physmap: add support users can assign the probe type
	in board files
Date: Fri, 15 Jan 2010 15:50:14 +0800
Message-ID: <1263541814-6642-2-git-send-email-21cnbao@gmail.com>
In-Reply-To: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
References: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>, Barry Song <21cnbao@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are three reasons to add this support:
1. users probably know the interface type of their flashs, then probe
can be faster if they give the right type in platform data since wrong
types will not be detected.
2. sometimes, detecting can cause destory to system. For example, for
kernel XIP, detecting can cause NOR enter a mode instructions can not
be fetched right, which will make kernel crash.
3. For a new probe which is not listed in the rom_probe_types, if users
assign it in board files, physmap can still probe it.

Signed-off-by: Barry Song <21cnbao@gmail.com>
Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
---
 drivers/mtd/maps/physmap.c  |    8 ++++++--
 include/linux/mtd/physmap.h |    1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index d9603f7..3b89099 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -136,8 +136,12 @@ static int physmap_flash_probe(struct platform_device *dev)
 		simple_map_init(&info->map[i]);
 
 		probe_type = rom_probe_types;
-		for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++)
-			info->mtd[i] = do_map_probe(*probe_type, &info->map[i]);
+		if (physmap_data->probe_type == NULL) {
+			for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++)
+				info->mtd[i] = do_map_probe(*probe_type, &info->map[i]);
+		} else
+			info->mtd[i] = do_map_probe(physmap_data->probe_type, &info->map[i]);
+
 		if (info->mtd[i] == NULL) {
 			dev_err(&dev->dev, "map_probe failed\n");
 			err = -ENXIO;
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index 76f7cab..bcfd9f7 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -25,6 +25,7 @@ struct physmap_flash_data {
 	void			(*set_vpp)(struct map_info *, int);
 	unsigned int		nr_parts;
 	unsigned int		pfow_base;
+	char                    *probe_type;
 	struct mtd_partition	*parts;
 };
 
-- 
1.5.6.3
