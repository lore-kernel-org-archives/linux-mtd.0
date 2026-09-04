Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92E1C79F8C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsBRMVPA/2O5gjBhsWF5DshXTpWZ90vu3ckbl0uUig4=; b=yVHR0xYWKitSwy
	B9y73mNY5NSux9t2R3mt4OMUP2gS5XtQSubVwuJ5kLrYLlcumX2cnpd+Biu1JsfW8ZPOGUs3/wrp4
	CbtgVL0U6dCzOQx4WA4yYuMsmcGpzeAQWHvV+fiVez46nuZ9RG1rUPqPH7OGvYX6KczNFhjh0TpVB
	HALP6GDE+r0e+i7o+FTK5TA4qgQdW6q8YDf3PHAd4iBH0YKYrauMK8XGNgPv2FL1ZBJCUGZlMrElA
	cnFr9IGvb7t7x/kX4FSQIMdpZx8MfHwnXyiz6r5ltfgXRBzOhj7dLgi5zS8Et+Oy0/uijjqATPM42
	Xd+O3FlVJwbwxpM2lzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YR1-000000032Ko-2W7o;
	Fri, 04 Sep 2026 18:14:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YQu-00000003223-0BVl;
	Fri, 04 Sep 2026 18:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xJa2SIgs5+/YUcOMPI/QW/gbwXsr/EhtwgH6qw1Zg80=; b=g0wAs4Q6TYEe959gANkT3HwsKi
	kWhHodEWGPNJxkT8uUThLnPPZX+fYGApJ99ALy9KMPKqbP17Knaqu08mEc4twedN6AkWT/T3Gf7mJ
	OZTO7O+lKJ7o9GaFs8m/lHbHQxCWoTRHCfiocuaCaeIIkCyS/BfYkkb6Ux+sMXWi93AG18z/69hYP
	80ER738c8GuVNuT35jFRByXlGKeF2VJ7D4wwY1Pd/UlSAU2Mk9N7lJsj5Ld87Nijko22txZFb2ewn
	BqwWm3kskFRTcJ4HeQw7Gr+eMZtg2SgH30lka6fYjqu+6tU9Qw/J1AKc+4zgVDwX3O97qCVXGXuDu
	zluv2NiA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2YQn-0000000EOeM-2PHf;
	Fri, 04 Sep 2026 18:14:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E58E94E4152B;
	Fri,  4 Sep 2026 18:14:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B313A6057F;
	Fri,  4 Sep 2026 18:14:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45B7911C78158;
	Fri,  4 Sep 2026 20:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xJa2SIgs5+/YUcOMPI/QW/gbwXsr/EhtwgH6qw1Zg80=;
	b=CPUXp8RC5qfQo249zMudJN7keL5nvy8sE2OR/YfEjvXVC/RheoImipXihndzmzPSlxUzot
	BvjfPZJ8suY4I/fSromVo6MKYDmeCS3RMN7z4dgEVrMIJT2JTPfWMFe5E7nMUmiZOlz7lU
	neO1OiEEWrskuPSOCZoI01gY82O3yYWP/yDdoO5DXO8aetx3WshWiml3X0aabR8GlezrCw
	Qa87RnYFdPM2J54/oSn1CfscPErQpXYzUVOjTxz3viko8iynYkNtaBgKg3rKIWG7qGElFJ
	bHxopfqRmIBqQgzQXORj7gAj3K8u2SnaDdmj4oRt/4txrmgK8s4j9BajVW1xLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:13:02 +0200
Subject: [PATCH v5 25/25] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-25-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_191429_671852_C8FA076C 
X-CRM114-Status: UNSURE (   8.61  )
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
index 5c738786145f..3f8d586a7622 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -104,6 +104,21 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
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
 
 	switch (params->cmd_ext_type) {
 	case SPI_NOR_EXT_NONE:

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
