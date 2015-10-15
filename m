Received: from mx1.kapsi.fi ([2001:1bc8:1004::1:25] helo=mail.kapsi.fi)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmcFz-0008Eh-6V
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 06:43:19 +0000
From: Mikko Rapeli <mikko.rapeli@iki.fi>
To: linux-kernel@vger.kernel.org
Cc: mikko.rapeli@iki.fi, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-api@vger.kernel.org
Subject: [PATCH v4 70/79] include/uapi/mtd/mtd-user.h: remove stdint.h include
Date: Thu, 15 Oct 2015 07:56:48 +0200
Message-Id: <1444888618-4506-71-git-send-email-mikko.rapeli@iki.fi>
In-Reply-To: <1444888618-4506-1-git-send-email-mikko.rapeli@iki.fi>
References: <1444888618-4506-1-git-send-email-mikko.rapeli@iki.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kernel headers should use linux/types.h instead.

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 include/uapi/mtd/mtd-user.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/uapi/mtd/mtd-user.h b/include/uapi/mtd/mtd-user.h
index 83327c8..e71d555 100644
--- a/include/uapi/mtd/mtd-user.h
+++ b/include/uapi/mtd/mtd-user.h
@@ -20,8 +20,6 @@
 #ifndef __MTD_USER_H__
 #define __MTD_USER_H__
 
-#include <stdint.h>
-
 /* This file is blessed for inclusion by userspace */
 #include <mtd/mtd-abi.h>
 
-- 
2.5.0
