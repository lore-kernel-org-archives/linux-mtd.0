Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMEAX-0000vR-Jl
	for linux-mtd@lists.infradead.org; Sat, 27 Nov 2010 06:21:58 +0000
Received: by mail-yx0-f177.google.com with SMTP id 34so1339163yxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 22:21:57 -0800 (PST)
From: "Justin P. Mattock" <justinmattock@gmail.com>
To: trivial@kernel.org
Subject: [RFC 4/9]drivers:ide Change the copyright info.
Message-Id: <1290838879-11038-5-git-send-email-justinmattock@gmail.com>
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
Date: Sat, 27 Nov 2010 06:21:59 -0000

Change the copyright info from Sun Microsystems to Oracle since Oracle now owns them.

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 drivers/ide/hpt366.c      |    2 +-
 drivers/ide/serverworks.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ide/hpt366.c b/drivers/ide/hpt366.c
index 58c51cd..8e31cfa 100644
--- a/drivers/ide/hpt366.c
+++ b/drivers/ide/hpt366.c
@@ -1,6 +1,6 @@
 /*
  * Copyright (C) 1999-2003		Andre Hedrick <andre@linux-ide.org>
- * Portions Copyright (C) 2001	        Sun Microsystems, Inc.
+ * Portions Copyright (C) 2001	        Oracle and/or its affiliates. 
  * Portions Copyright (C) 2003		Red Hat Inc
  * Portions Copyright (C) 2007		Bartlomiej Zolnierkiewicz
  * Portions Copyright (C) 2005-2009	MontaVista Software, Inc.
diff --git a/drivers/ide/serverworks.c b/drivers/ide/serverworks.c
index 35fb8da..267c87e 100644
--- a/drivers/ide/serverworks.c
+++ b/drivers/ide/serverworks.c
@@ -3,7 +3,7 @@
  * Copyright (C) 1998-2000 Andrzej Krzysztofowicz
  * Copyright (C) 1998-2000 Andre Hedrick <andre@linux-ide.org>
  * Copyright (C) 2007-2010 Bartlomiej Zolnierkiewicz
- * Portions copyright (c) 2001 Sun Microsystems
+ * Portions copyright (c) 2001 Oracle and/or its affiliates. 
  *
  *
  * RCC/ServerWorks IDE driver for Linux
-- 
1.7.1
