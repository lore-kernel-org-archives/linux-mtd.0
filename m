Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C30C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 17:00:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBCD218C3
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 17:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t2b0mQ3U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="D6AM5QEc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBCD218C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQF+wo9uoaCsIJW1dkyJQrMUXJIKflHIEXeobb0ihb0=; b=t2b0mQ3UCcvpWo
	tuUP6qrwcU3cB0tBeTJKvcUT+sMhV4nJ84A9CbZtRze8f7ar8OGV6poQBb0t1UBVgEqOsuWkx70Sm
	UGWFlF0Bk495U7a6M7HhaOsYhP0CMYZzsfblDnegNOE8kBYWge49e4oHcyNmfT3GeP8f/E9BiyEgV
	UglbdvqQsT3+YF+Dt1ppTt+GaY+YGVgS0G5dkHZup+J3y1EU3Crx9OcGzdJDG0Z2+9MYtcqvBE+qj
	DcJ9iLDyID+agyCYzTVsBijTj+KEi/J+Emwl3DvDMJK4FrqJ5KYIBekfnjvykj+NGuW/kyBZ5q48D
	ICSHSBIDoIJz7bTpRG6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzP2w-0005Ss-HK; Thu, 28 Feb 2019 17:00:34 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzP2s-0005Rf-QI
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 17:00:33 +0000
X-IronPort-AV: E=Sophos;i="5.58,423,1544511600"; d="scan'208";a="27040737"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 28 Feb 2019 10:00:25 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Thu, 28 Feb 2019 10:00:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBUHVcg9/jRxKWeyGe1K4VWxQQ9O0Ps/ezcnKOwyLUg=;
 b=D6AM5QEclN5VV0uVk+Zog8Lw8v85H4UO/0qk1TUrBc/5DdkK1fV2A+PuLv+xSjFmaJ9NtLOzzbd0viidAqotefbY4r9iuzlvWLCwjqLHf+CmxpL8CSN8+gZiZ+K5/FN952Ai+YadjaU2ICLW2yy1IyS7Ib/yUxlkQ6utmwRyw7M=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1348.namprd11.prod.outlook.com (10.173.31.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.16; Thu, 28 Feb 2019 17:00:22 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%9]) with mapi id 15.20.1643.022; Thu, 28 Feb 2019
 17:00:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
Thread-Index: AQHUs9bk77RvlSJjREa6El1S6pHNP6X1pmCA
Date: Thu, 28 Feb 2019 17:00:21 +0000
Message-ID: <08858201-eebb-b9c0-a94d-9eec9106d23b@microchip.com>
References: <20190124112014.20167-1-alexander.sverdlin@nokia.com>
 <20190124112014.20167-3-alexander.sverdlin@nokia.com>
