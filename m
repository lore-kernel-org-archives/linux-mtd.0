Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A5FCC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcNO6vLmk5Ah++dEi59k2yf236lgieFXd117Wu4kv5M=; b=I8x0S8/J/FxhHA
	0nU4rPaCLgIO/KuqNo/XP1W8XAsIhEpaui0oNzQsMo6lZv67v+ZExMhZkqQOoDzfPlhVXH5yp6ZX5
	Za5eskbzwGZ8dQ9oTSmItm8CKtp07lWB5yNl2sIlTzyv26OzE+kz3cDRV1V5Aow/1Pcw86cR//bOO
	EtVLgbJod65pmwRb6nT+rSTM0WPqOxlF3zXdHneTepulanPcSB9cMz+J4jcaSKYrG/rpwp/ex1ifC
	/Ic+HVhFxY61SlJuI6hFpwbC8GFN39D2hLsG5g/sUC/jYoErTbb5hG6qO9pipeOlV5Ej0xro0cvq4
	KIoR8nZRM6dWH7CMHwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdH7-0000000D3GK-2kit;
	Tue, 13 Oct 2026 14:14:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdH4-0000000D3FG-32hY
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:14:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49BD5C653ED;
	Tue, 13 Oct 2026 14:15:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8D4C60362;
	Tue, 13 Oct 2026 14:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5AA811D714ED;
	Tue, 13 Oct 2026 16:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791900869; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OLsy6HHrd9OhlTf5ijFBqojW+83puKqwZQgSDTxalnY=;
	b=vPYtz7qVmDHNllXMQyumytOH7h1TmGBxMcPaIQ0IksGaa8t3qHFOHqCno5BCR50M/caxan
	lSMbKm3vXxJH+CqZDrz3g48zipOuZPGz24vFZtYK4O0saPXp6G6ZBLFW72zDvyzndcxnhT
	X7nKoIZRX/6IRmYBWFM7tLL4y7PaZF1oYMKAFQpSVPQ8B77XssAo3qfIr9BTYz5cZU2MVZ
	2dn2jj2F8a6nUbR9iXmIqCDbW+w68Pl9O1ZVi1wElFd5GhTYKr0DCbQfcBd8C8zICVKArm
	0ZC0ggq8tXrPnQrV4EU5n+Kx27M4ehRVG+ptQgdCtbh1fFTW07/W6e63nvq7SA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 1/7] spi: spi-mem: Add support for panic mem writes
Date: Tue, 13 Oct 2026 16:13:44 +0200
Message-ID: <20261013141350.189996-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013141350.189996-1-paul.cercueil@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_071439_095500_3608266E 
X-CRM114-Status: GOOD (  21.15  )
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

From: Tanmay Jagdale <tanmay@marvell.com>

Add a 'panic_write' flag to the controller's capabilities struct.
When set, the SPI controller indicates that it will be able to send
commands to a connected NOR or NAND memory in the context of a kernel
panic, which means without sleeping and without relying on IRQs.

Whether or not a given memory operation is a panic mem write is given by
the spi_mem_op.panic_write flag.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

Notes:
    v2: - Don't call spi_mem_access_start/end on panic. We don't need to
          flush the SPI queue at that point, and we don't need to lock the
          mutexes.
        - Check that the SPI controller's PM status is active, and bail out
          otherwise.

 drivers/spi/spi-mem.c       | 35 +++++++++++++++++++++++++++++++++--
 include/linux/spi/spi-mem.h |  5 +++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index b94680b60af9..3b6fa44e4550 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -398,6 +398,31 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	u8 *tmpbuf;
 	int ret;
 
+	if (op->panic_write) {
+		if (!spi_mem_controller_is_capable(ctlr, panic_write))
+			return -EOPNOTSUPP;
+
+		/*
+		 * Only support panic writes if we'll go through .exec_op().
+		 * The regular SPI path (spi_sync(), etc.) explicitly mentions
+		 * that it can only be used from a context that may sleep, which
+		 * is not the case on a kernel panic.
+		 * If this changes in the future, this could be reworked, but
+		 * for now this will have to do.
+		 */
+		if (WARN_ON_ONCE(!ctlr->mem_ops || !ctlr->mem_ops->exec_op))
+			return -EOPNOTSUPP;
+
+		if (spi_get_csgpiod(mem->spi, 0))
+			return -EPERM;
+
+		/* On panic IRQs are disabled so we cannot wait on locks */
+		if (mutex_is_locked(&ctlr->bus_lock_mutex) ||
+		    mutex_is_locked(&ctlr->io_mutex)) {
+			return -EPERM;
+		}
+	}
+
 	/* Make sure the operation frequency is correct before going futher */
 	spi_mem_adjust_op_freq(mem, (struct spi_mem_op *)op);
 
@@ -420,7 +445,10 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		return -EOPNOTSUPP;
 
 	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
-		ret = spi_mem_access_start(mem);
+		if (!op->panic_write)
+			ret = spi_mem_access_start(mem);
+		else if (ctlr->auto_runtime_pm)
+			ret = pm_runtime_get_if_active(ctlr->dev.parent);
 		if (ret)
 			return ret;
 
@@ -428,7 +456,10 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		ret = ctlr->mem_ops->exec_op(mem, op);
 		trace_spi_mem_stop_op(mem, op);
 
-		spi_mem_access_end(mem);
+		if (!op->panic_write)
+			spi_mem_access_end(mem);
+		else if (ctlr->auto_runtime_pm)
+			pm_runtime_put_noidle(ctlr->dev.parent);
 
 		/*
 		 * Some controllers only optimize specific paths (typically the
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 0cce6b57242a..2633307bfad5 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -169,6 +169,7 @@ enum spi_mem_data_dir {
  *		 operation does not involve transferring data
  * @data.buf.in: input buffer (must be DMA-able)
  * @data.buf.out: output buffer (must be DMA-able)
+ * @panic_write: The command is executed in the context of a kernel panic
  * @max_freq: frequency limitation wrt this operation. 0 means there is no
  *	      specific constraint and the highest achievable frequency can be
  *	      attempted.
@@ -211,6 +212,7 @@ struct spi_mem_op {
 		} buf;
 	} data;
 
+	bool panic_write;
 	unsigned int max_freq;
 };
 
@@ -392,6 +394,8 @@ struct spi_controller_mem_ops {
  *                   is a pause in the transfer (eg. internal bus contention or
  *                   DMA arbitration on an interconnect). Features such as NAND
  *                   continuous reads shall not be leveraged.
+ * @panic_write: Set to true if the controller driver supports writing to a
+ *               connected NAND/NOR memory in a kernel panic context
  */
 struct spi_controller_mem_caps {
 	bool dtr;
@@ -400,6 +404,7 @@ struct spi_controller_mem_caps {
 	bool per_op_freq;
 	bool secondary_op_tmpl;
 	bool no_cs_assertion;
+	bool panic_write;
 };
 
 #define spi_mem_controller_is_capable(ctlr, cap)	\
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
