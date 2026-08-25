Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6851C5DF81
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 01:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mSmFno75omDfWYGhHrjYdxwvsI/GhuBBs7x2ZevZGnw=; b=AWFVLblAV2L2R1
	15IbgCB7K2I6t2IQA+liLT12UssejhrzRA/Nn6acji0AFJe2gHG3kUJ3ia9/R2ABzkeMnmrOBYUmP
	MZ+FdG1gdUBWDIkd3UtbPnvlRPi52k6Qdq4NZI5fuKrtf1u1mizK8Br+VTEyS1h0fUlTY13tXvqAV
	HY1XPg0flb01tf3zUQJltN//7wwpRUyV8sI5u+Qu7RidX/GFnLhEr7sQa/gtqVNuZm1ZHHvZAiqIN
	2/ZJhvYnE0qTdG4BYVu2qA+5/AlwYIOn5d02WiVYZgpzT/3vtB0w7hJhdtScW2lq12/ltzAzgLzEF
	c2nB1ZW9fval56mTA2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyg8X-000000001GP-3lwt;
	Tue, 25 Aug 2026 01:39:37 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyg8Q-000000001Fj-31e1
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 01:39:36 +0000
DKIM-Signature: a=rsa-sha256; b=e01QFpG9Gq3786qtZIww7tX6T1Ihw9j1szgJSJhkyyw2oFtXg7DTeSV7KNzgSTsdbhr3kPiVsgMZMRv9qbUrLsjoeRgEMmudMiXzYxKfZDn7yJcZAMpph+10eg16xHtEXAXnMWthmQfN9BV7ZBye6jLNJmpYkcjGQditZ2sz5xrlI41J6knNY/DHp7MsKbnjDjCzWMI5AljOOKghyBpkF/IpQXfzyoALqrOZduz+C8MU+RaMa2kVNRmoWiVYFCcXdHeAC3HA2us/G2WQLRBV7jdxnNp6C6p9X4dbNDcyegHYd895I5qg8VFtyZxLT/48C2Ieu2Sq4vlgeeBtyE2S9Q==; s=purelymail1; d=c127.dev; v=1; bh=S41ebfT7xo/qZtIIIBZyOORVT3DUlpSqNwSmIUKtTl0=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=LPJQDrx/fajOg6CYdhAOYtztRZMC3ueqX9+tgZk1ZEbzKPbE0vJjjSLtgLUEwzbYbLasHIUGo+veK6dFFJhtTHhlc7hPxvXYRss2OkTIysm+iou2onk40qcpTXEaVKbVwWr699e4Tqw6jRWRfthWO1YOAmu1O+EUYFcWUEyu/BVGj5j3yzXDvbzh0UAP3qHCXxnnXy4zTW3rLeUOKMZbQLuIqobqHXsNnT3Gh8nkKaZ0SuGpGVD6XcdOSSDXPtI7QdKZnfGblpNDbqURBHu7LbHNCIdl44s3gyzTcxEiaZc+g0rQ7bhRTx/ai4Yf53NmF4YZuFwo4igsaytn5WlZ+w==; s=purelymail1; d=purelymail.com; v=1; bh=S41ebfT7xo/qZtIIIBZyOORVT3DUlpSqNwSmIUKtTl0=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1017243:43747:null:purelymail
X-Pm-Original-To: linux-mtd@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 936311042;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 25 Aug 2026 01:38:52 +0000 (UTC)
From: Johan Alvarado <contact@c127.dev>
To: broonie@kernel.org,
	md.alam@oss.qualcomm.com
Cc: konradybcio@kernel.org,
	pengpeng@iscas.ac.cn,
	miquel.raynal@bootlin.com,
	j4g8y7@gmail.com,
	quic_varada@quicinc.com,
	quic_srichara@quicinc.com,
	linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Alvarado <contact@c127.dev>
