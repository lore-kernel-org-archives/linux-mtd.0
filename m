Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA07FCD5BB1
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6V16bWUTuKt3FsmoJacq1AtbPJn7lmcU41RPaZAK8o=; b=j0Cy06E+bRJwbK
	1IVF4gi5skNsa5/GlYkGQ8g6ExXtIVLR1Y1VK/KfcdheUBHzAYTElRHAukSkHeJgeiEMLzk2PfnJl
	GM5Zokojb6TOWnwSRQDRVhlD5e6Irdr87AWjpRCXKyCavmIcHXcJ0OxvMvojo56htxVBenkqW1AwB
	8MLAbOAQvExRgPM1DKhpqObLDytMuL27onPpCYAyY9elMa9+3aD19rpK5LkWvobgxpvyDnIqvBla3
	vj/wCPdpBIWA8E5gdGjH6lr221MSeTXqjA7BklBHt4wS+QBsSCeNIN9YspCLSyvu0eaW/YpHvG6Jx
	SXyWtaBQWUM1tcV4Wjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDj-00000002Flq-1xMx;
	Tue, 26 May 2026 14:57:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDh-00000002FjC-2gYa
	for linux-mtd@bombadil.infradead.org;
	Tue, 26 May 2026 14:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=fNfQtEn0rDKQ08xTLMyGfUSzqnBc/J5aa9LBz96hoMc=; b=cyaVZteBDI3FdPg80D89EH8ocJ
	Z25piz0DEeolGVzr2qxYymWojFQBHOU84R0sCxvuyi5HwUckoUisyKAvfqSQv3+lqwvE1igrCZ5C5
	2I24OR+5gtzPijUbav3H7XlbUEbrKh3cVIZc0a67RjXET15kYZvZRUt8+gK+PQC7Rh6RF0MnMxjYY
	bLU/yxEC/km7/UlmOLHyfIuHA9qfgmCInsBnudRvYrHA/0lFoNXEsHU/t1NYhykSd7ALgsaBE2a7w
	n8ukICJ47v3OnZxoIcAkMB6wTTSujIcRL39mlgk9GJPysyJfrlaXMqRkTWVhXLqmGY9jT/FR1h94H
	DYWTEV/A==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDe-00000001Bky-165S
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 41AEEC79ABB;
	Tue, 26 May 2026 14:56:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D80676011D;
	Tue, 26 May 2026 14:56:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81040108888CB;
	Tue, 26 May 2026 16:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fNfQtEn0rDKQ08xTLMyGfUSzqnBc/J5aa9LBz96hoMc=;
	b=S3+CyI0ghG88Z8U/qkK/B9aqs8PBZ1gfUkuD4dScLrjxiAc/Ut/ltlNVVUe9YTeBMEoPPR
	9B1E5PxL/eo+N/Y7f8U+HasYOV1kvYlLCBggX7p8VDXwi5EX04Oq7gJ6uIQ71v0jQIvIEO
	tbvv+qXGpPQmb1bMDtSykFZYQ0qo77GgwinYQx7yG1kRcO29n58WJC2zn+VckZLf18AUBU
	X2zc/cz8lyjGU6EzG8UT6iM8FL3sKEdQU0AWOBoVJ8k5IuBO8lJo0q+TjMtsCuu2pEOlYg
	Gw5QZpmpynGt6GxCyCBIp6vtE7HfYCCs1doVG1W9OLIEzBV2YC+sYIdjnitdKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:28 +0200
Subject: [PATCH v6 04/28] mtd: spi-nor: Make sure the QE bit is kept
 enabled if useful
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-4-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_155722_426332_130E7389 
X-CRM114-Status: GOOD (  13.96  )
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

Not all chips implement the 4BAIT table which typically indicates the
program capability, while many of them do implement the relevant SFDP
parts indicating the read capabilities. In such a situation, programs
can happen in single mode (1-1-1) and reads in quad mode (1-1-4 or
1-4-4). For the reads to work in such condition, the QE bit must be set.
In case we later use the spi_nor_write_16bit_sr_and_check() helper with
a chip with such configuration, the QE bit would get incorrectly
cleared.

Make sure this doesn't happen by keeping the QE bit under a simpler
condition:
- the quad enable hook is there (no change)
- and at least one of the two protocols is based on quad I/O cycles

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5dd0b3cb5250..394c27de02d6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -869,8 +869,8 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 		ret = spi_nor_read_cr(nor, &sr_cr[1]);
 		if (ret)
 			return ret;
-	} else if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
-		   spi_nor_get_protocol_width(nor->write_proto) == 4 &&
+	} else if ((spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+		    spi_nor_get_protocol_width(nor->write_proto) == 4) &&
 		   nor->params->quad_enable) {
 		/*
 		 * If the Status Register 2 Read command (35h) is not

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
