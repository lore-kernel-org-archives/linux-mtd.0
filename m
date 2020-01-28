Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1606FC33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 10:52:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD3502467E
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 10:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V6wYEL6g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=niko.eu header.i=@niko.eu header.b="P8FlMlSN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD3502467E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=niko.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s/d//eHaCo6AT7uUeKzgdFAJAip2rsx68POfPL1+iDs=; b=V6wYEL6gJDAXrWAFEMSyhfh2Tf
	ixHbp1E6qpgEHeu1LtJZo6QLg1BSBbju5nVYHbAYbh972qYBaI8zhJ4WvzaimzmZEGlnD9bVRIIBn
	+7lxgZ+iQujYyKmus+7pXzb4/vdtUHT2AfXGisruZohI+l0AhegTk+4/LJNo79StqrLZiv3LZcQTh
	yHyFkaJl39uubmjCb9APGfGfLZ6vFqpMlNpSc/TprYq1+lyg0CCpcoEZJIafEjGQwDNRLotEpmwwt
	MEc1V16IOeNFeDVagGPjHUVNUglXlhmY4NOX7hBVsGCDyMEzOutbCqnbSuwPJLnu1LyvSOREt7EQi
	XWCwyejg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwOTC-0001Qz-Ob; Tue, 28 Jan 2020 10:51:46 +0000
Received: from mail-vi1eur04on0611.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::611]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwOTA-0001QS-0c
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 10:51:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3UDOtiNCpNYpCH3Jy5cqU6UtmKIUMapSsQDOV9AoXU6GjlHgON+BgoFzMdMoBGoe6CbSCUsisxtd2Ti0xYeXqkr6eKsotUu2kbdTwIgTwbGN+EAkvt79n9FhnPM97Ew8uwKhdQ4tmApC0IfnAn5r/VbCgBNpcnQgzAxvNQ5CuqCyMlybZt1Egx+YAOroQp5SZ6DDBNchO3j7MPMaRld1/mlOz8nWjeGsNyG2//C5uxOQYqkeFGNe1xOSB/r7Xb8LbeHdJpNtxEZvJXWamTknEvZBXQ0umjiv2i6SHNQXDwQT0mIKepZI7U+zZjhuHg2C0Wn+QLyiIYraxtjBwEIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRCF4T1YWjSTuaKk3p6SEjKsjj9+s53WmqY8i8elWWw=;
 b=hqPrNzj9u+REbo3ngthnHsA74nV3n0yiWJmXESJ6liAmFKs7wRAQy5Ry1gYa5MtlBP2FuR7aTYKw4EEjNbPGu3PklR+Rg2lseAWwwcrgKJXIQR8HLcruAiaNuJT9mWRzSiDU/3qzhEukkDJdkRPXpuwz5ji6qJtSo8ychCPuK5H+h7Q3r2eazr8qqM5cXEus74Gp04YbcBbBSGKxkqyGD+zhXBSFjTpznGwTLm7hKlI3t5D3QCFzhd+YSDdC1zP0sjmFChIA7jCbYVSBxypPokh3htdOi8HnoYXkp6cfALKJ/ywCIMXKm2Qy8J4gOU7MHkKcSGbR4FzrLb0nQU4OUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=niko.eu; dmarc=pass action=none header.from=niko.eu; dkim=pass
 header.d=niko.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=niko.eu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRCF4T1YWjSTuaKk3p6SEjKsjj9+s53WmqY8i8elWWw=;
 b=P8FlMlSNeSSNSsvClysVeFoQ7C0m8QNcS/H1KD1jvP/xnWQcmxPjFnxsu8NyKRj5oFA1iH1cmNdAIpLWvmzFvx/eeTbIRfKJ4cXg2D+e+KWgTwEX8ugw6JYlmb5Lb32jpt4bm3Gr5j44IbpTr2zwZu6JNe4Jdm71rENGEQApGTo=
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com (20.178.82.86) by
 AM0PR08MB4401.eurprd08.prod.outlook.com (20.179.32.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Tue, 28 Jan 2020 10:51:39 +0000
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::2c29:d125:7cf8:8b4e]) by AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::2c29:d125:7cf8:8b4e%7]) with mapi id 15.20.2665.017; Tue, 28 Jan 2020
 10:51:39 +0000
