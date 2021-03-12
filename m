Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C870C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:14:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A556F64FD0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A556F64FD0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OEM8SWv/G3W62H4Ii1dEtjuOceFHoiuVwNEu5qrnD+A=; b=CQ+mK0cbSWUY2obu1a/kdNvNo
	TCH2bsMvlU28XvpemswynRvvVSdqARCz4iDO6JqTJ0IN/r9j8PeV4u9bdeYysa9VS0YlIntP+77Cf
	eGp4RWV43ijFJuMXxutsaZ2r6RaOwox3Eb5QxARSNJl6qq65bo3M4dh72B60dfEBV7ySKeMO0xJ19
	kbi7Kgh549eZ/KXbtr6y1KDCQ0KeNxtdJ1z5WbP/aSjtoL23YZt51d8/FssT1iDOtvA6mcq0e2U3j
	2qu74f7TKOB9iwYErssiuLmRvEMbgODUjGPr/yYPtVJF87iM+kow6KVMR3AK+eIeKDY67pHLZikuB
	TMRLdSX7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKdrw-00Ayh7-C7; Fri, 12 Mar 2021 09:14:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKdrd-00Ayd8-1U; Fri, 12 Mar 2021 09:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615540425; x=1647076425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fdqLnqKTtNwoR1f36wiD5y+KhJWQo9dxotLol0VxtyA=;
 b=b7QGamBqg7TY7koR0xdkxTfU1xZJQMZK/7XBgQ6YqzSE0ZSEdTIizntY
 cEaGpYn6c6fRw8IA6upFbpSUcTFGaeaphuCmx+P+fCMIqgiOI1DBfu0LP
 awWTsI7e1vAFewsrDJfZ+AS4fILekaOW17ygDlwaLon6Zo4Kp/BoYMsLU
 00zY/OTcs84/d6tnruBFj6g6hQn4Dt/RKVoPiDY138CkhkfJeaiqSsJ/q
 AmMSPvWrDiVnInPgbODgE3ngDj+z1DShlukDOX5NT0zzywySgHhuzF69A
 MsjSRrvzIM12MIHZI7iIRjC11V2itog/qkJfORmjArxYQkN1DAgJPhYes A==;
IronPort-SDR: ZGmCqik6VeVuSitVMnZMYQYhv2IzN+eE5DfPsYiPldmJZdp2sa3OfwtpHmNBvLS/idAHLvumw8
 PtSd5VpjuTigOXkkflX8crp3dmTJyAEjLTpPOE2R8JJlnR7zBnL9OtY4tGeomEA/jEb+BlHXHK
 UzhF5w06NWzmVDIbpliVXBjMmEBlBALZmsE1NqTuHqVJrW+cyB6VuyBK1M9noNZzqWdOg55NME
 JHw8FRdDLwoeGVD/reobzQMk+On0MrfyHe6/Z7ZUVYfzqCHgN3crhKc4pRDz6y4H/N+2Y/R0hp
 ZAk=
