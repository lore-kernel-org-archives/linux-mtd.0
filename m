Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF8C54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACHG92ncB3u7KUHhyASG9xMlEVtb5J2NqbQ0/toxAj0=; b=mOkYti2+WDRZ74
	T1dDzwOo2zLw6VN4TGu87RuD4Osla+nFcAWWQB6+AS9lT2iT6rbGUptPd21AXSZr6clSppl8bmIX5
	1DTlJdHfvqPSJnZaXfT4P8whXFVJYolIhiKXsCeYBdJBP5/e1osiEQLw5mUVVoMBn7SgAsOkRab3T
	4m5vUvUkRia8ZUW5GjEGUOX7L/Fj0lKOaTGS/GmQ83PN1IyNwdt0ZxhIhO6QqRYydQ4262A7REKj/
	+uRMjZGFgEaB3olyU+yYHmgSWs2fHPk3kHmmSqZ/phssgQt3djJC2VppKEBJ+MoHpzKxbvLpTPnpz
	o6HWgxooI5oopCMsDnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKatJ-006LF1-KZ; Wed, 25 Jan 2023 08:12:21 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKasF-006KjT-Li; Wed, 25 Jan 2023 08:11:17 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30P8BA9l011886;
	Wed, 25 Jan 2023 02:11:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674634270;
	bh=Hn4D1RStKcp308sq3cbg4/Y6SSqzZ28U4qiM8PCYDgk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AoHM/UWRS/effmMZCsJiCPgtXBNrhgKYttnXZS4eNB6SIvMs/uMdcR1v62isnjPdc
	 Hd+YwrNpLDwZHGQhCYsfemD0HHuq7n+A+/IRlcjAsxjbSlTlv00iMJ4pvddukd+q0j
	 VxOX8hxIkUORtMxQTL21rD8Cuse1CTOiGPi6ma+w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30P8BAFU121583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 02:11:10 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 02:11:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 02:11:09 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30P8B8gG009447;
	Wed, 25 Jan 2023 02:11:09 -0600
From: Dhruva Gole <d-gole@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>, Dhruva
 Gole <d-gole@ti.com>,
        <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Takahiro.Kuwano@infineon.com>,
        Pratyush Yadav <ptyadav@amazon.de>
Subject: [PATCH v2 4/4] spi: cadence-quadspi: use STIG mode for small reads
Date: Wed, 25 Jan 2023 13:40:23 +0530
Message-ID: <20230125081023.1573712-5-d-gole@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125081023.1573712-1-d-gole@ti.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001115_816529_E46B058E 
X-CRM114-Status: GOOD (  18.14  )
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

Fix the issue where some flash chips like cypress S25HS256T return the
value of the same register over and over in DAC mode.

For example in the TI K3-AM62x Processors refer [0] Technical Reference
Manual there is a layer of digital logic in front of the QSPI/OSPI
Drive when used in DAC mode. This is part of the Flash Subsystem (FSS)
which provides access to external Flash devices.

The FSS0_0_SYSCONFIG Register (Offset = 4h) has a BIT Field for
OSPI_32B_DISABLE_MODE which has a Reset value = 0. This means, OSPI 32bit
mode enabled by default.

Thus, by default controller operates in 32 bit mode causing it to always
align all data to 4 bytes from a 4byte aligned address. In some flash
chips like cypress for example if we try to read some regs in DAC mode
then it keeps sending the value of the first register that was requested
and inorder to read the next reg, we have to stop and re-initiate a new
transaction.

This causes wrong register values to be read than what is desired when
registers are read in DAC mode. Hence if the data.nbytes is very less
then prefer STIG mode for such small reads.

[0] https://www.ti.com/lit/ug/spruiv7a/spruiv7a.pdf

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index a6d0f1b0bb49..2954c06a7f57 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1359,7 +1359,13 @@ static int cqspi_mem_process(struct spi_mem *mem, const struct spi_mem_op *op)
 	cqspi_configure(f_pdata, mem->spi->max_speed_hz);

 	if (op->data.dir == SPI_MEM_DATA_IN && op->data.buf.in) {
-		if (!op->addr.nbytes)
+	/*
+	 * Performing reads in DAC mode forces to read minimum 4 bytes
+	 * which is unsupported on some flash devices during register
+	 * reads, prefer STIG mode for such small reads.
+	 */
+		if (!op->addr.nbytes ||
+		    op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX)
 			return cqspi_command_read(f_pdata, op);

 		return cqspi_read(f_pdata, op);
--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
