Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB727C433E7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 21:32:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716DB22267
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 21:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Re/dQe9a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 716DB22267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AZpAIHY4o0oghALPFZHsmBDeMoV5zy4dQoiOGGzNQLQ=; b=Re/dQe9apptntSB8xefVjDgCp
	wNRXVmBIKg3AcqLVC8ajqyPdKk9uO+s2ZACflSp7DNM4ncmVU+2DKg+HEWvbpSuVlAJIL7uT94FJ8
	kFLs1xTTtr3FbAH+YvGv3Pu4luw3QL9HIe+H7CBcz864Up8y9P1MtjfkiyZJYdcDiFrLcG4z1vSuf
	iY3KJ7yp43x5hsSTqyBX+AQITEuVV41Y/tcqq3uNpD29CnvXwbn1RYTXaOrwFw4XOj/1os1ELg9X9
	eBmQB3c7105hscB5b5zvxsGS+/3hAuMxOouC99/jkp10VxvAxTwVa+OL7zttCpXINayGlPn1Ww+1Y
	pQI/1zjIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUGH7-0005U9-LN; Sun, 18 Oct 2020 21:31:33 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUGH2-0005SZ-VR
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 21:31:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 558F91816C70F;
 Sun, 18 Oct 2020 23:31:19 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Z0016ic3gZEJ; Sun, 18 Oct 2020 23:31:19 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1H89e6CMb0k1; Sun, 18 Oct 2020 23:31:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH 3/3] spi-nor: Speedup mb85rs1mt FRAM writes
Date: Sun, 18 Oct 2020 23:31:03 +0200
Message-Id: <20201018213103.28798-3-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018213103.28798-1-richard@nod.at>
References: <20201018213103.28798-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_173129_146084_6C0C80A3 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: Richard Weinberger <richard@nod.at>, tudor.ambarus@microchip.com,
 vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This FRAM does not internally buffer writes, as soon the write
command returns, all data is stable.
Therefore the WIP bit is always 0 and we can skip the check.

The write command accepts infinitely data, the target address will
just roll over if you feed in more bytes than the flash can handle.
To speed up bulk writes, specify a page size of the sizeof the whole
FRAM. That way the whole FRAM can be written using single program
sequence.

With this changes I was able to double the write performance on
one of my systems.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/spi-nor/fujitsu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
index e385d93e756c..3152999fbaa1 100644
--- a/drivers/mtd/spi-nor/fujitsu.c
+++ b/drivers/mtd/spi-nor/fujitsu.c
@@ -10,7 +10,7 @@
 
 static const struct flash_info fujitsu_parts[] = {
 	/* Fujitsu */
-	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
+	{ "mb85rs1mt", INFO_PGZ(0x047f27, 0, 1 << 17, 1, 1 << 17, SPI_NOR_NO_ERASE | SPI_NOR_NO_WIP) },
 };
 
 const struct spi_nor_manufacturer spi_nor_fujitsu = {
-- 
2.26.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
