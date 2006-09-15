Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GOFTG-0007Xx-El
	for linux-mtd@lists.infradead.org; Fri, 15 Sep 2006 16:19:15 +0100
Date: Fri, 15 Sep 2006 17:19:31 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: Fix bug in fixup_convert_atmel_pri
Message-ID: <20060915171931.2f38bca6@cad-250-152.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The memset() in fixup_convert_atmel_pri is supposed to zero out
everything except the first 5 bytes in *extp, but it ends up zeroing
out something way outside the struct instead. Fix this potentially
dangerous code by casting the pointer to char * before doing
arithmetic.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6.18-rc6-mm2/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.6.18-rc6-mm2.orig/drivers/mtd/chips/cfi_cmdset_0002.c	2006-09-15 14:39:22.000000000 +0200
+++ linux-2.6.18-rc6-mm2/drivers/mtd/chips/cfi_cmdset_0002.c	2006-09-15 14:39:40.000000000 +0200
@@ -175,7 +175,7 @@ static void fixup_convert_atmel_pri(stru
 	struct cfi_pri_atmel atmel_pri;
 
 	memcpy(&atmel_pri, extp, sizeof(atmel_pri));
-	memset(extp + 5, 0, sizeof(*extp) - 5);
+	memset((char *)extp + 5, 0, sizeof(*extp) - 5);
 
 	if (atmel_pri.Features & 0x02)
 		extp->EraseSuspend = 2;
