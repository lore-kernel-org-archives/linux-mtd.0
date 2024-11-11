Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440FCD2E9C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXtaIOYcy8mJtMj9JAFPPVmfgZYrx2y1iaQnbUm3LAc=; b=Am1x8WOubfsi8z
	6+DIFa3DTfvsA3eLsoLckRjUb20jvdOZ6j2IdS4rj+i8l6Au6LQnzPrF3I0OHV5ia+IWTB45gHSpU
	+J5LNM+za+LgbI5jELSiK61XCpR/todZviJD94jkRGpwWEsJrYYy/yaLsLxZOTUQdjww79IrkKoAr
	mHO5cUpDO3cdSosKPwqBIdYSL6+u4Nn/hVjD2mEfsWznXXaVV2juNS6fxuMgQy2/22RmhbqUCChfn
	tWAlXLR4mGO4mG94V32Rj2319KHMsvbOyBDuukJXZXBr8EhDVtpAjLf7QE2tiNWqDE5YJWNOBcn/J
	7uwjGzJRF0KqmvaSX0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ6U-0000000Grl4-3wn1;
	Mon, 11 Nov 2024 08:48:58 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwL-0000000Gpda-23K3
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:38:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xn2vm5X3Pz1hwNC;
	Mon, 11 Nov 2024 16:36:36 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id AC05D1A016C;
	Mon, 11 Nov 2024 16:38:24 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:38:24 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 005/102] ubifs-utils: Move 'debug_level' into ubifs_info structure
Date: Mon, 11 Nov 2024 16:36:36 +0800
Message-ID: <20241111083711.1916125-6-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003829_723405_9ED53438 
X-CRM114-Status: GOOD (  10.74  )
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
 ubifs-utils/common/defs.h           | 4 +---
 ubifs-utils/common/ubifs.h          | 3 +++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 6 ++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
index 3dafc6dd..cafc94af 100644
--- a/ubifs-utils/common/defs.h
+++ b/ubifs-utils/common/defs.h
@@ -23,9 +23,7 @@ extern struct ubifs_info info_;
 
 enum { MKFS_PROGRAM_TYPE = 0 };
 
-extern int debug_level;
-
-#define dbg_msg(lvl, fmt, ...) do {if (debug_level >= lvl)                \
+#define dbg_msg(lvl, fmt, ...) do {if (info_.debug_level >= lvl)	\
 	printf("%s: %s: " fmt "\n", PROGRAM_NAME, __FUNCTION__, ##__VA_ARGS__); \
 } while(0)
 
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
index 22969f93..f66c6a46 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -138,8 +138,6 @@ struct ubifs_info info_;
 static struct ubifs_info *c = &info_;
 static libubi_t ubi;
 
-/* Debug levels are: 0 (none), 1 (statistics), 2 (files) ,3 (more details) */
-int debug_level;
 int verbose;
 int yes;
 
@@ -671,9 +669,9 @@ static int get_options(int argc, char**argv)
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
