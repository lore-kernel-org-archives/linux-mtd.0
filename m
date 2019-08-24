Return-Path: <SRS0=t4Dz=WU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064E0C3A59E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCCFD2146E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EskTUgIy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="vGee2pko"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCCFD2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDRNbueunaQ9L/sUVS2MF0+q0RZ9mJYIpJ61Jt8E1w0=; b=EskTUgIywFVlLE
	sT1X6RM3x7caEesA5Y9raKwV8rc7iKkegvm9TpEzH4LZMJJ50iZvaqBg9wGcMXWRSz/zXSKUSVKHT
	HrSc5f/fH5Zes692TcKeZ1D7MT7lwql42E2G89lpvoe8mwfr4HGgwDQTy2H1p/PEA2zuq9wX0bQQF
	Npueb2KGuTLqyAYQ4lqnz+YGt0KbeYywbqmByKUxjzgnqNkypF4jdbOM8nuciSQb32rrMt9clXK1t
	0cGLhaneotB0rXtvnFtJ4PRt5mxl+MdcBvTcYcP3ty6mzUMLkYAgBFbhxcvMcfbaPSpDvN6boTRas
	lEXKrs9iEND3E0DjXHew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1Upv-0005Ev-6S; Sat, 24 Aug 2019 12:08:03 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1UpS-0004cX-VK
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2019 12:07:37 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: kGLBOhwHB+q8WUQf9X1/BabQY6FECaXRxDvvLoJzmaJrlwgRLpzipP11BXayCrgXIUimdKvN7H
 glzFHyaHZHW7VdRAhvrQxspO3Qz1WNl9N7oeXHWYipyb9N54nvz+AflF7QahiryBpkBTusY1E9
 smxO9LVzH9GkTMyd80PqMmur/851pU3myaeqco7JL+bADAWqUIsTgvmNAbIii4jZFVlFtie3yM
 ugKOBllx4sRm3mN+jZ2gmbGCXgaKDWKsbSTHiz+i7IOO8PT5FGtKr1R9zXNKTkZSUZCmqI89sQ
 E7Y=
X-IronPort-AV: E=Sophos;i="5.64,425,1559545200"; d="scan'208";a="46465173"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Aug 2019 05:07:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 24 Aug 2019 05:07:16 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 24 Aug 2019 05:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWgLvsrqJoAuj7U1GhcpmZbWXJ6bCT2rk9TyQGhj18ZOzuv0Gk3jcBlymIB+h9EUpqI0nVeY85fC6oNXyZpxE7PUNBHHPdHUdCI1+qLrYRyu4a5oAcm72jTv6JH6MO0IXOSpI4bmBzr1Ky45lLQltEkkqscKGDgqdPc8HDF35npfCvOaeccopB++zqX7PQbAcgPTzRGlQ2j2JIt76iLyemH7eNjzea8AtxWFEL4AzZvmvyisPF2QssUopnmOy9QCWAy6xHYQUiVA7mxovQxvIrp/cZL6tKM+Ezzy5JNqInmobsgfyjj5j41KK+5wvHZJNlFimW+HN58N0z8UUmNjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW2csDkhyvfZSNtgCVtBlFiacHC2ElN3nK/r3Oz3Op8=;
 b=glGWZN0sYQBlH1VbkXLMiI4dtP33nPrqh9OGR60a7P3WwmqYbo5AOC9idl8AMrokJ+a9Tr0J0JUE0mCoyAKLaM05T908XlgeuEgrLb+3eeamgtakhGOsypLuLZGi+EyDgH4FGoUdHBVfAAjrOdDADse+8Yh/USjgLBsMnSrEb6509wm0JaGdqDoAcM8cFEnwNKWajdcoZiKoSvyKOS0b9xH0lb0Pjy3xQXME7PERPRYhBEmVhREoMqvY2ZqNu2IvC40VTZB7cPbuhbo2BPjNhNnmOOuAQyd6dweh5cCYylmFXqD8JgfaTBrfFGUBzSTnBFfBKdnXBGIykXRHzBUMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW2csDkhyvfZSNtgCVtBlFiacHC2ElN3nK/r3Oz3Op8=;
 b=vGee2pkoI7QlkrDymWZ6VzjOOhx9k9UwR/F5ZA+TPq+WFqfX7ni4vOMn8qTI0rDH5W7UhN5bX/6s8h0i1Z8y4F7iqtMQ4i0O+A+/vxig2xKD8YQZd4rL9pKrv4FGYY7gq7KZj4Yb5rnuJTq4Tc+HwjbihdJrhzS4343YN5W7jPU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4301.namprd11.prod.outlook.com (52.135.36.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 24 Aug 2019 12:07:14 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 12:07:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/6] mtd: spi_nor: Add a ->setup() method
