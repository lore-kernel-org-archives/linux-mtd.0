Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE772CCFA03
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieVJ307I0JswKwo8CiT9KvFSCy8nem4Cor786GDkH0k=; b=nnj5+UCTM2gKAd
	S1XHX1VJT5SqXHkPgWfxUdTORoGOYuegfea2xnUzo4nwqKY88QULoHPUAD4ZwbELH3IBX5Vs+0l7y
	pKmM0ZLc9k9K2eavdvZKbmcYYwanzcxMdxjPD8eN+KHY48EDInNp5HO4h+MO8LqFW9cjQIdNUEihv
	GKv0skcYJRy2x6Ge54Y/bXN4394+R4iAxnjvVVfoQ3xDTJY2dqpETuOJqMLmLkEu+TdTPAiXwlJYb
	hCwQViIr8mkqMPPk8Fc78Uzm2fWxc/Z3WGyeqdYA5k27dGRygSJRcjhrhlEhSl/bGa6zuEnkkPZh2
	Vexq1dGNKW+LfPzNOLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvK-00000006UFZ-2awr;
	Fri, 31 Oct 2025 17:28:26 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsv9-00000006U45-2kwQ
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79AC6C0E959;
	Fri, 31 Oct 2025 17:27:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0816960704;
	Fri, 31 Oct 2025 17:28:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C8051181800A;
	Fri, 31 Oct 2025 18:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oHqEV/g7XFmkq0UzLPDeIwZV/fV2EtIfxTRhi9zC2G8=;
	b=0mbD0KPT1S8Q8Ue7MzvbGhBFxqwNL0QzL4nZpL1eCu8ne+RM5g7oXJQ81BjqMRAwz9sQNa
	795Rb2z5UWU7jG0/k+L2EIsv6F3Np+Cu6v2t/7Vhk/DgLya4NtZpE3Cl4hEDJPGLqjtm7W
	qapdOmzpQLDdwqk2nJfCTlYNrqRkKSGnZbDJijg9cWfmyZn/e5bdworZewV8jnjaqOxIgf
	POLdpIv6/LQOZmCbIgvPc98ixwurVTCmdcZ/Ci2JrzwYeHKnYixxvaA3AoXnPm5fUbmftY
	QuVSl9E7peBkcYcaUV96Rmdlg5pfj1FecEqsfwtM+GVqJd0veK/WDajA5R5gqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:45 +0100
Subject: [PATCH 01/28] spi: spi-mem: Make the DTR command operation macro
 more suitable
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-1-be42de23ebf1@bootlin.com>
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
X-CRM114-CacheID: sfid-20251031_102815_876175_7CBCFAC8 
X-CRM114-Status: UNSURE (   9.86  )
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

In order to introduce DTR support in SPI NAND, a number of macros had to
be created in the spi-mem layer. One of them remained unused at this
point, SPI_MEM_DTR_OP_CMD. Being in the process of introducing octal DTR
support now, experience shows that as-is the macro is not useful. In
order to be really useful in octal DTR mode, the command opcode (one
byte) must always be transmitted on the 8 data lines on both the rising
and falling edge of the clock. Align the macro with the real needs by
duplicating the opcode in the buffer and doubling its size.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 82390712794c5a4dcef1319c19d74b77b6e1e724..81c9c7e793b6ab894675e0198d412d84b8525c2e 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -20,10 +20,10 @@
 		.opcode = __opcode,				\
 	}
 
-#define SPI_MEM_DTR_OP_CMD(__opcode, __buswidth)		\
+#define SPI_MEM_DTR_OP_RPT_CMD(__opcode, __buswidth)		\
 	{							\
-		.nbytes = 1,					\
-		.opcode = __opcode,				\
+		.nbytes = 2,					\
+		.opcode = __opcode | __opcode << 8,		\
 		.buswidth = __buswidth,				\
 		.dtr = true,					\
 	}

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
