Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HF7eK-0000ZE-KV
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 06:41:15 -0500
From: Bityutskiy Artem <Artem.Bityutskiy@nokia.com>
To: Kyungmin Park <kmpark@infradead.org>
Date: Thu, 08 Feb 2007 13:38:51 +0200
Message-Id: <20070208113851.9628.6111.sendpatchset@localhost.localdomain>
Subject: [PATCH] [MTD] OneNAND: add Nokia Copyright and a credit
Cc: Bityutskiy Artem <Artem.Bityutskiy@nokia.com>,
	A strange mailing list <linux-mtd@lists.infradead.org>,
	Adrian Hunder <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [MTD] OneNAND: add Nokia Copyright and a credit

As Nokia is paying for our work all we've done for OneNAND belongs
to Nokia - so add Nokia Copyright.

Also add a credit line for Adrian Hunted who did a lot of testing,
bug-fixing and improvement work.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index f690c19..b979edf 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2,11 +2,16 @@
  *  linux/drivers/mtd/onenand/onenand_base.c
  *
  *  Copyright (C) 2005-2007 Samsung Electronics
+ *  Copyright (C) Nokia Corporation, 2007
+ *
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
+ *
+ * 2007, Adrian Hunder <ext-adrian.hunter@nokia.com>:
+ *     auto-placement support, read-while load support, various fixes
  */

 #include <linux/kernel.h>
