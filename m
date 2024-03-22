Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA546C47DD9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 15:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x3I3uvOlDGgiWBWq5DaV+PJNlJJoq5qRj+3SUWkvVmk=; b=K5Cd/PhasS3fcI
	g15kAo9arIptP+r54AxQAxy87iCftgfavxfQeadpHV5lwTp8VBzkpRMRYaU3CequJveamZhgov8WD
	dpbrVn/Hnqxw4Jon/WSTiTOB4qa63viBICvNW3F36ddpGT2CHgVP1NJfUkT8cX/mAa0yuXl54XncN
	O0m1ikJPR9g7DN/6CtWSwGnb/Nj/RzXS9QghttN4HzzpEuJccYuXYiD2a0nlg86QexbMUWDLxIoEV
	txAvo+gNbRD08c1ryC2vumV9CBZhtPv6jcpg8c+7HhNbEr7WccdOflbZOLm7D7fTdVmvjwsEmhjyB
	3dEs8V1OVQMObBkGW6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnh8K-00000007oDh-3KR1;
	Fri, 22 Mar 2024 15:48:40 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnh89-00000007o5e-4BFz
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 15:48:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V1RWh0CDWz1xsCK;
	Fri, 22 Mar 2024 23:46:24 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 420001A0172;
	Fri, 22 Mar 2024 23:48:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Fri, 22 Mar
 2024 23:48:18 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>, <corbet@lwn.net>,
	<kent.overstreet@linux.dev>, <agruenba@redhat.com>
CC: <lizetao1@huawei.com>, <linux-mtd@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v2 0/5] ubifs: Support POSIX Access Control Lists (ACLs)
Date: Fri, 22 Mar 2024 23:48:07 +0800
Message-ID: <20240322154812.215369-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_084830_305465_B42D4B5C 
X-CRM114-Status: UNSURE (   9.23  )
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

Changelog:
v1 -> v2:
  * Adjust patch order.
  * Modify ubifs_xattr_remove to an external function to remove the
  * xattr of ACL.
  * Fix handling of updating file mode via ACL.

v1: https://lore.kernel.org/all/20240319161646.2153867-1-lizetao1@huawei.com/


Li Zetao (5):
  ubifs: Add ACLs config option
  ubifs: Implement POSIX Access Control Lists (ACLs)
  ubifs: Initialize or update ACLs for inode
  ubifs: Support accessing ACLs through inode_operations
  ubifs: Introduce ACLs mount options

 Documentation/filesystems/ubifs.rst |   4 +
 fs/ubifs/Kconfig                    |  14 ++
 fs/ubifs/Makefile                   |   1 +
 fs/ubifs/acl.c                      | 192 ++++++++++++++++++++++++++++
 fs/ubifs/dir.c                      |  22 ++++
 fs/ubifs/file.c                     |   6 +
 fs/ubifs/super.c                    |  41 ++++++
 fs/ubifs/ubifs.h                    |  16 +++
 fs/ubifs/xattr.c                    |   3 +-
 9 files changed, 297 insertions(+), 2 deletions(-)
 create mode 100644 fs/ubifs/acl.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