Received: from [0.0.0.0] (84.196.17.203) by
 AM5PR0102CA0002.eurprd01.prod.exchangelabs.com (2603:10a6:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22 via Frontend
 Transport; Tue, 28 Jan 2020 10:51:38 +0000
From: "Driesen Jef (JDI)" <Jef.Driesen@niko.eu>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubifs: mounting fails due to error in orphan file handling
Thread-Topic: ubifs: mounting fails due to error in orphan file handling
Thread-Index: AQHV1cjrAoplinqeP0eLPj4RpCBNAQ==
Date: Tue, 28 Jan 2020 10:51:39 +0000
Message-ID: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
Accept-Language: en-BE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0102CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:206::15) To AM0PR08MB3874.eurprd08.prod.outlook.com
 (2603:10a6:208:108::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jef.Driesen@niko.eu; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.196.17.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89247e31-ff91-47e4-7060-08d7a3e00d83
x-ms-traffictypediagnostic: AM0PR08MB4401:
x-microsoft-antispam-prvs: <AM0PR08MB4401506DD3D01135216B7D4DE20A0@AM0PR08MB4401.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(199004)(189003)(66446008)(64756008)(66946007)(66476007)(66616009)(66556008)(6706004)(31686004)(36756003)(2906002)(6486002)(52116002)(81156014)(186003)(16576012)(26005)(31696002)(8676002)(8936002)(478600001)(81166006)(16526019)(966005)(2616005)(316002)(5660300002)(71200400001)(6916009)(86362001)(956004)(78286006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4401;
 H:AM0PR08MB3874.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: niko.eu does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GmBOfiGlsB3RFGuhElplXNPgvRDsJ6KtbcV8yuXVKKFR/eprw10VOjK+KKKolycsYsoxdTxgH8JwT1Fe01CA38YuDXL4WPK9Srvhzj0UiRg8GLJ82BlmBPSkqQ+nPIZKNkrN7FRaPv45bSi9GiWLT4w+ElLNo5j+FrD8/Cn6cXt96NlPNaChr3jmNyUzFNKYCuadRF23JcFwQPI2Gm2CCSy5ZN6Yz+ThLLbvjNRqDR/CrFwoGUnyBnP0ZsDfhSesyTwpYT1uDDpClp+kfxv9Qd8kiWFMZchX8wvNJ5Z8xqpfXzaX//Z3HQPapQP3OXGgbbyKjBOHIpKt9IFMTP4KlWplOy7W2eEm0pCSMw0IWtpRSXQ/cXGsMHoqx+7S12y90sVDvRHndr7PotMNbwxunHHGh2hgM4QN06A+yA8Wzha4xmrwvfGFNXRggVL7M+87EzVmTxYQB7GjTyPBBQST4OXY1ndSyqeKGRhc32N/dKBKmSQxk8V/O/1e0pGshlMc3+AMre5MDZCWoNfpL/AePklT9iPdMnivdw6V08/HKrokoIgFKbGL4I1bSTBu8BfcTxCtAaqo5GKEaV3b+vd29+z2FUg9czBqjRKCEQRJYHg=
x-ms-exchange-antispam-messagedata: ygme5KihyTq6j/N2ezc1yVj1+kygftal0nzdTRb25SjlCoMXZ1CN6zI3z4QjFpLMnJUvnJ+VLEeUjrtflkEgG9ysJXZUOXM1eVqcfa+iqgrYYAzsG66lgm6w1Sp7vzM7VyREMtyXC+saKzDgG/iyRQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_0d3a2ed98ff07030a8c6c5a204eb6b5bnikoeu_"
MIME-Version: 1.0
X-OriginatorOrg: niko.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 89247e31-ff91-47e4-7060-08d7a3e00d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 10:51:39.1993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a4faf0fe-ff3f-4912-b675-3cfe1470e385
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQf5J50DXGY8amGkdb/Pll8UXVKCxXy43jGB8OaVA/cAJQB0OQwsB9UHZyswnANGZSP1kTvwPCILv1C6kBJ3IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_025144_279180_6CC03F00 
X-CRM114-Status: GOOD (  15.69  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--_002_0d3a2ed98ff07030a8c6c5a204eb6b5bnikoeu_
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE7644D8A2974644AF428185F8A96F36@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCldlJ3JlIGV4cGVyaWVuY2luZyBzb21lIGtpbmQgb2YgZmlsZSBzeXN0ZW0gY29ycnVw
dGlvbiB3aXRoIHRoZSBVQklGUyANCmZpbGUgc3lzdGVtIGFmdGVyIHBvd2VyIGN1dHMuIFRoZSBw
cm9ibGVtIHNob3dzIHVwIGFzIGFuIGVycm9yIGR1cmluZyBtb3VudDoNCg0KIyBtb3VudCAtdCB1
YmlmcyB1YmkwOmhvbWUgL2hvbWUNCm1vdW50OiAvaG9tZTogc3BlY2lhbCBkZXZpY2UgdWJpMDpo
b21lIGRvZXMgbm90IGV4aXN0Lg0KDQpUaGUgdW5kZXJseWluZyBVQkkgdm9sdW1lcyBhcmUgYWxs
IGZpbmU6DQoNCiMgbXRkaW5mbyAvZGV2L210ZDANCm10ZDANCk5hbWU6ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWJpDQpUeXBlOiAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hbmQNCkVy
YXNlYmxvY2sgc2l6ZTogICAgICAgICAgICAgICAgMTMxMDcyIGJ5dGVzLCAxMjguMCBLaUINCkFt
b3VudCBvZiBlcmFzZWJsb2NrczogICAgICAgICAgODE5MiAoMTA3Mzc0MTgyNCBieXRlcywgMTAy
NC4wIE1pQikNCk1pbmltdW0gaW5wdXQvb3V0cHV0IHVuaXQgc2l6ZTogMjA0OCBieXRlcw0KU3Vi
LXBhZ2Ugc2l6ZTogICAgICAgICAgICAgICAgICAyMDQ4IGJ5dGVzDQpPT0Igc2l6ZTogICAgICAg
ICAgICAgICAgICAgICAgIDY0IGJ5dGVzDQpDaGFyYWN0ZXIgZGV2aWNlIG1ham9yL21pbm9yOiAg
IDkwOjANCkJhZCBibG9ja3MgYXJlIGFsbG93ZWQ6ICAgICAgICAgdHJ1ZQ0KRGV2aWNlIGlzIHdy
aXRhYmxlOiAgICAgICAgICAgICB0cnVlDQoNCiMgdWJpbmZvIC1hDQpVQkkgdmVyc2lvbjogICAg
ICAgICAgICAgICAgICAgIDENCkNvdW50IG9mIFVCSSBkZXZpY2VzOiAgICAgICAgICAgMQ0KVUJJ
IGNvbnRyb2wgZGV2aWNlIG1ham9yL21pbm9yOiAxMDo1OA0KUHJlc2VudCBVQkkgZGV2aWNlczog
ICAgICAgICAgICB1YmkwDQoNCnViaTANClZvbHVtZXMgY291bnQ6ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMw0KTG9naWNhbCBlcmFzZWJsb2NrIHNpemU6ICAgICAgICAgICAgICAgICAxMjY5
NzYgYnl0ZXMsIDEyNC4wIEtpQg0KVG90YWwgYW1vdW50IG9mIGxvZ2ljYWwgZXJhc2VibG9ja3M6
ICAgICA4MTkyICgxMDQwMTg3MzkyIGJ5dGVzLCA5OTIuMCBNaUIpDQpBbW91bnQgb2YgYXZhaWxh
YmxlIGxvZ2ljYWwgZXJhc2VibG9ja3M6IDAgKDAgYnl0ZXMpDQpNYXhpbXVtIGNvdW50IG9mIHZv
bHVtZXMgICAgICAgICAgICAgICAgIDEyOA0KQ291bnQgb2YgYmFkIHBoeXNpY2FsIGVyYXNlYmxv
Y2tzOiAgICAgICAwDQpDb3VudCBvZiByZXNlcnZlZCBwaHlzaWNhbCBlcmFzZWJsb2NrczogIDE2
MA0KQ3VycmVudCBtYXhpbXVtIGVyYXNlIGNvdW50ZXIgdmFsdWU6ICAgICAzNg0KTWluaW11bSBp
bnB1dC9vdXRwdXQgdW5pdCBzaXplOiAgICAgICAgICAyMDQ4IGJ5dGVzDQpDaGFyYWN0ZXIgZGV2
aWNlIG1ham9yL21pbm9yOiAgICAgICAgICAgIDI0NjowDQpQcmVzZW50IHZvbHVtZXM6ICAgICAg
ICAgICAgICAgICAgICAgICAgIDAsIDEsIDINCg0KVm9sdW1lIElEOiAgIDAgKG9uIHViaTApDQpU
eXBlOiAgICAgICAgZHluYW1pYw0KQWxpZ25tZW50OiAgIDENClNpemU6ICAgICAgICAyNjc2IExF
QnMgKDMzOTc4Nzc3NiBieXRlcywgMzI0LjAgTWlCKQ0KU3RhdGU6ICAgICAgIE9LDQpOYW1lOiAg
ICAgICAgcmZzMg0KQ2hhcmFjdGVyIGRldmljZSBtYWpvci9taW5vcjogMjQ2OjENCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpWb2x1bWUgSUQ6ICAgMSAob24gdWJpMCkNClR5
cGU6ICAgICAgICBkeW5hbWljDQpBbGlnbm1lbnQ6ICAgMQ0KU2l6ZTogICAgICAgIDI2NzYgTEVC
cyAoMzM5Nzg3Nzc2IGJ5dGVzLCAzMjQuMCBNaUIpDQpTdGF0ZTogICAgICAgT0sNCk5hbWU6ICAg
ICAgICByZnMzDQpDaGFyYWN0ZXIgZGV2aWNlIG1ham9yL21pbm9yOiAyNDY6Mg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClZvbHVtZSBJRDogICAyIChvbiB1YmkwKQ0KVHlw
ZTogICAgICAgIGR5bmFtaWMNCkFsaWdubWVudDogICAxDQpTaXplOiAgICAgICAgMjY3NCBMRUJz
ICgzMzk1MzM4MjQgYnl0ZXMsIDMyMy44IE1pQikNClN0YXRlOiAgICAgICBPSw0KTmFtZTogICAg
ICAgIGhvbWUNCkNoYXJhY3RlciBkZXZpY2UgbWFqb3IvbWlub3I6IDI0NjozDQoNCg0KSSBhbHJl
YWR5IGRlYnVnZ2VkIHRoZSB1YmlmcyBrZXJuZWwgbW9kdWxlIHRvIGxvY2F0ZSB3aGVyZSBleGFj
dGx5IHRoZSANCmVycm9yIGlzIHJldHVybmVkLCBhbmQgdGhlIGNhbGwgY2hhaW4gaXM6DQoNCnVi
aWZzX21vdW50IC0+IHViaWZzX2ZpbGxfc3VwZXIgLT4gbW91bnRfdWJpZnMgLT4gdWJpZnNfbW91
bnRfb3JwaGFucyDihpIgDQpraWxsX29ycGhhbnMgLT4gZG9fa2lsbF9vcnBoYW5zIC0+IHViaWZz
X3RuY19sb29rdXAgLT4gdWJpZnNfdG5jX2xvY2F0ZQ0KDQpUaGUgdWJpZnNfdG5jX2xvY2F0ZSBm
dW5jdGlvbiBmYWlscyB3aXRoIC1FTk9FTlQgYmVjYXVzZSB0aGUgDQp1Ymlmc19sb29rdXBfbGV2
ZWwwIGZ1bmN0aW9uIHJldHVybnMgMC4NCg0KSWYgSSBwYXRjaCB0aGUgbW91bnRfdWJpZnMgZnVu
Y3Rpb24gdG8gY2FsbCB1Ymlmc19tb3VudF9vcnBoYW5zIHdpdGggDQp6ZXJvIGZvciB0aGUgdW5j
bGVhbiBwYXJhbWV0ZXIgKGluc3RlYWQgb2YgdGhlIHZhbHVlIG9mIA0KYy0+bmVlZF9yZWNvdmVy
eSksIHRoZW4gdGhlIG1vdW50aW5nIHN1Y2NlZWRzLiBBZnRlcndhcmRzLCB3aGVuIA0KcmVib290
aW5nIG9uY2UgbW9yZSB3aXRoIHRoZSBvcmlnaW5hbCB1bnBhdGNoZWQga2VybmVsLCB0aGUgZmls
ZSBzeXN0ZW0gDQphcHBlYXJzIHRvIGJlIGZpeGVkIGFnYWluLCBhbmQgbW91bnRpbmcgc3VjY2Vl
ZHMuDQoNCkknbSBub3QgcmVhbGx5IHN1cmUgd2hhdCdzIGdvaW5nIG9uIHVuZGVyIHRoZSBob29k
LCBidXQgaXQgbG9va3MgbGlrZSBhIA0KcHJvYmxlbSB3aXRoIHRoZSBoYW5kbGluZyBvZiB0aGUg
b3JwaGFuIGZpbGVzLiBXaXRoIHRoaXMga25vd2xlZGdlLCB3ZSANCmFyZSBub3cgYWJsZSB0byBy
ZXByb2R1Y2UgdGhlIHByb2JsZW0gcmVsaWFibGUsIGJ5IGRvaW5nIGEgcG93ZXIgY3V0IA0Kd2hp
bGUgcnVubmluZyB0aGUgYXR0YWNoZWQgc2NyaXB0LiBUaGUgc2NyaXB0cyBjcmVhdGVzIG1hbnkg
ZmlsZXMgaW4gYSANCmxvb3AsIGtlZXBzIHRoZW0gYWxsIG9wZW4gYW5kIHJlbW92ZXMgdGhlbSBh
Z2Fpbi4gV2l0aCB0aGlzIGFwcHJvYWNoIHdlIA0KaGl0IHRoZSBwcm9ibGVtIGFib3V0IG9uY2Ug
ZXZlcnkgdHdvIGF0dGVtcHRzLg0KDQpUaGUgcHJvYmxlbSBhcHBlYXJlZCBmb3IgdGhlIGZpcnN0
IHRpbWUgYWZ0ZXIgd2Ugc3dpdGNoZWQgZnJvbSBrZXJuZWwgDQp2NC43IHRvIHY1LjMuIEkgdHJp
ZWQgd2l0aCB2NS40IGFuZCBtYXN0ZXIgdG9vLCBpbiBjYXNlIHdlIGFyZSBoaXR0aW5nIGEgDQpw
cm9ibGVtIHRoYXQgaXMgYWxyZWFkeSBmaXhlZCwgYnV0IHRoZXkgc2hvdyB0aGUgc2FtZSBwcm9i
bGVtLiBBZnRlciANCmRvaW5nIHNvbWUgYmlzZWN0aW5nLCB0aGlzIGNvbW1pdCBhcHBlYXJzIHRv
IGhhdmUgaW50cm9kdWNlZCB0aGUgcHJvYmxlbToNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC9mcy91Ymlm
cy9vcnBoYW4uYz9pZD1lZTE0MzhjZTVkYzRkNjdkZDhkZDFmZjUxNTgzMTIyYTYxZjViZDllDQoN
CkhvdyBjYW4gd2UgZml4IHRoaXM/DQoNCkplZg0K

--_002_0d3a2ed98ff07030a8c6c5a204eb6b5bnikoeu_
Content-Type: application/x-shellscript; name="ubifs.sh"
Content-Description: ubifs.sh
Content-Disposition: attachment; filename="ubifs.sh"; size=319;
	creation-date="Tue, 28 Jan 2020 10:51:39 GMT";
	modification-date="Tue, 28 Jan 2020 10:51:39 GMT"
Content-ID: <66B241F8FCEC32458FB578E5DA873FCE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

IyEvYmluL2Jhc2gKCnNldCAteAoKd2hpbGUgWyB0cnVlIF07IGRvCglESVI9L2hvbWUvZHVtbXlk
aXIKCWZvciBpIGluIHsxLi41MH0KCWRvCgkJRElSPSIkRElSL2RpciR7aX0vIgoJCW1rZGlyIC1w
ICIkRElSIgoJCWRkIGlmPS9kZXYvdXJhbmRvbSBvZj0kRElSL2R1bW15IGJzPTFLQiBjb3VudD0x
MDI0CgkJbXYgJERJUi9kdW1teSAkRElSL2R1bW15Lm9sZAoJCXRhaWwgLWYgJERJUi9kdW1teS5v
bGQgPiAvZGV2L251bGwgMj4mMSAmCgkJcm0gLWYgJERJUi9kdW1teS5vbGQKCQlzeW5jCglkb25l
CglybSAtciAvaG9tZS9kdW1teWRpcgoJc3luYwpkb25lCg==

--_002_0d3a2ed98ff07030a8c6c5a204eb6b5bnikoeu_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--_002_0d3a2ed98ff07030a8c6c5a204eb6b5bnikoeu_--

