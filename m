Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D421C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:57:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD5E20835
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EXjtWWsN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="ncRVJygg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD5E20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJFWVaqHBVsBagt89ng8o7jM1dwOxqdClMLMmYWB+Hs=; b=EXjtWWsNN3iVZg
	biXZlgNsgf1HGBxXg3LAOQzmEv5pWMZZLGBUKz6fYHTmQkH7NBdweSf4/UaHeXoDzRLp/OvB6EHMw
	wRflMD217w6P36CoMij66DSXHT4J4KSByivxrcwtMOWk7t1EBnxy3pqwaGeVq/srdLOwfDqITt0wP
	5MlaZdj1t944PbZ1ObxHF1Aw7cW+M31apSOrDhijCHqUmFPDw0HmV+mI+xcMSddzdEBwybNVpdqLv
	Mt5r/Sh1yw9TNnatl643LwvK3K018jqN0XliaP2k7yAtWElSEfR004+4XdxbP21H8FrEYZGyAsjIr
	omT6AwlgagpUsow3Ca+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6I39-0003Xy-7Q; Tue, 19 Mar 2019 16:57:15 +0000
Received: from mail-eopbgr10116.outbound.protection.outlook.com
 ([40.107.1.116] helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6I37-0003X3-GX
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUm+FxnoCoCi+Rv6kRgeaICAmbfj5y4/Go/PSZ6pc2s=;
 b=ncRVJyggq/iqn5LdK505Ec3b1oiMrSzDnB1iKmDBA0X3wQCdNq/tLsd1Ag6A0FkXMv2V7EkbsT8gnyAcpv+n8UDSYpgFshdRsEQIx7C2FICVAVI0SW/JXGahB9il5KhHAjcNSG2pncO8q4LvhloSkG+DQsrWmpe5Oxjl5FG4WHs=
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com (20.177.198.83) by
 AM6PR07MB4968.eurprd07.prod.outlook.com (20.177.197.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.16; Tue, 19 Mar 2019 16:57:10 +0000
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996]) by AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996%3]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 16:57:10 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] spi-nor: Drop uniform erase
Thread-Topic: [PATCH 0/2] spi-nor: Drop uniform erase
Thread-Index: AQHU3nTL14Wj96/hoUqmo8zrXxkXbg==
Date: Tue, 19 Mar 2019 16:57:10 +0000
Message-ID: <20190319165651.23695-1-alexander.sverdlin@nokia.com>
References: <8875821d-feaa-6a7d-d9d2-d992be9cd235@microchip.com>
In-Reply-To: <8875821d-feaa-6a7d-d9d2-d992be9cd235@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.180]
x-mailer: git-send-email 2.20.1
x-clientproxiedby: HE1PR09CA0066.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::34) To AM6PR07MB5221.eurprd07.prod.outlook.com
 (2603:10a6:20b:6a::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb4bf71b-cda7-4770-554c-08d6ac8bed74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR07MB4968; 
x-ms-traffictypediagnostic: AM6PR07MB4968:
x-microsoft-antispam-prvs: <AM6PR07MB49683DEBBF041C657647507388400@AM6PR07MB4968.eurprd07.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(366004)(396003)(376002)(199004)(189003)(4744005)(11346002)(71200400001)(446003)(6506007)(386003)(102836004)(186003)(71190400001)(26005)(76176011)(2616005)(305945005)(476003)(7736002)(97736004)(1076003)(52116002)(486006)(6486002)(6436002)(14454004)(50226002)(86362001)(8936002)(25786009)(36756003)(2501003)(81166006)(6916009)(68736007)(54906003)(316002)(81156014)(8676002)(5660300002)(99286004)(6512007)(66066001)(53936002)(2906002)(256004)(6116002)(3846002)(5640700003)(4326008)(2351001)(478600001)(106356001)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB4968;
 H:AM6PR07MB5221.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4cy3KF8JQOGPO881IUIiJytx5wr7qm2/dNGiLpArq9x03XuwRz86wT1PrbgQiG8EskofVX2dybl966RLdC7d7HFKPpBHVybcoILUUabAhF7bf2ik863mLLnQwX50s/VBepJ3TMN/ufD+U00rdKBDAtkf6KndKdmIO4dZiyPc/9q6OuE+tmooaXbD4Fa4m9be7+ccfJkigXg1E0syLx8qv7IVAEqEI3RbnYLzdDkWwsv2vcbTu4DPqtR+1NSWbZAAFgmME7lI1u5gk+dPqwbNdSxSTgtqK74MalB+WVB7U/D/VFS7gS0faOgMqPXTn8rYsevpyRsrj+55yRBde4M1dVvSvcE/TI6xOHBH553eHwI2YcA93THxnFElF4SAQzkRdCqut7546SwLBlxPEY2s+S9GE23Y8vk4y60tqC8qZhc=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4bf71b-cda7-4770-554c-08d6ac8bed74
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 16:57:10.6241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_095713_563304_6D0519C0 
X-CRM114-Status: GOOD (  10.07  )
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

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

A series which initially started as n25q128a13 erase time regression
analysis but ended up in removing uniform erase completely.

It has been tested on the following name/ID combinations:

n25q128a13:
JEDEC ID 20 ba 18 10 00 00
JEDEC ID 20 ba 18 10 40 00
JEDEC ID 20 ba 18 10 44 00

n25q128a11:
JEDEC ID 20 bb 18 10 44 00

s25fl129p1:
JEDEC ID 01 20 18 4d 01 81

Alexander Sverdlin (2):
  mtd: spi-nor: Fix comment of spi_nor_find_best_erase_type()
  mtd: spi-nor: Always use biggest erase size

 drivers/mtd/spi-nor/spi-nor.c | 48 ++++++-----------------------------
 1 file changed, 8 insertions(+), 40 deletions(-)

-- 
2.19.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
