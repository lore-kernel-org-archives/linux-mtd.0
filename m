Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgIYF-0000ge-67
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 16:09:55 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: sst25l: kill unused variable
Date: Thu, 29 Dec 2011 18:11:48 +0200
Message-Id: <1325175108-7945-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325175108-7945-1-git-send-email-dedekind1@gmail.com>
References: <1325175108-7945-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Fix the following gcc warning:
drivers/mtd/devices/sst25l.c: In function ‘sst25l_probe’:
drivers/mtd/devices/sst25l.c:381:11: warning: unused variable ‘i’ [-Wunused-variable]

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/sst25l.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index e45f62e..5fc1983 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -378,7 +378,7 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	struct flash_info *flash_info;
 	struct sst25l_flash *flash;
 	struct flash_platform_data *data;
-	int ret, i;
+	int ret;
 
 	flash_info = sst25l_match_device(spi);
 	if (!flash_info)
-- 
1.7.7.3
