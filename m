Return-Path: <SRS0=faTe=OB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE702C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Sep 2021 13:38:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9845061205
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Sep 2021 13:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9845061205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9EtF/aIODWhPvUQSdRBAA1FxMXDJxsBDvD4TVSXjh1M=; b=27vhx1VVOwY6Nk
	HGwf03QSDoowKCrVegQ+pbKBbAB8+GYTk1E2hBqrRhnQgeZLmrFWb1hYrcO5ldQnP1/n0g8XQ0Ypo
	LMQoWcHIzJiyFA5QbZMKWB6QcRHSVKvepSr/+vfA07n1BTRLbtjUXo8cIE+dLwxrwH6x///rftEWa
	EqJP2VJwwh+17XhIvxfbhK3/Cd/5oYLWq2AAf7DWfFksQAxLdSm9BRF76qKaLAuaW0fgDs3ylx1dT
	K73NlSqjBCMv2z6oSaFzV6IJ/E6wMOEPioYaY+AMF5tIo4ojfpDFq0K95qF7xUfuY41SNCYNBVNzw
	I1PYgZvBwBWd627HQAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mP3Ck-00F1V6-1q; Sat, 11 Sep 2021 13:38:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mP2q0-00Es34-1u
 for linux-mtd@lists.infradead.org; Sat, 11 Sep 2021 13:14:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC8D56135A;
 Sat, 11 Sep 2021 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631366071;
 bh=ltZZyCsnjnNoe+sQ9hulck8kwCSo5dN6HI0l2iLLg8g=;
 h=From:To:Cc:Subject:Date:From;
 b=bhNCFMyywJP/qeYXNfLMZqr07wAwAZ9dANCL4pj9E/WjpfaA3nHQJV+eTMNXuIFjC
 3pX3lHqNvG+PSAlFY65MoWfA8jfCzbG4sGRVK1UUM/DJKaSHowgH95R2wj1z+xQ84p
 6/9S75qrfBbhbgQmXqMtbCawkGLP7a0TbuRnvW9vmJkDf8LBGK+xoxUnhj8j9s8/hl
 w5sxK3I/vdcwFGFRuBoN/JBhEo6apn2F9B9I4FkBzzjo5CiVRIZ3iHFR5Q+9FJvu59
 vcDLQmme5EHm3hYJixEU3HVrNMb1z0kfRtrxc35flx+6GPd0QpF2ZJeWj1qUZpvqkq
 xNM2UYWFtEPXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Ryan J . Barnett" <ryan.barnett@collins.com>,
 Rob Herring <robh@kernel.org>, Sasha Levin <sashal@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 1/2] dt-bindings: mtd: gpmc: Fix the ECC bytes vs.
 OOB bytes equation
Date: Sat, 11 Sep 2021 09:14:28 -0400
Message-Id: <20210911131429.286330-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_061432_182874_6AEB4E4D 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Miquel Raynal <miquel.raynal@bootlin.com>

[ Upstream commit 778cb8e39f6ec252be50fc3850d66f3dcbd5dd5a ]

"PAGESIZE / 512" is the number of ECC chunks.
"ECC_BYTES" is the number of bytes needed to store a single ECC code.
"2" is the space reserved by the bad block marker.

"2 + (PAGESIZE / 512) * ECC_BYTES" should of course be lower or equal
than the total number of OOB bytes, otherwise it won't fit.

Fix the equation by substituting s/>=/<=/.

Suggested-by: Ryan J. Barnett <ryan.barnett@collins.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-mtd/20210610143945.3504781-1-miquel.raynal@bootlin.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
index fb733c4e1c11..3a58fdf0c566 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
@@ -112,7 +112,7 @@ on various other factors also like;
 	so the device should have enough free bytes available its OOB/Spare
 	area to accommodate ECC for entire page. In general following expression
 	helps in determining if given device can accommodate ECC syndrome:
-	"2 + (PAGESIZE / 512) * ECC_BYTES" >= OOBSIZE"
+	"2 + (PAGESIZE / 512) * ECC_BYTES" <= OOBSIZE"
 	where
 		OOBSIZE		number of bytes in OOB/spare area
 		PAGESIZE	number of bytes in main-area of device page
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
