Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE71BC27C43
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2024 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PaSb8Q3MnaE1rRK8RyLE6dl3tbqYBIX+mP2M+z0vMVE=; b=hfNlz36sI8ViFz
	RDcb+mqVK/dFeTdiu3g1ag3iF/DSm++qcjwkrVXiJco///L+QmQLjzLpprCSFlRLw3ob2iBtQrzYj
	U/Bv4XEcZhz45MY2EEfR76axOVFk3s78qFbdCjaMa5X/xc6mw+GXIf0vVUEfpsFpvDm1yE2zOLMZL
	5p9B3p5rWBJOeBP7GKm/zP8Zl0W2H2Nsjj3tTdcLswG9ksIrtPVLVMyxLHqJ6kDMhTVVfzHJHGklh
	mYgAwigIv9jW/wv4+WTXYZOBTBE04eFR2baUJfgg60/jJoSVoqteai0WXdhYhkv0W4cnwIB5H9euo
	O+cRiUA4a8UDMZw2zl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHEE-00000003uUE-3dmJ;
	Wed, 29 May 2024 11:12:22 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHE6-00000003uQb-26k4
	for linux-mtd@lists.infradead.org;
	Wed, 29 May 2024 11:12:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Vq67J6rR5z1JCfp;
	Wed, 29 May 2024 19:08:12 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B351140F66;
	Wed, 29 May 2024 19:12:00 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 29 May
 2024 19:11:59 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] ubifs: Fix two problems for checking lpt space statistics
Date: Wed, 29 May 2024 19:12:17 +0800
Message-ID: <20240529111219.3964764-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_041214_754862_DF3749E7 
X-CRM114-Status: UNSURE (   4.25  )
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
  ubifs: dbg_check_ltab: Fix wrong lprops table information caused by
    missing nnode loading
  ubifs: dbg_check_ltab: Fix wrong lprops table information caused by
    missing pnode checking

 fs/ubifs/lpt_commit.c | 47 +++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
