Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F1AC531C7
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 02:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b2QhMxBCQ443K0vsmIRZtdv4x4EQ4tSr0hkh3E67dR8=; b=ekc54lzRM5ORar
	PB3fry0dyNYPUCJd8CPcrXEeFZ+IrkXZkxiUyCIVeejF13wl+p7qvZkXEUO/y376GvRSx9t5QLrMq
	jzfH6ElJ1xpnS0rJdWM5Xj26VRq14jXkARc8tAJPnocH+alNyXUKXFrqbaB8extTyw8rkMP8ysqd4
	5+Oe4V0uuYuGdnkct6sHg+NRzeaQpCHPzlAfTKuao6DLYMXIzP96oFkucc1k5EBRaWQ3yzLmvQ0tt
	X1kcSf6Gm2j5N/aF5pp89+ImfOS1ZU61Vcge5iyCI18xKgNY4QmmZoHvWJptU0U9eFuWfWe7kjIsJ
	VXly1MYSql9smaVHEB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjRm-0000000DFsN-1ARl;
	Thu, 23 Jul 2026 02:46:06 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjRi-0000000DFqv-3N56
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 02:46:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9/H4aykUPuReZUKx+4cRRx5ORlkaqD8sN2tNfpWsy70=;
	b=qWi95YXNeVOVIojZnl7w6HpkrQGqgTGVkLYauCfd0NsbQGteDEKZuY9kFRSkmpcIxz2CNBNuW
	8sRVfYq6QnoFZ4riGO9tJMoBpHtFf5ZrhLv6/OOsONg3MYzAYEdX96mocFSXgEIBeNX0pEEysUv
	ut2yj24PNbvqOckJiiJf5cU=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h5Fcs3bv4zpStj
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jul 2026 10:36:45 +0800 (CST)
Received: from dggpemr200001.china.huawei.com (unknown [7.185.36.96])
	by mail.maildlp.com (Postfix) with ESMTPS id BA7F240537
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jul 2026 10:45:51 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr200001.china.huawei.com
 (7.185.36.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Jul
 2026 10:45:51 +0800
From: Ran Hongyun <ranhongyun1@huawei.com>
To: <linux-mtd@lists.infradead.org>
CC: <chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH mtd-utils] ubi-utils: add wear-leveling threshold parameter to ubiattach
Date: Thu, 23 Jul 2026 10:37:06 +0800
Message-ID: <20260723023706.3568783-1-ranhongyun1@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemr200001.china.huawei.com (7.185.36.96)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_194603_234863_CF31786A 
X-CRM114-Status: GOOD (  19.37  )
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

Add wl_threshold support end-to-end: expose the kernel's wear-leveling
threshold via a new --wl-threshold / -w option in ubiattach, plumb it
through libubi, and define it by replacing 4 bytes of padding in
struct ubi_attach_req.

Valid range is 2-65536; 0 means use the kernel default.

Signed-off-by: Ran Hongyun <ranhongyun1@huawei.com>
---
 include/libubi.h       |  2 ++
 include/mtd/ubi-user.h |  3 ++-
 lib/libubi.c           |  1 +
 ubi-utils/ubiattach.c  | 24 +++++++++++++++++++++++-
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/include/libubi.h b/include/libubi.h
index b5b3d8f..9203416 100644
--- a/include/libubi.h
+++ b/include/libubi.h
@@ -56,6 +56,7 @@ typedef void * libubi_t;
  * @max_beb_per1024: Maximum expected bad eraseblocks per 1024 eraseblocks
  * @disable_fm: whether disable fastmap
  * @need_resv_pool: whether reserve free pebs for filling pool/wl_pool
