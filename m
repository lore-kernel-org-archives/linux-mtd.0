Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E215C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 11:39:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1603860F38
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 11:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1603860F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZiQtGeRPQxSSMafI14HVYvAwh8yKF2j3c5OyGeKKtY=; b=kGjDguEAnX+uEl
	+HXa78mc0r8IFuGecebmowVi0cwbg0K5WG7pu7TXnl9C8ySXAIBRo9ic3tHEJNbxnzvw4wO5pDclf
	6TtEXvYqNaOkqZaLac7oeN+h39CVkhMggwGvaMnQTKrEUpG5dibw41Hrlzq/0KLt39oqKzTDkasZP
	yXtUIdhDYAmW3TXB/gALoLwsCsvXxIu/mAl8Womway74kYZnisQSsJcBWBkLw20gxUim5TQHv8+Ah
	BFT3Uln6sJskSTUz8QlSl1OTt1dWtd7NHMEvsLhT6rmH9XNXZvp6fjXsprFE/ekCBVy2mDc1eBU5i
	N9EXlaSCRlXK3XrHoHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFxQs-002HTe-H0; Tue, 17 Aug 2021 11:39:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFxQN-002HLw-9Z
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 11:38:33 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gpppr0RyWzdb4S;
 Tue, 17 Aug 2021 19:34:44 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 19:38:27 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 19:38:27 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <bbrezillon@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 1/2] mtd: mtdconcat: Judge callback existence based on the
 master
Date: Tue, 17 Aug 2021 19:48:56 +0800
Message-ID: <20210817114857.2784825-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817114857.2784825-1-chengzhihao1@huawei.com>
References: <20210817114857.2784825-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_043831_744401_EC16BA17 
X-CRM114-Status: GOOD (  14.59  )
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
		pr_err("combine failed\n");
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
 drivers/mtd/mtdconcat.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 6e4d0017c0bd..af51eee6b5e8 100644
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
@@ -721,14 +724,22 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
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
+			/*
+			 * Check against subdev[i] for data members, because
+			 * subdev's attributes may be different from master
+			 * mtd device. Check against subdev's master mtd
+			 * device for callbacks, because the existence of
+			 * subdev's callbacks is decided by master mtd device.
+			 */
 			kfree(concat);
 			printk("Incompatible OOB or ECC data on \"%s\"\n",
 			       subdev[i]->name);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
