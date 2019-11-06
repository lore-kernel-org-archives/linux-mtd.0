Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4EEC5DF62
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 08:41:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ADA52084D
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 08:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYC14yzP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="EoH4goC3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ADA52084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fE3dEeRGqj8HGyvRCSAN2BzYqRhDjywxhiwIp1p2yKw=; b=LYC14yzPEoDDCe
	G+oVlQ3iz7rQPoUA135pwVLlIwKAF0e9EIo2evrxHIMNWdBMqeP8jmHWfbhhA7rORNuWPqadf14/H
	Kbg5OVK+B7w9doIZL8vLgrGZGqbA4q0TKDKsJhwXTcnLAksd3SwXmu6EPfJPfIrQXsHfQFiJ21sA3
	VaDbjl0hOZbjpBgzpxfZkYDlY/3KyMDELEJcDbyGZJ5YbldgMfPc4IlYeHueGZAf3NvIg8RDB4Frf
	kA7OCi8V2xYOKFYOQtDhHurhxXxKmURy+GCL0Kyoi7MJ9qzIgs1j0YFN6tFrXBhI9B7NOGjptPTG5
	Na9OAWRbuNdQkNJ1r7/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSGsb-00037g-FA; Wed, 06 Nov 2019 08:41:29 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSGsZ-00037A-6b
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 08:41:28 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: bt1bkR4cd6wVAPnygKYvNClABxwEU8e4xNc88ti2aTjUCiUgPfTRAg8ejxR/076Q5jWAY+ObTR
 q7AQ1lH8C5Day64Hlzi2KU5mZyuwTG3oesJwNBfKPmSfnub9UCS9nM+eaHW2BPzH4hrKyPrJ/z
 F5fIW3oJ+7nXscYGv4M61LYYBIx4xAPsjk03lKjXnYWum9+fzk4r3vhe8q7Y+Paxxo4x9E95pN
 KAAdK5uRBdSrrKP7zKfbWbksN8OF9oDaQPBYdAK4quSRlaHbRMsdN80VeC35glQh/17pBTywem
 EC8=
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; d="scan'208";a="53080507"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2019 01:41:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 Nov 2019 01:41:18 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 01:41:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt+izzKesNvIY3sRkFVGnT+Jis1hNev3Zk86Kij1wYvkxaJAuQEtrYnpvy9OTxqzEp/tKZl+FaP00sg6BmM8RG/+TX7EioKXUHBXuOuotBLqXLrp0HRKVHvRqB0s98mNgcVQjr/qILcg2zQahgAhnhF4iEKOYLX/6L0SyAeLCZD3mbxpe57H0FC+eIWyfNmihhQJbsQhZmAEHgY6gGOy/x9+F9WD3pgYBxS5B0vOg44KF/qFiX1OyfAFTfQLf1nzwOcLQF/Fpqxa/jWZGaoXRO9krYOjGXvBC4ZSdo9F6fYX2Chw5Ak/IspBif2XgS9nnYnq2jlyfwVkeMFkWwJrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzkPIGw1LC/yS1YUaUeqVxqg5nzAiaiDhCt03X+/B1s=;
 b=SGEd8CSD/vVLoURR3M1urq/jfzXoQSS0/uzlRtfcWoreC4wkmrM7hwtRWIgPIw3bYdfqbcdDDwI/NS9H7+3pSn7gzX/PZqdkCNm6cQqlJdj+WxLqylzvLsFTMxDbCN+7d37HqOeJFtHLuanNnbljrlAfnFo7uC9Vbn3ovf5D7KkLDEB4WINYKnthV3NSQZ4rGSmM9KfqLc2TUBUKduko0suqi+OqKMxTUuQW1CfSP0uZLY66R6GIF7ayV/h2ruTmI5+FFAZnIMW067A1SxY5IJXG87yg49gc0GHJBFGSsDRlkjHhZMYlh+RQU1iYip6gxVyWfng+QNZeA5I6kU6c3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzkPIGw1LC/yS1YUaUeqVxqg5nzAiaiDhCt03X+/B1s=;
 b=EoH4goC3k+S6Hlz9xT9XOI0hVg96RyqTzqoDLwb7eJ1KfxewsJlQl7QjgXmxpah+KbtjMuDlyAN699rsqi98jfPf/cfCSZ+LKVDCYz10q3D6UsngtMFEarBzwfQrERgGbfugLdu3hTckcM/UB5LWQMfphXlCItCF2fzOAqORqg8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3630.namprd11.prod.outlook.com (20.178.253.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 08:41:17 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 08:41:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 15/20] mtd: spi-nor: Extend the QE Read Back test to
 both SR1 and SR2
