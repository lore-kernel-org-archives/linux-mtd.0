Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D06EC4708F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 13:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0AFB613DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 13:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0AFB613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ul0Vy7a0b6t9QxN/Kr647XZdkUySmHxkxklsVAzx3Y=; b=3tt1tTbg2m1FHQ
	pPeWGS92T20w8tGvVJyHM4XmE/XhndXfSzmKAedxfGlZR+RpFFuNwxOULxsZrbt0Asvsh2dxlzzN8
	8Qt9qcc/3E5edCZrefQa80BuIw2nI5zC6YGVHunT23hB0JSbfkmuLIt4kK5OCsOBNbcLYMCzMnpPM
	uD/SrHeaSrl6zDOm7wH4yKBl6LNh20kPK/OsEZ5lfKfxQKYIvY52G57KjMEcucGRGaJS8CZ6ev8pG
	3eMIp3OZ3wXc0aDtYMoNu2WzpdGO7MR6RUmB76eSpf4V0iVXjwVKdDsGk2HOFi3xgsaGrteykn1OY
	pacJoyCxO4puZ5qWS+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp9Wu-00DbWJ-L0; Fri, 04 Jun 2021 13:06:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp9Wn-00DbVZ-QL
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 13:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622811981; x=1654347981;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JJK7Zx89/AKtbtaumja5fyEXBdiRA4G6sqGOywwXhFU=;
 b=QOGRq4VZTIr5hghtF4UxZV6p2GrckDtw+I7n4u1wkfsVyv5F9uTt5Yr3
 8xg/K6riDjgIS2KyKRvUFIJSP6F9DabUO/XB30L1aMPIGwWPIAdt28itp
 BcHASxUXW972hyQlJvcuHslfbamocowOMO5YTZfvBj4oJTdfv1ZFd9XTn
 PqZupfKgkh/XaJNdDnWrESn1+XpX45m7k0QxnrleNcmupN012ZsvyPskE
 Yj4B0Ojj0bcX/fKsKfBKL2eV0Wkjw9YVsNY3PPOgIQJUS0bk9fV+kA+42
 MQPzQlkEfeo26Ha5orLp8DnkSaPQeL03ASWpdMEoC73jU7QCxwS+czbir A==;
IronPort-SDR: l1PMwliyXmLNHnLZ4Ugw6nx6zxQhjw4tmvSIJ+3Lp3Tj/hLpXZDljw3gJxyoyWnS6jLwZRwxFo
 1g58fcXV3Xe5OfAhkmBOz3LeQeGVa4pXujgqfkxQCurTZ5pWQXVfdV6gA5MUNlZ4j9M1KAHIqM
 nTl+XAN0yEQR1FP7nBVzoDvS/YVdPSWKFGxRPgu9++XlmJdXLTcke8L9lHGIxA5yso040HuKHZ
 V656UPve75zGybgSrdjoJDHqRLnhsIgRAEauw67SUb7FN8RRt0pkV52Wx5oU1cUn9Seozp9w+6
 W20=
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="124093819"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Jun 2021 06:06:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 06:06:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 4 Jun 2021 06:06:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfgRmZ9utLqhnsiLR8wkmkZihdB40OjEDG8WJ/R1Cdjqgdo6K3yvaw1gGuihOYTZ3OF782qJNnES7WkzjyFP0g7G1yTPKuMaFCVlFikR0bl/cMa6l+1XUcH8vfIqAV9xV0SOerGpoTAwJgzvGDWkbqGo63T/KGs7miCJKRi/A1KahSuEeTJizoujYqEUwxH7syII8CN3s03gC8RtbZ8L0qCQSRklEtreGRPFA585T3UtVlrac/mhEXO8jiOE8zlSeoOkjaeV8eWsaly2cFVWiRtHywNS50Zw5usFIKzxKsRr7qqNB5t9J86W/ZFm5dNoAnaaYTJYs7X5EHTAUP/Ovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJK7Zx89/AKtbtaumja5fyEXBdiRA4G6sqGOywwXhFU=;
 b=OeZnON6ogMaa0gofk1SYrronS6/aB4lyo4F4WOM9IVVYXI/drvw4ED8O0ZzR8TEaNaRZiTSBOGloyBseL6yto8+nm3IMsT54PO03a7zvAgCTcTplRoT3DGzsJyq6I1l1KowGDDpuUPxFO1Q/EKMzqmzCL5QySKTjQTUTSbH4e2aoYnMWqN+zReAl0UenlUcemwSNWpvGt/nNUqnILlRRLyF3q0hHgrX1eLyd4k+tFsrEKJod60bWACRMnG3dTH6g/tKIzReiUPEEJbwLzBzFxj5MLdV8pT9Mt7vT3b7TME227/KPmhFD5lR1A517eok5ZcLmD6pwy5WX+7CgJe3R+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJK7Zx89/AKtbtaumja5fyEXBdiRA4G6sqGOywwXhFU=;
 b=iKcMDACIZS3JWBoyYpazqYoHENAy6tFSnIZHr4SRJnjjKNnOdoYdmvAq8SqMnfcBKkElExRD1ojdHdiUv3ZZm0nE8u9opjPgESyGjK4uPHmB+h9rrqomfSNMGefrOpGxS9EC1Yip9GqtIdiz9SwK+oi8JR+pm9ukQJ/7FW+BaZw=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 13:06:18 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 13:06:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v5 4/5] mtd: spi-nor: otp: simplify length check
