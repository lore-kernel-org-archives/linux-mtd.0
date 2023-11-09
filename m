Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3330AC4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 08:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkhcmwFgiAWVc6L/UAAGGoyTu162OdkyD29ianHTgd4=; b=gQwLdIsmo0Jdmv
	lLMnNldWnz7Zm/m01UOkrFhW/H67dbwed9+qtXDCByUmq1quaph8y0JIGB9E3Gd0cCjcXwQgZ0y9i
	cPTNj+E14PpzAIuET9nRhoOdXCPVXfo+iHey7ErDPTqHFwmF71RjxcYnWkpTElXUUZ6TlwU8SVceF
	o5+tN2nUBntS0KuanE6Iv7j2/b/CHF+EE/bo7UQkwoocSBUZAMqBQB86pRBiFbUFtYQgaTpgqMvDL
	xXmx82FroerhqZy/fQ7vX5hayqA88hhWa2rUulShoEpzTM2WBjdbk2wujGz+ioo+hHiaQXtpCxTRf
	wquTWiTd401pOgUcYqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10Oe-005ckd-1e;
	Thu, 09 Nov 2023 08:28:16 +0000
Received: from mail-os0jpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:201a::700] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10Ob-005cjR-1H
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 08:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiqEil5M2QwLO2N/ZmOLmWx5iRcaKdHsJmLwYeZnPQ8KAbKy/X8o25o65tkwRxB8cMkQoYKUGpHEeZi/7kflghHceFXOf9IeSnEswq+yIXE41qLekJFEY/eNO+iKePfibn80aw9ZMjIodHpoogaah0n10KxDG/b6WiFva9OU3cll0iKQOV7R5NGgno65CSG8+p9RYvPQ6ZwHtKnhYyd3BPG/5nbQ8rmW9fxGZTan/2USGP8DdqOzF2hqTPg+GDDZ4kYyx3vjJjo8lhW8OsDetjFs6/BvSsHWxCA79yg3xGHtcZ03RUGfj27/iz3lYiWj4ESQ2XCjXYtOEW5TNpacHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SONcvC7YRQxAoUP/5KgTPjKJvEmkPW6lTmT8voTuJ4=;
 b=luLYs8Jz5xSec8bPHoFztILLyaaG06QJtZPjwsrGPUX69FfMiK7jYT3OJvIUD5HEKXMWhw2j4DLbUk/NmP8tqRS+ddER9XzMDpXXwSAwtPnWqFF0irB9ZzX8rQzHHhpzCKPZyBuEAcNvcWzH2zsW6FxYFympG2HtkJTVFFsiLaGA/xq2mzgFv1+964qF4pKwboHCFL+AGZ5ZeFfqrhqtiDOFmxD94oBOselXB6PbmM6C0wpO9ns02Eb5JEqUvGN1WIQqqMCeyk7x95M/vpJV7ZyW1S3O08vzYWjqtQvT8Jj+eP9klpaGONjHfZgIuO17N4e4/ttJox267SfJP9/+1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SONcvC7YRQxAoUP/5KgTPjKJvEmkPW6lTmT8voTuJ4=;
 b=vZwN2d4gYZG1ePUe9bmTx1HijPqScFTUGs1ImW08WuAjR4tWprNnn+mgg81Nl8oDfCLgBsOvuMqC38t5kutb5Ak28spYM0Mh/88N+sjn8PsdUSdcsvwqBJ0j4c8+N4e0flVieZ4lEktDixFRugP11np/tJls9FNsoXyLvJXlV4k=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS7PR01MB11650.jpnprd01.prod.outlook.com
 (2603:1096:604:244::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 08:28:00 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6cb:4ed9:b0be:36c0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6cb:4ed9:b0be:36c0%7]) with mapi id 15.20.6954.027; Thu, 9 Nov 2023
 08:28:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Michael Walle <michael@walle.cc>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 1/4] spi: spi-mem: Add set_iofv() callback
