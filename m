Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25629C38A2B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 16:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E29CE20771
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 16:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ruN0cdPw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="pttHWZjw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E29CE20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kalray.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DFp2wHRDHlCSHWNLs1tT+NkjCu/NsQ1QHmpsgJefwKM=; b=ruN
	0cdPwh6J61fkAeIyMzcOACBF7BZY5sg0v8GtDamdInSKjt/kFB0QBMTirX6O2dAec8rRztYg/X6Zl
	nSAQRPEdJUBZqj7NEArbFll7Wr0aEfGRxeUmToLs4NLGSpSLIbvdUfU3yELiHqNQfP/0lrC3TddwU
	TrTc0LhsdKlIz4LPP6iT79tFKIOJSCPVvJohHpL3XHOkDgoP01LJ9JXFPGTQ6ht7HzOWcc1heNINk
	74RVgE2QM9UqxMVk/66ip8nFJyFExb+AAdDA7L1r8a3JyJ8IeFYy6MyCvwGZ2voEplyhUhZpWk0z8
	DwRlUugQHtgvslcfxnA3zlpV2CRpcFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPTXy-0003zK-DF; Fri, 17 Apr 2020 16:08:54 +0000
Received: from zimbra2.kalray.eu ([92.103.151.219])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPTXv-0003xt-41
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 16:08:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 5059527E0309;
 Fri, 17 Apr 2020 18:08:45 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3U24o2SO9cAJ; Fri, 17 Apr 2020 18:08:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id ECAFB27E1067;
 Fri, 17 Apr 2020 18:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu ECAFB27E1067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1587139725;
 bh=sx+djYT6EDn7Q6RGYYL44ynm4lV5rbPgKHjmZiKPWGg=;
 h=From:To:Date:Message-Id;
 b=pttHWZjwG2thkyPGHMatgEPY/UdUcFC+hIO7kc7Lcxc6VKHBmUZpsMe3CqdCOLoM9
 +zjm/6GuR7RtW9VstkcGrQkovWea+YL931GohBXN/aA7rwFcO6gWTJSnmC61MepyRk
 MClHbYBOq7wkh735Bum83g01EUUT6+GrxkTeTFDw=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0Xej-1LMJ6RT; Fri, 17 Apr 2020 18:08:44 +0200 (CEST)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id D494327E0309;
 Fri, 17 Apr 2020 18:08:44 +0200 (CEST)
From: Clement Leger <cleger@kalray.eu>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: Add support for is25lp01g
Date: Fri, 17 Apr 2020 18:08:39 +0200
Message-Id: <20200417160839.25880-1-cleger@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_090851_336302_5372CD99 
X-CRM114-Status: UNSURE (   6.39  )
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
Cc: Clement Leger <cleger@kalray.eu>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update the issi_parts table for is25lp01g (128MB) device from ISSI.
Tested on Kalray K200 board.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/mtd/spi-nor/issi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index ffcb60e54a80..c3c3438e3d08 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -49,6 +49,8 @@ static const struct flash_info issi_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			     SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
+	{ "is25lp01g",  INFO(0x9d601b, 0, 64 * 1024, 2048,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
