Return-Path: <SRS0=OWKh=JW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27AFC433B4
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Apr 2021 10:30:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A8D61396
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Apr 2021 10:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A8D61396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+qzw2GGICsLdD1MBMnYl/y12QHxaHXascr5hUJ6L9FU=; b=qCktwt6Zn2YptkteseHfxk2eS5
	gknTaXPWRyDH1L/SzaNmxOXMohUT8PgObhg7yhpYsOls60DxU8PBsHZyFT47gCjIvedY8hsXFyB7a
	88zC/u+DT19CZd6Pwp+9+hvC0c2pIYYNm+7+R+jJyNefgsdzMgoxWZnEBbbwCz6FfTIrI0gbc5kR8
	wTy9nNUAohcobjOfnHXf+bCU3h9cJPaPCaQu1k8X2qBqevrJcZ/+hGOcRRyVELy2x8pLXB23xdu2d
	Yf457Oo/RuaVx3kOIwQbaCK8iBZmv5q4x3/EeWyx4o63uDys1tjlhCPTN3A6sITYqNadI6k9TW7TF
	XybpZQtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lac0m-005TYr-33; Sun, 25 Apr 2021 10:29:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lac0e-005TY8-Sh
 for linux-mtd@desiato.infradead.org; Sun, 25 Apr 2021 10:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=NQff9DqwogcWvb1MdcRT8bpfiJvn7+ch0ttkaEH8V6w=; b=zqYxPetbx7Z2HzPpYJTrmXLHNU
 cMDAHfHKfOhw4zVj3VVNphuDxPbfjUEIvwQkbR6vup5t3nbD2M6brs4XI02FvdjjKogKfoqaJRFb+
 dsAlv1NO6xm9zjrkTlV5USfMLV+BWohR76EGNCgJzYtK1BacEYw5bZtUf1QnFRVN9ULCF2hHia8oL
 hYWrFXHK/5H/0l8y3B7Zb+BqFY8vKwyiCLO84+MD4g7eaHXh8irnpYiW3Ue+xGr65942T8L6m6yQD
 MaKDNubQefdMxg/H8qBA5RlRA9Sqp15NaGgjTpRaVDChKRpJ7qIDzWpTNmZZjrt2MgBStYBvSZSge
 tI2d2h8w==;
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lac0b-00FOuo-MD
 for linux-mtd@lists.infradead.org; Sun, 25 Apr 2021 10:29:03 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R781e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0UWg8-M1_1619346499; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UWg8-M1_1619346499) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 25 Apr 2021 18:28:55 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] mtd: mtd_oobtest: Remove redundant assignment to err
Date: Sun, 25 Apr 2021 18:28:18 +0800
Message-Id: <1619346498-43617-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210425_032901_906477_8B103CCB 
X-CRM114-Status: UNSURE (   7.81  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Variable err is set to zero but this value is never read as it is
overwritten with a new value later on, hence it is a redundant
assignment and can be removed.

Cleans up the following clang-analyzer warning:

drivers/mtd/tests/oobtest.c:626:4: warning: Value stored to 'err' is
never read [clang-analyzer-deadcode.DeadStores].

drivers/mtd/tests/oobtest.c:603:4: warning: Value stored to 'err' is
never read [clang-analyzer-deadcode.DeadStores].

drivers/mtd/tests/oobtest.c:579:4: warning: Value stored to 'err' is
never read [clang-analyzer-deadcode.DeadStores].

drivers/mtd/tests/oobtest.c:556:4: warning: Value stored to 'err' is
never read [clang-analyzer-deadcode.DeadStores].

drivers/mtd/tests/oobtest.c:532:3: warning: Value stored to 'err' is
never read [clang-analyzer-deadcode.DeadStores].

drivers/mtd/tests/oobtest.c:509:3: warning: Value stored to 'err' is
never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/mtd/tests/oobtest.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index c71daa8..3a31a2c 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -506,7 +506,6 @@ static int __init mtd_oobtest_init(void)
 	err = mtd_write_oob(mtd, addr0, &ops);
 	if (err) {
 		pr_info("error occurred as expected\n");
-		err = 0;
 	} else {
 		pr_err("error: can write past end of OOB\n");
 		errcnt += 1;
@@ -529,7 +528,6 @@ static int __init mtd_oobtest_init(void)
 
 	if (err) {
 		pr_info("error occurred as expected\n");
-		err = 0;
 	} else {
 		pr_err("error: can read past end of OOB\n");
 		errcnt += 1;
@@ -553,7 +551,6 @@ static int __init mtd_oobtest_init(void)
 		err = mtd_write_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
 			pr_info("error occurred as expected\n");
-			err = 0;
 		} else {
 			pr_err("error: wrote past end of device\n");
 			errcnt += 1;
@@ -576,7 +573,6 @@ static int __init mtd_oobtest_init(void)
 
 		if (err) {
 			pr_info("error occurred as expected\n");
-			err = 0;
 		} else {
 			pr_err("error: read past end of device\n");
 			errcnt += 1;
@@ -600,7 +596,6 @@ static int __init mtd_oobtest_init(void)
 		err = mtd_write_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
 			pr_info("error occurred as expected\n");
-			err = 0;
 		} else {
 			pr_err("error: wrote past end of device\n");
 			errcnt += 1;
@@ -623,7 +618,6 @@ static int __init mtd_oobtest_init(void)
 
 		if (err) {
 			pr_info("error occurred as expected\n");
-			err = 0;
 		} else {
 			pr_err("error: read past end of device\n");
 			errcnt += 1;
-- 
1.8.3.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
