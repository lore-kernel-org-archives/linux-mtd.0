Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CF9C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 17:35:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B63600EF
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 17:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B63600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pm.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:From:To:Date:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tJ3DHvZnP9k+X2K/hlxFVX4cfVYUBEKcXwqxrFh3dl4=; b=ORQks61k3Oebu5NzThXrBbeLrm
	EMuk4GwpyvnLhpIsB9DZM+5IGqePn7CTAxAXQKwTd1vw9IrUm+X5cZg1oZjXowcfpLRHXATbU440O
	LrAw2eTkZLQzrWRXVCMzCCZ4PHohSp9pR5Dv25uk0J1os64k44ZOzRVvVwuxGwjq/YzTeouOWFgrz
	PvRyyCC++2OFURZsvyIegpbIadK6uvuogcsPkkzFaNzFfRJoBpv+rnq4ID7IJoZ2siFrlhZSfLC3L
	Tf5uL2ZprjihNEdCZ9qYFME53fPhd9GdSmrGOSZmEF/5GGCEjPzJ0MZLYjtmdHwt6b5oFuV71P/wi
	x898QY6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOkw2-00FQ1r-Ux; Tue, 23 Mar 2021 17:35:19 +0000
Received: from mail-40134.protonmail.ch ([185.70.40.134])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOkvx-00FPzy-5n
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 17:35:16 +0000
Date: Tue, 23 Mar 2021 17:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
 t=1616520910; bh=wu/vIyNG8bowz2h1UHHz2tTlQrq4yx+F+/I3ASmWS2c=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=F7FI/LY5Lnhz0FcaWuKQUxIHIkYGZXsfQWTjw0QVz2JavPkVkcUC0cTpJXpP0mlqk
 77ITTyvH1+1YpZ7YcidisetJsEcOKJ1ui4e2rSpnVFV8pwXf8ZiuklkhiRcRSn0J+n
 zwoj25G/sRKXaXXnYgGcz9QOAekh95BwXZ50uCEy9rFC7XVmW9WMtkaM6L+N0fLyHC
 7He9A5kUdG8CEvg1w7q9ibM24gMgZc+NYUXt/euRrgMQKUg5Itqf63IH77v6OmvInm
 uIgk8oWosL7My40OCbtBz9y29N8cicxoeWRsC4XA8KqWTLxAkYhPnNexxWKg59IWQC
 EbagArjMvXlsQ==
To: Miquel Raynal <miquel.raynal@bootlin.com>
From: Alexander Lobakin <alobakin@pm.me>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alexander Lobakin <alobakin@pm.me>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH mtd/fixes] mtd: spinand: core: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <20210323173451.317461-1-alobakin@pm.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_173513_302873_41E32B78 
X-CRM114-Status: UNSURE (   7.02  )
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
