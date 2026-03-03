Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDC2EDA698
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMLIHdHYTH3g2cRvZNUCrprWD2NqExRuZCbpghww53Y=; b=mHf/LTfGe7HATO
	f2PRQ6Qn7wNzVjrmaC7EhVB5rMYLjHQHXre68B6UgCkPFu8f8v3k2wNmtF6F+wQw3+ERGT2zEBJeQ
	uLqUKrXbkf5nHwaPL95Ch5hmMFA07/DaMGJHmZlPzvLnuBbsY9OiRpzUm/bX3ROCFuoKvoR+4bEQS
	dvaWxqluth6xpCekXklFIQy/HS+G2WU0Dw/Thnd9dXfS6uxIefhjxPjCceOQZvYp6xsb4Q9zi4Oa8
	tsfHlmhDlG9lBf/+NjEJEm3ofeumDFwjNTrgFeClBD014RKeebwQBYOl9Bz5flPngRWJqedkqZud2
	Q3UqMgZqFdQkhzu2872A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdN-0000000FZLF-3ncQ;
	Tue, 03 Mar 2026 16:30:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdM-0000000FZKA-4B8C
	for linux-mtd@bombadil.infradead.org;
	Tue, 03 Mar 2026 16:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=9cQhV2OiJ4DlfedZpH/R3rEHE14PIfUJqqPTZYp7QUU=; b=EFFY1+tNesULPmd0X/erk5hWLo
	q6eRJbKYONI6fgFG321bol9S9vq48w9aAwLKuvetTe4f7ibjbXWIsMRPDkVP/hxdrBJYgg5xrDNzp
	67u/YdKJh/8jY0QJc5CgIqXByPtarg/o0e5rGTZUr3fP6lQ2W/hoj1C56V87jrHyjBWNGxtigb0Ib
	epHWX8311g/ipuQok0SIjNKhYCB8+UUyS7wH56hFFpSJJn1CluDPgPyeeUuQIpWARbkVhw1T3bQkT
	EpDUH+5qxRnkiNpV+HyOgO+f3Uy3QL6L+1PSwLrhvCBXGNTpljq8YDKPx6Kdnju0MwY8ErVEtrFUn
	XZyYVe8A==;
Received: from mail.fris.de ([116.203.77.234])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdJ-0000000Bnac-3wwg
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:30:07 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1772555397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cQhV2OiJ4DlfedZpH/R3rEHE14PIfUJqqPTZYp7QUU=;
	b=Pp6Nc3CpwIIn5asGLiOHOSd3GqtpgaZC1ICn9uIEQ91cLlYda6UlSL/49xQ271caQwXLlq
	hMpMUJrpIzQIvd2vpheuMxHuaVFcwBbtz+aVFlJYnYnlZo9JtVISZr6O/dsk9rs7zuDAQ4
	WXYlPvXYaFP3RreuqBjioZqs/iUaS2cuArJ2RZoI9fYOtwfNXPfLHCgzxGLfSljp5+P24L
	VkQChDTAf21LAJE/5LKxGteLJbi0HkFyEET7o/l5Aiviam6y5RC1NNEv1862EkCtcRfzcR
	DM8tJCWBige64Ri4I+nqm7o3E1x/bU1miPv2RjGx13OQr/S20Nkb8XophmrYXA==
Date: Tue, 03 Mar 2026 17:29:26 +0100
Subject: [PATCH RFC 5/7] spi: Add RX sampling point adjustment
MIME-Version: 1.0
Message-Id: <20260303-fsl-qspi-rx-sampling-delay-v1-5-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
To: Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Han Xu <han.xu@nxp.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, imx@lists.linux.dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5737;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=rxgCw1+pDnvqWT9mh/JJrKWrgFwnOW+QIMt7NVQjShA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIXM5T1PNxMPcscmFyyfYnjr8/q6q+a90g/o38crb2qQ8d
 mxaWDi7o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJ96xkZlh+yqPtidcB03rWP
 ajO+6vJd0BOUEqnI/r9s4Q9/UanKs4wMd4uyjh3jXLjs4ctnxz0k1pSpc7WKLkh7zKlYdNoncFc
 UOwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_163006_060442_714BAB42 
X-CRM114-Status: GOOD (  19.44  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Some SPI devices such as SPI NAND chips specify a clock-to-RX-sampling
delay constraint, which means that for the data read from the device
at a certain clock rate, we need to make sure that the point at
which the data is sampled is correct.

The default is to assume that the data can be sampled one half clock
cycle after the triggering clock edge. For high clock rates, this
can be too early.

To check this we introduce a new core function spi_set_rx_sampling_point()
and a handler set_rx_sampling_point() in the SPI controller.

Controllers implementing set_rx_sampling_point() can calculate the
sampling point delay using the helper spi_calc_rx_sampling_point()
and store the value to set the appropriate registers during transfer.

In case the controller capabilities are not sufficient to compensate
the RX delay, spi_set_rx_sampling_point() returns a reduced clock
rate value that is safe to use.

This commit does not introduce generic logic for controllers that
don't implement set_rx_sampling_point() in order to reduce the clock
rate if the RX sampling delay requirement can not be met.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/spi/spi.c       | 73 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/spi/spi.h |  8 ++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 61f7bde8c7fbb..b039007ed430f 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3988,6 +3988,77 @@ static int spi_set_cs_timing(struct spi_device *spi)
 	return status;
 }
 
