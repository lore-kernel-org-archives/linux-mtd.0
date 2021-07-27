Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE44C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:09:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5B9361163
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5B9361163
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5cEA7Q8kqEJGHyvX+GLH8JsBaOFNGtB7HIk6f4k4cs=; b=y/8oO2Jm5iDUhu
	lVZ6K7PExtnCf5nVPj/Sre+Rrsq5ffARTXgqVll3JivePUtMpOpOGn0uUvOTnjWUxbIT1LkJqxtxD
	efKZr+415ov9Ov02UGsa1SsZ+koU8IUvgTPKi3n+P3wslrYBR9x0KulDRBQs0RorOOmW/8656sgj6
	XwW+qbydCrSM48h8w5m5Pwin4kmWiIcCKANZ7LYfNauKekXfukbix7vwTFwH2KatLnx9Dl7agtvB9
	O8jYia5odhpgcqgedmAMe5PdXnfxetnQHUpSS0sPOqrIx7k/mIs4h80S8V8eoS8rHnkArM6hvSskE
	slmh0vZXOU5cYph27YSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8HCq-00Dkef-FY; Tue, 27 Jul 2021 07:08:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F7p-00DIA3-4T; Tue, 27 Jul 2021 04:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361728; x=1658897728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SzwolEeGEyf9oVitKoVWHbwOtUaC9B7RoDUDxRyncSM=;
 b=rlKWhOZFnwdk2liwM/fwltwflE3Tos+Lfo9dDFjtS6y2z+Y352FatF53
 im6Y2UTKiRH0HK/0a32RljRFeOh8EVSs5WIkgQBIfkqqgLMfg/3iDQVva
 iudxhwimM0uoc30ppx/o6NvmwIIEPtVl2jX66be+hJ1x5KoIVKYf2lKSd
 pEpNhtxITaZqT9gaP8Mde749JHzPEhCau+pz6uVekF8tyzyXuBpOPMq3v
 Puy37oD1PtHng+wCa+796bXSUjDs6P/Sw4tOjgoBYrduaNtLvAqQGKD3b
 VRQzI4kDirDulGzopb6r0Q+59loFXb32IVRxlLj3nYsQmfxz/RrBv4+Tf g==;
IronPort-SDR: 9XNm7nmNa6fpHsh9VcPRvZQ4yZM2IpARhmTgovzXaLol2YVXizopAqpcep/oIfGSOkYq1QpWXB
 OWFtvjkqDY+95OtH6lAz1HrOuOvXYt8004GcmzhIn6jTgSUnI4WJ/gdh6cJS9PbD/VCIMnuZZe
 OcHXZ74pnFCxMpOdKPFRWWVK4WFA02xtu/Ppgch3eOyi5/gXGwBcfrhBeTIeAdlVbIg+VyS+Gr
 OjFAq/rn6sJAVhtMe/bNkyUJe4mexn86Aewqr4bazgaujHFtxuClx/Mz2ZocuKoDQaP+m+EmUk
 7VDAdOzx+xdpwVroAN5FNTlB
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="123560057"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:55:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:55:27 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:55:22 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 35/35] docs: mtd: spi-nor: Add details about how to propose
 a new flash addition
Date: Tue, 27 Jul 2021 07:52:22 +0300
Message-ID: <20210727045222.905056-36-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215529_322250_EE34DE22 
X-CRM114-Status: GOOD (  27.02  )
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

Add some guideliness on how to propose a new flash addition.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 Documentation/driver-api/mtd/spi-nor.rst | 65 ++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 4a3adca417fd..ffb8d97a2766 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -66,3 +66,68 @@ when you want to write a new driver for a SPI NOR controller.
 Another API is spi_nor_restore(), this is used to restore the status of SPI
 flash chip such as addressing mode. Call it whenever detach the driver from
 device or reboot the system.
+
+Part IV - How to propose a new flash addition?
+----------------------------------------------
+
+First we have to clarify where the new flash_info entry will reside. Typically
+each manufacturer have their own driver and the new flash will be placed in that
+specific manufacturer driver. There are cases however, where special care has to
+be taken. In case of flash ID collisions between different manufacturers, the
+place to add the new flash is in the manuf-id-collisions.c driver. ID collisions
+between flashes of the same manufacturer should be handled in their own
+manufacturer driver, macronix being an example. There will be a single
+flash_info entry for all the ID collisions of the same ID.
+
+manuf-id-collisions.c is the place to add new flash additions where the
+manufacturer is ignorant enough to not implement the ID continuation scheme
+that is described in the JEP106 JEDEC Standard. One has to dump its flash ID and
+compare it with the flash's manufacturer identification code that is defined in
+the JEP106 JEDEC Standard. If the manufacturer ID is defined in bank two or
+higher and the manufacturer does not implement the ID continuation scheme, then
+it is likely that the flash ID will collide with a manufacturer from bank one or
+with other manufacturer from other bank that does not implement the ID
+continuation scheme as well.
+
+flash_info entries will be added in a first come, first served manner. If there
+are ID collisions, differentiation between flashes will be done at runtime if
+possible. Where runtime differentiation is not possible, new compatibles will be
+introduced, but this will be done as a last resort.
+
+New flash additions that support the SFDP standard should be declared using
+SPI_NOR_PARSE_SFDP. Support that can be discovered when parsing SFDP should not
+be duplicated by explicit flags at flash declaration. All the SFDP flash
+parameters and settings will be discovered when parsing SFDP. There are
+flash_info flags that indicate support that is not SFDP discoverable. These
+flags initialize non SFDP support in the spi_nor_nonsfdp_flags_init() method.
+SPI_NOR_PARSE_SFDP is usually followed by other flash_info flags from the
+aforementioned function. Sometimes manufacturers wrongly define some fields in
+the SFDP tables. If that's the case, SFDP data can be amended with the fixups()
+hooks. It is not common, but if the SFDP tables are entirely wrong, and it does
+not worth the hassle to tweak the SFDP parameters by using the fixups hooks, or
+if the flash does not define the SFDP tables at all, then one can statically
+init the flash with the SPI_NOR_SKIP_SFDP flag and specify the rest of the flash
+capabilities with the flash info flags.
+
+With time we want to convert all flashes to either use SPI_NOR_PARSE_SFDP or
+SPI_NOR_SKIP_SFDP and stop triggering the SFDP parsing with the
+SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. There are flashes that support QUAD
+mode but do not support the RDSFDP command, we should avoid issuing unsupported
+commands to flashes where possible. It is unlikely that RDSFDP will cause any
+problems, but still, it's better to avoid it. There are cases however of flash
+ID collisions between flashes that define the SFDP tables and flashes that don't
+(again, macronix). We usually differentiate between the two by issuing the
+RDSFDP command. In such a case one has to declare the SPI_NOR_PARSE_SFDP
+together with all the relevant flags from spi_nor_nonsfdp_flags_init() for the
+SFDP compatible flash, but should also declare the relevant flags that are used
+in the spi_nor_info_init_params() method in order to init support that can't be
+discovered via SFDP for the non-SFDP compatible flash.
+
+Every new flash addition that define the SFDP tables, should hexdump its SFDP
+tables in the patch's comment section below the --- line, so that we can
+reference it in case of ID collisions.
+
+Every flash_info flag declared should be tested. Typically one uses the
+mtd-utils and does an erase, verify erase, write, read back and compare test.
+Locking and other flags that are declared in the flash_info entry and used in
+the spi_nor_nonsfdp_flags_init() should be tested as well.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