Thread-Topic: [PATCH v5 4/5] mtd: spi-nor: otp: simplify length check
Thread-Index: AQHXWUJnwVs2gjeHfkq+jT0cxpWjhw==
Date: Fri, 4 Jun 2021 13:06:18 +0000
Message-ID: <e613133f-87c8-6374-66ff-1b674990cc90@microchip.com>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-5-michael@walle.cc>
In-Reply-To: <20210604100252.9975-5-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 205f6bd5-3411-4d9b-6fbe-08d927598ad2
x-ms-traffictypediagnostic: MW3PR11MB4635:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB46358BF2B915050D47108D19F03B9@MW3PR11MB4635.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S2VkyhpoiO27MQARna6N4wXV3GBmwY5u4J4fbRShGCppoISG0Vvr0dajbijC+uftAqGbHf25APYzxlw/PMcrU6uCuyT8wBGQ+6HeKmX6giPEEj1JmsYZit46syi3xv9J0yr0MlTcH44ZIHpD1AH+7hoI/hAQ6GvFksf9bjznNUKCh2vlRziUEcrWV61AiL6ZozGq/pePUUKeVKT5Z6yugpz5cSuSsYk4naLpWXxBzlkhPA6XHp/IjQr+2+5/DACI6YmLLfPDxc0Ej6NP4OI+jWkMDKfIWa8kjNpcSmXDVhGh9RR6bX+tfWCYUlit9XAPKqg9ZShjsCsHurCXb7bPWlGcmTBXV71/T0vjDydQ7Fmp/jb1Ea6dnLucb0/k7BkNAfk9gXEOQU1ylcZR2n17gzyNIxCQp6HFsOfxdhKvvhoYSJg7BGMESVCGUDSWI92qnN3BqSklSTFzlP4sad9gg6ak0K05pEb0G6hya+a4rcBhvcM+FUppn1HC0tLEndzD0TbYYYFvHwH645d3jP3TzZ83t1dGaM8fqmhVMYxZfU53XR8EOtSJzd1aof1CJVVtrs3TCtxo/fEX5SsVc6z8kPToV706jpKw6MEMwsZRpc07rZQ+8+DZR4icqbKS5bDkyJ273H7ByZsyHPzC5PJMgHXxUMSi1GttvWLCqM7Mror1n7/EqtL0v63eXlNaJ9j9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(366004)(346002)(39850400004)(4326008)(38100700002)(478600001)(6486002)(31696002)(122000001)(71200400001)(2906002)(6512007)(8936002)(83380400001)(8676002)(31686004)(66556008)(6506007)(36756003)(5660300002)(66446008)(64756008)(76116006)(26005)(186003)(91956017)(66476007)(53546011)(66946007)(2616005)(86362001)(316002)(110136005)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WFAxcXlaUVJnMzV3Q0VoUUtWb2VHanA3aEpHNFhuTndQbkdjdzIrenhiV1JD?=
 =?utf-8?B?eUR5TjJPMFRpd1dCd3dYeWZoTFg0VzJhaXU1a0lxWFZmOE5ReGNrbERoa0o3?=
 =?utf-8?B?ZmtKSXhqVnVQcUtQN1FIbHJmZjRSTnBuUnlaT3lnRlRzc0FBbW9WQUVIR0t0?=
 =?utf-8?B?WCtwa2VRcnErUEdsQ3hYK2d0NnZEYUdXcmg3VkU1WTZvNDRSbVRHQUhVN3VM?=
 =?utf-8?B?TjN2UGpsSzQzbVhnYThML2hzUENub2FtVHEyM0xRbnR1R2wvdldQUU1GbWNN?=
 =?utf-8?B?WlNuV0tEbCtUVXlGTG5PNXNNN2x2ZkN3WWlGUHdMZGRFQ0tBVFBxT3VvUVgv?=
 =?utf-8?B?SkFURkJUekJ1MzdCZEtCV0t3WUdHVWdrc2hTYWVsZFB0NU1Gd1Q1QjZXR0ZZ?=
 =?utf-8?B?azlucUZvdWl0VC9vaEh3NklVQXBHVTNmNnRhK1FDczNjOWZDOU8va2R4OUF4?=
 =?utf-8?B?TDBaL2NkS2RiMmpRSzY0QXAvOWluRENVdzcvWnNyNG83MWFIeDdtTTNRM0NS?=
 =?utf-8?B?a1lMN2o0V2N6djUwV0dheTlvRnpFMFVEcnZzNDlxM0l1K01SOVFGNjZuU1dQ?=
 =?utf-8?B?Um5kTXUycVhGcDFjS0FDZldURXJJL2drVHlWRENER3NMSG1BMmVYM0JjK1hI?=
 =?utf-8?B?dnZIRWduUm9MVjlLV2hiR3Qrd1gxS2h1Q25JVXIvVkFVRHNkU1Bnc0R6cFVq?=
 =?utf-8?B?aFNPZk8xUVl2d2hzUFJ1bEtxZCt5UmhtbUJRcEtmRWV6NTUwVXJucC9RTFZZ?=
 =?utf-8?B?S2MwZFN3MnYydHBDZFRSVHlyV3lrRXRIVDR3YmNEWEprSWtBK2s1WHphS2hE?=
 =?utf-8?B?aXltVUQ5emU5Qkh4WThDaWYyUk9ERWFtZVkvTWNsMjBHajJCc1NDbEM0Y1Q1?=
 =?utf-8?B?RWtWaVE5R211eDVMYmtBMEIvcWswUy91Wmg3S3ViR0UxM2JPVTZBSkY0RmdE?=
 =?utf-8?B?SDZnY1o0MnFxVzVZY1pNM1F6MFNrMnhGbWhwUk11cTZaL0psZlFVak5VMXZY?=
 =?utf-8?B?RDNZdGM0TXY3dWk4WjJYZWJlNG1RYU1zbHVRdTZBNzVPMmJtdEpUaUdDd2oy?=
 =?utf-8?B?UHRTWXlNVUJHOWphaGJsZHAxTDFEazNieU05M29kdk1mRWhNc0ZxWk1idHVE?=
 =?utf-8?B?ZlpKb0FBdWZLY0NYMTYycElZYS9wNWZDV0k2SC8xdmdTaW8zbjREZVUzNWFr?=
 =?utf-8?B?WXhlZXdRRXY4YjhuV252NkVNa1p2c0JZRHlTUVZrY0lJZ0xZWjZibU4wQmli?=
 =?utf-8?B?MnhHMmw5OFhVRC9SN2ZXNjk1OG5Va29qVWxKUktzaHRuTnZ5bmFMcFFKRkN5?=
 =?utf-8?B?aGN1K2RpSUNSQzBBN21wamM1OEVFejZQVnBRTE11TDFtRS9lWjZBc2c2b09m?=
 =?utf-8?B?dkNYUkx0MndFMXBWblU2WmxSV0wrQ0ptWldUK24xRmRzN3ZMb2N3OEhTSmxz?=
 =?utf-8?B?MDBya3pKK2tYbDN6U1hOaDlmUytYUHdBUmdPclFIOGZQZkkvajZZVW00NUxZ?=
 =?utf-8?B?ajV3S3dXNzloZjNDcmVlRjQ2T09UYzRXeE0vSDBBRHoydm90OWdUT1Z0b0Yx?=
 =?utf-8?B?ZkQ0VHlueDQyUUZZdVUvQXV2amhQamRoeFVaeXJ0NWYxdlRUUVVLWlNOMEVE?=
 =?utf-8?B?M3hYVDdSSHNrSE5PYnpmY2pBSE1VUnRrZzlMTVNBbGtBdXBoSWMzRS91VjRl?=
 =?utf-8?B?NW5JczJ1L2dNY1FWL3NSbjZNTlBvZ2FNRFU0bHFFaGlTczFRVEN4T21Zbkxm?=
 =?utf-8?Q?02i7yjkr+JU00EyRSI=3D?=
