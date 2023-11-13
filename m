Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6A7C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 01:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJvcY/7V7As/iGhB5ysYeBlqYR8rpJwOnzA6tQ/qXBQ=; b=ncEBCAUWWSj9Fy
	HC8BaGPoA8QPtlN3AJYHET4pqcPOUIGGpnisGeigrzTKcTOx3q+iS2KtQHwpMl2dLx1Xwo7UTmJCt
	4/MVUReyesUxg1aKaigLFx/Y5Ch/UVRcB5PSx6lVq4AjpfFEL3CjWJ3XTNZdJHZ80X/oQvKkffNXs
	Ts2gNMtpmoXAPQy4NET1/MH0Hh8aNQ5YRw1pn7+0wZ8vR4FfOo1tmtzayHhPAoL7hdHb8w5GeBMT8
	aJFpjRxiXUCRTFcr4M091JluTDjnd3M9sd6vRz/42Hoo7t1IzfrrcI0V72V64Ms4+GRUlzfqKr+Hk
	mt2d0pWIkenbCPC+gNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2M9Q-00D1V1-37;
	Mon, 13 Nov 2023 01:54:08 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2M9M-00D1SA-2n
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 01:54:07 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4STC5v0QL9zMmln;
	Mon, 13 Nov 2023 09:49:23 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 13 Nov
 2023 09:53:55 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 2/2] ubiattach: introduce need_resv_pool in UBI_IOCATT
Date: Mon, 13 Nov 2023 17:48:12 +0800
Message-ID: <20231113094812.853529-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113094812.853529-1-chengzhihao1@huawei.com>
References: <20231113094812.853529-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_175405_257385_B46CDA11 
X-CRM114-Status: GOOD (  17.53  )
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

The ioctl UBI_IOCATT has been extended with need_resv_pool parameter in
[1].

This parameter is used for deciding whether to reserve PEBs for filling
pool/wl_pool for target ubi device. This parameter will be effective
when fastmap is enabled, which will slow down the frequency of updating
fastmap by filling more free PEBs in pool/wl_pool. See details in [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ac085cfe57df2cc1d7a5c4c5e64b8780c8ad452f
[2] https://bugzilla.kernel.org/show_bug.cgi?id=217787

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 include/libubi.h       |  2 ++
 include/mtd/ubi-user.h |  4 +++-
 lib/libubi.c           |  1 +
 ubi-utils/ubiattach.c  | 15 +++++++++++++--
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/include/libubi.h b/include/libubi.h
index 8ea11e0..e1e234e 100644
--- a/include/libubi.h
+++ b/include/libubi.h
@@ -55,6 +55,7 @@ typedef void * libubi_t;
  *                  most of the users want)
  * @max_beb_per1024: Maximum expected bad eraseblocks per 1024 eraseblocks
  * @disable_fm: whether disable fastmap