Thread-Topic: [PATCH RFC 1/4] spi: spi-mem: Add set_iofv() callback
Thread-Index: AQHaEmav+3EHjBv9JkSfTRNxOPdrDrBxn9AAgAAIEwA=
Date: Thu, 9 Nov 2023 08:28:00 +0000
Message-ID: <TYCPR01MB11269CA11FA44B8649EA3398F86AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <20231108171149.258656-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXdzbtR+ruXwfS1a74rnH494kMsFvaT9MTz7cW-LFpB1A@mail.gmail.com>
In-Reply-To: <CAMuHMdXdzbtR+ruXwfS1a74rnH494kMsFvaT9MTz7cW-LFpB1A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS7PR01MB11650:EE_
x-ms-office365-filtering-correlation-id: 022fae3c-a4d1-41a6-c78c-08dbe0fdc8c5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: StF6r7jsMcWB/EXlUdQrAld8qNN4PFIfWiskzgdGhyRoCNh5ORugeUdS/0tEZBbTP5YoreJTeGfXyL9KUr+nu6RgRALXTP4DotiVQTZzNwlznKImDJ7Pt+JbMfcl8F+K5SYcZSmIMxolYfJJ0piApM5VfRhGlfhrA1c37PwPdmBNsI4isIGnFLQ11HYxE4RR2ND42A2t/0zI5V62Axo4vcXK/mcxrM4ovU5zUO7G6Uqu+8ve2ExhuRw13+UEcNT6qCxjkMCHzrcMu6dtrWJK37u8i370B64Kjlo96Mbu0C8DHfMmUmwBDXy8JjBgPxnuZeX7rYwPptA5mUW5Q4yV9gCuZ1S+gc9Xbj9/WEZ6Bj4rUaqcPeA6mV/et+VQcVjTtQ1YkYtccFu5EW070kdTPd1PpgFDgERh8p8kUYT6jKweF9JiJnICeNzazBuwzMU/ViQ6FhomJW/E39pvZFodzz1W+wnsuvb9FbW15nYfA5/LKgZlEpCnnxGSdGw+oGKZI5BI259Je7Ux/fGj0mZcb376ElHf6eHtIiQK2QdvUL7PcGlcSU6GG4Q5gs9NiXlE3B55Dyw0sJBHSxMI0Hgn98xtOqUA4UY2muFRXJWcQlJ+/dG66Z88NPdx1bc+eFIL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(9686003)(55016003)(83380400001)(26005)(38070700009)(478600001)(41300700001)(52536014)(8676002)(33656002)(2906002)(8936002)(5660300002)(4326008)(86362001)(66946007)(66476007)(66556008)(66446008)(76116006)(54906003)(64756008)(6916009)(316002)(53546011)(6506007)(7696005)(71200400001)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUsyVnFtTjg5bGw0enlUVm5UdjZnOS9QNVdSdFZjTHVmVGt2VXg5RmY5MGVI?=
 =?utf-8?B?YmRlMi9yc1NnZ2I2K0M2aFVwbmQ5aTI4cVJjbXd1aWdYbVVnalRoNHUrR1hk?=
 =?utf-8?B?OWtMU0Qzdkl6VFkyVlRzZkNCWnFKMmVqZXYyNnN6VkFXYUx1NlZqQVhlZFgv?=
 =?utf-8?B?L25icEJhU3lCNnNOOXFEWjJPbUlJOVdhYTQzT0RHN2dJTDc5WG9aUUpOcHZl?=
 =?utf-8?B?RDRoMVEwTHZ2V0VQNm5NMDVmNzUzRGFZdnl3cmhSRWxqMEkxTHdSL2MzVW1z?=
 =?utf-8?B?bk1VWHpjSHZEaFU4Q3NnK1JMU1Bvd1hsTWZrZHFYQm5Ta2VPT0ZZendUY1dv?=
 =?utf-8?B?ZlgrbnV5Nm5VL0hjSnFkNVdDMDdxTlp4aERFWHR2ajhjRU9kdW9VdUt1Q2Uv?=
 =?utf-8?B?TWFQcGxaSFRndGNVcm5OV050amJqMmd3ejJ3YzhtVTF1Zis1bWRxazJXbVBp?=
 =?utf-8?B?WG90eDg4eGJPWlZ3dVJhenBDS0RCKzkrSmIzU3prMVdZcUxXNnRvcnBjM1Yz?=
 =?utf-8?B?SExEd08reDB2a0FvSUlKUG5vcWZqRlpWRWFYaHVTckpLdXphTzNxMkl5Mkhj?=
 =?utf-8?B?dlRxdTBWTVNCS24yd0EzRG9ZZmlHUkFJa2JwL2wycXloVHNBWFZPM2JrOUpQ?=
 =?utf-8?B?OVgxakFHSCtlR085QWhiWlZUVEhsUEVCMGZxNUNxL0E2Ui90RTNEQ2lOZks0?=
 =?utf-8?B?YVNSdnJGU21MVjdFNFAvMjgrRTlrcjNzci82MDN1elZrK3BTZFp1VGt5N0Mz?=
 =?utf-8?B?Qzl3Y1dRUE9HYmxCU1hNQ096QTcra1MwNGRUU1lWdFFoSWE3eUpVbk91VExi?=
 =?utf-8?B?NG1qaGRvQ0xYTlVHYVBFSTU3a3A5UGgwTVRDSnN3ZmIxRWRmdVlMZnVTSGp1?=
 =?utf-8?B?dU9nZmhSOXVzNFp3WTUvanBNN28vQ3F4U251T3pGNkUrdzNGNlNqa3Y5UVZY?=
 =?utf-8?B?VHV5Uk4rSDlDRk9xOHFLd2hpbWRGMk1MN2M2dXdLeWc0V0RndExvSldNMjNQ?=
 =?utf-8?B?QW1hYzdOQnRJRWV0NXdEblhKZWlZOXYxb0h4TmpFNVBUVGhNT0V1TWUvaTRG?=
 =?utf-8?B?eDFSUXNGd2UwOXl2NVFaS3Y0UlRuZ1BHMlYxa2tHZjlZS3RJcWhTaWZpM2lE?=
 =?utf-8?B?cFp0bFU0Z01RRXhwY1B5MVJIK2o2V1BqcGJBRWRxeVFNaVo3ODE5Nyt5S0dC?=
 =?utf-8?B?ZFJ1VXNnTjlrayt3S3JyR3Q3QUF4UkxKaWFZRnBVMUY3dTg2S1F3am1EWFM3?=
 =?utf-8?B?VlFjT1ozN09pUXFTM2dwRUd5RE4rTWNqVFZlVWFGYzNsVVErYnUzbTRKdXVm?=
 =?utf-8?B?LzcyVjdBbFk0VDcyaDlFVHlzMm91NDFKVEozb2pJVXdlcGtHdHplZGhFOWFI?=
 =?utf-8?B?R3BVVHhDWnhXeEZLQ21aaGlBUVh2eEltU24wTXZMOXNzc29XcVRFSWFOWnJD?=
 =?utf-8?B?NG4wNkx1TnhQeHdwdEJMSGRLd2RhZ0FYQUJNOWFsQkVnKys0K1FEYlBVUGV6?=
 =?utf-8?B?cytkSElTOW90b0ZxOFlMTVVmTkpGR0R4S042T0hLcWFhd1VNZ2V4NHBKNmU2?=
 =?utf-8?B?L1Y2UDNlbEUyK0NpNDJHc2RBK0F6OTFMaEM4MHQ2RGVlK0k2S3Y3cmZWd0tp?=
 =?utf-8?B?Tk5PTTVjNGZzVllNVk5wUllaeXdJUU5ucU03VDRyakJwZDYzbmgvL2U3NjZF?=
 =?utf-8?B?TmNKaXFVVGkvbXhRZUtvcnVSbDE4NUM1aStiQ3BEV2lJYkF3VUNYaXA1VG42?=
 =?utf-8?B?c3pHbzVwRUd5Y1ZtSzJqWE5CME9XTnMyamtmcEhDWXpiMnFrVUppWWVsL1dy?=
 =?utf-8?B?QVRhNm0zL2ZxRkIrY1VnOGNnaTBsY3A3VmR0ejUyYTRPNjdXY1RZUTNVY0RZ?=
 =?utf-8?B?MG1sbVN3NTk5VUlWVFl6TWZldDUrWFNETHBDT0VZRnFLVTJXYkZtS3hHcFRX?=
 =?utf-8?B?di9nWC9NRGltaTRGWFFObkUyV0ZjQVBScUN1cWxqSVdPN3MxZ2V4a0pGYm1C?=
 =?utf-8?B?dVdPcklpdzVnWTdiMi85eDd0WGxRbFEzRmlCcytHcmdieTFvV0g4RDJGQ3pr?=
 =?utf-8?B?MlJTSGZlVEZrU2tVRHpEcmN2OG9ZNkdtTVZ3NS9uL3NISVpKRXdNb2VJVUxL?=
 =?utf-8?B?ZmtXYTBDdUY2alYzaVJiMTBESnBLK29GNXBaTm9tVk1qaVZkNWtyU0c5QzUz?=
 =?utf-8?B?ZEE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022fae3c-a4d1-41a6-c78c-08dbe0fdc8c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 08:28:00.2808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7Azlh+LiGVN64aPq+MR27xbYO/1Gtuc7iHWaUleDYFRmtz54rtv4vmK0LJ6UJaZAxcqn5ohGxP1do95Ir3O6vx2nX9MF/wRN158MO1rlVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_002813_898735_F4896447 
