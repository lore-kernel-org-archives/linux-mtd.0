Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842A6CDB482
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqLF3eUpkGQtNlCXmd+1H39zPJ+mS57GvEtlEh5+X/U=; b=I0ZQEO3P3HCUi8
	mBzQUVjonXbDG9M1xnae5Vm/sEOhMTgI+utT5X0yHhftWnF4fsLqJDy0DP1OozQEvj6yFuGYbUu7A
	VbPr3BEG+8oS97ZK00U22uUbE+mJKunjMKU31axPsRTmqpw+W7bX0UIFSUcuy7kCIUJuperaYRicL
	AbY4sLva1SxdooFmX0iknEl+7JgM9qm0jKdEMfOLu74//DqZDONNzgaCANrWscN8xAyJBkv2wvM6O
	yhcqjuDiuj8uMO7GEL0qknG2foWjHp9pTsMq8lYScBbgKbHj10bHqSSslNJYMUA9Ld54h0e8ePG+u
	vbQfWBev9MjpG06qGt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1D9-00E4Fr-2C;
	Wed, 18 Oct 2023 07:43:23 +0000
Received: from mail-me3aus01olkn20831.outbound.protection.outlook.com ([2a01:111:f403:7004::831] helo=AUS01-ME3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1D3-00E4FA-0O
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 07:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMj3H9yPJL5Zm0VL5qc3gDume7OJ+uNwPET4fof92EwFIB63HS7CSOSqzgW1J8ZVlrAy36DEkZVjc4mJJl5PkPJdPwmuqfzmUW4VhK3zN7dWq17BNKHMryJfPbolFruXGt6zJbh61hsdAueTJcKLmMkPKbdwVimdG2D8TT43SS7Sfsc/98L5BhZU0+7PqbtXWoJBORnvFpxH1SX8SIP12S3gUl2bXaRCPWi92hNLLXnmUU06GPVCFVttXCRSPi4TY5POHAwZQWUuCQALvm+90K/jcYQwU2v6d29fBDfFn33CmKRsPqAwTbVO0hM71qwQBaE7ZDwIrMgDdlZdyyJZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R//LHjAahlZQothNxrY4o3lhDURchvs4q81IamKhQc=;
 b=AHE2Cccin0ukwcNU0b27y6U13TZhJ0ZIGUTrRhQiQMBKnOqryJVTMAe49JoVEXxtULEnqNXtZdaxarlZkLKJRsj5XxrmwFYBBgWH/9QVLs8Uvtl2/te9tGMJ/s+ir2HRryosQ38h9mmlQjmMAZyjfZS0mfM1X4ZvmKJLCq/+9Wm4fnXm0ymA0R4+tY7oZRcE5CdkM3r3UDF3Vd20y/z9SzPCPxwirKCjIhNN+lSqze6FcYQ8wgkHhKlAUUg/k3WKV1R9GoikO7ioAyWb39Q0WsofIDjmPuQ9Nx/OVolvk4SBI3Tk9+b9kNejxOVhYmNRQA2fJXpYh8zAQizBr4jHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R//LHjAahlZQothNxrY4o3lhDURchvs4q81IamKhQc=;
 b=RzGBIUxZcW51pitDqeqJ2IZJDFwPLy6YD/aMKS7H7xFaLrrg0K/YsMGj+U4106OXMoSbdjbpNekTgD9nYtPnBmOzmAwXGuA8MbI5l/Zd8fx3fk/RbHjEssnNbdW7PkM8ShzfHwcfkX0IZhWsq21U3iS/CBxQSDr/CL4Wq14fVZ4nc1jP2a/IONWpogRHTNIflC+mMjG+Lzo66es7iB1fxmSXBsx1eqX7J2NzLRwMGjllCxsZ3qklIzUbuRwXIMveAiJjeTEpXznUWGTTjtrP4RPEyonU5/M3lWfOxtAvsyg7Om5s+ko1ObrrDXOWmCLcun/tpsy18l1yowdE0KD2yA==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by ME4P282MB0822.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 07:28:40 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::b729:fb11:fe5a:5366]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::b729:fb11:fe5a:5366%6]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 07:28:40 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: ubi: some invalid code in the function scan_peb
