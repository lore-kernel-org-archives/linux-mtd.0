Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF556C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD3121872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:21:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vo7qiLHN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="UyYeilFc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD3121872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XisO1w+AbhbSXyld9NHd476BpieVryFWYj7ARfew81k=; b=Vo7qiLHNSH4lwa
	18p7c/O+oYafwej9eaBunZ2cwqMjMn5Iou9/6eTikW7h87k3Sht2Q1mrol7IN5HUJ9ernP7gJQB00
	OFP1ZxTS9AZQEK7tKWrjRGEUDsJWgloew+8Qe9DhvnVEAq3LMP0Xm3Uf5erv7v/Lx93zPPf+S9Ffy
	V3gKXzMqTUfRXkvkQE99zude/dYsTQZa/hAqvHXin1NS55Z9MVQ6zhM0oubGwj7UW8bSk1H3xYsHk
	F6xQalmw9yZRqfwuO87fMIDNLH9kwg2kHP8zJHtcgUu1j3GbfbtY9nEJO5CvKNaio7/YgmzK02dKJ
	qXuT734FBU9jawybG24w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmd4H-0006d2-UW; Thu, 24 Jan 2019 11:21:09 +0000
Received: from mail-eopbgr50139.outbound.protection.outlook.com
 ([40.107.5.139] helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmd4E-0006cY-UX
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 11:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D0+bG2cW/wCbDt8Nz0+wnutqJh2/TefNixGjKQOag4=;
 b=UyYeilFcZEvdo64JbKtx3GCa6jNYEmkFc4og2D1s2wNYN+lN/A8cT2biZWcOJdtCzskmrYzu+z2IbbiL/Z4vX7s0yf3bTX1oKcLj9s4m4BzH9PYrbMfYov6HzK6RRjwdG0LPHGSVEsiylwt6wbIyfsURxANPJaKMaVT1fom/Y3A=
Received: from DB6PR0701MB2998.eurprd07.prod.outlook.com (10.168.84.136) by
 DB6PR0701MB2984.eurprd07.prod.outlook.com (10.168.84.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.6; Thu, 24 Jan 2019 11:21:04 +0000
Received: from DB6PR0701MB2998.eurprd07.prod.outlook.com
 ([fe80::2843:5379:602c:d03]) by DB6PR0701MB2998.eurprd07.prod.outlook.com
 ([fe80::2843:5379:602c:d03%6]) with mapi id 15.20.1580.007; Thu, 24 Jan 2019
 11:21:04 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
Thread-Index: AQHUs9bk77RvlSJjREa6El1S6pHNPw==
Date: Thu, 24 Jan 2019 11:21:03 +0000
Message-ID: <20190124112014.20167-3-alexander.sverdlin@nokia.com>
References: <20190124112014.20167-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190124112014.20167-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.2.12]
x-mailer: git-send-email 2.19.2
x-clientproxiedby: HE1PR05CA0141.eurprd05.prod.outlook.com
 (2603:10a6:7:28::28) To DB6PR0701MB2998.eurprd07.prod.outlook.com
 (2603:10a6:4:73::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0701MB2984;
 6:kgIMa1tn6eDjRqs37CqxUP946PxtDoSOh3UBW+DunQvOll6Nh+HWyhVLAcagLaLksf1GwAlAtPxUhlD02JBt9waJOfK05zQPAJLYvtSF/E33p1fdFF0cWLow7iHfEPiHcGIM7oDTGYJXE0W6ixZprj0BhpoHpplOc6brDAGfx6eYdY1gSflgjh9sS8ZTGahYvcMVM8IVJkPH2IzGp2mJYyks8eKpwazgbtfJ5Ot4AUcJ/jdvrts8b6AMlzIx+bjlIF7MAAp66rqplXXfMoN8qs7758FuqtdW0AzuI5MX1aI6k5GaQAe23fIWVot1akDpVB0t/c2BLY44dIAwnHM6Mcxx0adKZrf+b9CaPDLjDdVwjguORnUe3VUU7+wVglN2yUGwPP3uEFAuaSwUx1kK3IqBcvMZSCP+d8HB66DJlmNEgC7/x+TtTpYIoY1FMzWyBvOsRldWv/gP/evq1LAv9g==;
 5:yi7lqCO6fmmm5aIUea4rIIKgCh+sy5NMcohPBo+RZ3f2QVTLNZtfPOUpnY2lRBXOSmOmSmZYTuIlX+B8gIHmKoQmmVO54gn8lAmjcbuKbtBfZs2LkfrqkmtQrjC0pZtMupgbDjR9QixS9/pr3TRT/bn7UtY5ws3YON17F8VZxxUD11Feh9usA0JBsJRwqb327IGxedj5tnuJO1pI0ThrEQ==;
 7:M/tZsSTl7btRk6h7HEg7kKSS107zPYdLv/WvJ4+6gpQOv978kN7KQSubUmIZ/gqMsXrInt5C1draEp6C+qoguGPoXh7+2pzHExpY/xBTJZaPe5Qax7nFtkjJ4+4PmJBFToxG5EoidpMOvublp8ffCw==
x-ms-office365-filtering-correlation-id: 92654740-71a7-4976-b01f-08d681ee06bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0701MB2984; 
x-ms-traffictypediagnostic: DB6PR0701MB2984:
x-microsoft-antispam-prvs: <DB6PR0701MB2984DC575211494DCB0AE12E889A0@DB6PR0701MB2984.eurprd07.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(6916009)(14444005)(50226002)(105586002)(8936002)(256004)(81166006)(81156014)(8676002)(66066001)(36756003)(68736007)(86362001)(97736004)(25786009)(39060400002)(53936002)(4326008)(2906002)(5640700003)(14454004)(2351001)(6486002)(106356001)(6436002)(478600001)(6116002)(3846002)(7736002)(305945005)(1076003)(99286004)(2501003)(102836004)(54906003)(486006)(186003)(6506007)(386003)(446003)(316002)(26005)(11346002)(71200400001)(2616005)(476003)(76176011)(52116002)(71190400001)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0701MB2984;
 H:DB6PR0701MB2998.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jWTINFfnDb1M4wNSo1XKFPzN3g9xI45C0ByGtLA2MXlCwJjTXFdOhhFpu3YuYiGPOhR9T7Ja/ZQHSfRbVWyMOD/QaGVxQY2zGUEEvjw0RNamVSx23pONauuh3G0Tsvl6W92AqAM3IZaER2GvgwRlGOxl6T8j52uS04RWg+i0xkeC1aNqt0FRTM6j4UtXc1k106X8XtMnYiA7/ejnzHhj2NGXZfkiY8x5vLbN5tKsTQ5lm+7ViuxcMMWtM+yFJZhm5/vD/mQK+t8XdN/u7fXCMtaXtfkU97URIFdeCx7f3H+3CFxXyfuafbhY2c5lugmZe8Y/Rcc0/+fqitKHA2syVcHwp/mOQckaMfxOX4MJ9gSRUyYCKbbI59+NH3tnFQihJSb4PEJ+6yUzebTqwO6B7wV5R4SBJpd3NfyV7jb11+4=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92654740-71a7-4976-b01f-08d681ee06bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 11:21:02.3219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_032106_980961_5AD41BF6 
X-CRM114-Status: GOOD (  15.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>, "Sverdlin,
 Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Optimize erase time by always using biggest erase size for given erase
request. Do it by removing "sector"-at-a-time erase code.
spi_nor_erase_multi_sectors() seems to be mature enough to handle all
the cases better.

For the above to work backwards-compatible regarding 4-bytes commands
spi_nor_set_4byte_opcodes() has to prepare them always, independent of
spi_nor_has_uniform_erase() flag.

Remainder check in spi_nor_erase() becomes superfluous because
spi_nor_erase_multi_sectors() performs it anyway.

The trigger for this change was n25q128a13: enabling SECT_4K increased
erase time of 128k block from 1.763s to 11.335s.

Fixes: 4607777c71 ("mtd: spi-nor: add subsector flag to n25q128a")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 46 ++++++-----------------------------
 1 file changed, 7 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c3598f0571cc..a25324a52eae 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -434,6 +434,10 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 {
+	struct spi_nor_erase_map *map = &nor->erase_map;
+	struct spi_nor_erase_type *erase;
+	int i;
+
 	/* Do some manufacturer fixups first */
 	switch (JEDEC_MFR(nor->info)) {
 	case SNOR_MFR_SPANSION:
@@ -450,16 +454,9 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
 
-	if (!spi_nor_has_uniform_erase(nor)) {
-		struct spi_nor_erase_map *map = &nor->erase_map;
-		struct spi_nor_erase_type *erase;
-		int i;
-
-		for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
-			erase = &map->erase_type[i];
-			erase->opcode =
-				spi_nor_convert_3to4_erase(erase->opcode);
-		}
+	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
+		erase = &map->erase_type[i];
+		erase->opcode = spi_nor_convert_3to4_erase(erase->opcode);
 	}
 }
 
@@ -978,18 +975,11 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	u32 addr, len;
-	uint32_t rem;
 	int ret;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
 			(long long)instr->len);
 
-	if (spi_nor_has_uniform_erase(nor)) {
-		div_u64_rem(instr->len, mtd->erasesize, &rem);
-		if (rem)
-			return -EINVAL;
-	}
-
 	addr = instr->addr;
 	len = instr->len;
 
@@ -1021,28 +1011,6 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		if (ret)
 			goto erase_err;
 
-	/* REVISIT in some cases we could speed up erasing large regions
-	 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
-	 * to use "small sector erase", but that's not always optimal.
-	 */
-
-	/* "sector"-at-a-time erase */
-	} else if (spi_nor_has_uniform_erase(nor)) {
-		while (len) {
-			write_enable(nor);
-
-			ret = spi_nor_erase_sector(nor, addr);
-			if (ret)
-				goto erase_err;
-
-			addr += mtd->erasesize;
-			len -= mtd->erasesize;
-
-			ret = spi_nor_wait_till_ready(nor);
-			if (ret)
-				goto erase_err;
-		}
-
 	/* erase multiple sectors */
 	} else {
 		ret = spi_nor_erase_multi_sectors(nor, addr, len);
-- 
2.19.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
