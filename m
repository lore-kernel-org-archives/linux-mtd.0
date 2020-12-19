Return-Path: <SRS0=vxLv=FX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCADC4361B
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Dec 2020 12:50:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233B323AC2
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Dec 2020 12:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233B323AC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OKnAS/2CS80XPPAZ/Ao+QCd3Qkcg4NjOScChWqXcb/M=; b=qSlasWpncFKPAAsi8HNqw1WRk0
	G0kH1i27geZssbdtnjruXnIfwTAj4zO2hzbTtgKakKkQ7UUIHoBMA8lKfjauRo9QL1uz+HdimmCXy
	Ctw1eukF+45fsxblBVobSZIlQOKmy26TfV2JVitCujTsoG8oC9TJkf0wNmb2YHiN7UZKmGGJl9ffP
	qEqcdZwhtkA7H4+VTMOzRVzvIjtKn1QO0CFYwCHlu0sRg1gAx1aWU6EJCS+xBKsAR4SE+Zg2cn09d
	yMG8yKUi8kwC8Tu+4jrqe8BhJhxCOtz2kIyuIXy+ghvwkqfGt9tTwcIWxaloUnjCXAbf5xoOeRZGp
	hDfDS7Gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqbgd-0003EB-EV; Sat, 19 Dec 2020 12:50:15 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqbga-0003At-Gl
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2020 12:50:13 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CylsN006Bzhtyl;
 Sat, 19 Dec 2020 20:48:39 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.20) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Sat, 19 Dec 2020 20:49:13 +0800
From: Jubin Zhong <zhongjubin@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
Subject: [PATCH] ubi: remove dead code in validate_vid_hdr()
Date: Sat, 19 Dec 2020 20:49:10 +0800
Message-ID: <1608382150-102703-1-git-send-email-zhongjubin@huawei.com>
X-Mailer: git-send-email 1.8.5.6
MIME-Version: 1.0
X-Originating-IP: [10.67.189.20]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_075012_899591_68566517 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 wangfangpeng1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

data_size is already checked against zero when vol_type matches
UBI_VID_STATIC. Remove the following dead code.

Signed-off-by: Jubin Zhong <zhongjubin@huawei.com>
---
 drivers/mtd/ubi/io.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 2f3312c..8a7306c 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -913,12 +913,7 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
 				ubi_err(ubi, "bad data_size");
 				goto bad;
 			}
-		} else if (lnum == used_ebs - 1) {
-			if (data_size == 0) {
-				ubi_err(ubi, "bad data_size at last LEB");
-				goto bad;
-			}
-		} else {
+		} else if (lnum > used_ebs - 1) {
 			ubi_err(ubi, "too high lnum");
 			goto bad;
 		}
-- 
1.8.5.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
