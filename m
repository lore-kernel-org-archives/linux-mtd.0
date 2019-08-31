Return-Path: <SRS0=VSS2=W3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A812C3A59F
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 05:50:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B512343A
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 05:50:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fb5Iqx5z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fortanix.onmicrosoft.com header.i=@fortanix.onmicrosoft.com header.b="ojbolD2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09B512343A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fortanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PCHTQx+B/qBdwEPay5IcP+BCuEbE4R5/slzUUNUlejE=; b=fb5Iqx5z6xXIBF
	5/2oG/P0JMv63VSKwGtgn3sS3gBGu9ihpdXEeZaiYgBHj5g/XWKcdMByZa49xZjF3xf0Mr7q3q5Ny
	QcYBuV0Oxmv/FVFXHWw/85mry29PjvSmVvI1FCGny757nM28ufsUZynsTJAm5QLxlsMlRsWbFRLo7
	P4YSkqXkrboQqrNebsmEDCfs1423xzBiBlQnInk8aATlBiMFQYJQnWuk9AjA674zOrVNB1rR1zR1/
	kPpZnOx/RqVMAFNTAzNvuvlbkcl0ziQJ1lzttYYDykSxd4Xw7u/lgQTlXsfFoctHVmlxhFP9h5Mpi
	7gGfmMP7coTZsX5MFwsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3wH0-0002Oz-GZ; Sat, 31 Aug 2019 05:50:06 +0000
Received: from mail-eopbgr760111.outbound.protection.outlook.com
 ([40.107.76.111] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3wGv-0001u5-An
 for linux-mtd@lists.infradead.org; Sat, 31 Aug 2019 05:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDXqQlpUaM2c52QAkgdaM26nxElG1KhepOYlIJrzZmLRqteLnr71O3yZ5hcKMho18ikquQc8do59oTb/7/RyCxbI9MdxNN/Qj6pN1y6Eyw6IALo7cWM+B/Igh5Ap15SDEBC+7Ww2gTFkpxhwmhR5XvDwSwCk9d7X5on1tSb0vCbfmnUDYltJhvIoCkvcZVxPedr/LB2aI1+VFoMNp3sf3sqRbtrIyVvNMAuYAV4WFmgbY6LHtzyWgk3aoldXsZNtnK8ptIqexL9KlvSk2C87+PQFzgrPiMacarQWvjwfPiiba7QKwwSIWIWPzqkUkji1dCQPFwhe226kXMUaqzijGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLFLpxUPfX1v0zDKfPb4hIKOLPutjcFK4izP5QDSkUY=;
 b=cf90VDZBFiv81tBOtHWLWfUpI2Av1abFC6L/ZUzEJojPfW5q22TBsAeA5WVznsjvybeOwpPnnVsR0pcHIIVAHOuH45o+Ohu2FVnmSty2sc+F3dluuCGPpNBT5lqaLHDr9NbK7o+frKtoTzuqhDRSlzUb8JLTDZ9y+WdKL+i+zgUK7bPWC/GhS2YlfpAIRiJgvRI7ly+7au/WJIrTpD6tGnGBWAFAHTZ1rs4bnaZLf4TiHVKSwFlqxWwVie1Zx+7aZbt3zVaMubX9/mwTqUk4v6nzoyzhRg0dWSV+l/4eKxN+EvpEGMwAoioWL+3GoHzMl3viAAczhBZEr+6+Hzsbog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fortanix.com; dmarc=pass action=none header.from=fortanix.com;
 dkim=pass header.d=fortanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fortanix.onmicrosoft.com; s=selector2-fortanix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLFLpxUPfX1v0zDKfPb4hIKOLPutjcFK4izP5QDSkUY=;
 b=ojbolD2fHRdUFKoapqzt+FipgNAjABMBHwRoltna+OH8MjtfKLSr+rB4GT6+w0GciwNRKac+oKD3uiWufomCs25gbzVGSwkmbaVg72y5vVKuDP5rJ/405dTEI1VSo4N8JGVITXeE2e9a5JOzLVsToriQS+d/aezxk81yf8ZzH3k=
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (10.173.174.144) by
 DM5PR1101MB2283.namprd11.prod.outlook.com (10.174.104.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Sat, 31 Aug 2019 05:49:56 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::101c:56a0:673b:6410]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::101c:56a0:673b:6410%6]) with mapi id 15.20.2199.021; Sat, 31 Aug 2019
 05:49:55 +0000
