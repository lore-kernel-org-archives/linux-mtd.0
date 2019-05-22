Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EF8C072B5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 00:08:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314EE21773
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 00:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="phGfninP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="svj6280m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314EE21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dR2bHz/JO9Rio40IRow2L5Li9an6bfCn/iDiO9DUpdA=; b=phGfninPD1jVke
	LHGKozFDO4qRpYGY6eQO1vPyt5ner+HW2CsSAbFljn8tG48zALzdpJXYgpCSDf0COt0j8D+B6As1r
	06g+u1bJMgSaUDvWDunohjiF2f07EA02Hqs+ExUczyhfoBjHv828YkJmb06hUJwsk46ZUOjdkWDWQ
	DuHXVlEXHESCNS1KyZnfVO6rMlR/qa3pQT0OSZo7xMhd57GZ+FI9kJCLCWwuCTNAmNmNLV7YFU2gf
	aNm85eOYOrQ/ZokrQF3uVk2Xhsdsj9jp5CFlJ/JnPP36ims5jXGxpSWlw3AmIztvC9Oi1yTQs1pw3
	qxdzPokgpUS2ji2JiHEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTEnh-0000gI-Rv; Wed, 22 May 2019 00:08:09 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTEnY-0000Wy-SO
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 00:08:02 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 38C8C891A9;
 Wed, 22 May 2019 12:07:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1558483676;
 bh=4vBMADYmnJSt2XlDMdbmk4Hf0OrCwBXEHiQQvrZH6HM=;
 h=From:To:Cc:Subject:Date;
 b=svj6280mLrmcPUSBHSGiN8f6seclFeA+xN6F74OrwbVPfOoDTnbMznq3Z6R8wYOtX
 45zn1y5GHvXrdOcS1tLPOTVNC/j4Lke3YMR6rI3RFomy6LjSssuKZJ1yDb4jLqZUYD
 1JsugsEVlPk2APR5lcJx10ms/5lz0ftAnqHFAx6+nSmTnaEpZQAHdoYiPEWykdrZJ+
 JyZjdIQXdqF5N0V0Q6dRNwrsct2GpcjBr1jh6TGChD6lCmSxOatcWrFEzIg7wojShh
 rBUj/DVhlVv9sG7s/jYI3+VgwRFgpJ1StJ0TWWDPg1fZJHpfiVO2+LYwBF4Ekgt7as
 CU6SEUWq+JvQA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5ce492db0000>; Wed, 22 May 2019 12:07:55 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id 11E2013ED45;
 Wed, 22 May 2019 12:07:56 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 6B6781E1DDA; Wed, 22 May 2019 12:07:55 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH 1/2] mtd: concat: refactor concat_lock/concat_unlock
Date: Wed, 22 May 2019 12:07:52 +1200
Message-Id: <20190522000753.13300-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_170801_306143_DD924729 
X-CRM114-Status: GOOD (  11.59  )
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

concat_lock() and concat_unlock() only differed in terms of the mtd_xx
operation they called. Refactor them to use a common helper function and
pass mtd_lock or mtd_unlock as an argument.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/mtdconcat.c | 41 +++++++++--------------------------------
 1 file changed, 9 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index cbc5925e6440..9514cd2db63c 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -451,7 +451,8 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return err;
 }
 
-static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int __concat_xxlock(struct mtd_info *mtd, loff_t ofs, uint64_t len,
+			   int (*mtd_op)(struct mtd_info *mtd, loff_t ofs, uint64_t len))
 {
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = -EINVAL;
@@ -470,7 +471,7 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		else
 			size = len;
 
-		err = mtd_lock(subdev, ofs, size);
+		err = mtd_op(subdev, ofs, size);
 		if (err)
 			break;
 
@@ -485,38 +486,14 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return err;
 }
 
-static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	struct mtd_concat *concat = CONCAT(mtd);
-	int i, err = 0;
-
-	for (i = 0; i < concat->num_subdev; i++) {
-		struct mtd_info *subdev = concat->subdev[i];
-		uint64_t size;
-
-		if (ofs >= subdev->size) {
-			size = 0;
-			ofs -= subdev->size;
-			continue;
-		}
-		if (ofs + len > subdev->size)
-			size = subdev->size - ofs;
-		else
-			size = len;
-
-		err = mtd_unlock(subdev, ofs, size);
-		if (err)
-			break;
-
-		len -= size;
-		if (len == 0)
-			break;
-
-		err = -EINVAL;
-		ofs = 0;
-	}
+	return __concat_xxlock(mtd, ofs, len, mtd_lock);
+}
 
-	return err;
+static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	return __concat_xxlock(mtd, ofs, len, mtd_unlock);
 }
 
 static void concat_sync(struct mtd_info *mtd)
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
