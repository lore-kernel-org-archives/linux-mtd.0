Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578B3606A31B
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FhKJTDOb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BEbBpdqAxSYBc90iM8fpWrUETaB7ALgy9zp6HJxzWbc=; b=FhKJTDOb32t5iOF42Yjj+GLq8M
	t+Q+jxDxigdjIZzAI3onyDyxMh+dd2gtwFcXEjEBgId9Bsk0GgJOdX7t6P6aX/a4VrCjpxU420QdH
	oQYf8W4Jul0C3jIyPpMEMkwlVqIwrP+FvVxCEgLCM992nSbFiwjDrthjv9ymTLo28Z9sW9At/rhac
	howbu/nHxJulKyhaf9aqCWPFQciLKWJTf8nGDtldKofsVO0brz4cm/g29oxkb2/ggmTlX1B8kDpZJ
	U4NEU0TxJRXrNF/o+OxI6B8r/+0+42dBPB6Y8AlFiStqKXtvjQ7BMZLmuSdpdRwFHCGZAz79b98xd
	UqixT8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBo1-0000000G4JY-3DNk;
	Fri, 23 Oct 2026 09:43:21 +0000
Received: from mail-sh0chn02on2114.outbound.protection.partner.outlook.cn ([139.219.146.114] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBnx-0000000G4IN-45YD
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 09:43:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNk3fqhMEPlob7Ulrmti4sym3crq3raNE+Lwx+j9uKRX5BwzP9gyH1CMMXZpLIrakFSK1G51rq2vwNbMgTtnTFJAxMx1GWTTJfqmjlB28VJE9cCmBDhc4nJVv4v/aHHIeBJ7tY3CVLcl1FPuB6BolHppXhlJEDZ1SAirB0+ik/TlR2Fy9L/K3pAcjikgqxgx92UhzkNYliMWQ/Zezx3rXNc8NHH8UKyCRUeldoBu7QjUYYUmLm4UFt4E4yuCs6AdURRfoHlzjUM5pqb5KxMfDft7Rm2eYCkjLmO+Cqf7A2gejy1DKIaK2gLuRN7PNi0PpPE4gwIY9iloL1ecH6IwOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSMZ0ATQoMLyX8up0JwHEaAZh1U0fNciko98yR1SdU8=;
 b=aO8eQAMpZLBgR7Pt5ywzagFV7JsiYrAmQXigyYxl7rG52mtUJAFM8Qh8j8MHe/PJdyzcBTLZAQzL90hI6rakTvFkGfvBfQA2W4QNLxhLJP+WUfj/6atr4l8X1ubM27G+b/S/1e1G0m6c4Ei/pOVvBDyyoG/fjA8DQI67KsSSJPyXemgzIZIZvHKjqHHEwsZ48Q5kbtFzlwozzMuj2mVkLk7OnHliWvCf88QcV7SJcARiR9S8cO5VMKHRijXzWHgV2W4tzOH0bt0R+Mn8UyQDbqrXWW9ka8ypVZw79tCo47C3xBzT1cxbSkodralqQJwlCj+yccKi1edess9NfVcWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 09:42:56 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0546.017; Fri, 23 Oct 2026 09:42:56 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Mark Brown
	<broonie@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1 1/4] spi: dw: Add DDR (Dual Data-Rate) support for
 enhanced SPI mode
Thread-Topic: [PATCH v1 1/4] spi: dw: Add DDR (Dual Data-Rate) support for
 enhanced SPI mode
Thread-Index: AQHdYg/J0rdlsgMyL0SIJwAb/cmFb7cJX+ZJgAGBvHA=
Date: Fri, 23 Oct 2026 09:42:56 +0000
Message-ID: <ZQ4PR01MB1202C6B2531173B2D395C619F2642@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
	<20261022102614.75696-2-changhuang.liang@starfivetech.com>
 <87bj8mqaof.fsf@bootlin.com>
