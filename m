Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B935BC54EED
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plBlUY9HWiN1AyBKMvZwliwNFxPe2JxHszgAXO7vPO8=; b=0evPepyXr9GOig
	nOD/G60UFYK3s9hGVooHx7R2H91bEvdjbXLaLxngDDKkaN6ssPSknniWOCS8JprpcftNO1+LIFmGi
	f3ZKWJywt6CU7ffWApyj6q59jMk6661gU52oCwipOgCbD2vIkg7ZA+BZIosRSU1qtsNR4b7poV4xH
	D0WzWb2IPTNowX0kEE/K1AtCwkRfJSCKgPhSPHZmxjbGQQKKErJmY3zI4nrrqT9fLnBnaFQGLLYwa
	Mg/wBTjQj6PeaWE8pAjPmlz5LbgksRJyFChWirNCBKU9wDgGWGG4kQ2Y5YeHooZ9wLihx6t1Cs89i
	YjT8soiTpcsZwhhD96Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKasV-006KoS-MK; Wed, 25 Jan 2023 08:11:31 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKas5-006Kg0-88; Wed, 25 Jan 2023 08:11:09 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30P8As6I011847;
	Wed, 25 Jan 2023 02:10:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674634254;
	bh=eNbchGJC+m7Z4S8cdQhmzaRMkS8co3zGkOBT6wpgpHk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j7gB/YsZlksX1b4LpewIFD5sKJil4cqsuQtgAiuJkS29kXj67YzEKnfLj+gEuVefd
	 tpNf+27cln3H9Mvu+IH8mRrwlIGgBNWT4Ydbap5Fu03gL1UL+QZ2uHAstWTbCyTLZZ
	 qeFjZX3mZXLkD6VNnSexFwvKxtMTiL7W63uV0vJY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30P8AsLI124978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 02:10:54 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 02:10:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 02:10:53 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30P8Aqag075469;
	Wed, 25 Jan 2023 02:10:53 -0600
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
Subject: [PATCH v2 1/4] spi: cadence-quadspi: Reset CMD_CTRL Reg on cmd r/w completion
Date: Wed, 25 Jan 2023 13:40:20 +0530
Message-ID: <20230125081023.1573712-2-d-gole@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125081023.1573712-1-d-gole@ti.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001105_463710_16D43929 
X-CRM114-Status: GOOD (  11.36  )
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

If one leaves the CQSPI_REG_CMDCTRL in an unclean state this may cause
issues in future command reads. This issue came to light when some flash
reads in STIG mode were coming back dirty.

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 676313e1bdad..6030da942c6e 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -549,6 +549,9 @@ static int cqspi_command_read(struct cqspi_flash_pdata *f_pdata,
 		memcpy(rxbuf, &reg, read_len);
 	}

+	/* Reset CMD_CTRL Reg once command read completes */
+	writel(0, reg_base + CQSPI_REG_CMDCTRL);
+
 	return 0;
 }

@@ -613,7 +616,12 @@ static int cqspi_command_write(struct cqspi_flash_pdata *f_pdata,
 		}
 	}

-	return cqspi_exec_flash_cmd(cqspi, reg);
+	ret = cqspi_exec_flash_cmd(cqspi, reg);
+
+	/* Reset CMD_CTRL Reg once command write completes */
+	writel(0, reg_base + CQSPI_REG_CMDCTRL);
+
+	return ret;
 }

 static int cqspi_read_setup(struct cqspi_flash_pdata *f_pdata,
--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
