Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4084ECC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HVRC2Of+fscxTokU9euDUAJPdYXoJyCh3n6J+dhJln8=; b=VeILaz36qFo/6k
	qrgz9PwXBnnpwbhWbR2yNyn9MdRQBPcE3+7PSBlZegdEONAC5TXgI5Y2MJs8+AwEKUCfBy9IcxJIa
	Jojc3Rzl0F05RTWDOo9e9KvIXBM+TOKP0Smr9VlYMdxxXuxuF5otv3iVp8UmnsbxX3sWaqdXKbHhQ
	Rbj3/hMQoYmcsz1jRzSGCcd/RfbFGFXrHJvWKJfocMEi8bBczYGkymnNKN/B6qJUnuXZZyJUnbwum
	KooVHYr5+EhSUpM0IEtqcSh4q9zA7ca9I/KXunQ71J10gjBl4Kb/1DJLYwBe/7VXALj6yZAx4RN31
	4Z2MTvaHCqNn6jEwvblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsBo-0000000EaQB-2fjX;
	Wed, 14 Oct 2026 06:10:12 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsBi-0000000EaP2-4AlY
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 06:10:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ryp48u62IsKSUpPWkKP6aAC0NxPzxQu7Rcgs4tMsqL0=;
	b=xU2Vixhp/nqyzIsGrQBjNLQJDV497PZQGJ4optFjTuEg4hg7a8U7V4WoijYfBSp75YcA67/t8
	bdrYF70P8Ko9md4svSGoNc9kCNAyI1I35H2WJJWZPs/3ZqjGd2UG9HyfGXbXNT0C56J30OFvsEH
	IllBrzwFPnqhM4wPoZ/rZA4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j4L8j17vQz12LD9;
	Wed, 14 Oct 2026 13:57:57 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 307824056E;
	Wed, 14 Oct 2026 14:09:51 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 14:09:50 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 0/2] ubifs: tnc_delete: Fix two uaf bug when mem failure occurs
Date: Wed, 14 Oct 2026 14:02:50 +0800
Message-ID: <20261014060252.3531356-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_231007_492081_A7444A05 
X-CRM114-Status: UNSURE (   5.22  )
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

Fix two TNC traversing uaf problems after failure happens in
tnc_delete().

Zhihao Cheng (2):
  ubifs: tnc_delete: Don't free zero-branch znodes if memory allocation
    fails
  ubifs: tnc_delete: Don't update collapsed znodes if memory allocation
    fails

 fs/ubifs/tnc.c   | 44 +++++++++++++++++++++++++++++++++-----------
 fs/ubifs/ubifs.h |  2 ++
 2 files changed, 35 insertions(+), 11 deletions(-)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
