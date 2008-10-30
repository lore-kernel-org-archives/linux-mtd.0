Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KvdgP-0003b7-8w
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 19:59:53 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: David Woodhouse <David.Woodhouse@intel.com>,
	Chen Gong <g.chen@freescale.com>
Subject: [PATCH] m25p80: fix detection of m25p16 flashes
Date: Thu, 30 Oct 2008 15:59:46 -0400
Message-Id: <1225396786-23679-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1225286467-17955-1-git-send-email-vapier@gentoo.org>
References: <1225286467-17955-1-git-send-email-vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Hennerich <Michael.Hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit d0e8c47c58575b9131e786edb488fd029eba443e added support for extended ids
but seems to break on flashes which don't have an extended id defined.  If the
table does not have an extid defined, then we should ignore it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Michael Hennerich <Michael.Hennerich@analog.com>
---
 drivers/mtd/devices/m25p80.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index a298fed..6188fd4 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -575,7 +575,7 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 			tmp < ARRAY_SIZE(m25p_data);
 			tmp++, info++) {
 		if (info->jedec_id == jedec) {
-			if (ext_jedec != 0 && info->ext_id != ext_jedec)
+			if (info->ext_id != 0 && info->ext_id != ext_jedec)
 				continue;
 			return info;
 		}
-- 
1.6.0.2
