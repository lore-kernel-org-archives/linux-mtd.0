Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8E5D1D480
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DYNS2t9pxcRExz0/n1cfOPkPfVJl5rT7LLM+FbHIJ0=; b=RAgrQFRYYDyXdK
	MjRzyXFrvxku9E3PLNic5ufEvoAZ3+SMV+F7Vz7/HPwmoAPj1EikQGqO8a/Jpq3DKY4KYO+AUZg9d
	8FVrYoGeET0PazCpXrWfOcORyBeqoIHYiKW/mIcm07RdLWZz0AOHBvZ6SkVcGn29bitwHV/pLRhAB
	iKAo5LnFZcKHWhL1VTL+RQPqNA/14P7MAMK12UbIpC4vyrfLkybgiHml2MDijyBg1rx01JQ9Jn0bO
	lmiW+fafQ+cPXs6sc2nCq6AoqiC901EOjk/6ENF8K0jqciqNI4TsJHfCeOXQAwDQaDX+ze43p7ewM
	haps0TSgPKr4lzcjcQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtM5-00000000FZG-1bQp;
	Thu, 08 Jan 2026 16:59:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLx-00000000FPq-13CN
	for linux-mtd@bombadil.infradead.org;
	Thu, 08 Jan 2026 16:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oqqmuaxM0JPFUFPYjxJGr40Kx4IWxVfbQQsEuyrgdv8=; b=EBt+uCmwcKcn620HX6gMBXC3MV
	/9KSJCc0+6vBJk0/Kb80P3L3vP5i9Ai4vdBww8+PRnDkrq420aLzRuunGk1h4w0rjUGGitEF5LHR/
	L9KoMuJ/xqObt9bL0wYJp1JRURnItgn6Ku+iWjihgasfkWsBt6kZkZOf7HIFI1/i/OXHGy21EHafA
	ZvEYHrcQQbyaOcYV1Qzy9GxhbhA/4Mgz0j3kY+jQLE8eysDYppVx2GAkAZ0P1PApuTIQOfGl77Hu8
	xCVcs4eoZqCGBBZg04AeumsVdago3shiqwnq4LmXAx0VlGwVYo3Lte/kZCmsBrT1/Oe6emsT2uMJL
	0mImaS+g==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLu-0000000DjT1-1Ddz
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 16:59:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0F0614E42000;
	Thu,  8 Jan 2026 16:59:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D80AD6072B;
	Thu,  8 Jan 2026 16:59:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58415103C8811;
	Thu,  8 Jan 2026 17:59:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oqqmuaxM0JPFUFPYjxJGr40Kx4IWxVfbQQsEuyrgdv8=;
	b=S9M7Ejen/u7DrEf1yJnaoIpPSZJqMrkISaFjTKDPP5QFj/Sw4zggU2NptvXNDeTNf6AxYx
	ROZhJFHNw7g2vTX7h+LkUq4w4Bp6OTsIyvBzLbMOFipeUccHy/D1t9WQfcM0wSvnB/XSBK
	H2k/QIuyMcOcKAKJ64h51zPW2NzZdJUEuTjb8ovI/P/TA2Xs3hpUj2L+ybmQZlIyF1+8Jw
	gY3niszpu19blIgJr6igQy5YaaeKcjmt7hTQbmqu7OeX5sjak992qi7fFv4/ZKsP+9FCfW
	E6ZTbedF/vAcCbZeonr10vibmpWuLGqierWvIjWfW5It5kA6XfWbaT2hwmiGKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:45 +0100
Subject: [PATCH v2 12/27] mtd: spi-nor: swp: Create a TB intermediate
 variable
MIME-Version: 1.0
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-12-c462ef806130@bootlin.com>
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_165914_406115_05C39D19 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ease the future reuse of the tb (Top/Bottom) boolean by creating an
intermediate variable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 66f85826ba0d..f068cb9c8f6d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -60,6 +60,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
+	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -79,7 +80,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
+	if (tb)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
