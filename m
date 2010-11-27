Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMEAe-0000vR-1a
	for linux-mtd@lists.infradead.org; Sat, 27 Nov 2010 06:22:04 +0000
Received: by mail-yx0-f177.google.com with SMTP id 34so1339163yxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 22:22:03 -0800 (PST)
From: "Justin P. Mattock" <justinmattock@gmail.com>
To: trivial@kernel.org
Subject: [RFC 6/9]drivers:char:nvram.c Change the copyright info.
Message-Id: <1290838879-11038-7-git-send-email-justinmattock@gmail.com>
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
Date: Sat, 27 Nov 2010 06:22:05 -0000

Change the copyright info from Sun Microsystems to Oracle since Oracle now owns them.

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 drivers/char/nvram.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
index 166f1e7..33e8faa 100644
--- a/drivers/char/nvram.c
+++ b/drivers/char/nvram.c
@@ -3,7 +3,7 @@
  *
  * Copyright (C) 1997 Roman Hodek <Roman.Hodek@informatik.uni-erlangen.de>
  * idea by and with help from Richard Jelinek <rj@suse.de>
- * Portions copyright (c) 2001,2002 Sun Microsystems (thockin@sun.com)
+ * Portions copyright (c) 2001,2002 Oracle and/or its affiliates. (thockin@sun.com)
  *
  * This driver allows you to access the contents of the non-volatile memory in
  * the mc146818rtc.h real-time clock. This chip is built into all PCs and into
-- 
1.7.1
