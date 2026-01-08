Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94E9D1D483
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 16:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5r0y88QPsIFRwaI0fkh7tL00IZmy4bZzYlaZZQyKVsk=; b=N3BHALduoOdOq1
	IQSHKxwOeLaly/LmeIGbGCMLfTaiYpHYqDbo44SDvWmfusKTIz0ZG0CCP92hS7BUyX8gP2prdQS5O
	bvY9AEEW9yxTB4jBhFd3lAG3zEvUJj6gB2hfTh7bsvB5CXM3uCU9jCHsFl0uK84HT3MV0ewUhqgBf
	L3IpO2z/iyYHSpPtMbAdvWXzZB5486eCTvuE+0T+TwZUESEcPQ7qDb+N1ipGwOJVtk6v2i0/FDmwK
	iBzYHfEOrIqYMj0+FYzn3/bRkOZysNlTO63cYF7X9gGFqK6pcmcHwcKbtqZ6a4Ey08sRDztCnQUbm
	Z8V3tZFPLQDf0P0vixBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLb-00000000F6a-0clc;
	Thu, 08 Jan 2026 16:58:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLU-00000000F3M-16Nr
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 16:58:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D72DB4E42005;
	Thu,  8 Jan 2026 16:58:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB1726072B;
	Thu,  8 Jan 2026 16:58:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6CA6103C86ED;
	Thu,  8 Jan 2026 17:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=stZFrqO/Xzy7EKE+3DmnORMCs6+d8LeG2HLgrVddfK8=;
	b=gqtQnL2OsdXjNBE3M9/quf5kgyFJI+wHYRhHS4X87X5BdpzOWU2QntXQxPTTfkcgMvgPaV
	cR88U1jJxTHYyfS6poHH1RfMxWnDHfKPR6Mgm2lGDMbYg1vEiZizGk6JWHtCAhk0D40n4F
	cpEU2DRS+obfm/uqu09+mCDv8kSIMneYX+CHCXiGquQ3Nkqd5M3OUiGw6ZIoFcl9y/Naqm
	1HFcuTwFrGjgVrIB+rwwXqy1LQlfCyj/yo4GgfUf6L6Wv02UwcyjQVrHfd8vYcQ9nuu9AQ
	hJi8oNaTUwn6kjzBPcaEQFcCXXrCmijUE0dpUpIb9FUK/HmrbyMlH27i5cj1Rw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:35 +0100
Subject: [PATCH v2 02/27] mtd: spi-nor: debugfs: Fix the flags list
MIME-Version: 1.0
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-2-c462ef806130@bootlin.com>
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085848_453939_4A98FAFF 
X-CRM114-Status: UNSURE (   8.12  )
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

As mentioned above the spi_nor_option_flags enumeration in core.h, this
list should be kept in sync with the one in the core.

Add the missing flag.

Fixes: 6a42bc97ccda ("mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode")
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e..d700e0b27182 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -28,6 +28,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(RWW),
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
+	SNOR_F_NAME(SWAP16),
 };
 #undef SNOR_F_NAME
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
