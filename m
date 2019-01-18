Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CD6C1B0F7
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1932086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHiPDQAR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="Jr8jBCJs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C1932086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UJyDaueQJWy1iMY4o+w1pcjiFDFBc/8ZW8PmIZJQF7Q=; b=SHiPDQARg883vP
	qO/Ft2TN/PngWrOyRyMOVnBwbdLr+AyPsPl8Lhk7HxNYAyeKvzvWihBiGbfoBwKjiSz774fbJ7GuW
	gdTWGED1/ftIBVz2IEhF+Bfe9GHcU4oIf020xQ/s/Za7u5ZqJZIW/uDtukBwuIIxuS0wfz6u3/QhV
	EfVNq/MvshTzg9XmwVH+c5tO4ADufyiFwmXsKjlardzA7ir++ztDqqys9eAWAscUKMhy0LU/9eTva
	x2Qt0noKVMlamjS9p/2Odib19FkheFsTH3wfISbdczVCsaZov05cExJi9g9lDLqK+mv4VIzk2j4Fd
	Bv90umqXSHV5KnETcY9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkcN3-0003qa-6l; Fri, 18 Jan 2019 22:12:13 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkcN0-0003os-4H
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 22:12:12 +0000
Received: from mail.micron.com (boexchangeum.micron.com [137.201.21.209])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0IMBb17000628;
 Fri, 18 Jan 2019 15:11:37 -0700
Received: from BOWEX17G.micron.com (137.201.20.31) by bowex17a.micron.com
 (137.201.21.209) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 18 Jan
 2019 15:11:36 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (137.201.20.7) by
 BOWEX17G.micron.com (137.201.20.31) with Microsoft SMTP Server (TLS)
 id
 15.0.1365.1 via Frontend Transport; Fri, 18 Jan 2019 15:11:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAT3pky8dZo5lkKXkwB29s1oCDVa1uF24i/rK6jGXDU=;
 b=Jr8jBCJsF5aQn7bo4KUN02R4Syjiv3hu79fdP6HVoz96rUpiAvZof4qrl45jsoxTsU6abQZcNvKBfygLQbI6YMmcXktvoE7g02wxX0FbDZ99JeaEY4vJMu4bq84G+ECzrQ9q4AGNJuYN1Qnfk+SO5M0w1TGccrcmpdo0hICBaj0=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB5527.namprd08.prod.outlook.com (20.178.48.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.19; Fri, 18 Jan 2019 22:11:34 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1537.028; Fri, 18 Jan 2019
 22:11:34 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Subject: [RESEND PATCH V2 1/2] mtd: core: add erase preparation hook function
 pointer
Thread-Topic: [RESEND PATCH V2 1/2] mtd: core: add erase preparation hook
 function pointer
Thread-Index: AdSvehBLGVr5lZ4nR3eqL0un6737JA==
Date: Fri, 18 Jan 2019 22:11:34 +0000
Message-ID: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.41]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB5527;
 6:d9q5Gt7pC/KKVK6TuqIz7VpDyt+4d4VYwwceL18+5iVF5lqlssy8xYDX/Br3+yQcYiDlaKtB1MEKZ07souhgBWnvI0WdsHj0EivyurpqW1vC890c3XXqkv3lH4HrRUcSGj3enyYi0YSxe074Fey5dG9ntpu8urZ/ax+euPvPohJQSiLuXDpY73XEa2IEhrudEtpw1G6EH/UxKVkT6Ib5fSe5tpSrQXIfPURmzPNkV5Ke6WtrffsMl3+15wtZFuuEfxE+beLClcPV7qKLCQ5vEtPNTkPf8VvSNMDFV8+rVwzAbdozXn4Iuln++5w8+fhBVP51wNbtqweQuAoNqmPPfL255UduM/awcWx2/47CKrka89JdyKFyOLitJzn7nLrWB4N85QQfncSXLHRtopyPv5PwD+Y1AXPtVvSIt8tL7CXWd3MM9zg05FJPDiSqcp0Cs4TGEbqygc+hJMGtjz5aiQ==;
 5:dV5147Yq2vbFZ9/gJu4ocLvNt3XV+MdNkdBMyh/Xm4Jy1Jp+H+Q/xMGbm4EgXdBrb8GIQnju/sdjKhP1gU0bghNkQrIqT9xSXrmSbn+uiKAM4x0th4DatFWbCLlzGjfLAzRw8box1++PcIlSzWhqoXo3vPK+Je2I0zMD2BfN4cQ3bdbV404oPpA+TcR3pcovhhe5eO65h5Dlb6C8OQa9Pg==;
 7:7EasIOSedcubCVwMWzQklCpTO8J/+93DecAFhMqWi2ll7mnsihkyfrE8VxxoBcopq192RQh2OW+iLsQN/3Ss2uZ8p+ADVdT7tPb93tri3euNWwqHZqZgQ4mffG3QprPJxXunkGLxF27QgZXZI45psA==
