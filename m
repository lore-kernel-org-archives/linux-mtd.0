Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CF9D149C4
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITgtFlxz1wDnnXxBGekHvzStgt+dt8DI5xir9gz+o9Y=; b=rNlBIgFK5CJboA
	mKKv4/jAON0PBqCNtferiWD3qh5e+guGP/tqflCZXGLiQCezyCPhk7Xeb+62l1Jn+pOBhyIIJ33xc
	jrJZ71ket2uPQUvwN4KQnDTNohrx6G3Icp7HnyCQBdt1FUvAwh++o5LEhtUlvsOAqMDbBVyUgslXi
	NK+fPRelXcwfQHaZxxLROVOpMXv869dVHuD8yLhUtZqq4DgWU87F9s51742v2XCUKs3tAEdWTJEMH
	J2IRMMT5t4TViwmeO/htZmYTN29MPLKxI/5314nKBCjKf5iu8ZAhqcbG1hMJb9z4Mb9vhibiwqK1E
	Z/bShdaT8G+WpQGYhBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N12-00000004OLx-25PC;
	Fri, 25 Oct 2024 16:18:20 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mxu-00000004NX7-1mM0
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A096E0006;
	Fri, 25 Oct 2024 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24zgJ1SOwtcpnsboCjjPZCjULnvdSoTsG66ZvB9nNQI=;
	b=S4NjRkZJhfB7j3euDlq+6t4XbXNr9GiPFPjpTuFEFNXcAFXuqz3kl9AlB5Ryd1do6jgWGD
	/V1567W1jZU8IbffTaAiCYtA4uLVEW8VIynra270j9XmmYc9EYIj7cZEoc4rH5AqP8vqyB
	t2a8z6of9UTlt0MJDHTjZHIWa9pRR/8us9jWUKUVD5gxpXcgNv5V55d4BLzSAslI1ExGc9
	nux6teBIf+Ff0JqMvrs0Gfi4cLLmKJBcJ2iKqzqVmRBOP3JYPd2+eM6QEgRPAwxczfw6Dt
	AW2dhZ2vJJYtbibGCBVe7QScEf9dDh1WSjeMdiSyp8RARqL8vcNHl/chC9E1Qg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a per-operation maximum frequency
Date: Fri, 25 Oct 2024 18:14:38 +0200
Message-ID: <20241025161501.485684-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091506_829736_BB20D2AE 
X-CRM114-Status: GOOD (  24.25  )
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

In the spi subsystem, the bus frequency is derived as follows:
- the controller may expose a minimum and maximum operating frequency
- the hardware description, through the spi peripheral properties,
  advise what is the maximum acceptable frequency from a device/wiring
  point of view.
Transfers must be observed at a frequency which fits both (so in
practice, the lowest maximum).

Actually, this second point mixes two information and already takes the
lowest frequency among:
- what the spi device is capable of (what is written in the component
  datasheet)
- what the wiring allows (electromagnetic sensibility, crossovers,
  terminations, antenna effect, etc).

This logic works until spi devices are no longer capable of sustaining
their highest frequency regardless of the operation. Spi memories are
typically subject to such variation. Some devices are capable of
spitting their internally stored data (essentially in read mode) at a
very fast rate, typically up to 166MHz on Winbond SPI-NAND chips, using
"fast" commands. However, some of the low-end operations, such as
regular page read-from-cache commands, are more limited and can only be
executed at 54MHz at most. This is currently a problem in the SPI-NAND
subsystem. Another situation, even if not yet supported, will be with
DTR commands, when the data is latched on both edges of the clock. The
same chips as mentioned previously are in this case limited to
80MHz. Yet another example might be continuous reads, which, under
certain circumstances, can also run at most at 104 or 120MHz.

As a matter of fact, the "one frequency per chip" policy is outdated and
more fine grain configuration is needed: we need to allow per-operation
frequency limitations. So far, all datasheets I encountered advertise a
maximum default frequency, which need to be lowered for certain specific
operations. So based on the current infrastructure, we can still expect
firmware (device trees in general) to continued advertising the same
maximum speed which is a mix between the PCB limitations and the chip
maximum capability, and expect per-operation lower frequencies when this
is relevant.

