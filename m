Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B94C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 07:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Co9lMkbJlSfoGGeLfumW3wG7GdzJpNR/hnIzK0wvk+U=; b=3gFF1+7yPANp8B
	QEG4tGXGnyGdiqqlzp0Y7A4CVP4FFsptSj9LNOaOo12/Fv/1Q8y0uolwiicpF7/BxR/5aT5lcuv9Q
	lE1rxlhmOgcOv9ocdxKrTsQFh7dA5nrsCoJ2LQBJMTFJ2pqQgkCTR4qwSOyNfBSraJaSu1fgi9L2b
	KcMinOIcfeQ4bQpeDEsMk9Y+H096NXRRml1JHdEOwJ55DSkcK1YgTKlIevPEUgdsGUsw5Rfw3iInw
	A02x4u19tQD9hwpIU6GQmSZ5vYKtCVC8O12Htf5VH3/jOKfJ/DOXuvyRhCvV1VDL5hLAopVgszPqZ
	+bgM/eYQuFOakvjzlRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFU4-004ooI-5A; Fri, 15 Jul 2022 07:11:32 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFU0-004ojf-5v
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 07:11:30 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LkjBg2GjQz1L8W0;
	Fri, 15 Jul 2022 15:08:43 +0800 (CST)
Received: from dggphis33418.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 15 Jul 2022 15:11:19 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <cuigaosheng1@huawei.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<gongruiqi1@huawei.com>, <wangweiyang2@huawei.com>
Subject: [PATCH -next] mtd/ftl: Fix uaf in ftl_remove_dev()
Date: Fri, 15 Jul 2022 15:11:19 +0800
Message-ID: <20220715071119.2321463-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_001128_810326_47052FBA 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

del_mtd_blktrans_dev will reclaim the resources of mtd_blktrans_dev,
and call kfree(dev) in blktrans_dev_put to release the memory of
mtd_blktrans_dev, so when ftl_freepart reclaims the memory of other
member pointers of the partition_t, it will trigger the uaf problem,
Fix it by moving ftl_freepart in front of del_mtd_blktrans_dev.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/mtd/ftl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 200271bdc7aa..bec56070039d 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1039,8 +1039,12 @@ static void ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 static void ftl_remove_dev(struct mtd_blktrans_dev *dev)
 {
+	struct partition_t *partition;
+
+	partition = container_of(dev, struct partition_t, mbd);
+
+	ftl_freepart(partition);
 	del_mtd_blktrans_dev(dev);
-	ftl_freepart((partition_t *)dev);
 }
 
 static struct mtd_blktrans_ops ftl_tr = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
