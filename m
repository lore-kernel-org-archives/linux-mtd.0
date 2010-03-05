Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nnapt-0005AJ-0m
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 16:57:17 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-kernel@vger.kernel.org, trivial@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: drop +x perms on C source files
Date: Fri,  5 Mar 2010 12:00:20 -0500
Message-Id: <1267808420-27330-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 drivers/mtd/chips/cfi_util.c
 mode change 100755 => 100644 drivers/mtd/inftlcore.c

diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
old mode 100755
new mode 100644
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
old mode 100755
new mode 100644
-- 
1.7.0
