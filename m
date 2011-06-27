Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbB1p-0005xt-Cq
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 12:35:02 +0000
Received: by wwf22 with SMTP id 22so3401543wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 05:34:59 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd/ofpart: add ofoldpart alias
Date: Mon, 27 Jun 2011 16:34:46 +0400
Message-Id: <1309178086-10604-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1309154611.23597.18.camel@sauron>
References: <1309154611.23597.18.camel@sauron>
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ofpart.ko also provides ofoldpart MTD parser. Add respective
MODULE_ALIAS("ofoldpart"); declaration.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/ofpart.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index aa33b8a..77f0640 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -176,3 +176,6 @@ module_init(ofpart_parser_init);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Parser for MTD partitioning information in device tree");
 MODULE_AUTHOR("Vitaly Wool, David Gibson");
+/* Required so that this module will be picked up ofoldpart
+ * MTD partition information parser */
+MODULE_ALIAS("ofoldpart");
-- 
1.7.5.4
