Received: from mail-ye0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbCVO-0005vN-RJ
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 15:46:28 +0000
Received: by mail-ye0-f177.google.com with SMTP id q13so642693yen.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2012 07:46:22 -0800 (PST)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [TRIVIAL PATCH] ubi: Remove spurious comment
Date: Wed, 21 Nov 2012 12:46:12 -0300
Message-Id: <1353512772-2649-1-git-send-email-elezegarcia@gmail.com>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This line of comment looks completely bogus.

It was introduced in:
commit d99383b00eba9c6ac3dea462d718b2849012ee03
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Wed May 18 14:47:34 2011 +0300

    UBI: change the interface of a debugging check function

Remove it.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/mtd/ubi/wl.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index da7b449..ae95517 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1,5 +1,4 @@
 /*
- * @ubi: UBI device description object
  * Copyright (c) International Business Machines Corp., 2006
  *
  * This program is free software; you can redistribute it and/or modify
-- 
1.7.8.6
