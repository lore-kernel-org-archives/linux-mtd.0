Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D517C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 16:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D6D601FC
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 16:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26D6D601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=s1ls35/SMMERZfpGdgUsb9Bc97q7MnsBjZilbxcyghw=; b=HOVw+mEj+iRfHL2N4JMwGKqk/T
	E3BfI0feqwXH1F09Bh04Jhh19cILZyfiLx9wblAp8r0uXuOz5dBNai7gK5uenmi4+P2htt18lUXh+
	60CN16m8UO76ozf8f2BWgbW9ElXMRawZSOlCfYiAVQzq/APSPReNhRS23aWdHL/J8KyMmFklt2oy9
	CTxrhI2BSdvmiSJ1n3QqkKsANIFRt+lWXfKW7IFe1QdqghkRtQLTpuf4aC8WY9MDhNGg+f2hC5rcd
	Sl44mnPCm/nKR5hmXJggIWFxO3b/8+eQsrmFEWKDUHAYZrfgU5zXn1d6ROrvNxsFjmN7FIXiW5Ezb
	8z7i0LAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5t0F-00Db1b-8N; Tue, 20 Jul 2021 16:53:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5t0B-00Db1G-5h
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 16:53:53 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16KGrdTq019628;
 Tue, 20 Jul 2021 11:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626800019;
 bh=TaK7R0mjL5/VT6dRFfVDZ/pEHiudlKEld0G5KlWnQpQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CePaMeb07/3Pp4cD+wPZvikEZyTFfkTwlQAAV5KfEA3ZdvuDpZeKuQoDoOmc+5TCA
 VFWPvmMdStLbcJBnLp+/xEKBrq0d0Tfuje/ytHhxhIsqQZ7vto8nnyKX/Mm3rXH133
 uK5QM0MGSjxDluYSkKypPxhyxyVr21nmjEsQeJlw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16KGrdNT068883
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Jul 2021 11:53:39 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 20
 Jul 2021 11:53:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 20 Jul 2021 11:53:39 -0500
Received: from [10.250.234.142] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16KGrYBT028752;
 Tue, 20 Jul 2021 11:53:35 -0500
Subject: Re: [PATCH 00/13] mtd: spinand: Add Octal DTR SPI (8D-8D-8D) mode
 support
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
From: "Nandan, Apurva" <a-nandan@ti.com>
Message-ID: <b10bbb90-2bc6-90dd-f82a-a2c62b5dfa99@ti.com>
Date: Tue, 20 Jul 2021 22:23:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_095351_409165_88840475 
X-CRM114-Status: GOOD (  15.85  )
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


On 13-Jul-21 6:35 PM, Apurva Nandan wrote:
> Hi,
> This series proposes patches for adding the following functionality
> in SPI NAND core:
> 
> - Octal DTR SPI (8D-8D-8D) mode support
> 
> - Winbond W35N01JW SPI NAND chip support
> 
> - Power-on-Reset instruction support
> 
> This series has been tested on TI J721e EVM with the Winbond W35N01JW
> flash with following test utilities:
> 
> - nandtest
>   Test log: https://textbin.net/raw/fhypoz63f9
> 
> - mtd_stresstest
>   Test log: https://textbin.net/raw/0xqjmqntj7
> 
> - UBIFS LTP stress test (NAND_XL_STRESS_DD_RW_UBIFS).
>   Test log: https://textbin.net/raw/pyokws7wku
> 
> Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf
> 
> Apurva Nandan (13):
>   spi: spi-mem: Add DTR templates for cmd, address, dummy and data phase
>   mtd: spinand: Add enum spinand_proto to indicate current SPI IO mode
>   mtd: spinand: Setup spi_mem_op for the SPI IO protocol using reg_proto
>   mtd: spinand: Fix odd byte addr and data phase in read/write reg op
>     and write VCR op for Octal DTR mode
>   mtd: spinand: Add adjust_op() in manufacturer_ops to modify the ops
>     for manufacturer specific changes
>   mtd: spinand: Add macros for Octal DTR page read and write operations
>   mtd: spinand: Allow enabling Octal DTR mode in the core
>   mtd: spinand: Reject 8D-8D-8D op_templates if octal_dtr_enale() is
>     missing in manufacturer_op
>   mtd: spinand: Add support for write volatile configuration register op
>   mtd: spinand: Add octal_dtr_enable() for Winbond manufacturer_ops
>   mtd: spinand: Add support for Power-on-Reset (PoR) instruction
>   mtd: spinand: Perform Power-on-Reset when runtime_pm suspend is issued
>   mtd: spinand: Add support for Winbond W35N01JW SPI NAND flash
> 
>  drivers/mtd/nand/spi/core.c    | 196 +++++++++++++++++++++++++++++++--
>  drivers/mtd/nand/spi/winbond.c | 186 +++++++++++++++++++++++++++++--
>  include/linux/mtd/spinand.h    |  67 +++++++++++
>  include/linux/spi/spi-mem.h    |  87 ++++++++++-----
>  4 files changed, 494 insertions(+), 42 deletions(-)
> 

Hi,
Can anyone please provide some comments/suggestions/reviews?

Thanks,
Apurva Nandan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
