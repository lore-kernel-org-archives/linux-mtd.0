Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89705C072B5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 00:08:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B45F21773
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 00:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdVY9coU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="R8M9aUSD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B45F21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vD4DRhRycvKUuwkEDoZc0mi5yRL/GHL9BlQ+uhKViac=; b=WdVY9coUHxLdME
	jQxpShe18H0y/Nv04qdyUUoyPtJ/e1nXllOev1WENwVWu2FMzomJYTLcNONuGreWs7fBEMbDaJZSM
	bC9fEU5bmXLTqH1+tEI0vNNeUUwsyMwN2GOv0yOEJjPzMds+kogKAJA+mLBIHuG9vgK2n4vkfHOrM
	5j0m/O1wJwVKjre13rv5GIAlvXSwvsviQfs8VZr4kXgh2KTc3pd9POQZOYMFeuJ++kbkWb4QLVH2j
	EJBbmu3AvNfo5bJQpTHpJlRU5WcTQrnOrITG/v6eLgv/8J5rMg13/et7e++t7w49kzwLIPTssxVPB
	/6Dkkqtz1z/jQj3Fzhew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTEnb-0000Xz-Na; Wed, 22 May 2019 00:08:03 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTEnY-0000Wz-SR
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 00:08:02 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3E61D891AA;
 Wed, 22 May 2019 12:07:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1558483676;
 bh=b7vi3evCHUpG9dV383KMpTjNqi3Fn1SneFPfhOJgyJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=R8M9aUSD1FTAVRNfnrEUw4AiKn7BYdJeZDYb+k+O0W/8RnPemSonF9fiTAdaR8JCK
 5pcmTeC0yArLIfyKExGsUFKPXmWb2X3/3IrFHz4krQ4AIJPC3EOpfJei7MJFco22Lh
 XRg6KFYR3yY6TrSPsBw+medL2YpJuV5FWBxD1tdWCn7E49NTrCZ8J1ON81eyN9zrdr
 jlzggLasDzg+/ldM1uvz2AU5w6OazA0lKK8BpFJB1nb81LZ7m9j7jJ/vdsz4Y2f4Hf
 LY2e43vuSaxqkyq8TXKsAtjKzA+8U5NCdFgOrLuBLvbUbCgCrBb5M+PkTIMTwXuG0d
 Y8wV+N4WSdxlA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5ce492db0001>; Wed, 22 May 2019 12:07:56 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id 2DC8A13EF07;
 Wed, 22 May 2019 12:07:56 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 878251E1DDA; Wed, 22 May 2019 12:07:55 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH 2/2] mtd: concat: implement _is_locked mtd operation
Date: Wed, 22 May 2019 12:07:53 +1200
Message-Id: <20190522000753.13300-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522000753.13300-1-chris.packham@alliedtelesis.co.nz>
References: <20190522000753.13300-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_170801_306340_4A0BA3E2 
X-CRM114-Status: GOOD (  10.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add an implementation of the _is_locked operation for concatenated mtd
devices. As with concat_lock/concat_unlock this can simply use the
common helper and pass mtd_is_locked as the operation.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/mtdconcat.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 9514cd2db63c..0e919f3423af 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -496,6 +496,11 @@ static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return __concat_xxlock(mtd, ofs, len, mtd_unlock);
 }
 
+static int concat_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	return __concat_xxlock(mtd, ofs, len, mtd_is_locked);
+}
+
 static void concat_sync(struct mtd_info *mtd)
 {
 	struct mtd_concat *concat = CONCAT(mtd);
@@ -695,6 +700,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd._sync = concat_sync;
 	concat->mtd._lock = concat_lock;
 	concat->mtd._unlock = concat_unlock;
+	concat->mtd._is_locked = concat_is_locked;
 	concat->mtd._suspend = concat_suspend;
 	concat->mtd._resume = concat_resume;
 
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
