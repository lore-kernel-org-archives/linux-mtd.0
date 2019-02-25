Return-Path: <SRS0=/vOe=RA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FB0C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 15:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 671A620684
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 15:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rd22gmoU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="SKqLv80A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 671A620684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ART5176kVaqIjmAautBQbRPqvHrUqyMR+/SGa5iNGqs=; b=Rd22gmoU1P0bXX
	zurTpbQv3SM7sS/lfToOmagXcUSz2oUtt6xKop+lvJwoZwYIyeZF4rU3+BBXgcniLNDPvZetKt4RC
	SRHgrLDbeorT7sbsKFWYhvzfHX8VYpiFhjsELgQNoPOBsNRCeHZhmoT3LCYa0Ne87u2LM0YYhxK+5
	NCbFL7Lfffg9gGIZWkxbs7NliyKAP6YiSNQSPOxyJvr/mBteXT2i5aCKdNNkBvg62WI+mgszoPBSj
	KUe+xYpLvrd2Aifau1ho2Bfy6YGZC/u9pfpvJFYzBooCS0ONUTtVuA1vy+18UD5AeTinSkNfNKUd8
	SD9Yv75hQe+gWb0959dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyIbQ-0004uE-BY; Mon, 25 Feb 2019 15:55:36 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyIbN-0004tm-2H
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2019 15:55:34 +0000
Received: from mail.micron.com (bowex17a.micron.com [137.201.21.209])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x1PFtS6q027226;
 Mon, 25 Feb 2019 08:55:28 -0700
Received: from BOWEX36G.micron.com (137.201.84.120) by bowex17a.micron.com
 (137.201.21.209) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Mon, 25 Feb
 2019 08:55:27 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (137.201.84.23)
 by BOWEX36G.micron.com (137.201.84.120) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Mon, 25 Feb 2019 08:55:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hctdU9rBMrlam2imGsAfCIlGDnRKI3qLQQTDobAGH7s=;
 b=SKqLv80Ar69Nr5SppfG92PheeMLHN1k5Mmh0VN6/JV/bnVtAIgh6s3xiyIhXwz4MivvfUelJdGyYIrPgbVVeDWYSBMknMi7GQ/VFl/9wureL/++Eh8urruZuqb1nIKxyCh6I3h6t7OSKux/aHVtcCf9QQCczkTWcJAPCCLqGI5o=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB5670.namprd08.prod.outlook.com (20.178.50.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.14; Mon, 25 Feb 2019 15:55:26 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669%3]) with mapi id 15.20.1643.019; Mon, 25 Feb 2019
 15:55:26 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Piotr Wojtaszczyk <wojtaszczykp@cumminsallison.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation
 hook function pointer
Thread-Topic: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation
 hook function pointer
