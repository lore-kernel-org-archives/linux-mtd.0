Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789FDC3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 19:14:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471172074F
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 19:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bS9jnz7E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="tKgs+04u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 471172074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rr2lLKlbbGjpGbCorQYpO9F7hLN0YHb4HBt6nERMGRE=; b=bS9jnz7EItmT7h
	OdLf/pjJISYiK0WBkYFBFmmPatm8sp+0iX8A12SE/nl7Nn4NHR7Y4gsQVoEGe6+eAa5Dqf3YjkQuu
	53dJnzR/HikLqcJ5nkb0QaOvj78Abk5D1tKbXAVzbaph+7bsGXNfExcUotX0DssnhBWf/2N2k7CNR
	jCd1ZohJmN3ZGqwajcRSqfi1WwW8dEar7/fZUqmYvoHjRAFASvWAjXTbgobtTZK9PJhehLfkWrP4T
	detexjFx+ikzaJOHZLjk67/9Nuk5BlG4NzQv24NLS0b+C5ll5XKTTyQnYJx6QL9claHQq8mTpATeb
	Yj0ULuOh0jKtsKH/Yb+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQbrv-0003kb-AH; Mon, 20 Apr 2020 19:14:11 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQbrp-0003k1-SA
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 19:14:07 +0000
Received: by mail-lj1-x242.google.com with SMTP id l19so8791876lje.10
 for <linux-mtd@lists.infradead.org>; Mon, 20 Apr 2020 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=p/mAYsad/btN5Cw0wYxBty5JsXgxZNTDig17VJHRSL0=;
 b=tKgs+04uRm7M7rBTMycXChGyHgoOx+urBD7dtrZKdmsQiuQYnOa1buKVsq4t6KD0mQ
 Xl+oxKe8yezPwHEjPZy5V2Vm+nHhsLVhZG2g4fLV+Qy84xtaatgwyOEVA/0nfnTBiE+M
 ojy9PCCr3vUZimGoaShtrBA+GI5oIUkcm/IpfM6bm0xCMcpgiF2BXsE5Ku/fRVsdvoqp
 qvHZ8omlTM3+Uol1YfD9ynmdeP69dU7CAgNhCVi4kLXS0qn59Zks+3NUiAEVvWaNgEar
 UKaYeoc4VtGkjYi/PYvxiIKFQf/iww1taj6Q1UAe+E4JW/M5GmZfhtPYMFwR3UuuO8If
 qEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=p/mAYsad/btN5Cw0wYxBty5JsXgxZNTDig17VJHRSL0=;
 b=JPr6V2mOIHYVc4Kj6DoEPQwXiVN2hArEa5iJksJl9o934wLKKVOYEZxlxhalS4Tf/H
 Id0xpPTPQgtawiGrr/5stHs4ibhS8NHhWH80V3gy+ec8JIlQ8Rg6xR6bLyquOjvP30HW
 ql9RwKRHP+VNCx+M/W0oMx383XuleFrLYeXDdB+L/KXdWdwgle9aEQHzPDQa9hYI86Dl
 itm81dmbUy+9vE3JUJdEUZIWFXqz2AdHv7NRQyhc7w9ZlXd956d1/lh74xHWMcwRQJcG
 J/wS9uQOzgpYUzHeP3dFmZJ5cQnEFJO+maVMwyt4EulKsAtZYrAnXvNPyWp0gtXC1+3m
 bM3A==
X-Gm-Message-State: AGi0PuZQWhrxEjavHli4TGdKjV0QR1jtLSPLO2BDeb3BrKNvvqCqcS4t
 3EkjzJY4sPji24SVZl5y8w6AsA==
X-Google-Smtp-Source: APiQypLFGbvOgDmZxMBkibMKo9uN4h8dVYDOpcmKtqjPph7DBhA2i/KXmFPRgZoDw1Amsk6XmVZyZA==
X-Received: by 2002:a2e:9989:: with SMTP id w9mr11403958lji.58.1587410043921; 
 Mon, 20 Apr 2020 12:14:03 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:272:2fd2:7b66:ddd3:982d:bfe0])
 by smtp.gmail.com with ESMTPSA id w15sm258055ljd.35.2020.04.20.12.14.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 12:14:03 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mtd: spi-nor: spansion: fix writes on S25FS512S
To: Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org
Organization: Cogent Embedded
Message-ID: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
Date: Mon, 20 Apr 2020 22:13:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_121406_112874_0C77BDD2 
X-CRM114-Status: GOOD (  16.80  )
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
Cc: Richard Weinberger <richard@nod.at>, Yicong Yang <yangyicong@hisilicon.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Spansion S25FS-S family has an issue in the Basic Flash Parameter Table
(BFPT): Dword-11 bits 7:4 specify a page size of 512 bytes.  Actually
this is configurable in the vendor unique register (CR3V) and even the
factory default setting is to "wrap at 256 bytes", so blindly relying
on BFPT breaks the page writes on these chips. Add the post-BFPT fixup
which restores the default page size of 256 bytes -- to properly read
CR3V this early is quite intrusive and should better be done as a new
feature; Alexander Sverdlin had the patch doing that:

https://patchwork.ozlabs.org/project/linux-mtd/patch/20200227123657.26030-1-alexander.sverdlin@nokia.com/

Fixes: dfd2b74530e ("mtd: spi-nor: add Spansion S25FS512S ID")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'mtd/fixes' branch of the MTD 'linux.git' repo.

 drivers/mtd/spi-nor/spansion.c |   25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

Index: linux/drivers/mtd/spi-nor/spansion.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spansion.c
+++ linux/drivers/mtd/spi-nor/spansion.c
@@ -8,6 +8,27 @@
 
 #include "core.h"
 
+static int
+s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt,
+			 struct spi_nor_flash_parameter *params)
+{
+	/*
+	 * The S25FS-S chip family reports 512-byte pages in BFPT but
+	 * in reality the write buffer still wraps at the safe default
+	 * of 256 bytes.  Overwrite the page size advertised by BFPT
+	 * to get the writes working.
+	 */
+	params->page_size = 256;
+
+	return 0;
+}
+
+static struct spi_nor_fixups s25fs_s_fixups = {
+	.post_bfpt = s25fs_s_post_bfpt_fixups,
+};
+
 static const struct flash_info spansion_parts[] = {
 	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
@@ -30,8 +51,8 @@ static const struct flash_info spansion_
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | USE_CLSR) },
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25fs_s_fixups, },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
