Received: from fire.osdl.org ([65.172.181.4] helo=smtp.osdl.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D1ZC6-0006cv-7T
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 19:06:59 -0500
Date: Wed, 16 Feb 2005 16:06:45 -0800
From: "Randy.Dunlap" <rddunlap@osdl.org>
To: linux-mtd@lists.infradead.org
Message-Id: <20050216160645.3438421f.rddunlap@osdl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org
Subject: [PATCH] MTD: use unsigned 1-bit fields
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

since a 1-bit field cannot hold a truth value and a sign bit.

Fix (22) bitfield/boolean sparse warnings:
include/linux/mtd/flashchip.h:65:23: warning: dubious one-bit signed bitfield
include/linux/mtd/flashchip.h:66:23: warning: dubious one-bit signed bitfield

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat:=
 include/linux/mtd/flashchip.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -Naurp ./include/linux/mtd/flashchip.h~mtd_flashchip_bool ./include/linux/mtd/flashchip.h
--- ./include/linux/mtd/flashchip.h~mtd_flashchip_bool	2005-02-15 13:48:46.633263712 -0800
+++ ./include/linux/mtd/flashchip.h	2005-02-15 20:25:20.924981544 -0800
@@ -62,8 +62,8 @@ struct flchip {
 	flstate_t state;
 	flstate_t oldstate;
 
-	int write_suspended:1;
-	int erase_suspended:1;
+	unsigned int write_suspended:1;
+	unsigned int erase_suspended:1;
 	unsigned long in_progress_block_addr;
 
 	spinlock_t *mutex;


---