Add a `struct spi_mem_op` member to carry this information. Not
providing this field explicitly from upper layers means that there is no
further constraint and the default spi device maximum speed will be
carried instead. The SPI_MEM_OP() macro is also expanded with an
optional frequency argument, because virtually all operations can be
subject to such a limitation, and this will allow for a smooth and
discrete transition.

For controller drivers which do not implement the spi-mem interface, the
per-transfer speed is also set acordingly to a lower (than the maximum
default) speed, or 0, to comply with the current API.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       |  8 ++++++++
 include/linux/spi/spi-mem.h | 11 ++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 17b8baf749e6..ab650ae953bb 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -356,6 +356,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 {
 	unsigned int tmpbufsize, xferpos = 0, totalxferlen = 0;
 	struct spi_controller *ctlr = mem->spi->controller;
+	unsigned int xfer_speed = op->max_freq;
 	struct spi_transfer xfers[4] = { };
 	struct spi_message msg;
 	u8 *tmpbuf;
@@ -368,6 +369,9 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	if (!spi_mem_internal_supports_op(mem, op))
 		return -EOPNOTSUPP;
 
+	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
+		((struct spi_mem_op *)op)->max_freq = mem->spi->max_speed_hz;
+
 	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
 		ret = spi_mem_access_start(mem);
 		if (ret)
@@ -407,6 +411,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	xfers[xferpos].tx_buf = tmpbuf;
 	xfers[xferpos].len = op->cmd.nbytes;
 	xfers[xferpos].tx_nbits = op->cmd.buswidth;
+	xfers[xferpos].speed_hz = xfer_speed;
 	spi_message_add_tail(&xfers[xferpos], &msg);
 	xferpos++;
 	totalxferlen++;
@@ -421,6 +426,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		xfers[xferpos].tx_buf = tmpbuf + 1;
 		xfers[xferpos].len = op->addr.nbytes;
 		xfers[xferpos].tx_nbits = op->addr.buswidth;
+		xfers[xferpos].speed_hz = xfer_speed;
 		spi_message_add_tail(&xfers[xferpos], &msg);
 		xferpos++;
 		totalxferlen += op->addr.nbytes;
@@ -432,6 +438,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		xfers[xferpos].len = op->dummy.nbytes;
 		xfers[xferpos].tx_nbits = op->dummy.buswidth;
 		xfers[xferpos].dummy_data = 1;
+		xfers[xferpos].speed_hz = xfer_speed;
 		spi_message_add_tail(&xfers[xferpos], &msg);
 		xferpos++;
 		totalxferlen += op->dummy.nbytes;
@@ -447,6 +454,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		}
 
 		xfers[xferpos].len = op->data.nbytes;
+		xfers[xferpos].speed_hz = xfer_speed;
 		spi_message_add_tail(&xfers[xferpos], &msg);
 		xferpos++;
 		totalxferlen += op->data.nbytes;
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index f866d5c8ed32..8963f236911b 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -68,6 +68,9 @@ enum spi_mem_data_dir {
 	SPI_MEM_DATA_OUT,
 };
 
+#define SPI_MEM_OP_MAX_FREQ(__freq)				\
+	.max_freq = __freq
+
 /**
  * struct spi_mem_op - describes a SPI memory operation
  * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
@@ -95,6 +98,9 @@ enum spi_mem_data_dir {
  *		 operation does not involve transferring data
  * @data.buf.in: input buffer (must be DMA-able)
  * @data.buf.out: output buffer (must be DMA-able)
+ * @max_freq: frequency limitation wrt this operation. 0 means there is no
+ *	      specific constraint and the highest achievable frequency can be
+ *	      attempted).
  */
 struct spi_mem_op {
 	struct {
@@ -132,14 +138,17 @@ struct spi_mem_op {
 			const void *out;
 		} buf;
 	} data;
+
+	unsigned int max_freq;
 };
 
-#define SPI_MEM_OP(__cmd, __addr, __dummy, __data)		\
+#define SPI_MEM_OP(__cmd, __addr, __dummy, __data, ...)		\
 	{							\
 		.cmd = __cmd,					\
 		.addr = __addr,					\
 		.dummy = __dummy,				\
 		.data = __data,					\
+		__VA_ARGS__					\
 	}
 
 /**
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
