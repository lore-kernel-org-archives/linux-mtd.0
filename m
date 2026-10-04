Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDDBCA5FEC
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaGxNAD3tgMLzqrAq/NYqflCa65bChfbt6Ercdaav34=; b=PTkYZXfMH6ZheJ
	XyBGLyo+nO2w5re0IpRgOeSeRyqLSg3wq3dPU1PKpr1oEVNDnbsVBRQF417j33IuIixAG+zfs2mr9
	OpHa8TEsgoTw6M+I8PkoqE2128Ul8AW0AENYR/cSqMowB7pUoK8QlPEouf2AxsAdI/CUwTpbG6K1n
	ioRMal1EwR6s6u/5nyN9kYE9XgyWWCyW8FWxre6/lPV2pW/tXK0W2Cbj4DKFRkMpAaKSS1hBKqxtY
	XYtv25Ghhsx8OlQSxIe1o+6FhTLFevOjr4K6tatDdBuooBvyVTbdQIfDD31rc3WXUQBjyPZMKeqpj
	HlK1Ev5+H9FlsDLbscMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTo7-0000000FMdc-3sJb;
	Sun, 04 Oct 2026 21:31:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTo4-0000000FMa0-29oL
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:31:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F40BF1A113A;
	Sun,  4 Oct 2026 21:31:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C87C0604FE;
	Sun,  4 Oct 2026 21:31:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F48610328492;
	Sun,  4 Oct 2026 23:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149498; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ear8Ahh2j2AUiHu3vy3cVps1i5/MTD54IMpodJAajE0=;
	b=1gpn/J9qPSBCK7X/5gmL6+kKQo60dhjU1+rlT8AL7f4fKfZdlMabeTXi4bCNQ/OtOfeKr4
	icD5W9Lg3xRBJE/7MaOT+lqLG7FfZ8+sCS4QFYnAXzFHgNY5eAZbUJjY51DylrN4WA/uW1
	z7Z8fxAPzCH8b/15ggxA+Rpkdxg1fXK4Q4RE/kSjBDm33Kgp4NHGorz+QeUr4nC6nkQDgL
	PIevmOff2ZHTnlSuPBndtfL4IByAAL2LnBxkJ/gNf/zwWWlMiJl+QFIKHIk6d9qoa4ZgI4
	ItGPOtKW3igQOdaYqei+11nOLUjXXHgv+irkcsR2gZlHLLnlJwiTJiaSCvy9bA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:18 +0200
Subject: [PATCH v2 04/17] mtd: spi-nor: Fix comment indentation to clarify
 the intent
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-4-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_143140_720021_DBEAF964 
X-CRM114-Status: UNSURE (   8.21  )
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

The comment is misaligned with the content it describes and this kind of
bothered me when I first read that code. Move it to the correct
indentation level for the sake of clarity.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4b9e0410f2f5..2bbec3feda39 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2459,7 +2459,8 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map)
 		 */
 		if (!erase && tested_erase->size)
 			erase = tested_erase;
-			/* keep iterating to find the wanted_size */
+
+		/* keep iterating to find the wanted_size */
 	}
 
 	if (!erase)

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
