Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CBAC47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 12:44:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF58161279
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 12:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF58161279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iZ9uktJEv1Yd+CGbcvkEDeDWCkoNY3958xdlAmc9xiU=; b=gKeZlAVxF6+tM6
	kJAJ4zUjJyERCFuYSyJx/Dbq0d2mTaENg/k57oZx99S7QxLg7eSJ+nTygldgMRk2OnJUO+szXrLuc
	VmRJsc9u8hbBAOA4d103ymuuUwFlakCMn0ska5y5lue51PG7D+fN/V8zVMFt+xW/EEoh5svesIWHb
	OM58h343qeRe+WKA8rLSjvGcvCnF7la2qTlqimI3F/6mMBpAfa582xjuOW4bVvwiCA8ZlVKTY4S9r
	j7lrcqqru/kQDmbZIwNO6sKAfNn0MSpia3e/pamn+k3ibuM7Hmtg2d+ioDwyvzOHSJEXs9IyS6/Oy
	aJhJKT8tot2yMzNqhhow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnhG2-00CClR-KD; Mon, 31 May 2021 12:43:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnhFz-00CCjz-JS
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 12:43:01 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ftvy36PLvz67W2;
 Mon, 31 May 2021 20:39:55 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 20:42:52 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 20:42:51 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <yangds.fnst@cn.fujitsu.com>, <s.hauer@pengutronix.de>
CC: <yi.zhang@huawei.com>, <houtao1@huawei.com>, <yukuai3@huawei.com>,
 <chengzhihao1@huawei.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ubifs: Fixes for xattr concurrent operations
Date: Mon, 31 May 2021 20:52:08 +0800
Message-ID: <20210531125210.1173922-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_054259_830264_9D0313F1 
X-CRM114-Status: UNSURE (   6.04  )
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

UBIFS may occur some problems with concurrent xattr_{set|get} and
listxattr operations, such as assertion failure, memory corruption,
stale xattr value[1].

Patch 1: Import a new rw-lock in @ubifs_inode to serilize write
	 operations on xattr
Patch 2: Remove unnecessary ui_mutex in ubifs_xattr_get and change_xattr

BTW changing @host->ui_mutex to a rw lock to adapting xattr operations
is a risky method, since @host->ui_mutex acts as too many roles:
* serializes inode write-back with the rest of VFS operations(such as
  rename, mkdir, rmdir, create, eg.)
* serializes "clean <-> dirty" state changes, serializes bulk-read
* protects @dirty, @bulk_read, @ui_size, and @xattr_size

Besides, if xattr operations and io/vfs operations share same rw-lock,
xattr operations may effect UBIFS performance more or less.

[1] https://lore.kernel.org/linux-mtd/20200630130438.141649-1-houtao1@huawei.com

Zhihao Cheng (2):
  ubifs: Fix races between xattr_{set|get} and listxattr operations
  ubifs: Remove ui_mutex in ubifs_xattr_get and change_xattr

 fs/ubifs/super.c |  1 +
 fs/ubifs/ubifs.h |  2 ++
 fs/ubifs/xattr.c | 48 +++++++++++++++++++++++++++++++++---------------
 3 files changed, 36 insertions(+), 15 deletions(-)

-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
