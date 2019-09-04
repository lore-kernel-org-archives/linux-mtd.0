Return-Path: <SRS0=xWtm=W7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3391FC3A5A2
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2019 01:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033A221883
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2019 01:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZ1QxSSt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fortanix.onmicrosoft.com header.i=@fortanix.onmicrosoft.com header.b="GWbaQC2P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 033A221883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fortanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+0lcogUokczeaQn7t/iidUXroHakFVFfjr7XGciueOo=; b=FZ1QxSStow+O/P
	pmA/Tb0627yLwy05+R0gayxhn+BTmINz1RetE6VKwZRKE1rmGNX6+mzt5qv6k5pJ1x2BT5SytlS+B
	0l+XWwPjsO3CV21udIHlRJO6KwRsxZULbWm70KscjI+527VY5R6EJli0jhM/6WS5bPMIMWu8Snzuu
	EP38hgqauiznTRtMs9fW4PfZGLOgnZFX6Ehh+kSEayLzbjGdfVIfVBUxpMdC2jvVm72ovtXTMl7Ac
	AMVNjuOeAHjyY8FfRnG/JLC1Yq1YlDHXHWg8WqoO9+5ksXupRtTYJEAV/89JSVP3OO5E0fsW9blEw
	a/Rik1IXTpwRcKb8uVtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5JtL-0006Ao-2X; Wed, 04 Sep 2019 01:15:23 +0000
Received: from mail-eopbgr730117.outbound.protection.outlook.com
 ([40.107.73.117] helo=NAM05-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5JtH-00066R-1S
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2019 01:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrNrVnWoEfVYulP33+2Z2QJbPZanE4J9VtCZfJYw/tvJYRa4pjmvBuTPighmeEj3Lab+RvyIjpqu37NBEZoaCnXn9ba3FA5LQZI2islVRnMScBgsu+AAaopUTAEEp5fueW31uw5oakryzAoZ5GDmxyDlLt73ry1W77YNr43sh7OZvC50tIBU5vqUQGZV+FZzgJSIu7WMohjUlb+gD3t6KRj8mjdFY1LzXJv1djNMkhSCihGhyYEJS/34FlI/rfbnqXcFl6Zi1G61clO74/NTVenf6u6GFZboA0ubmIHdw6lejuV1VZ7pYM+0XGnVkQKWaI5cLS7RdA2mohUlXbH3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhKbxrDv6pV6/jwfpDgjDpy7SHr7ReNflj8QLRj8dVw=;
 b=ldjE4JCuuaQHiY40fzbpF9OjEHnPWSLeLEZqq89ux4wiEYSILPnWa1qK70IKLnllidl79U9qnvLwrDcIlu/Mo7ZgxufyoN/xA6OFJ9Q0uNKbLTw8AYY3PwqUzSHF3QKOYXJZVY6f5X0sppjr7eNp+pYz61POU9S7OyeFtRZQwSPSauMtbX7UxeavA2lDARC/fHE36pJp5zYFMIxDtWeEDx3LtGnQn5zg2TmjVPGLQnipJn/GSv6GdGV77ZaD8v3HbvGZIcTQD9T6gvCdje9xjH4jk78nEpZ1ND+WyLCTMhi6B+friyEffG7c+01PMKocTat2xn5IcIb0FVbIpLlapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fortanix.com; dmarc=pass action=none header.from=fortanix.com;
 dkim=pass header.d=fortanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fortanix.onmicrosoft.com; s=selector2-fortanix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhKbxrDv6pV6/jwfpDgjDpy7SHr7ReNflj8QLRj8dVw=;
 b=GWbaQC2PPace5wjJYswmK/K7T6ZZFefhgU1D67INBypX2qnOI5IEBAutyA2pFFTf+CoAJzW3Ne/xzjB9x08Hf0gb88mYBMfkNox++56ctPwUK/6Ue/NZtNnajcPEoFT/2TlWleQOuCnYlRwtXLLRRjiU/3I4bg3a7Lpfg24HcjQ=
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (10.173.174.144) by
 DM5PR1101MB2089.namprd11.prod.outlook.com (10.174.106.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 4 Sep 2019 01:15:14 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::798a:dabe:a59f:bb42]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::798a:dabe:a59f:bb42%6]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 01:15:14 +0000
From: Jethro Beekman <jethro@fortanix.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] mtd: spi-nor: intel-spi: support chips without
 software sequencer
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: intel-spi: support chips without
 software sequencer
