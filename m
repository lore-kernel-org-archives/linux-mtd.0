Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6554CCD1297
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Df4sbp0eB49F4f6MtLsez0iCfmEUBS0xSZbYJ/rdKGQ=; b=c1IGzjcm7MGI6z
	1JQxk3cd9xADz3JZKdt3OHTLrNKQaBoAgjpzmNDhjZKJtTCsISXHCd0VLmSPc0FIMhg7jEJKAoz3i
	gVCn1l+aHwa9ZMD5tIGAjGkNMb/mLf2u/IxRjww5MKYClasyuk2R6lOjl5p1BjfV7sGEm1+vmpINP
	sBExeCs3Zy2dIRgbZjIdxiJgYUmEFCP6Z3y96iLUW3MvatWnC1mXpZww5+kS/y28fTNRSfdgZ9ASO
	ckRgk4QlUqTdxPI/NnO0pwzn9SWKospxYOubsjeBMbfuEFEvI9ONGwVi1B8GDiG8E1Kl5YVREKK7J
	Dz1/2GwwWVSFUj1CKeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruShp-00000005hXL-1WAA;
	Wed, 10 Apr 2024 07:49:17 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruShl-00000005hUt-0g4i
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:49:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VDvz164k0z1R5TK;
	Wed, 10 Apr 2024 15:46:21 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id DF3741403D5;
	Wed, 10 Apr 2024 15:49:04 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:49:04 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ubi: Fix resource leaking in error handling path of ubi_init
Date: Wed, 10 Apr 2024 15:40:31 +0800
Message-ID: <20240410074033.2523399-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004913_402047_B5EF11AE 
X-CRM114-Status: UNSURE (   5.02  )
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
  ubi: ubi_init: Fix missed debugfs cleanup in error handling path
  ubi: ubi_init: Fix missed ubiblock cleanup in error handling path

 drivers/mtd/ubi/build.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
