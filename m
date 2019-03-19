Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3152C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:57:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C22BB20835
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JbhEY5CG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="gatUZB7P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C22BB20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7AlkMxoqk9Z7OsRUbAuzbhIwMih7iZl6OToShUZuxo=; b=JbhEY5CGUhYTVo
	tNi4vdc/qemCyLWQkAbX1vb5z/KnMh1u+bO1hZioMEEKV7k8vUNWs577X8ydekWl9y5karR1WqBBo
	SFF7CNCBiQJLcwrrYCRhSDb9nzLAOIAQFwzangpYL3QlY0fnUDumD/YlW9BGi+3hzKhmTnwVQjQdW
	V2Oj+veo4YQUGcQuWvT4F3T0ceyHIe3etfQeZ8/bgYu30gkbRiWx/+lTeKOExS4pKSXvNsCiHi4of
	aRr5lVtGFSrD8Pcml6ciU2tppKDJLNTOxmrmTFnvzt7LINSH6DD1cXxi0lKmDqDn6vl0hoydHL8Nd
	o7jiCCFEG7EjPqyk9smg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6I3H-0003jS-Ij; Tue, 19 Mar 2019 16:57:23 +0000
Received: from mail-eopbgr10104.outbound.protection.outlook.com
 ([40.107.1.104] helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6I3A-0003Xx-K2
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMQRV5s/vOA//U/NaxMFYdsJQWNhAVoDr+S5JCMs7Ns=;
 b=gatUZB7Pm8wEi5FHD/ygG6b6jnVj3QuO0FjUsS3DVfIqikJRfeiijrndWP7vl6hv6u7myUo3SZijV/Vxf+MSrMMGztW04zUavhVeXEu/B+1xPKVeMYRaU094swVzvq8tUyJQcLLj/RFuzFhAecHUP4HB+hBkBzH77TtXlx4MM3c=
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com (20.177.198.83) by
 AM6PR07MB4968.eurprd07.prod.outlook.com (20.177.197.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.16; Tue, 19 Mar 2019 16:57:14 +0000
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996]) by AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996%3]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 16:57:14 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Index: AQHU3nTNBMAEnJyK2ESjWcR0VsFMdg==
Date: Tue, 19 Mar 2019 16:57:13 +0000
Message-ID: <20190319165651.23695-2-alexander.sverdlin@nokia.com>
References: <8875821d-feaa-6a7d-d9d2-d992be9cd235@microchip.com>
 <20190319165651.23695-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190319165651.23695-1-alexander.sverdlin@nokia.com>
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
x-ms-office365-filtering-correlation-id: e4ff54ce-bd62-4308-365b-08d6ac8bef65
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR07MB4968; 
x-ms-traffictypediagnostic: AM6PR07MB4968:
x-microsoft-antispam-prvs: <AM6PR07MB4968A536EC979112931671A088400@AM6PR07MB4968.eurprd07.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(366004)(396003)(376002)(199004)(189003)(4744005)(11346002)(71200400001)(446003)(6506007)(386003)(102836004)(186003)(71190400001)(26005)(76176011)(2616005)(305945005)(476003)(7736002)(97736004)(1076003)(52116002)(486006)(6486002)(6436002)(14454004)(50226002)(86362001)(8936002)(25786009)(36756003)(2501003)(81166006)(6916009)(68736007)(54906003)(316002)(81156014)(8676002)(5660300002)(99286004)(6512007)(66066001)(53936002)(2906002)(14444005)(256004)(6116002)(3846002)(5640700003)(4326008)(2351001)(478600001)(106356001)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB4968;
 H:AM6PR07MB5221.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rwNC17zr1i87uTuGbjRNwQxeDpRPwI/+kyOHFGoQ4AFhn2YNbvw9SSHRoXkU88RrRh9uGhpiZnduyMqWB/uYTSRPjzyKakmRO3XgHQII62VI+hHla1LG6wwCiBXwIM7DmHbBG0hqjo9UIXBWAvzTuZZDY8uePxo1Jz3bpu7UQl8kYD67us2X6QIxc/q24lrB+8g6prdQ/QZektRNiYIzk/OQ6zOYpIEgyE58frjeqo4QNnGjJLz+fjFpfbfs10s7Jm11hw7LZj4FpX1XoRxukUnVKzrFyUujba01w5KfzGb+hSJRWPpjhUN9sCok7apKuTll4wVYuhXp5IgJqp/ttOGa+ra/VmS6ZgPWbcmJ9vaLLGQNKhfIkRvcOwH7x/qnXTR2HUSDjm6+1JQZYNPwavLISkITReCBUmeBW3dA8xY=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ff54ce-bd62-4308-365b-08d6ac8bef65
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 16:57:13.8854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_095716_912582_C86CE030 
X-CRM114-Status: GOOD (  13.47  )
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
