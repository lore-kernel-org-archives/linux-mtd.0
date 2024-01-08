Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB95C3DA6E
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jan 2024 19:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukukMitLzdsrtJq8ceTZXpybKe/X8fH9cvUBfHn4q0E=; b=StyoefjMO2eK5G
	NeUAYHc+yOyW3rHfFWWeD7rkFqIcdFcvuLl63vUg3VX/R3HA8upMUgC7MaI2J7+nntR7ghOEuz+5F
	qunQTBjyNhKlzbJ+/xaKhZr9uXk6xUPv9KQmaMziqGOxqJywO/FPY78zH0S6tI6HgB7vw13wUBTG8
	03MdTJPFKQKqmZL0ObesLQAVfzea3g86PNid2XZI+kMHm0zyX/ApcZpb3PlyJjgMzM2SkeaiIkRtu
	zVAyRHHFiw+q5lZxK338Q311z/j+hOsrfArE6fJRbMVBCW+agsEEYzkJsE5XQ1fM2t36kkkdTSXvJ
	R9Y4tQRTs0pRQ9rjNEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuwc-005z9P-0f;
	Mon, 08 Jan 2024 19:05:54 +0000
Received: from mail-ps2kor01on062d.outbound.protection.outlook.com ([2a01:111:f400:fead::62d] helo=KOR01-PS2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuwZ-005z8w-0R
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jan 2024 19:05:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey57U2raYBiWS/o8XE0ML5s2tgs7bIff4xHWFHiWo6nRA1XIgh5tvt3Z96FlMPSXuy6NJTjHmsg2fEOP8zOiC6y+4vGKMbki9s2TvsXDxFArDJV3ip4kWl2msywKFqvcCIKohVoAky4fMjGtx7K44Jfz/Mg33e9BRGWj45+DJahnEXpPHogiJc9U0Cb1YWzN5lObjXTX6tcV0Nnxf6QK7RtxMR1l5uEyl6dbtNp+wyo7NT275rgSuOFskxSA5qB/HxUsrc7WIecMdo6x5q5j/FHdw3e2Gk3RDH+c+VZ69wGdmMwDd0VbRjX/1DhOM2Nax/9GElckxppew/1OmCuSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JeVJE4N+ix3q70yZyNeL8+kfti1vRFkAaUXSs3AmvM=;
 b=L8SQJJEMfwNbYYhl4LwI6s+NAjEggUUVkBkN4N9krfoMNncVyPlnVirLpqmSMzI3HQHBxNdB32/XlWJyJ3WVMWHSRFIsHNGd63Psvxvm3lAs5ttFZQc6AmXNLx87InyGTpTl9AFpUHcDChUDJzrzYoG9AH3jJv01YW96fs+xv053eoWZBHJ4EKvmVogVRL26fI8lUdb9+p7YREzSKptNmHzHVZf/S4Mq35XyGETWUaewHIina8oexCKE5sFPuY24KDWHdKSjgwAc3X7jm1bXAuWfII0AKMoQvH1sHB6FWLyYr8ErULPw1quWOitheptEX3mljCJLYZ9YXgEDMN/h2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skyhighmemory.com; dmarc=pass action=none
 header.from=skyhighmemory.com; dkim=pass header.d=skyhighmemory.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skyhighmemory.onmicrosoft.com; s=selector1-skyhighmemory-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JeVJE4N+ix3q70yZyNeL8+kfti1vRFkAaUXSs3AmvM=;
 b=OLlAvEattt5egf+UZV7lDdwlRSLWtbwMEJbjjgvuF82rJO+D/feQHRcWfIHDT8boO7pkEZu+pDgeOShwJqtgSBU+xy/UEDAKsP7O5NrLMpzxIxx1kiUWx21HjgTRrpINQA3x9TTXwMJrkvaZ90SBqYCKnvF7pO3akVyVkH00KBz/F98l3YEJ3xQQLUoCQlVo+RBziAJiPoxoI+W+8KNLlBPHTvHYl0peAkC1KEe7j8C9NwN07qb0xQWLEgHaRxMoyltgIxqGwLXenWaUb14pz4hEKc/u3W2a4XH8rvDfzfpFjCUpjLaB2Fcc9TvDQ3g0BvCcxWvXymC17H2qJM1uKw==
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM (2603:1096:301:56::10)
 by PS2P216MB1201.KORP216.PROD.OUTLOOK.COM (2603:1096:301:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 19:05:39 +0000
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de]) by PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de%5]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 19:05:39 +0000
From: Mohamed Sardi <moh.sardi@skyhighmemory.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>,
	Kyeongrho.Kim <kr.kim@skyhighmemory.com>, Mohammad Nada
	<Mohammad.nada@skyhighmemory.com>, Changsub.Shim
	<changsub.shim@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Thread-Topic: [SkyHigh Memory SPI NAND Driver]
