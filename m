Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E959BC5B572
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 15:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ouSU/OV1aAyylHpELi7Zgqv1bIijy2xNsZ942YNnng=; b=eEV7QYPrj6d8BV
	diUwn6RTOZoRiwzLFz/0jQvddqbik6fdl9qx/Lhn5vaCQy6feKX4qpXe4vz/8lKSn1lmY6tkKBT9r
	o0QRXYXsK9DZ638NpqnFiHy71zUgaWCRDo5NN8m03KlbcHF/GT9aswr1sFDOYUeRs338YULV0NNa9
	f8dLxLAn4FMVsrKPbPnTj/tXqpsIU37JeZHmsrA/WKc3NFrF1P759HCodiSTdDCDHKEmTTjckGIvy
	85g2QtRDPxFF0JNQ0VkjuPpC83RzngcDdVSxGO2qE8XrhLkom/zMw53JuGHJlBZtsijETzhGg0Ed4
	UMdFg14oE488hShKQz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXFF-00000000z0Z-3MkK;
	Thu, 13 Aug 2026 15:21:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXF5-00000000yhh-2o1f;
	Thu, 13 Aug 2026 15:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fFpW2ikSxkH4BdHhn8YPK7LvqZ3vXYUPutlHcmpa7Ys=; b=A8Zp1UiV56KWjHM9GICnReSXqS
	CbHy4KlvvIw1dO8oaC4Naak7dddlqmula1HRggtK4lRuyCY16n7OUy10Teta0DUtI09si5oy49TH2
	XZheFz0DzCO6UroH7U9AmOWejBBMbs9mcThGK4t7RVw4j6/dNgHJ0CA51J8q3tERSn3SeQKM/uXLf
	YTTGvpyL5qNzv8BC947UyhL1ZKZif6+lPfQmdhX8a9JK8k8PKwB0x5gpeXbidIB+R9/JqI9MJiF+u
	BYrfLhTsPHNjOlqzAKYoicCXfpqyKZHqDWTbxkImlleI4pJUnWhBJqn8BGRALJmXGPA8Wcw7WvK4t
	83quDJ7A==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuXF0-0000000GHNx-3OA5;
	Thu, 13 Aug 2026 15:21:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 28A084E41208;
	Thu, 13 Aug 2026 15:21:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F177A602B8;
	Thu, 13 Aug 2026 15:21:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94A4811C4E07B;
	Thu, 13 Aug 2026 17:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634469; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fFpW2ikSxkH4BdHhn8YPK7LvqZ3vXYUPutlHcmpa7Ys=;
	b=Ih3gvpdJoMDsb0hECpNhOzdvLl4o63H5xDZTD5SmnhoA3JdjVzD3pPUCeLwjPNf2limmT8
	6UQdhTYe/ZgO7bXdxtNyhbeDz7g/QJ7dQIJSEYz8TfE9d4tQJI/2elusdDgAk/ZsJAakwD
	wpBybqAbuYYkuZOtR+fVqHhVfItQZUr/+Pf5F5kPGwzD6aoNokRmY2SKEqt/6uZcF16Fx4
	4cvmxl9bmmUFlmlQvS2n4trMINL1vwI2IkHs6WP9uupwBVhP/bfjJKdiAr//FCx55TY8GR
	rZXW3dGQH95DmxlAzBImPlV0r3p/A3ujvJTI+jX7pSLFE+Y4/n3wx7uOHgTUDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:23 +0200
Subject: [PATCH v3 23/23] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
MIME-Version: 1.0
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-23-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_162110_979447_66940AFD 
X-CRM114-Status: UNSURE (   8.60  )
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