Thread-Index: AQHUzSGbYhJI66B+s02BV4YHZO6I4qXwqemQ
Date: Mon, 25 Feb 2019 15:55:25 +0000
Message-ID: <BYAPR08MB4533B1711704E89076E0BBD5DB7A0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <f4d62c64-824f-7b81-2681-63dff50829fc@cumminsallison.com>
In-Reply-To: <f4d62c64-824f-7b81-2681-63dff50829fc@cumminsallison.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49773517-d352-4832-2351-08d69b39a873
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB5670; 
x-ms-traffictypediagnostic: BYAPR08MB5670:|BYAPR08MB5670:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCWUFQUjA4TUI1NjcwOzIzOmNhNHRoK3QyN1lST2x3QTkyWmMybmNWTndJ?=
 =?utf-8?B?VUd1a0NsRm5YYjhQNURMMU45WXVxWFBwdW5ETUlHRnp6K1A5Q3VDRWkzUmpX?=
 =?utf-8?B?TDlaUFd6M3VpMU52a2xkRDBMeHFXeXdNTHh1bGpTQmF2aGVUaEFQYkN4OXpG?=
 =?utf-8?B?cjV4RlNvR1l2dFlYTDgxZjIxaGtXNFFNSFlLOWwwSTE2N1VQV1k4c2RhRVAv?=
 =?utf-8?B?WDZVNEFvTjJ1SlJYU1pCaHRlNjBoU0hGNWFDZk96UC9WZHZsdU9nTjdYMVdQ?=
 =?utf-8?B?UUNOQ0hkY1pYV1lWeG10NnhobXhJcGhPcmMyVmJ6TzdyUHJOZ1lwdEthZU5x?=
 =?utf-8?B?U2dweHFwRlF2SWRCOWxpWmM2c1cvbnpZTjdxNkhWMzUrc0VhRXVobCtMRSsy?=
 =?utf-8?B?WjF6SWFEYlkxb1lxazVvNDZXemxUU0RPZTYzbmNxVEFGRUpnT1JIajZRWm5a?=
 =?utf-8?B?OExvVlpvOTJVd1dPZlpVMENaN1dSUUtWZ0pVUmlnRXNTWVV5SWtyRkkyaC9w?=
 =?utf-8?B?ZXcxcnlQaU1iVjBVWGgwdmJzczFPVDVyRTRTK3RCTllRQnRBeitkNDZ6QkdE?=
 =?utf-8?B?SzNnZkZiZWFrUWhoNC8yb1ZXSkVidVhVUTBHeGEwZjNxQ2ltL2FCd0xaZzlV?=
 =?utf-8?B?ZUxST2V4dWpmSTdCeVJRTTdxeW1sN21LRFhvZTRjTzVSSitZM3hSWHVyVTIz?=
 =?utf-8?B?ZzJPaXV5N3M4SVN3RWpUVTFxYURHVG9XMjM4WlFtQ0VqTWVqUXpVSDhJUUJs?=
 =?utf-8?B?SXRKaFh6UXNTOFV4VTVJbG1xS3N5UW9hTXNwcVo3OURNbkh1dDZXWGFJKy9D?=
 =?utf-8?B?c2RiY3pieWIwMlkzRXRldEd5SHdoVmpQcTJEcVFiRW1qQ0wveXVSWCtqeVE3?=
 =?utf-8?B?bE1nQkFQY29wSDNlblMvVjd6SnlRcTRwUktMME9HQ3hxQ3B3WHU3SFMzbkhB?=
 =?utf-8?B?Umlhbit3UnZHUy95aXJLL1RZNWcwU2tMWFdHaW0zalBYb1hZQ1NhdUNpYmpL?=
 =?utf-8?B?VXFMNDRhdTNsU0M1NUpkTnBqSDU3NjBjbEhva1BoYWRpL1dOVHhXMkVUNGJ6?=
 =?utf-8?B?dFJ1STI2Q1liTzhRcDdLMi9mMUlhUFJRUGxwSkk3RWR6WkFrcHlnREgxWFNj?=
 =?utf-8?B?T3pVNW5oTTNzOTBsLzVzOUpTbkMvYVpVZHpXcHg1SWpDbHh1VWFBMjcrLzEv?=
 =?utf-8?B?NGFmTmUwUWxCbUt5dldmeko4TTJLVC9QSW9jMW03OHg0L25wbzNFa3VmeTA4?=
 =?utf-8?B?RmRjUFRraGZ3YTVjNXNNR04rTHYxVG8xd01lZFY1ZWVxTXk0T1hCZXFNOU9p?=
 =?utf-8?B?SEphR0JiYllBdUhCVHRTT2tiKzhBK0s3U293RDNNQkVWYkE3dXI0NDFFYlFF?=
 =?utf-8?B?S01jOXRwekZjNm5lNGt0TWJWTmtrVVQ3R21YUitKMWUwemtyTDNnSElCb2RH?=
 =?utf-8?B?cTBoQTRXUDZYdi9oT0RZSDJsY0dOVk9POUd5aXJUMTA0VDdrUEhhL20rTDll?=
 =?utf-8?B?ZjEvbGtEL05acHo5aXNjZ3JKTEJUNmt5Q2xRY2Z5RUxzSmx1ZE9ZSEc3RVh1?=
 =?utf-8?B?TmJaZ1B5V2YreFk1T0d5OWNvOFYvREFBWit3TjFKVUphOXdtZEZMMGV6UmJG?=
 =?utf-8?B?UlJWb0VldTUvY1NKcVlVRk1pTWRlME1EdFJUT3lKLzNMaEtVaG5qL1dvdTls?=
 =?utf-8?Q?IjbnHJGCFm/ribtiT68dkAyn5Hn1ujuqdBFjo/c?=