In-Reply-To: <20190124112014.20167-3-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0218.eurprd07.prod.outlook.com
 (2603:10a6:802:58::21) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a828d6b5-1438-42eb-5d3c-08d69d9e3974
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1348; 
x-ms-traffictypediagnostic: BN6PR11MB1348:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxMzQ4OzIzOlFUSGxZdENzVDRPNVgyUDB6R3kvVlE0d2Q3?=
 =?utf-8?B?UlZuczQzMjEreCtybDdLVlNkMXBsL1VNZysveGFCVjRqZHpGZnFZK1FKVm8x?=
 =?utf-8?B?S1NDbUF5R3E3VDM3WVpUMjdzejdGL3E2SUhLMjVKaEdXOWNSOEpkc0hXZURC?=
 =?utf-8?B?Y1lIa0tFRE5wZS9WTWVyUUVWUFZVK3Q1V3BKSUlPNE9VMzJ4eEdzeHhhbTQ3?=
 =?utf-8?B?aHZUZWJ0a0tHamE5S1dybTNpRldnY08yb0tQdUhZc29SUUpOWHIzZG5velpM?=
 =?utf-8?B?RDdSais0ZUZva2xkZU4rd1JleFhUVCs3N09lRkJiMHA4MkF2OFVOblVYc3Fv?=
 =?utf-8?B?ZlNNTzhMVWxGY1g2dWF1RFllRVQxM0xrNzRUb2tBdEl6OFgzaTlJOUZDdXNZ?=
 =?utf-8?B?UjhQNUxMTDNGZmk4a0IzSE1YWWhJNVNhWTUyMVEvM1ZiQllPL0t3aWtzTFA0?=
 =?utf-8?B?N2NlV2djd0xYZEpWSVltVC9MNVFkVE55MzRpUk00emNuNWRPdkliclE0YU5E?=
 =?utf-8?B?dTQ3RkdIeGYrZVZyRjl1ZzZ3b3dkTk14SWpjMjZDbXNZYTRnekcvQzV5TkxH?=
 =?utf-8?B?Tm9FVlh4akJ5eTJhUjNyRHpWRXVTTEJYeGRLSk1UOU1XcGl6b1NMTEVBSnp3?=
 =?utf-8?B?cnZIdEdxejdIY3hBM0ZFQkVDQTk0TzFkck1jeW9yNWJzZlZZSFVNKzlmTWNP?=
 =?utf-8?B?bmJseEdxRUJENVRPMjVWaDAycGc1djdpQk4wTzczc1pXM0dpYjFtdllCeS93?=
 =?utf-8?B?cEtWNzk3NUdIK1hWcHRJMFpwTnFlQU1WRUpDaEhkNk9uWDM2OWszUXdvM1Rn?=
 =?utf-8?B?TzlwdnN2RjRkOVBaVVFvYldEeFRsUURlRXBib0hZM2V0K004eXhoUFBaNW5D?=
 =?utf-8?B?djBoenhyQjk4ZXFWVzBQVkVkbTJJTUNJcGlsanp5UW1raStzMW9qVCt3dXAz?=
 =?utf-8?B?M2ROdlNiVGtnZUpsWlFkZTIwdWFIMlE1US92N0lJczB6ZjhVckY5VWlHakdp?=
 =?utf-8?B?K0FKcEhVeG5sa2k3TWt2L0lrNjhDZXNWVUhOejVaL2U2ZDJ3enFKOEkrR3Qv?=
 =?utf-8?B?VTNGb1llRXJWdDVTeTN6Sm5rbGNCcjBjaDBKT3A0d3JRL2dhQTlWU1REdHdy?=
 =?utf-8?B?VnVWNVBwV3JYOEwwTTlzTXdsODF1L3hnaEl3dnVxbHJZRHRzazRwdDJ4OXZj?=
 =?utf-8?B?cUJnRzVyNUtDSitvUHBmazNydFZ2ODB5K0N3clpzM3NQUG9Jenh4VDhHQ29h?=
 =?utf-8?B?c2NFSlBmc2tNN09WMEtlSjJMRFgwK042NlhDSGtWU01HcmhsM2xUeGt4RVpi?=
 =?utf-8?B?N3A0UncveDNrRUk2WkNUdlhPVWhWRUFCdjFybEhYRVhtNUZCUm1UUVl5V3Zi?=
 =?utf-8?B?WGIwSnE3TGJvaW9qc1BhdVNoUm9TMDU2aTlFQmhRKzBPdFQrM0dEZUNWdWNy?=
 =?utf-8?B?cU8rQ09jcG5pY1dEdVFIREpEKy95UW1rSmwzSVRFKzNZcmQzSE53c2pPTzIx?=
 =?utf-8?B?TE1nbnB5RUgyQ3kyYys4UjdYcWRsQ09NdkdOamlzTEg3TERzSno1M0l5Mkth?=
 =?utf-8?B?N0FFdkVERFoxbklIOWhsa2NqT09lUXY4UUZaSWp1dmVNVGxPRHJBUVFCam8z?=
 =?utf-8?B?VnV3cmJFTysrTTNjOEtnaGRxdzc0ZGx1ZFRkazgyZkJSczdieHJCWTNMTFNu?=
 =?utf-8?B?TFI0ck1wdUsra3RtbTZwdmdvUTR1WVl4R01uM3NlUS9Fbng4dG4vUjZsMzJW?=
 =?utf-8?B?Ty9KM3ZVb0JYdWFkMzQxTE9KUStRVVN6bFlWR3Z0RU5keHNFSW5vTlhZTTB5?=
 =?utf-8?B?Q0JTMTB3Q3cycUk3OUYxRzhZSFpGMzY3U2tuM1pQNzA3QVE9PQ==?=
