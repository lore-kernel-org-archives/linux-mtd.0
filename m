Return-Path: <SRS0=ekNa=5F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA0BC4332E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 03:15:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A6E206D7
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 03:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H6lYyvfC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1A6E206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/lKv8AVuELN8oSMfLoCUr6lIS6wp0P2ge6XSp7WDrwM=; b=H6lYyvfCf39SqP
	yyqWTG3+wfs63hX5jkc5COyvutthMF5R92rX57GUzPwOLLNBX3ZaMjGpIMjC/q2dRfCDXZScrr6Kn
	VuchsF+7Uo2IYwDFU5o0NmNAFPJBKPzUZjutZIH5lz08SgLzthT64o1Vxx5NLTGPQ16xiy/PiM6TT
	sfl/hiXSBUiixEtiyo85UCJVTap41qZNSbHGyQTEdLdGxl4k/FU/8TMUi9WfHRHF9kDkPZiLTUXE0
	AlStttkLGqYVBHNwubPNAmZbMEGg9xfk0G7RXTrNsUAZaiiIqUUDtrY26C/SiXXLQLrmc31fWcMb/
	vmdKo7LtEZch+IKuB6lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF88P-0007cy-77; Fri, 20 Mar 2020 03:15:45 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF88L-0007c7-Jg
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2020 03:15:43 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CC4E57B9517B1FB8A471;
 Fri, 20 Mar 2020 11:15:22 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Mar 2020 11:15:13 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH] mtd:Fix issue where write_cached_data() fails but write()
 still returns success
Date: Fri, 20 Mar 2020 11:15:11 +0800
Message-ID: <1584674111-101462-1-git-send-email-nixiaoming@huawei.com>
X-Mailer: git-send-email 1.8.5.6
MIME-Version: 1.0
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_201541_815851_3DA8F701 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, zhangweimin12@huawei.com, wangle6@huawei.com,
 nixiaoming@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

mtdblock_flush()
	-->write_cached_data()
		--->erase_write()
		     mtdblock: erase of region [0x40000, 0x20000] on "xxx" failed

Because mtdblock_flush() always returns 0,
even if write_cached_data() fails and data is not written to the device,
syscall_write() still returns success

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 drivers/mtd/mtdblock.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index c06b532..078e0f6 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -294,12 +294,13 @@ static void mtdblock_release(struct mtd_blktrans_dev *mbd)
 static int mtdblock_flush(struct mtd_blktrans_dev *dev)
 {
 	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
+	int ret;
 
 	mutex_lock(&mtdblk->cache_mutex);
-	write_cached_data(mtdblk);
+	ret = write_cached_data(mtdblk);
 	mutex_unlock(&mtdblk->cache_mutex);
 	mtd_sync(dev->mtd);
-	return 0;
+	return ret;
 }
 
 static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
-- 
1.8.5.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
