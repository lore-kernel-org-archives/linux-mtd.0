Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20178C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z35Q2qfyFw+yGxME2eL5436WGm40kF2HOor4U9JjwQ0=; b=hCJzGw6hCI5nNm
	QJ6EmPlwXAm3ltGBoMR+WelzYrjPXRO5g5eG2FpWijOqsYkvTOYV3ERmt9H8o4EUJncs8weQugfC9
	NJkxuZ7Lw6kMtptB301AHgqE8oWTapbVG8IsdKQtPefeui2UlJtb3idEDdQQqJ01mGNvjFnJtmyqe
	Fri/81iHoQiL9Cw6SypfCHwTxu2VD7jmIqjhFdOBtZLbURA32a7b7qXaocVrtWFioTti1Rf+RO8Gz
	Yal3h0S9X0mvQvaj73iKRjVM0mlHPe4CkzWRKbs/Os/q1e0NjLGTTOZAiKiPNsjWcMy4X9x2RtdKz
	vElpMaZyhlJgKQftUaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvta-00000008ITO-3X5M;
	Sat, 04 Jul 2026 08:38:42 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvtW-00000008IS9-42Wo
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 08:38:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7WAiEESp6OuA4Gr19X5YfAOL1LOl8ATfC3pZ0HL538s=;
	b=1ShVS8HmemVUbk35zX5647C7aqdgZ/+0SIDu1iQJhFkUXKmnX8l2z2vp+wLNBvZgA8RFAt8yh
	Ir7ZVXCcNrnbjJ5l+PZuC4Kkm2bn9Cb2cY4VXYNbjDjKwAoPRrcVR0QqWIFeSA6ROvg+yMJ0bqb
	KzkFIRILaEkuENCEcJ9PmxY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gskLX0NkXzcb01;
	Sat,  4 Jul 2026 16:29:24 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id CF4F640538;
	Sat,  4 Jul 2026 16:38:19 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 4 Jul
 2026 16:38:18 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <chengzhihao1@huawei.com>,
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 0/2] UBI: Fix torture flag handling in erase and fastmap paths
Date: Sat, 4 Jul 2026 16:30:39 +0800
Message-ID: <20260704083042.459915-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_013839_514461_E6D5E714 
X-CRM114-Status: UNSURE (   5.50  )
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

This series fixes two issues where the UBI torture test flag is
mishandled, causing physical eraseblocks that should be tortured to
skip the test

Zhihao Cheng (2):
  UBI: Preserve torture flag when rescheduling failed erasures
  UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs

 drivers/mtd/ubi/attach.c  |  4 ++--
 drivers/mtd/ubi/fastmap.c |  6 ++++--
 drivers/mtd/ubi/io.c      | 11 +++++++----
 drivers/mtd/ubi/ubi.h     |  4 ++--
 drivers/mtd/ubi/wl.c      | 15 +++++++++------
 5 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