+ * @wl_threshold: wear-leveling threshold (0 means use kernel default)
  */
 struct ubi_attach_request
 {
@@ -66,6 +67,7 @@ struct ubi_attach_request
 	int max_beb_per1024;
 	bool disable_fm;
 	bool need_resv_pool;
+	int wl_threshold;
 };
 
 /**
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index bb5c0f9..601f3f4 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -284,7 +284,8 @@ struct ubi_attach_req {
 	int16_t max_beb_per1024;
 	int8_t	disable_fm;
 	int8_t  need_resv_pool;
-	int8_t  padding[8];
+	int32_t wl_threshold;
+	int8_t  padding[4];
 };
 
 /*
diff --git a/lib/libubi.c b/lib/libubi.c
index 86736dd..5d55148 100644
--- a/lib/libubi.c
+++ b/lib/libubi.c
@@ -769,6 +769,7 @@ int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
 	r.vid_hdr_offset = req->vid_hdr_offset;
 	r.disable_fm = req->disable_fm ? 1 : 0;
 	r.need_resv_pool = req->need_resv_pool ? 1 : 0;
+	r.wl_threshold = req->wl_threshold;
 
 	if (req->max_beb_per1024) {
 		/*
diff --git a/ubi-utils/ubiattach.c b/ubi-utils/ubiattach.c
index 11e171b..0789a5f 100644
--- a/ubi-utils/ubiattach.c
+++ b/ubi-utils/ubiattach.c
@@ -44,6 +44,7 @@ struct args {
 	int max_beb_per1024;
 	bool disable_fm;
 	bool need_resv_pool;
+	int wl_threshold;
 };
 
 static struct args args = {
@@ -55,6 +56,7 @@ static struct args args = {
 	.max_beb_per1024 = 0,
 	.disable_fm = false,
 	.need_resv_pool = false,
+	.wl_threshold = 0,
 };
 
 static const char doc[] = PROGRAM_NAME " version " VERSION
@@ -76,6 +78,9 @@ static const char optionsstr[] =
 "-r, --reserve-pool    Slow down the frequency of updating fastmap by reserving\n"
 "                      pebs for filling pool/wl_pool, which can prolong flash\n"
 "                      service life.\n"
+"-w, --wl-threshold    Set the wear-leveling threshold for this UBI device.\n"
+"                      If 0, the kernel default value is used.\n"
+"                      Accepted range is 2-65536.\n"
 "-h, --help            print help message\n"
 "-V, --version         print program version";
 
@@ -85,6 +90,7 @@ static const char usage[] =
 "\t[--mtdn=<MTD device number>] [--devn=<UBI device number>]\n"
 "\t[--dev-path=<path to device>] [-f] [--disable-fastmap] [-r] [--reserve-pool]\n"
 "\t[--max-beb-per1024=<maximum bad block number per 1024 blocks>]\n"
+"\t[--wl-threshold=<wear-leveling threshold>]\n"
 "UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
 "Example 1: " PROGRAM_NAME " -p /dev/mtd0 - attach /dev/mtd0 to UBI\n"
 "Example 2: " PROGRAM_NAME " -m 0 - attach MTD device 0 (mtd0) to UBI\n"
@@ -104,6 +110,7 @@ static const struct option long_options[] = {
 	{ .name = "max-beb-per1024", .has_arg = 1, .flag = NULL, .val = 'b' },
 	{ .name = "disable-fastmap", .has_arg = 0, .flag = NULL, .val = 'f' },
 	{ .name = "reserve-pool",    .has_arg = 0, .flag = NULL, .val = 'r' },
+	{ .name = "wl-threshold",    .has_arg = 1, .flag = NULL, .val = 'w' },
 	{ .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
 	{ NULL, 0, NULL, 0},
@@ -114,7 +121,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "p:m:d:O:b:frhV", long_options, NULL);
+		key = getopt_long(argc, argv, "p:m:d:O:b:frw:hV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -162,6 +169,20 @@ static int parse_opt(int argc, char * const argv[])
 			args.need_resv_pool = true;
 			break;
 
+		case 'w':
+		{
+			unsigned long tmp = simple_strtoul(optarg, &error);
+
+			if (error || (tmp && (tmp < 2 || tmp > 65536)))
+				return errmsg("bad wear-leveling threshold: \"%s\" (2-65536)",
+					optarg);
+			if (tmp == 0)
+				warnmsg("wear-leveling threshold use the default kernel value");
+			args.wl_threshold = tmp;
+
+			break;
+		}
+
 		case 'h':
 			printf("%s\n\n", doc);
 			printf("%s\n\n", usage);
@@ -234,6 +255,7 @@ int main(int argc, char * const argv[])
 	req.max_beb_per1024 = args.max_beb_per1024;
 	req.disable_fm = args.disable_fm;
 	req.need_resv_pool = args.need_resv_pool;
+	req.wl_threshold = args.wl_threshold;
 
 	err = ubi_attach(libubi, args.node, &req);
 	if (err < 0) {
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