Thread-Topic: [PATCH v2 4/6] mtd: spi_nor: Add a ->setup() method
Thread-Index: AQHVWnR3ct744tgpCUGSS5llQgSD2w==
Date: Sat, 24 Aug 2019 12:07:14 +0000
Message-ID: <20190824120650.14752-5-tudor.ambarus@microchip.com>
References: <20190824120650.14752-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190824120650.14752-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::37) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3e847b7-6c3e-45f2-2dd0-08d7288b99fe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4301; 
x-ms-traffictypediagnostic: MN2PR11MB4301:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB430129967A20C52F86C4A300F0A70@MN2PR11MB4301.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(305945005)(99286004)(71190400001)(1076003)(71200400001)(7736002)(3846002)(6116002)(30864003)(2501003)(52116002)(76176011)(4326008)(478600001)(2906002)(316002)(14454004)(53936002)(25786009)(110136005)(107886003)(5660300002)(386003)(102836004)(6506007)(6436002)(8676002)(186003)(66946007)(26005)(50226002)(6486002)(36756003)(8936002)(66556008)(64756008)(66446008)(66476007)(486006)(476003)(53946003)(2616005)(6512007)(446003)(81166006)(81156014)(11346002)(2201001)(86362001)(14444005)(256004)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4301;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: htsl904BoRdBNZBoawKoTW56KygBxckz2lAHMQMDFEqebR9bJ2HCX+pQVx5fy7wPTheFu3w1a5KEjOVRcX1iA/+q5Rv1ll/SRDg4u6Ky+RnuSfP6h/uJVNlzsoY7+eOveGQ4N/0SlefACqAIjnAq6O739mKPn5FLzWGFoyG0LX/aFVw9bbqAeoNDc3vXYmeXRnIHggnHR50tqJu7sG5MnV/UC0hYk9ucV+DJfCqFn2qcWyuLYypmakoDrsbfhgBPxvXPn1FNwkjKsxHd3Cs5+7jOy/Nt5J4PX/0FuADjxIrfaB+DJbHGBrQJQG8S/gDPUlzZ6gHy2bbVQztBvtQ/2DkLtfAVip/xQLPDzhZeelIphUd7azAxjhr+MytBYdNvaNockuhU354PEyRr4y2xR8YN4yZZ5IqTibsz2USQSQc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e847b7-6c3e-45f2-2dd0-08d7288b99fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 12:07:14.6730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OCbJCd2gJpxKnUACb0NkkBTpfn4ByuSb1Qj0eA9DOVtrvdlDE3icDYTslxsXxdjpOGIOGjok0FlBrpsAd6DSl+CoEM0HelGo/VN9Qchxhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_050735_202939_4961D79B 
X-CRM114-Status: GOOD (  19.06  )
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
Cc: Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

nor->params.setup() configures the SPI NOR memory. Useful for SPI NOR
flashes that have peculiarities to the SPI NOR standard, e.g.
different opcodes, specific address calculation, page size, etc.
Right now the only user will be the S3AN chips, but other
manufacturers can implement it if needed.

