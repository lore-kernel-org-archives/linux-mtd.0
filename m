Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264FBC43603
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 20:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA0221775
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 20:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AkpnTrDK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="LkD6InFF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA0221775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e0nGg3LH9r0+HgMp2DRFCxyWCVc0GJpD76L9WvCTml8=; b=AkpnTrDKZV9Qdz
	q05dHAlQbE5XGJE47+KgwkJDzxKMuHS6NcNJnWuzzt5b9XBC1DRA5+BMqyG2o8mrPOcHlg4diwhgV
	qYjyiHbdBX5DRZ13fOgj/hWVzkZKvSVF2XBAqu8MNEcstVfuqkXaG3cw2ZdrCBOGQ9ZcUxq1li7+R
	sNOg3kuJBzsLVV68LVbrge4b8hiCenASErhjB96nVxNIt+wjGyCC47LVfr6C2J3/da4ilYhDk/by1
	Zv7E4p+VWr/1hMs5DajdYecowbRps/fLsrsaFAxVQZ+kYcM06IJ2Lw7N/T7wfSIYYr5TN3jgNqnTC
	/7x/ekmDfSo0EW1yvujw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igxKN-0005yl-N4; Mon, 16 Dec 2019 20:50:51 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igxKK-0005xr-RM
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 20:50:50 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9D2A9891AA
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2019 09:50:42 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1576529442;
 bh=gz7O/ZQsS9198vO0r8pmAfVCLZeHpdOOGnhu/mvHoH4=;
 h=From:To:Cc:Subject:Date;
 b=LkD6InFFQfLwIuFIcgeDqQt1Wabu7MZwTDJKF0EBV9ITAc41SHTMKZ9S9kl8usGiy
 wQtW7A9O7WhD9u81J4uMqD4nyhsaPcoIyhb/rIdBTHFQfXpRB11nHTNCvAIjYxIBJp
 DNqDKHNQQDIO8fBOUlhCsjLF0eVTbROYNtlRfptj+cAkpDEAOvUWyksWVUKoHDJIJr
 pb/it81+qaMewnNse1A2Fm+bpd9f7pYECl8BfU1L7JNMOr0OvLYALCvABZaBu7yWNT
 fdKMP2F1XRI+CADgt+yK7hCzkP5FaDTEogD01Apl4HgucB0eP6F9dovuyaLU1WUJZR
 F7owgS4XHYVuw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5df7ee200000>; Tue, 17 Dec 2019 09:50:40 +1300
Received: from oscarr-dl.ws.atlnz.lc (oscarr-dl.ws.atlnz.lc [10.33.24.28])
 by smtp (Postfix) with ESMTP id 8929913EC5A;
 Tue, 17 Dec 2019 09:50:41 +1300 (NZDT)
Received: by oscarr-dl.ws.atlnz.lc (Postfix, from userid 1607)
 id 53C2A3C0612; Tue, 17 Dec 2019 09:50:42 +1300 (NZDT)
From: Oscar Ravadilla <oscar.ravadilla@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: brcmnand: Add bad block marker option.
Date: Tue, 17 Dec 2019 09:49:49 +1300
Message-Id: <20191216204949.5688-1-oscar.ravadilla@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_125049_243708_F61FF8B5 
X-CRM114-Status: UNSURE (   8.36  )
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
Cc: Oscar Ravadilla <oscar.ravadilla@alliedtelesis.co.nz>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In commit 04649ec1335f ("mtd: rawnand: Always store info about bad
block markers in chip struct") changed where the information of the
bad block markers are stored. It is now stored in nand_chip.options
and nand_chip.badblockpos. However brcmnand driver wasn't updated
so it now fails to handle bad blocks.

So update brcmnand driver to add bad block markers to nand_chip.options.

Signed-off-by: Oscar Ravadilla <oscar.ravadilla@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1a66b1cd51c0..68d37d1636ae 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2360,6 +2360,8 @@ static int brcmnand_attach_chip(struct nand_chip *chip)
 	 * needed.
 	 */
 	chip->options |= NAND_USE_BOUNCE_BUFFER;
+	chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE |
+			NAND_BBM_LASTPAGE;
 
 	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		chip->bbt_options |= NAND_BBT_NO_OOB;
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
