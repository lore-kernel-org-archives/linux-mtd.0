Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBDDC46CD2
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 01:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxThkTygQJ+yFIK/ZSd5OTM67XxUiqd4nPAFJffxDFI=; b=XJv8fA/9Vrhx0R
	cFcNNenCW/eHkrdYzjMmsJbb8E2jhCq/+7ZStltocg6ZlSkaa/VY0NjhXvdHHAjwAyqps6BE7fsO0
	VFkoJkaYsVqKA+t32N01oZdhD3upaZspeNRcv7lKOWE12s2zMvurmYQuKpxLQAElkuy36+iK0ZeQU
	5kTywfe9KaZRkkEilLDi324kcxb41ZhvkCffCEfB/HJBm4jcc/ft11+maGZL/fpYNmkVdI7OQORrf
	FU4srWBtaMds5OWdEr3JUYOrzXYl1IUQTlJk+SZvDc5Tnk5OEr1aRFLMpCCMenAsodEmtkCAWeK/l
	zh/dimdXrbG9R7NL3W7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5B0-00Eg9C-0j;
	Tue, 23 Jan 2024 01:02:06 +0000
Received: from mail-ps2kor01on0626.outbound.protection.outlook.com ([2a01:111:f400:fead::626] helo=KOR01-PS2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5Ax-00Eg7e-1H
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 01:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxVLR4pEEOaUg/v/EVyZVoREBeriXWef2qfVQja+KvH7PJFJz6+nKaRmi3edUjhGAPUZitggEz6qaI4mzVhkyA6GXhllBCaI/am0Jqyj6UaOaVsvAIB3lCd+O50RKm2Bwzte9x3NA6pS3I6KPiJmaqRRZLtyQBW/33ebW9VJ+lFKk2BY0+CaoJjFkka6KFe0hARLj9VVg4ENK9pm3uoTqHgu/KlJgHlF1mHqvHxok7gk/EnUo/UqXRVyly/AT9bFGbbeCXo9D7yp1fOLT+2JOVhUPQzdQVuvnwcNjyD/Bb15nB+y/zZjDDb6woY/bwZtgvCvm15j1Uu/Ag2NjT4liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3r1iNRLXcDGpH2F+6ZcS0jqjWVoI1J1xA6FtghtCVk=;
 b=OYkhYiXGL46rKH7ETcEvxp38Q+NDtrn5EGP17d+ZXGXMn/ODNY+7uPNboAm/LbwUE1syZWC8Xl8Ib0tFu1/1/r3cs4yhnZTzRMSnb95rlzac0TD0rMZU1Oc2WWf+th4pKvm162zzBWjYTPcM3L8lmsakhEZrpkSsiXxKtkPWh1JzECiyIsevAvv0/vsqTQfZPD6rJSouWs4/iMm8BqybntEcaTrX7/9PsfvvI0x4O+drknzEB0aDb4+3BMu4KxUGZNopT9P/b/va7d86VRtcGdAK+4zn1nupUccgj6bncri21gCNRVy2nJpE9pSvqJpcvzRRau4Ro415ZMUpp1mSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skyhighmemory.com; dmarc=pass action=none
 header.from=skyhighmemory.com; dkim=pass header.d=skyhighmemory.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skyhighmemory.onmicrosoft.com; s=selector1-skyhighmemory-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3r1iNRLXcDGpH2F+6ZcS0jqjWVoI1J1xA6FtghtCVk=;
 b=sJsQVlvAPggl0TMONjZqIJbzQXm65Dln414zIch2U9lHShc/1zWz/w2ZLbMzubyjkaO/rx+nTfNl6oNy2XqN2jWezXuy+wu2lGxS6/sXhCB5vRruO3ictZp95ofQsFJ6arP7J0VFjP9TzMZY+W+0ekoqJgTSqx4cN0dfmhySfMOrm2nIzfKDLiyldFcVDSE+LDoDipdwzYcQLx+EU86zwlNUxWXgRwSKpc7qGJpqKCu89R90wtQyxtRyXbYqAOmpVjSffBvADpwvQt1/ymcaxYuJvrLHwYwkBNRMW9fapJTZSg/UCZrX/kdg0HHNWsC6Y6Z76yE4TKe/6RkzDGMDDg==
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM (2603:1096:301:56::10)
 by SL2P216MB2109.KORP216.PROD.OUTLOOK.COM (2603:1096:101:155::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Tue, 23 Jan
 2024 01:01:53 +0000
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de]) by PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de%5]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 01:01:53 +0000
From: Mohamed Sardi <moh.sardi@skyhighmemory.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Kyeongrho.Kim
	<kr.kim@skyhighmemory.com>
