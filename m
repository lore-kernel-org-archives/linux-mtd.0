Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11267C282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 23:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9DB32075E
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 23:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z+a1UqJm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="SpQUo2kH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9DB32075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qdUgXmb2aiJ5dAmqQPwjV9vaLqEjAG03pQ7WCdV8m2o=; b=Z+a1UqJmwr0gY3
	34UngS1gxc0VF143s8UY0O+5wYlHyFB5jU7ltihanp5ltt1t8hRUWV20JKMMTLJiclcpr8Io5+e5T
	pQ8DSSfTA9WCWp/FsY23thT3vRhkZjz55bBzuTdisMcUvomCeSQfEhi2B3uwKNw3FiqIof9Ez35y/
	mGynMhwjZAWqVQ8Wqj3ArA4nLqs5L6R1zbW3RP+BSVIyl+KqG9MPaXPIv/MYsZb21YKhotj4lznsx
	gKlVSeecztpJPSLZXzHNmAKPbHNV1/0OEVnWo8+mxFAmrETaCFu5kR+oyjPtn1tymXqh20n92Y1CE
	j0Qfpo8/teyeidIA3Yaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTaWe-0003hF-M8; Wed, 22 May 2019 23:20:00 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTaWa-0003fG-T6
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 23:19:59 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 24A96886BF;
 Thu, 23 May 2019 11:19:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1558567191;
 bh=dtuLuNHN5PQXizzBuOQOvLynHSt8GJ82TtRR1qtMiT4=;
 h=From:To:Cc:Subject:Date;
 b=SpQUo2kHmD9iW+Med7PaWO1niPYiux1juSNW5zZ+hmTaQegqk6dRKUW2/a2F6F/6R
 UCFcsFHG90w2vrERyM4A1Tl5dzIAjNyZmluapsp2A+ijCXkUd2orNVBWzBUxobvqOD
 PYqhcCWnJFmkbdcZ5X7Zd3Tl9e2A/RGvnw0XRl25gt/c7VB62DbiGklci2typO0AKJ
 ZEAP9j5n13dDd8ZbcqwRZt8S+rElczc89r7+wGeWhX7H5SMR7r6ZpRr6pZEQZonGMt
 CStO64/uSfoKsbcAJt5hutzpPxyFEAL0x50gFK2pNg3GmvoHcWixo+qXUPLjTnGi8t
 H2TGANI+Z2+0w==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5ce5d9140001>; Thu, 23 May 2019 11:19:48 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id 0EA9413EE11;
 Thu, 23 May 2019 11:19:51 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 601B51E1D5B; Thu, 23 May 2019 11:19:50 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v2 1/2] mtd: concat: refactor concat_lock/concat_unlock
Date: Thu, 23 May 2019 11:19:47 +1200
Message-Id: <20190522231948.17559-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_161957_325173_C0C33697 
X-CRM114-Status: GOOD (  12.59  )
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
pass a boolean flag to indicate whether lock or unlock is needed.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- Use a boolean flag instead of passing a function pointer.

 drivers/mtd/mtdconcat.c | 44 +++++++++++------------------------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index cbc5925e6440..6cb60dea509a 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -451,7 +451,8 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return err;
 }
 
-static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int concat_xxlock(struct mtd_info *mtd, loff_t ofs, uint64_t len,
+			 bool is_lock)
 {
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = -EINVAL;
@@ -470,7 +471,10 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		else
 			size = len;
 
-		err = mtd_lock(subdev, ofs, size);
+		if (is_lock)
+			err = mtd_lock(subdev, ofs, size);
+		else
+			err = mtd_unlock(subdev, ofs, size);
 		if (err)
 			break;
 
@@ -485,38 +489,14 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
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
+	return concat_xxlock(mtd, ofs, len, true);
+}
 
-	return err;
+static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	return concat_xxlock(mtd, ofs, len, false);
 }
 
 static void concat_sync(struct mtd_info *mtd)
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
