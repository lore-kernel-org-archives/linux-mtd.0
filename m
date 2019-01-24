Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3CFC282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E444A21872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sS4MfLEl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="WGa6T48e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E444A21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndulitJ0nYXdqEFpetpVwmqH2AlgOZ2joNPV/knYthg=; b=sS4MfLEloEws6D
	L+HbG8IsGUnn0xNisqcCGk0QZhqnLRzHdc9meKWox8MHeXSXusb8zVlL9Zxpd7OcQmtyCRP10xiVR
	I1PN2TyUUd4m54FQ2by2a1VlR2YoqMpefSb2sqi07MVypx1I5nANbwLDEvmD+fdo7qzjpOv0EKRVq
	6eFp2/HfUrLtFic12iIw0dtR/qtc0jQIAkAtqbKLGmTnxOQR2vHJ8hZObnhwYLbErtaIrdvpEHUCt
	gJ/5rC1NH4wGs2X97i9fPjTPamySD5phGXbEqLMf9mA0j26a63Vce/ifSHvfxgHqBz1Zfui1C+me9
	wY2ExZyLpY1RzRUcxODg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmd4h-00074c-CE; Thu, 24 Jan 2019 11:21:35 +0000
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmd4I-0006cJ-RB
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 11:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4OGJ2chCBUkw0/n/6JGW917iTMgL3LCO0TFPFmlZnk=;
 b=WGa6T48eks9F4bnc2pYEcNUChz2PvQ6TU7TYZrNAxOP54IPMC4w7Q9OYizsNCyEJ3PNJDenqsaIQWk5K06Fokp1eUt+/4G+sVb5a2L4TAmRMpvQV7RWknlGtoqpvEPoHVOhVhvYlANbiloLXt/+DZaC45ePc5bQH7nv4uho92SA=
Received: from DB6PR0701MB2998.eurprd07.prod.outlook.com (10.168.84.136) by
 DB6PR0701MB2454.eurprd07.prod.outlook.com (10.168.75.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.10; Thu, 24 Jan 2019 11:21:02 +0000
Received: from DB6PR0701MB2998.eurprd07.prod.outlook.com
 ([fe80::2843:5379:602c:d03]) by DB6PR0701MB2998.eurprd07.prod.outlook.com
 ([fe80::2843:5379:602c:d03%6]) with mapi id 15.20.1580.007; Thu, 24 Jan 2019
 11:21:02 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Index: AQHUs9bjD7q3a5790kSVuSSkSE/kVA==
Date: Thu, 24 Jan 2019 11:21:01 +0000
Message-ID: <20190124112014.20167-2-alexander.sverdlin@nokia.com>
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
x-microsoft-exchange-diagnostics: 1; DB6PR0701MB2454;
 6:55brS2cTEODwUit7q9V8Pp3VS9hqt/vH2Qqmblj/DsJHIVJQDaseJj1sV4mKGYtVg+l2Tf4i8ogYjdvhxyoyKIDwaAYG0+39Iu8BUV1Qx3DeolFJhmCXumZ/uj9K/mFZRHS5gTdLlPMLIcgd4qOTQxyj78sBuGIaYanmtzGmJcWB1AuEI7Sk9reLhIMvdeFufA3/5tfBX+t8TLIYZHT+n+5maClmOxJPKxZCGJ6aC9PNAPiB2VBAJZuwR15TBZYli13TaTzUzTwzvqCvSDOkdn89Z3WIkeYuaRHv62syWRcnyrCPF1dhDF5wVrJECsfUu1T60nF88yxpgmnrKDWQCjWsEFuDIgnUeE3EEGJwE7IOhdDrAdAX+F7p5kazWX6vNVaq1RKD2szb0IgCe8wukWoGWeeNizs25E1C5GaZSQN5BLIo/10CJCuZcMo733TmuLqPFx5lxvjSYDmC2A2jPw==;
 5:/MyF+xZwNgzMG1QK/Rp9YEO0woAQgq9EHNAo0YrTVCQ7uqjSPsUbtUPyWSR77u1ruLB/JgNNTVrbhmXvRCVI6GhFc6+kmNlCvMpRSLLOwiuGZAk24KQc1cIGWVA5gSvn8a+qWsObxj+YMWH1uOiqZz5CPoTq0il9dOwQh7YzGzObhJa2/00yD75ZNFX6t9c139I2wZPB972Txk1EeePgyw==;
 7:oPhqbqq35kyV0p6LuHEWTAX7fBPLw7FZdmNepLb4dYW2dhTJohRESOMdHj6fiSWqN+CQIVHpFE3ZksXBejeUIvpVfgvmLGMd5we1rxnk13KCQ+7cZFPYomy+HWc/rJ5YYWeIiciz9NfQXYej5dHvug==
x-ms-office365-filtering-correlation-id: 52572a9d-3b5b-44cf-8671-08d681ee0540
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB6PR0701MB2454; 
x-ms-traffictypediagnostic: DB6PR0701MB2454:
x-microsoft-antispam-prvs: <DB6PR0701MB2454B9C5C2036F7739DA542F889A0@DB6PR0701MB2454.eurprd07.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(396003)(376002)(136003)(366004)(346002)(39860400002)(189003)(199004)(316002)(53936002)(25786009)(50226002)(186003)(5640700003)(3846002)(36756003)(8676002)(81166006)(81156014)(6486002)(6116002)(66066001)(486006)(386003)(6916009)(7736002)(2906002)(305945005)(97736004)(6506007)(8936002)(4326008)(6436002)(39060400002)(86362001)(14454004)(478600001)(102836004)(14444005)(256004)(54906003)(52116002)(26005)(68736007)(1076003)(2351001)(476003)(2616005)(2501003)(4744005)(6512007)(106356001)(71190400001)(71200400001)(105586002)(446003)(11346002)(99286004)(76176011)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0701MB2454;
 H:DB6PR0701MB2998.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KJvVkZ2NUC9akES8g4jIykNINvri5Bu8TrvmjL1Jb79RTsCxopBLbKjwpP+NE4FUUyDCvcclMxJU3JqqpkjSyNP9idQtQMn8ZuUKHvgHHzumdZomSUUaxcvj9Qof1SUad2lu9AVRp8uE69kCqYpB4nZL9ERJVSzQZO0QdkWXTGS4ckZPBL96/KhCE+q52mPUVecTrBaVwQ6hfrW7VN3eL9V3YU7D1a2ZgamvLwZPhdYDVw57fCFui9+oxjhLf1tQdUKwhd7bA85Rsphz2p7t7gVM8T9KK+G3iJtHYB5CNS79dsRMGcxrUHnpBdY75Ckn3qNq6jY2sukiHI1oG9CFsfUUPO3+kfeB+moCOSptqStRQ56CAG/JPq6d75mCLHaMS3LbnRnIQa8MAvXxs4xluTx6CK0ZnD3eQUMsqS2gAaY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52572a9d-3b5b-44cf-8671-08d681ee0540
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 11:20:59.8618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2454
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_032111_209177_7C63CFCF 
X-CRM114-Status: GOOD (  13.83  )
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

Erase types are sorted *smallest* type first, refer to
spi_nor_sort_erase_mask().

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..c3598f0571cc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -739,7 +739,7 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
 	u8 erase_mask = region->offset & SNOR_ERASE_TYPE_MASK;
 
 	/*
-	 * Erase types are ordered by size, with the biggest erase type at
+	 * Erase types are ordered by size, with the smallest erase type at
 	 * index 0.
 	 */
 	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
-- 
2.19.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
