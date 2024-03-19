Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307C6CD11DC
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FOAIxsh+NQf4dCP51SqYdqBr671vKPJ1r2H2GtTvas4=; b=xNrb68xgVnJPYX
	Czacjnoylqp2oAOGdttQJBrnRKh61S/b3L6d2Lg7PQ15FQq2Q1NhV6AT5ZdU3IUHNQbfHGQMlSo2J
	a89Em19OzZAYYBraQRvju2EQPXc4Zt0Vs5WOWbYia8T8eHRoOrusUGyMkXDVg6xoPF6vPNWyXguoq
	Nwor5nrasSxpDVlDRsuRAVzlfV6V7QLxy7Ah6y7kTvoC1blvCqUUtaCjDZcJkqsCWhbIhG3bFoByj
	ML4dr9CDE0hGce+uxYTgkkvNIXffGDt2P0W36VJsYhpe2o+XVzoRK/mKeEjXu4ILpWQdZDWIfBKMo
	5BrDtEtb2Z79YJK/v99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9J-0000000DKJ5-3W5Z;
	Tue, 19 Mar 2024 16:17:13 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9C-0000000DKE2-2mG7
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 16:17:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TzcKr6RmDz1HBj3;
	Wed, 20 Mar 2024 00:16:32 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 5324D18001A;
	Wed, 20 Mar 2024 00:16:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Wed, 20 Mar
 2024 00:16:54 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <lizetao1@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 0/5] ubifs: Support POSIX Access Control Lists (ACLs)
Date: Wed, 20 Mar 2024 00:16:41 +0800
Message-ID: <20240319161646.2153867-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_091707_017903_0A68E6F6 
X-CRM114-Status: UNSURE (   8.16  )
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

Hi,

This patchset is base on [1] and [2], adding implementation of ACLs for
ubifs.

Implement ACLs features based on POSIX to solve some difficulties that
require fine-grained access control. At the same time, it is also to
facilitate cross-file system migration.

In order to simplify the implementation, only v2 version POSIX ACLs are
implemented, eliminating the need for in-memory and on-flash format
conversion. And no need to implement security xattr handler in ubifs.

Some testcases have been tested and passed:
  * generic testcases (modified version) for acl group in xfstest[3], they are generic/026/053/077/099/105/237/307/318/319/375/389/444/449/529/697.
  * tacl_xattr.sh (modified version) in LTP[4].

[1]: https://lore.kernel.org/linux-mtd/1441962597-13543-1-git-send-email-shengyong1@huawei.com/
[2]: https://lore.kernel.org/linux-mtd/1476046382-19185-1-git-send-email-pascal.eberhard@gmail.com/
[3]: https://kernel.googlesource.com/pub/scm/fs/xfs/xfstests-dev/+/refs/heads/master/tests/generic/
[4]: https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/acl/tacl_xattr.sh

Li Zetao (5):
  ubifs: Implement POSIX Access Control Lists (ACLs)
  ubifs: Initialize or update ACLs for inode
  ubifs: Support accessing ACLs through inode_operations
  ubifs: Introduce ACLs mount options
  ubifs: Add ACLs config option

 fs/ubifs/Kconfig  |  14 +++++
 fs/ubifs/Makefile |   1 +
 fs/ubifs/acl.c    | 140 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/dir.c    |  18 ++++++
 fs/ubifs/file.c   |   6 ++
 fs/ubifs/super.c  |  40 +++++++++++++
 fs/ubifs/ubifs.h  |  15 +++++
 fs/ubifs/xattr.c  |   1 -
 8 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 fs/ubifs/acl.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
