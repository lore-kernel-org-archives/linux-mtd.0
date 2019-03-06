Return-Path: <SRS0=kH4D=RJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8F7C43381
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 11:29:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1983020675
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 11:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwPuE51J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YeXECi7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1983020675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxShb0Zp4mpzVAQ1GnVj9R/nbgK4siELdqyb+4XzuVU=; b=uwPuE51JmSK8yR
	CvTOeah3HXBuOLSD42NAZ29pVCA26+7mBNQ+o+bD87gkvoB+Vn8TienhCnz38NGZsA0rudm2qhrSR
	RCAvQUzGif5XywEpkfFyi4Zwz9LIE79iOcQ6Q1aH1YAu5mBpHLNThWQh/Z+GDo9wSAWD63Sy6pH5C
	VkqmPe4NPwVojDZFpqcKjAqrPDfuUw0mojiLZWX+LH19mdInQRK8zleIbdJEp3rEW7bkwu99qD2cN
	+KUSge1Qh2iyYr4a5hTOyHT2iPGeJ8w4FktZQnqfV9S6aAQDU3f4ZDU+EePxQtu/O6vNNa5fvzx6P
	0Xf114gCiH05yZtL2q2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1UjS-0005j7-Kr; Wed, 06 Mar 2019 11:29:06 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1UjO-0005hr-Db
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2019 11:29:05 +0000
X-IronPort-AV: E=Sophos;i="5.58,447,1544511600"; d="scan'208";a="25700587"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 06 Mar 2019 04:29:01 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 6 Mar 2019 04:28:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuwPSkSYfP4VAcIhmZyKUlZpXvD819zuhyRMj+/kjxw=;
 b=YeXECi7UqxblhJf5ixTrEv+kzvvgdYeEOhPUmyYBN8M7oNyFKOFnxhMrUzHV/ov5TIiV269Spk9pEpO0JkvgA5PjMeKBBPOf25sQabqYpVQGWHnKyxps8k0dwwM/K4Qne5JW6tuopMtidDroC2rN/ERoVZuUis0GXPgl3NtK7aA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB0066.namprd11.prod.outlook.com (10.161.154.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Wed, 6 Mar 2019 11:28:56 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1665.019; Wed, 6 Mar 2019
 11:28:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>, <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Topic: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Index: AQHUrcRvVk/NwsnjPU6u4yY8M2eQPqX9XVmAgAFmooA=
Date: Wed, 6 Mar 2019 11:28:56 +0000
Message-ID: <d19baddf-1409-d92f-4f5b-17a17dfa6fd8@microchip.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
 <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
In-Reply-To: <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0116.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::14) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f70a82a9-5c54-43fe-5af2-08d6a226eb5b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB0066; 
x-ms-traffictypediagnostic: BN6PR11MB0066:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIwMDY2OzIzOmd4d05BR2V1c2FXN1NiblRnREFLQWpDWnlT?=
 =?utf-8?B?K1hsZUFwbUNkcUUvYmI0UW9ITXFyOVFkZHIvbW9kWWhpQ20rc01MSURCT3g3?=
 =?utf-8?B?UGY2Wk92K254MnlkNG9RV0FNVXI0blVQTm10MmptQXg2V29OdDE2eGNncTFV?=
 =?utf-8?B?dnVkaStXbUlSdlBPUktKd0tFOE9FZzUzOXNYUTFYT0t5VStiS3NZZE5wV2hx?=
 =?utf-8?B?dHpxQUttZkwzZXdxQUJ4QjBxRDMrNmNJMm51SDdzYVEzeVBtNW9uK3FBYjZv?=
 =?utf-8?B?eTd6VWtSZFU1a0VRK0ZHVy92enF2ayt1VmdNZkNRalh2T0dYSGs0Sk1LajZm?=
 =?utf-8?B?U2lnZFFsWXNpUTRZeFA0SFArd1BnaldHQ1lIM2xKQWtRT2t4cHZEUXVnS2Ru?=
 =?utf-8?B?US9oOHc1bktRZzZNNC8zdlVFWUU4bnF1azdFamQraWliOEtqZUxLQmNuOHox?=
 =?utf-8?B?SmpOMGNGaW1XbVZvRW16RlRjdmZnaGRndlllaTg2eXBZOERSUkg5TmNLQjVw?=
 =?utf-8?B?YU5aSUV0ZFFmZi9pZnNSQ0RyQk1HdjFQVnp1MFFBYTZnN0tjMnRKdTdLS0Vm?=
 =?utf-8?B?QWYwRnRoMEFwVzFvT2dzZzhoNjQ1dDVXcUhvRHFHd25oN3VaT3lVQmV3TURn?=
 =?utf-8?B?aXZUaW1uaFZTNTlrb1Z1UVROUHlHOWlNT3ZkdXArZzE2OXNUTURWM2hTRzdY?=
 =?utf-8?B?T1pTT1dGbzJlYjN0OGlmZDlWMDIyUXR6RThMQkVnb095QXRvSUoxVWY1U2Ur?=
 =?utf-8?B?R3NoLzFVdktheU9zVDdzZ011c0hCREk2djZRWEROaGQyemJZQTh4TXNRcVM5?=
 =?utf-8?B?bldtRUF4V1hFU2NpbEdCWUxxUUZyNGJFeTlNN1oybjN4VTV0Qy9tUm15NUNo?=
 =?utf-8?B?RU5rS3d2N3AvYkVEeHhTcHE2Q3luOXVSaFlSSEs4N3BBd3l3ZlRKVlNlMjlL?=
 =?utf-8?B?eXFMYkRCY0dZekVWZjYySW5qVGxQM2JTUFl3TU5FdklKVTdTNW5mMHBSa1hk?=
 =?utf-8?B?WXd0My9zSWVWWnY1UWlxQlZ1ZUc0Mko2TVRaNm9uWGR4Z1lkUmp6OGVmdU5T?=
 =?utf-8?B?NktTZ2NqZFd6QXpjTmZHaXVYdWFTbDBiZTFDVFREK2UydWs0elB2OHFKZFV2?=
 =?utf-8?B?eENLZjY1VGJ4R0tpdXE4bVFCRmNKekVmZ0VXd2JaVlpsOXlkZWtxY2Nwd2lv?=
 =?utf-8?B?MElVRWt1Qkp2WUZFajVJZFU4UVlCUTRYS2dZeU9NdTBHS002Z0g5eFk1VzZk?=
 =?utf-8?B?NExLTTE5SVVJUVl2VHFZSHJPdGVKbmZrTFo5TUxVOE1VRzlBYzFFVGNBdnNl?=
 =?utf-8?B?S0R3aHBLVm1qZXlvRDhPQ2E1WmlNaGVockM3RGJzMlNNNkJVRjRvTkZ0bUVq?=
 =?utf-8?B?emdDVEhmSk9CRndIR2RyN0o5UGRsMjZQV29DNmpFZzJscVJDY1RscG91aUov?=
 =?utf-8?B?N0NnTVJ4WHV2WlRKQmtZRWtKZUhpSk9JM1lvR2h5NlJNTEZJMG9PelFmenhi?=
 =?utf-8?B?YTg3UlVtbCt0UzA3VFhGWkZEelJLZlJSZ01yMm40NitRZE9hZlJ4cmRrT2pi?=
 =?utf-8?B?QlF4LzlsUGZhdlVlZEszaTZHV01mSE5kV0hUeTB4c3hvNS9ya2F0ZTd1bVRo?=
 =?utf-8?B?bUdQTk1mZUVUaDFhSnVCTmsyQ2VpZUY1dWwvckFMaGlsV1FLMTQ2MitQZk0x?=
 =?utf-8?B?a2Rlam9qenc1ZVM0VGVIVmw1bHBHRFF3SjcyOXovelNUUTB2UEdkU0x2MXhT?=
 =?utf-8?Q?tH/XjFQ8Z1snR4VFA3B1ij5bk9OQMmZzWEONk=3D?=
