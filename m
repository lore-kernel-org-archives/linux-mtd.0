Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6BY2-0000Eh-P1
 for linux-mtd@lists.infradead.org; Sun, 22 Oct 2017 08:23:57 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mtd: cfi_cmdset_0001: Fix a potential double mutex_lock
Date: Sun, 22 Oct 2017 10:23:01 +0200
Message-Id: <20171022082301.26220-1-christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If 'chip->state == FL_SYNCING', we will 'goto retry' with the mutex
'&shared->lock' already taken.
In such a case, the 'mutex_lock' at line 927 can never succeed.

In order to avoid a deadlock, move the 'mutex_lock(&shared->lock)' at the
very end of the block.

This has been spotted with the following coccinelle script:

@find@
expression x, t;
@@

	mutex_lock(x);
	... when != mutex_unlock(x)
	mutex_lock(t);

@@
expression find.t;
expression find.x;
@@

*	mutex_lock(t);
	... when != mutex_unlock(t)
*	mutex_lock(x);


Fixes: 3afe7eb37f4d ("[MTD] [NOR] fix cfi_cmdset_0001 FL_SYNCING race (take 2)")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Review carefuly, untested.
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 5e1b68cbcd0a..bddf407a366d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -952,7 +952,6 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 				mutex_unlock(&contender->mutex);
 				return ret;
 			}
-			mutex_lock(&shared->lock);
 
 			/* We should not own chip if it is already
 			 * in FL_SYNCING state. Put contender and retry. */
@@ -962,6 +961,8 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 				goto retry;
 			}
 			mutex_unlock(&contender->mutex);
+
+			mutex_lock(&shared->lock);
 		}
 
 		/* Check if we already have suspended erase
-- 
2.14.1
