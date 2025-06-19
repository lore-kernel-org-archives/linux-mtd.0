Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84252C7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i/M+QrNBeEUoPX/OwKl7lbyy/a3weSPXHlkmKKgKV0=; b=aXCcUYOHpnIu01
	OSzewNBqRD/fmzJnxNkkS71qHEuoMC/NHhoIZ2n3JcqkHv1FzUtFGypo1tqiQJO/bQbjJynn4oFKm
	pxjh5ux4quUuybBfcZ+ngrKJHjMyaAOrDlvnD0Eplex1wqsnRX8fmzf9VA18VtwOw6hnR0F9yMFjh
	CAX4Q6ncJ+RoOVLr8CiaILzXN+MVbAzcjhnNc+uxOUgG8Ww3CFvwo8WV8vMWx4oDrbLlSufuf6Fmc
	M5MkXiFz6vX/a5RHp+gCa4FT/qxkFTQHgvfsq4LEO4wuCEE3mmPrcaWLkr0M26oe3qDL1gB9G/5RG
	2jaCIaJGvpJSf54VDt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfc-0000000DgME-2jHK;
	Thu, 19 Jun 2025 17:03:24 +0000
Received: from forward101b.mail.yandex.net ([178.154.239.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGeH-0000000DKNX-2W2S
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 14:53:56 +0000
Received: from mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:2213:0:640:2844:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id 8C69C60B23;
	Thu, 19 Jun 2025 17:53:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id UrPtqvCLgmI0-dlGck7kH;
	Thu, 19 Jun 2025 17:53:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail;
	t=1750344825; bh=TFnT8rksRCUkHgk0vFmvFTJCSDIZN2HPazNQku+gKOY=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=pyp8Cer0jSVMtcjVrgDJqjPpqSsUmcId6ayTUYaow8Vu6AZbjvjoXT/vHUEV5+dP+
	 ugOEcc0ckV3d0CSSqIXiExUfAvG6SURIinqx8CW1LiND+OG2ue0EnrcPykko83Es/h
	 xyl8vhdILP8sW6k+wNZsl0OAV5XQA/cj7KF9R1oI=
Authentication-Results: mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net; dkim=pass header.i=@itb.spb.ru
From: Ivan Stepchenko <sid@itb.spb.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ivan Stepchenko <sid@itb.spb.ru>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] mtd: fix possible integer overflow in erase_xfer()
Date: Thu, 19 Jun 2025 17:53:13 +0300
Message-Id: <20250619145313.5823-1-sid@itb.spb.ru>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_075354_145031_1AA2B25C 
X-CRM114-Status: GOOD (  10.87  )
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

The expression '1 << EraseUnitSize' is evaluated in int, which causes
a negative result when shifting by 31 - the upper bound of the valid
range [10, 31], enforced by scan_header(). This leads to incorrect
extension when storing the result in 'erase->len' (uint64_t), producing
a large unexpected value.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ivan Stepchenko <sid@itb.spb.ru>
---
 drivers/mtd/ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 8c22064ead38..f2bd1984609c 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -344,7 +344,7 @@ static int erase_xfer(partition_t *part,
             return -ENOMEM;
 
     erase->addr = xfer->Offset;
-    erase->len = 1 << part->header.EraseUnitSize;
+    erase->len = 1ULL << part->header.EraseUnitSize;
 
     ret = mtd_erase(part->mbd.mtd, erase);
     if (!ret) {
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
