Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416FCC61DD6
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qn7mm5fKweGcdQTRGwuRkSsaWWaY66aCzKSGQlPPvpQ=; b=Jq+9pwgKl9Adei
	mDZzM1RAMdflrCVoX/5FBH7QwCYqnMu+FJoPPLHzluN1vcGmrEa4IiCyiFhGLRKGy68QcD91qBkTf
	Zhx9w+fEj2A1j15u/NzwWnNEgtJKpoQ17NI/U+epBBOQtwwokpjpXUsy0S1u9WmlELjAdt/GF0GUH
	6eMc4HkJiRO8heoysiq6MSxhLl1cT77dsMcupIwaWJrmAWoUydl1929Y0yc8pGedxn/O3g6cQAvxU
	I7OFsRHyzH4t3eByveEn725phABRsUO6q/4qmcYxIchbopIeKvEIkDWFKym/BdWB/zT7L/HGkDC7G
	w5bz2sA56PfxZofCdE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oKp-0000000FMai-3jnF;
	Wed, 02 Sep 2026 17:01:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oKl-0000000FMPF-36K2
	for linux-mtd@bombadil.infradead.org;
	Wed, 02 Sep 2026 17:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sbhpERUTiFePYxtaCzX4WA40ULNwL8M1xikenkS/kgg=; b=IDJ7Fv2a4RwgKP39LgxJAqTGIu
	DcOyCoTzH92DsMtbP6fu41UkYqSwKI5Gykc1lfcDWLRXVjLayTIodcSaiLlf+Qm1lA3cduCs/tvAb
	hNOeHpXnjre/w+IIJx4UTJLsNVMsSCLIvqrwivOLYeaBUu9+77+y/ADXCiV+awqCQVGRK0SkgyC7r
	1N0s4Bs5LDpdRDythkkQNg/VJNBVyB+VjQK0xCn1ddnYRviQxXerLDgFfE3FhBdR3ztjCPoUIoPLq
	Dvrn8SB0jfZv92vCncP6ZCgg9Ng9wHIwrhKdk3K/H62mCC2BojyxE/ynAuZfXqDnRH5oB8uNQGb+c
	lR4pvXWw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1oKg-0000000CF0I-0Bwc
	for linux-mtd@lists.infradead.org;
	Wed, 02 Sep 2026 17:01:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5FCAD4E414EC;
	Wed,  2 Sep 2026 17:01:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3510F6053C;
	Wed,  2 Sep 2026 17:01:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20BA011C798E5;
	Wed,  2 Sep 2026 19:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sbhpERUTiFePYxtaCzX4WA40ULNwL8M1xikenkS/kgg=;
	b=KedKad7ziJp7W4LNuweQgEZ/v37rv5/KvE8CmUZ2yllX1rRsCOu8C3/AZEXrw8+d7yGxEH
	WqrOEraZAQZYo/If1HRBuU6Md/FyWHlUu31wynRxOiYAiTcqKwN250w3bqlqIBIYq+kAOw
	tQlhO8FHPr+QsEN6ZpwdXXEFQjwRPtjUuGKLD5Rn0O178FvGegYHhaJb5/ZXLsDjHs2UFG
	2DKH1zOaaMVz+11vr+XKzMSDg/Emf8Ce3Jz+NIM3WMJjYml7fdxSrhZdsXC4S4BuTb5ATJ
	1sAKyizDL1Oc+TgIQH2ya/eFNTlMlSjRfAPg8+96JHy63jRN1+jzPW3dRGfd+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:39 +0200
Subject: [PATCH v4 25/25] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
MIME-Version: 1.0
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-25-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_180106_230820_DA49987D 
X-CRM114-Status: UNSURE (   9.75  )
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

Expose Status Register opcodes based on the flash capabilities
discovered while parsing the SFDP QER field.

Value '0' indicates an absence of opcode (non supported), we do not
print anything in that case.

The QE bit is also displayed.

Example on a W25Q02JV-M:

$ grep opcodes -A10 /sys/kernel/debug/spi-nor/spi0.0/params
opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
 SR1 read	0x05
 SR2 read	0x35
 SR1+SR2 write	0x01
 QE		SR2 bit 1
 8D extension	none

Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 275671222588..a82858f0328a 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -105,6 +105,21 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	seq_printf(s, "  dummy cycles\t%u\n", nor->read_dummy);
 	seq_printf(s, " erase\t\t0x%02x\n", nor->erase_opcode);
 	seq_printf(s, " program\t0x%02x\n", nor->program_opcode);
+	seq_printf(s, " SR1 read\t0x%02x\n", params->opcodes.read_sr1);
+	if (params->opcodes.read_sr2)
+		seq_printf(s, " SR2 read\t0x%02x\n", params->opcodes.read_sr2);
+	if (params->opcodes.write_sr1)
+		seq_printf(s, " SR1 write\t0x%02x\n", params->opcodes.write_sr1);
+	if (params->opcodes.write_sr2)
+		seq_printf(s, " SR2 write\t0x%02x\n", params->opcodes.write_sr2);
+	if (params->opcodes.write_sr1_and_sr2)
+		seq_printf(s, " SR1+SR2 write\t0x%02x\n",
+			   params->opcodes.write_sr1_and_sr2);
+
+	if (params->qe_mask[0] || params->qe_mask[1])
+		seq_printf(s, " QE\t\tSR%d bit %d\n",
+			   params->qe_mask[0] ? 1 : 2,
+			   ffs(params->qe_mask[0] | params->qe_mask[1]) - 1);
 
 	switch (nor->cmd_ext_type) {
 	case SPI_NOR_EXT_NONE:

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