Move spi_nor_setup() related code in order to avoid a forward
declaration to spi_nor_default_setup().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 428 +++++++++++++++++++++---------------------
 include/linux/mtd/spi-nor.h   |   5 +
 2 files changed, 224 insertions(+), 209 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0dc6a683719e..17e6c96f9f9a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4144,6 +4144,224 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	return err;
 }
 
+static int spi_nor_select_read(struct spi_nor *nor,
+			       u32 shared_hwcaps)
+{
+	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
+	const struct spi_nor_read_command *read;
+
+	if (best_match < 0)
+		return -EINVAL;
+
+	cmd = spi_nor_hwcaps_read2cmd(BIT(best_match));
+	if (cmd < 0)
+		return -EINVAL;
+
+	read = &nor->params.reads[cmd];
+	nor->read_opcode = read->opcode;
+	nor->read_proto = read->proto;
+
+	/*
+	 * In the spi-nor framework, we don't need to make the difference
+	 * between mode clock cycles and wait state clock cycles.
+	 * Indeed, the value of the mode clock cycles is used by a QSPI
+	 * flash memory to know whether it should enter or leave its 0-4-4
+	 * (Continuous Read / XIP) mode.
+	 * eXecution In Place is out of the scope of the mtd sub-system.
+	 * Hence we choose to merge both mode and wait state clock cycles
+	 * into the so called dummy clock cycles.
+	 */
+	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
+	return 0;
+}
+
+static int spi_nor_select_pp(struct spi_nor *nor,
+			     u32 shared_hwcaps)
+{
+	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_PP_MASK) - 1;
+	const struct spi_nor_pp_command *pp;
+
+	if (best_match < 0)
+		return -EINVAL;
+
+	cmd = spi_nor_hwcaps_pp2cmd(BIT(best_match));
+	if (cmd < 0)
+		return -EINVAL;
+
+	pp = &nor->params.page_programs[cmd];
+	nor->program_opcode = pp->opcode;
+	nor->write_proto = pp->proto;
+	return 0;
+}
+
+/**
+ * spi_nor_select_uniform_erase() - select optimum uniform erase type
+ * @map:		the erase map of the SPI NOR
+ * @wanted_size:	the erase type size to search for. Contains the value of
+ *			info->sector_size or of the "small sector" size in case
+ *			CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined.
+ *
+ * Once the optimum uniform sector erase command is found, disable all the
+ * other.
+ *
+ * Return: pointer to erase type on success, NULL otherwise.
+ */
+static const struct spi_nor_erase_type *
+spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
+			     const u32 wanted_size)
+{
+	const struct spi_nor_erase_type *tested_erase, *erase = NULL;
+	int i;
+	u8 uniform_erase_type = map->uniform_erase_type;
+
+	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
+		if (!(uniform_erase_type & BIT(i)))
+			continue;
+
+		tested_erase = &map->erase_type[i];
+
+		/*
+		 * If the current erase size is the one, stop here:
+		 * we have found the right uniform Sector Erase command.
+		 */
+		if (tested_erase->size == wanted_size) {
+			erase = tested_erase;
+			break;
+		}
+
+		/*
+		 * Otherwise, the current erase size is still a valid canditate.
+		 * Select the biggest valid candidate.
+		 */
+		if (!erase && tested_erase->size)
+			erase = tested_erase;
+			/* keep iterating to find the wanted_size */
+	}
+
+	if (!erase)
+		return NULL;
+
+	/* Disable all other Sector Erase commands. */
+	map->uniform_erase_type &= ~SNOR_ERASE_TYPE_MASK;
+	map->uniform_erase_type |= BIT(erase - map->erase_type);
+	return erase;
+}
+
+static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
+{
+	struct spi_nor_erase_map *map = &nor->params.erase_map;
+	const struct spi_nor_erase_type *erase = NULL;
+	struct mtd_info *mtd = &nor->mtd;
+	int i;
+
+	/*
+	 * The previous implementation handling Sector Erase commands assumed
+	 * that the SPI flash memory has an uniform layout then used only one
+	 * of the supported erase sizes for all Sector Erase commands.
+	 * So to be backward compatible, the new implementation also tries to
+	 * manage the SPI flash memory as uniform with a single erase sector
+	 * size, when possible.
+	 */
+#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
+	/* prefer "small sector" erase if possible */
+	wanted_size = 4096u;
+#endif
+
+	if (spi_nor_has_uniform_erase(nor)) {
+		erase = spi_nor_select_uniform_erase(map, wanted_size);
+		if (!erase)
+			return -EINVAL;
+		nor->erase_opcode = erase->opcode;
+		mtd->erasesize = erase->size;
+		return 0;
+	}
+
+	/*
+	 * For non-uniform SPI flash memory, set mtd->erasesize to the
+	 * maximum erase sector size. No need to set nor->erase_opcode.
+	 */
+	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
+		if (map->erase_type[i].size) {
+			erase = &map->erase_type[i];
+			break;
+		}
+	}
+
+	if (!erase)
+		return -EINVAL;
+
+	mtd->erasesize = erase->size;
+	return 0;
+}
+
+static int spi_nor_default_setup(struct spi_nor *nor,
+				 const struct spi_nor_hwcaps *hwcaps)
+{
+	struct spi_nor_flash_parameter *params = &nor->params;
+	u32 ignored_mask, shared_mask;
+	int err;
+
+	/*
+	 * Keep only the hardware capabilities supported by both the SPI
+	 * controller and the SPI flash memory.
+	 */
+	shared_mask = hwcaps->mask & params->hwcaps.mask;
+
+	if (nor->spimem) {
+		/*
+		 * When called from spi_nor_probe(), all caps are set and we
+		 * need to discard some of them based on what the SPI
+		 * controller actually supports (using spi_mem_supports_op()).
+		 */
+		spi_nor_spimem_adjust_hwcaps(nor, &shared_mask);
+	} else {
+		/*
+		 * SPI n-n-n protocols are not supported when the SPI
+		 * controller directly implements the spi_nor interface.
+		 * Yet another reason to switch to spi-mem.
+		 */
+		ignored_mask = SNOR_HWCAPS_X_X_X;
+		if (shared_mask & ignored_mask) {
+			dev_dbg(nor->dev,
+				"SPI n-n-n protocols are not supported.\n");
+			shared_mask &= ~ignored_mask;
+		}
+	}
+
+	/* Select the (Fast) Read command. */
+	err = spi_nor_select_read(nor, shared_mask);
+	if (err) {
+		dev_err(nor->dev,
+			"can't select read settings supported by both the SPI controller and memory.\n");
+		return err;
+	}
+
+	/* Select the Page Program command. */
+	err = spi_nor_select_pp(nor, shared_mask);
+	if (err) {
+		dev_err(nor->dev,
+			"can't select write settings supported by both the SPI controller and memory.\n");
+		return err;
+	}
+
+	/* Select the Sector Erase command. */
+	err = spi_nor_select_erase(nor, nor->info->sector_size);
+	if (err)
+		dev_err(nor->dev,
+			"can't select erase settings supported by both the SPI controller and memory.\n");
+
+	return err;
+}
+
+static int spi_nor_setup(struct spi_nor *nor,
+			 const struct spi_nor_hwcaps *hwcaps)
+{
+	if (!nor->params.setup)
+		return 0;
+
+	return nor->params.setup(nor, hwcaps);
+}
+
 static void atmel_set_default_init(struct spi_nor *nor)
 {
 	nor->params.disable_block_protection = spi_nor_clear_sr_bp;
@@ -4247,6 +4465,7 @@ static void spi_nor_legacy_init_params(struct spi_nor *nor)
 	/* Initialize legacy flash parameters and settings. */
 	params->quad_enable = spansion_quad_enable;
 	params->set_4byte = spansion_set_4byte;
+	params->setup = spi_nor_default_setup;
 
 	/* Set SPI NOR sizes. */
 	params->size = (u64)info->sector_size * info->n_sectors;
@@ -4421,215 +4640,6 @@ static void spi_nor_init_params(struct spi_nor *nor)
 	spi_nor_late_init_params(nor);
 }
 
