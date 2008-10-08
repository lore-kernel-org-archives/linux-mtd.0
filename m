Received: from plexity.net ([206.123.115.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Knf96-0004We-1a
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 19:56:32 +0000
Date: Wed, 8 Oct 2008 12:56:24 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: dedekind@infradead.org
Subject: [PATCH] [UBI] Print reseved_peb when it is too large
Message-ID: <20081008195624.GA20104@trantor.hsd1.or.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


[UBI] Print reserved_peb when it is too large

This patch makes debugging a missconfigured UBI a bit easier
by providing the needed information in the boot log.

Signed-off-by: Deepak Saxena <dsaxena@laptop.org>


diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 217d0e1..5758c9b 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -244,7 +244,8 @@ static int vtbl_check(const struct ubi_device *ubi,
 		}
 
 		if (reserved_pebs > ubi->good_peb_count) {
-			dbg_err("too large reserved_pebs, good PEBs %d",
+			dbg_err("too large reserved_pebs %d, good PEBs %d",
+				reserved_pebs,
 				ubi->good_peb_count);
 			err = 9;
 			goto bad;


-- 
   _____   __o  Deepak Saxena - Living CarFree and CareFree          (o>
------    -\<,  "When I see an adult on a bicycle, I do not despair  //\
 ----- ( )/ ( )  for the future of the human race." -H.G Wells       V_/_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
