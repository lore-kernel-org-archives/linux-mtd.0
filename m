Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91061C43603
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 00:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 588F324682
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 00:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gID8hJUY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 588F324682
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z8QUDOef1n4VSyChXl0yOx0WcSLAe38Hj8RRkRTCW64=; b=gID8hJUYmTp9cC
	VRWlUzReBWJIfZXn57ROpXmorjmUhfgZFSJc7f8X6UHUCmqCOHze53NaqjfGqCSzjPu7kG38sZD6V
	Vjq5HbNbQp9QuM2Qv4uPcMdFi8VA6SG3ClDbMYJi6d/uYUOKStmMD5RckzOMJALq8gDegeY0rI7Gx
	1AozWr/M9AzeTkvXKAKG/zHvP3+5/rxfDN1rwEdPP1gsvQaK5pQ2ZSRs+Jd44gAGExQF0+0p9nQmg
	HgeJPRc2wNOhvebIvMQDKYNRKZZ4VBFp1+ZZBIa3PNgM5oKrVDQiiITn/wvHOs8mmwRG6ZLK/MTEc
	BM3Mjmrb6gJh9I5h66bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igeNl-00038X-UB; Mon, 16 Dec 2019 00:37:05 +0000
Received: from mars.blocktrron.ovh ([51.254.112.43] helo=mail.blocktrron.ovh)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1igeNf-000382-FE
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 00:37:01 +0000
Received: from dbauer-t470.home.david-bauer.net
 (p200300E53F3D290000400B22E5297AB5.dip0.t-ipconnect.de
 [IPv6:2003:e5:3f3d:2900:40:b22:e529:7ab5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.blocktrron.ovh (Postfix) with ESMTPSA id E74E522733
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2019 01:36:51 +0100 (CET)
From: David Bauer <mail@david-bauer.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Add support for mx25r3235f
Date: Mon, 16 Dec 2019 01:36:46 +0100
Message-Id: <20191216003646.340403-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_163659_661649_EC83B189 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add MTD support for the Macronix MX25R3235F SPI NOR chip from Macronix.
The chip has 4MB of total capacity, divided into a total of 64 sectors,
each 64KB sized. The chip also supports 4KB large sectors.
Additionally, it supports dual and quad read modes.

Functionality was verified on an HPE/Aruba AP-303 board.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f4afe123e9dc..4d776562939f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2434,6 +2434,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
+	{ "mx25r3235f",  INFO(0xc22816, 0, 64 * 1024,  64,
+			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
 			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
