Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C714AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/UyOn/11QWuvOJfzLTwWSvLcPGFaelTSRA92NlGev8=; b=nxknp+O7k/jTrU
	bdSNshsncrqA9yB6X2SdYfL3WvmXlcj4n141rzO2+m0peQ+9MVP1C0D0KHydzaSJaZnwMlSgpqPRa
	8pttcp2e+AlNULL9mpcTTtWf8GZ9bQH5cmPPOliRCYqKx97La8ls7uMP5UUsk9FJQ0q7Vd36whIiY
	SVJN8RtaP0RgYU6Kdv1nxFOCEwHC2HjT3euNdNAnY69G0u+kE8J7jURsRN/JQ0UVp5TAiM5pt2sHX
	xCXXTvxTkpNqNkdcrJasg4WmarTw9n/jsfhORhtgLjCB8oWUIpq2nvilHLfQFScORNiROAz7ZHbz7
	lNDJ5g/bqTG8YwZWlfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1m7n-00GQd0-RD; Mon, 27 Dec 2021 09:16:59 +0000
Received: from mail1.systemli.org ([212.103.72.247])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1m7k-00GQcd-1l
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 09:16:57 +0000
From: vincent@systemli.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1640596610;
 bh=XSlDhLS0PY3whQE3FsLa0lnWb5KF6DE9MjaGACP5GYc=;
 h=From:To:Cc:Subject:Date:From;
 b=RwLi9hc2eBLrcECKDpsbZiDA5iMmsUX5BGKeykMOmK2g+hPpM0txApmTgeV5/UKtW
 /fUkZvJPJYqOC1xAFY1QS6LioYQgRFbmjYGfkQz8lJIMrHDl1LJLhKZl7ewA6JAbZT
 N7IVjiMwZjzVgeA15KsbMZpp4DqwXxC16nkxhqJDrUtj4GpBCLwmTYugSdmUsyy8n7
 RyCRk5P1FZ0eapxWOmSaMnVfzNdVSueja33/jupfn8tjDPhJd/Cmem+anLRjUhfbal
 LgX94y16BOIuHtorb+L0Eyz7UN/3mP4s9HOLs/anBaJqPqetvy2UDOO4y0GH7+5yL1
 aqQbCaNf1KAyg==
To: linux-mtd@lists.infradead.org
Cc: Nick Hainke <vincent@systemli.org>,
	David Bauer <mail@david-bauer.net>
Subject: [PATCH 1/2] mtd: spi-nor: locking support for MX25L6405D
Date: Mon, 27 Dec 2021 10:16:37 +0100
Message-Id: <20211227091638.177917-1-vincent@systemli.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_011656_427836_A5372950 
X-CRM114-Status: GOOD (  11.65  )
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

From: Nick Hainke <vincent@systemli.org>

Macronix MX25L6405D supports locking with four block-protection bits.
Currently, the driver only sets three bits.  If the bootloader does not
sustain the flash chip in an unlocked state, the flash might be
non-writeable. Add the corresponding flag to enable locking support with
four bits in the status register.

Tested on Nanostation M2 XM.

Similar to commit 7ea40b54e83b ("mtd: spi-nor: enable locking support for
MX25L12805D")

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 drivers/mtd/spi-nor/macronix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..f07b59a4120a 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -41,7 +41,8 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
 	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
