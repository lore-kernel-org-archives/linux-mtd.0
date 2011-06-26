Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QawUK-0007b0-4F
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 21:03:29 +0000
Received: by bwf12 with SMTP id 12so1305920bwf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 14:03:17 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd/ofpart: add ofoldpart alias
Date: Mon, 27 Jun 2011 01:03:00 +0400
Message-Id: <1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/ofpart.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index aa33b8a..c4b8d17 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -176,3 +176,4 @@ module_init(ofpart_parser_init);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Parser for MTD partitioning information in device tree");
 MODULE_AUTHOR("Vitaly Wool, David Gibson");
+MODULE_ALIAS("ofoldpart");
-- 
1.7.5.4
