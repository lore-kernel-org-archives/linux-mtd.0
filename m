Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D048BC282CC
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:34:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD3B20863
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l0X7RBEU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="trzhEdCt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD3B20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XJ8ClNvqjIA0HJq0FkdgHnAnmkuQ6+hdIf6Iy5cQWFg=; b=l0X7RBEUdbShsK
	KKpDqixUZp9mXCdEAz/Dez6MhrTxb0WqivY3U+qMU/AR4mmxnCKnyQ+nVmaLW8z9dfetJv1Z84/Je
	SwzrfMXjoZC9IMBEKIKpctejNp9wv/cO/3jtIvT5498CYvm06WQ7f84Q89Eg/k7VjDNU3eY00qonR
	nrgYiRjty1PRhIuWYrzGiMykMkTKzX2gK6cTx/h/J0IxboNmGxdNBRvuITP35sidam8IpBPLpB2Tb
	5nT/wpmzcOjtGoI4MuyD/vxekSfYwgZ9bvQouO4p3VTTL8uXuKuARmQ7K22Hw5DBObwx0KAgG/d6i
	ndA0jSLVSrItp25e+/dA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsAz0-0006k0-OS; Fri, 08 Feb 2019 18:34:38 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsAyx-0006jE-EW
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 18:34:36 +0000
Received: from mail.micron.com (bowex36a.micron.com [137.201.85.222])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x18IYYZb004735;
 Fri, 8 Feb 2019 11:34:34 -0700
Received: from bowex17d.micron.com (137.201.21.212) by bowex36a.micron.com
 (137.201.85.222) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 8 Feb
 2019 11:34:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (137.201.20.7) by
 bowex17d.micron.com (137.201.21.212) with Microsoft SMTP Server
 (TLS) id
 15.0.1365.1 via Frontend Transport; Fri, 8 Feb 2019 11:34:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYUqHwYOg39fJkjzFVt8rYZp4S2azcfYyUWOOOZr32g=;
 b=trzhEdCt4eg/DSgK9Pwlup8sVA45B6OHH7PSGz7p4Xqx0LuKmVr4ybcfhq4gN/MPwNZiFoqFXWEL8+cnbsqJIYGFnDCsDoMzSf26XdG0U1EExdwWILVhegbuAeeheo46DzG17HpJ4lpqZcONP9mMhj/NTN8ruF1DWu1vmUDzMOM=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB6104.namprd08.prod.outlook.com (20.178.52.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.20; Fri, 8 Feb 2019 18:34:32 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669%3]) with mapi id 15.20.1601.016; Fri, 8 Feb 2019
 18:34:32 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Topic: [RESEND PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Index: AdS/3OnQZjj8XegeT+KSU6BShrHJ9Q==
Date: Fri, 8 Feb 2019 18:34:31 +0000
Message-ID: <BYAPR08MB4533F6B01EF90FC66BFB5C87DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB6104;
 6:gztZPuTWN53QtFFBQvQ0AxgmjtQLeGKlpTC9YdLkpRbs6YozczN6Y/ykqKfglwGeA3x62Yh55LJ9JF7+Zwbg2wHJ/wpqftOuNIkCPJ+mw1vqqr0Lq9KMKlTwqPWh08IeYqqp3+Ane1Ydw5lOvOL8rYfksTiKya92joKapAZk2wbxWx08x6DO84Gc/CoT/6Y58s2Ur1tP6nGiwMjg/x4mL1P8reR2+7N+GGI+sXYAt+rHHLA8HpP5UjndE/12YgUnSWMWWVeOGJdCimY6wnBXv0ub1FR5lqLoGMxl0PvKjs3iM7CEskGFVuW/lVBe84zG6czz+MRVf+HKjkHhqr50k2bxZlOZE3hJZRzCpCdMj0TYAKZY9sy8/fzoAO/mllVrmJ2Wsu076weHwog22LdHxDFIhQXF1QV0nmUotPIjLRS83KwNotfhxyo0tF0AbHxI+b/kaVX0e6odWaRkexx3TQ==;
 5:0kOOFbxSmHqqTxUgT/TqJdrNAenAmdUzNqLcb0bY6dvJEAHyY5RvYlD12TYF8tj8PtANfGbNU7/ayUas19IMgLmql+pIuG58EyWKasWyGyhRE4t2OHZDyWuH51c/l5e8LY+urXqWF0LrfsRvSb3HWdla8AlMwm+Lvsl6/Cf+4PPcgHETCs0PMf/2X+yxmxtXXTgiclypyFCWCT+ajZuXKg==;
 7:FbQJ5kCByaFzrp7NB4Mo7Gh5G4VZsEHXFZzVUaPI1az7g16EO3VztQEv3IznICpyHEq7jiyMEN7l57D6wY2QcYCMoC2lxKhzcgA1HY5SWKW3JGUX+nKUWruSToHGmkEaF1oxQ2+QJBHwpF8mU0RHag==
x-ms-office365-filtering-correlation-id: 2df24423-0095-41bb-be92-08d68df4113f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB6104; 
x-ms-traffictypediagnostic: BYAPR08MB6104:|BYAPR08MB6104:
x-microsoft-antispam-prvs: <BYAPR08MB6104B84837332375336A2B5ADB690@BYAPR08MB6104.namprd08.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(396003)(39860400002)(136003)(366004)(346002)(376002)(189003)(199004)(71200400001)(6436002)(26005)(86362001)(2201001)(4744005)(99286004)(217873002)(7696005)(8936002)(55016002)(66066001)(476003)(25786009)(14444005)(316002)(53936002)(9686003)(97736004)(71190400001)(110136005)(256004)(68736007)(3846002)(478600001)(6506007)(6116002)(2501003)(102836004)(2906002)(81156014)(74316002)(7736002)(106356001)(305945005)(81166006)(486006)(186003)(8676002)(33656002)(105586002)(14454004)(55236004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB6104;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5KJ3Jk+Mzgb7s9cJ+trH8/aJlqSfYt7HD5KlNRN64YZosKB4lFf4e3iuPrM/wPEsTPMl/MJp3AKJMhv5sJ8QBqdIcSoV5qTv6XQwtLmZWX+bl+qoiXDo6gZ99RHCGa9uTNi1d4W9ST1TPzLjuY9IFWnnqbsXo55Q4M1IhFfk6scuvpchW9c7J31HxvVlZPDdufD3SFXcTp4wCBd7LqcX2aNQE7mmEGV580oIlL9SaeT7IQZ7Ygbu+K2T/ckBab8VwCHN6GlxvkuoNtYVZ2R7neAb5bDc4LbkjmkU774F0jsYcxAW/7/QkaSNH5E2TUyO/FVNMQ2+PcT4AqpwKg9LAdPkcMZzWVXL4RN1M4VxopEgy/EJ3R+8rsUIdkcA5IhdWAGsuo+2KCGvZEDICKeZVpb/vKUWX+fLkY7i+5zUcOY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df24423-0095-41bb-be92-08d68df4113f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 18:34:31.8789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB6104
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24416.005
X-TM-AS-Result: No-1.129200-0.000000-31
X-TM-AS-MatchedID: 851106-701236-700648-700270-188019-148004-148007-148020-1
 48050-10019-41000-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.82.98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_103435_607220_2D653C26 
X-CRM114-Status: UNSURE (   6.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bean Huo <beanhuo@micron.com>

Change SNOR_HWCPAS_READ_OCTAL to SNOR_HWCAPS_READ_OCTAL.

Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 include/linux/mtd/spi-nor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h index 2353af8..b3d360b 100644
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
