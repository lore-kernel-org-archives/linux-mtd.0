Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KvAz4-0001Yt-5y
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 13:21:14 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: David Woodhouse <David.Woodhouse@intel.com>,
	Chen Gong <g.chen@freescale.com>
Subject: [PATCH] m25p80: fix detection of SPI parts
Date: Wed, 29 Oct 2008 09:21:07 -0400
Message-Id: <1225286467-17955-1-git-send-email-vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit d0e8c47c58575b9131e786edb488fd029eba443e added support for extended
ids but in the process managed to break detection of all flashes.  The ext
jedec id check was inserted into an if statement that lacked braces, and
it did not add the required braces.  As such, the detection routine always
returns the first entry in the SPI flash list.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/devices/m25p80.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 76a7675..a298fed 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -574,10 +574,11 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 	for (tmp = 0, info = m25p_data;
 			tmp < ARRAY_SIZE(m25p_data);
 			tmp++, info++) {
-		if (info->jedec_id == jedec)
+		if (info->jedec_id == jedec) {
 			if (ext_jedec != 0 && info->ext_id != ext_jedec)
 				continue;
 			return info;
+		}
 	}
 	dev_err(&spi->dev, "unrecognized JEDEC id %06x\n", jedec);
 	return NULL;
-- 
1.6.0.2
