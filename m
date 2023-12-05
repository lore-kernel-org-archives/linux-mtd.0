Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843EBC4167B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uC6wiKAXyPU6GeClasWZXXLstnFi/y1Gi/41jCPqTmM=; b=mVzsy7ayqIi74D
	412i4ieIhSQk5WUo8hK6j2rP0kPsXI3kp/TPDuD2A9k6zdoVYOZaTYEcoNMSTK3jPOi5nsvDv2DoD
	iR1x/HSbAQQ5OswHncNpJp6oF3JD7gC3jDzR0OGNScO6PtWjcWEmSQ5tVwteWUVUx4MXV9WeOzOTS
	Fo4qqGgnA8ABA2HA9RF5xhTpE8pnbckjL8WCEMfYkLCKFPckcWZBAgTcU9vqW6jJ7NCJPGxHJqyJq
	5goIMFW+IbnaMOBQf0/N953pdIcruqXgD+3td6L5RthcTCtyl1V8J1y+rsIj8cjmGE4t2nYzRGRvr
	xIPFnnccHnX0bLVsFzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQGR-006YSO-0B;
	Tue, 05 Dec 2023 07:54:43 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQGO-006YRG-20
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 07:54:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DFCC24000D;
	Tue,  5 Dec 2023 07:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701762874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mveg92uhkODl4PAA/TPX11uevKTfHb0GzKwRpGWkKpI=;
	b=HkKYSk0VgqiiAeMAIrofjBQ4tOsRVwQWSrviTA6ddNdTW744BexGmZxRIKVb1QTBZMpMf1
	HZgXAsQk8eW9Trs83PYt4enxIH6mukGCj6rUkSZipZwyoy/X6wWPZTm1m32AImLo+eZowA
	mtjjq1h7u89B2uZf85VfwVOhXicrI4DmCzEUexIf5akgBotT14mtwLYY3uxl6YVMiOdX0C
	L1BcIxO6hxLELNg5dcxfnQqdFILkkziT9ipHtgRgZRIsKG0q7M32DSyhtONwRcC8rjHCqE
	vwDesw2tt+t/GttK5JIFvVlP+lk6Kt/yA9KbvaFhwy4UqxjOzxCgzZekDfOeLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: ssfdc: Remove an unused variable
Date: Tue,  5 Dec 2023 08:54:31 +0100
Message-Id: <20231205075431.13401-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_235440_793901_545EBE81 
X-CRM114-Status: UNSURE (   8.52  )
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

Since its introduction the driver was declaring a "usecount" variable,
but nobody ever used it upstream.

This was spot while grepping for usecount through mtd/ for other
reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/ssfdc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 04da685c36be..211f279a33a9 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -18,7 +18,6 @@
 
 struct ssfdcr_record {
 	struct mtd_blktrans_dev mbd;
-	int usecount;
 	unsigned char heads;
 	unsigned char sectors;
 	unsigned short cylinders;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
