Return-Path: <SRS0=Sdmk=LH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339D4C48BCF
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF7206100B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF7206100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SHFFJBtrHtLQaZ9JwaV71jbafahMIN5RJKfMaIvmzfQ=; b=xNcegmeoAxLRzL
	/GcIVYp+DJbAkhJsqHcJrkLRr9DvfxVfIfIyUMpXH1RnslLTykZp8LCqD/PGTuqnDa2fG1eG0yfSu
	0Dw14iPDjOkRJ1+4M9kQ2ddsiMo7mPND7yP/alD4wMLetyMyuePIoaaqYddVdZGVsRQ3HLQjNXwWK
	Jp4W5N4legmStUxjd3lZmUB8gQTLD/n2ptU3KNP+pvA7nBqfdNC3wJ93220HDiVm6o8F48mZ75qKZ
	/KIyM9WhNBDseC1JE/nOpYEJee1pL74PfZ7Cy/sztOLsL5l14ZqT6AuQdycwke6YNyY8ipqQPE1wG
	86oxaFVMgN3nR9Wjx86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOC0-00AISP-Lv; Sun, 13 Jun 2021 11:22:16 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOBy-00AIRn-C4
 for linux-mtd@lists.infradead.org; Sun, 13 Jun 2021 11:22:15 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G2sWq6ZQqz6x0v;
 Sun, 13 Jun 2021 19:18:15 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 13 Jun 2021 19:22:11 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 13
 Jun 2021 19:22:11 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 0/6] Fix deadlock in ftl formating on mtd
Date: Sun, 13 Jun 2021 19:30:29 +0800
Message-ID: <20210613113035.2329421-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_042214_594987_E276E6F5 
X-CRM114-Status: UNSURE (   4.32  )
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

There is an AA-deadlock problem while formating mtd device to generate
a ftl device. Fix it by reverting "mtd: allow to unload the mtdtrans
module if its block devices aren't open" recommended in [1].

[<0>] blktrans_open+0x47/0x340            LOCK(mtd_table_mutex)
[<0>] __blkdev_get+0x5b/0x3e0
[<0>] blkdev_get_by_dev+0x18f/0x370
[<0>] __device_add_disk+0x2db/0x700
[<0>] device_add_disk+0x17/0x20
[<0>] add_mtd_blktrans_dev+0x39e/0x6d0
[<0>] ftl_add_mtd+0x792/0x908 [ftl]
[<0>] register_mtd_blktrans+0xfb/0x170    LOCK(mtd_table_mutex)
[<0>] ftl_tr_init+0x18/0x1000 [ftl]
[<0>] do_one_initcall+0x71/0x330
[<0>] do_init_module+0xa6/0x350

[1] http://lists.infradead.org/pipermail/linux-mtd/2017-March/072899.html

Zhihao Cheng (6):
  Revert "mtd: blkdevs: fix potential deadlock + lockdep warnings"
  Revert "mtd: fix: avoid race condition when accessing mtd->usecount"
  Revert "mtd: mtd_blkdevs: don't increase 'open' count on error path"
  Revert "mtd: mtd_blkdevs: fix error path in blktrans_open"
  Revert "mtd: Remove redundant mutex from mtd_blkdevs.c"
  Revert "mtd: allow to unload the mtdtrans module if its block devices
    aren't open"

 drivers/mtd/mtd_blkdevs.c | 77 +++++++++++++++------------------------
 1 file changed, 30 insertions(+), 47 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
