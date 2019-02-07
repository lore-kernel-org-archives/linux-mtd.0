Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CF4C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 13:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B42F021904
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 13:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MdqQMcTA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="NnmF8yOe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B42F021904
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vjzBVf5/4p5Dzp/VfVZLVuhaXfIyN4dWSKdMssQX4wU=; b=MdqQMcTAEHk7b7
	HavoFd80wdeY+waHiyfsT4raGSa4SZtCCWSbBoPHsjt+Z4eTXZl0quFQgjHeacmT+oIHv0t0aRY0v
	qnXiio4hgRmV3Nzm+xKAhlr9D19N21jHcjAlUceyojVu17NZIR6xnOAx+DkaNixCqaBPSyn1xxkfK
	bQ7RLKflixgcIbrvQwJqQ87Uy3hs6pR6IGR1KxXwSxgM/WIikDz/sUJB4Bhy0kiQxCbgGXFQLkp15
	qcF4oDTNIJtV1ki/xdDZ7R0FlAUez4d93RUcx0+/Q/uRMzyOEkPRcYZhKS/NauejuL4WV4y4c4xiy
	OgVfktgH3kvX1FZJJrvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grk1K-00012l-Hp; Thu, 07 Feb 2019 13:47:14 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grk1H-00012Q-9L
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 13:47:13 +0000
Received: from mail.micron.com (bowex36e.micron.com [137.201.85.221])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x17Dkx25014161;
 Thu, 7 Feb 2019 06:46:59 -0700
Received: from bowex36c.micron.com (137.201.84.132) by bowex36e.micron.com
 (137.201.85.221) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Thu, 7 Feb
 2019 06:46:59 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36c.micron.com (137.201.84.132) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Thu, 7 Feb 2019 06:46:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAWyCd0cMSln7+lnyydmu4bIsrCKilRn6ko3tZAnhvo=;
 b=NnmF8yOehvjX009FSXmia4Ny2Tz6Qonri8wsn+c4DH458VIRQE781bi2YxIMf/FZ3sxccwupO5U1ytzJC4OYqwWXpQFWc6sCMKLqIRfGKEH87uIWY4pGRlGMifum88cc2ELX9xK7EAAhCUzSWCoypMbIalE1paG/Dtf3Pm6gM9s=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB4485.namprd08.prod.outlook.com (52.135.211.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.19; Thu, 7 Feb 2019 13:46:50 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669%3]) with mapi id 15.20.1601.016; Thu, 7 Feb 2019
 13:46:50 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, "richard@nod.at" <richard@nod.at>
Subject: [PATCH] include: mtd: spi-nor: change HWCPAS to HWCAPS
Thread-Topic: [PATCH] include: mtd: spi-nor: change HWCPAS to HWCAPS
Thread-Index: AdS+60iqy/bLyT9iSLSC+lMdoEdfvQ==
Date: Thu, 7 Feb 2019 13:46:50 +0000
Message-ID: <BYAPR08MB45338B3B9FE13B8FB3070789DB680@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB4485;
 6:mc41s+06gceymlNjCwuMaQmKkq9IFwmMOl9FOMxcRmq5PsgLHheqd1SSBQVknxH9jlNe1HByT4Tbx4mLgFHeRPFrODOdyNZ24DzVw90WTEkfHaXaPNlzBrWNim2R1FLgLAMFVM4Nih/C3Z6QDzd9Yo8GtMHM/coiQQvk2NhzPSLVsDpUHjTJvrd3YzA87CsLqPFrB9r2jbl1kaPAgUnQCSzcB7iHELk27rK4P7LAK/5uFj7IL01xhYkewgIEZLzyZxPhhjq5FcFLv+ycyjFbr3mHuUARJZhJnwCX3CfC54Ia1KAFXfqb6vaVMPbNP72xzHlEbT+WquMjFgGGUrhH2TbSAv4UDdA1zUfMhYkG2BLq8WT0/O4Opp2QQclM4T1c59JV9VYc3G7lzUVRXl1abar/YNfd0A1T1xQPEBfyZtrqTyXoiA1AZ+81TvoQ62OGv2/YG5Z+Szfh+mq56JHfjA==;
 5:AFBhH5FQucR2kBTSbjCaJxB4XNi4JG5OmbPdyXPsFb/+3mzNJ/pCvNiRcUjO2jTzf7+T1uKvcIys9N4+oWOo3NFCd6TL75AIqYqWNGLl5lhk8fjrSZdUWmqgc5zJ6mP+f7UeEr/0dwl2oz23NdTM2SeF+LR1atKc5m1iVQLAkFHRFW4EiQtRYgoSkF4zc7QkMo3hPGldUhvTDuhVotPFgg==;
 7:JyFcYdjl0bQVGdeWpCn7xxmCz+D7uLS3P5bxXxEu05Dn5NrDgwlbpJCphcgwgZN4wssViZjZdhYZnPldw4EUJG9CJgbkIisABXkxPBquzU8HosBiql99/ENkz5W6rTW5daxW7sEalVzL+aHPOs+H/A==
