Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37807C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 18:52:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A1A61041
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 18:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1A1A61041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cbvi8VHpvxp3opTwFCdvukijrpN3IVpRnFIUvBxlJBk=; b=2XFRIDC1w6V5q/
	0jguGlgfJTUKJhbz+KuDIBS54BBcR1xw8lAf8ApHY1P036Kg4zJfyY+X0l+bH1130sP4mIBqLV8lM
	VzPjX5WeTvKIus5TgnLKKTYimNarcSln9sh1g/rPIT8fQt/lFNJ2zdr9TLsBdl4UN1wH1B7fY0W1h
	RwssSi04TNxXgDJ0ntkg9wqQ9aJyqqS7YDxgvVEr0/SueboPFVcRDG8M4H/Yq/7dTxgs/XIAJUk8N
	9SMh/hCkDdq7pKWO+3C8dgKK69wEIP8pIxkaOV8RwsDgt6D5CyfPq7jKP33+9TsO5yqrEdiKp9XaH
	Bs5/83dTlVTlx6MY87tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbSJ9-008Utr-Jn; Fri, 15 Oct 2021 18:51:55 +0000
Received: from thorn.bewilderbeest.net ([71.19.156.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbSJ5-008Us6-Dd
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 18:51:52 +0000
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 096282B1;
 Fri, 15 Oct 2021 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634323907;
 bh=AezE/UqyGxsDzy1We/7x0OMj8tS2QaSlROEBATVr1F0=;
 h=From:To:Cc:Subject:Date:From;
 b=OAwP3QFC8t9LdMSjKT+4DWtey+rZZv1PR6BpuxdwVeMh4h8gNGKqgTywyyvFYgZ0p
 p9LHbYylGnBdGMJCdVLQxfRmULUziwdH/ripZUncjMWZB/oST3zbwOhmLAihzOT1sQ
 1CQP8/GLE9bH4gMBLnc9lWy9AbnWfnhOBDo5Qvao=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-mtd@lists.infradead.org
Cc: Zev Weiss <zev@bewilderbeest.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>, Zhen Lei <thunder.leizhen@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Tian Tao <tiantao6@hisilicon.com>, Petr Malat <oss@malat.biz>,
 Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: core: clear out unregistered devices a bit more
Date: Fri, 15 Oct 2021 11:50:48 -0700
Message-Id: <20211015185049.3318-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_115151_495065_1BB47C4F 
X-CRM114-Status: UNSURE (   9.21  )
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

This allows an MTD device that has been unregistered to be easily
re-registered later without triggering spurious "already registered"
warnings in mtd_device_parse_register() and add_mtd_device().

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/mtdcore.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 153229198947..0a0fca737d43 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -747,6 +747,9 @@ int del_mtd_device(struct mtd_info *mtd)
 
 		device_unregister(&mtd->dev);
 
+		/* Clear dev so mtd can be safely re-registered later if desired */
+		memset(&mtd->dev, 0, sizeof(mtd->dev));
+
 		idr_remove(&mtd_idr, mtd->index);
 		of_node_put(mtd_get_of_node(mtd));
 
@@ -1018,8 +1021,10 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
-	if (master->_reboot)
+	if (master->_reboot) {
 		unregister_reboot_notifier(&master->reboot_notifier);
+		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
+	}
 
 	if (master->otp_user_nvmem)
 		nvmem_unregister(master->otp_user_nvmem);
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
