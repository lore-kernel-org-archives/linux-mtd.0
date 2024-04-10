Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36991CD1297
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=we1caeX8Gtd1ErlYvFHurEw2MC1fXUaqaVeaq2PZLCw=; b=FnZhczLDaBRu61
	TpJSpxM+kbqS0FID0z6yBMG6cBetjZClWoWb2tabxTLzfArI2OlvpMC1kIGuy3/bfi8TXg8X1D5+S
	WxJUM6N9y4MrUGy79AKXTGgk5gcULdZcd1xPjb4v0c6wfXQmnheQCO3cxDtdZ9gju/HcvClR3nznU
	5GGOwaSW6v/DCwyzn7NWNEq9ecaplpfj4gcnn0xMn8xlz+M/N9CWegh0EpZOItQe7oAmfzX2cMkIM
	US5RTHEYpe32cWZk83TMzRcQIvfavbXk3Fb9TPfVKB+zWXyMZwD7gTGPhbjYns+062vuPFZe5KEF1
	+P5lOihJIbR7jTbOinrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfB-00000005gG3-1dfl;
	Wed, 10 Apr 2024 07:46:33 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf6-00000005gAH-0gj0
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:30 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4VDvxv3t04z21kf6;
	Wed, 10 Apr 2024 15:45:23 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id E21D718001A;
	Wed, 10 Apr 2024 15:46:18 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:18 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 0/9] ubifs: Fix a serious of inconsistent problems when powercut happens
Date: Wed, 10 Apr 2024 15:37:42 +0800
Message-ID: <20240410073751.2522830-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004628_401792_33EC4CA0 
X-CRM114-Status: UNSURE (   5.81  )
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

UBIFS is tolerant of powercut, this patchset fix some inconsistent
problems when powercut happens.
Xfstests,mtd-utils and powercut tests[1] are passed(Enable chk* debugging)
after this patchset applied.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=218309

performance regression:

4GB nandsim 256KB PEB 4KB page

1. fio

direct=0
bs=4k
sync=0
iodepth=128
rw=write
iodepth_batch_complete=1
iodepth_batch=1
numjobs=1
directory=/root/temp
size=1G
runtime=20s
time_based=1
                         before     after
1 thread seq write      412MiB/s   409MiB/s
1 thread random write   402MiB/s   397MiB/s
4 thread seq write      163MiB/s   164MiB/s
4 thread random write   162MiB/s   160MiB/s

2. fsmark
fs_mark -d /root/temp -s 10240 -n 1000
      before               after
   7131 Files/sec       7090 Files/sec


Zhihao Cheng (9):
  ubifs: Fix unattached xattr inode if powercut happens after deleting
  ubifs: Don't add xattr inode into orphan area
  Revert "ubifs: ubifs_symlink: Fix memleak of inode->i_link in error
    path"
  ubifs: Remove insert_dead_orphan from replaying orphan process
  ubifs: Fix adding orphan entry twice for the same inode
  ubifs: Move ui->data initialization after initializing security
  ubifs: Fix space leak when powercut happens in linking tmpfile
  ubifs: Fix unattached inode when powercut happens in creating
  ubifs: dbg_orphan_check: Fix missed key type checking

 fs/ubifs/dir.c     |  91 +++++++++++++++-----------
 fs/ubifs/journal.c |  14 +++-
 fs/ubifs/orphan.c  | 155 ++++++++-------------------------------------
 fs/ubifs/ubifs.h   |   7 +-
 fs/ubifs/xattr.c   |   2 +-
 5 files changed, 92 insertions(+), 177 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
