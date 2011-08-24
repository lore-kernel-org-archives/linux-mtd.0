Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qw1AQ-00082k-7D
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 00:18:03 +0000
Received: by pzk4 with SMTP id 4so421553pzk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 17:18:00 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 4/5] mtd: nand: fix spelling error (date => data)
Date: Tue, 23 Aug 2011 17:17:35 -0700
Message-Id: <1314145056-5233-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
References: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/nand.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6d56968..85fef68 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -465,7 +465,7 @@ struct nand_buffers {
  * @controller:		[REPLACEABLE] a pointer to a hardware controller
  *			structure which is shared among multiple independent
  *			devices.
- * @priv:		[OPTIONAL] pointer to private chip date
+ * @priv:		[OPTIONAL] pointer to private chip data
  * @errstat:		[OPTIONAL] hardware specific function to perform
  *			additional error status checks (determine if errors are
  *			correctable).
-- 
1.7.5.4