+ * @need_resv_pool: whether reserve free pebs for filling pool/wl_pool
  */
 struct ubi_attach_request
 {
@@ -64,6 +65,7 @@ struct ubi_attach_request
 	int vid_hdr_offset;
 	int max_beb_per1024;
 	bool disable_fm;
+	bool need_resv_pool;
 };
 
 /**
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index a389693..bb5c0f9 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -236,6 +236,7 @@ enum {
  * @vid_hdr_offset: VID header offset (use defaults if %0)
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
  * @disable_fm: whether disable fastmap
+ * @need_resv_pool: whether reserve free pebs for filling pool/wl_pool
  * @padding: reserved for future, not used, has to be zeroed
  *
  * This data structure is used to specify MTD device UBI has to attach and the
@@ -282,7 +283,8 @@ struct ubi_attach_req {
 	int32_t vid_hdr_offset;
 	int16_t max_beb_per1024;
 	int8_t	disable_fm;
-	int8_t  padding[9];
+	int8_t  need_resv_pool;
+	int8_t  padding[8];
 };
 
 /*
diff --git a/lib/libubi.c b/lib/libubi.c
index 410d104..6b57e50 100644
--- a/lib/libubi.c
+++ b/lib/libubi.c
@@ -768,6 +768,7 @@ int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
 	r.mtd_num = req->mtd_num;
 	r.vid_hdr_offset = req->vid_hdr_offset;
 	r.disable_fm = req->disable_fm ? 1 : 0;
+	r.need_resv_pool = req->need_resv_pool ? 1 : 0;
 
 	if (req->max_beb_per1024) {
 		/*
diff --git a/ubi-utils/ubiattach.c b/ubi-utils/ubiattach.c
index 527a735..e758dab 100644
--- a/ubi-utils/ubiattach.c
+++ b/ubi-utils/ubiattach.c
@@ -43,6 +43,7 @@ struct args {
 	const char *dev;
 	int max_beb_per1024;
 	bool disable_fm;
+	bool need_resv_pool;
 };
 
 static struct args args = {
@@ -53,6 +54,7 @@ static struct args args = {
 	.dev = NULL,
 	.max_beb_per1024 = 0,
 	.disable_fm = false,
+	.need_resv_pool = false,
 };
 
 static const char doc[] = PROGRAM_NAME " version " VERSION
@@ -71,6 +73,9 @@ static const char optionsstr[] =
 "                      Allowed range is 0-768, 0 means the default kernel value.\n"
 "-f, --disable-fastmap don't create new fastmap and do full scanning (existed\n"
 "                      fastmap will be destroyed) for the given ubi device.\n"
+"-r, --reserve-pool    Slow down the frequency of updating fastmap by reserving\n"
+"                      pebs for filling pool/wl_pool, which can prolong flash\n"
+"                      service life.\n"
 "-h, --help            print help message\n"
 "-V, --version         print program version";
 
@@ -78,7 +83,7 @@ static const char usage[] =
 "Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
 "\t[-m <MTD device number>] [-d <UBI device number>] [-p <path to device>]\n"
 "\t[--mtdn=<MTD device number>] [--devn=<UBI device number>]\n"
-"\t[--dev-path=<path to device>] [-f] [--disable-fastmap]\n"
+"\t[--dev-path=<path to device>] [-f] [--disable-fastmap] [-r] [--reserve-pool]\n"
 "\t[--max-beb-per1024=<maximum bad block number per 1024 blocks>]\n"
 "UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
 "Example 1: " PROGRAM_NAME " -p /dev/mtd0 - attach /dev/mtd0 to UBI\n"
@@ -98,6 +103,7 @@ static const struct option long_options[] = {
 	{ .name = "vid-hdr-offset",  .has_arg = 1, .flag = NULL, .val = 'O' },
 	{ .name = "max-beb-per1024", .has_arg = 1, .flag = NULL, .val = 'b' },
 	{ .name = "disable-fastmap", .has_arg = 0, .flag = NULL, .val = 'f' },
+	{ .name = "reserve-pool",    .has_arg = 0, .flag = NULL, .val = 'r' },
 	{ .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
 	{ NULL, 0, NULL, 0},
@@ -108,7 +114,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "p:m:d:O:b:fhV", long_options, NULL);
+		key = getopt_long(argc, argv, "p:m:d:O:b:frhV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -152,6 +158,10 @@ static int parse_opt(int argc, char * const argv[])
 			args.disable_fm = true;
 			break;
 
+		case 'r':
+			args.need_resv_pool = true;
+			break;
+
 		case 'h':
 			printf("%s\n\n", doc);
 			printf("%s\n\n", usage);
@@ -223,6 +233,7 @@ int main(int argc, char * const argv[])
 	req.mtd_dev_node = args.dev;
 	req.max_beb_per1024 = args.max_beb_per1024;
 	req.disable_fm = args.disable_fm;
+	req.need_resv_pool = args.need_resv_pool;
 
 	err = ubi_attach(libubi, args.node, &req);
 	if (err < 0) {
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
