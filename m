Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD802C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 17:38:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54F3B619C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 17:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54F3B619C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pm.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:From:To:Date:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xIpf38qOBLAqOsiefevPhNCOjab1/ExPgkLRiNDNqiY=; b=PBRw7IcQG4DT3URE/f8pNQ+X/P
	ELV8D/hdKMm33SHvK0PKPWk4i2/ISwhULki/76umtRzrWX9GjIU145fv8WBYpuXzOU28A2WjLi/Bs
	nyRfbL5WzPE0VVsuvw6HJ6Um0iwqmeNLMYYJog9iRwkdqZeZMfXpCDJYkDJUB8HoZX7duklETm+uK
	dS/gL2KD9eHsCY2KzHdok04kHy5TK/g8lpIrdqwTzRRS6BwZvu8Giswr0dxJUBmF7jL6BGiZdFJ/C
	g/vI8GzmmizIF+p7oaYz25+Bl4ARXYbawBxpp5LvYcCVRNUwvwrbcl+KgX01qhGsmzvjeHRLMPUBK
	4Smq90AQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOkyN-00FQZk-HX; Tue, 23 Mar 2021 17:37:43 +0000
Received: from mail-40136.protonmail.ch ([185.70.40.136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOky7-00FQW5-FQ
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 17:37:29 +0000
Date: Tue, 23 Mar 2021 17:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
 t=1616521045; bh=B76jZ93shqjUOUQEXOsghNFmKmbiN4UEo8ixi177UoA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=XygTCk2L+LU5D4FsgMrA/7EH7eqjNqqfnnAceMgTGvAvic+o8zNuuiUHbrrl05uEZ
 VgG/kaqtVhJkyScYcgjmkuXv0QX4x8LUHro1MoZMUMV0X7Eaav8TzU/6e6bLGi5gAR
 eNxGVUDiSJsAneAjka7gPkqztAdxGAXTmdFKEwbmsno8dsmsLaYO4OotH0/SvP4yis
 H8ftHLGMQH40O8P88PNF0wVbD7vlYFTZMwMrvv1/Gm8mc6v4GuSYKIHoRsKfd33P3x
 +LGxwD11CWjLiLCJvZ+4e1S/cjqlvzHRIL8f/6WlqU4SriImQnwPEDSC3HYj7cLxFm
 rDFO73qqbWPCw==
To: Miquel Raynal <miquel.raynal@bootlin.com>
From: Alexander Lobakin <alobakin@pm.me>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alexander Lobakin <alobakin@pm.me>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 mtd/fixes] mtd: spinand: core: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <20210323173714.317884-1-alobakin@pm.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_173727_608037_17CC8688 
X-CRM114-Status: UNSURE (   7.39  )
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
Reply-To: Alexander Lobakin <alobakin@pm.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The module misses MODULE_DEVICE_TABLE() for both SPI and OF ID tables
and thus never autoloads on ID matches.
Add the missing declarations.
Present since day-0 of spinand framework introduction.

Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Cc: stable@vger.kernel.org # 4.19+
Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 drivers/mtd/nand/spi/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 61d932c1b718..17f63f95f4a2 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1263,12 +1263,14 @@ static const struct spi_device_id spinand_ids[] = {
 	{ .name = "spi-nand" },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(spi, spinand_ids);

 #ifdef CONFIG_OF
 static const struct of_device_id spinand_of_ids[] = {
 	{ .compatible = "spi-nand" },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, spinand_of_ids);
 #endif

 static struct spi_mem_driver spinand_drv = {
--
2.31.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
