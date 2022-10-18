Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A08C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T75+RApfSXtY7M6S3fm7ZOKmTEY6c9vKEd0n1NA46cY=; b=Fj7hTt1iiJwbEU
	9pBnVnAXnJqgg+qrxXG8ubx6SV5tXvNvnhauGfL6jDGnKMhfGTZXM7NboUmdY1Cfgn8D86DsUuid0
	Ioa0+nbtD3x2OFqC2ZZmaVlDn/5Q9nUE0jWIPdqIVo4+7m/vHktGMyAqKLOUSAhpDhk+sbvNt/bZR
	Kj2gWCupkVrkRdfENp0YqG7r+FVgol4EwGt2B2lCfka+A4pLtQC+4RQ/yVbSGwoaeMl9cNghqUUbO
	4gh0dAoUQTprDdIjGVlxMSaXESsgLglKI7dZRbKa3cFLqL47R8PAgmxzfWrJYEotMnA0a3aADcz9B
	/DYX6+G7lWHt8o6Vz3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okh0O-003oU5-Kr; Tue, 18 Oct 2022 07:27:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okgzi-003o44-HZ
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 07:26:37 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ms5584t0mz4wqT;
	Tue, 18 Oct 2022 15:26:20 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 15:26:26 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 15:26:25 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>
Subject: [PATCH] ubiattach: introduce disable_fm in UBI_IOCATT
Date: Tue, 18 Oct 2022 15:48:26 +0800
Message-ID: <20221018074826.2753019-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_002635_053833_9684684F 
X-CRM114-Status: GOOD (  18.91  )
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

The ioctl UBI_IOCATT has been extended with disable_fm parameter after
[1].

This parameter is used for disabling fastmap for target ubi device.
If 'disable_fm' is set, ubi doesn't create new fastmap even the module
param 'fm_autoconvert' is set, and existed old fastmap will be destroyed
after attaching process.