In-Reply-To: <87bj8mqaof.fsf@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
x-ms-office365-filtering-correlation-id: 32033548-ba0f-486e-2eb1-08df30ea0448
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|38070700021|4143699003|56012099006|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: O9/oj8f4dg1ctoFttT3er/rrpU1KvhZlj2D4IdayZhBNIWA2cHjQVbXIGusNvT8gIlCC08crZXSECONnyvslpJGgS2vlxxNzj/MPwvqIUINCGDZ+mv9IE2szdCsxUGSwnt+0YB2ihjA/c0sG8GC8GG/jnoY4iD19u4O4BDiW81tG99H3gEv2dzpeXzHLQtMtkAio1rVFfOAG3T7PGZRT/9UjkcTnSTfVHfptECTy9lP0PdmOtJTp7uizSux5kL5L7bRGgnEn/Gt8ZbHQrEedFBNigyf8p3P5p8qDlYtlGFqjPtBrLYvM7OC/XN6c1DsTHcsiZtjscHlN1pp+PbKoHEedf3dRW5/eUbrI8L0nRkRGCK/5tT7S8xsOavg66wbZPOwEAv34aQxr9NOpFTTGko+YsXBrOeN1dW2R4Uuud1px3mAJIyOaRvFrDuq2Yy9BgnxffbE3BeY5vumGAk6vuK0/1nl4l6tGNZuBm45yUD4gZIOKiBHN3kQcBPTBzVwAZTgXK4ms7NRJbC8ZU3rtK4m1DAA/e/ib74O5DSeuFab+FqS948XdhEpdj2u4sHPq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(38070700021)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VG50ZHlIUCtGUURIUld5alNITGZoZHIzRG14NXBpQlJueFBENDN3L09aVEFH?=
 =?utf-8?B?R0diU1hXZXVMWi9Gd2ZpUVNpK2pEbVRFQVUvUHJBbFg2NWJwOHNURUtBc25M?=
 =?utf-8?B?ekFGdHZKWDRkU0J1ZE9nY2dGb2dyTlZ6RDhxeGlBVWNlSlloSmtnNUlrUURq?=
 =?utf-8?B?YVJzTGxjRXdGelBSVHJBM1NnSUMyWXBydlFJb1hVdW0vT0F0TFRSWGZ1VE9Y?=
 =?utf-8?B?UWo1TG94OGVaVDZ6NFVYWnlkNjdpdTh0K29mTXl1RElvUWd3eHR0cjZGTTlD?=
 =?utf-8?B?UVk2dk94dWNoYWRvaXdIOWdBekI0a2JnWjYvbkVMUS96VkVwK255cXh1NDRD?=
 =?utf-8?B?cHNsTDE4azY1djlYdXBrelZRaFNHN3l6L3Z3c2JnbzMydWlCc29jWjA4enZl?=
 =?utf-8?B?ckZiL3liSnBENHhkMC9MSDlDSzFSVXd1N3NDZEJNd09wTjNCZkNtQU1lTkhY?=
 =?utf-8?B?OTVQdVdpdzU1Y2w1OUVDQU0ya21SbjdPaXlQanZSUjJ1eWpPRU5DRG9xTERy?=
 =?utf-8?B?V1JkUXdwM2h5bXR3bXRtN0VHb1dsbFNuNUpxTFZHMVZBbys2NVAySzVjakl2?=
 =?utf-8?B?OVRXajhkRnMrczJyRmhmaFE1VkVZRy95aHpXMUl5M2RETkgzTzYyeHlYYzFn?=
 =?utf-8?B?bEdzakM1cUl3aWVycDJpU1pYdFVVUmVGOU9kNlI0QlF0cnhJWE5FOExCNUdC?=
 =?utf-8?B?cWtBRjNDRVBKMis1MmdlU204Uk1lVm1XNkUxVmNKYVhlKzFtcmY5U1M2cXJD?=
 =?utf-8?B?UlVuYWt6TkFHWVMwZUF2OWd5VnI4aGhSWkRUYkhxSHFxRy9uQk5ObS9tbjBy?=
 =?utf-8?B?a3FqemZzamJ6WERLY292bmIzZVF5Ky82TDE4L052R0R3Ung0cjBaM3F5ZTJG?=
 =?utf-8?B?ZnhESnpYM3dQU2tmYnNNQlUxNGlQTHdzWjNhZjRMOEFIQlpLQWIvUC9aeXFy?=
 =?utf-8?B?Y0JBd1E4RGNnOEp3M0l3RXBQeENZTzN4UW0xZDVQQWo0bC9Remg4MHZCSnUr?=
 =?utf-8?B?OVFzSGkwcVBvY2M2bmN4M2lQazBMMjFURmlvRFRoS1paQ0xQQjFsL2RTS0lT?=
 =?utf-8?B?RThKT2lSQnFVcUlyQzIzK0lhcFVxWXZqTmRXOW5GUTljdnREcVovRkE3OExO?=
 =?utf-8?B?eUFCSmxFWHdCN3lkMC8zakhvMSt6UElsaTlyY1gwMEJwbDVCYXRNY2JVQ3Ay?=
 =?utf-8?B?VW1SVUZzbHAyS1JiZFhvRGhlNnRuL1krbkJobmtIbTA1SS9XZWxySUpYa2d5?=
 =?utf-8?B?TCtKWnVKeHUrY2k3K1l6c0d2bmJjcUlyY2RaQ3NrY2FqeFJaS2ljc2FkMjEr?=
 =?utf-8?B?RXJVeGJxakY0TkhYMnpyTTJ1ODJSOFJYdW50Z25MV1V2Nnl5Q1grRHFES3pE?=
 =?utf-8?B?MGg5SEFDeU43Z3JOYkxxcWtaRldyODBNZEJzMk1TYTBOZVJpLzhYU0FWRTcw?=
 =?utf-8?B?TEpQMUVOK3g1cnJNU3h2d0h4Tk0yM3ZCa0tHSi8zVVRLcC85elQvdm9qbEhY?=
 =?utf-8?B?YlpqUjRuMXZjMTNCZ2RUcTJBK043YVNZZWpYQmE4YTBFVlNDRE4zNjFkTWtT?=
 =?utf-8?B?MkltSHN6d1dlZGZjbzI0UE9TZVJ1c2tuSWJ2cTA5UXU5WDFxMGdUbDRkNEhX?=
 =?utf-8?B?cnFkRVpqekdhb25RQjJQZk9FQmoxRWc4aWlId2N4dDg1Uzl1YzlmclhadWdO?=
 =?utf-8?B?ek1iNnl2Z2d0emtJbi9wYy8wYlpHRUpTQkFrb0htVERzazkyZGhxT2UwcEFL?=
 =?utf-8?B?TEo4dklLRmJHa3l6dC9ycXdEZyt5ajIyN2ZKOWpsYWtxK29jV2lUU1BSWlRN?=
 =?utf-8?B?VUZnQzBRNTV1V054QWcraGVsNU1Jd1pVMGFnWWdUejhjd2ZvTFFBOWNsZm1J?=
 =?utf-8?B?SElGL1R1enppNGFvNWNRUitNanh2cHhoL3V4ZXN0T0xaNUVXMDRPZ2hEOVhY?=
 =?utf-8?B?RTkvTVhWb2NETmxnVUM4OEhnZXphUnliR1hMYjJWZWp0bG0wV2xvNko1Qlp0?=
 =?utf-8?B?R0kyTW4vd2pmOEluWnFjWkZpM3BtcTVvcVhwMFVBWHVQU2xPUW5EOWlLUGpi?=
 =?utf-8?B?MUM0elZWbjU4K3FacXh5QnFLSFFoVkZoaFArdEtoTDQ0R3RwemRHS3VHWXdC?=
 =?utf-8?B?Z3JmNXgxbkcwU29nT0xrTlpmUHR5YzlHQW1heDhZdWRBOUYwZllCRmlqLzQy?=
 =?utf-8?B?TDFZMHVUVHFLY0VWbkNhbGhwUnRVQjJiV1BsMCtqTlliaXhCYkhaeFdUZXBU?=
 =?utf-8?B?L2F5TGlwbHQzZm5SSlNMcVR6SHozS0dGWjlFOHFMZHUwYTVodFpmOUs1V3lP?=
 =?utf-8?B?YWs1elpuMnBYSDd4eEhIK015WlBnakNZdWxNRUEzWThGdEVBTkVKN3QxcVI2?=
 =?utf-8?Q?CIIolwfd2nxYpkPs=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 32033548-ba0f-486e-2eb1-08df30ea0448
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 09:42:56.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oVBPstQl5S5yzCze5zuRc4WKlDmewfyqb15oM9D1Sal3Xyu0z5mid44fr/isjIHTflOeV7iUNPNaYuTjkTCzwayl0ROrVxd3oxQliGOg7FPwT9oujVB0XnKpk8ydAU/O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_024318_020541_D1E7F989 
X-CRM114-Status: GOOD (  25.83  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksIE1pcXVlbA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gMjIvMTAvMjAyNiBh
dCAwMzoyNjoxMSAtMDcsIENoYW5naHVhbmcgTGlhbmcNCj4gPGNoYW5naHVhbmcubGlhbmdAc3Rh
cmZpdmV0ZWNoLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFkZCBzdXBwb3J0IGZvciBERFIgKER1YWwg
RGF0YS1SYXRlKSB0cmFuc2ZlcnMgaW4gdGhlIGVuaGFuY2VkIFNQSQ0KPiA+IG1vZGUgb2YgdGhl
IERXIFNQSSBjb250cm9sbGVyLg0KPiA+DQo+ID4gVGhlIGVuaGFuY2VkIFNQSSBjb250cm9sIHJl
Z2lzdGVyIChTUElfQ1RSTFIwKSBoYXMgZGVkaWNhdGVkIGZpZWxkcyB0bw0KPiA+IGVuYWJsZSBE
RFIgbW9kZSBmb3IgdGhlIGluc3RydWN0aW9uIHBoYXNlIChJTlNUX0REUl9FTikgYW5kIGZvciB0
aGUNCj4gPiBhZGRyZXNzL2R1bW15L2RhdGEgcGhhc2VzIChTUElfRERSX0VOKS4gUG9wdWxhdGUg
dGhlc2UgZnJvbSB0aGUNCj4gPiBjb3JyZXNwb25kaW5nIGR0ciBmbGFncyBvZiB0aGUgc3BpX21l
bV9vcC4NCj4gPg0KPiA+IEZvciBERFIgdHJhbnNmZXJzLCB0aGUgZHVtbXkgcGhhc2UgY29uc3Vt
ZXMgdHdvIGJpdHMgcGVyIGNsb2NrIHBlcg0KPiA+IGxpbmUsIHNvIHRoZSBjb21wdXRlZCB3YWl0
IGN5Y2xlcyBtdXN0IGJlIGhhbHZlZC4gRmFjdG9yIHRoZSB3YWl0DQo+ID4gY3ljbGUgY2FsY3Vs
YXRpb24gaW50byBhIGhlbHBlciwgZHdfc3BpX2VuaF93YWl0X2N5Y2xlcygpLCBzbyB0aGF0DQo+
ID4gYm90aCB0aGUgc3VwcG9ydHMgY2hlY2sgYW5kIHRoZSBleGVjIHBhdGggdXNlIHRoZSBzYW1l
IHZhbHVlLg0KPiA+DQo+ID4gV2hlbiBTUEkgRERSIGlzIGVuYWJsZWQsIHByb2dyYW0gdGhlIERE
Ul9EUklWRV9FREdFIHJlZ2lzdGVyLiBUaGUNCj4gPiByZWNvbW1lbmRlZCBUREUgdmFsdWUgaXMg
Y2xrX2RpdiAvIDQsIGNsYW1wZWQgdG8gY2xrX2RpdiAvIDIgLSAxIGFuZA0KPiA+IHRvIHRoZSBm
aWVsZCB3aWR0aC4NCj4gPg0KPiA+IEZpbmFsbHksIGFkdmVydGlzZSBEVFIgc3VwcG9ydCB0byB0
aGUgU1BJIG1lbW9yeSBsYXllciB0aHJvdWdoIGENCj4gPiBkZWRpY2F0ZWQgZHdfc3BpX2VuaF9t
ZW1fY2Fwcywgc2VsZWN0ZWQgd2hlbiB0aGUgY29udHJvbGxlciBoYXMNCj4gPiBEV19TUElfQ0FQ
X0VNT0RFLCBzbyB0aGF0IHNwaS1tZW0gbWF5IGlzc3VlIEREUiBvcGVyYXRpb25zLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFy
Zml2ZXRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3NwaS9zcGktZHctY29yZS5jIHwg
NTINCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ID4gIGRyaXZl
cnMvc3BpL3NwaS1kdy5oICAgICAgfCAgNiArKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUx
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zcGkvc3BpLWR3LWNvcmUuYyBiL2RyaXZlcnMvc3BpL3NwaS1kdy1jb3JlLmMNCj4gPiBp
bmRleCA0NzQzNGZhNzhlNGIuLjZmZjE0MmM4YTZiZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3NwaS9zcGktZHctY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWR3LWNvcmUuYw0K
PiA+IEBAIC00Niw2ICs0Niw4IEBAIHN0cnVjdCBkd19zcGlfZW5oX2NmZyB7DQo+ID4gIAl1OCBp
bnN0X2w7DQo+ID4gIAl1OCBhZGRyX2w7DQo+ID4gIAl1OCB0cmFuc190Ow0KPiA+ICsJYm9vbCBp
bnN0X2RkcjsNCj4gPiArCWJvb2wgc3BpX2RkcjsNCj4gDQo+IElmIEkgdW5kZXJzdGFuZCB0aGlz
IGNvcnJlY3RseSwgc3BpX2RkciBpcyBxdWl0ZSBhIGJhZCBuYW1lIGJlY2F1c2UgaXQgbWVhbnMN
Cj4gYWRkcmVzcyBhbmQgZHVtbXkgYW5kIGRhdGEgZGRyIChidXQgbm90IGluc3RyKS4gQ2FuIHlv
dSB0cnkgdG8gY29tZSB1cCB3aXRoDQo+IGEgYmV0dGVyIG5hbWUgZm9yIHRoaXMgdmFyaWFibGU/
DQoNCnNwaV9kZHIgaXMgbmFtZWQgZXhhY3RseSB0aGF0IHdheSBvbiB0aGUgcmVnaXN0ZXIgZmll
bGQuIFBlcmhhcHMgSSB3b24ndCBjaGFuZ2UgDQp0aGlzIHZhcmlhYmxlIG5hbWUsIGFuZCBqdXN0
IGFkZCBzb21lIGNvbW1lbnRzIHRvIHRoaXMgdmFyaWFibGXigJR3aGF0IGRvIHlvdSB0aGluaz8N
Cg0KPiBBbHNvLCBpZiBteSBhYm92ZSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIHlvdSBtdXN0
IHByb3ZpZGUgYQ0KPiBzdXBwb3J0c19vcCgpIGNhbGxiYWNrIHdoaWNoIHdvdWxkIHJlZnVzZSBh
bnkgeFMteFMteEQgYnV0IGFsbG93IHhELXhELXhEDQo+IGFuZCB4Uy14RC1EIG1vZGVzLg0KDQpP
SywgSSdsbCBhZGQgc29tZSBmaWx0ZXIgY29uZGl0aW9ucy4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hh
bmdodWFuZw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
