Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CCBC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BmF+CEOB79NpBgDlIwkYlb128K4jzuLPx/83SFH2VoU=; b=JbD6esFwcqFMsj
	V2F+k06ir821VoK3LlU0mFfdxq0GwMuS+kv6jm83VPLDHLAIUEycW5pWez2o7HQOYkFiNHqlULmOD
	E9iG7WQZCHZpvwvSVFvukyV6PL7MsVTeubckg25TEkvOBvKWF1iXvIaPGadlWJ4HKfyEUMnM7ll8f
	+Zr7TmJFMGCYNCmv+g12nc0hFydpVA9zHmGmNELIknIRm4nVZ1VEQEMpY9dhBi+/4Rmi7aUbzNPdw
	I4c+ktD9kc9KRJZfwebpti4SbpXqDx/caw0evTdUx/rU2anJtMPXCZ3RvVbDRNjtbsbMvRKkwkqJl
	rmb6LpLa9UJ97FLQx1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloBY-006kBC-Tw; Fri, 21 Oct 2022 09:19:24 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloBW-006k9P-Nh
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 09:19:24 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MtzLc5nVKzmVHS;
	Fri, 21 Oct 2022 17:14:32 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 17:19:18 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<dedekind@linutronix.de>, <haver@vnet.ibm.com>, <bbrezillon@kernel.org>
CC: <lizetao1@huawei.com>, <boris.brezillon@free-electrons.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Fix use-after-free and kmemleak in ubi_resize_volume()
Date: Fri, 21 Oct 2022 18:21:55 +0800
Message-ID: <20221021102157.1341807-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_021922_969930_9BD8618E 
X-CRM114-Status: UNSURE (   5.97  )
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

This patchset fixes two memory usage issues.

Patch 1 resolves the use-after-free issue, this is happening in volume 
resizing failed. In volume resizing process, the old eba table will be
replaced by the new. But on error handing patch, the old eba will be 
freed, which causing an use-after-free fault when resizing volume
next time.

Patch 2 resolves the kmemleak issue, this is also happening in volume
resizing failed. "new_eba_tbl" is created by ubi_eba_create_table() 
but destroyed by kfree().

Li Zetao (2):
  ubi: Fix use-after-free when volume resizing failed
  ubi: Fix unreferenced object reported by kmemleak in
    ubi_resize_volume()

 drivers/mtd/ubi/vmt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