A simple test case in [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mtd?h=v6.1-rc1&id=669d204469c46e91d99da24914130f78277a71d3.
[2] https://bugzilla.kernel.org/show_bug.cgi?id=216278

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 include/libubi.h       |  3 +++
 include/mtd/ubi-user.h |  7 ++++++-
 lib/libubi.c           |  1 +
 ubi-utils/ubiattach.c  | 14 ++++++++++++--
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/libubi.h b/include/libubi.h
index 46c732a..8ea11e0 100644
--- a/include/libubi.h
+++ b/include/libubi.h
@@ -25,6 +25,7 @@
 
 #include <ctype.h>
 #include <stdint.h>
+#include <stdbool.h>
 #include <mtd/ubi-user.h>
 
 #ifdef __cplusplus
@@ -53,6 +54,7 @@ typedef void * libubi_t;
  * @vid_hdr_offset: VID header offset (%0 means default offset and this is what
  *                  most of the users want)
  * @max_beb_per1024: Maximum expected bad eraseblocks per 1024 eraseblocks
+ * @disable_fm: whether disable fastmap
  */
 struct ubi_attach_request
 {
@@ -61,6 +63,7 @@ struct ubi_attach_request
 	const char *mtd_dev_node;
 	int vid_hdr_offset;
 	int max_beb_per1024;
+	bool disable_fm;
 };
 
 /**
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 707c4f2..309c29f 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -270,13 +270,18 @@ enum {
  * eraseblocks for new bad eraseblocks, but attempts to use available
  * eraseblocks (if any). The accepted range is 0-768. If 0 is given, the
  * default kernel value of %CONFIG_MTD_UBI_BEB_LIMIT will be used.
+ *
+ * If @disable_fm is not zero, ubi doesn't create new fastmap even the module
+ * param 'fm_autoconvert' is set, and existed old fastmap will be destroyed
+ * after doing full scanning.
  */
 struct ubi_attach_req {
 	int32_t ubi_num;
 	int32_t mtd_num;
 	int32_t vid_hdr_offset;
 	int16_t max_beb_per1024;
-	int8_t  padding[10];
+	int8_t	disable_fm;
+	int8_t  padding[9];
 };
 
 /*
diff --git a/lib/libubi.c b/lib/libubi.c
index baaca2f..410d104 100644
--- a/lib/libubi.c
+++ b/lib/libubi.c
@@ -767,6 +767,7 @@ int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
 	r.ubi_num = req->dev_num;
 	r.mtd_num = req->mtd_num;
 	r.vid_hdr_offset = req->vid_hdr_offset;
+	r.disable_fm = req->disable_fm ? 1 : 0;
 
 	if (req->max_beb_per1024) {
 		/*
diff --git a/ubi-utils/ubiattach.c b/ubi-utils/ubiattach.c
index 09f85af..527a735 100644
--- a/ubi-utils/ubiattach.c
+++ b/ubi-utils/ubiattach.c
@@ -42,6 +42,7 @@ struct args {
 	const char *node;
 	const char *dev;
 	int max_beb_per1024;
+	bool disable_fm;
 };
 
 static struct args args = {
@@ -51,6 +52,7 @@ static struct args args = {
 	.node = NULL,
 	.dev = NULL,
 	.max_beb_per1024 = 0,
+	.disable_fm = false,
 };
 
 static const char doc[] = PROGRAM_NAME " version " VERSION
@@ -67,6 +69,8 @@ static const char optionsstr[] =
 "-b, --max-beb-per1024 maximum expected bad block number per 1024 eraseblock.\n"
 "                      The default value is correct for most NAND devices.\n"
 "                      Allowed range is 0-768, 0 means the default kernel value.\n"
+"-f, --disable-fastmap don't create new fastmap and do full scanning (existed\n"
+"                      fastmap will be destroyed) for the given ubi device.\n"
 "-h, --help            print help message\n"
 "-V, --version         print program version";
 
@@ -74,7 +78,7 @@ static const char usage[] =
 "Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
 "\t[-m <MTD device number>] [-d <UBI device number>] [-p <path to device>]\n"
 "\t[--mtdn=<MTD device number>] [--devn=<UBI device number>]\n"
-"\t[--dev-path=<path to device>]\n"
+"\t[--dev-path=<path to device>] [-f] [--disable-fastmap]\n"
 "\t[--max-beb-per1024=<maximum bad block number per 1024 blocks>]\n"
 "UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
 "Example 1: " PROGRAM_NAME " -p /dev/mtd0 - attach /dev/mtd0 to UBI\n"
@@ -93,6 +97,7 @@ static const struct option long_options[] = {
 	{ .name = "mtdn",            .has_arg = 1, .flag = NULL, .val = 'm' },
 	{ .name = "vid-hdr-offset",  .has_arg = 1, .flag = NULL, .val = 'O' },
 	{ .name = "max-beb-per1024", .has_arg = 1, .flag = NULL, .val = 'b' },
+	{ .name = "disable-fastmap", .has_arg = 0, .flag = NULL, .val = 'f' },
 	{ .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
 	{ NULL, 0, NULL, 0},
@@ -103,7 +108,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "p:m:d:O:b:hV", long_options, NULL);
+		key = getopt_long(argc, argv, "p:m:d:O:b:fhV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -143,6 +148,10 @@ static int parse_opt(int argc, char * const argv[])
 
 			break;
 
+		case 'f':
+			args.disable_fm = true;
+			break;
+
 		case 'h':
 			printf("%s\n\n", doc);
 			printf("%s\n\n", usage);
@@ -213,6 +222,7 @@ int main(int argc, char * const argv[])
 	req.vid_hdr_offset = args.vidoffs;
 	req.mtd_dev_node = args.dev;
 	req.max_beb_per1024 = args.max_beb_per1024;
+	req.disable_fm = args.disable_fm;
 
 	err = ubi_attach(libubi, args.node, &req);
 	if (err < 0) {
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