Content-ID: <CB54E8BCD44EB241B6F6350557A58A98@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205f6bd5-3411-4d9b-6fbe-08d927598ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 13:06:18.2921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EooCB0Cayx3f0bFnnT4qS7ZIAa7cYTm8vNzBfggkI9/mKbc5ApvkS1DG+iBHNZilqn6P7BVVB7L2cn05FXvKaYj+ULRRsgd3wzZ2xouGRHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_060622_039949_DB1C228F 
X-CRM114-Status: GOOD (  25.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On 6/4/21 1:02 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> By moving the code around a bit, we can just check the length before
> calling spi_nor_mtd_otp_range_is_locked() and drop the length check
> there. This way we don't need to take the lock. This will also skip the
> "*retlen = 0" assignment if the length is zero. But mtdcore already does
> that for us. Thus we can drop that, too.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/otp.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 063f8fb68649..89fe52e3851a 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -256,9 +256,6 @@ static int spi_nor_mtd_otp_range_is_locked(struct spi_nor *nor, loff_t ofs,
>         unsigned int region;
>         int locked;
> 
> -       if (!len)
> -               return 0;

these lines were just introduced in the previous patch. Can you please reorder 4 with 3,
so that we don't touch this twice? With that:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> -
>         /*
>          * If any of the affected OTP regions are locked the entire range is
>          * considered locked.
> @@ -290,13 +287,16 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
>         if (ofs < 0 || ofs >= spi_nor_otp_size(nor))
>                 return 0;
> 
> +       /* don't access beyond the end */
> +       total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
> +
> +       if (!total_len)
> +               return 0;
> +
>         ret = spi_nor_lock_and_prep(nor);
>         if (ret)
>                 return ret;
> 
> -       /* don't access beyond the end */
> -       total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
> -
>         if (is_write) {
>                 ret = spi_nor_mtd_otp_range_is_locked(nor, ofs, total_len);
>                 if (ret < 0) {
> @@ -307,7 +307,6 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
>                 }
>         }
> 
> -       *retlen = 0;
>         while (total_len) {
>                 /*
>                  * The OTP regions are mapped into a contiguous area starting
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
