Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9DAC004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:26:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2B520578
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:26:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ppdWIEEW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E2B520578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=70P/vMgWpqwBfY/GOjGT9Drp5FT3cyqeEjGq34j62vg=; b=ppdWIEEW3I459V
	PsCXoTrJ14go6sowTiOh53raBtXYc8NuxY4DjPwjpN8CpfihWHU/aGNDmEu6F6NmKh1sQBPIpu3rK
	MTs5Y7eIv/U0zhxsyTTSMhsXiy2IDMsKGc8ZbVlcJl9GoAfFQEbdbbD6B4qCYb0k65iprEmMiYQ9G
	F9n2AXkcvIOFvUOv5rcCmWehJ936q1/EGXhtDhEuNi3hFYT6ibbtvbMCGLvT4dxxVsFyd7hwa0jhl
	XCogMqhBquaeN5c2LgWSagaKNx3MvNkSzpAturGr02ik6Lc5XOZYWEDB1hplmYvYNjyYDCnNyytxM
	MhUdxQUmZEPrx3i6hyFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNxIS-00036q-Lp; Tue, 07 May 2019 10:26:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNxIH-0002um-UM; Tue, 07 May 2019 10:25:55 +0000
X-UUID: da66cb69bc3444c5a805c76ef9cccf0c-20190507
X-UUID: da66cb69bc3444c5a805c76ef9cccf0c-20190507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1403518030; Tue, 07 May 2019 02:25:52 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 03:25:50 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 18:25:42 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 7 May 2019 18:25:42 +0800
From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [PATCH v3 0/4] MTK NAND driver improvements and fixes
Date: Tue, 7 May 2019 18:25:37 +0800
Message-ID: <20190507102541.34341-1-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: CB9A409872D86BFB57370FA0F8C38126CEED31BFCFF0315A533C6B37AFA563982000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_032553_975610_321D1E8D 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The following patch set mainly contains:
* Fix low level time calculation of read/write cycle to meet tRC_min
  and tWC_min requirements.
* Refine RE# pulse width calculation and data sampling to improve read
  performance.
* Add CS validity check.
* Fix oob buffer pointer wrongly setting.

Changes on v3 relative to:
--------------------

tree    : https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/
branch  : nand/next
commit  :
        'commit 1c14fe2167ef ("mtd: nandsim: switch to exec_op interface")

Patch v3:
---------
- Fix some comment style.
- Format patch base branch: nand/next
- Pend to sent patch "mtd: rawnand: mtk: Setup empty page threshold
  correctly", because it seems that we should confirm this change has no
  side effect and need more test.

Patch v2:
---------
- Fix type
- Reference correct faulty patch
- Refine code to do calculation and condition in separate steps
- Fix empty threshold calculation

Tests:
------

* ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA by
  'dd' command.
* all drivers/mtd/tests/* pass.
* speed test:
  eraseblock write speed is 11087 KiB/s
  eraseblock read speed is 19986 KiB/s
  page write speed is 10689 KiB/s
  page read speed is 18724 KiB/s
  2 page write speed is 10611 KiB/s
  2 page read speed is 18713 KiB/s
  erase speed is 103696 KiB/s
  2x multi-block erase speed is 354248 KiB/s
  4x multi-block erase speed is 350459 KiB/s
  8x multi-block erase speed is 356173 KiB/s
  16x multi-block erase speed is 356173 KiB/s
  32x multi-block erase speed is 358120 KiB/s
  64x multi-block erase speed is 356173 KiB/s

Xiaolei Li (4):
  mtd: rawnand: mtk: Correct low level time calculation of r/w cycle
  mtd: rawnand: mtk: Improve data sampling timing for read cycle
  mtd: rawnand: mtk: Add validity check for CE# pin setting
  mtd: rawnand: mtk: Fix wrongly assigned OOB buffer pointer issue

 drivers/mtd/nand/raw/mtk_nand.c | 84 +++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 14 deletions(-)

-- 
2.18.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