X-CRM114-Status: GOOD (  32.55  )
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

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggUkZDIDEvNF0gc3BpOiBzcGktbWVtOiBBZGQgc2V0X2lvZnYoKSBjYWxsYmFjaw0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgTm92IDgsIDIwMjMgYXQgNjoxMuKAr1BNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQXMgcGVyIHNl
Y3Rpb24gOC4xNCBvbiB0aGUgQVQyNVFMMTI4QSBoYXJkd2FyZSBtYW51YWwsDQo+ID4gSU8wLi5J
TzMgbXVzdCBiZSBzZXQgdG8gSGktWiBzdGF0ZSBmb3IgdGhpcyBmbGFzaCBmb3IgZmFzdCByZWFk
IHF1YWQgSU8uDQo+ID4gU25pcHBldCBmcm9tIEhXIG1hbnVhbCBzZWN0aW9uIDguMTQ6DQo+ID4g
VGhlIHVwcGVyIG5pYmJsZSBvZiB0aGUgTW9kZShNNy00KSBjb250cm9scyB0aGUgbGVuZ3RoIG9m
IHRoZSBuZXh0DQo+ID4gRkFTVCBSZWFkIFF1YWQgSU8gaW5zdHJ1Y3Rpb24gdGhyb3VnaCB0aGUg
aW5jbHVzaW9uIG9yIGV4Y2x1c2lvbiBvZg0KPiA+IHRoZSBmaXJzdCBieXRlIGluc3RydWN0aW9u
IGNvZGUuIFRoZSBsb3dlciBuaWJibGUgYml0cyBvZiB0aGUNCj4gPiBNb2RlKE0zLTApIGFyZSBk
b24ndCBjYXJlLiBIb3dldmVyLCB0aGUgSU8gcGlucyBtdXN0IGJlIGhpZ2gtaW1wZWRhbmNlDQo+
ID4gYmVmb3JlIHRoZSBmYWxsaW5nIGVkZ2Ugb2YgdGhlIGZpcnN0IGRhdGEgb3V0IGNsb2NrLg0K
PiA+DQo+ID4gQWRkIHNldF9pb2Z2KCkgY2FsbGJhY2sgZm9yIGNvbmZpZ3VyaW5nIElPIGZpeGVk
IHZhbHVlcyB0byBjb250cm9sIHRoZQ0KPiA+IHBpbiBzdGF0ZS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lbS5jDQo+
ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jDQo+ID4gQEAgLTI5Nyw2ICsyOTcsMjYgQEAg
c3RhdGljIHZvaWQgc3BpX21lbV9hY2Nlc3NfZW5kKHN0cnVjdCBzcGlfbWVtICptZW0pDQo+ID4g
ICAgICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0KGN0bHItPmRldi5wYXJlbnQpOyAgfQ0KPiA+
DQo+ID4gKy8qKg0KPiA+ICsgKiBzcGlfbWVtX3NldF9pb2Z2KCkgLSBTZXQgSU8gZml4ZWQgdmFs
dWVzIHRvIGNvbnRyb2wgdGhlIHBpbiBzdGF0ZQ0KPiA+ICsgKiBAbWVtOiB0aGUgU1BJIG1lbW9y
eQ0KPiA+ICsgKiBAdmFsOiB0aGUgSU8gZml4ZWQgdmFsdWVzDQo+IA0KPiBQbGVhc2UgZG9jdW1l
bnQgdGhlIG1lYW5pbmcgb2YgdGhpcyB2YWx1ZSAoaS5lLiB3aGF0IGRvZXMgYSBzZXQgb3IgY2xl
YXJlZA0KPiBiaXQgbWVhbj8pLg0KDQpJIHdpbGwgZG9jdW1lbnQgdGhlIHZhbHVlIGFzIGJlbG93
LCAyIGJpdHMgZm9yIHNldHRpbmcgSU8gZml4ZWQgdmFsdWUgZm9yIGEgcGluIGFuZA0KdGhlaXIg
dmFsdWVzIGFyZQ0KDQowMDogVGhlIG91dHB1dCB2YWx1ZSBpcyAwLg0KMDE6IFRoZSBvdXRwdXQg
dmFsdWUgaXMgMS4NCjEwOiBUaGUgb3V0cHV0IHZhbHVlIGlzIHRoYXQgb2YgdGhlIGxhc3QgYml0
IGluIHRoZSBwcmV2aW91cyB0cmFuc2ZlciAodGhlIHBpbiBpcyBwbGFjZWQNCmluIHRoZSBIaS1a
IHN0YXRlIGlmIHRoYXQgd2FzIHRoZSBjYXNlIGluIHRoZSBwcmV2aW91cyB0cmFuc2ZlcikuDQox
MTogVGhlIHBpbiBpcyBwbGFjZWQgaW4gdGhlIEhpLVogc3RhdGUuDQoNCkNoZWVycywNCkJpanUN
Cg0KPiANCj4gPiArICoNCj4gPiArICogU2V0IElPIGZpeGVkIHZhbHVlcyB0byBjb250cm9sIHRo
ZSBwaW4gc3RhdGUuDQo+ID4gKyAqDQo+ID4gKyAqIFJldHVybjogMCBpbiBjYXNlIG9mIHN1Y2Nl
c3MsIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvdGhlcndpc2UuDQo+ID4gKyAqLw0KPiA+ICtpbnQg
c3BpX21lbV9zZXRfaW9mdihzdHJ1Y3Qgc3BpX21lbSAqbWVtLCB1MzIgdmFsKSB7DQo+ID4gKyAg
ICAgICBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXIgKmN0bHIgPSBtZW0tPnNwaS0+Y29udHJvbGxlcjsN
Cj4gPiArDQo+ID4gKyAgICAgICBpZiAoY3Rsci0+bWVtX29wcyAmJiBjdGxyLT5tZW1fb3BzLT5z
ZXRfaW9mdikNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGN0bHItPm1lbV9vcHMtPnNldF9p
b2Z2KG1lbSwgdmFsKTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+
ICtFWFBPUlRfU1lNQk9MX0dQTChzcGlfbWVtX3NldF9pb2Z2KTsNCj4gPiArDQo+ID4gIC8qKg0K
PiA+ICAgKiBzcGlfbWVtX2V4ZWNfb3AoKSAtIEV4ZWN1dGUgYSBtZW1vcnkgb3BlcmF0aW9uDQo+
ID4gICAqIEBtZW06IHRoZSBTUEkgbWVtb3J5DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
Zw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