x-microsoft-antispam-prvs: <BN6PR11MB13486D6EA1814BBCBA13FD9CF0750@BN6PR11MB1348.namprd11.prod.outlook.com>
x-forefront-prvs: 0962D394D2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(136003)(376002)(366004)(189003)(199004)(316002)(72206003)(7736002)(478600001)(54906003)(6512007)(52116002)(305945005)(110136005)(99286004)(53936002)(102836004)(186003)(26005)(4744005)(53546011)(106356001)(105586002)(6436002)(76176011)(31686004)(6506007)(386003)(68736007)(6486002)(2616005)(81166006)(81156014)(486006)(2906002)(6116002)(3846002)(4326008)(11346002)(71190400001)(476003)(446003)(2501003)(71200400001)(14454004)(229853002)(5660300002)(8936002)(256004)(14444005)(6246003)(86362001)(97736004)(31696002)(66066001)(36756003)(25786009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1348;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jslM8HEN2Sy6wTGb4RIDy6HRNrNLDJZv9FFOvrGyd1pE0QuCHUdfx6xxfgllW8nFfOoEw9NFDLAImnMPG80mCFMRFFFTfRK9tNxpI6I3LmUSLedS/maK+bq9y2kFZC/7PnwZ1Pzj/UEdnPI46f2o+fOH3StMNxzzsPtWER9RZ2ISmcN9tBk781SiCpHNNdqT6PtEA+I+VX8S6z+82UMdZLFJRebRkAQI89rcblcPn24mQed5GME+65p0zTMhfSZauRy1eRqkx1XQ95AaPjKMakMIo8e/MSVyV5qxcZmzc2UaoB0mgwL65Ki2xQ17MeCmdLGv1HezUzrxFAi+gWx7Td0IpDS2OPkRx3V1vkaX/mfdF19Vlllfxny6IuBjAqS4tPQ+dJ92LTg8QzPwTqugf5zDcrz2ddhV/AdjJYHMFQo=
Content-ID: <CF84255B773B904A9376B9C4363832D8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a828d6b5-1438-42eb-5d3c-08d69d9e3974
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2019 17:00:20.1534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1348
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_090031_517214_AD3085AD 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 richard@nod.at, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Alexander,

On 01/24/2019 01:21 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> Optimize erase time by always using biggest erase size for given erase
> request. Do it by removing "sector"-at-a-time erase code.
> spi_nor_erase_multi_sectors() seems to be mature enough to handle all
> the cases better.

Did you check if the upper mtd layers are affected by this change?

> 
> For the above to work backwards-compatible regarding 4-bytes commands
> spi_nor_set_4byte_opcodes() has to prepare them always, independent of
> spi_nor_has_uniform_erase() flag.
> 
> Remainder check in spi_nor_erase() becomes superfluous because
> spi_nor_erase_multi_sectors() performs it anyway.
> 
> The trigger for this change was n25q128a13: enabling SECT_4K increased
> erase time of 128k block from 1.763s to 11.335s.

When needed, one can disable the 4K sectors with the MTD_SPI_NOR_USE_4K_SECTORS
kconfig option. Does this help you?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
