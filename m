Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC6C3DA41
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 03:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZRXJv25j8SyCbMxWkSia6/XgLebbXB7b48sel9ghTp4=; b=dZ37BtioCfziWi
	ZJd+v7wGb0SkFpKC1KEO5X3/hxcgG3ok2j99LVT5rsa63Q3aqijbDGp/Qeaum11W36REnZpaoCTI3
	fd/CG8p60PgyiDpbwTzyh+mKea+me5jcla6gMs/UZrcUrdjso9eeGIUGMnXD8Tr0S8p0X3ZxhPrS9
	nFLSfa91VELb/rApVqR7MhFOxvfFIJqwp/s3quzcW0nRZXy8E+DB33bhAeMUcjlSjcJQrrmwidNl/
	z6APfsmKNCz+1/tcfxUL76BEWhHiky+0UEHb/HGqbaGvRuUhm3srvS7H/A2Cf/7JEKE8/EgsA8H8H
	v++8begZ33I9Ku3eep6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRk8m-0000000CWd3-2fBp;
	Thu, 11 Jul 2024 03:06:40 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRk8j-0000000CWa4-02fw
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 03:06:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WKKJh2Ns8z2Cl7k;
	Thu, 11 Jul 2024 11:02:12 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 6053B1A0188;
	Thu, 11 Jul 2024 11:06:25 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemd200001.china.huawei.com
 (7.185.36.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 11 Jul
 2024 11:06:24 +0800
From: Wang Zhaolong <wangzhaolong1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>, <chengzhihao1@huawei.com>
Subject: [RFC 0/1] ubifs: inode deletion deadlock 
Date: Thu, 11 Jul 2024 11:06:23 +0800
Message-ID: <20240711030624.266440-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_200637_231996_E5FC53A4 
X-CRM114-Status: UNSURE (   8.08  )
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

Hi.

While the previous patch set [1] aimed to address the ABBA deadlock between
inode reclaiming and deleted inode writing, I discovered that the problem
still persists in the form of an AA deadlock after applying those changes.

The core issue is that although [1] avoids the ABBA deadlock by getting the
xattr inodes before locking BASEHD's wbuf->io_mutex. But the inode reclaiming
process can still get stuck waiting for the xattr inodes that have already
been marked as I_FREEING.

root@debian:~# cat /proc/537/stack
[<0>] __wait_on_freeing_inode+0xb2/0xf0
[<0>] find_inode_fast.isra.0+0x63/0xb0
[<0>] iget_locked+0x72/0x1c0
[<0>] ubifs_iget+0x3e/0x5c0 [ubifs]
[<0>] ubifs_jnl_write_inode+0x11f/0x6c0 [ubifs]
[<0>] ubifs_evict_inode.cold+0x39/0x6a [ubifs]
[<0>] evict+0xd1/0x1a0
[<0>] inode_lru_isolate+0x238/0x2b0
[<0>] __list_lru_walk_one+0x77/0x150
[<0>] list_lru_walk_one+0x4a/0x70
[<0>] prune_icache_sb+0x49/0x80
[<0>] super_cache_scan+0x124/0x1b0
[<0>] do_shrink_slab+0x13e/0x2c0
[<0>] shrink_slab+0xac/0x2b0
[<0>] drop_slab_node+0x45/0x90
[<0>] drop_slab+0x38/0x70
[<0>] drop_caches_sysctl_handler+0x74/0x90
[<0>] proc_sys_call_handler+0x143/0x260
[<0>] new_sync_write+0x116/0x1c0
[<0>] vfs_write+0x1b7/0x250
[<0>] ksys_write+0x5f/0xe0
[<0>] do_syscall_64+0x33/0x40
[<0>] entry_SYSCALL_64_after_hwframe+0x67/0xd1
root@debian:~# cat /proc/541/stack
[<0>] __wait_on_freeing_inode+0xb2/0xf0
[<0>] find_inode_fast.isra.0+0x63/0xb0
[<0>] iget_locked+0x72/0x1c0
[<0>] ubifs_iget+0x3e/0x5c0 [ubifs]
[<0>] ubifs_jnl_write_inode+0x11f/0x6c0 [ubifs]
[<0>] ubifs_evict_inode.cold+0x39/0x6a [ubifs]
[<0>] evict+0xd1/0x1a0
[<0>] do_unlinkat+0x1df/0x2f0
[<0>] do_syscall_64+0x33/0x40
[<0>] entry_SYSCALL_64_after_hwframe+0x67/0xd1

The root cause of the problem lies in two aspects:

1. UBIFS uses inodes to represent xattrs.
2. During the eviction process, iget_locked(), which waits for I_FREEING,
   is called again.

Therefore, in this patch, I aim to provide a solution that avoids
waiting within the eviction process. However, I must admit that my
current code implementation is not very elegant and could be improved.

Wang Zhaolong (1):
  ubifs: avoid deadlock when deleting an inode with xattr

 fs/ubifs/journal.c | 42 ++++++++++++++++++++++++++++++++++--------
 fs/ubifs/super.c   | 15 +++++++++++++++
 fs/ubifs/ubifs.h   |  1 +
 fs/ubifs/xattr.c   | 12 +++++++-----
 4 files changed, 57 insertions(+), 13 deletions(-)

-- 
2.34.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