x-ms-office365-filtering-correlation-id: 9bbf1fd2-da3a-46d2-da29-08d67d91e85c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB5527; 
x-ms-traffictypediagnostic: BYAPR08MB5527:|BYAPR08MB5527:
x-microsoft-antispam-prvs: <BYAPR08MB55272B7540BC388AE43A61E2DB9C0@BYAPR08MB5527.namprd08.prod.outlook.com>
x-forefront-prvs: 0921D55E4F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(136003)(366004)(376002)(396003)(189003)(199004)(5660300001)(68736007)(74316002)(316002)(8936002)(305945005)(33656002)(6436002)(478600001)(55016002)(110136005)(86362001)(71190400001)(53936002)(71200400001)(99286004)(14454004)(476003)(81156014)(486006)(81166006)(102836004)(217873002)(8676002)(26005)(7696005)(14444005)(9686003)(106356001)(97736004)(256004)(105586002)(2906002)(6116002)(3846002)(55236004)(66066001)(7736002)(6506007)(2501003)(2201001)(186003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB5527;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RAxI7pVt2uXAxlPBXQAc31TPmlyYXYNe6tLB5rMbBHzQHxP81rhrJcmkZsoin2szMuQ4GNqpj3UjUPAtytrJ4Wg25nwQ0QYGSucwq2JaWtFElAxOI9drDAQBhScTQ/2/gdcRFlPlr+ceyBNGLAGoGJ3Fu5nhwV5ZxbJCckbaBNfQg+CTajZ393gPBlt0sjCKpZWwbhr2frNon3nIc6ZJTK3LdLRalcqH3+45E+nVFNBrLr9+jZrEnLLgeSgUy5fCHnCfYQni8vX4wHWQ3QdKJU+Drxvyu6o8miYfdc8pPZZ4vKaD5QGhd/mk0pJUPXEAy7k9mc0bHJWrm2CicKeN4bxfW7S8iRGL7QDMnVIR4E+aW5W6GEi0Jx+DIkZIm42hq02m68TGAvJ+Q/zG4yzxFLn6BFhG7ZfAkwNLo3jFamc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbf1fd2-da3a-46d2-da29-08d67d91e85c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2019 22:11:34.0226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5527
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24372.000
X-TM-AS-Result: No--0.940000-0.000000-31
X-TM-AS-MatchedID: 704421-708797-702098-700251-851106-700016-188019-105700-7
 01698-701604-704501-704980-700057-703399-702931-148004-148007-148020-148050
 -42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_141210_379981_FE8D0C2F 
X-CRM114-Status: UNSURE (   8.80  )
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


This patch is to add a callback function pointer
for preparation routine of erase in nand_manufacturer_ops.

Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/nand/raw/internals.h | 2 ++
 drivers/mtd/nand/raw/nand_base.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index fbf6ca0..8382948 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -42,6 +42,7 @@
  *	     is here to let vendor specific code release those resources.
  * @fixup_onfi_param_page: apply vendor specific fixups to the ONFI parameter
  *			   page. This is called after the checksum is verified.
+ * @erase_pre: preparation before actually erase a physical block.
  */
 struct nand_manufacturer_ops {
 	void (*detect)(struct nand_chip *chip);
@@ -49,6 +50,7 @@ struct nand_manufacturer_ops {
 	void (*cleanup)(struct nand_chip *chip);
 	void (*fixup_onfi_param_page)(struct nand_chip *chip,
 				      struct nand_onfi_params *p);
+	int (*erase_pre)(struct nand_chip *chip, int page);
 };
 
 /**
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index cca4b24..d446d1c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4246,6 +4246,11 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    (page + pages_per_block))
 			chip->pagebuf = -1;
 
+		if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
+		    chip->manufacturer.desc->ops->erase_pre)
+			chip->manufacturer.desc->ops->erase_pre(chip,
+						page & chip->pagemask);
+
 		if (chip->legacy.erase)
 			status = chip->legacy.erase(chip,
 						    page & chip->pagemask);
-- 
2.7.4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
