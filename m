Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F2BC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 11:08:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79902610E5
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 11:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79902610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r5140/Sh3If+gpaD0rjRKRCQo8cEuEFsdARYhtMbjy8=; b=NEyH8CuNPoV/3iyNocUXC+xDS
	tRLKeiupO6pPbmClC0qYPSm0PzOZ5Hqe3Pdr40hxeqTi7GPELSsrzaTPrbKwVx1Mglm0wwA5peKfy
	7PJhWnfkOmwGG/XlyCDo/j72KcDpFk/HaYBzwTMx7bnjVJZgI+X2UueihBVmlzUhywUEeXNCfVfS3
	FGgfUwaAKAXcFSdObp8/dZZgKmDlYJRPYQldivQ7vxLkE0D4thHnIW76YZDgl1elQy6ozzPluJzo2
	WAarGiSTk+M/gKEHHPAbyFQNep1xixjco68PIhNz9k+oqVIi8+SlMRrGGo8PfXZ4Bc/QJ7105kiuQ
	v4e7lCGdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUSWM-007koD-86; Thu, 08 Apr 2021 11:08:22 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUSVD-007kVY-90; Thu, 08 Apr 2021 11:07:14 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGJLv6BPTz19Kph;
 Thu,  8 Apr 2021 19:04:55 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 19:07:00 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <joern@lazybastard.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <matthias.bgg@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 3/3] mtd: phram: Fix error return code in phram_setup()
Date: Thu, 8 Apr 2021 19:15:14 +0800
Message-ID: <20210408111514.1011020-4-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210408111514.1011020-1-yukuai3@huawei.com>
References: <20210408111514.1011020-1-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_120711_663067_0AAF43DB 
X-CRM114-Status: UNSURE (   7.83  )
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

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/mtd/devices/phram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 5b04ae6c3057..6ed6c51fac69 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -270,6 +270,7 @@ static int phram_setup(const char *val)
 	if (len == 0 || erasesize == 0 || erasesize > len
 	    || erasesize > UINT_MAX || rem) {
 		parse_err("illegal erasesize or len\n");
+		ret = -EINVAL;
 		goto error;
 	}
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
