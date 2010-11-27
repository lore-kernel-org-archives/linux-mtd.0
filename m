Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMEAh-0000vN-6f
	for linux-mtd@lists.infradead.org; Sat, 27 Nov 2010 06:22:07 +0000
Received: by mail-yw0-f49.google.com with SMTP id 7so1339547ywf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 22:22:07 -0800 (PST)
From: "Justin P. Mattock" <justinmattock@gmail.com>
To: trivial@kernel.org
Subject: [RFC 7/9]drivers:ata Change the copyright info.
Message-Id: <1290838879-11038-8-git-send-email-justinmattock@gmail.com>
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
Date: Sat, 27 Nov 2010 06:22:08 -0000

Change the copyright info from Sun Microsystems to Oracle since Oracle now owns them.

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 drivers/ata/pata_hpt366.c      |    2 +-
 drivers/ata/pata_hpt37x.c      |    2 +-
 drivers/ata/pata_hpt3x2n.c     |    2 +-
 drivers/ata/pata_serverworks.c |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_hpt366.c b/drivers/ata/pata_hpt366.c
index 7688868..bd52749 100644
--- a/drivers/ata/pata_hpt366.c
+++ b/drivers/ata/pata_hpt366.c
@@ -6,7 +6,7 @@
  * linux/drivers/ide/pci/hpt366.c		Version 0.36	April 25, 2003
  *
  * Copyright (C) 1999-2003		Andre Hedrick <andre@linux-ide.org>
- * Portions Copyright (C) 2001	        Sun Microsystems, Inc.
+ * Portions Copyright (C) 2001	        Oracle and/or its affiliates. 
  * Portions Copyright (C) 2003		Red Hat Inc
  *
  *
diff --git a/drivers/ata/pata_hpt37x.c b/drivers/ata/pata_hpt37x.c
index 9ae4c08..442575e 100644
--- a/drivers/ata/pata_hpt37x.c
+++ b/drivers/ata/pata_hpt37x.c
@@ -6,7 +6,7 @@
  * linux/drivers/ide/pci/hpt366.c		Version 0.36	April 25, 2003
  *
  * Copyright (C) 1999-2003		Andre Hedrick <andre@linux-ide.org>
- * Portions Copyright (C) 2001	        Sun Microsystems, Inc.
+ * Portions Copyright (C) 2001	        Oracle and/or its affiliates. 
  * Portions Copyright (C) 2003		Red Hat Inc
  * Portions Copyright (C) 2005-2009	MontaVista Software, Inc.
  *
diff --git a/drivers/ata/pata_hpt3x2n.c b/drivers/ata/pata_hpt3x2n.c
index 32f3463..d0780c8 100644
--- a/drivers/ata/pata_hpt3x2n.c
+++ b/drivers/ata/pata_hpt3x2n.c
@@ -6,7 +6,7 @@
  * linux/drivers/ide/pci/hpt366.c		Version 0.36	April 25, 2003
  *
  * Copyright (C) 1999-2003		Andre Hedrick <andre@linux-ide.org>
- * Portions Copyright (C) 2001	        Sun Microsystems, Inc.
+ * Portions Copyright (C) 2001	        Oracle and/or its affiliates. 
  * Portions Copyright (C) 2003		Red Hat Inc
  * Portions Copyright (C) 2005-2009	MontaVista Software, Inc.
  *
diff --git a/drivers/ata/pata_serverworks.c b/drivers/ata/pata_serverworks.c
index 86dd714..a8dd665 100644
--- a/drivers/ata/pata_serverworks.c
+++ b/drivers/ata/pata_serverworks.c
@@ -10,7 +10,7 @@
  * Copyright (C) 1998-2000 Michel Aubry
  * Copyright (C) 1998-2000 Andrzej Krzysztofowicz
  * Copyright (C) 1998-2000 Andre Hedrick <andre@linux-ide.org>
- * Portions copyright (c) 2001 Sun Microsystems
+ * Portions copyright (c) 2001 Oracle and/or its affiliates. 
  *
  *
  * RCC/ServerWorks IDE driver for Linux
-- 
1.7.1
