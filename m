Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9172AC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F89B60E97
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F89B60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v5ZJQdbGb1tEWQCIJvVvdEG2R1ewucQM4FzZzehc6FM=; b=JI7y8qNyultzt+
	erTx4H4495uRzcrZ0Z8+K6I+0KtuTFH+iteE4EB/cnt5hTKDrnFURYSPfZDn0iQZbusMrKBlIy8dY
	VV/S5/+XvifBY8bx8TYWhrJNqU0auUfUGVhf5Bk5GdQJz84mNWYwtG/fjWryuO9/KPB+J8PnHzWdR
	HSlCnw7M/94hdrxReVXhUtpelrm3wZs2XnhzAul0dTE+TK7Pcs9c9lP3XYzYKcEOjiwE1akeOM6nA
	XmpCuiv668cQcHGE4zyNX7QJ9iMtClNDJlWGPHGdGibDAr3OTfGlIx3+r7wfAE/bWJ7SvDybV6RJm
	QHsCVG57F4tOpTLYCZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjOkZ-00D6S7-Mm; Sat, 06 Nov 2021 16:41:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKcb-00Cynx-Nx
 for linux-mtd@bombadil.infradead.org; Sat, 06 Nov 2021 12:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vCEIsmwpV3Aejsk9QVoOWMRrKqEFs1qq9QlV17YrnD0=; b=bRCthmqEx58WZu0xIB2n7eZ143
 /sYVbfnYdw5ckmsHr83r9a/CWSOjrVk4WPQy953Af3IXgRY5xgRnJzt44UkU34EleGdxg1AKtRFp2
 PnqgVpEekiNVdRQII7oUy+TLuwL5Y3OQQSNPrDUzGyaExij80wXYzJ9mS16W7wFodyuM17Ahz9KTP
 exR5RN1Mch20e2yWMyrstIWH0womcwOaGnOXDjt8GYc9PI0MGVP3KP3ABKLAQYZf+cyuNP/o79tWo
 7LNMhpn1co1VxYNGa0iRt0H4LPDCmt1s3GR0gLfdaaM1Y3B1NZQqMptinSSuQx8nax/4HHbr6fWCJ
 CMYyT81g==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKap-007Cwc-CQ
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 12:15:44 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HmbnS1yhwz8v8V;
 Sat,  6 Nov 2021 20:11:08 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 20:12:40 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Sat, 6 Nov
 2021 20:12:39 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 00/12] Some bugfixs for ubi/ubifs
Date: Sat, 6 Nov 2021 20:25:05 +0800
Message-ID: <20211106122517.3304628-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_121512_797689_C4AB9E40 
X-CRM114-Status: UNSURE (   4.87  )
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

v1->v2:
  1. Add new fix for ubifs, "ubifs: Fix to add refcount once page is set
  private"
  2. Update "ubifs: Rename whiteout atomically":
     1) Move inode mode in create_whiteout()
     2) Don't check O_SYNC for whiteout, because it inherits from the old_dir
     3) Remove useless 'synced_i_size ' assignment for whiteout, because
	it's always be zero.
  3. Update "ubifs: setflags: Make dirtied_ino_d 8 bytes aligned":
     1) Align dirtied_ino_d with 8 bytes.

Zhihao Cheng (12):
  ubifs: rename_whiteout: Fix double free for whiteout_ui->data
  ubifs: Fix deadlock in concurrent rename whiteout and inode writeback
  ubifs: Fix wrong number of inodes locked by ui_mutex in ubifs_inode
    comment
  ubifs: Add missing iput if do_tmpfile() failed in rename whiteout
  ubifs: Rename whiteout atomically
  ubifs: Fix 'ui->dirty' race between do_tmpfile() and writeback work
  ubifs: Rectify space amount budget for mkdir/tmpfile operations
  ubifs: setflags: Make dirtied_ino_d 8 bytes aligned
  ubifs: Fix read out-of-bounds in ubifs_wbuf_write_nolock()
  ubifs: Fix to add refcount once page is set private
  ubi: fastmap: Return error code if memory allocation fails in
    add_aeb()
  ubi: fastmap: Add all fastmap pebs into 'ai->fastmap' when
    fm->used_blocks>=2

 drivers/mtd/ubi/fastmap.c |  69 ++++++-----
 fs/ubifs/dir.c            | 235 +++++++++++++++++++++++---------------
 fs/ubifs/file.c           |  14 +--
 fs/ubifs/io.c             |  34 +++++-
 fs/ubifs/ioctl.c          |   2 +-
 fs/ubifs/journal.c        |  52 +++++++--
 fs/ubifs/ubifs.h          |   2 +-
 7 files changed, 259 insertions(+), 149 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
