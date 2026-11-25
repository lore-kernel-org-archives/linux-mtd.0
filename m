Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333F660A2612
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2HNej8m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VIGk9WID;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wmBirQqP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6tGQhrjDBIMWrIUo4XE1Vjy53elVPXwzHoLF7Wqd7bo=; b=J2HNej8mr2G7ka/Yw6b265q3Md
	ZA/jb6i1KIjYdNVlRI43I/ojPVI6UEs7t5ZNqiQuHmWVXb+bZTeXJGUMTqPAJeKQtZ3wPPoG/oR+R
	Nm3wjllPI1hy2Amza3C2IkQiyhPaPWaH1JwG2OFIZR0BmTeaTFSADfTEKrS8to9rvpF9b7OxqkH9B
	Lt4JkfLub7+577lUmG45jw4/Xg+jv9aEI/TBthO5O0OiO0PcgpbVWpmwBzB2BlIPgZf4al6TBxzHU
	oUi1+0CibIgvLoRWnvOiuYoTs7kc46NPGt6dVw4viManPNF3/tPVTfRL2BX3rgb/sGkM0amY5/j/b
	boLN8clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHB3-0000000Aoo2-1v2M;
	Wed, 25 Nov 2026 17:53:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAT-0000000AnyC-3RzA
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0jHuOkcW+tUuXEgN+rjlY+VwX3B9wkvVTb2a5wTh6Hw=; b=VIGk9WIDUc7iajsQONrkScZsMa
	GGOF9skkLmqrSKlgNSA3CzwnE6gL14sqNeXnSadzZW/gFR9GmXA2R/jld31k/pKbs+nZ7qurg4The
	VBFz7yVZR0qX4GXdigPUKKYj0RcfmVkpTBi25ZpZ0iTHs0hZh7VkYpELquhu8xuOnaRWdZIdseRrZ
	Dtpc1bWLcR4ogfZY+Q5SpbKgwPH59fUUSKsSSg6tmeMI7++jn2FhuUWOO8JkW5rj3dHg5IrcpZvN3
	LY3kkQI3wmQm01ZdJKtLCWO5Wwyli9cx1zfTWVBG8QfDcYFv34hYGu6aOK17Q0Jry4cnaEw7BKx6r
	daj75RRA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAQ-00000005bAL-16NZ
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E3F3FC2B9C1;
	Wed, 25 Nov 2026 17:52:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBD1760480;
	Wed, 25 Nov 2026 17:52:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E9BB11E6B0CA;
	Wed, 25 Nov 2026 18:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0jHuOkcW+tUuXEgN+rjlY+VwX3B9wkvVTb2a5wTh6Hw=;
	b=wmBirQqPwYrB8cMXgwKVXCQ+dRgEdqiLvomU2P2fI5aIOAtcy3iU7XbOUAhwM3IizD201/
	C3XFza9eM2aD+WwEWX+dWOUkceFb5V6jKXGVvahBq7f/MipyZOPNQ8bTKCkB3nBcYHkmMS
	dAatQ6aOTwgKEQdqhjbyNPD8TxLt9uECyAQj8nIKQ9y2z1S72bQhmIJBS4tnOhr5JNUB7f
	dgdQYHYT7jWrKIymy4D4Y2E9hE7q8cOQz6vcPX2tR8nnVYtLPMlreafxGz/9GfgQw+1e/b
	coqZKJH9p4b5z0I4Cn31ov6B67gWCgfbZxiL8cpWv9ZcFNXHu25n0On5CX480Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:20 +0100
Subject: [PATCH RFC 06/16] spi: amlogic: spifc-a4: Consume dummy cycles
 directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-6-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_175226_373625_50E2776E 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The spi-mem layer is now capable of providing the dummy phase in cycle
units rather than bytes, provided that drivers advertize the dummy_cycle
capability. Since this controller is consuming cycles and currently
converts bytes into cycles, flag it capable to consume cycles directly
and drop the extra conversions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a4.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 16346f50c7d9..ac06ea735133 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -361,13 +361,8 @@ static int aml_sfc_send_cmd_addr_dummy(struct aml_sfc *sfc, const struct spi_mem
 	if (ret)
 		return ret;
 
-	if (op->dummy.nbytes) {
-		/*  Dummy buswidth configuration is not supported */
-		if (aml_sfc_is_xio_op(op))
-			dummy_cycle = op->dummy.nbytes * 8 / op->data.buswidth;
-		else
-			dummy_cycle = op->dummy.nbytes * 8;
-		cmd = CMD_DUMMY(sfc->cs_sel, dummy_cycle - 1);
+	if (op->dummy.ncycles) {
+		cmd = CMD_DUMMY(sfc->cs_sel, op->dummy.ncycles - 1);
 		return regmap_write(sfc->regmap_base, SFC_CMD, cmd);
 	}
 
@@ -803,7 +798,7 @@ static int aml_sfc_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 
 	dev_dbg(sfc->dev, "cmd:0x%02x - addr:%08llX@%d:%u - dummy:%d:%u - data:%d:%u",
 		op->cmd.opcode, op->addr.val, op->addr.buswidth, op->addr.nbytes,
-		op->dummy.buswidth, op->dummy.nbytes, op->data.buswidth, op->data.nbytes);
+		op->dummy.buswidth, op->dummy.ncycles, op->data.buswidth, op->data.nbytes);
 
 	ret = aml_sfc_pre_transfer(sfc, DEFAULT_PULLUP_CYCLE, CS_SETUP_CYCLE);
 	if (ret)
@@ -1057,6 +1052,7 @@ static int aml_sfc_ecc_finish_io_req(struct nand_device *nand,
 
 static const struct spi_controller_mem_caps aml_sfc_mem_caps = {
 	.ecc = true,
+	.dummy_cycles = true,
 };
 
 static const struct nand_ecc_engine_ops aml_sfc_ecc_engine_ops = {

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
