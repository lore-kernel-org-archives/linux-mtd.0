Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02975C47074
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l3dXcNUuMxanxwBCpP2cc1cDDzPRtS6mA4JgK5Kxte8=; b=ixaekwG4RufNoe
	VF6J6BthdiecAo8VEUCqaFxPggHHjgmQktQoRxY0ySSDhinLDY6lBDKWlomvchxTOQVJLx4EsrjSF
	Y8vNO6fXxTNeklRuUF+WW/A1EgTr9NAwmU1EDJhSDh9HirIUwamAwMD3SFlugitC+8a663/Ru3Cqq
	IAMc/Izuffx23zvNSujZRCmgpW+SAEEkRBVYZx9aY4bNxKb2gHqXvVCY8GCKs4PX2gBVEOw6SQp4n
	sXstQ9fxSnTn0UznjBEU2Q4T5uCT7U1/PScgz7t0VG+sATgvJ/nBdywKrq4DMW4/Pn8iLWLln/RiM
	rsIOve1oj8JoA0vrt7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfLt-00FpdD-2D;
	Thu, 28 Dec 2023 01:38:25 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfLn-00FpWy-01
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:38:20 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4T0rjg1yJMzMprn;
	Thu, 28 Dec 2023 09:37:43 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 813261402E0;
	Thu, 28 Dec 2023 09:38:06 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:38:05 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 00/17] ubifs: Add filesystem repair support
Date: Thu, 28 Dec 2023 09:40:55 +0800
Message-ID: <20231228014112.2836317-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173819_385162_2E63973E 
X-CRM114-Status: UNSURE (   9.36  )
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

UBIFS repair provides a way to fix inconsistent UBIFS image(which is
corrupted by hardware exceptions or UBIFS realization bugs) and makes
filesystem become consistent, just like fsck tools(eg. fsck.ext4,
fsck.f2fs, fsck.fat, etc.) do.

About why do we need it, how it works, what it can fix or it can not
fix, when and how to use it, see more details in
Documentation/filesystems/ubifs/repair.rst (Patch 17).

Testing on UBIFS repair refers to
https://bugzilla.kernel.org/show_bug.cgi?id=218327

Whatever, we finally have a way to fix inconsistent UBFIS image instead
of formatting UBI when UBIFS becomes inconsistent.

Zhihao Cheng (17):
  ubifs: repair: Load filesystem info from volume
  ubifs: repair: Scan nodes from volume
  ubifs: repair: Remove deleted nodes from valid node tree
  ubifs: repair: Add valid nodes into file
  ubifs: repair: Filter invalid files
  ubifs: repair: Extract reachable directory entries tree
  ubifs: repair: Check and correct files' information
  ubifs: repair: Record used LEBs
  ubifs: repair: Re-write data
  ubifs: repair: Create new root dir if there are no scanned files
  ubifs: repair: Build TNC
  ubifs: Extract a helper function to create lpt
  ubifs: repair: Build LPT
  ubifs: repair: Clean up log and orphan area
  ubifs: repair: Write master node
  ubifs: Enable ubifs_repair in '/sys/kernel/debug/ubifs/repair_fs'
  Documentation: ubifs: Add ubifs repair whitepaper

 Documentation/filesystems/index.rst           |    3 +-
 .../authentication.rst}                       |    0
 Documentation/filesystems/ubifs/index.rst     |   11 +
 .../filesystems/{ubifs.rst => ubifs/main.rst} |    0
 Documentation/filesystems/ubifs/repair.rst    |  235 ++
 MAINTAINERS                                   |    5 +-
 fs/ubifs/Makefile                             |    2 +-
 fs/ubifs/debug.c                              |   57 +-
 fs/ubifs/debug.h                              |    2 +
 fs/ubifs/journal.c                            |   39 +-
 fs/ubifs/lpt.c                                |  140 +-
 fs/ubifs/repair.c                             | 2651 +++++++++++++++++
 fs/ubifs/repair.h                             |  176 ++
 fs/ubifs/sb.c                                 |   24 +-
 fs/ubifs/super.c                              |   10 +-
 fs/ubifs/ubifs.h                              |  113 +-
 16 files changed, 3315 insertions(+), 153 deletions(-)
 rename Documentation/filesystems/{ubifs-authentication.rst => ubifs/authentication.rst} (100%)
 create mode 100644 Documentation/filesystems/ubifs/index.rst
 rename Documentation/filesystems/{ubifs.rst => ubifs/main.rst} (100%)
 create mode 100644 Documentation/filesystems/ubifs/repair.rst
 create mode 100644 fs/ubifs/repair.c
 create mode 100644 fs/ubifs/repair.h

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