X-IronPort-AV: E=Sophos;i="5.81,243,1610434800"; d="scan'208";a="112478418"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Mar 2021 02:13:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 12 Mar 2021 02:13:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 12 Mar 2021 02:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1wT6GasTkdsSCgfgq1d40AT9c93hF+ID6UE4BZCWXEWMJbsimSVSzGvisaamcGlCqHV3RJh701A1S+bPAKuCxsk0zppNjQIPpLpndzbiskYDAu0SfGZEUs53azhyDg4sJotqaqJmYkrLzwFrob3PbHy4xJsXQhyy1CZTtS2t3xy0AQbgmhfYelgdDZNwZPjp5C2ByD9OHy/zo8VWtiNx9g9mW3s9P8BkJRuMqhEjGjT1MYm2dKMmdwsEXvchsk2BbeVEc7v59SX7iKf3AT60/oKv5A4lliba4Jq8XUulLFwUG5gu0806o32XM8aa9umf++HWrqrI4NNr1pYdiaOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdqLnqKTtNwoR1f36wiD5y+KhJWQo9dxotLol0VxtyA=;
 b=IupT65nPpjWTNEmqVmL+w4LKP/LePSs4KRDLVIQoMpF0aqcCs3Hk6jBar0BI4pWRXmV9cNZj8lUwJa1/JM/SKo+sUxiXiS+BclgDfKeCMJQ+yaSdd3DYaE+2cTXfvqdzxobyDbV6h8SyFwhv74DG4ixs3U049b1Px4pcwnaDYmiyDMpbWeE9fjtB4JaevUswHWYr6YrS1MHMiFOS8CtgOh9mz/0QAhklFLrIsIGVRWwRKwu+h00Anfhx5/BBvva3SA+hviL74K/3FIBDaAidYyN7YI9UOd7KidDT5ztrfXAxFKZR12UhnLkXIkbTnYg8KST/YTAOUS9yCwyuYDRCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdqLnqKTtNwoR1f36wiD5y+KhJWQo9dxotLol0VxtyA=;
 b=bLMZb/U9nGmsN0YBknMdEPmEdtO0xMqReaUVlNDugei72iJX2LtR+v7236g7YX7oLgh47GLHlSIYEETfLBAcgKrUHjCQHKiNeQh5K49lF60spsJrjCziNMmnYDta9SrUcb11KOpiWfnSJATtIuUipjXFaCjsB4W9O5X23RR4fe0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 12 Mar
 2021 09:13:26 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 09:13:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <nm@ti.com>, <kristo@kernel.org>, <robh+dt@kernel.org>, 
 <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
CC: <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 4/6] spi: cadence-qspi: Use PHY for DAC reads if
 possible
Thread-Topic: [RFC PATCH 4/6] spi: cadence-qspi: Use PHY for DAC reads if
 possible
