Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B939C7EE2D
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Mar 2023 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c5XT2C1tdUNY0h3jgPflYVBDHyutpi6VlWGwYJkEORQ=; b=EAyEHh8/59TCFp
	DXR/ErjIJR940yl9TjlnBxwAbwEl66QsbdPBUNqFABIgIxJnI1MITOKxXS9Pt08nUCLh16rLM8Hyh
	3Q0iOSLVnQPqz2cVOSQF2YhPttgtRE9+MKZ+LphumNRynXQ33+fH29LVOTSRX9QPOfU9DOdbITFGV
	+/o20EdJHWd0G53te6x60mlo5P0IvuyC/e9q1xY+PyVNjw8jkQYSiUVtxRl10VwXWOXv7FA591T+C
	w/GH/4XH3aS+Qr6XkPjyKdrO5Ib/ccj/Y2akjj3kPb8UmYRD3jI4C61Y4dFLH8sdcC+cUn1vZ3UOZ
	UgPXxUFUQH4R/kB732kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXLDz-00G37X-CP; Wed, 01 Mar 2023 12:06:23 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXLDu-00G35O-WE
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2023 12:06:21 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PRXrH4y9PzKmSX;
	Wed,  1 Mar 2023 20:01:03 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 1 Mar
 2023 20:06:01 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>
Subject: [PATCH -next 0/2] Rework fix method for memleak in
Date: Wed, 1 Mar 2023 20:29:17 +0800
Message-ID: <20230301122919.266818-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_040619_223857_ED3CA0AA 
X-CRM114-Status: UNSURE (   5.18  )
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

Patch 1 reverts old solution.
Patch 2 provides a new fix method.

https://lore.kernel.org/lkml/20230215022507.2363193-1-chengzhihao1@huawei.com/

Zhihao Cheng (2):
  Revert "ubifs: dirty_cow_znode: Fix memleak in error handling path"
  ubifs: dirty_cow_znode: Fix memleak when insert_old_idx() failed

 fs/ubifs/tnc.c | 142 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 86 insertions(+), 56 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
