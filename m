Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3617CC41535
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 02:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+WCNQcg7WXGP19nBcxqzcQytqJRlwB4WMfyTsohx+s=; b=GwRwSVtzU75HaC
	e2XFDsA8sSzx4o4355+whFsaG2tGK2ULIdd/35VnTaO/MknfNh9L9DhvIVYA04bf1t5QHTG4IAEXz
	k0QPIvOAqyEeBJFi96RQpCzUQ4YivHjDkGczeZCcLHaYGI4vNln5tAxcedgiKeMSaG79WIuN5xl0b
	H+QAlp3JV1JnoLR6RcWy2gu4d8UF78EsFugbGtc8Ks+5fUnDCQyMNBWzDr9f7dpkdRukzAcNWavh6
	Bd4+orA+WljYWruhZ4NM0PR62mU7H/TPGv8sUbzdq6Kdw/Ief8JylbaQx51xsNFhMVLtLEJ5G/Hau
	51Dr4MxiQs/Jmt4hMOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgW-004PMz-CP; Fri, 21 Oct 2022 02:22:56 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgL-004PFP-R4
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 02:22:48 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mtp5w3XNvz1P7D4;
	Fri, 21 Oct 2022 10:17:56 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:42 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:41 +0800
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
Subject: [PATCH 06/11] firmware: qemu_fw_cfg: fix possible memory leak in fw_cfg_build_symlink()
Date: Fri, 21 Oct 2022 10:20:57 +0800
Message-ID: <20221021022102.2231464-7-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021022102.2231464-1-yangyingliang@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_192246_077321_890B4B2F 
X-CRM114-Status: GOOD (  10.68  )
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

Inject fault while loading module, kset_register() may fail, if
it fails, but the refcount of kobject is not decreased to 0, the
name allocated in kobject_set_name() is leaked. To fix this by
calling kset_put(), so that name can be freed in callback function
kobject_cleanup() and 'subdir' is freed in kset_release().

unreferenced object 0xffff88810ad69050 (size 8):
  comm "swapper/0", pid 1, jiffies 4294677178 (age 38.812s)
  hex dump (first 8 bytes):
    65 74 63 00 81 88 ff ff                          etc.....
  backtrace:
    [<00000000a80c7bf1>] __kmalloc_node_track_caller+0x44/0x1b0
    [<000000003f0167c7>] kstrdup+0x3a/0x70
    [<0000000049336709>] kstrdup_const+0x41/0x60
    [<00000000175616e4>] kvasprintf_const+0xf5/0x180
    [<000000004bcc30f7>] kobject_set_name_vargs+0x56/0x150
    [<000000004b0251bd>] kobject_set_name+0xab/0xe0
    [<00000000700151fb>] fw_cfg_sysfs_probe+0xa5b/0x1320

Fixes: 246c46ebaeae ("firmware: create directory hierarchy for sysfs fw_cfg entries")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/firmware/qemu_fw_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a69399a6b7c0..d036e69cabbb 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -544,7 +544,7 @@ static int fw_cfg_build_symlink(struct kset *dir,
 			}
 			ret = kset_register(subdir);
 			if (ret) {
-				kfree(subdir);
+				kset_put(subdir);
 				break;
 			}
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
