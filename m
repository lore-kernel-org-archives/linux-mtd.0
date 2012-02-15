Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxdM2-0000Lb-Qt
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2012 11:49:01 +0000
Date: Wed, 15 Feb 2012 11:48:34 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] Fix 'Flash device refused suspend due to active operation'
 message
Message-ID: <20120215114834.GG13673@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Russell King <rmk+kernel@arm.linux.org.uk>

While debugging on SA11x0, the following message was observed:

"Flash device refused suspend due to active operation (state 20)"

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
I'm afraid that it's been too long since I looked at this, and I no
longer remember the details behind this to write a proper commit log,
so maybe someone who understands the code can do that.  I seem to
remember dwmw2 said the current code was in error, so here's the
patch.

 drivers/mtd/chips/cfi_cmdset_0001.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e1e122f..709a11f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2483,7 +2483,7 @@ static int cfi_intelext_suspend(struct mtd_info *mtd)
 			   allowed to. Or should we return -EAGAIN, because the upper layers
 			   ought to have already shut down anything which was using the device
 			   anyway? The latter for now. */
-			printk(KERN_NOTICE "Flash device refused suspend due to active operation (state %d)\n", chip->oldstate);
+			printk(KERN_NOTICE "Flash device refused suspend due to active operation (state %d)\n", chip->state);
 			ret = -EAGAIN;
 		case FL_PM_SUSPENDED:
 			break;
