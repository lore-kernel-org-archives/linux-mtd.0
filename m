Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA23D2E9C2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RD7gCqq71EhJWQ+laOvgK5oT9M/JAyThzGMkxdg/Aj8=; b=jfgchpHw8SUHFe
	z+t/cJnyy/rZ718yoYFLUlC4Yd0ksptN0VGRU2oI0CVqW+bz8QAk+pVLGL4HsnCiI1K+kqC8NWZ/k
	T9LK5E3SOPFSfp3WNS8EZdnpQDr+027ICBh4NjG85+mBfhrz7D4058gtPjJOuLvd4nE3Lx9v6pCuQ
	0LoC8Xjef0noou+bPUuoECF2f/ngTC+CIE9l2FibkVgWZmEeT4i/ZOekTEDNmSaP5tAVZ2NS/n7/e
	ydW3S33TZ+sWAliiNX5/RnLJ16Ep/btVQRUOVBDVkoMDgskbiF3kiPoXnP5Vvgstl3D9xZjMiQK0n
	NZHC4zMXOW46rEjFXeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ6X-0000000GrmH-48dm;
	Mon, 11 Nov 2024 08:49:01 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwL-0000000GpdX-1u5p
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:38:33 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn2rR5Nlzz28fPh;
	Mon, 11 Nov 2024 16:33:43 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3400214022D;
	Mon, 11 Nov 2024 16:38:25 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:38:24 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 006/102] ubifs-utils: Add 'dev_name' into 'ubifs_info' structure
Date: Mon, 11 Nov 2024 16:36:37 +0800
Message-ID: <20241111083711.1916125-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003830_073786_DCD710D3 
X-CRM114-Status: GOOD (  14.97  )
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

Embed new member 'dev_name' into 'ubifs_info' structure, then global
variable 'output' can be removed from mkfs.ubifs.c. Next patches will
import UBIFS libs from linux kernel, which could print messages that
contain device information, so this patch can distinguish different
devices according to messages.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/common/ubifs.h          |  2 ++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 29 ++++++++++++++---------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/ubifs-utils/common/ubifs.h b/ubifs-utils/common/ubifs.h
index 58aaba9b..502a39ae 100644
--- a/ubifs-utils/common/ubifs.h
+++ b/ubifs-utils/common/ubifs.h
@@ -277,6 +277,7 @@ struct ubifs_znode
  *		 2 - files, 3 - more details
  * @program_type: used to identify the type of current program
  * @program_name: program name
+ * @dev_name: device name
  *
  * @jhead_cnt: count of journal heads
  * @max_bud_bytes: maximum number of bytes allowed in buds
@@ -368,6 +369,7 @@ struct ubifs_info
 	int debug_level;
 	int program_type;
 	const char *program_name;
+	char *dev_name;
 
 	int jhead_cnt;
 	long long max_bud_bytes;
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index f66c6a46..1cafbf3e 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -145,7 +145,6 @@ static char *root;
 static int root_len;
 static struct fscrypt_context *root_fctx;
 static struct stat root_st;
-static char *output;
 static int out_fd;
 static int out_ubi;
 static int squash_owner;
@@ -407,10 +406,10 @@ static int validate_options(void)
 {
 	int tmp;
 
-	if (!output)
+	if (!c->dev_name)
 		return errmsg("no output file or UBI volume specified");
 	if (root) {
-		tmp = is_contained(output, root);
+		tmp = is_contained(c->dev_name, root);
 		if (tmp < 0)
 			return errmsg("failed to perform output file root check");
 		else if (tmp)
@@ -641,7 +640,7 @@ static int get_options(int argc, char**argv)
 				return errmsg("bad maximum LEB count");
 			break;
 		case 'o':
-			output = xstrdup(optarg);
+			c->dev_name = xstrdup(optarg);
 			break;
 		case 'D':
 			tbl_file = optarg;
@@ -835,13 +834,13 @@ static int get_options(int argc, char**argv)
 		}
 	}
 
-	if (optind != argc && !output)
-		output = xstrdup(argv[optind]);
+	if (optind != argc && !c->dev_name)
+		c->dev_name = xstrdup(argv[optind]);
 
-	if (!output)
+	if (!c->dev_name)
 		return errmsg("not output device or file specified");
 
-	out_ubi = !open_ubi(output);
+	out_ubi = !open_ubi(c->dev_name);
 
 	if (out_ubi) {
 		c->min_io_size = c->di.min_io_size;
@@ -921,7 +920,7 @@ static int get_options(int argc, char**argv)
 		printf("\tmin_io_size:  %d\n", c->min_io_size);
 		printf("\tleb_size:     %d\n", c->leb_size);
 		printf("\tmax_leb_cnt:  %d\n", c->max_leb_cnt);
-		printf("\toutput:       %s\n", output);
+		printf("\toutput:       %s\n", c->dev_name);
 		printf("\tjrn_size:     %llu\n", c->max_bud_bytes);
 		printf("\treserved:     %llu\n", c->rp_size);
 		switch (c->default_compr) {
@@ -2855,11 +2854,11 @@ static int check_volume_empty(void)
 static int open_target(void)
 {
 	if (out_ubi) {
-		out_fd = open(output, O_RDWR | O_EXCL);
+		out_fd = open(c->dev_name, O_RDWR | O_EXCL);
 
 		if (out_fd == -1)
 			return sys_errmsg("cannot open the UBI volume '%s'",
-					   output);
+					   c->dev_name);
 		if (ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 1)) {
 			close(out_fd);
 			return sys_errmsg("ubi_set_property(set direct_write) failed");
@@ -2872,11 +2871,11 @@ static int open_target(void)
 			}
 		}
 	} else {
-		out_fd = open(output, O_CREAT | O_RDWR | O_TRUNC,
+		out_fd = open(c->dev_name, O_CREAT | O_RDWR | O_TRUNC,
 			      S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
 		if (out_fd == -1)
 			return sys_errmsg("cannot create output file '%s'",
-					   output);
+					   c->dev_name);
 	}
 	return 0;
 }
@@ -2896,7 +2895,7 @@ static int close_target(void)
 		if (ubi && ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 0))
 			return sys_errmsg("ubi_set_property(clear direct_write) failed");
 		if (close(out_fd) == -1)
-			return sys_errmsg("cannot close the target '%s'", output);
+			return sys_errmsg("cannot close the target '%s'", c->dev_name);
 	}
 	return 0;
 }
@@ -3094,7 +3093,7 @@ int main(int argc, char *argv[])
 		printf("Success!\n");
 
 out:
-	free(output);
+	free(c->dev_name);
 	close_ubi();
 	crypto_cleanup();
 	return err;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
