Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9B5C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 13:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E602B27C75
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 13:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B3NAtVpo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oanVQ1DV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="bEaNcS4R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E602B27C75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yKV+nCiov2oqT+P7C3eBQSFI7BKULdt2MpEdi3wM7X0=; b=B3NAtVpo4R9VMm
	UzYtJlmWmg0zbAagU8K0SKRS3oG0vDqZ6lbRPkl4QziQpN+N9C3WLfyo4W5SMD0bZrCVoqk0atFkA
	GTAJA1exDBrio7d1bTjG+OkpjtwJOxvUKIIlPHHoQXJ2MHEhypc1GhrQgT7xrTwSjTSR+mhrSkRuZ
	yeFdy/R1utHw+SYpg0r1izmHfcb4f7erN9Vmpx2Hhb7YEYM4jDsLK59MDd8OGfX6mcJSr9Lp68NUL
	U7EAYclJjNtSRrK4Pm9H2HaY99rC0rwa3C9vChc7J50oJqaA/QZxDoM7xFMLvtd7LHXthnzXV6Dm0
	a1ZucXgtdIheM3zXCL+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXnKU-0005GU-9n; Mon, 03 Jun 2019 13:48:50 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXnKR-00059d-1C
 for linux-mtd@bombadil.infradead.org; Mon, 03 Jun 2019 13:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jDI9X7fwjzc5oPf8aBzUA2Q5zcmT50zy8AWNrXSJAuc=; b=oanVQ1DV1RUxJmV+lNiDwl/KWU
 zQpzdERfU8HZO6SxvrfX1+WqgbDE80aJnLgb2nmstRNByZjl3R/m12A0PqUlnQa98x+OeB1SNWLBC
 4HiACvCQbZYnAjqQsgZ0ylvrM8kd3gTg2ikpYJcqddPsNgoCAh75rOnplW8bfNFshY2AO6YFgll6v
 q/EXzjqeJ2zy8Qd92QX/0M/92wwjdfuyrxeGoFI923fyIzb5+GtN7n3ri15ui1bhYgZJv656J6/4l
 X4/+l2jAJHgo/Rtq5TTf/9O/BttHd4waVUVcpQ0EJzghAMD9hI9lFc4Z8Ju2b7AQlMlB9VJ/CSCZi
 UTdLGBBg==;
Received: from mail-eopbgr810057.outbound.protection.outlook.com
 ([40.107.81.57] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXmKb-0002yi-9P
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 12:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDI9X7fwjzc5oPf8aBzUA2Q5zcmT50zy8AWNrXSJAuc=;
 b=bEaNcS4RvRPaIW2MO9IysgAmxb/8WVeo/cUt78YiBybHFlLmIrz1YsyrPAF2/3+tIWdu68/w87pNPER3eCZyOKfdfkd4UR+BzS/hAcyU7rBLFu/ZV5FicIPbU1rmF0QvsWetkQYlZN7P5BFuT8+TPE9lJqcfSyeuWsCLkDSlEKs=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5872.namprd08.prod.outlook.com (20.179.86.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Mon, 3 Jun 2019 12:43:44 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 12:43:44 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Yixun
 Lan <yixun.lan@amlogic.com>, Lucas Stach <dev@lynxeye.de>, Anders Roxell
 <anders.roxell@linaro.org>, Stefan Agner <stefan@agner.ch>, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 Paul Cercueil <paul@crapouillou.net>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Chuanhong Guo <gch981213@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 12/12] mtd: spinand: micron: Enable micron flashes with
 multi-die
Thread-Topic: [PATCH v3 12/12] mtd: spinand: micron: Enable micron flashes
 with multi-die
Thread-Index: AdUaBuuDD5Zu6ZlIQOytGKfMP/706g==
Date: Mon, 3 Jun 2019 12:43:44 +0000
Message-ID: <MN2PR08MB595106104C80B33816648BE6B8140@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15f9ba9e-b346-4ba5-e571-08d6e8211d86
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR08MB5872; 
x-ms-traffictypediagnostic: MN2PR08MB5872:|MN2PR08MB5872:
x-microsoft-antispam-prvs: <MN2PR08MB5872AC54D61E5C63EA1FCA27B8140@MN2PR08MB5872.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(1496009)(396003)(376002)(136003)(346002)(39860400002)(366004)(189003)(199004)(76116006)(14454004)(99286004)(7696005)(71200400001)(71190400001)(66446008)(5660300002)(9686003)(52536014)(73956011)(66946007)(66476007)(66066001)(66556008)(64756008)(2201001)(55236004)(6116002)(478600001)(316002)(102836004)(110136005)(2906002)(3846002)(6506007)(86362001)(7416002)(53936002)(486006)(26005)(2501003)(8936002)(476003)(33656002)(14444005)(256004)(8676002)(74316002)(81166006)(81156014)(6436002)(68736007)(7736002)(305945005)(186003)(25786009)(55016002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5872;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3nz4eYj1uWTdedVtxDU1IVvUhyGDbXSVB6nOf0BD5Kb8ZTqq5f09szA1q3qoDzm3aJbOHQ6AQe+JpNIruiNy8egKjJ5tHD0MQaM/VRzZbu8AoeDuidnJ0Thk2Knm+Degi5+4XU7JXQTB/u1IPo8xH53GBIQ3/SK3d/+hEYDz0Bk/Gz9M+Iv6vubjIKO/Lx8YmGQQBiRYkashNbfGDseQy+EGwTrgD+AIeCEjbays5+qainNcTiu2d87oMzj4MPm1pC9XM6fgEfZGP0SOc/Ert1ua1cGOL2Sm27ho++LOkeONDyqP55Xlg5jgrfPTnjFCzYg9aaNZMbtL+/qRae788G5EmCAYN6juculaZ5wbWIDp3JzimxzZQ2c18bSJAVgekkWGb5JYyk+keH28o+Y6jOGnSaRf9Ipn+SjN4MVc6VM=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f9ba9e-b346-4ba5-e571-08d6e8211d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 12:43:44.4459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshivamurthy@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5872
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_084453_330489_9DA7B018 
X-CRM114-Status: UNSURE (   9.40  )
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

Some of the Micron flashes has multi-die, and need to select the die
each time while accessing it.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 1e28ea3d1362..fa2b43caf39d 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -90,6 +90,19 @@ static int micron_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int micron_select_target(struct spinand_device *spinand,
+				unsigned int target)
+{
+	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(0xd0,
+						      spinand->scratchbuf);
+
+	if (target == 1)
+		target = 0x40;
+
+	*spinand->scratchbuf = target;
+	return spi_mem_exec_op(spinand->spimem, &op);
+}
+
 static int micron_spinand_detect(struct spinand_device *spinand)
 {
 	const struct spi_mem_op *op;
@@ -105,6 +118,7 @@ static int micron_spinand_detect(struct spinand_device *spinand)
 	spinand->flags = 0;
 	spinand->eccinfo.get_status = micron_ecc_get_status;
 	spinand->eccinfo.ooblayout = &micron_ooblayout_ops;
+	spinand->select_target = micron_select_target;
 
 	op = spinand_select_op_variant(spinand,
 				       &read_cache_variants);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