x-microsoft-antispam-prvs: <BYAPR08MB5670EAB6169C13DA6A70A732DB7A0@BYAPR08MB5670.namprd08.prod.outlook.com>
x-forefront-prvs: 095972DF2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(86362001)(71190400001)(7696005)(71200400001)(8676002)(68736007)(486006)(11346002)(476003)(446003)(106356001)(105586002)(52536013)(229853002)(14454004)(478600001)(25786009)(2201001)(3846002)(76176011)(6246003)(66066001)(6116002)(2501003)(14444005)(6436002)(2906002)(6506007)(74316002)(8936002)(5660300002)(110136005)(33656002)(102836004)(316002)(53936002)(99286004)(9686003)(256004)(81156014)(26005)(7736002)(55016002)(186003)(6306002)(55236004)(81166006)(97736004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB5670;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iG6mQJwfGzNTWj+rRvjYcicn9Rry7VLh0miyLAqe2KqFiRHJ8WN8dBbTEsW+9Qr75QHUIl9C53zJaluMwlc4gXfgB4t0PKkXPo4p2oal1q+6JCPsNMLGnUx+SI4v1b3J5WRYC/RAanrgNFWa4pC2z1sY0XhDFOwvRSsQi5uy41PyK0BAlF0w8Odbl91rnSmnZNnR0lFLnDwpGKhAIa/aHCjnGwV6NnCi17O+vVjWIIY2ELAGdhUjYkOiSuU5SRAEuF/ZAiQRpL++o6+Ql5Xbf63LgAKDQwCtF9V0ZtY8rF2yldwPeKcNrZjcL/FGBTBy3Z6lIfThJXDXk9sgT3ZW4wPcsnUdBzDd+H2ECeyevy1awkgvMrEQeMPbmNfPML3vMe/8s/rbD4mKBcvNEpmVgLgIgp8+aMdugLPXQDUaVLg=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 49773517-d352-4832-2351-08d69b39a873
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2019 15:55:25.8301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5670
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24454.005
X-TM-AS-Result: No--11.187600-0.000000-31
X-TM-AS-MatchedID: 150567-139010-707800-703399-701618-704930-700104-851106-7
 01475-188019-709584-702143-704425-700038-701236-700648-710970-701249-139704
 -700047-148004-148007-148020-148046-148133-20020-20043-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_075533_211626_636AFA3F 
X-CRM114-Status: UNSURE (   8.10  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIFBpb3RyDQoNCj4+IFRvIGF2b2lkIHRoaXMgcmFyZSBvY2N1cnJlbmNlLCB3ZSBtYWtlIHN1
cmUgdGhhdCBhdCBsZWFzdA0KPj4gMTUgcGFnZXMgaGF2ZSBiZWVuIHByb2dyYW1tZWQgdG8gYSBi
bG9jayBiZWZvcmUgaXQgaXMgZXJhc2VkLg0KPj4gSW4gY2FzZSB3ZSBmaW5kIHRoYXQgbGVzcyB0
aGFuIDE1IHBhZ2VzIGhhdmUgYmVlbiBwcm9ncmFtbWVkLA0KPj4gYWRkaXRpb25hbCBwYWdlcyBh
cmUgcHJvZ3JhbW1lZCBpbiB0aGUgYmxvY2suIFRoZSBvYnNlcnZhdGlvbiBpcyB0aGF0DQo+PiBh
ZGRpdGlvbmFsIHBhZ2VzIHJhcmVseSBuZWVkIHRvIGJlIHdyaXR0ZW4gYW5kIG1vc3Qgb2YgdGhl
IHRpbWUNCj4+IFVCSS9VQklGUyBlcmFzZXMgYmxvY2tzIHRoYXQgY29udGFpbiBtb3JlIHByb2dy
YW1tZWQgcGFnZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQmVhbiBIdW8gPGJlYW5odW8gYXQg
bWljcm9uLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBaT0xUQU4gU1pVQkJPQ1NFViA8enN6dWJib2Nz
ZXYgYXQgbWljcm9uLmNvbT4NCj4+IC0tLQ0KPj4gwqBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X21pY3Jvbi5jIHwgMTE5DQo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jDQo+PiBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfbWljcm9uLmMNCj4+IGluZGV4IGI4NWUxYzEuLmY1MmUwNzIgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jDQo+PiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jDQo+DQo+SXMgdGhlcmUgYSBwbGFuIHRv
IG1lcmdlIHRoaXMgcGF0Y2ggc29vbj8NCj4NCj4NCkkgdGhpbmssIGl0IGlzIHF1aWNrbHkgbWVy
Z2VkIGluLg0KSSBuZWVkIHRvIHVwZGF0ZSBhIG5ldyB2ZXJzaW9uIHNpbmNlIHRoZXJlIGFyZSBz
b21lIHBsYWNlcyBuZWVkIHRvIGNoYW5nZS4NCg0KPl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdA0KPmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
