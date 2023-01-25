Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B609C54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 08:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35biixPzhqjWp2D+Ctw7hfUsHNfaAMQT9AmgwzBh+EY=; b=gIsc788hUbYe2W
	T3l+AO1Au8O/fSK1pB8HHG0tpEP0xblz8vjdhnZHvaB8ND+gGd74deu7k9SIVWSpxwezbFNuXIbH5
	fR/XjBhVxzZ4Sh00czS6LZK5mmVbTZK4o5/2mhhmNpGicOAIkgZuuFyBhCKgezt1T9CZlvNg4Uxws
	XK5IklQ9ObzV5iIEYHWUi2ozAezTvcio9kI2ABM1eYoILEIeJfgAECPbCaaiBRZnU8RWMbywWQTP4
	kSarb6Xh/+MR+fiI0T4exeP3whYjDeZtTAmz8oHmTSXeKvpgCH5dJChArnFZqoCiMp0c2b6rQsh4D
	HVUhV+zgsnPYeZ6KOQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKasv-006Kz2-6M; Wed, 25 Jan 2023 08:11:57 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKasB-006Khq-BI; Wed, 25 Jan 2023 08:11:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30P8B4vn059195;
	Wed, 25 Jan 2023 02:11:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674634264;
	bh=H6KisuMO1+dkW1oxul0NcexVOnMzVPplM1t3KZiQg1k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kOFvGhQcoiLPwPe7UJSzl0nr8TqRqydgJB/MPGsi9jteq/L4Wc0GpUnGoBI+XQ/l9
	 vhI3wub9h+aksqOoUbO+uT+BCGQFXvlHAcXGs5hq8mrRZrIoxynmt5u6c9mu9bcX7I
	 7vkG7DIUOyp7eSrVFA4fz1E8TjExPh6vR0tNI6T0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30P8B4Op027318
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 02:11:04 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 02:11:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 02:11:04 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30P8B2mg075654;
	Wed, 25 Jan 2023 02:11:03 -0600
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
Subject: [PATCH v2 3/4] spi: cadence-quadspi: setup ADDR Bits in cmd reads
Date: Wed, 25 Jan 2023 13:40:22 +0530
Message-ID: <20230125081023.1573712-4-d-gole@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125081023.1573712-1-d-gole@ti.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001111_492581_89DA37BE 
X-CRM114-Status: GOOD (  12.53  )
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

Setup the Addr bit field while issuing register reads in STIG mode. This
is needed for example flashes like cypress define in their transaction
table that to read any register there is 1 cmd byte and a few more address
bytes trailing the cmd byte. Absence of addr bytes will obviously fail
to read correct data from flash register that maybe requested by flash
driver because the controller doesn't even specify which address of the
flash register the read is being requested from.

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 4bbf6e3ad34a..a6d0f1b0bb49 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -532,6 +532,17 @@ static int cqspi_command_read(struct cqspi_flash_pdata *f_pdata,
 	/* 0 means 1 byte. */
 	reg |= (((n_rx - 1) & CQSPI_REG_CMDCTRL_RD_BYTES_MASK)
 		<< CQSPI_REG_CMDCTRL_RD_BYTES_LSB);
+
+	/* setup ADDR BIT field */
+	if (op->addr.nbytes) {
+		reg |= (0x1 << CQSPI_REG_CMDCTRL_ADDR_EN_LSB);
+		reg |= ((op->addr.nbytes - 1) &
+			CQSPI_REG_CMDCTRL_ADD_BYTES_MASK)
+			<< CQSPI_REG_CMDCTRL_ADD_BYTES_LSB;
+
+		writel(op->addr.val, reg_base + CQSPI_REG_CMDADDRESS);
+	}
+
 	status = cqspi_exec_flash_cmd(cqspi, reg);
 	if (status)
 		return status;
--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
