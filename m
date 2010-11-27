Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMEAc-0000z3-1y
	for linux-mtd@lists.infradead.org; Sat, 27 Nov 2010 06:22:02 +0000
Received: by gwj20 with SMTP id 20so1340953gwj.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 22:22:00 -0800 (PST)
From: "Justin P. Mattock" <justinmattock@gmail.com>
To: trivial@kernel.org
Subject: [RFC 5/9]drivers:mtd:maps Change the copyright info.
Message-Id: <1290838879-11038-6-git-send-email-justinmattock@gmail.com>
In-Reply-To: <1290838879-11038-1-git-send-email-justinmattock@gmail.com>
References: <1290838879-11038-1-git-send-email-justinmattock@gmail.com>
Cc: linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	"Justin P. Mattock" <justinmattock@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sat, 27 Nov 2010 06:22:02 -0000

Change the copyright info from Sun Microsystems to Oracle since Oracle now owns them.

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 drivers/mtd/maps/scb2_flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/scb2_flash.c b/drivers/mtd/maps/scb2_flash.c
index 7e329f0..9841bb2 100644
--- a/drivers/mtd/maps/scb2_flash.c
+++ b/drivers/mtd/maps/scb2_flash.c
@@ -1,6 +1,6 @@
 /*
  * MTD map driver for BIOS Flash on Intel SCB2 boards
- * Copyright (C) 2002 Sun Microsystems, Inc.
+ * Copyright (C) 2002 Oracle and/or its affiliates. 
  * Tim Hockin <thockin@sun.com>
  *
  * A few notes on this MTD map:
-- 
1.7.1