x-microsoft-antispam-prvs: <BN6PR11MB0066A658B796E46EB9E6C74CF0730@BN6PR11MB0066.namprd11.prod.outlook.com>
x-forefront-prvs: 0968D37274
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5660300002)(72206003)(7736002)(305945005)(386003)(8936002)(76176011)(6506007)(478600001)(102836004)(54906003)(558084003)(106356001)(105586002)(256004)(52116002)(86362001)(14454004)(31686004)(68736007)(31696002)(186003)(81166006)(81156014)(110136005)(8676002)(97736004)(446003)(11346002)(6436002)(3846002)(66066001)(6116002)(53936002)(99286004)(316002)(71190400001)(6246003)(229853002)(71200400001)(36756003)(6486002)(26005)(4326008)(53546011)(25786009)(486006)(6512007)(476003)(2616005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB0066;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xn20w7CU9kFKdTgnM3xnM9mBtxubUvI/8Dva5bOM0aI0XwTPGx1zlB9LgytvHPVDjh0wDFL6Ht31zp+doF07qsQQBzMjTocygHXaUrlBqePzMGbQELPOX3Qroza+RRnqntCY8lSrrPqXRY0LsqEEQZNyD6gy8LaeEz5j807RKwc0dbGgAGNO/gzTlwx/oJWCChYxvIpl3dQgJLcguCmf0VSWJTCdkW1oC9kEdAKpTiGfZ+5azFlqiffSHXDRXkbwVip2htNaS4RcRsUMFL7jwRH3+0Z4jBT5zAyBd5Id8zYorQGMQ6EOBTZvaT8Y7xZJITg3LotMBeXVz3Da776bW39cWsJCHOgUofbzyyEZVcFBUNGwhHxA1LUzHo728IUPZBsdKUlTX+flueLNM4lNGbhO+IqNW2+A2G1iToTPFU4=
Content-ID: <E59020E3C0B29645AA9245DA842FD64B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f70a82a9-5c54-43fe-5af2-08d6a226eb5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2019 11:28:56.3766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0066
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_032902_568780_B6D856BF 
X-CRM114-Status: UNSURE (   5.78  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-renesas-soc@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 03/05/2019 04:05 PM, Geert Uytterhoeven wrote:
>     +m25p80 spi0.0: unrecognized JEDEC id bytes: 01, 02, 20

side note: first 3 id bytes are correct, we should print all id_len bytes on error.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
