Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUEKo-0006XO-JG
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 08:41:55 +0000
Received: by fxm14 with SMTP id 14so215412fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 01:41:51 -0700 (PDT)
Subject: Re: [PATCH 01/44] mtd: add new API for handling MTD registration
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <4DEE36D6.2070009@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-2-git-send-email-dbaryshkov@gmail.com>
	<20110607134429.GE21174@pulham.picochip.com>
	<4DEE36D6.2070009@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 11:37:31 +0300
Message-ID: <1307522251.31223.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 18:33 +0400, Dmitry Eremin-Solenikov wrote:
> >  Also some kernel-doc to describe the search order would be nice.
> 
> Search order is mainly detailed either by defaults specified in 
> mtdpart.c or by probe types which user specifies.

I look at the functions and they are difficult to understand. We need to
start with good kerneldoc comment for 'parse_mtd_partitions()'. The
default behavior has to be well-documented. I'd like to apply this
patch, how does it look to you?


>From 1606f9966d891cb79bdfb935baf87038a7029198 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 8 Jun 2011 11:42:27 +0300
Subject: [PATCH] mtd: document parse_mtd_partitions

Add a kerneldoc comment for the 'parse_mtd_partitions()' function - its
behavior has changed recently so it is good idea to have it documented.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdpart.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b7372050..2b71ccb 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -725,8 +725,30 @@ int deregister_mtd_parser(struct mtd_part_parser *p)
 }
 EXPORT_SYMBOL_GPL(deregister_mtd_parser);
 
+/*
+ * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
+ * are changing this array!
+ */
 static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
 
+/**
+ * parse_mtd_partitions - parse MTD partitions
+ * @master: the master partition (describes whole MTD device)
+ * @types: names of partition parsers to try or %NULL
+ * @pparts: array of partitions found is returned here
+ * @origin: MTD device start address (use %0 if unsure)
+ *
+ * This function tries to find partition on MTD device @master. It uses MTD
+ * partition parsers, specified in @types. However, if @types is %NULL, then
+ * the default list of parsers is used. The default list contains only the
+ * "cmdlinepart" parser ATM.
+ *
+ * This function may return:
+ * o a negative error code in case of failure
+ * o zero if no partitions were found
+ * o a positive number of found partitions, in which case on exit @pparts will
+ *   point to an array containing this number of &struct mtd_info objects.
+ */
 int parse_mtd_partitions(struct mtd_info *master, const char **types,
 			 struct mtd_partition **pparts, unsigned long origin)
 {
-- 
1.7.2.3


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
