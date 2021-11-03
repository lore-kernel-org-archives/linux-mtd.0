Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7543BC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 01:21:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B64E61073
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 01:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B64E61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aaqudUK2sQb7YKTFlEboRMGxmjCPB9ZhMwS1a99YgF0=; b=LbWSMvr6X/wafH
	D72764rOSxomUnkNDlFCQgSFALZaMjjg+TDQqU2CoCA8AWUNzZw3GHjocj+t83i2LKzocvgGA5J5z
	es1ePSJ/qnS2ZyNr6rWtOr39lKzCMFApd2rIoHxsj4/urPQhxE021q8BQx4BDzUKtWQbp1qDlhl59
	xzm45u11qxJxXlajWi2eQ9a1oo/Tt6jLLo6qCi84QE9hEm/nrdi41d2BCikyUNS/Gqzd63dmke9Nl
	Fti3vlG3ayaQ613Ep2tU0NeO+y0T9GHEv32A2Sxd+aXKzLhNvUFo+j5SHtQ7vTNo+ktQv00cO1p9z
	1/nmZ3UUAdg+DGuNqruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi4x7-003jPN-RC; Wed, 03 Nov 2021 01:20:33 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi4ws-003jLE-7j
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 01:20:20 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HkTRF10q4z1DHBw;
 Wed,  3 Nov 2021 09:18:01 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 09:20:05 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 09:20:04 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patchwork@huawei.com>, <libaokun1@huawei.com>, <yukuai3@huawei.com>,
 <chengzhihao1@huawei.com>
Subject: [PATCH -next V2 0/2] ubi: fix race between ctrl_cdev_ioctl and
 ubi_cdev_ioctl
Date: Wed, 3 Nov 2021 09:32:47 +0800
Message-ID: <20211103013249.498805-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_182019_154426_3D4320BC 
X-CRM114-Status: UNSURE (   6.02  )
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

The lock held by ctrl_cdev_ioctl is ubi_devices_mutex, but the lock held by
ubi_cdev_ioctl is ubi->device_mutex. Therefore, the two locks can be
concurrent.

ubi_attach_mtd_dev in ctrl_cdev_ioctl may be race with ubi_create_volume and
ubi_remove_volume in ubi_cdev_ioctl. Because ubi_attach_mtd_dev has similar
ubi_free_volume and ubi_open_volume. These two functions are called in
uif_init and uif_close, and we'll fix both races in this patch set.

Another function in ctrl_cdev_ioctl, ubi_detach_mtd_dev, uses reference
counting and ubi_devices_lock to avoid race in concurrency cases,
so we do not need to fix it.

V1->V2:
	Add race in uif_close

Baokun Li (2):
  ubi: fix race between volume operations and uif_init
  ubi: fix race between volume operations and uif_close

 drivers/mtd/ubi/build.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
