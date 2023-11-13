Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB32C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 01:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w47f6NiJQoGTxBgIaurYnQxo45pm8L9JkvVnoUFnCQc=; b=OTIZq1PFGrx571
	qft2nUNcIynda9HyGkEnCnAA9Tm56mhAHFcTDPCi54loFEMR1YUqn9So9YefxtHbwsJungg7datF1
	m4DXTshNwQUwt+9l015WvpU1ExyBt9DU2+y0gOYL05hcpR2rNW9EjaMxhNvzB8ERe4a3asjq6xn8a
	MZ1vu2/Ko0wGLrliJgvg+Ozn148HiXGgZE28HQQ0NypV233Qvc/1AeKMrOq4Yt6qtt3x7r3+7eUXh
	lZQhDzlgjSFJWn9kvtNJiv6vZKrLG2M2tTjx39kbXQvLIBDTcm6ees1Y1sKd5vQOZFDY5XMorGKZZ
	j6UbUmOich4oVXCqPPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2M9Q-00D1Un-0y;
	Mon, 13 Nov 2023 01:54:08 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2M9M-00D1SB-2t
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 01:54:06 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4STC7L60hXz1P7YN;
	Mon, 13 Nov 2023 09:50:38 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 13 Nov
 2023 09:53:54 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 0/2] Add two new fields in ubiattach ioctl
Date: Mon, 13 Nov 2023 17:48:10 +0800
Message-ID: <20231113094812.853529-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_175405_129117_18C6857D 
X-CRM114-Status: UNSURE (   5.70  )
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

Zhihao Cheng (2):
  ubiattach: introduce disable_fm in UBI_IOCATT
  ubiattach: introduce need_resv_pool in UBI_IOCATT

 include/libubi.h       |  5 +++++
 include/mtd/ubi-user.h | 10 +++++++++-
 lib/libubi.c           |  2 ++
 ubi-utils/ubiattach.c  | 25 +++++++++++++++++++++++--
 4 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
