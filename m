Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RbgDc-0000L3-NA
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2011 22:25:34 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3] mtd/docg3: fixes and cleanups
References: <1322726702.2332.9.camel@koala>
 <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
 <1323066682.2316.18.camel@koala> <877h2590zp.fsf@free.fr>
 <1323724387.2297.13.camel@koala> <874nx5zbuj.fsf@free.fr>
Date: Fri, 16 Dec 2011 23:25:23 +0100
In-Reply-To: <874nx5zbuj.fsf@free.fr> (Robert Jarzmik's message of "Mon, 12
 Dec 2011 23:03:48 +0100")
Message-ID: <87pqfow3vw.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Artem Bityutskiy <dedekind1@gmail.com> writes:
>
>> On Fri, 2011-12-09 at 17:13 +0100, Robert Jarzmik wrote:
>> May be it is better to just embrace this function with "#ifdef 0" and add a
>> comment that we can do this but do not have a good use for this?
> Ah yes, I didn't think about that possibility. It's looks better, I'll submit
> another patch with a comment and the #if 0.
How about the following patch ?

Cheers.

-- 
Robert

>From 75cb409a2a98070584cbf7a9f8ccfe621cf29018 Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 9 Dec 2011 17:02:49 +0100
Subject: [PATCH] mtd: docg3: remove unused function

As the MTD api has no use for the number of erase cycles
each block has endured, remove the function which calculated
that value.

If one day MTD api finds it usefull for wear levelling
algorithms to have this information, the function should be
put back in place.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 2a32072..22d5099 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1037,6 +1037,7 @@ static int doc_block_isbad(struct mtd_info *mtd, loff_t from)
 	return !is_good;
 }
 
+#if 0
 /**
  * doc_get_erase_count - Get block erase count
  * @docg3: the device
@@ -1078,6 +1079,7 @@ static int doc_get_erase_count(struct docg3 *docg3, loff_t from)
 
 	return max(plane1_erase_count, plane2_erase_count);
 }
+#endif
 
 /**
  * doc_get_op_status - get erase/write operation status
-- 
1.7.5.4
