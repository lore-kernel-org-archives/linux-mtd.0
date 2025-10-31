Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC09CCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEBEGYj+Q2QaNnLsMlGzFoPCq3WZuoHkvOTiMvJawJs=; b=QCEuUEy+5xg2Nq
	Y46yATxwFI8jSKKpbZBgjcy3pi6Y1nah1MwhTSMcSo7VihHha4ME5BuWr65jAETHxHthhvZAprzsb
	2CE80SAd7lrqBmyNjva+2FS3ZpubRh7dPmVBJFmXXgei7Go5qISQ9nzEDgJh+M4q8FDWlEExDk2ZV
	nF80aOu3MZebmg2JzREidw7J7JxcGh0PaIaGUNXi51nAY6xSmflWoLkK6EmHS4L90JEb2y1MVxXvH
	XG2e/kz+YJf+E8z8fZbot+XUvbpG0E72OQ0gp0EgMh6D12XxEltIVR87IgW8PQq+HVXmjALD6AQYS
	oK9LyCESgLhL/M0U17Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswT-00000006VdY-02Le;
	Fri, 31 Oct 2025 17:29:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvg-00000006Ug5-1bfj
	for linux-mtd@bombadil.infradead.org;
	Fri, 31 Oct 2025 17:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YwdHq0kXuW83TPzSi0AdbC2T+tsymu7wdChzedkkepA=; b=BpKKemLy3w1t2EPhluF+bZvjlg
	BFTLNNxpf/PXAr/k+w2fy57FjEAM1EAImybqTrxCzQifXtNBpDSS6V0/jMauEE0HhSKA6LXKJ32Dn
	bR10jq8QaE0sDGsLPvSNvAKxx5vQ8X2fLXlhUMd9SwUoK39O77w2YrFQBM+xx7jrL5cn7mcR25T6R
	iYqIDqk2BC3CNn4Sat0+8i4J2/zSs+LFG+Ipzen3iXY+/vWBDD/oWz+XEyqB6h5+Pmv6utFHoruL4
	j2b618kTspXozIGj2mq3BIbYpum7fosXer/uKxmm6n6xvpb8w/oR2KMZ6hMhI7AZVrJRFaXPz7Hhr
	Qz+GHpqQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs3u-0000000Bkeh-0eyd
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 16:33:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A98831A17C5;
	Fri, 31 Oct 2025 17:28:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8043E60704;
	Fri, 31 Oct 2025 17:28:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07F311181800B;
	Fri, 31 Oct 2025 18:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YwdHq0kXuW83TPzSi0AdbC2T+tsymu7wdChzedkkepA=;
	b=rwSz6VkbJ8BeEwaHaLBJ4x9IeS5VgVVviBj3M0h1uoTERcC83xmMtIGaJdC80qe/dHwSc3
	CmcpbJSAEQcq2W36x/GefC4omRghnWshMWt8+t0qAZTqEt5L+TkLTLhRCee5DX6J9DpFzH
	uKXWbUgLH5Hgrpc5cjRv7kb0E1lK5OrbRhKtS8hU0A3Tk6lKkX/JN721RqQXVuEvmeWw/Q
	/zI4iQBi4ousSCGPE0I3bUT0bYd4bLXuIxf6K8yqmj1OuJXsA3dsypgXQv+RHb9U1wFzsI
	RsWmY526HllUZCu7CIVeYLg2Z2eGgWeQeIRVI+Wn848DavF7rrItrIfoW60Mkw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:04 +0100
Subject: [PATCH 20/28] mtd: spinand: winbond: Rename IO_MODE register macro
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-20-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_163314_378238_8A81F70A 
X-CRM114-Status: GOOD (  10.05  )
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

Suffix the macro name with *_REG to align with the rest of the driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 7eade2251f7b5b2a96c0a7528ca6d64ba6d8233e..b169636376835157c64bce17a4f32549e1c1eb9f 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -22,7 +22,7 @@
 #define W25N0XJW_SR4			0xD0
 #define W25N0XJW_SR4_HS			BIT(2)
 
-#define W35N01JW_VCR_IO_MODE			0x00
+#define W35N01JW_VCR_IO_MODE_REG	0x00
 #define W35N01JW_VCR_IO_MODE_SINGLE_SDR		0xFF
 #define W35N01JW_VCR_IO_MODE_OCTAL_SDR		0xDF
 #define W35N01JW_VCR_IO_MODE_OCTAL_DDR_DS	0xE7
@@ -392,7 +392,7 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand)
 	else
 		return -EINVAL;
 
-	ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_IO_MODE, io_mode);
+	ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_IO_MODE_REG, io_mode);
 	if (ret)
 		return ret;
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
