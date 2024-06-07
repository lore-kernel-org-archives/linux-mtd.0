Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA13BC27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CK0e9edEWyjOhze4qz40soWqeHx/QyJpNjbe4IXNN7I=; b=kxr622pHOCcN+9
	AHOhOLjyiO2lb5FSzLJ13UBgm9y4CPMiE3OworVwylBewgFIFlj39AB6hbQ8KqbnhlAtgALcVa0y/
	UVm3tj2+CTdykAu0BLe0EQR7aHHok7OrNgQM/jtkNj3pXks5taedWTOWBKcZLDoWMPB6HItgGCL+k
	wUXE5SQ2PNEN1B4xn1Z2FbvThtRRuxw8fi8AmR6R+4XPmXtk3pphJ+NMFEKbxRvVgWTZytOzduez6
	npm9KQuGoFN+88r/4i0ZIPmxJqCMUjNThlG16tg2RFweNBKVUk8dpc+ChDf3AN7f/eIbp6/VIxBa3
	9IVo9zXj7Zefe/xufElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBf-0000000CG7L-1WUH;
	Fri, 07 Jun 2024 04:26:47 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBa-0000000CG3j-1g2F
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:26:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VwSj54Jh5z1S8tw;
	Fri,  7 Jun 2024 12:22:33 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 56FD518007E;
	Fri,  7 Jun 2024 12:26:32 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:31 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 007/110] ubifs-utils: Move 'debug_level' into ubifs_info structure
Date: Fri, 7 Jun 2024 12:24:32 +0800
Message-ID: <20240607042615.2069840-8-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212642_789096_035754B7 
X-CRM114-Status: GOOD (  11.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Embed new member 'debug_level' into 'ubifs_info' structure, then global
variable 'debug_level' can be removed from mkfs.ubifs.c. Next patches
will import UBIFS libs from linux kernel, which could print messages
with different levels, then 'debug_level' can be used to control which
level messages should be printed.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/common/defs.h                | 6 +++---
 ubifs-utils/common/hashtable/hashtable.c | 1 +
 ubifs-utils/common/ubifs.h               | 3 +++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c      | 6 ++----
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
index 56336b6a..cafc94af 100644
--- a/ubifs-utils/common/defs.h
+++ b/ubifs-utils/common/defs.h
@@ -12,6 +12,8 @@
 #include <byteswap.h>
 #include <errno.h>
 
+#include "ubifs.h"
+
 /* common.h requires the PROGRAM_NAME macro */
 extern struct ubifs_info info_;
 #define PROGRAM_NAME (info_.program_name)
@@ -21,9 +23,7 @@ extern struct ubifs_info info_;
 
 enum { MKFS_PROGRAM_TYPE = 0 };
 
-extern int debug_level;
-
-#define dbg_msg(lvl, fmt, ...) do {if (debug_level >= lvl)                \
+#define dbg_msg(lvl, fmt, ...) do {if (info_.debug_level >= lvl)	\
 	printf("%s: %s: " fmt "\n", PROGRAM_NAME, __FUNCTION__, ##__VA_ARGS__); \
 } while(0)
 
diff --git a/ubifs-utils/common/hashtable/hashtable.c b/ubifs-utils/common/hashtable/hashtable.c
index a3bae166..af7fed97 100644
--- a/ubifs-utils/common/hashtable/hashtable.c
+++ b/ubifs-utils/common/hashtable/hashtable.c
@@ -6,6 +6,7 @@
 #include <math.h>
 
 #include "ubifs.h"
+#include "defs.h"
 #include "hashtable.h"
 #include "hashtable_private.h"
 
diff --git a/ubifs-utils/common/ubifs.h b/ubifs-utils/common/ubifs.h
index 2b0ffe56..58aaba9b 100644
--- a/ubifs-utils/common/ubifs.h
+++ b/ubifs-utils/common/ubifs.h
@@ -273,6 +273,8 @@ struct ubifs_znode
  * @highest_inum: highest used inode number
  * @max_sqnum: current global sequence number
  *
+ * @debug_level: level of debug messages, 0 - none, 1 - statistics,
+ *		 2 - files, 3 - more details
  * @program_type: used to identify the type of current program
  * @program_name: program name
  *
@@ -363,6 +365,7 @@ struct ubifs_info
 	ino_t highest_inum;
 	unsigned long long max_sqnum;
 
+	int debug_level;
 	int program_type;
 	const char *program_name;
 
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 0bcaa5e4..51852861 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -138,8 +138,6 @@ struct ubifs_info info_;
 static struct ubifs_info *c = &info_;
 static libubi_t ubi;
 
-/* Debug levels are: 0 (none), 1 (statistics), 2 (files) ,3 (more details) */
-int debug_level;
 int verbose;
 int yes;
 
@@ -657,9 +655,9 @@ static int get_options(int argc, char**argv)
 			common_print_version();
 			exit(EXIT_SUCCESS);
 		case 'g':
-			debug_level = strtol(optarg, &endp, 0);
+			c->debug_level = strtol(optarg, &endp, 0);
 			if (*endp != '\0' || endp == optarg ||
-			    debug_level < 0 || debug_level > 3)
+			    c->debug_level < 0 || c->debug_level > 3)
 				return errmsg("bad debugging level '%s'",
 					       optarg);
 			break;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
