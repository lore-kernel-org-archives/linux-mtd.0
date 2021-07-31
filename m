Return-Path: <SRS0=QJY4=MX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEC5C4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jul 2021 02:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E71F160EB2
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jul 2021 02:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E71F160EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHZJ2eamHRoAK7k3snnQlu6snwWsKFHmFLapZ8Xta8o=; b=Cu8icMLtjrCC1x
	DPOBss8ckrgvNl/r/YGkC8CNbgxt26N4EVcB8zBnMIZcm7MRI5UnGg5pTh8bWha2Kle7ncuklqCWl
	Pa8YMNLRo4XyeCf0FEeGf5SnjJ55C6Z0u/MuSI2qhPGkcVjJAh2EkjzvSjgkZsofEoFP/zliSv1vG
	ImO25wKU4GX9VzVQXSVNcnz5xhDi+eghckTOR9yakn3kHo88yec4Ww3maTnU1BqpVT3N41dinTuVT
	u2wmqHBck8kv3PBcq71Dgst7HyU+d6bmwzkn6HtCzcQ923wBTrPgrZsHGmf+XgqVvETcD2VaqOxQq
	QRMy+GqER7E94CiDJxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9edl-00AlE9-Cp; Sat, 31 Jul 2021 02:22:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9edU-00Al7p-OF
 for linux-mtd@lists.infradead.org; Sat, 31 Jul 2021 02:22:02 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gc7Gq1D3GzZqqc;
 Sat, 31 Jul 2021 10:18:27 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sat, 31 Jul 2021 10:21:57 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 31
 Jul 2021 10:21:56 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <bbrezillon@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 2/2] mtd: mtdconcat: Remove concat_{read|write}_oob
Date: Sat, 31 Jul 2021 10:32:43 +0800
Message-ID: <20210731023243.3977104-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731023243.3977104-1-chengzhihao1@huawei.com>
References: <20210731023243.3977104-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_192201_161029_611CC562 
X-CRM114-Status: GOOD (  20.13  )
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

Since 2431c4f5b46c3("mtd: Implement mtd_{read,write}() as wrappers
around mtd_{read,write}_oob()") don't allow _write|_read and
_write_oob|_read_oob existing at the same time. We should stop these
two callback functions assigning, otherwise following warning occurs
while making concatenated device:

  WARNING: CPU: 2 PID: 6728 at drivers/mtd/mtdcore.c:595
  add_mtd_device+0x7f/0x7b0

Fixes: 2431c4f5b46c3("mtd: Implement mtd_{read,write}() around ...")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/mtdconcat.c | 113 +---------------------------------------
 1 file changed, 1 insertion(+), 112 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index ea130eeb54d5..98d1c79cf51d 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -256,110 +256,6 @@ concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	return err;
 }
 
-static int
-concat_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
-{
-	struct mtd_concat *concat = CONCAT(mtd);
-	struct mtd_oob_ops devops = *ops;
-	int i, err, ret = 0;
-
-	ops->retlen = ops->oobretlen = 0;
-
-	for (i = 0; i < concat->num_subdev; i++) {
-		struct mtd_info *subdev = concat->subdev[i];
-
-		if (from >= subdev->size) {
-			from -= subdev->size;
-			continue;
-		}
-
-		/* partial read ? */
-		if (from + devops.len > subdev->size)
-			devops.len = subdev->size - from;
-
-		err = mtd_read_oob(subdev, from, &devops);
-		ops->retlen += devops.retlen;
-		ops->oobretlen += devops.oobretlen;
-
-		/* Save information about bitflips! */
-		if (unlikely(err)) {
-			if (mtd_is_eccerr(err)) {
-				mtd->ecc_stats.failed++;
-				ret = err;
-			} else if (mtd_is_bitflip(err)) {
-				mtd->ecc_stats.corrected++;
-				/* Do not overwrite -EBADMSG !! */
-				if (!ret)
-					ret = err;
-			} else
-				return err;
-		}
-
-		if (devops.datbuf) {
-			devops.len = ops->len - ops->retlen;
-			if (!devops.len)
-				return ret;
-			devops.datbuf += devops.retlen;
-		}
-		if (devops.oobbuf) {
-			devops.ooblen = ops->ooblen - ops->oobretlen;
-			if (!devops.ooblen)
-				return ret;
-			devops.oobbuf += ops->oobretlen;
-		}
-
-		from = 0;
-	}
-	return -EINVAL;
-}
-
-static int
-concat_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops)
-{
-	struct mtd_concat *concat = CONCAT(mtd);
-	struct mtd_oob_ops devops = *ops;
-	int i, err;
-
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-
-	ops->retlen = ops->oobretlen = 0;
-
-	for (i = 0; i < concat->num_subdev; i++) {
-		struct mtd_info *subdev = concat->subdev[i];
-
-		if (to >= subdev->size) {
-			to -= subdev->size;
-			continue;
-		}
-
-		/* partial write ? */
-		if (to + devops.len > subdev->size)
-			devops.len = subdev->size - to;
-
-		err = mtd_write_oob(subdev, to, &devops);
-		ops->retlen += devops.retlen;
-		ops->oobretlen += devops.oobretlen;
-		if (err)
-			return err;
-
-		if (devops.datbuf) {
-			devops.len = ops->len - ops->retlen;
-			if (!devops.len)
-				return 0;
-			devops.datbuf += devops.retlen;
-		}
-		if (devops.oobbuf) {
-			devops.ooblen = ops->ooblen - ops->oobretlen;
-			if (!devops.ooblen)
-				return 0;
-			devops.oobbuf += devops.oobretlen;
-		}
-		to = 0;
-	}
-	return -EINVAL;
-}
-
 static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct mtd_concat *concat = CONCAT(mtd);
@@ -684,10 +580,6 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	subdev_master = mtd_get_master(subdev[0]);
 	if (subdev_master->_writev)
 		concat->mtd._writev = concat_writev;
-	if (subdev_master->_read_oob)
-		concat->mtd._read_oob = concat_read_oob;
-	if (subdev_master->_write_oob)
-		concat->mtd._write_oob = concat_write_oob;
 	if (subdev_master->_block_isbad)
 		concat->mtd._block_isbad = concat_block_isbad;
 	if (subdev_master->_block_markbad)
@@ -724,15 +616,12 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 				    subdev[i]->flags & MTD_WRITEABLE;
 		}
 
-		subdev_master = mtd_get_master(subdev[i]);
 		concat->mtd.size += subdev[i]->size;
 		concat->mtd.ecc_stats.badblocks +=
 			subdev[i]->ecc_stats.badblocks;
 		if (concat->mtd.writesize   !=  subdev[i]->writesize ||
 		    concat->mtd.subpage_sft != subdev[i]->subpage_sft ||
-		    concat->mtd.oobsize    !=  subdev[i]->oobsize ||
-		    !concat->mtd._read_oob  != !subdev_master->_read_oob ||
-		    !concat->mtd._write_oob != !subdev_master->_write_oob) {
+		    concat->mtd.oobsize    !=  subdev[i]->oobsize) {
 			kfree(concat);
 			printk("Incompatible OOB or ECC data on \"%s\"\n",
 			       subdev[i]->name);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
