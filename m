Received: from smtp.movial.fi ([62.236.91.34])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1L4n78-000503-VK
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:24 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 11/20] [MTD] Make init_oct5066 function static
Date: Tue, 25 Nov 2008 02:55:02 +0200
Message-Id: <1227574511-23879-12-git-send-email-dmitri.vorobiev@movial.fi>
In-Reply-To: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
References: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function init_oct5066 is needlessly defined global in
drivers/mtd/maps/octagon-5066.c. Make it static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/octagon-5066.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/octagon-5066.c b/drivers/mtd/maps/octagon-5066.c
index 43e04c1..2b2e450 100644
--- a/drivers/mtd/maps/octagon-5066.c
+++ b/drivers/mtd/maps/octagon-5066.c
@@ -184,7 +184,7 @@ void cleanup_oct5066(void)
 	release_region(PAGE_IO, 1);
 }
 
-int __init init_oct5066(void)
+static int __init init_oct5066(void)
 {
 	int i;
 	int ret = 0;
-- 
1.5.3