Subject: [PATCH] spi: spi-qpic-snand: publish the ECC context to snandc->qspi
Date: Mon, 24 Aug 2026 20:38:48 -0500
Message-ID: <20260825013848.1056946-1-contact@c127.dev>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_183935_370404_E3393F67 
X-CRM114-Status: GOOD (  15.84  )
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

qcom_spi_ooblayout_ecc() and qcom_spi_ooblayout_free() read the ECC
configuration through snandc->qspi->ecc. qcom_spi_probe() points it at a
zeroed scratch struct and only qcom_spi_ecc_prepare_io_req_pipelined(),
which runs on page I/O, ever updates it. qcom_spi_ecc_init_ctx_pipelined()
installs the ooblayout but does not publish the context it just
allocated, and qcom_spi_ecc_cleanup_ctx_pipelined() frees that context
without clearing the pointer.

spinand_init() calls mtd_ooblayout_count_freebytes() right after the ECC
context is created and before any page I/O, so the ooblayout always runs
against a pointer that does not describe the current context:

  - On a first probe it reads the zeroed struct from qcom_spi_probe(),
    so steps, bytes and bbm_size are 0. The count then returns 0 rather
    than an error, so the probe continues with mtd->oobavail set to 0.

  - On a probe retry it reads the ecc_cfg the previous attempt freed.

A retry is easy to hit. On IPQ5018 with the qcom,smem-part parser the
partition parse returns -EPROBE_DEFER until SMEM has probed, so the
first spi-nand probe defers. It defers inside
mtd_device_parse_register(), after mtd_otp_nvmem_add() has already read
the factory OTP - that read goes through prepare_io_req and leaves
snandc->qspi->ecc pointing at the context that spinand_cleanup() then
frees. The second probe allocates a new context, never publishes it, and
computes the OOB layout from the freed one. Once the slab has been
reused, qecc->steps holds garbage and

  oobregion->length = qecc->steps * 4;

goes negative. qcom_spi_ooblayout_free() only reports -ERANGE for
section 1 and later, so mtd_ooblayout_count_bytes() sums the regions and
returns that negative length as the byte count. The -512 below is
steps * 4 with steps == -128. It is a byte count that happens to
collide with -ERESTARTSYS, not an error the driver returned.
spinand_init() takes it as an error, and because it is not
-EPROBE_DEFER the driver core never retries and the NAND never appears:

  spi-nand spi0.0: ESMT SPI NAND was found.
  spi-nand spi0.0: probe with driver spi-nand failed with error -512
  UBI error: cannot open mtd rootfs, error -2
  Waiting for root device /dev/ubiblock0_1...

On a Mercusys MR80X (IPQ5018, ESMT F50D1G41LB) about half of the boots
failed to mount the rootfs, the outcome depending on whether the freed
memory had been overwritten yet.

Publish the context when it is created and clear the pointer when it is
destroyed. Clearing leaves snandc->qspi->ecc NULL after cleanup, which
is safe: the mtd is unregistered before cleanup_ctx runs, so no
ooblayout callback can follow.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Cc: stable@vger.kernel.org
Signed-off-by: Johan Alvarado <contact@c127.dev>
---
Tested on a Mercusys MR80X (IPQ5018, ESMT F50D1G41LB) running 6.18.44
with the equivalent change; mainline build-tested with W=1, no warnings.

 drivers/spi/spi-qpic-snand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 61b1f2eb19ce..0d0ae93ad4bf 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -411,6 +411,8 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 	dev_dbg(snandc->dev, "ECC strength: %u bits per %u bytes\n",
 		ecc_cfg->strength, ecc_cfg->step_size);
 
+	snandc->qspi->ecc = ecc_cfg;
+
 	return 0;
 
 err_free_ecc_cfg:
@@ -427,6 +429,7 @@ static void qcom_spi_ecc_cleanup_ctx_pipelined(struct nand_device *nand)
 
 	kfree(snandc->qspi->oob_buf);
 	snandc->qspi->oob_buf = NULL;
+	snandc->qspi->ecc = NULL;
 	kfree(ecc_cfg);
 }
 
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