Thread-Topic: ubi: some invalid code in the function scan_peb
Thread-Index: AQHaAYgTG91tdv/8dkayS7JsgFhh8LBPFkWAgAANbKA=
Date: Wed, 18 Oct 2023 07:28:40 +0000
Message-ID: <MEYP282MB3164701A51B29DB61B106566BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
References: <MEYP282MB3164B8C92CD51ACC0897F0F2BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <497aa593-5999-821d-a2b7-69c0953e1e3e@huawei.com>
In-Reply-To: <497aa593-5999-821d-a2b7-69c0953e1e3e@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [Hn1Z6PudlYS0XXYDxkqfNy/uk2ToXzBSc/x+XFGQPcI=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|ME4P282MB0822:EE_
x-ms-office365-filtering-correlation-id: d4e80801-104d-4028-6073-08dbcfabd9fe
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1+dZ3uQjp9TaJk5ABjlRkOujkKcQFd+h4Mc3l+xNrE/dDlcJ6ImF6F2o2f1auI7oUqIafQr0/zKVlhw/jiKtSU9zldyz1lKOFsgK3LauSMDzN4fzy5gAQ2KSccqj/T3wBNEnNC/26VzFL7UII7U55mk6P5lKOWtm0oXN4PGdwuciVPdGbIB5/Xtwom9hYqiMSpby+r4QMCMQGrquPa4MvI0kwxfF7hitHiW5SbXdk1te9hLxUBH6k5TEq6jKEhbbZmWYiCu494sOGdAsch2C2ZgqC2KPjSlcE64IWwl81MS4fJKmBdpkTSQOQZhLFKH7vJlTGCF21s+hAze5JLpBXd/UqP6OMFAhIPu1uZ7mp6FomYklGHcP+3PM5LccR//Qj/QlkghfLYbbgMD/eYBP25BjOqUar0EU7P2FKCl/1SGsPozTUF0sxKscgzqzWDdCFLGDZ0cDdub/F1rqOdF3wTXmDeBx1WJuQsRrDeBRWcnm5+nUeEm42/AhozX0cT3J3lJ2UrWbiKTbriRYqTWjJlXbNBhSJMfdTkR9SRnXp32GiGvhvoi1J1Jzl9n+Maw
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXNIaHVQRVk4N3Fxc3IxZGFCUWIvOWhXc21YQkZ2S1VxTTh6eEg3NGpFTVEz?=
 =?utf-8?B?cDl3aGl5Ly9zTXpkcGtkdC9QQlh5eDRicTRlL2NyTi84UnJZTE5Wd0MybU9J?=
 =?utf-8?B?bWwxelNOVzJRbjBucXUyUkJTaXJJa0NLYlNSd1ZHVXVOOExwU3Rlc0I0a3Vl?=
 =?utf-8?B?Y1Ivby8zWTl2dnozbmtFdGU2VFc0d01LSmhmajJ2SGVFTEhXMGs1cWpXUS9W?=
 =?utf-8?B?OTFyL1A2blpsQkpEa1pveWRqa01KVW9qQkNQSUUrMmZQcEdoSVpsMkp5VEpu?=
 =?utf-8?B?SHJncHpwSXZRYk53RXZUMm1MbGhTd010SFFaUHFKdTdBaVNsZm9DK1J2Y1pJ?=
 =?utf-8?B?eUNETVBoYWZ6ZjVhRitJOFpIenhEZ09sdUFrZ1FGQURzQWZFNXdXL0FVMFV5?=
 =?utf-8?B?eGNUcCtIa3dQaTB4QWV1azRDb3Z4aTI1SHVpdXd0c0tFcEtPYU9sSmZRcGxZ?=
 =?utf-8?B?Wi8rS3RmTExWVU5uV1luaE9XWFlNKzUyeG5aQS94T2hka1FhMW1Pa25GWDYv?=
 =?utf-8?B?bXBsQnJqdDkrRFZqQUZaZDMvbENadUxDSnZaUmkrNjRCRUdlVStTSUk2NVQw?=
 =?utf-8?B?MXZUNkdQaDFJNVpIajdjUm82WXFFK3lkUklBTitUaGpRYkcwLzBGVUI1bERU?=
 =?utf-8?B?SnZtWnpEay9EVXpQOFdvdVB4cVlBZHFDbFFlVk9aelM0RXNzbUZkcHhiNWgv?=
 =?utf-8?B?UnQ2S0dycHF2b0tWbSt0ZStON29ZdW9VRk50OXhQQUpjelh6cWRXdUJSSjkz?=
 =?utf-8?B?cy9GNGdNUWFKRHkzd05iVm9yd3dub0ZWZGY2d0VOQ3B2UGxJNjEyTGY4YkxI?=
 =?utf-8?B?R1ZJdFRuazJuNm9KNktoRlRSaGNteWJHa3FMZ0puSElaY0NPaVkzTkJZN0I0?=
 =?utf-8?B?RlMrU1g4TEgvbGJDei9oRjBUeEgzeTE3RTJRUy9vZlMxak5WaUorV0hRZjBF?=
 =?utf-8?B?Tkg4Z3paL3FyWnZxdFlCSkZwdzJ4ODdmbWpTMjdVdmczQ0lOc0JhV3ZiL1Jm?=
 =?utf-8?B?TnQzNmR0aE0xbFFwL1JoQXZOaDlSZjA4amZROWRocmNjMVdqcEs0R0tKdWFv?=
 =?utf-8?B?Y0dZUUVHNVE1cDYyVFFlR05OMHBIQ1ZhQStLSTRpS2EyOE9FUVY1SWZKYVRk?=
 =?utf-8?B?UFJndVNIQXRCTW1ZbWUrLzdxdStxTjJ3R1k2YytNbytFbmlqdUdjOEJWUnFU?=
 =?utf-8?B?Ym1DdXF1K3k0OG4rbUZ3VVp3Z2JwSGgvbmFrRFhNeEJsNENZQXFnNXRVb0Uy?=
 =?utf-8?B?ZW43WTRDM21CQUxDYUxCRG1uMGQ1ZjlTM0V2dTl4Vk1rNVY2aHZjZ1VsSmFt?=
 =?utf-8?B?YkNJbEoxYWtselRGMFF6MzlaekRHeFEwOWZ2SzcxbGxIQTVLU0JiSUxoNjVO?=
 =?utf-8?B?eXBOR1FXQlZ6czg4dWFabitEb295TTVLeDdjMzJzVWh6ZEhFdGhvYzVFTzRN?=
 =?utf-8?B?djdLeURKTnRDN3RmZHVkbE04R0NPQXZYRDdnc3dhNG1YYWNHeit4MWdyV0k5?=
 =?utf-8?B?YVBxRUMxbUZybzhWT2hQSVpTT3phTmVWd3RFM21UdDNvVUdNNklQQ0dpK0hq?=
 =?utf-8?B?L2QyMEhqQ1NvMEpodklldXN1bnc4c05aQ052TElCYjNSMkEvU1JLaEJzSWho?=
 =?utf-8?B?Wlh0VWFuc0V2Zzlzc2ZBWk5yd0UrS1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e80801-104d-4028-6073-08dbcfabd9fe
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 07:28:40.6707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_004317_169658_5200A469 
X-CRM114-Status: GOOD (  17.01  )
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

VGhlIHBhdGNoIGJlbG93IGNhbiByZW1vdmUgdGhlIGludmFsaWQgY29kZS4gSXQgY2FuIHBhc3Mg
dWJpIGNvZGUgYnVpbGQgYW5kIHViaSBhdHRhY2ggY2FuIGFsc28gYmUgT0sgZnJvbSB0aGUgdGVz
dGluZy4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYXR0YWNoLmMgYi9kcml2ZXJzL210
ZC91YmkvYXR0YWNoLmMKaW5kZXggMTBiMjQ1OWY4OTUxLi44MjY4Y2E2YTkxZDEKLS0tIGEvZHJp
dmVycy9tdGQvdWJpL2F0dGFjaC5jCisrKyBiL2RyaXZlcnMvbXRkL3ViaS9hdHRhY2guYwpAQCAt
OTk1LDI4ICs5OTUsNiBAQCBzdGF0aWMgaW50IHNjYW5fcGViKHN0cnVjdCB1YmlfZGV2aWNlICp1
YmksIHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpLArCoOKAguKAguKAguKAguKAgmlmICghZWNf
ZXJyKSB7CsKg4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCaW50IGltYWdlX3NlcTsK
wqAKLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgi8qIE1ha2Ugc3VyZSBVQkkgdmVy
c2lvbiBpcyBPSyAqLwot4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCaWYgKGVjaC0+
dmVyc2lvbiAhPSBVQklfVkVSU0lPTikgewot4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCCdWJpX2Vycih1YmksICJ0aGlzIFVCSSB2ZXJzaW9uIGlzICVk
LCBpbWFnZSB2ZXJzaW9uIGlzICVkIiwKLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAglVCSV9WRVJTSU9OLCAoaW50KWVj
aC0+dmVyc2lvbik7Ci3igILigILigILigILigILigILigILigILigILigILigILigILigILigILi
gILigILigIJyZXR1cm4gLUVJTlZBTDsKLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
gn0KLQot4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCZWMgPSBiZTY0X3RvX2NwdShl
Y2gtPmVjKTsKLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgmlmIChlYyA+IFVCSV9N
QVhfRVJBU0VDT1VOVEVSKSB7Ci3igILigILigILigILigILigILigILigILigILigILigILigILi
gILigILigILigILigIIvKgot4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCCICogRXJhc2UgY291bnRlciBvdmVyZmxvdy4gVGhlIEVDIGhlYWRlcnMgaGF2
ZSA2NCBiaXRzCi3igILigILigILigILigILigILigILigILigILigILigILigILigILigILigILi
gILigIIgKiByZXNlcnZlZCwgYnV0IHdlIGFueXdheSBtYWtlIHVzZSBvZiBvbmx5IDMxIGJpdAot
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCICogdmFs
dWVzLCBhcyB0aGlzIHNlZW1zIHRvIGJlIGVub3VnaCBmb3IgYW55IGV4aXN0aW5nCi3igILigILi
gILigILigILigILigILigILigILigILigILigILigILigILigILigILigIIgKiBmbGFzaC4gVXBn
cmFkZSBVQkkgYW5kIHVzZSA2NC1iaXQgZXJhc2UgY291bnRlcnMKLeKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgiAqIGludGVybmFsbHkuCi3igILigILi
gILigILigILigILigILigILigILigILigILigILigILigILigILigILigIIgKi8KLeKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgnViaV9lcnIodWJpLCAi
ZXJhc2UgY291bnRlciBvdmVyZmxvdywgbWF4IGlzICVkIiwKLeKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAglVCSV9NQVhf
RVJBU0VDT1VOVEVSKTsKLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAgnViaV9kdW1wX2VjX2hkcihlY2gpOwot4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCcmV0dXJuIC1FSU5WQUw7Ci3igILigILigILigILi
gILigILigILigILigILigILigIJ9Ci0KwqDigILigILigILigILigILigILigILigILigILigILi
gIIvKgrCoOKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgiAqIE1ha2Ugc3VyZSB0aGF0
IGFsbCBQRUJzIGhhdmUgdGhlIHNhbWUgaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyLgrCoOKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAgiAqIFRoaXMgYWxsb3dzIHVzIHRvIGRldGVjdCBzaXR1
YXRpb25zIHdoZW4gdXNlcnMgZmxhc2ggVUJJCgoKRnJvbTogWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE4LCAyMDIzIDE0OjMx
ClRvOiBSeWRlciBXYW5nIDxyeWRlcmNvZGluZ0Bob3RtYWlsLmNvbT47IGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KU3ViamVjdDog
UmU6IHViaTogc29tZSBpbnZhbGlkIGNvZGUgaW4gdGhlIGZ1bmN0aW9uIHNjYW5fcGViIArCoArl
nKggMjAyMy8xMC8xOCAxMzo1OSwgUnlkZXIgV2FuZyDlhpnpgZM6Cj4gSSBqdXN0IGZpbmQgc29t
ZSBkZWFkIGNvZGUgaW4gdGhlIGZ1bmN0aW9uwqBzY2FuX3BlYiBpbiBkcnZpZXIvbXRkL3ViaS9h
dHRhY2guYy4KPiAKPiBJbiB0aGUgZnVuY3Rpb24gc2Nhbl9wZWIsIGl0IGNhbGxzIHZhbGlkYXRl
X2VjX2hkciB3aGljaCBjYWxscyB2YWxpZGF0ZV9lY19oZHIuIElmIHViaSB2ZXJzaW9uIG9yIGVy
YXNlIGNvdW50IGlzIGluY29ycmVjdCwgaXQgd2lsbCByZXBvcnQgLUVJTlZBTCBhbmQgYWJvcnQg
dGhlIGZ1bmN0aW9uIHNjYW5fcGViLiBIb3dldmVyLCB1YmkgdmVyc2lvbiBvciBlcmFzZSBjb3Vu
dCB3aWxsIGJlIGNoZWNrZWQgYWdhaW4gaW4gc2Nhbl9wZWIgYW5kIHN1Y2ggY2hlY2sgY29kZSB3
aWxsIG5ldmVyIGZpbmQgdGhlIGVycm9ycyBiZWNhdXNlIHN1Y2ggZXJyb3JzIHNob3VsZCBoYXZl
IGJlZW4gZGV0ZWN0ZWQgYnkgdmFsaWRhdGVfZWNfaGRyIChhYm9ydGluZykuCj4gCgpZZXMsIHJl
ZHVuZGFudCBjaGVja2luZyBpbmRlZWQgZXhpc3RzIGluIHNjYW5fcGViKCksIGNvdWxkIHlvdSBz
ZW5kIGEgCnBhdGNoIHRvIGNsZWFuIGl0IHVwPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
