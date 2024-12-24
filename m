Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D26BE7718E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKHI7GsYbDae2iJhLFEaCtxF2w5+84Ri1lp85ERX9HI=; b=g8cimEaznyfxwE
	SAwRkywx7w19zChlsVTW/M0nJgaK9cVwHbQKWjMMHlQS7V/g/9SvFcDIB6vPVu5KV630LIAWsAdwi
	YybpkEkZ5eT0vxrnghB8NsgTrnJiD4fS+Wh9g0Af4Kph14y5L7Cd3qPXadNVVSTZ0Y7Ohj09ywWJb
	8m+6uMwhe1pvD+WizAYH0h51uf67xNa/BCE0pwwHnLeRe3qxfRUAtXINiPVd7wrAAud1P9hrJbAe4
	yOJ3qVbNSOOAkwszkOXtJq/EYd516kRf3u5pNzVYPWJEwvTlrSQoeK8r3vUEdHQELNJ1sSenQv9Yd
	v73WhVqaUPXWrsORFKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8jd-0000000CUnn-05Le;
	Tue, 24 Dec 2024 17:30:21 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8Ny-0000000CMwt-28AX;
	Tue, 24 Dec 2024 17:07:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09DF040006;
	Tue, 24 Dec 2024 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735060076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VzPEJXwTtX4trhn4jiSXKCMpEB5Y/gw2NHlQipYlhDw=;
	b=EzF2TBztddoKYRFhcVtq8rq/rg+jTFBz9rODvimhcXvHvXfu+GHbgH0M07v8SJOsvYkb5/
	azHgKUXYrRaGpvifsZI/6x52aHsGWwNyT3bBorvLjJrSGX+Dsg//+fzBoMtIoWdRgUDA2t
	niAwU/bCugZRReTXZ19Wuhe61iFT3y0yiAFN/WcAGNDBCFaO2/2Pk+darLR5Z64w/KmNVx
	e1TGhyebkHmosHM9EPv+G9yigrrNL0KS+gw4Pt/gmCZffAOn1Hdv1qzSi5IwDL2Kznh4wS
	Bii8S97vU8+7vHFR4RxslHDM/VaNj4Nf2jWo9AnN/auRec87X1NVVjynykdIpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:06:05 +0100
Subject: [PATCH v2 20/27] spi: spi-mem: Estimate the time taken by
 operations
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
In-Reply-To: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_090758_855504_971DACE5 
X-CRM114-Status: GOOD (  14.25  )
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

In the SPI-NAND layer, we currently make list of operation variants from
the fastest one to the slowest and there is a bit of logic in the core
to go over them and pick the first one that is supported by the
controller, ie. the fastest one among the supported ops.

This kind of logic only works if all operations run at the same
frequency, but as soon as we introduce per operation max frequencies it
is not longer as obvious which operation will be faster, especially
since it also depends on the PCB/controller frequency limitation.

One way to make this choice more clever is to go over all the
variants and for each of them derive an indicator which will help derive
the theoretical best. In this case, we derive a theoretical duration for
the entire operation and we take the smallest one.

Add a helper that parses the spi-mem operation and returns this value.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 30 ++++++++++++++++++++++++++++++
 include/linux/spi/spi-mem.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 96374afd0193ca2cf4f50004f66c36dce32894e8..a9f0f47f4759b0e1ce22348e713a3b42cfb8ea9c 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -562,6 +562,36 @@ void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
 }
 EXPORT_SYMBOL_GPL(spi_mem_adjust_op_freq);
 
+/**
+ * spi_mem_calc_op_duration() - Derives the theoretical length (in ns) of an
+ *			        operation. This helps finding the best variant
+ *			        among a list of possible choices.
+ * @op: the operation to benchmark
+ *
+ * Some chips have per-op frequency limitations, PCBs usually have their own
+ * limitations as well, and controllers can support dual, quad or even octal
+ * modes, sometimes in DTR. All these combinations make it impossible to
+ * statically list the best combination for all situations. If we want something
+ * accurate, all these combinations should be rated (eg. with a time estimate)
+ * and the best pick should be taken based on these calculations.
+ *
+ * Returns a ns estimate for the time this op would take.
+ */
+u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
+{
+	u64 ncycles = 0;
+	u32 ns_per_cycles;
+
+	ns_per_cycles = 1000000000 / op->max_freq;
+	ncycles += ((op->cmd.nbytes * 8) / op->cmd.buswidth) / (op->cmd.dtr ? 2 : 1);
+	ncycles += ((op->addr.nbytes * 8) / op->addr.buswidth) / (op->addr.dtr ? 2 : 1);
+	ncycles += ((op->dummy.nbytes * 8) / op->dummy.buswidth) / (op->dummy.dtr ? 2 : 1);
+	ncycles += ((op->data.nbytes * 8) / op->data.buswidth) / (op->data.dtr ? 2 : 1);
+
+	return ncycles * ns_per_cycles;
+}
+EXPORT_SYMBOL_GPL(spi_mem_calc_op_duration);
+
 static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
 				      u64 offs, size_t len, void *buf)
 {
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 306c05dd13789017da2c5339cddc031f03302bb9..82390712794c5a4dcef1319c19d74b77b6e1e724 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -424,6 +424,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
+u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);
 
 bool spi_mem_supports_op(struct spi_mem *mem,
 			 const struct spi_mem_op *op);

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
