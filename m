Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775E0FA3742
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1MPmMT9phzDSprr2Cp2x7QSzuxoN8aggWNlHtnnNQx4=; b=IkRHgLFR309a++
	sS4LEnX3f9O13pj3R0vd/eZEG0INVyGv+4Ob55h7ZzScm3PRjOFiv9fgqHnbsxJPG5c0UPekUbG7M
	jwtd6zq+0/63lbbafZf33Q1+Y3GYKTTVyRnFiGdo4LTDGxEYKdo5EtzvgyDh1v4uBjZDU4uDgu6r5
	/6K27Moj37HM3vPbugx6FQIrBiiqvNEzRZqI69H1FlbGhuA3Y+aE8lCGJwC8Cxbjj113W0gkzsnI7
	PEF3C9xWQ/3krW7SgGlUaJcv0MLgHFzUUMixwAygcE7yfj8APnSZULlfxuNhKi0e6Z7wtVqIb+gLi
	te1nDyEvVDgS90fKxa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo1Jg-00D4zc-FQ; Thu, 27 Oct 2022 11:44:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo1Jc-00D4x5-R2
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2022 11:44:54 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MykNl00g2zHvJD;
	Thu, 27 Oct 2022 19:44:22 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 19:44:36 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <zhangxiaoxu5@huawei.com>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <dwmw2@infradead.org>
Subject: [PATCH 0/2] Fix list_del corruption if compressors initialized failed
Date: Thu, 27 Oct 2022 20:49:04 +0800
Message-ID: <20221027124906.143940-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_044453_066493_710222F9 
X-CRM114-Status: UNSURE (   3.90  )
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


Zhang Xiaoxu (2):
  jffs2: Use function instead of macro when initialize compressors
  jffs2: Fix list_del corruption if compressors initialized failed

 fs/jffs2/compr.c | 50 ++++++++++++++++++++++++++++--------------------
 fs/jffs2/compr.h | 26 +++++++++++++++++++------
 2 files changed, 49 insertions(+), 27 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
