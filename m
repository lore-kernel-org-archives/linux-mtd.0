Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D918DC282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 14:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2FC020844
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 14:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CVOr494J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="Zqqz5UQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2FC020844
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dDFzfkRdsMr/o3F1joj2D1m5d68yTzE1/PgAinOhGuI=; b=CVOr494JKygANJ
	/gYabaPe27F1Go19i79PXnnWxqrVIisvcp5Q9bIgiKAy4sJVVhRnxRwqTixz0A+5sUQeCIPW9pTbe
	YEIiIkGYIS94plUB9NMfU6Iy/gpMFDc3bXdSWB+t/l4JMaJhTBo1rPTjtCz19mfLd5vplXNHyhSDa
	jwpTFvT9Bz9SrIC5gbEoeLWvA69xI3UQXxRbtk4ySGdyY22nkqSDOJBXUd9xb04XSXF+NN2veyUbW
	V4xpg+RJ0YnXS/pypGFXZiuOFlir7zyyC0bd8L+RWAoFBFZ6djpQL0TMcJxMAUaNayGvA44gWQtM7
	kXI9iI9JD01pheWErxuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs74P-0004wt-AE; Fri, 08 Feb 2019 14:23:57 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs74M-0004wI-1F
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 14:23:55 +0000
Received: from mail.micron.com (bowex17b.micron.com [137.201.21.210])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x18ENZFj016223;
 Fri, 8 Feb 2019 07:23:35 -0700
Received: from bowex36a.micron.com (137.201.85.222) by bowex17b.micron.com
 (137.201.21.210) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 8 Feb
 2019 07:23:34 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36a.micron.com (137.201.85.222) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Fri, 8 Feb 2019 07:23:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK/f4+UW+Ikhcnl0D33gyGn8/ILoLHKl0OiHSw09uvQ=;
 b=Zqqz5UQtWPeBo4v6YpsXEFFc74XO7vvdmCH8DEXuR7qa72Pd2EJ9vjsJ9mt77Z8TXWKtDFMxuufbSglqsAiNl2PsHspPCiZw/haVEvahFEhMYdqKjhMNW1ofgkjlFycxTQtGxc0OowpD7HhiuHNxBwBGGfDlx30Fmf82CE0HALM=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB5143.namprd08.prod.outlook.com (20.177.125.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Fri, 8 Feb 2019 14:23:33 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669%3]) with mapi id 15.20.1601.016; Fri, 8 Feb 2019
 14:23:33 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Topic: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Index: AdS/uVD1jG3UvCBSRuC2oJ8LRRcc4g==
Date: Fri, 8 Feb 2019 14:23:33 +0000
Message-ID: <BYAPR08MB4533C8EA6B775C7514FA7F82DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB5143;
 6:RP2YyMUDqfhb+9yhokj/mZ2ZKFk0uubEutOU8O1PD/HmiZkYrjS/J7mBbpuNoBFRbgpRI/eBQuSkKKPgNFmDgNE1ORP4Xi41Q3/H2NJc00KD8ximVR8oqrrsdcuYaavmSYsRUhWOvLPBDI99mFWmRgU+dXusyzOwX49IzbSRuc+XmO7DDHASwAGndzjvVwDrfIj9u5Sevyf/5SLqp9vjhAYjjG9v8wkZhC1BECJPZAX0N2yigWojD2+230D23V2Iuz78qShvC1qNniQVYokmFMjnExUkbw2bR1wAfz6Rm6BvoKzv6Y6BWaiR+6CPHld2OFE+/3NbszXgq+74c62PJaFm/Vla5jS6Do4MRuypLp8R54ni+c8Br76h50dwQaLRbs+tK+fUCXdXEGnCQ55KYkIlxWPDQ36W8Eyd34SjX9SLSqGeCllDpoTROlyNBMnYjPJd7xs1djtr7fDaSfzxkA==;
 5:dc7Ijwvxt7fwCbyTfq4iYZyAblojBLMWIuePSPIBLy+nv99rgmHdjH95JdNij1jv3+l4aN+s1J+o3nOSuhKCsf0olo4ZjRi8RabBRw8p+cST6jcRmDYPlhQ8AYbz/nFPvXD77F9HqIWcGOjE9LnDT5tte/M7O/cO+N6HyRDaTHU3luG95tRp3KBBQP3QQL8L0HPrcDwgNkQEF6qH4Inf0g==;
 7:xsUcSu5ujIVByo7W0duJWTL+G1IXoEhw5YnskvAbSOnt5KyqHb7bJVDulU5N+4D9df1u4M+Li9Zqfa+f7HhI6zAxALZNJswFa2yBIwZz2y7SJAJHPMks4uwFBQjRkmF0QqiFOUSTKqgiy6HwtzYd8w==
