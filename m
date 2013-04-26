Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVepk-0005wa-HL
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 09:20:49 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V4 1/9] mtd: add more comment for ecc_strength/ecc_size
Date: Fri, 26 Apr 2013 17:08:49 +0800
Message-ID: <1366967337-5534-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1366967337-5534-1-git-send-email-b32955@freescale.com>
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add more commit for ecc_strength and ecc_size fields.
We can treat the comment as the initial semantics for the two fields.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5458021..a0c486b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -435,8 +435,11 @@ struct nand_buffers {
  *			not bad when badblockbits == 7
  * @cellinfo:		[INTERN] MLC/multichip data from chip ident
  * @ecc_strength:	[INTERN] ECC correctability from the datasheet.
+ *			The minimum number of bits correctability, if known;
+ *			if unknown, set to 0.
  * @ecc_size:		[INTERN] ECC size required by the @ecc_strength,
- *                      also from the datasheet.
+ *                      also from the datasheet. It is the recommended ECC step
+ *			size, if known; if unknown, set to 0.
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
-- 
1.7.1