Thread-Index: AQHXFx/1t6yw10JH0U66USRgoCJhOw==
Date: Fri, 12 Mar 2021 09:13:25 +0000
Message-ID: <2f26456e-59ff-2625-5d65-c1537052839d@microchip.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-5-p.yadav@ti.com>
In-Reply-To: <20210311191216.7363-5-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fdc3720-19cd-4678-ef99-08d8e53717ef
x-ms-traffictypediagnostic: SA2PR11MB4793:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB479331A4C6215AD578D2523DF06F9@SA2PR11MB4793.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6OjVx5nkJaeAw4mCxfnITtN3NeRglwYQrLRZzLliG/cT8fuT7aPSuAFyKH0nVKjHEz9tapWUZxsaWq/5kB/U51STbHew7GARJi5BYTl5vkJgjte/I2zR5o+f5E7YHWqu2VO+X3TtoP7XT30GwSvRLDmtE9CvCrTpj1nEKkutz7R8Y30rsmowgBG8aDlv7pCs00a/givPcW+gzfw9tCUc/pJq6jWJ7UfPSjJBl6WwFL3Fpp9FTwtFxbfzJdtWQjtaVpjhH9v5nk+mSWEWJ/96aMWShitNUR8DO/DcqmKM4/EDa/Y35/kvfx3lZr58efKjjSHIG3BHGL5eIHDUDjeD/vRsu170YzeEA0vCsTmlmv3u6oew8d1bD0KGmb7OhH7GRsccENo1nnLlNnVPgaQU4oZqwJdKq8wBFKlS8sVuOkx1qEc+Og3Lf52r+vcf3lcAOWWPQSsDpi+UN2pFAgc4qA5CNNtgHPwF539E/z0AQlKLbkKOhFYHowe7aRere26lg9wAY3Hpa3e4c0iyQ0yzKFZs/eQDn4LUfzlpine0xnd7/I0W3V9/krbFqKMlr4SfeRkt6bI61pVb8D7lVEOZQvXDJYz+cqZnUdb0aOUsuOu7tqqCllyqRNfRSyOA7Vwf/lHc06XD+4LezbxKYWzb/cQ8hEAKLk23LxmRjseUs65UMm9MEhmswDfndp5T5Q5OpX/Nd54QQzCsqgUzwrsiTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(376002)(366004)(346002)(64756008)(53546011)(36756003)(71200400001)(86362001)(76116006)(6506007)(966005)(186003)(66946007)(31696002)(91956017)(2906002)(8676002)(6512007)(316002)(6486002)(66476007)(110136005)(921005)(66446008)(66556008)(478600001)(4326008)(2616005)(7416002)(8936002)(83380400001)(26005)(5660300002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NHdBQitzSG1FR3JCOUVUajQxZHF5K2V2emRvd3djS2hZeW9XUDE5UkxSd3o4?=
 =?utf-8?B?V2ZHRGM4WHllTE5ObnpLNk5rRVhxWXRVbHl6TGtTODh4UmdJMXZpV2pPNThm?=
 =?utf-8?B?OEs2L1p5WVJhQTc5Yzg5WDVYdno3WFpNL2lBWVV1aE1mVXhRQ2hteTNkTUpU?=
 =?utf-8?B?STlLTFlPRHc4eFlnOE53Y2VRVlM4aVJ3Q09qVTdwR25WajhCdUkxVlZGR1VB?=
 =?utf-8?B?Yll3eWFmRDk3N21XTkViTGpZdTN0STBHOUJha1hsSmNBcDdqc2ZPVVlCMGY3?=
 =?utf-8?B?b3hpTklkWTZQb3l5Q0NTNnlDc1dIS3FaMWFtbkhxYUtLdTcvNWpHNUpnUGdD?=
 =?utf-8?B?VnA5WEdSSFFnd1p1UHVldkcxTHhJdmw3bEJUZnlzS0RlQUFUMkF3VnR3M1pU?=
 =?utf-8?B?LzljdGZrcTF2SEsxdHVZNkZ0Tnk3TmtSZDlZanBsYVRPajBudGkrbkxEQ3NU?=
 =?utf-8?B?akFuYzY5WlNlcURHNVBXY0ViQnplNkMzaGNiUTF6MysyZXJ0S3FRdEZvOVV4?=
 =?utf-8?B?bmY4ZFFzU0VJaVpSaFRRaG0vNmNiMmdaRGgxZ09QUDVpMnA4WHVkYkhWZElB?=
 =?utf-8?B?RTRFY3I5VkliUlRsbTZjai9jYUtiZldKNHlMQjI0YXowZnRCQnRwODNPZkUy?=
 =?utf-8?B?YmxFM1R5WGh2NmhQQzlQVXU2U2Y1RG5SR0xoR3kvT004UC93UGhKZG9NSHlE?=
 =?utf-8?B?Z3U0Yi9remRHWTQrUmwzbnZsVEZxMHVSVmZZK1N4RW8wL2VIdDcvOWRjWC81?=
 =?utf-8?B?V2xnSWE3UUtUR1EzZlRIdG5vZEVWMXptVTJCTWM2YXBnUTIveHNSZEJtRk8x?=
 =?utf-8?B?SEQxZjVUaGdMWnhTd2UzbU5KMUlMQXpYNys2ZXI0L0dJeVVJN3NjZ2pHN1Bs?=
 =?utf-8?B?RjQ1Zi9PVisvZWVsZk5iNmJkMjZ0Y2xlN2tuUEcvbGNFb3FNQTNlT3YzZm9w?=
 =?utf-8?B?akFrOWpuZU1PU1gvaVlxWFk2OVE0a3FDMzJkVzVOQUYrVi9lb2NMT0UzZERC?=
 =?utf-8?B?RURuUkQ3Yk9pcFFtMzFjNlZUL2FXT3ZaN0puM0FmSVYwQTNzZ3AvZ1g0Y3Bj?=
 =?utf-8?B?R3o3ZHJMM3VLQ3FBb3JWMU00WTN4OUpBNHFZdEo1YjhHV21TaXhNa245RkNo?=
 =?utf-8?B?NzdTQWlOYkM1VGFvOTB4aktHL0xGeE43RFppMHN2UWVabEtyZ3diWWFHRktL?=
 =?utf-8?B?TjhGTGpac1lKUjlrYnhXMWZHdGpyYWFHTjJtWThqdi93QSt1UXNsYjlDSm1u?=
 =?utf-8?B?Y3JOQzBZTEp4ZlpJRFd2WHJ4VW5Qa1FFSUdKOFovc01QWFJQMzBKR3dMa0dP?=
 =?utf-8?B?MVNkMmtQd0R2Z3BLWHZJaUJBS3hQWkRQMml3R0NPTWlEWnhTYXQ0bytJc3Fz?=
 =?utf-8?B?c0NsZU1LN2s1MmhJT2xaeGtRL2tXWW5xTG9aKy9RYkxLLzVXZmtWbEJCdWNR?=
 =?utf-8?B?eStHWnkwekxRb1JxUkRYMjdYVTNpN1VvMUZjOGZCaS84TEV5UW85MHplcTdB?=
 =?utf-8?B?TjIvTDFiM0xySFJZRzliOU9TUisrcllJc0hsdkY4WE5uYzZ3bjZHbGh6K3Qz?=
 =?utf-8?B?Qk01cUtUcURMVlhyNGZUdnRIdW02M3hEQ2dHdk1PWXlNZnpyek12ZmgrdGRQ?=
 =?utf-8?B?a0oyVlZEbE13SzI4cm4wQjBPRVhMRTdGd3E4UFI1UzBNeEhMWXhQSXQwOWl3?=
 =?utf-8?B?UWUxMGlsWGRXdnNaaGhkNGxHbk9CWDVVYlVTbDNtZm1nYUpmTU1RQTJxbGhz?=
 =?utf-8?Q?Ad1dBEiFIQBKp7P9dM=3D?=
Content-ID: <8F796340E8791F46991D8C6A984E1E0A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdc3720-19cd-4678-ef99-08d8e53717ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 09:13:25.9631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7Hv6RtXpv4w1npOElNJXeLnkaqnyHn9wIkeoumPcYtpNMb5S/u1VOVSE5epSXKhtpaFM895QJ3TySj0p9Q72npHuApEKqWTb2m6iiFTtPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_091346_383286_19765BFC 
X-CRM114-Status: GOOD (  20.15  )
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

On 3/11/21 9:12 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Check if a read is eligible for PHY and if it is, enable PHY and DQS.

DQS as in data strobe? Shouldn't the upper layer inform the QSPI controller
whether DS is required or not?

> 
> Since PHY reads only work at an address that is 16-byte aligned and of
> size that is a multiple of 16 bytes, read the starting and ending
> unaligned portions without PHY, and only enable PHY for the middle part.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/spi/spi-cadence-quadspi.c | 203 ++++++++++++++++++++++++++----
>  1 file changed, 182 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> index e2d6ea833423..e64d8e125263 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -41,19 +41,27 @@
> 
>  struct cqspi_st;
> 
> +struct phy_setting {
> +       u8              rx;
> +       u8              tx;
> +       u8              read_delay;
> +};
> +
>  struct cqspi_flash_pdata {
> -       struct cqspi_st *cqspi;
> -       u32             clk_rate;
> -       u32             read_delay;
> -       u32             tshsl_ns;
> -       u32             tsd2d_ns;
> -       u32             tchsh_ns;
> -       u32             tslch_ns;
> -       u8              inst_width;
> -       u8              addr_width;
> -       u8              data_width;
> -       bool            dtr;
> -       u8              cs;
> +       struct cqspi_st         *cqspi;
> +       u32                     clk_rate;
> +       u32                     read_delay;
> +       u32                     tshsl_ns;
> +       u32                     tsd2d_ns;
> +       u32                     tchsh_ns;
> +       u32                     tslch_ns;
> +       u8                      inst_width;
> +       u8                      addr_width;
> +       u8                      data_width;
> +       bool                    dtr;
> +       u8                      cs;
> +       bool                    use_phy;
> +       struct phy_setting      phy_setting;
>  };
> 
>  struct cqspi_st {
> @@ -108,12 +116,14 @@ struct cqspi_driver_platdata {
>  /* Register map */
>  #define CQSPI_REG_CONFIG                       0x00
>  #define CQSPI_REG_CONFIG_ENABLE_MASK           BIT(0)
> +#define CQSPI_REG_CONFIG_PHY_EN                        BIT(3)
>  #define CQSPI_REG_CONFIG_ENB_DIR_ACC_CTRL      BIT(7)
>  #define CQSPI_REG_CONFIG_DECODE_MASK           BIT(9)
>  #define CQSPI_REG_CONFIG_CHIPSELECT_LSB                10
>  #define CQSPI_REG_CONFIG_DMA_MASK              BIT(15)
>  #define CQSPI_REG_CONFIG_BAUD_LSB              19
>  #define CQSPI_REG_CONFIG_DTR_PROTO             BIT(24)
> +#define CQSPI_REG_CONFIG_PHY_PIPELINE          BIT(25)
>  #define CQSPI_REG_CONFIG_DUAL_OPCODE           BIT(30)
>  #define CQSPI_REG_CONFIG_IDLE_LSB              31
>  #define CQSPI_REG_CONFIG_CHIPSELECT_MASK       0xF
> @@ -150,6 +160,7 @@ struct cqspi_driver_platdata {
>  #define CQSPI_REG_READCAPTURE_BYPASS_LSB       0
>  #define CQSPI_REG_READCAPTURE_DELAY_LSB                1
>  #define CQSPI_REG_READCAPTURE_DELAY_MASK       0xF
> +#define CQSPI_REG_READCAPTURE_DQS_LSB          8
> 
>  #define CQSPI_REG_SIZE                         0x14
>  #define CQSPI_REG_SIZE_ADDRESS_LSB             0
> @@ -999,6 +1010,7 @@ static void cqspi_config_baudrate_div(struct cqspi_st *cqspi)
> 
>  static void cqspi_readdata_capture(struct cqspi_st *cqspi,
>                                    const bool bypass,
> +                                  const bool dqs,
>                                    const unsigned int delay)
>  {
>         void __iomem *reg_base = cqspi->iobase;
> @@ -1017,6 +1029,11 @@ static void cqspi_readdata_capture(struct cqspi_st *cqspi,
>         reg |= (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
>                 << CQSPI_REG_READCAPTURE_DELAY_LSB;
> 
> +       if (dqs)
> +               reg |= (1 << CQSPI_REG_READCAPTURE_DQS_LSB);
> +       else
> +               reg &= ~(1 << CQSPI_REG_READCAPTURE_DQS_LSB);
> +
>         writel(reg, reg_base + CQSPI_REG_READCAPTURE);
>  }
> 
> @@ -1035,6 +1052,64 @@ static void cqspi_controller_enable(struct cqspi_st *cqspi, bool enable)
>         writel(reg, reg_base + CQSPI_REG_CONFIG);
>  }
> 
> +static void cqspi_phy_enable(struct cqspi_flash_pdata *f_pdata, bool enable)
> +{
> +       struct cqspi_st *cqspi = f_pdata->cqspi;
> +       void __iomem *reg_base = cqspi->iobase;
> +       u32 reg;
> +       u8 dummy;
> +
> +       if (enable) {
> +               cqspi_readdata_capture(cqspi, 1, true,
> +                                      f_pdata->phy_setting.read_delay);
> +
> +               reg = readl(reg_base + CQSPI_REG_CONFIG);
> +               reg |= CQSPI_REG_CONFIG_PHY_EN |
> +                      CQSPI_REG_CONFIG_PHY_PIPELINE;
> +               writel(reg, reg_base + CQSPI_REG_CONFIG);
> +
> +               /*
> +                * Reduce dummy cycle by 1. This is a requirement of PHY mode
> +                * operation for correctly reading the data.
> +                */
> +               reg = readl(reg_base + CQSPI_REG_RD_INSTR);
> +               dummy = (reg >> CQSPI_REG_RD_INSTR_DUMMY_LSB) &
> +                       CQSPI_REG_RD_INSTR_DUMMY_MASK;
> +               dummy--;
> +               reg &= ~(CQSPI_REG_RD_INSTR_DUMMY_MASK <<
> +                        CQSPI_REG_RD_INSTR_DUMMY_LSB);
> +
> +               reg |= (dummy & CQSPI_REG_RD_INSTR_DUMMY_MASK)
> +                      << CQSPI_REG_RD_INSTR_DUMMY_LSB;
> +               writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> +       } else {
> +               cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
> +                                      f_pdata->read_delay);
> +
> +               reg = readl(reg_base + CQSPI_REG_CONFIG);
> +               reg &= ~(CQSPI_REG_CONFIG_PHY_EN |
> +                        CQSPI_REG_CONFIG_PHY_PIPELINE);
> +               writel(reg, reg_base + CQSPI_REG_CONFIG);
> +
> +               /*
> +                * Dummy cycles were decremented when enabling PHY. Increment
> +                * dummy cycle by 1 to restore the original value.
> +                */
> +               reg = readl(reg_base + CQSPI_REG_RD_INSTR);
> +               dummy = (reg >> CQSPI_REG_RD_INSTR_DUMMY_LSB) &
> +                       CQSPI_REG_RD_INSTR_DUMMY_MASK;
> +               dummy++;
> +               reg &= ~(CQSPI_REG_RD_INSTR_DUMMY_MASK <<
> +                        CQSPI_REG_RD_INSTR_DUMMY_LSB);
> +
> +               reg |= (dummy & CQSPI_REG_RD_INSTR_DUMMY_MASK)
> +                      << CQSPI_REG_RD_INSTR_DUMMY_LSB;
> +               writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> +       }
> +
> +       cqspi_wait_idle(cqspi);
> +}
> +
>  static void cqspi_configure(struct cqspi_flash_pdata *f_pdata,
>                             unsigned long sclk)
>  {
> @@ -1056,7 +1131,7 @@ static void cqspi_configure(struct cqspi_flash_pdata *f_pdata,
>                 cqspi->sclk = sclk;
>                 cqspi_config_baudrate_div(cqspi);
>                 cqspi_delay(f_pdata);
> -               cqspi_readdata_capture(cqspi, !cqspi->rclk_en,
> +               cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
>                                        f_pdata->read_delay);
>         }
> 
> @@ -1098,6 +1173,39 @@ static ssize_t cqspi_write(struct cqspi_flash_pdata *f_pdata,
>         return cqspi_indirect_write_execute(f_pdata, to, buf, len);
>  }
> 
> +/*
> + * Check if PHY mode can be used on the given op. This is assuming it will be a
> + * DAC mode read, since PHY won't work on any other type of operation anyway.
> + */
> +static bool cqspi_phy_op_eligible(const struct spi_mem_op *op)
> +{
> +       /* PHY is only tuned for 8D-8D-8D. */
> +       if (!(op->cmd.dtr && op->addr.dtr && op->dummy.dtr && op->data.dtr))
> +               return false;
> +       if (op->cmd.buswidth != 8)
> +               return false;
> +       if (op->addr.nbytes && op->addr.buswidth != 8)
> +               return false;
> +       if (op->dummy.nbytes && op->dummy.buswidth != 8)
> +               return false;
> +       if (op->data.nbytes && op->data.buswidth != 8)
> +               return false;
> +
> +       return true;
> +}
> +
> +static bool cqspi_use_phy(struct cqspi_flash_pdata *f_pdata,
> +                         const struct spi_mem_op *op)
> +{
> +       if (!f_pdata->use_phy)
> +               return false;
> +
> +       if (op->data.nbytes < 16)
> +               return false;
> +
> +       return cqspi_phy_op_eligible(op);
> +}
> +
>  static void cqspi_rx_dma_callback(void *param)
>  {
>         struct cqspi_st *cqspi = param;
> @@ -1105,8 +1213,8 @@ static void cqspi_rx_dma_callback(void *param)
>         complete(&cqspi->rx_dma_complete);
>  }
> 
> -static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
> -                                    u_char *buf, loff_t from, size_t len)
> +static int cqspi_direct_read_dma(struct cqspi_flash_pdata *f_pdata,
> +                                u_char *buf, loff_t from, size_t len)
>  {
>         struct cqspi_st *cqspi = f_pdata->cqspi;
>         struct device *dev = &cqspi->pdev->dev;
> @@ -1118,11 +1226,6 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
>         dma_addr_t dma_dst;
>         struct device *ddev;
> 
> -       if (!cqspi->rx_chan || !virt_addr_valid(buf)) {
> -               memcpy_fromio(buf, cqspi->ahb_base + from, len);
> -               return 0;
> -       }
> -
>         ddev = cqspi->rx_chan->device->dev;
>         dma_dst = dma_map_single(ddev, buf, len, DMA_FROM_DEVICE);
>         if (dma_mapping_error(ddev, dma_dst)) {
> @@ -1164,6 +1267,64 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
>         return ret;
>  }
> 
> +static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
> +                                    const struct spi_mem_op *op)
> +{
> +       struct cqspi_st *cqspi = f_pdata->cqspi;
> +       loff_t from = op->addr.val;
> +       loff_t from_aligned, to_aligned;
> +       size_t len = op->data.nbytes;
> +       size_t len_aligned;
> +       u_char *buf = op->data.buf.in;
> +       int ret;
> +
> +       if (!cqspi->rx_chan || !virt_addr_valid(buf)) {
> +               memcpy_fromio(buf, cqspi->ahb_base + from, len);
> +               return 0;
> +       }
> +
> +       if (!cqspi_use_phy(f_pdata, op))
> +               return cqspi_direct_read_dma(f_pdata, buf, from, len);
> +
> +       /*
> +        * PHY reads must be 16-byte aligned, and they must be a multiple of 16
> +        * bytes.
> +        */
> +       from_aligned = (from + 0xF) & ~0xF;
> +       to_aligned = (from + len) & ~0xF;
> +       len_aligned = to_aligned - from_aligned;
> +
> +       /* Read the unaligned part at the start. */
> +       if (from != from_aligned) {
> +               ret = cqspi_direct_read_dma(f_pdata, buf, from,
> +                                           from_aligned - from);
> +               if (ret)
> +                       return ret;
> +               buf += from_aligned - from;
> +       }
> +
> +       if (len_aligned) {
> +               cqspi_phy_enable(f_pdata, true);
> +               ret = cqspi_direct_read_dma(f_pdata, buf, from_aligned,
> +                                           len_aligned);
> +               cqspi_phy_enable(f_pdata, false);
> +               if (ret)
> +                       return ret;
> +               buf += len_aligned;
> +       }
> +
> +       /* Now read the remaining part, if any. */
> +       if (to_aligned != (from + len)) {
> +               ret = cqspi_direct_read_dma(f_pdata, buf, to_aligned,
> +                                           (from + len) - to_aligned);
> +               if (ret)
> +                       return ret;
> +               buf += (from + len) - to_aligned;
> +       }
> +
> +       return 0;
> +}
> +
>  static ssize_t cqspi_read(struct cqspi_flash_pdata *f_pdata,
>                           const struct spi_mem_op *op)
>  {
> @@ -1182,7 +1343,7 @@ static ssize_t cqspi_read(struct cqspi_flash_pdata *f_pdata,
>                 return ret;
> 
>         if (cqspi->use_direct_mode && ((from + len) <= cqspi->ahb_size))
> -               return cqspi_direct_read_execute(f_pdata, buf, from, len);
> +               return cqspi_direct_read_execute(f_pdata, op);
> 
>         return cqspi_indirect_read_execute(f_pdata, buf, from, len);
>  }
> --
> 2.30.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
