Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3UP4-0006yZ-4q
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 16:00:35 +0000
Received: by wibhn17 with SMTP id hn17so2909171wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 09:00:31 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v3 2/6] UBI: change CONFIG_MTD_UBI_BEB_LIMIT range
Date: Mon, 20 Aug 2012 18:00:12 +0200
Message-Id: <1345478416-23900-3-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's no reason to limit MTD_UBI_BEB_LIMIT to 256 (25%), let's set it
to 768 (75%) this should be enough.
And the lower bound can be 0, no reason to forbid it (even if it will be
reserved for test purpose only I guess).

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 9ee92d6..dcbaae3 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -30,7 +30,7 @@ config MTD_UBI_WL_THRESHOLD
 config MTD_UBI_BEB_LIMIT
 	int "Maximum expected bad eraseblock count per 1024 eraseblocks"
 	default 20
-	range 1 256
+	range 0 768
 	help
 	  This option specifies the maximum bad physical eraseblocks UBI
 	  expects on the MTD device (per 1024 eraseblocks). If the underlying
-- 
1.7.2.5
