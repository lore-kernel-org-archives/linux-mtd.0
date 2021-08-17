Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D12C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 11:39:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0DED61008
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 11:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0DED61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5jBk/fzkyF+FdhZaWY/fCihyVIJJkSrsl6BK24jkuw4=; b=hyep1tXOl3IrRI
	TCEREURe7AWsGlofy51EN2Fx0/jMb9wHEJxAGRDj7qOOCCVc8BuA7PZdzgqiB5QQ4LOHVHwd280Y8
	vewnuOP59o0nkcmdiNt9LPlYrG1mHZjryWCSWtWWtHIBflm2bKtkCpKx/Oxj21XgIj6+gMC+uK3f4
	plSJ1bD0FzcOcZ3TMhVTLEgJEdvgZq6HQmXwNU3zi8r2cv+SVaN/hUc0b+B0twh6F/BD/ERmdRBQ9
	UK/wzndEVN7DRQJNLMFY8QkZ1KtGY5ZsWea9gCl87WOL1g0G474zNfz1z9mFgjHL5Q/RLV1nTsbnH
	9g2E2gPeOycMOGGxfjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFxQQ-002HNl-Hk; Tue, 17 Aug 2021 11:38:34 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFxQM-002HLn-7j
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 11:38:31 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gppth5Sfgz1CXnp;
 Tue, 17 Aug 2021 19:38:04 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 19:38:27 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 19:38:26 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <bbrezillon@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 0/2] mtd: mtdconcat: Fix callback functions check
Date: Tue, 17 Aug 2021 19:48:55 +0800
Message-ID: <20210817114857.2784825-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_043830_514165_86886AEE 
X-CRM114-Status: UNSURE (   3.95  )
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

Patch 1: Check subdev's master mtd device's callback function while
making concatenated device.
Patch 2: Check existence of _read|_write callback before assigning
them to concatenated device.

v1->v2:
  Shorten two commit titles.
  Patch 1: Add comment to explain why datamember checks for subdev
           but callbacks checks for master device
  Patch 1: Fix misspelled word, "comnoine fail" -> "combine failed"
  Patch 2: Fix wrong commit message, "Since ... time. We should"
  Patch 2: Check against the existence of _read|_read_oob callbacks
           by master, no removing concat_{read|write}_oob.

Zhihao Cheng (2):
  mtd: mtdconcat: Judge callback existence based on the master
  mtd: mtdconcat: Check _read,_write callbacks existence before
    assignment

 drivers/mtd/mtdconcat.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
