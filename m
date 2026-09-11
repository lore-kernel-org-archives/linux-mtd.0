Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDEEC88E53
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 18:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wpnviy764PLxl7+fkMQDakUTcEMVpVhPBmOdezBGwc=; b=SbRE7bYxn+O3iM
	SIQmlzT9d1EunZ416JWEl5rO5A/29qExq7K5dycfGfxOnX0LNF+yRhzlBYaT9R8/Ibe58dvqc06NP
	Utye5Zg5fDx8sESuS+MaUYDvERx9/btwIUS5ql9W8lHE9yDHuWYTjKobnuAsVR9RJmVJU6KMxpmbX
	Nhvi3KMQYgC/3cftKfZcjnbnN7QlhXCvS5pJsZpctIyvLSw1RmjlVM+f6YxluaOg7D6nj29Wxqud0
	Uyz8agbgBknCiljsYC34x88gRrZem3ElCoD2dZ9c4wA+o8Cjj35rvNZ3d2aChpEyDfracU52trMHq
	9IT4SV4pBcJs23J+/OMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56F2-0000000HT0N-1NeM;
	Fri, 11 Sep 2026 18:44:52 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56Ez-0000000HSzU-2f03
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 18:44:50 +0000
DKIM-Signature: a=rsa-sha256; b=fu24JMu2LMFoXk897ztzdTR8oGDiO9ShsCIYIcrA7O8us1CEVIy8+8v4f8nFE17tZMHMA6ARJywOj3/k7WJfk9gakGG4BIOlUp/zn2N+4bj8cErE2Z2YDs6G2UR4fa7vi4sVRxDe7l6t5h41zC6puBCLNBTOgCTm2+X0O1knSgXpgJUr6jM0i+1a64RCmUkrFyUIvtdXKCR4J4TSPCW5O7MbW6F+vZpnYftARjXgRFCb1HYki4aW85I6uRHD1tqi3hrr9ecJORcLhnVkzhzB9MA0igMYCeyieAzTEvN0cWBzLxBnz1UZ3kmR7dOWEqLQItkUSC5AJE4pTRoolnie9A==; s=purelymail1; d=c127.dev; v=1; bh=OdyIaFHTfKbXWj6XRC6rk9Un0vCTcVZlLONiQQ35BAk=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=mB02m2EH728+49IdiolSZCE4m+rrnEqTmoxFjva7xhjSTyrIfBF12YAw/WHwXpmQwjiSYB3M+gfwijn5d2O2deQIRdJEXe/EGeUWz5ejGhqXU+3BMqwMcZ1DPUArS2BmC8D12Nh5QlY43VWSP0AwkiXK9Tkb3sL/lK2LrmD+AzZHUPKx541UBtM2v4Hb/HDd24HOdrCfDmjAdPFEC+4fPHN1QbiKlrnsNea1calnNh+/72YOMgb3+t4eYog15ndEwxJ/reEwmdXXojh+Vh2ouy6ZNDIEpLov2dqVKq0cjoEVsF5RIhplrSO9eZizIv+ISnLh7/ZVmglJmwpWh/iPnQ==; s=purelymail1; d=purelymail.com; v=1; bh=OdyIaFHTfKbXWj6XRC6rk9Un0vCTcVZlLONiQQ35BAk=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1017243:43747:null:purelymail
X-Pm-Original-To: linux-mtd@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1066090597;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 11 Sep 2026 18:44:22 +0000 (UTC)
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
Subject: [PATCH v2 1/2] spi: spi-qpic-snand: publish the ECC context to snandc->qspi
Date: Fri, 11 Sep 2026 13:44:15 -0500
Message-ID: <20260911184416.109790-2-contact@c127.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911184416.109790-1-contact@c127.dev>
References: <20260911184416.109790-1-contact@c127.dev>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_114449_787666_1762A562 
X-CRM114-Status: GOOD (  16.73  )
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
Tested-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Johan Alvarado <contact@c127.dev>
---
Unchanged from v1. Both hunks are untouched by 44d39535cd4f, so this
applies to v7.3-rc2 and to spi/for-next alike.

 drivers/spi/spi-qpic-snand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 9eafaea74f6b..20045d4a46fa 100644
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