CC: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>, Mohammad
 Nada <Mohammad.nada@skyhighmemory.com>, Changsub.Shim
	<changsub.shim@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Thread-Topic: [SkyHigh Memory SPI NAND Driver]
Thread-Index: AQHaPzrkQfH71ygAnk28xsGw/vDWzLDP8++AgAPob9CAAGeNAIASKhEA
Date: Tue, 23 Jan 2024 01:01:53 +0000
Message-ID: <880CF70D-DC61-4E18-9A31-48A82A45CA3E@skyhighmemory.com>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
 <20240108144719.3198373e@xps-13>
 <SE2P216MB2102316F0F2D8134C755C37283682@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
 <20240111083838.7f215daf@xps-13>
In-Reply-To: <20240111083838.7f215daf@xps-13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.79.23112723
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skyhighmemory.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS2P216MB1185:EE_|SL2P216MB2109:EE_
x-ms-office365-filtering-correlation-id: 2a0cf670-762c-46c3-b6f4-08dc1baee389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: woq8bbmHvuETPj71sYC6TZIoM0KokFXJAeK9x8w7Bjap5ujGicK4wliRYcbyxNwQjRlckm29zBqNgflLsN0xNoWnbYc2P4Eb3Nk3D9GFZ6VP1OijtOXSUVybHbaH5FSGHt7P+T+BWgEPOKt//WQbYmR/lUr+H9117TorE0hsi3ef4EtFlDf7Kb+WRjw+/iAyhbbwQRXtjHl1ItIJacqn6Y8EuvOWMnw65s8USVkiorQy/bv2pGgg2qfy2gwKSElnvgmjmRKby0mcAVa27t0ov3heOqoC2fwM5fFsX6wO4fCEPvbm+fej2TObSjxRLIWDwK8eAJqFYTZpZTx+36KYh4HHgryluLXHFWkICu4Ft9XUBvpZxKSqTD0/IduvpIf0uecKzp3eU2esx+bexWKOLcfZXtX2AmvdCt+696FTPOWg6JffnylQaOCH2Fjrz/D1z+F1Ffc1W9/zRru3DCLXbgcOtUaLNfl0fv+IaCiDacajfmL16t3OZa6T0B6nM+C6qEucUSHJBx7U5WPvfz5NQwYw4ipmn6eb8MZeReuUdI+OfxhrrjTIq+aj4tsQxsM2MNzixxZDOjoC8lSqJ8H8dvePeO/6OuaJsEcImlcJw/rDR/TxZanxg3iNjLGeVtDC1ZHysvIZQL/XeLDQjwfoH61vE1qiNq52QFeGfxeCOgk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1185.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(366004)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6636002)(316002)(64756008)(66556008)(66476007)(66446008)(54906003)(6506007)(2616005)(76116006)(110136005)(66946007)(91956017)(5660300002)(6512007)(107886003)(478600001)(26005)(71200400001)(6486002)(83380400001)(4326008)(8676002)(8936002)(38070700009)(36756003)(2906002)(86362001)(38100700002)(82960400001)(41300700001)(122000001)(33656002)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzF4MzRyMXhTdUxXSFNnc1FQblZMTDZ0QzZFNmdiVSs0ZVNBcms1NHM4RUxN?=
 =?utf-8?B?ams3Ym8wRlY2a2J2NzRmWUFLQVBUWXBuNEVFMTF3RnFuZi84Z2dlT0N5UTda?=
 =?utf-8?B?YVZ1Tm1Xek0rMnlWMjhvd2NibHBDSG9sakZ1U2trTmM5alo3K25qU2FyeEZx?=
 =?utf-8?B?TFZaKzk2ZlRCd1BQQS9DL3Q2aTcrOVZjNVFTazNDUjMyZ1R0UzBYL09RVjVq?=
 =?utf-8?B?V1pnOUlrTkNrM3NsUG5ldytzTFo0Q0htbEp3S3JQU0FKUHlvWGo5Zm1pL3B5?=
 =?utf-8?B?OHRSUDgxL3dITXVJbTcyU3NRVjcxZGxUVDFhckNqTG55U0l3ZjFtakNucHdZ?=
 =?utf-8?B?ejFhYllmdzVuS05jOXRpbngwYUE4Y2RBZ1BxdTI0NkUrSGt2NmNWQWI5aUZB?=
 =?utf-8?B?RUVUbWkxeVZYcFVGR0s3WWdYMHVwazBJQmowditNcjF5STNJN0Rab0pLTE5N?=
 =?utf-8?B?NHduek5Sd05wTlJSNjRHWlI1V1RacThIN0FrM2kxRW0yZ2lMM2JyRTN1VGdw?=
 =?utf-8?B?WWpEZlorV1pSTXE2cDJtKzNBYzVoRmhublNRN1dIbHc1amQxSjlDVWZnV0M5?=
 =?utf-8?B?UU9zbXJET1RLa2RkbENMbmIrWklVRXR2WUcxWlpVVDJPUk90SjNZYWdTRDEv?=
 =?utf-8?B?UWVoK3o3Y3RkS2dtN254dmxTZlAxUVE5TEtJTm81c1Exa3Z6ejZ6SkpmMTFy?=
 =?utf-8?B?QXg3dmFBK1JMTUcwN1A2Q1J0dHhyNnUzUnpGcnE2aFZVUlJmamYxRDJQY3Bl?=
 =?utf-8?B?QjZQSU15UnpNUTBaY00rRUdMVDJ3ZUVRY1BKTnhiYU9DVzZxcVk4d04yN2RY?=
 =?utf-8?B?UGYxRTE1WVJ4c3o3ZWpNOUJoQldpdHlXQysrczNoZjJCNjV4dkprODF1QS9E?=
 =?utf-8?B?ZG9ZaDQwRXViMUVBV1h2L2pBa1B5OG5TQnJZb080L1haSVFMWjBuaEtyTW1Z?=
 =?utf-8?B?dEkxTjgxckRQZVluQjUvY0UwMFNIaDAvT3RxY3lSbmY1R1dnNldyOUN2Tlpm?=
 =?utf-8?B?ODBMdC9zSm9JVGw1ekhnOEpzTnJSUTJPY2IveHk3UzFaOWIyZUVzVGI5eXFq?=
 =?utf-8?B?VHlWMGtiMllDc0pLa1l2NEpwZE8wMWpQR2F5QU9kMWxpQ3hKdEczWEU5eXFI?=
 =?utf-8?B?aUtYbG1DZE13MTdCdUFIZHFTWTkrajN1WXUzTUZINHp4MVpJTjN5MGI2OWF0?=
 =?utf-8?B?Y0orUWxqZktDOFVLSGZISjdycFFzeXcwaGlkbGVTTys4SHp6QU43WkY2YjdM?=
 =?utf-8?B?Z3dzZjFHenFzWFVzZWVWRjV2STVQOXhYMm56YnpsWWd0dEoyd0tZUUh2alNj?=
 =?utf-8?B?V2QzT2gySG9PUy9nanIrUU9YaWFpOHFJQkxoN014Z0lWdTNUdXhoRjdIdXQx?=
 =?utf-8?B?Q2Jyc0dQY0svREsycGJZcDFkVGlGRllPN2o2V0JZcFlMQ0J6UGJ1V2tmUEhJ?=
 =?utf-8?B?KzN5TGtTQTdjdEo1RHdLei85T2plY0o5OHV0REJtOWx3L21XVGozRTgzR1o4?=
 =?utf-8?B?MU5BOG1CbXVuVUZPTEpTaTNIdUZOTjltTmRidVF6MEExZG5JdXhWV3E1SkYr?=
 =?utf-8?B?TXR2VlZRQTA0dkJqdmVlZzFOczlsV0RyRDVWSzVXdzBSWDRydjc3OXRDSWMy?=
 =?utf-8?B?Wi85N1Y5WmpRNmNzeDh5VmNWYXBRNnY0Mkwxbld6alpSUzczNHoyT1Jxc0sv?=
 =?utf-8?B?OXJCdHBySWMvM25RWlNWYmNNOU1qT0YwY2RVcUs5MHlOd28xTmcxYlA3b3NC?=
 =?utf-8?B?VDhNalFUU1pqYlRiUW9hRmhVTXAzVFNwakxDanQvQmRaeFZaL2JsWEsrKzMy?=
 =?utf-8?B?Vm5oTUtKM2RqV2lwU0ZQdURsU1EzczZ6WWFpTzluZ20vZHdKMkd2YmNXYXpo?=
 =?utf-8?B?RUxRdnF6ZDdaTG1IaEdESEdnRXZBY3B0OEJZUTAxQVJvV0ttL1QzMnBWYWsr?=
 =?utf-8?B?L2hHUW5USSsvSjZheG52cURSNzFuZnVNaVpPQjhzUnBCeGFnL1l6Z1V4M1Ny?=
 =?utf-8?B?blVmM0Y5VWFydWNmN3NUaEJ0WjBrQ0YxQm5DUnVXaGVSWThrcjNzSWw4UjlL?=
 =?utf-8?B?ekRWNW44a0g0ZURudDVLWmI3dzJIWm04cHplWnlTQVl4Q2JmMVV3ajZMbm8w?=
 =?utf-8?B?V0F6RHhDR1YvcXJoZGpRWnh6cmsvWC8zWllSSG9VcFR5ZzIwemY0VDFndkU1?=
 =?utf-8?B?cWc9PQ==?=