+/**
+ * spi_calc_rx_sampling_point - calculate RX sampling delay cycles
+ * @spi: the device that requires specific a RX sampling delay
+ * @freq: pointer to the clock frequency setpoint for the calculation. This gets
+ *        altered to a reduced value if required.
+ * @max_delay_cycles: the upper limit of supported delay cycles
+ * @delay_cycles_per_clock_cycle: the ratio between delay cycles and
+ *				  master clock cycles
+ *
+ * This function takes in the rx_sampling_delay_ns value from the SPI device
+ * and the given clock frequency setpoint and calculates the required sampling
+ * delay cycles to meet the device's spec. It uses the given controller
+ * constraints and if those are exceeded, it adjusts the clock frequency
+ * setpoint to a lower value that is safe to be used.
+ *
+ * Return: calculated number of delay cycles
+ */
+unsigned int spi_calc_rx_sampling_point(struct spi_device *spi, unsigned int *freq,
+					u16 max_delay_cycles,
+					u16 delay_cycles_per_clock_cycle)
+{
+	unsigned long long temp;
+	u16 delay_cycles;
+
+	/* if sampling delay is zero, we assume the default sampling point can be used */
+	if (!spi->rx_sampling_delay_ns)
+		return 0;
+
+	temp = *freq * delay_cycles_per_clock_cycle * spi->rx_sampling_delay_ns;
+	do_div(temp, 1000000000UL);
+	delay_cycles = temp;
+
+	if (delay_cycles > max_delay_cycles) {
+		/*
+		 * Reduce the clock to the point where the sampling delay requirement
+		 * can be met.
+		 */
+		delay_cycles = max_delay_cycles;
+		temp = (1000000000UL * delay_cycles);
+		do_div(temp, spi->rx_sampling_delay_ns * delay_cycles_per_clock_cycle);
+		*freq = temp;
+	}
+
+	dev_dbg(&spi->controller->dev, "calculated RX sampling point delay: %u cycle(s) at %lu KHz", delay_cycles, *freq / 1000);
+
+	return delay_cycles;
+}
+EXPORT_SYMBOL_GPL(spi_calc_rx_sampling_point);
+
+/**
+ * spi_set_rx_sampling_point - set the RX sampling delay in the controller driver
+ * @spi: the device that requires specific a RX sampling delay
+ * @freq: the clock frequency setpoint for the RX sampling delay calculation
+ *
+ * This function calls the set_rx_sampling_point() handle in the controller
+ * driver it is available. This makes sure that the controller uses the proper
+ * RX sampling point adjustment. This function should be called whenever
+ * the devices rx_sampling_delay_ns or the currently used clock frequency
+ * changes.
+ *
+ * Return: adjusted clock frequency
+ */
+unsigned int spi_set_rx_sampling_point(struct spi_device *spi, unsigned int freq)
+{
+	if (spi->controller->set_rx_sampling_point)
+		return spi->controller->set_rx_sampling_point(spi, spi->max_speed_hz);
+
+	return freq;
+}
+EXPORT_SYMBOL_GPL(spi_set_rx_sampling_point);
+
 /**
  * spi_setup - setup SPI mode and clock rate
  * @spi: the device whose settings are being modified
@@ -4090,6 +4161,8 @@ int spi_setup(struct spi_device *spi)
 		}
 	}
 
+	spi->max_speed_hz = spi_set_rx_sampling_point(spi, spi->max_speed_hz);
+
 	status = spi_set_cs_timing(spi);
 	if (status) {
 		mutex_unlock(&spi->controller->io_mutex);
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 4f8a0c28e1d46..f5be4f54d1424 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -685,6 +685,9 @@ struct spi_controller {
 	 */
 	int (*set_cs_timing)(struct spi_device *spi);
 
+	/* set RX sampling point */
+	unsigned int (*set_rx_sampling_point)(struct spi_device *spi, unsigned int freq);
+
 	/*
 	 * Bidirectional bulk transfers
 	 *
@@ -1337,6 +1340,11 @@ extern int spi_setup(struct spi_device *spi);
 extern int spi_async(struct spi_device *spi, struct spi_message *message);
 extern int spi_target_abort(struct spi_device *spi);
 
+unsigned int spi_calc_rx_sampling_point(struct spi_device *spi, unsigned int *freq,
+					       u16 max_delay_cycles,
+					       u16 delay_cycles_per_clock_cycle);
+unsigned int spi_set_rx_sampling_point(struct spi_device *spi, unsigned int freq);
+
 static inline size_t
 spi_max_message_size(struct spi_device *spi)
 {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
