Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59750C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jun 2022 01:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NItm4Qn2rWSga/Ot6Vf2pCTYjYtZrjmbZ0/vANGRl6s=; b=cWbJ2LwuayafYz
	/xaoZ/jcCuQMn5Chmi7wkIXTK9pKQ+Ti9HKM2rt92jg3/caYCJT9gMGb6BsW6b0lycCgrsd9O5wZh
	Op/d259XXWKdYXulNMf5gtSY9k9/yN6DfsZG/kJesiG8LL8Srtf+u96+DXntyID+6RxR99R+VlNLX
	YpOruJ286Iq0y1AIuvrBwosdNVgplIsOyBaL1cWCXmD2VklSLq5MiOxCVFxBQ8rAHhEUE39zaDWpS
	sS4WhfOPxQx2M1zT92XlncN1a9ERIdhB/j88GYTs6LsZ1nMSgL8Ymx0oX1IwEsenBgrLSZKl65LaK
	uGTvzXfy2JbGjkKN+jDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o20oB-0050Mk-Mc; Fri, 17 Jun 2022 01:29:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o20o8-0050LQ-HU
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2022 01:29:58 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LPLyn4qm7zjXYs;
	Fri, 17 Jun 2022 09:28:17 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 09:29:50 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 17 Jun
 2022 09:29:50 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <csharper2005@gmail.com>, <drvlabo@gmail.com>
Subject: [PATCH -next] mtd: parsers: scpart: add missing of_node_put() in scpart_parse()
Date: Fri, 17 Jun 2022 09:40:08 +0800
Message-ID: <20220617014008.851583-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_182956_789503_9E1631CE 
X-CRM114-Status: UNSURE (   6.10  )
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

of_get_child_by_name() will increase the refcount of 'ofpart_node',
so add of_node_put() after using it to avoid refcount leak.

Fixes: 9b78ef0c7997 ("mtd: parsers: add support for Sercomm partitions")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/mtd/parsers/scpart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
index bc40e25dc105..02601bb33de4 100644
--- a/drivers/mtd/parsers/scpart.c
+++ b/drivers/mtd/parsers/scpart.c
@@ -219,6 +219,7 @@ static int scpart_parse(struct mtd_info *master,
 	of_node_put(pp);
 
 free:
+	of_node_put(ofpart_node);
 	kfree(scpart_map);
 	if (res <= 0)
 		kfree(parts);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
