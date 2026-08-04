Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5407EC55822
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAFPFGi59PdK80qBGwZtPVTmgSpgNc3GN8zXSI1Tm+4=; b=iJyyz+HjMgTZ8L
	cHOsn3PK7hzZ0zV9zRYdcbDBUyp2fZsP8U/4i5CO+6oQWe7rafyfSVyJtMIhCp5XgN9cjS4F70NO5
	xXh4Ka8WU0xAR8h8Z6CcpkJmKqDPkBSkQixuHRMNRrNY0LDc3ZE6W8Mp7q8WFzqOdYk9AAVSb0Qoh
	G8hD9kMCBGb3Q22ZX+GR4XocGZENT2C5XAInvq9Ks+W9wS2fW6qbCUYg/ntnjq31laFJDv3p1j95k
	EXq2D6kpfWnwEdmqm0zcTHvHu2hBfmKI406/7p5SpCxVGZr8aJlw10TlFfpcbnkV0uqkycaD1jyat
	mE8f3fdXSD+KLNOZT8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlO-000000020En-18xh;
	Tue, 04 Aug 2026 14:05:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlM-000000020Bk-1FbB
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=c72GfLvgeyfX5tlbGion+ZPSbnfinCz5XlvBLoX4LVw=; b=LwJz1VQoL/786JLK6Op0U0x+Wp
	2dQW6CIyYp3YnKx/Tx8u/0p0oASs8eg0HFiO+oAcqELRDqXo3K4M8blpS2fZzhg4O/yiwzesnYjm9
	DgPN/w9zGQ7murCkTEUpgZw7k3I9UUrTrU3AT2AQ0tdEMfZeJcwIVHXKgaNtZbj/GHTkz7iCAoxun
	cgzynNWJPSwZHzM5UA4hy9ahaBdu0kjR/g+ARg7YSCb6gHifW7j5P4JJzfQmRun/SBSHEoDp9djXB
	IDcvVx8WDgQum797pYYGow0P0JMRRCJsC1eiin6NNeKlFFPMzloAils2r0rcmTCIBXd1zUMIlFzRu
	qTqS7XnA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFlI-00000009yMN-3AU6
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:04:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 197EA4E410DB;
	Tue,  4 Aug 2026 14:04:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0FAA6029E;
	Tue,  4 Aug 2026 14:04:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45FD411C32D37;
	Tue,  4 Aug 2026 16:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c72GfLvgeyfX5tlbGion+ZPSbnfinCz5XlvBLoX4LVw=;
	b=kHJ8Ua8C+ZZ3zjuVp7VuStFb9FTeT/8iERyK8o/UqodxDcxjFlZZY71NC4mbYKeSq88I3g
	te2CHNjvPCwHzibNQ2Ee9s947dUIlOS9HeJc3VQotk37kIIgsmvbNp2EhXkN7VTNdpfK+Z
	mR7lI4klX+AlrfgAPZorv8B/SKlBqhi55yAurinkE2kqSkqvpgoKLqMGmJ0ovnRMgO2CwJ
	nMx8mwNphEEZsrMreMjnrarKg14m5MWPbje+9O5gVdp/SwHDYgFxH6qK4y2cmmM1n1hhTA
	pgSM/ItBq7evbtdWygquLrgkedPN3gVx9xaME+K6uqhu9J+klMFHu+OPkzVKJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:35 +0200
Subject: [PATCH v4 13/28] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-13-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150456_969396_6CD86599 
X-CRM114-Status: GOOD (  11.11  )
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs.

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 2612 KiB/s
page write speed is 2509 KiB/s
2 page write speed is 2560 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 3033 KiB/s
page write speed is 2895 KiB/s
2 page write speed is 2976 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index f7cdbf1a56a5..456050fdd251 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -307,8 +307,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x16),
 		.name = "w25q32jv",
 		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