Content-ID: <DECAF8DE06E5F14DA14B69E5BA8BB282@KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: skyhighmemory.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0cf670-762c-46c3-b6f4-08dc1baee389
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 01:01:53.5453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 39b82b34-0966-49dc-81a7-5bcab7ea53c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yVZz0hd7T2AlS9jLVcmBrE/olytJeOgMat5nwf7ofhPsFQXs/K70v4ah6Inj01d6xRYseKbFdR+nWr8WSv/UQnbnIkTDWD7f9xuDuIvIfoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_170203_467597_75468844 
X-CRM114-Status: GOOD (  20.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWlxdWVsLA0KDQpJIGhhdmUgYSBxdWVzdGlvbiBmb3IgYmFkIGJsb2NrIG1hcmtpbmcg
YW5kIGNoZWNraW5nIG9uIExpbnV4Li4uIGFuZCBFQ0MuDQoNCkRvIHlvdSBrbm93IGhvdyBiYWQg
YmxvY2sgbWFya2luZyBpcyBkb25lPw0KDQoxKSBCYWQgQmxvY2sgTWFya2luZzogQXJlIHlvdXIg
d3JpdGluZyBub24gRkYgb24gdGhlIGZpcnN0IDIgYnl0ZXMgb2YgdGhlIE9PQj8gRG8geW91IGtl
ZXAgRGV2aWNlIEVDQyBPTiBvciBPRkY/DQoyKSBCYWQgYmxvY2sgQ2hlY2tpbmc6IERvIHlvdSBy
ZWFkIHRoZSBmaXJzdCAyIGJ5dGVzIG9mIHRoZSBPT0Igd2l0aCBFQ0MgT0ZGIG9yIGRvIHlvdSBr
ZWVwIEVDQyBPTj8NCg0KVGhhbmtzLA0KTW9oYW1lZCANCg0K77u/T24gMS8xMS8yNCwgMzozOCBB
TSwgIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIDxtYWlsdG86bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4+IHdyb3RlOg0KDQoNCkhpIEtpbSwNCg0KDQo+ID4gMi4g
SG93IG1hbnkgdmVyc2lvbiBvZiB0aGlzIGRyaXZlciB3ZSBuZWVkIHRvIGRldmVsb3AgdG8gc3Vw
cG9ydCBhbGwgdmVyc2lvbiBvZiBMaW51eCAobm93IGJlaW5nIDYueHh4KT8gDQo+IA0KPiBXZSBv
bmx5IGJyaW5nIHN1cHBvcnQgdG8gdGhlIGxhdGVzdCBtYWlubGluZSBrZXJuZWwsIHdoYXRldmVy
IHZlcnNpb24gaXQgY291bGQgYmUuIFNvIGlmIHlvdSBzZW5kIGEgcGF0Y2ggKHBsZWFzZSBmb2xs
b3cgdGhlIGNvbnRyaWJ1dGluZyBndWlkZWxpbmVzIGluIERvY3VtZW50YXRpb24vKSBpdCBzaG91
bGQgYmUgYSBkaWZmIGFnYWluc3QgdGhlIG5leHQgLXJjMSAoc28gaXQgd2lsbCBiZSB2Ni44LXJj
MSBpbiB0d28gd2Vla3MpLiBZb3UgY2FuIHNoYXJlIGRpZmZzIGZvciBvdGhlciB2ZXJzaW9ucyBh
cyB3ZWxsIG9uIHlvdXIgb3duIHdlYnNpdGUgYnV0IHRoZXJlIGlzIHVzdWFsbHkgbm8gYmFja3Bv
cnQgb2YgJ25ldyBmZWF0dXJlcycuDQo+IA0KPiBbS1JdIFNpbXBseSwgeW91IGNhbiBvbmx5IHN1
cHBvcnQgZm9yIG91ciBwYXRjaCB0byB0aGUgbGF0ZXN0IHZlcnNpb24uIElzIHRoYXQgcmlnaHQ/
DQoNCg0KV2VsbCwgdGhlcmUgaXMgb25seSBvbmUgIm1haW5saW5lIiwgYW5kIHlvdXIgY29udHJp
YnV0aW9ucyBtdXN0IG1hdGNoDQp0aGUgc3RhdGUgb2YgdGhpcyBtYWlubGluZS4gV2hlbiBhcHBs
eWluZyB0aGUgcGF0Y2gsIHRoZSBuZXh0IGtlcm5lbA0KYW5kIGFsbCBvdGhlcnMgZm9sbG93aW5n
IHdpbGwgaGF2ZSBzdXBwb3J0IGZvciB5b3VyIGNoaXBzLg0KPiANCj4gPiBGb3IgaW5zdGFuY2Ug
aWYgdGhlIGRyaXZlciAoYXR0YWNoZWQgaXMgNS40KSwgY2FuIGl0IGJlIHVzZWQgdXAgdG8gNS4x
OOKApiBvciBzaG91bGQgd2UgbW9kaWZ5IGl0IHN0YXJ0aW5nIGZyb20gdmVyc2lvbiA1LjR4LiAN
Cj4gDQo+IElmIGl0IGNvbXBpbGVzLCBpdCB3aWxsIHByb2JhYmx5IHdvcmsgYXMgd2VsbCBhcyB0
aGUgY29yZSBoYXMgbm90IGNoYW5nZWQgbXVjaCBzaW5jZSBpdCdzIGJlZW4gY3JlYXRlZCwgYnV0
IHRoZXJlIGlzIG9mIGNvdXJzZSBubyBndWFyYW50ZWUuDQo+IA0KPiBbS1JdIElzIGl0IHBvc3Np
YmxlIHRvIGFwcGx5IHRoZSBwYXRjaCB0byBvbGQgdmVyc2lvbiBvZiBMaW51eCBjb21tdW5pdHk/
DQoNCg0KT24geW91ciBzaWRlIHlvdSBjYW4gcHJvdmlkZSBhIGRpZmYgZm9yIGVhY2gga2VybmVs
IHZlcnNpb24gdGhhdCB5b3UNCndhbnQgdG8gc3VwcG9ydCB3aGljaCBkb2VzIG5vdCBjb250YWlu
IHlvdXIgcGF0Y2ggc2VyaWVzLiBGb3IgYWxsDQprZXJuZWwgdmVyc2lvbnMgYWZ0ZXIgeW91ciBj
aGFuZ2VzIGhhdmUgYmVlbiBtZXJnZWQsIHRoZXJlIGlzIG5vdGhpbmcNCmFkZGl0aW9uYWwgdG8g
ZG8gb24geW91ciBzaWRlIChiZXNpZGVzIHBvc3RpbmcgdXBkYXRlcy9maXhlcyBtYXliZSkuDQpZ
b3UgY2Fubm90IGJhY2twb3J0IGEgZmVhdHVyZSB0byBvbGRlciAoc3RhYmxlKSBrZXJuZWxzLg0K
DQoNClRoYW5rcywNCk1pcXXDqGwNCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
