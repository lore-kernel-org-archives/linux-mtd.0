Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXaAA-0006rG-Nt
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 15:09:03 +0000
Received: by eaac10 with SMTP id c10so5209124eaa.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2011 07:09:00 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/7] MTD: MAPS: bcm963xx-flash: remove superfluous semicolons
Date: Mon,  5 Dec 2011 16:08:06 +0100
Message-Id: <1323097691-16414-3-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
References: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/maps/bcm963xx-flash.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
index b908d92..58cbaf2 100644
--- a/drivers/mtd/maps/bcm963xx-flash.c
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -93,18 +93,18 @@ static int parse_cfe_partitions(struct mtd_info *master,
 	if (rootfslen > 0) {
 		nrparts++;
 		namelen += 6;
-	};
+	}
 	if (kernellen > 0) {
 		nrparts++;
 		namelen += 6;
-	};
+	}
 
 	/* Ask kernel for more memory */
 	parts = kzalloc(sizeof(*parts) * nrparts + 10 * nrparts, GFP_KERNEL);
 	if (!parts) {
 		vfree(buf);
 		return -ENOMEM;
-	};
+	}
 
 	/* Start building partition list */
 	parts[curpart].name = "CFE";
@@ -117,7 +117,7 @@ static int parse_cfe_partitions(struct mtd_info *master,
 		parts[curpart].offset = kerneladdr;
 		parts[curpart].size = kernellen;
 		curpart++;
-	};
+	}
 
 	if (rootfslen > 0) {
 		parts[curpart].name = "rootfs";
@@ -126,7 +126,7 @@ static int parse_cfe_partitions(struct mtd_info *master,
 		if (sparelen > 0)
 			parts[curpart].size += sparelen;
 		curpart++;
-	};
+	}
 
 	parts[curpart].name = "nvram";
 	parts[curpart].offset = master->size - master->erasesize;
-- 
1.7.2.5
