Return-Path: <SRS0=QJY4=MX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FB3C4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jul 2021 02:23:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3A0360F46
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jul 2021 02:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3A0360F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpDWxdJf4NTmIRMVGInxh8ZwZ/Xxt90t99rI+7tCUq0=; b=aMAhrZA13oNDqJ
	kTH2I9wQHGsTUpB2Z9QxqOGt7IMcJ9oL6DmbC0jo2MNkXMyJ9pPHhvc6cJBfFLwRkqZREHCgJJ3fv
	dzMXP1eBM7Tceemnb+Z/jFU15u6LIULekvkWLz0RMxuNoTG6p2MiM/UU4H9JMv6tdOUbnP4N0zTdg
	S2M7H8uVQEzbrVl1aljnPT+hbPI5wVxIKJggWOsmMhNdq8PS/9AUKI6cY+0EJFbKHH2MxQLzGRmz4
	nfVLy43DfctkmDgtx6RuDuPex3AP8weBtdUuxYzpRLIQaQ1cSeYxZ/CJS+xXjGuo+8egis0NI/L8T
	2GjcnpipSNxp2H9joUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9edy-00AlFO-9F; Sat, 31 Jul 2021 02:22:30 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9edU-00Al7o-OG
 for linux-mtd@lists.infradead.org; Sat, 31 Jul 2021 02:22:03 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gc7Cx40v3zYjZh;
 Sat, 31 Jul 2021 10:15:57 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sat, 31 Jul 2021 10:21:56 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 31
 Jul 2021 10:21:56 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <bbrezillon@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 1/2] mtd: mtdconcat: Judge callback function existence getting
 from master for each partition
Date: Sat, 31 Jul 2021 10:32:42 +0800
Message-ID: <20210731023243.3977104-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731023243.3977104-1-chengzhihao1@huawei.com>
References: <20210731023243.3977104-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_192201_164017_59651ED3 
X-CRM114-Status: GOOD (  13.76  )
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

Since commit 46b5889cc2c5("mtd: implement proper partition handling")
applied, mtd partition device won't hold some callback functions, such
as _block_isbad, _block_markbad, etc. Besides, function mtd_block_isbad()
will get mtd device's master mtd device, then invokes master mtd device's
callback function. So, following process may result mtd_block_isbad()
always return 0, even though mtd device has bad blocks:

1. Split a mtd device into 3 partitions: PA, PB, PC
[ Each mtd partition device won't has callback function _block_isbad(). ]
2. Concatenate PA and PB as a new mtd device PN
[ mtd_concat_create() finds out each subdev has no callback function
_block_isbad(), so PN won't be assigned callback function
concat_block_isbad(). ]
Then, mtd_block_isbad() checks "!master->_block_isbad" is true, will
always return 0.

Reproducer:
// reproduce.c
static int __init init_diy_module(void)
{
	struct mtd_info *mtd[2];
	struct mtd_info *mtd_combine = NULL;

	mtd[0] = get_mtd_device_nm("NAND simulator partition 0");
	if (!mtd[0]) {
		pr_err("cannot find mtd1\n");
		return -EINVAL;
	}
	mtd[1] = get_mtd_device_nm("NAND simulator partition 1");
	if (!mtd[1]) {
		pr_err("cannot find mtd2\n");
		return -EINVAL;
	}

	put_mtd_device(mtd[0]);
	put_mtd_device(mtd[1]);

	mtd_combine = mtd_concat_create(mtd, 2, "Combine mtd");
	if (mtd_combine == NULL) {
		pr_err("comnoine  fail\n");
		return -EINVAL;
	}

	mtd_device_register(mtd_combine, NULL, 0);
	pr_info("Combine success\n");

	return 0;
}

1. ID="0x20,0xac,0x00,0x15"
2. modprobe nandsim id_bytes=$ID parts=50,100 badblocks=100
3. insmod reproduce.ko
4. flash_erase /dev/mtd3 0 0
  libmtd: error!: MEMERASE64 ioctl failed for eraseblock 100 (mtd3)
  error 5 (Input/output error)
  // Should be "flash_erase: Skipping bad block at 00c80000"

Fixes: 46b5889cc2c54bac ("mtd: implement proper partition handling")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/mtdconcat.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 6e4d0017c0bd..ea130eeb54d5 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -641,6 +641,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	int i;
 	size_t size;
 	struct mtd_concat *concat;
+	struct mtd_info *subdev_master = NULL;
 	uint32_t max_erasesize, curr_erasesize;
 	int num_erase_region;
 	int max_writebufsize = 0;
@@ -679,17 +680,19 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd.subpage_sft = subdev[0]->subpage_sft;
 	concat->mtd.oobsize = subdev[0]->oobsize;
 	concat->mtd.oobavail = subdev[0]->oobavail;
-	if (subdev[0]->_writev)
+
+	subdev_master = mtd_get_master(subdev[0]);
+	if (subdev_master->_writev)
 		concat->mtd._writev = concat_writev;
-	if (subdev[0]->_read_oob)
+	if (subdev_master->_read_oob)
 		concat->mtd._read_oob = concat_read_oob;
-	if (subdev[0]->_write_oob)
+	if (subdev_master->_write_oob)
 		concat->mtd._write_oob = concat_write_oob;
-	if (subdev[0]->_block_isbad)
+	if (subdev_master->_block_isbad)
 		concat->mtd._block_isbad = concat_block_isbad;
-	if (subdev[0]->_block_markbad)
+	if (subdev_master->_block_markbad)
 		concat->mtd._block_markbad = concat_block_markbad;
-	if (subdev[0]->_panic_write)
+	if (subdev_master->_panic_write)
 		concat->mtd._panic_write = concat_panic_write;
 
 	concat->mtd.ecc_stats.badblocks = subdev[0]->ecc_stats.badblocks;
@@ -721,14 +724,15 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 				    subdev[i]->flags & MTD_WRITEABLE;
 		}
 
+		subdev_master = mtd_get_master(subdev[i]);
 		concat->mtd.size += subdev[i]->size;
 		concat->mtd.ecc_stats.badblocks +=
 			subdev[i]->ecc_stats.badblocks;
 		if (concat->mtd.writesize   !=  subdev[i]->writesize ||
 		    concat->mtd.subpage_sft != subdev[i]->subpage_sft ||
 		    concat->mtd.oobsize    !=  subdev[i]->oobsize ||
-		    !concat->mtd._read_oob  != !subdev[i]->_read_oob ||
-		    !concat->mtd._write_oob != !subdev[i]->_write_oob) {
+		    !concat->mtd._read_oob  != !subdev_master->_read_oob ||
+		    !concat->mtd._write_oob != !subdev_master->_write_oob) {
 			kfree(concat);
 			printk("Incompatible OOB or ECC data on \"%s\"\n",
 			       subdev[i]->name);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