From: Jethro Beekman <jethro@fortanix.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] mtd: spi-nor: intel-spi: support chips without software
 sequencer
Thread-Topic: [PATCH 1/2] mtd: spi-nor: intel-spi: support chips without
 software sequencer
Thread-Index: AQHVX7/qHs3WRrvKbU6lbjtIdYhFxw==
Date: Sat, 31 Aug 2019 05:49:55 +0000
Message-ID: <b4538dc6-4d48-1ec9-fe4f-586fbc93c1d1@fortanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To DM5PR1101MB2348.namprd11.prod.outlook.com
 (2603:10b6:3:a8::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jethro@fortanix.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [76.236.28.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e0a2ce7-e18c-479e-1d8e-08d72dd70ceb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR1101MB2283; 
x-ms-traffictypediagnostic: DM5PR1101MB2283:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB22839C64BA8FCCB66749C359AABC0@DM5PR1101MB2283.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 014617085B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(39830400003)(396003)(346002)(189003)(199004)(6436002)(31696002)(7736002)(86362001)(99286004)(6486002)(2201001)(5660300002)(81166006)(66556008)(14454004)(71190400001)(14444005)(64756008)(66476007)(486006)(476003)(478600001)(26005)(71200400001)(52116002)(66946007)(256004)(66446008)(81156014)(3846002)(31686004)(36756003)(8676002)(2501003)(316002)(6512007)(386003)(2616005)(25786009)(4326008)(186003)(107886003)(66066001)(53936002)(305945005)(102836004)(8936002)(110136005)(6506007)(6116002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1101MB2283;
 H:DM5PR1101MB2348.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fortanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4dOsDDk3gJCw+iYAZit0Xv2Xxe7TYp5kZt6DODEQbgJBJVWmH5FKEV6thlQ8x/Zeq1iqbLhSYV+6CGKyQ5pi25CrxVF9nXoWDwxx5Sx8FydsneLm8i/iLjB/c8yJ3m4gBzEYYXvz0+20UD6MXgfc97ocZuS03iEx+rk8FaFod/u4zeR7Hf7IsCAwDr4+0bHMVks/FX1h2lL/D20ycU5s+oOW04ktF54H/YxsGk9BldnuEK+Vputm9fMs+1rzdF6yAIjFEEKH7UtMrKXt3Vbbz9OsnzuVaamfIs1WvEvsCSARQrVteE+xx+Y0v8Uc8wcEkqNdPXgkfGy2MYmwkifQuENULaz9BnjFR8P9hNExS2BD6ICht8GWZXUcnPMBQNvJPwTgwm8/8PMC2e84DnGQGB8+ss8N/1CkOAX4irZam58=
Content-ID: <E4E40AF52D22464AB42401EC2AC8FA02@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fortanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0a2ce7-e18c-479e-1d8e-08d72dd70ceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 05:49:55.7786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de7becae-4883-43e8-82c7-7dbdbb988ae6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: czaPSsYww3VV8yaWbW/wvP5QpfIc5vwEiXvNwmNPspz/ZCt7xuFZe+IP/EE3oflykr8byUo4cqhBjenjlCRVaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_225001_543288_73017FA7 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: Jethro Beekman <jethro@fortanix.com>
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

diff --git a/drivers/mtd/spi-nor/intel-spi.c 
b/drivers/mtd/spi-nor/intel-spi.c
index 1ccf23f..195cdca 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -187,12 +187,16 @@ static void intel_spi_dump_regs(struct intel_spi 
*ispi)
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