Thread-Topic: [PATCH v4 15/20] mtd: spi-nor: Extend the QE Read Back test to
 both SR1 and SR2
Thread-Index: AQHVkXAAobnx9/kxgESK6sIIzhHB/qd8wv4AgAEV+oA=
Date: Wed, 6 Nov 2019 08:41:17 +0000
Message-ID: <a16ea803-e605-0367-6c54-1b890e11d5aa@microchip.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-16-tudor.ambarus@microchip.com>
 <b9a4e491-d081-1325-1532-b392f55fcaf9@ti.com>
In-Reply-To: <b9a4e491-d081-1325-1532-b392f55fcaf9@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR06CA0118.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::47) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc24ed08-6d61-4389-f35a-08d762951715
x-ms-traffictypediagnostic: MN2PR11MB3630:
x-microsoft-antispam-prvs: <MN2PR11MB363064888A0F1CCFDA36234AF0790@MN2PR11MB3630.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(446003)(6512007)(110136005)(5660300002)(6116002)(66946007)(54906003)(31696002)(2616005)(6486002)(6246003)(11346002)(3846002)(71190400001)(71200400001)(26005)(186003)(102836004)(305945005)(7736002)(66066001)(256004)(229853002)(31686004)(486006)(476003)(386003)(66556008)(316002)(6436002)(66476007)(86362001)(4744005)(14454004)(8936002)(81166006)(36756003)(6506007)(2501003)(53546011)(81156014)(25786009)(99286004)(2906002)(52116002)(4326008)(76176011)(478600001)(64756008)(66446008)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3630;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hhpAKz9qufvpGWGfaR+NX9ibS1snCcreOkE0lXcgzAdU8hFfSR61U9/Uw3IJXzjOyRPrmV/Xr7JE1F9E5Pg+aBioPt47doOiz97lpWcxwQ3/0x/piZJdovol0ZGZT31dymFddKYoLuKBzk/TktW+MrteXcFLMdEPklZSxuiCVd9S9nHg47AQgUDAqXCPticFz4nS862QfP2xkxAn3nnc6DblLO+fYtt/D4Tdi8MWGLjMCAtlp6PUrKsMsr2ZHF0pFdd6N/qQaambVztgsFUQB1b/iLI5+MUKoKpK6ibGv9/ljgDlaj+Q7VDCytIz5Qi9Gi6FUn7zVjMw2xeUru+GjNaepwKsRJppkTl76YZYAYASM6XEeX16AJbqjNh1Cev3piQULWWEXT4uyJfaadnab77sUTX8K5YKcDPXHuWu8xIZGEKoAwH+qolzJxSPV7a7
x-ms-exchange-transport-forked: True
Content-ID: <54E5E9C94F1AA748A556F9A3E39F6704@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc24ed08-6d61-4389-f35a-08d762951715
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 08:41:17.5247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mNEojUGLp8Jv1kK9FhioMw+mRj0puEFtGoe7YNaCZpfQ3PCxoUap4OQvQppE8BiqehdMhyHLem0YKqupnmz+BQERGCcwwoocYOuUyPdWXoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_004127_286377_F8B754D5 
X-CRM114-Status: UNSURE (   6.37  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/05/2019 06:06 PM, Vignesh Raghavendra wrote:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> In case of 16-bit Write Status Register, check that both SR1 and
>> SR2 were written correctly.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
> This can be merged with previous patch as changes are quite similar

Ok, I'll rename the squashed patch to "Extend the SR read back test".

Thanks!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
