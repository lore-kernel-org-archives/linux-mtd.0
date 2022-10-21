Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98AAC43219
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 02:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sIwwclTpKE+6vYcPSdCk2P5OlBY0fIox3yNhI6dspjo=; b=VfSO9xn4h8SOOY
	8b+qCXphMp60HydjfoEVQlLGalhoosYAJzw7h1NLJhMf4kI661zLlL/4tIjsJHgQ/WQ+rq7TP4Bg7
	6EhPkV8ez4SQAkwlxAr7waXuFbFHvnn2yjEfLw+yz/bN0R28akE4QiR91v1rWdDjMIQ9678p+WZp/
	/l8zGVk147OPxrRr2nvZ1Rf76WoOhocI+FnruygyKYUC4tmHaFRwqiMmgW2fNDWVDVVbZft/KXKPI
	Vwm8HT28B44nSqhKrm1MSREfgrmxD4fBLJwrtAqxy/YcIsUdup6XTSppjPUR0omJr1N3OzHjCG1xV
	UB4c8St19qo9YWvgGhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgP-004PJT-JS; Fri, 21 Oct 2022 02:22:49 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgK-004PEm-5n
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 02:22:46 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtpC82VSGzHvDB;
	Fri, 21 Oct 2022 10:22:28 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:36 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:35 +0800
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
Subject: [PATCH 00/11] fix memory leak while kset_register() fails
Date: Fri, 21 Oct 2022 10:20:51 +0800
Message-ID: <20221021022102.2231464-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_192244_421830_E04BEAD1 
X-CRM114-Status: UNSURE (   9.75  )
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

The previous discussion link:
https://lore.kernel.org/lkml/0db486eb-6927-927e-3629-958f8f211194@huawei.com/T/

kset_register() is currently used in some places without calling
kset_put() in error path, because the callers think it should be
kset internal thing to do, but the driver core can not know what
caller doing with that memory at times. The memory could be freed
both in kset_put() and error path of caller, if it is called in
kset_register().

So make the function documentation more explicit about calling
kset_put() in the error path of caller first, so that people
have a chance to know what to do here, then fixes this leaks
by calling kset_put() from callers.

Liu Shixin (1):
  ubifs: Fix memory leak in ubifs_sysfs_init()

Yang Yingliang (10):
  kset: fix documentation for kset_register()
  kset: add null pointer check in kset_put()
  bus: fix possible memory leak in bus_register()
  kobject: fix possible memory leak in kset_create_and_add()
  class: fix possible memory leak in __class_register()
  firmware: qemu_fw_cfg: fix possible memory leak in
    fw_cfg_build_symlink()
  f2fs: fix possible memory leak in f2fs_init_sysfs()
  erofs: fix possible memory leak in erofs_init_sysfs()
  ocfs2: possible memory leak in mlog_sys_init()
  drm/amdgpu/discovery: fix possible memory leak

 drivers/base/bus.c                            | 4 +++-
 drivers/base/class.c                          | 6 ++++++
 drivers/firmware/qemu_fw_cfg.c                | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++--
 fs/erofs/sysfs.c                              | 4 +++-
 fs/f2fs/sysfs.c                               | 4 +++-
 fs/ocfs2/cluster/masklog.c                    | 7 ++++++-
 fs/ubifs/sysfs.c                              | 2 ++
 include/linux/kobject.h                       | 3 ++-
 lib/kobject.c                                 | 5 ++++-
 10 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
