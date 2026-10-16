Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8504BCC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mD3/TDBTA6jpNt9xrkz7o3AopCOjxZ3Gb3hDlHJwTvg=; b=t7GjrTQTBtwwss
	NhhswIWu7HYSJ9sznRpzHgvTIXvUaBHb2bCLVVecZPCXbgTJ57+q9fAxhm3+jm+mOrXLajtjRrTrD
	q/5ch906EwY3WoDoYMPv2R5rq5B96tJ0IswHoCMUP50ZIKu/Gf8SAr62v5yvV/v4OdixwXAE2lXrU
	n53sfNV2qOr9XHJw055wBUICXGYy7vWxNWC3PuYiOGv0xmI9CsbJoTy+Rnz+sycGAP1gK2b9Sq2vO
	SfjpjHEL2qaBdZzVv0iFXrQNpFfIeXaWqyzomWc5QNn+5exOJrQEYoY6uO50t9We+bRYjcQHGFb9b
	rKWdAOLhWsh1z23tWpXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCN-00000002cIi-1MUe;
	Fri, 16 Oct 2026 10:30:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCM-00000002cHo-1LcI
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lUpahHMzEtwV8QSMlGfrMAjK/Eml289xKqSP8jhGAd0=; b=NS3tZumRLb9QTY5bg5aSoL2TDq
	WeWy9UW7/BPYe7Jkixlg0MZysYAgnA6Lj6hd6oofkQErMDrcT/szovyQcPgEKTSXB0tB0DJNy6s+1
	pNL1q1vw92w0Y5TWuTkHQ2Hqal5ml9uKNssqUmkYvtbxuetiqXHkrPS38W7Ka65eT8jLePlkVMTeN
	lGoTsARh5Sbag06sn5fYTLH093RJTBjYsvxBqKLaiq7N2vdnEKt5e/kocCmKPUgyb5kz6AQPuVKeK
	AUg20YwXLqbv5AFZ4c2WeI6uv5nisGCeB13ArR30e92/EiWrVOnH8cIHVENzHynMjLIcK+26dqXDH
	XXT/hV8g==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfCI-00000001Neo-3XW7
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0E7CE1A124A;
	Fri, 16 Oct 2026 10:29:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D64736075D;
	Fri, 16 Oct 2026 10:29:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02FE7103284D3;
	Fri, 16 Oct 2026 12:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792146595; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lUpahHMzEtwV8QSMlGfrMAjK/Eml289xKqSP8jhGAd0=;
	b=s/141fC0UvOeYTAPBUdPtZ89vY+EKnLE+l/DySPGpAoMFiZf8DfWsGwOJJp9WkccZfiU+d
	/U2TYfPleHQkwmD5ZBIn+Fvc4xSATtBrk9PX8tUpFnZIUwthFLJgcCIglQlj59/8gcZa/b
	ObUpFlvteTw1aVV+rDFqUm0IjMFw0phd8/RcJTnYzDTk+DM+owhkem7CNEmjwSEZLkFDQr
	luIBcNwE7pZ56tvO5YxW2WKElWVIfpVGt5AzmpXrJrA7x7NiRME4e2LsYHUur1Xzz/s0oy
	mBFr73l3gwos7LfWgdI5WXXpxFCeoYhyCT5HOYOeyulxl63cTQpyzaRAANvQuA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 1/7] spi: spi-mem: Add support for panic mem writes
Date: Fri, 16 Oct 2026 12:29:11 +0200
Message-ID: <20261016102917.171095-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016102917.171095-1-paul.cercueil@bootlin.com>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_112959_238395_AA8BBE47 
X-CRM114-Status: GOOD (  21.95  )
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
    
    v3: - Use pm_runtime_active() instead of pm_runtime_get_if_active(). The
          latter cannot be used in a panic context.
        - Forbid fallback to regular SPI on panic
    
    v4: No change

 drivers/spi/spi-mem.c       | 42 +++++++++++++++++++++++++++++++++----
 include/linux/spi/spi-mem.h |  5 +++++
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index b94680b60af9..9ad42dd9de70 100644
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
 
@@ -420,15 +445,20 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		return -EOPNOTSUPP;
 
 	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
-		ret = spi_mem_access_start(mem);
-		if (ret)
-			return ret;
+		if (!op->panic_write) {
+			ret = spi_mem_access_start(mem);
+			if (ret)
+				return ret;
+		} else if (!pm_runtime_active(ctlr->dev.parent)) {
+			return -EPERM;
+		}
 
 		trace_spi_mem_start_op(mem, op);
 		ret = ctlr->mem_ops->exec_op(mem, op);
 		trace_spi_mem_stop_op(mem, op);
 
-		spi_mem_access_end(mem);
+		if (!op->panic_write)
+			spi_mem_access_end(mem);
 
 		/*
 		 * Some controllers only optimize specific paths (typically the
@@ -441,6 +471,10 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 
 			return ret;
 		}
+
+		/* On panic write we can't fall back to the fallback SPI path */
+		if (op->panic_write)
+			return ret;
 	}
 
 	tmpbufsize = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
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
