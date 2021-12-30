Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7585C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Dec 2021 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pXSjW33TQkZwDxmsDOJoNqzSvWw/tgKHTFkvRz/dE2Q=; b=3BJrWlQJwVAgNd
	DG+U5Y8htGxDqmyZ+YGc3oyh3PBABa7smU/FxmBH28KdpRsCczCrMx/YimyOuN4qmKtTyWz1VVNEF
	+pa7npB0mntPTJxkjAAzEpPclc6mfIjY0O63vNQW1lFqnAKP35Eb2ce9KT/S83d5lDU20Iyj9Erhi
	jL7KDNep0WPsCahe0azCE4unFP5TCVVUFSMWDKcHfOxAcYycXMR5NVw81NNnPPjeWv9kn4oioAjb9
	wL9QH7BkazZOLugRE8pHgKysbRiOL4T19Oe+Fuu5rRn+9yPA+P5gSPOzIvxQ1rxU9QPeFvoec69q3
	DGXleybH9K8xRlvE71og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2p7X-003hPW-K3; Thu, 30 Dec 2021 06:41:03 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2p7T-003hNg-Tq
 for linux-mtd@lists.infradead.org; Thu, 30 Dec 2021 06:41:01 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JPdts1Jh9zbjlD;
 Thu, 30 Dec 2021 14:40:21 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 30 Dec
 2021 14:40:50 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <dwmw2@infradead.org>, <lizhe67@huawei.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <libaokun1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH -next 0/2] jffs2: fix two memory leak when mount jffs2
Date: Thu, 30 Dec 2021 14:52:13 +0800
Message-ID: <20211230065215.3747576-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_224100_150428_966EFE9B 
X-CRM114-Status: UNSURE (   4.77  )
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

Baokun Li (2):
  jffs2: fix memory leak in jffs2_do_mount_fs
  jffs2: fix memory leak in jffs2_scan_medium

 fs/jffs2/build.c | 4 +++-
 fs/jffs2/scan.c  | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