x-ms-office365-filtering-correlation-id: cbc6f329-81e5-40ec-3e3b-08d68d02b614
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB4485; 
x-ms-traffictypediagnostic: BYAPR08MB4485:|BYAPR08MB4485:
x-microsoft-antispam-prvs: <BYAPR08MB4485C0A7F938DA0763D27431DB680@BYAPR08MB4485.namprd08.prod.outlook.com>
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(366004)(376002)(39860400002)(189003)(199004)(55016002)(6116002)(3846002)(71190400001)(71200400001)(478600001)(8676002)(305945005)(6436002)(106356001)(7736002)(74316002)(33656002)(9686003)(81166006)(81156014)(2501003)(105586002)(8936002)(486006)(476003)(25786009)(68736007)(14454004)(316002)(4744005)(99286004)(14444005)(256004)(102836004)(4326008)(55236004)(6506007)(53936002)(110136005)(54906003)(26005)(186003)(97736004)(7696005)(2906002)(86362001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB4485;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3tgMawTyqOOeuYROa4Lh6HIf9yhdOmLsWx72hTOgtBxB5/+6J5yfIBtowDHYhmslKGvB9n1foP3uDtBSuYDqznNvdxopZvOxYdUo0Fl7bAkiKLQOMVJzKL7qv5DedyxU4iOeYnAM51TNZPxDQ2pkOjp+smPoInmS+KD4FUIGyG2lmBDnrO2kDCa/g0eVzagOT+aaepcQzZaGaZok9gnQWY8bDqfvrfXi6z46Qv1S6CFT9scwvD3cA+lnbbqtCr4ZaHDJgLeXX1mdgJBMMtnz26iDIhEtMeDdPx7P2MbS54akv2/RNR1nzMpUbaI2R+Io8Ize3uld+VphW9/56z/ZHlf4nEbM+CsVoSlpRKZN627y6D6WbyPDj16son6z9z2Tr1RiDOG6dEBAvcR3i/6w4HjzxvNQZ/hirubUpH0sTRc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc6f329-81e5-40ec-3e3b-08d68d02b614
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2019 13:46:50.1683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4485
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24414.005
X-TM-AS-Result: No-1.739200-0.000000-31
X-TM-AS-MatchedID: 703283-701236-851106-700648-700270-188019-148004-148007-1
 48020-148050-10019-41000-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_054711_440797_CC72940C 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Maybe this is wrong abbreviation, change from HWCPAS to HWCAPS.

Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 include/linux/mtd/spi-nor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index fa2d89e..5e12bf9 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -479,7 +479,7 @@ struct spi_nor_hwcaps {
 #define SNOR_HWCAPS_READ_4_4_4		BIT(9)
 #define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
 
-#define SNOR_HWCPAS_READ_OCTO		GENMASK(14, 11)
+#define SNOR_HWCAPS_READ_OCTO		GENMASK(14, 11)
 #define SNOR_HWCAPS_READ_1_1_8		BIT(11)
 #define SNOR_HWCAPS_READ_1_8_8		BIT(12)
 #define SNOR_HWCAPS_READ_8_8_8		BIT(13)
-- 
2.7.4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
