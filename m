Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17448C46CD3
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 02:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=85X26wY1qyA0HStCfr6R9KjUnyYCm1wqiV7IS+wU9oI=; b=J2iXOMGQCqSR3p
	5sBemhHdrk+9cKcPwUSZE4iOeRDTsMwwoQNy5PcuwJgRTeC6hCv3okA8Q0khrJa6AkP1Ipg9kdcYK
	g+uNTaHEtwlk9fWfskv466L0rbZgstG+gRRy5bEFFE/UaJWGqzOS5tf1GiEtGuOTRu8VDkKIz7wsA
	rndBMx4R0VqGY1tfvRVU6/9yuY3MggEi+P3mdpGdjFCNKrjGn/XxobsOXnPy5AKk7NGL7hwfA7bsz
	udFAVmasXVQUyIImyjWD6BXPJ5hH6MngtLQTssxMaaqC/NdQXvGrQfJP0y/oSbTH+u9Cp7pt7on2e
	gCwX7tj/k77vaVO40ixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGVeV-004hVG-0u;
	Fri, 22 Dec 2023 02:52:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGVeS-004hT7-04
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 02:52:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SxBfJ05bBzWjy7;
	Fri, 22 Dec 2023 10:52:08 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 1AC861800B9;
	Fri, 22 Dec 2023 10:52:30 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Dec
 2023 10:52:29 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <terrelln@fb.com>, <ebiggers@google.com>,
	<ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] ubifs: Fix two kmemleaks in error path
Date: Fri, 22 Dec 2023 10:50:23 +0800
Message-ID: <20231222025025.2940450-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_185240_225247_63C99110 
X-CRM114-Status: UNSURE (   5.11  )
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

First memleak is found by mounting corrupted UBIFS image with chk_index
enabled.
Second memleak is found by powercut testing for encryption scenario.

Zhihao Cheng (2):
  ubifs: dbg_check_idx_size: Fix kmemleak if loading znode failed
  ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path

 fs/ubifs/dir.c   | 3 +++
 fs/ubifs/super.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
