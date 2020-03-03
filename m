Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADC6C3F2C6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 09:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D1F21739
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 09:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JjBd8BlZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D1F21739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GmQx65sGx01t84kJB9NJGz7q0pXdxl28T7BAvG0bp/s=; b=JjBd8BlZxRTnX+
	GuBpBcI2/Oukx12aa24s6svO/ESPTRPiVdy2R3Tio1JS992dmU/q3ZH1Orjq6AD2natWbLCQ2bG4J
	PhCxLlm7PJPixg2xThw2aBfpQqP1zhtoGX8dmfqgmR74U/zErr0fWt8wToUOvlxnCwOItsfMQgWeq
	iGFn6U+CC71yER1Se5hFG+uWElbOD92LkeHDcEM0RvyA812PaXsfNXwaPohQzgj9k+xJrKnoQtIPd
	gtOQm2iqRyMsP628vL92LSq/wDXbO/BS8sFJ8Zj6tqaJAEd2gsIQ07XudctZRoo7yI5xMhJfmFkSy
	qdteg+gupS1vqoq3UfMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j93w2-0002wu-1d; Tue, 03 Mar 2020 09:33:54 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j93vs-0002X6-Ns
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 09:33:46 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AC4EC4478312C09077A6;
 Tue,  3 Mar 2020 17:33:21 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
 17:33:12 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <yi.zhang@huawei.com>
Subject: [PATCH 0/2] Fix two mem leak bugs
Date: Tue, 3 Mar 2020 17:40:21 +0800
Message-ID: <1583228423-60816-1-git-send-email-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_013344_968656_A7AF9C7B 
X-CRM114-Status: UNSURE (   6.36  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Zhihao Cheng (2):
  ubifs: ubifs_jnl_write_inode: Fix a memory leak bug
  ubifs: ubifs_add_orphan: Fix a memory leak bug

 fs/ubifs/journal.c | 1 +
 fs/ubifs/orphan.c  | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