Thread-Index: AQHaPzrkQfH71ygAnk28xsGw/vDWzLDP8++AgAAJ8IA=
Date: Mon, 8 Jan 2024 19:05:39 +0000
Message-ID: <50A9A9DF-0DB1-446A-93E9-97F9E2A0957B@skyhighmemory.com>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
 <20240108144719.3198373e@xps-13>
In-Reply-To: <20240108144719.3198373e@xps-13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.79.23112723
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skyhighmemory.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS2P216MB1185:EE_|PS2P216MB1201:EE_
x-ms-office365-filtering-correlation-id: 6efa61ce-40a5-41c3-2ff5-08dc107ccda1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: otGLMyucQsLB8zqJMZfOujqTvaR9fdErjJH/926wzrwInih6dGZbNvBMGAZG2oNb5KLl5DGuhmoynDs7e3JHVHyuprfcWpoIKQkpPxL4iMJEJXfNGXiyVcpdMzzOQ7YELTC6FSXi4l2rJ4swrYpfQKhcx7Va7gQ68ezKWsKiqmoiI4T2gOZj0Mn3S9NvlDYRcEPkA4aP3+Y68uH79q3EZjS4Hi/j9qTwbA12DGxrdf6/ZXXwNDqKM5bizW63BYKr+dCqvoLpWqHFVNJJ1qlSNUO98lvQsPtsCkPLV8E0YARudiJ1hTNpeqc5z2ItsIc0NYfpM16eCxpa+PwH0ZXIGFG5qKS7h7k+dLe+nz8Nar5Ti0in3aYUgLgi5z5Igjj0F50gvP/kxqnMIcq8UjSCL7WhDEuL7GTrlTJ5ApYoz1pas0CRy471uBGSXtyrJhnnEsWXtCW2XombO5EcPURz2fZQy3Zdx1SEdB5oj3CGEYRYoUQZjsAsJ/Wobo9wkztR2TDiP1fIh62MSsH2sC6DxxLUZhXnr8IQG+jxvgnP8jr1fIFkp6+NrbcondRR/PHY4oZHblDcR3Tyb2N+/S4oR1mJLBmED0R6OoqCnnwJ856y7IHRLMTLBMTk4flmIPljenJDtOQDUosL4trGyX7nuylTtxLSldB11eUpupakpuE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1185.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39850400004)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(2616005)(6486002)(71200400001)(6512007)(478600001)(6506007)(5660300002)(66574015)(83380400001)(66946007)(107886003)(2906002)(41300700001)(66446008)(54906003)(66556008)(66476007)(316002)(64756008)(91956017)(76116006)(4326008)(8936002)(8676002)(6916009)(38070700009)(38100700002)(122000001)(82960400001)(33656002)(86362001)(36756003)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEpqT094UVRVdEdYeG5EQy93cks2dFNTVXg0QkN5SGpHQlpQZHhHbHlwVjdi?=
 =?utf-8?B?OUNJRVdJQkwya3gxMURFTnd4UGs0MzhCS3F3RHZPbGZMTVlqaWNlbkJoMnhs?=
 =?utf-8?B?TWIxd0c3Nld0WVZrdTllQ0t3T0Q2eThSeEV1cUVGRTVZOUVySFIvZ292aDdj?=
 =?utf-8?B?MitXOUhNS3Q4cHpaSDZPU296akQ3Ri93YzRNV3pLL29YU1YxRVNtenMvblZK?=
 =?utf-8?B?VUlLeXNDaTRYZ2VEMVdRYkREdUNTNjl0UHBieWEwU0JPNnVibG5KZlZQYVN4?=
 =?utf-8?B?WmZDeVQzZXAwU21HM1pGQU1Gd1dQQ1RrZDVEVTZuNWovMzFjeUU3NGIzcGNs?=
 =?utf-8?B?YnhyRGNhdTM3R2wyQnplbXRualVpeURFTzFoN2cvdG96Qi9OVXNHUjlYak12?=
 =?utf-8?B?QXkrUnQ1M2xVbU5JRytZMUplQTByWHhGNTVvZzUrSkxUMFpTcFVLZGRXWmdQ?=
 =?utf-8?B?Rk1WYzRhZ3NQQmU1Q25WL0R4dkY1MHZNRWR5cnpvNkZjZStmOGZlNkFVVXlC?=
 =?utf-8?B?VjF3dFNFYVhsMzZ0ZUdrQ0oxWjAvMGFoa09CMDFHSzhqdGxUMnREZ1VUSXhC?=
 =?utf-8?B?N200OTZmZ3BYdTNrd2NnT1pSdmFoS3dxcUZlWkJIUUhicnNqM3pxUFNhdWQ3?=
 =?utf-8?B?WlhDSFRNWlQxa1pIR1o2RThsRGtVN2NQVHpJMVgvZ2QxazlLUjdJTUhzWnpP?=
 =?utf-8?B?ajJWYWFMRE9PUlI0alpHWmU1aitnSDVJMnUzNktMZ2wxeE0yTkNuNS9VVThC?=
 =?utf-8?B?ejhLWVpHempUU25wbzlyaW92bVlsalhHaEpZMm4wc2h3SUE3bjZCUll2S3BY?=
 =?utf-8?B?M1NuRGpPdy9hQm1yQnNlUTBiWUFVWEtHanRyUHRXNGdSL2RuYVU0eDgxbXN2?=
 =?utf-8?B?eDh4aHRWOUpDbkxUVEVHRDBycjg1dXozM2RNKytTeFZhWDVjbk9oMC9mcUVs?=
 =?utf-8?B?dVBMT0toRkpPS1drKzRjV0FuVGpJVitDWUhueDdLUDJVcklEM3NvdkRwb1Y4?=
 =?utf-8?B?cld5Y2xCZGtVWG1sbTFkR0hOd1ZsTzJGSi8wNDVqTCs2SHNDL2V4SVVyV2tS?=
 =?utf-8?B?dVo5TVJFOEFqM21RNnBzb0V4QWVWSU82UHRPUWtCTE1ocUJmMG5pZWsvY1A0?=
 =?utf-8?B?a0tscm12azVjajl0WG1ROVRTN1VNY1JDa0NZWEh3YUNXK1lhU0h1ckRqeEI5?=
 =?utf-8?B?Qm1VNXllZ3VHZE9qaTdxeGdvcjhucC9qRTVOdElab3Nudm11Ui9SVXBEaXpv?=
 =?utf-8?B?SXUrbG5paUV4cEdyT0JpWkhuSGpYZzR6SThjam5HVWZOMG51azdicEdoOWhG?=
 =?utf-8?B?OWozNUUzRzljMGpnQnJiWlptWnEwQlJhQ09oNUZ1clo4bUZ1cTdGUk1qdVRC?=
 =?utf-8?B?ZFI1YThYeVJKOWhLcndRTUE5WWo0QVd2RWJza2FBMFhEVzRQMW1VZDVNeXJJ?=
 =?utf-8?B?VEFDVVA5emNDbXJYdm1rbHorVFlKRyt2Z2t6VEFSWmVCdW5xcjlnR1l4Q1Bv?=
 =?utf-8?B?aE1xMmwwWGcvQk84L3N4TFo5ZUNiNjNLTlpMZlBtdmZKanRlUGdUcXpPcU9U?=
 =?utf-8?B?b3ZvUGJXVitYZmxXZklGdTRaQzdtNGgvUlU3NmovUHVVRExtRkR4OS80Wnhk?=
 =?utf-8?B?ejJoSUlkalZpanhMZ1RvaHBXQWdEbmZxTmxVSmFHM0ZIWjBUQW5NRjRaQjdD?=
 =?utf-8?B?VnZMQ280QThYSHVMNmpJMm0yTjVrdzdtOTROdUtRbDVlTjR1YXhOVzE4NmFt?=
 =?utf-8?B?a01UK1RXdzZzekJxd3J3RkJ3MGl3aVVhajJWQ2RYeDhTVWNnTVUyOWNHaFZw?=
 =?utf-8?B?TUFKSW45RjZmeE1uSEhjYmUvODV6WmtYbzl5Sjg2eWdobjMrTmZydkxUSVho?=
 =?utf-8?B?THJUcGZ3MzN4QXRIZlZXN1QwWnphVVhqMnhhRVhKMXJHdEwvS21SNEx1bjZ0?=
 =?utf-8?B?TjhvU2NaZEFTeEQrT1BueCszTS9WQWtaZWlEcmxqZEpFMzRzNGRyOFJhaXMw?=
 =?utf-8?B?b3EwWVJGcnRTK1lEOHVrSWlXM2pURzZGSUl2L3cwQWtadGl3RllhZ3NNOEh5?=
 =?utf-8?B?b1ZUOHkzazA2a0dGQkZLMTRJSTA2RWRhS0hEZHg1UVdyUTFFQUh6bkdBSnM0?=
 =?utf-8?B?UFZXdndMbGNVOXVxZ0ZIejRRcTJJSTBBcFJuUkxGYTRFSThlMDh4RWtQcVRL?=
 =?utf-8?B?SHc9PQ==?=
