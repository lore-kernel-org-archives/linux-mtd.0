Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266CDC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 09:11:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECCDC206E2
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 09:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J3F1tbrM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECCDC206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdkAfNCxuMGQs3w81OxfHMttA3oHWf58gBLrQ6jJB6w=; b=J3F1tbrMk+CX1C
	EouRIfY4Mix3bcwzil5tlE91X63FoirnVD4LFpUg13hFC8OHg9JBRDZ9nREqD8DIzOAh1/OkU4H3a
	BJVmlMWnTP952+Srs94yh9Kr/J9aOsdiSsCLLCDdZXGWyjIk13CpScvH7JKLUTLsC2DlejX2DBF9Z
	Yo/F/Tscg2/42BNwi1rPV6pin+w26xzHUpsn2A7LepQY3tTUr9oPkQ4If53f6g5ImBOtenbez6gAp
	jr0ty0xxShIZVrRtHIHsX61hGqYg8AFAZeW+456nznghjZLKP2xhCplkHS5uXorHMusVtqmDkEnME
	SdHI9xC1Zxn5RbJGy5bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfgTX-00031h-4u; Mon, 01 Jun 2020 09:11:19 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfgTV-0002zR-32
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 09:11:18 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7C928607764F1DC58E3B;
 Mon,  1 Jun 2020 17:11:06 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 1 Jun 2020
 17:10:59 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ubifs: dent: Fix some potential memory leaks while
 iterating entries
Date: Mon, 1 Jun 2020 17:10:37 +0800
Message-ID: <20200601091037.3794172-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601091037.3794172-1-chengzhihao1@huawei.com>
References: <20200601091037.3794172-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_021117_303430_206F29C8 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: richard@nod.at, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix some potential memory leaks in error handling branches while
iterating dent entries. For example, function dbg_check_dir()
forgets to free pdent if it exists.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <Stable@vger.kernel.org>
Fixes: 1e51764a3c2ac05a2 ("UBIFS: add new flash file system")
---
 fs/ubifs/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 0f5a480fe264..b4a3abf54df7 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -1123,6 +1123,7 @@ int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 			err = PTR_ERR(dent);
 			if (err == -ENOENT)
 				break;
+			kfree(pdent);
 			return err;
 		}
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