Thread-Index: AQHVYr406/tKUl7vTUifobCqeM8uGQ==
Date: Wed, 4 Sep 2019 01:15:14 +0000
Message-ID: <69f4a8e8-7889-8b00-0adc-7faaef6b42e4@fortanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:180::41) To DM5PR1101MB2348.namprd11.prod.outlook.com
 (2603:10b6:3:a8::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jethro@fortanix.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [67.207.107.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20173c8f-6e26-4374-98e3-08d730d55744
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR1101MB2089; 
x-ms-traffictypediagnostic: DM5PR1101MB2089:
x-microsoft-antispam-prvs: <DM5PR1101MB20899118D78C5F542EDD0F47AAB80@DM5PR1101MB2089.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(396003)(346002)(39840400004)(136003)(189003)(199004)(7736002)(25786009)(3846002)(14454004)(2906002)(6486002)(52116002)(5660300002)(6116002)(81166006)(81156014)(31696002)(8676002)(2201001)(508600001)(99286004)(86362001)(6436002)(8936002)(305945005)(316002)(66066001)(36756003)(31686004)(110136005)(386003)(71190400001)(6506007)(71200400001)(6512007)(66476007)(66556008)(64756008)(66446008)(14444005)(102836004)(66946007)(53936002)(476003)(2616005)(486006)(256004)(2501003)(186003)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1101MB2089;
 H:DM5PR1101MB2348.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fortanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qZLVY0xfUD9f189842mhNpmYXXlUj9X0qM8lbizMhbgacndDimgV8CIX3Q7fel33dzek/x+47tID1ReKrdx2opy9JkRahPi7pvPaZemklmYEZYtGWoAJaLiPvtR4OldB0WqcDw5Oq/pDYa4Mio76/nfRRTgZulUit7E6owENznD4/Mfygwcg3vjX2u4mJoE5o35rG7Cm3Z+ZS8Y0EqWL1aC9a4NJ0rD7g7qQGEE+sAQgjJcPqPcPPePnc+DygMfwY8eLsbqI/qAbPhZ4sDsSvUumWDmRgsnH8NUh0BKnA5z4Bhp4SjFEFK4d1pqwtChPlP4LWnEZkZ2vKj3yRnKYVVBUkK1V5yWjAZCFPe+45CLWjJliARgQHINq21b6z+9rS8muVfVmN5zXO4eN+Cqx8x/f7eWbLlDpejJ9r0Q1KL8=
x-ms-exchange-transport-forked: True
Content-ID: <D3AF020196A94B4680232C1E34DD1D1F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fortanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20173c8f-6e26-4374-98e3-08d730d55744
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 01:15:14.8444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de7becae-4883-43e8-82c7-7dbdbb988ae6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wp+6ATFyTT4ptWBVrTHBRSY+NR9TFPAhMkw8UGgjaENOFoV5FTlgQKThX+h0ZDrdiOcrKtlZ23ZxOIWMzxOsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_181519_101581_FB58245C 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Some flash controllers don't have a software sequencer. Avoid
configuring the register addresses for it, and double check
everywhere that its not accidentally trying to be used.

Every use of `sregs` is now guarded by a check of `sregs` or
`swseq_reg`. The check might be done in the calling function.

Signed-off-by: Jethro Beekman <jethro@fortanix.com>
---
 drivers/mtd/spi-nor/intel-spi.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 1ccf23f..195cdca 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -187,12 +187,16 @@ static void intel_spi_dump_regs(struct intel_spi *ispi)
 		dev_dbg(ispi->dev, "PR(%d)=0x%08x\n", i,
 			readl(ispi->pregs + PR(i)));
 
-	value = readl(ispi->sregs + SSFSTS_CTL);
-	dev_dbg(ispi->dev, "SSFSTS_CTL=0x%08x\n", value);
-	dev_dbg(ispi->dev, "PREOP_OPTYPE=0x%08x\n",
-		readl(ispi->sregs + PREOP_OPTYPE));
-	dev_dbg(ispi->dev, "OPMENU0=0x%08x\n", readl(ispi->sregs + OPMENU0));
-	dev_dbg(ispi->dev, "OPMENU1=0x%08x\n", readl(ispi->sregs + OPMENU1));
+	if (ispi->sregs) {
+		value = readl(ispi->sregs + SSFSTS_CTL);
+		dev_dbg(ispi->dev, "SSFSTS_CTL=0x%08x\n", value);
+		dev_dbg(ispi->dev, "PREOP_OPTYPE=0x%08x\n",
+			readl(ispi->sregs + PREOP_OPTYPE));
+		dev_dbg(ispi->dev, "OPMENU0=0x%08x\n",
+			readl(ispi->sregs + OPMENU0));
+		dev_dbg(ispi->dev, "OPMENU1=0x%08x\n",
+			readl(ispi->sregs + OPMENU1));
+	}
 
 	if (ispi->info->type == INTEL_SPI_BYT)
 		dev_dbg(ispi->dev, "BCR=0x%08x\n", readl(ispi->base + BYT_BCR));
@@ -367,6 +371,11 @@ static int intel_spi_init(struct intel_spi *ispi)
 		    !(uvscc & ERASE_64K_OPCODE_MASK))
 			ispi->erase_64k = false;
 
+	if (ispi->sregs == NULL && (ispi->swseq_reg || ispi->swseq_erase)) {
+		dev_err(ispi->dev, "software sequencer not supported, but required\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Some controllers can only do basic operations using hardware
 	 * sequencer. All other operations are supposed to be carried out
@@ -383,7 +392,7 @@ static int intel_spi_init(struct intel_spi *ispi)
 	val = readl(ispi->base + HSFSTS_CTL);
 	ispi->locked = !!(val & HSFSTS_CTL_FLOCKDN);
 
-	if (ispi->locked) {
+	if (ispi->locked && ispi->sregs) {
 		/*
 		 * BIOS programs allowed opcodes and then locks down the
 		 * register. So read back what opcodes it decided to support.
-- 
2.7.4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
