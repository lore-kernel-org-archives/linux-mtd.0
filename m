Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8437FC27C7B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1ovhYpMbmN6gq+ShnoXHZ03M//C+myU6Z6fxlg+WNs=; b=1m6CqAfXMcBmQC
	uDdW8YVrdnVbEZHgQvyg/3a/7bEluT/4uDoxkm3TE3ns/ldHerivkiVCzXDC9vJlF3bb+XlahXgh7
	pOO3a0LOqpESA7tEv9ygitNw1M94SeQAuZc17F7KiQpX4OwEz6lndkzn1H0XCxYfRPpH3bCBjVEpl
	nX/n8Vdt2yeFBwRIrqLCnD+VFrx1lpQSXEnmmwlt1tn0f4DfTo0fnGWrKQXNXu+PHZ/H4eqctJIFH
	Q4wDIc+SQLMlLyvJ92fnFCA01jvT9bOzBUJYa/UQjTxKSrdbqgKZKWBr580olysmnHJkoLF3FLq3P
	8rnPEWSlFAsZSKxM750g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSD3-0000000CUUw-13C2;
	Fri, 07 Jun 2024 05:32:17 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBk-0000000CG93-0BiQ
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:26:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VwSkB6y2JzPpnS;
	Fri,  7 Jun 2024 12:23:30 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 4644C1400D5;
	Fri,  7 Jun 2024 12:26:50 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:33 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 010/110] mkfs.ubifs: Close libubi in error handling paths
Date: Fri, 7 Jun 2024 12:24:35 +0800
Message-ID: <20240607042615.2069840-11-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212652_499390_31A6A159 
X-CRM114-Status: GOOD (  12.55  )
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

The libubi could be opened in get_options(), don't forget to close it
in error handling paths in main(). Also close libubi in error handling
paths in open_ubi(). To implement that, extract libubi_close() into a
new helper function close_ubi().
Besides, invoke crypto_cleanup() in error handling paths in main().

Fixes: a48340c335dab ("mkfs.ubifs: use libubi to format UBI volume")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 38 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 25c49967..6a4a4588 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -521,11 +521,21 @@ static long long get_bytes(const char *str)
 
 	return bytes;
 }
+
+static void close_ubi(void)
+{
+	if (ubi) {
+		libubi_close(ubi);
+		ubi = NULL;
+	}
+}
+
 /**
- * open_ubi - open the UBI volume.
+ * open_ubi - open the libubi.
  * @node: name of the UBI volume character device to fetch information about
  *
- * Returns %0 in case of success and %-1 in case of failure
+ * This function opens libubi, and initialize device & volume information
+ * according to @node. Returns %0 in case of success and %-1 in case of failure.
  */
 static int open_ubi(const char *node)
 {
@@ -537,10 +547,14 @@ static int open_ubi(const char *node)
 	ubi = libubi_open();
 	if (!ubi)
 		return -1;
-	if (ubi_get_vol_info(ubi, node, &c->vi))
+	if (ubi_get_vol_info(ubi, node, &c->vi)) {
+		close_ubi();
 		return -1;
-	if (ubi_get_dev_info1(ubi, c->vi.dev_num, &c->di))
+	}
+	if (ubi_get_dev_info1(ubi, c->vi.dev_num, &c->di)) {
+		close_ubi();
 		return -1;
+	}
 	return 0;
 }
 
@@ -2880,8 +2894,6 @@ static int close_target(void)
 		if (close(out_fd) == -1)
 			return sys_errmsg("cannot close the target '%s'", output);
 	}
-	if (ubi)
-		libubi_close(ubi);
 	if (output)
 		free(output);
 	return 0;
@@ -3062,25 +3074,25 @@ int main(int argc, char *argv[])
 
 	err = get_options(argc, argv);
 	if (err)
-		return err;
+		goto out;
 
 	err = open_target();
 	if (err)
-		return err;
+		goto out;
 
 	err = mkfs();
 	if (err) {
 		close_target();
-		return err;
+		goto out;
 	}
 
 	err = close_target();
-	if (err)
-		return err;
 
-	if (verbose)
+	if (verbose && !err)
 		printf("Success!\n");
 
+out:
+	close_ubi();
 	crypto_cleanup();
-	return 0;
+	return err;
 }
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
