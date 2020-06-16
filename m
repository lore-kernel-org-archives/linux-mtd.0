Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12AEC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:11:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73EFE2074D
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/VUgSK3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73EFE2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FsI69GeRlz1XESZTrfXVvCJOZunvg6mb5vplHS0M+pc=; b=G/VUgSK3LHhslh
	xyzDr8CwodhSmANEY1ekXGA02LH9PN5ZAWzie3AsoaoOkncAmHSXGTvPbdNCrBQgwg7MhJBhhKrkZ
	VjQAHYTaVsBKS0RJbql5/zocomfqGJaefmFI/80SaPjo1y+BrvLDkTyqUyGzgK8c8xKhnfktIVdeb
	lznrX0vTufrBnj+2RU64vOAaol7xE5DUnav7aXAFo5Lck8FERZm9zBg/cwaPOGwKePT4gp9E13FT4
	Zus4c3bJhPV67yRa1VRB1pyqVqtjX+hcd3vyu8u/8xTdzTnh8XL8wrlLzYQfrkJkid5RBcVjyVUjd
	TPuQJz0wnVr/0dSRNhbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl5ke-00074p-OT; Tue, 16 Jun 2020 07:11:20 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl5kD-0006bl-73
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 07:10:55 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AC51B34C361747865690;
 Tue, 16 Jun 2020 15:10:38 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 16 Jun 2020
 15:10:31 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC 0/5] ubifs: Prevent memory oob accessing while dumping node
Date: Tue, 16 Jun 2020 15:11:41 +0800
Message-ID: <20200616071146.2607061-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_001054_419465_6FEADFED 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, liu.song11@zte.com.cn, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We use function ubifs_dump_node() to dump bad node caused by some
reasons (Such as bit flipping caused by hardware error, writing bypass
ubifs or unknown bugs in ubifs). The node content can not be trusted
anymore, so we should prevent memory out-of-bounds accessing while
dumping node in following situations:

1. bad node_len: Dumping data according to 'ch->len' which may exceed
   the size of memory allocated for node.
2. bad node content: Some kinds of node can record additional data, eg.
   index node and orphan node, make sure the size of additional data
   not beyond the node length.
3. node_type changes: Read data according to type A, but expected type
   B, before that, node is allocated according to type B's size. Length
   of type A node is greater than type B node.

Commit acc5af3efa303d5f3 ("ubifs: Fix out-of-bounds memory access caused
by abnormal value of node_len") handles situation 1 for data node only,
it would be better if we can solve problems in above situations for all
kinds of nodes.

Patch 1 adds a new parameter 'node_len'(size of memory which is allocated
for the node) in function ubifs_dump_node(), safe dumping length of the
node should be: minimum(ch->len, c->ranges[node_type].max_len, node_len).
Besides, c->ranges[node_type].min_len can not greater than safe dumping
length, which may caused by node_type changes(situation 3).

Patch 2 reverts commit acc5af3efa303d5f ("ubifs: Fix out-of-bounds memory
access caused by abnormal value of node_len") to prepare for patch 3.

Patch 3 replaces modified function ubifs_dump_node() in all node dumping
places except for ubifs_dump_sleb().

Patch 4 removes unused function ubifs_dump_sleb(),

Patch 5 allows ubifs_dump_node() to dump all branches of the index node.

Some tests after patchset applied:
https://bugzilla.kernel.org/show_bug.cgi?id=208203

Zhihao Cheng (5):
  ubifs: Limit dumping length by size of memory which is allocated for
    the node
  Revert "ubifs: Fix out-of-bounds memory access caused by abnormal
    value of node_len"
  ubifs: Pass node length in all node dumping callers
  ubifs: ubifs_dump_sleb: Remove unused function
  ubifs: ubifs_dump_node: Dump all branches of the index node

 fs/ubifs/commit.c   |   4 +-
 fs/ubifs/debug.c    | 111 ++++++++++++++++++++++++++------------------
 fs/ubifs/debug.h    |   5 +-
 fs/ubifs/file.c     |   2 +-
 fs/ubifs/io.c       |  37 +++++----------
 fs/ubifs/journal.c  |   3 +-
 fs/ubifs/master.c   |   4 +-
 fs/ubifs/orphan.c   |   6 ++-
 fs/ubifs/recovery.c |   6 +--
 fs/ubifs/replay.c   |   4 +-
 fs/ubifs/sb.c       |   2 +-
 fs/ubifs/scan.c     |   4 +-
 fs/ubifs/super.c    |   2 +-
 fs/ubifs/tnc.c      |   8 ++--
 fs/ubifs/tnc_misc.c |   4 +-
 fs/ubifs/ubifs.h    |   4 +-
 16 files changed, 108 insertions(+), 98 deletions(-)

-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
