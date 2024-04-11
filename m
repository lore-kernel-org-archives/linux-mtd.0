Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8E6CD129E
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 03:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fb/+H7XgGMlVuyyilkNsOJOMglfbMNY/9TwkscDJ1L0=; b=07llWu5c698Wwv
	XyBkW7Wf9nGuFV/scqclgq0BmXjpHUQPT2A46wJ8T39WGTLNHzP2QeUrzkL9DqCvTKae3ogbTmbo8
	LND47jVezVPOQpmL1zPwWgNOkplU4V9IA5ZTJJsTHiBskqQtBkVbeCe/oip6CptTlB5Iw5aD/cJUz
	zN4ghXpc8lYiX76imD1064TEFHD1JmNcDeS2fNhZh9SBnbE9p/Pj5QJ4/OacCB8egm3tXDQYRIkKC
	xP+OSa5az/4gkUHHh0h9i34vG4RmWiPOXZKQubH5g2O8sMdBVBk+XdPVaaYAb8s05MZOry+WFPyhS
	lhMqR+yVAEHBlWCSHSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul6P-0000000A9JS-2OhY;
	Thu, 11 Apr 2024 03:27:53 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul6I-0000000A9EQ-1FS7
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 03:27:48 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VFQ6t6HLsz1R5Sm;
	Thu, 11 Apr 2024 11:24:54 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F68B14010C;
	Thu, 11 Apr 2024 11:27:39 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 11 Apr
 2024 11:27:31 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <ben.hutchings@mind.be>,
	<daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] ubi: Fix serious of resource leaking problems
Date: Thu, 11 Apr 2024 11:18:59 +0800
Message-ID: <20240411031903.3050278-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_202746_572886_9C7E3320 
X-CRM114-Status: UNSURE (   6.74  )
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
  Combine Ben[1] and my[2] patches.
  Modify second patch in [1], don't drop warning message if debugfs
  failed to be initialized.
  Modify second patch in [2], move ubiblock_init to the end of ubi_init.
  Add new patch to replace IS_ERR_OR_NULL with IS_ERR.

[1] https://lore.kernel.org/linux-mtd/cover.1712788087.git.ben.hutchings@mind.be/
[2] https://lore.kernel.org/lkml/20240410074033.2523399-3-chengzhihao1@huawei.com/T/

Ben Hutchings (1):
  mtd: ubi: Ignore all debugfs initialisation failures

Zhihao Cheng (3):
  ubi: ubi_init: Fix missed debugfs cleanup in error handling path
  ubi: ubi_init: Fix missed ubiblock cleanup in error handling path
  ubi: debugfs: Replace IS_ERR_OR_NULL with IS_ERR in error checking
    path

 drivers/mtd/ubi/build.c | 61 ++++++++++++++++++++---------------------
 drivers/mtd/ubi/debug.c | 35 +++++++++--------------
 drivers/mtd/ubi/debug.h |  4 +--
 3 files changed, 44 insertions(+), 56 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