x-ms-office365-filtering-correlation-id: ece274b2-e5d3-4202-79b6-08d68dd1016e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB5143; 
x-ms-traffictypediagnostic: BYAPR08MB5143:|BYAPR08MB5143:
x-microsoft-antispam-prvs: <BYAPR08MB514315233C2662670C905E5DDB690@BYAPR08MB5143.namprd08.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(366004)(136003)(39860400002)(199004)(189003)(4326008)(486006)(2201001)(476003)(86362001)(102836004)(54906003)(55236004)(8936002)(14454004)(106356001)(25786009)(3846002)(105586002)(66066001)(6116002)(81166006)(316002)(81156014)(97736004)(74316002)(9686003)(6436002)(7696005)(110136005)(6506007)(99286004)(186003)(26005)(68736007)(55016002)(8676002)(4744005)(53936002)(14444005)(256004)(71190400001)(71200400001)(107886003)(478600001)(305945005)(7736002)(33656002)(2501003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB5143;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tsYKyieYwBxAZD1gwr6ntV812qXlGviv/Jgi/F2vPs6USn5GPHoXsTCXfz8VgGjQE9uhy5HMP4eA+5vwMhefFo5oW6bAgsXhT3IHAhu2QLMA9NRD/j6zD+EyWEJb+mCR7yDdezWjyNPl5D/02IHIozddNX8Y3Qle7cSdV5+remSEO1FwU85g0eVrqloR3kp2UpHwIZinJo5WDYAc8keeUzYMgK7SKwgJNe45POP9QPOlPhAtY4+0DgaBS25r75SUNjO8GWWQQrMfVsSmHcKOVt/SntiKJD+MrS6nHF/tMyTohKJXRAvjanjtojNvjXq5lQ+eswpx+5Zk378Lxx53maTmSWcQfjSlKqPJQEhuP7c9ydrb0m1KGDj2ZflvZxMQJQiWZN5cZd5K82xV1CeHCCAFerbgKlqJslPj4DPtc4s=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ece274b2-e5d3-4202-79b6-08d68dd1016e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 14:23:33.0642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5143
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24416.005
X-TM-AS-Result: No-1.129200-0.000000-31
X-TM-AS-MatchedID: 701236-851106-700648-700270-188019-148004-148007-148020-1
 48050-10019-41000-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_062354_176214_F79849FD 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Bean Huo
 \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Change SNOR_HWCPAS_READ_OCTAL to SNOR_HWCAPS_READ_OCTAL.

Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 include/linux/mtd/spi-nor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 2353af8..b3d360b 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -487,7 +487,7 @@ struct spi_nor_hwcaps {
 #define SNOR_HWCAPS_READ_4_4_4		BIT(9)
 #define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
 
-#define SNOR_HWCPAS_READ_OCTAL		GENMASK(14, 11)
+#define SNOR_HWCAPS_READ_OCTAL		GENMASK(14, 11)
 #define SNOR_HWCAPS_READ_1_1_8		BIT(11)
 #define SNOR_HWCAPS_READ_1_8_8		BIT(12)
 #define SNOR_HWCAPS_READ_8_8_8		BIT(13)
-- 
2.7.4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