-static int spi_nor_select_read(struct spi_nor *nor,
-			       u32 shared_hwcaps)
-{
-	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
-	const struct spi_nor_read_command *read;
-
-	if (best_match < 0)
-		return -EINVAL;
-
-	cmd = spi_nor_hwcaps_read2cmd(BIT(best_match));
-	if (cmd < 0)
-		return -EINVAL;
-
-	read = &nor->params.reads[cmd];
-	nor->read_opcode = read->opcode;
-	nor->read_proto = read->proto;
-
-	/*
-	 * In the spi-nor framework, we don't need to make the difference
-	 * between mode clock cycles and wait state clock cycles.
-	 * Indeed, the value of the mode clock cycles is used by a QSPI
-	 * flash memory to know whether it should enter or leave its 0-4-4
-	 * (Continuous Read / XIP) mode.
-	 * eXecution In Place is out of the scope of the mtd sub-system.
-	 * Hence we choose to merge both mode and wait state clock cycles
-	 * into the so called dummy clock cycles.
-	 */
-	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
-	return 0;
-}
-
-static int spi_nor_select_pp(struct spi_nor *nor,
-			     u32 shared_hwcaps)
-{
-	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_PP_MASK) - 1;
-	const struct spi_nor_pp_command *pp;
-
-	if (best_match < 0)
-		return -EINVAL;
-
-	cmd = spi_nor_hwcaps_pp2cmd(BIT(best_match));
-	if (cmd < 0)
-		return -EINVAL;
-
-	pp = &nor->params.page_programs[cmd];
-	nor->program_opcode = pp->opcode;
-	nor->write_proto = pp->proto;
-	return 0;
-}
-
-/**
- * spi_nor_select_uniform_erase() - select optimum uniform erase type
- * @map:		the erase map of the SPI NOR
- * @wanted_size:	the erase type size to search for. Contains the value of
- *			info->sector_size or of the "small sector" size in case
- *			CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined.
- *
- * Once the optimum uniform sector erase command is found, disable all the
- * other.
- *
- * Return: pointer to erase type on success, NULL otherwise.
- */
-static const struct spi_nor_erase_type *
-spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
-			     const u32 wanted_size)
-{
-	const struct spi_nor_erase_type *tested_erase, *erase = NULL;
-	int i;
-	u8 uniform_erase_type = map->uniform_erase_type;
-
-	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
-		if (!(uniform_erase_type & BIT(i)))
-			continue;
-
-		tested_erase = &map->erase_type[i];
-
-		/*
-		 * If the current erase size is the one, stop here:
-		 * we have found the right uniform Sector Erase command.
-		 */
-		if (tested_erase->size == wanted_size) {
-			erase = tested_erase;
-			break;
-		}
-
-		/*
-		 * Otherwise, the current erase size is still a valid canditate.
-		 * Select the biggest valid candidate.
-		 */
-		if (!erase && tested_erase->size)
-			erase = tested_erase;
-			/* keep iterating to find the wanted_size */
-	}
-
-	if (!erase)
-		return NULL;
-
-	/* Disable all other Sector Erase commands. */
-	map->uniform_erase_type &= ~SNOR_ERASE_TYPE_MASK;
-	map->uniform_erase_type |= BIT(erase - map->erase_type);
-	return erase;
-}
-
-static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
-{
-	struct spi_nor_erase_map *map = &nor->params.erase_map;
-	const struct spi_nor_erase_type *erase = NULL;
-	struct mtd_info *mtd = &nor->mtd;
-	int i;
-
-	/*
-	 * The previous implementation handling Sector Erase commands assumed
-	 * that the SPI flash memory has an uniform layout then used only one
-	 * of the supported erase sizes for all Sector Erase commands.
-	 * So to be backward compatible, the new implementation also tries to
-	 * manage the SPI flash memory as uniform with a single erase sector
-	 * size, when possible.
-	 */
-#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
-	/* prefer "small sector" erase if possible */
-	wanted_size = 4096u;
-#endif
-
-	if (spi_nor_has_uniform_erase(nor)) {
-		erase = spi_nor_select_uniform_erase(map, wanted_size);
-		if (!erase)
-			return -EINVAL;
-		nor->erase_opcode = erase->opcode;
-		mtd->erasesize = erase->size;
-		return 0;
-	}
-
-	/*
-	 * For non-uniform SPI flash memory, set mtd->erasesize to the
-	 * maximum erase sector size. No need to set nor->erase_opcode.
-	 */
-	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
-		if (map->erase_type[i].size) {
-			erase = &map->erase_type[i];
-			break;
-		}
-	}
-
-	if (!erase)
-		return -EINVAL;
-
-	mtd->erasesize = erase->size;
-	return 0;
-}
-
-static int spi_nor_setup(struct spi_nor *nor,
-			 const struct spi_nor_hwcaps *hwcaps)
-{
-	struct spi_nor_flash_parameter *params = &nor->params;
-	u32 ignored_mask, shared_mask;
-	int err;
-
-	/*
-	 * Keep only the hardware capabilities supported by both the SPI
-	 * controller and the SPI flash memory.
-	 */
-	shared_mask = hwcaps->mask & params->hwcaps.mask;
-
-	if (nor->spimem) {
-		/*
-		 * When called from spi_nor_probe(), all caps are set and we
-		 * need to discard some of them based on what the SPI
-		 * controller actually supports (using spi_mem_supports_op()).
-		 */
-		spi_nor_spimem_adjust_hwcaps(nor, &shared_mask);
-	} else {
-		/*
-		 * SPI n-n-n protocols are not supported when the SPI
-		 * controller directly implements the spi_nor interface.
-		 * Yet another reason to switch to spi-mem.
-		 */
-		ignored_mask = SNOR_HWCAPS_X_X_X;
-		if (shared_mask & ignored_mask) {
-			dev_dbg(nor->dev,
-				"SPI n-n-n protocols are not supported.\n");
-			shared_mask &= ~ignored_mask;
-		}
-	}
-
-	/* Select the (Fast) Read command. */
-	err = spi_nor_select_read(nor, shared_mask);
-	if (err) {
-		dev_err(nor->dev,
-			"can't select read settings supported by both the SPI controller and memory.\n");
-		return err;
-	}
-
-	/* Select the Page Program command. */
-	err = spi_nor_select_pp(nor, shared_mask);
-	if (err) {
-		dev_err(nor->dev,
-			"can't select write settings supported by both the SPI controller and memory.\n");
-		return err;
-	}
-
-	/* Select the Sector Erase command. */
-	err = spi_nor_select_erase(nor, nor->info->sector_size);
-	if (err)
-		dev_err(nor->dev,
-			"can't select erase settings supported by both the SPI controller and memory.\n");
-
-	return err;
-}
-
 /**
  * spi_nor_quad_enable() - enable Quad I/O if needed.
  * @nor:                pointer to a 'struct spi_nor'
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f9f1947f7aeb..4752d08e9a3e 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -498,6 +498,10 @@ struct spi_nor_locking_ops {
  * @convert_addr:	converts an absolute address into something the flash
  *                      will understand. Particularly useful when pagesize is
  *                      not a power-of-2.
+ * @setup:		configures the SPI NOR memory. Useful for SPI NOR
+ *                      flashes that have peculiarities to the SPI NOR standard,
+ *                      e.g. different opcodes, specific address calculation,
+ *                      page size, etc.
  * @disable_block_protection: disables block protection during power-up.
  * @locking_ops:	SPI NOR locking methods.
  */
@@ -514,6 +518,7 @@ struct spi_nor_flash_parameter {
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
+	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
 	int (*disable_block_protection)(struct spi_nor *nor);
 
 	const struct spi_nor_locking_ops *locking_ops;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
