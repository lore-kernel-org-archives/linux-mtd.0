Received: from nwd2mail10.analog.com ([137.71.25.55])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JpFE5-0005XM-MX
	for linux-mtd@lists.infradead.org; Fri, 25 Apr 2008 04:07:57 +0000
From: Bryan Wu <cooloney@kernel.org>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] [MTD] m25p80: Add Support for ATMEL AT25DF641 64-Megabit
	SPI Flash
Date: Fri, 25 Apr 2008 12:07:33 +0800
Message-Id: <1209096453-21610-4-git-send-email-cooloney@kernel.org>
In-Reply-To: <1209096453-21610-1-git-send-email-cooloney@kernel.org>
References: <1209096453-21610-1-git-send-email-cooloney@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michael Hennerich <michael.hennerich@analog.com>

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 14dd88d..e6f9cc9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -446,6 +446,7 @@ static struct flash_info __devinitdata m25p_data [] = {
 	{ "at25fs040",  0x1f6604, 64 * 1024, 8, SECT_4K, },
 
 	{ "at25df041a", 0x1f4401, 64 * 1024, 8, SECT_4K, },
+	{ "at25df641",  0x1f4800, 64 * 1024, 128, SECT_4K, },
 
 	{ "at26f004",   0x1f0400, 64 * 1024, 8, SECT_4K, },
 	{ "at26df081a", 0x1f4501, 64 * 1024, 16, SECT_4K, },
-- 
1.5.5
