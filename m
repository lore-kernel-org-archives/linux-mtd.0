Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDDEC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 02:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uATwSLocJPWtcxyYYL7QN/fBMIErjlirrPeEXAWVZ28=; b=raABtMejgo7Ruv
	68aJZLfXGfssikoeSLZITyDCi+Y6Q4I4HZ13VM9KVz2uN3TQjrfkHR/l0/FJK/9oOaqFpOB7qtON4
	wQSEg4FItWDxw+ykaW3kS3Lb181FPeFxl9xvdIq5SzUPlTUrg+5AtZNbAFWPVjlXgp3kh0HF2/RQG
	zTGbyeFLSci4HOq/KDU0e0yNdb+IlG6NqhjNenxRN7KSIGpnebnHsFihGQSWo3Wts5yKRBW0aXNVL
	MKQuhzkDfYwGLgpDgWrgp5JfrpfZJJY+eewX7vjtrhRjcIlz6drc39xs70CgcCrc7ISQUlnLdNz0X
	TItp+jBimfqwhQQsSeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgN-004PI4-Bj; Fri, 21 Oct 2022 02:22:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgK-004PFA-Cx
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 02:22:45 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mtp5s2PGmzmVHX;
	Fri, 21 Oct 2022 10:17:53 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:39 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:38 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
	<linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
	<ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
	<amd-gfx@lists.freedesktop.org>
CC: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <somlo@cmu.edu>,
	<mst@redhat.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
	<hsiangkao@linux.alibaba.com>, <huangjianan@oppo.com>, <mark@fasheh.com>,
	<jlbec@evilplan.org>, <joseph.qi@linux.alibaba.com>,
	<akpm@linux-foundation.org>, <alexander.deucher@amd.com>,
	<luben.tuikov@amd.com>, <richard@nod.at>, <liushixin2@huawei.com>
Subject: [PATCH 03/11] bus: fix possible memory leak in bus_register()
Date: Fri, 21 Oct 2022 10:20:54 +0800
Message-ID: <20221021022102.2231464-4-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021022102.2231464-1-yangyingliang@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_192244_629604_C7337BE5 
X-CRM114-Status: GOOD (  10.57  )
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

Inject fault while loading module (e.g. edac_core.ko), kset_register()
may fail in bus_register(), if it fails, but the refcount of kobject is
not decreased to 0, the name allocated in kobject_set_name() is leaked.
To fix this by calling kset_put(), so that name can be freed in callback
function kobject_cleanup().

unreferenced object 0xffff888103bddb68 (size 8):
  comm "systemd-udevd", pid 341, jiffies 4294903262 (age 42.212s)
  hex dump (first 8 bytes):
    65 64 61 63 00 00 00 00                          edac....
  backtrace:
    [<000000009e31d566>] __kmalloc_track_caller+0x1ae/0x320
    [<00000000e4cfd8de>] kstrdup+0x3a/0x70
    [<000000003d0ec369>] kstrdup_const+0x68/0x80
    [<000000008e5c3b20>] kvasprintf_const+0x10b/0x190
    [<00000000b9a945aa>] kobject_set_name_vargs+0x56/0x150
    [<000000000df9278c>] kobject_set_name+0xab/0xe0
    [<00000000f51dc49f>] bus_register+0x132/0x350
    [<000000007d91c2e5>] subsys_register+0x23/0x220

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/base/bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 7ca47e5b3c1f..301b5330f9d8 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -804,8 +804,10 @@ int bus_register(struct bus_type *bus)
 	priv->drivers_autoprobe = 1;
 
 	retval = kset_register(&priv->subsys);
-	if (retval)
+	if (retval) {
+		kset_put(&priv->subsys);
 		goto out;
+	}
 
 	retval = bus_create_file(bus, &bus_attr_uevent);
 	if (retval)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
