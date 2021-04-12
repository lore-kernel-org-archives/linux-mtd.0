Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A9DC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 09:36:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB0FF6120F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 09:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB0FF6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nfdA+z6aSiKI9OdtL1gTX9/FyHLRaGZ3YNA17ZWNmTU=; b=HS42qxuNaccLFbQLVznAMuvIG
	0wN7rUi/bzuAVooQllcUs6h94IMpCgwO4AKGSWDFNdi4FLo29QUIBzAn0T2qT5zgMVCoR89c0vUFR
	v16Fe0LW+0eF07Ipmqr7CUw8Wz3jwPikRaApkGVN1dlmpngIpE9KQpbw20PjxKgNED6G117imUO6C
	4Uy/juwRS+Pc6FpLf/hnNLCQHEX48OzNQR03WqUCAQSMWpVpMrjWKHckiygPaKoKLRFsoyNeHpEfU
	aLo6Apv1pZV8gS5K/zbsrXtNF228g56KMqaEoHal0Pl55EhajAb5J/RvNkQpkpux3W2gVA4pPpmLZ
	XjVBdLsYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVsys-006IfM-ML; Mon, 12 Apr 2021 09:35:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsyn-006Ieq-4g
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 09:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Qp7LmGjAoZuf+UvaHz3A7+3ftQ11EcckFRCox3N/fto=; b=F9gvCvNIv+EDGEua+/oJhqhekf
 CsTzeHc8PNwGFEToZ0xpT9qhhF2sE55tAUrGDMctY7bZw03jjAjqTQfCrMfVFxk3zfhvQGac5c3Vd
 0g5L+GT9IOyocX3yAXz5pkNTDSKWoB7ZkEAA8Np+w6B3J7xJ4mQjBPiiAICcUHUVDYeI2lmXNIgti
 eMwU68gqqqxLVIDWsduvPJLwlEA+M3Bwkg6/wdBcBHp2IryI6Km1riQy/AVS5lGn/V/joQInrWdE0
 Ib+cFFS4hWesfY6O0gX05iGn3L99oj1AgFEOdZRINY/PgSHR3ZixzuBKwepGZTWSfgLj/immND0wW
 6yYZVaJg==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsyk-0064PS-84
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 09:35:35 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FJk7G6kHhz1BGgg;
 Mon, 12 Apr 2021 17:33:14 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 17:35:22 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH drivers/mtd v2 2/2] mtd: mtdpart: Convert sysfs
 sprintf/snprintf family to sysfs_emit
Date: Mon, 12 Apr 2021 17:35:44 +0800
Message-ID: <1618220144-33839-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618220144-33839-1-git-send-email-tiantao6@hisilicon.com>
References: <1618220144-33839-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_023534_493423_A7E9E739 
X-CRM114-Status: UNSURE (   9.81  )
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

Use sysfs_emit instead of snprintf to avoid buf overrun,because in
sysfs_emit it strictly checks whether buf is null or buf whether
pagesize aligned, otherwise it returns an error.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 665fd90..66a67c6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -217,7 +217,7 @@ static ssize_t mtd_partition_offset_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lld\n", mtd->part.offset);
+	return sysfs_emit(buf, "%lld\n", mtd->part.offset);
 }
 
 static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