Content-ID: <438C325FEA0E174A9CC36299CCCD72E1@KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: skyhighmemory.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efa61ce-40a5-41c3-2ff5-08dc107ccda1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 19:05:39.1135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 39b82b34-0966-49dc-81a7-5bcab7ea53c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oz/Vjt/X2yLgsUX0AbqGAPnBWzt8AqEkKFz9NDglkFFE8lI/1bbcd2nG7ySEtoEPHEevxGGB6nHx9hd0cZiSLUpHgs8Z5yAN3KjzvwFrW1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_110551_238038_81601F65 
X-CRM114-Status: GOOD (  14.88  )
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

SGVsbG8gTWlxdWVsLA0KVGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLiBNciBLUiBjYydlZCAo
T3VyIGFwcGxpY2F0aW9uIEVuZ2luZWVyIERpcmVjdG9yKSB3aWxsIGJlIHRoZSBtYWluIGNvbnRh
Y3QgaW4gb3VyIHNpZGUuLi4NCg0KVGhhbmtzDQpNb2hhbWVkIA0KDQrvu79PbiAxLzgvMjQsIDU6
NDcgQU0sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbSA8bWFpbHRv
Om1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+PiB3cm90ZToNCg0KDQpIaSBNb2hhbWVkLA0KDQoN
Cm1vaC5zYXJkaUBza3loaWdobWVtb3J5LmNvbSA8bWFpbHRvOm1vaC5zYXJkaUBza3loaWdobWVt
b3J5LmNvbT4gd3JvdGUgb24gVGh1LCA0IEphbiAyMDI0IDE4OjIxOjUyICswMDAwOg0KDQoNCj4g
SGVsbG8gU1BJIE5PUiAvIE5BTkQgRmxhc2ggU3Vic3l0ZW0gdGVhbSwNCj4gDQo+IFBsZWFzZSBm
aW5kIGF0dGFjaGVkIHRoZSBkcml2ZXIgZGV2ZWxvcGVkIG9uIExpbnV4IDUuNCBhbmQgdGVzdGVk
Li4gZm9yIG91ciAxR2IvMkdiLzRHYiBTUEkgTkFOROKApg0KPiANCj4gV2Ugd291bGQgbGlrZSB0
byBrbm93DQo+IA0KPiANCj4gMS4gV2hvIGlzIGluIGNoYXJnZSBvZiBzdXBwb3J0aW5nIFNQSSBO
QU5EIGRyaXZlciB1cGRhdGUgYW5kIHVuZGVyc3RhbmQgdGhlIHByb2Nlc3M/DQoNCg0KSSdkIGxp
a2UgdG8gc2F5ICJ0aGUgY29tbXVuaXR5IiwgYW5kIHRoYXQgbWVhbnMgYW55Ym9keSB3aG8gd2Fu
dHMgdG8NCmludGVyYWN0IG9uIHRoaXMgdG9waWMuIEkgd2lsbCBwcm9iYWJseSBiZSB0aGUgZ3V5
IHdobyBldmVudHVhbGx5DQphcHBsaWVzIHRoZSBwYXRjaChlcykuDQoNCg0KPiAyLiBIb3cgbWFu
eSB2ZXJzaW9uIG9mIHRoaXMgZHJpdmVyIHdlIG5lZWQgdG8gZGV2ZWxvcCB0byBzdXBwb3J0IGFs
bCB2ZXJzaW9uIG9mIExpbnV4IChub3cgYmVpbmcgNi54eHgpPw0KDQoNCldlIG9ubHkgYnJpbmcg
c3VwcG9ydCB0byB0aGUgbGF0ZXN0IG1haW5saW5lIGtlcm5lbCwgd2hhdGV2ZXIgdmVyc2lvbg0K
aXQgY291bGQgYmUuIFNvIGlmIHlvdSBzZW5kIGEgcGF0Y2ggKHBsZWFzZSBmb2xsb3cgdGhlIGNv
bnRyaWJ1dGluZw0KZ3VpZGVsaW5lcyBpbiBEb2N1bWVudGF0aW9uLykgaXQgc2hvdWxkIGJlIGEg
ZGlmZiBhZ2FpbnN0IHRoZSBuZXh0IC1yYzENCihzbyBpdCB3aWxsIGJlIHY2LjgtcmMxIGluIHR3
byB3ZWVrcykuIFlvdSBjYW4gc2hhcmUgZGlmZnMgZm9yIG90aGVyDQp2ZXJzaW9ucyBhcyB3ZWxs
IG9uIHlvdXIgb3duIHdlYnNpdGUgYnV0IHRoZXJlIGlzIHVzdWFsbHkgbm8gYmFja3BvcnQNCm9m
ICduZXcgZmVhdHVyZXMnLg0KDQoNCj4gRm9yIGluc3RhbmNlIGlmIHRoZSBkcml2ZXIgKGF0dGFj
aGVkIGlzIDUuNCksIGNhbiBpdCBiZSB1c2VkIHVwIHRvIDUuMTjigKYgb3Igc2hvdWxkIHdlIG1v
ZGlmeSBpdCBzdGFydGluZyBmcm9tIHZlcnNpb24gNS40eC4NCg0KDQpJZiBpdCBjb21waWxlcywg
aXQgd2lsbCBwcm9iYWJseSB3b3JrIGFzIHdlbGwgYXMgdGhlIGNvcmUgaGFzIG5vdA0KY2hhbmdl
ZCBtdWNoIHNpbmNlIGl0J3MgYmVlbiBjcmVhdGVkLCBidXQgdGhlcmUgaXMgb2YgY291cnNlIG5v
DQpndWFyYW50ZWUuDQoNCg0KVGhhbmtzLA0KTWlxdcOobA0KDQoNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
