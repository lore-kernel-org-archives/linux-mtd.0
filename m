Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBA8C3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 07:58:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6BC724699
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 07:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VVaH1JU0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6BC724699
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ji2AmhtWovRvRoVwbEXmk6ZkMjmwE8XeTSbWIaIxrQ=; b=VVaH1JU0G5uevu
	cMwhFiS340DJ8dg1R+T6cnic5iM7Gf7QU0txXLxaap6Ke3Ui8ydyqPZEBGRhmR+R8tmzVzdfY/mHF
	1ipJ3aF3mG/vZfq2Q03SW0sRcrGxp9ayCMXtpG85gey2ZYU4iUV2Sz2qqhZzQmwqJUWWgBDDcccis
	c1/hLqEtxu5dBEe0J3NRIO/On4J2QKI5x+q7nEAbIpNdYRbZvd7+wG4oVhlKmtr38bvz0q5xfSE4X
	o+UQM4vQZOW1k29Te5rbLimIR6Qk4Vc6yuyeuyJau07sa3xwvCbg0aIgdzlEjqW4knfb4IjJXxPMS
	IvbP7/bP4LMpgXUTdYuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8fxL-00071x-Qj; Mon, 02 Mar 2020 07:57:39 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8fxH-000717-Lp
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 07:57:38 +0000
Received: from ig2.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
 by SHSQR01.spreadtrum.com with ESMTPS id 0227uuva034073
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
 Mon, 2 Mar 2020 15:56:56 +0800 (CST)
 (envelope-from Carson.Li1@unisoc.com)
Received: from SHMBX04.spreadtrum.com (10.0.1.214) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.847.32; Mon, 2 Mar 2020
 15:56:56 +0800
Received: from SHMBX04.spreadtrum.com ([fe80::8532:ef18:9217:26f5]) by
 shmbx04.spreadtrum.com ([fe80::8532:ef18:9217:26f5%13]) with mapi id
 15.00.0847.030; Mon, 2 Mar 2020 15:56:56 +0800
From: =?utf-8?B?5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIp?= <Carson.Li1@unisoc.com>
To: Hou Tao <houtao1@huawei.com>, Richard Weinberger <richard@nod.at>
Subject: RE: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Topic: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Index: AQHVyaL3y4TC5HCNzkiSy+TVWaB7mKfpWzQwG5Qm157/JAOmUHIw88Ik/HDzxSCANiTskIAKghsAgAFc6YD//9dEAAARFrMAAK2+roAAEgFJ4P//wsIA//9zlBA=
Date: Mon, 2 Mar 2020 07:56:55 +0000
Message-ID: <0b5d3e537a3f43db86f34cd695906173@shmbx04.spreadtrum.com>
References: <e2d34800d72243ed85e8df63bb80f7ab@shmbx04.spreadtrum.com>
 <ce621148db0e4f9c80f32c348975663a@shmbx04.spreadtrum.com>
 <ae16d475c0d24c1ba6ab18f1e766e928@shmbx04.spreadtrum.com>
 <46e2f6ca11a442f38d476d4346e8034c@shmbx04.spreadtrum.com>
 <733427970.19532.1578872935782.JavaMail.zimbra@nod.at>
 <5077cb7894bc4b95b09389059edf0ddc@shmbx04.spreadtrum.com>
 <1323907091.20398.1578989376426.JavaMail.zimbra@nod.at>
 <51cabef7ce104de097c2556a4a24d8a7@shmbx04.spreadtrum.com>
 <1741454272.21050.1579043778589.JavaMail.zimbra@nod.at>
 <c62bae00e0d741cc9be1752b139c42d6@shmbx04.spreadtrum.com>
 <fda84926-09d1-1fc7-4b78-99e0d04508bc@huawei.com>
 <e6df93725ef24b548eef69afbbfc15f8@shmbx04.spreadtrum.com>
 <6cf2ba81-98ad-c03f-59b9-b871c7979df6@huawei.com>
 <3768e0805ba349f487214bef018f1853@shmbx04.spreadtrum.com>
 <6387af1b-d5a8-a175-6936-1f5f3ab003a4@huawei.com>
 <6a8b67e4baf44534b6c92c80a0edbdd3@shmbx04.spreadtrum.com>
 <43120885-5bc8-9850-6f14-8e2a637cbeaf@huawei.com>
In-Reply-To: <43120885-5bc8-9850-6f14-8e2a637cbeaf@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.1.253]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 0227uuva034073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200301_235736_398999_3FE76400 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uZGF5LCBNYXJjaCAyLCAyMDIwIDI6MzUgUE0sIEhvdSBUYW88aG91dGFvMUBodWF3ZWku
Y29tPiB3cm90ZToNCg0KPj4+IFRoZSBhY3R1YWwgc2l0dWF0aW9uIG9mIHRoZSBwcm9ibGVtIGlz
IHRoZSBMRUIgaXMgR0NlZCwgZnJlZWQgYW5kIHRoZW4NCj4+PiByZXVzZWQgYXMgam91cm5hbCBo
ZWFkLCBhbmQgZmluYWxseSB1Ymlmc190bmNfbG9jYXRlKCkgcmVhZHMgYW4gaW52YWxpZCBub2Rl
Lg0KPj4NCj4+IEFjdHVhbGx5LCBJIHRoaW5rIHRoYXQgc2l0dWF0aW9uIG1pZ2h0IG9ubHkgYmUg
Y2F1c2VkIGJ5IGEgY29tbWl0LCBpcyB0aGF0IHJpZ2h0Pw0KPj4gU2luY2Ugb25seSBjb21taXQg
bWlnaHQgY2xlYXIgdGhlIGpvdXJuYWwgaGVhZCBMRUJzJyBwcm9wZXJ0eSBvZiBMUFJPUFNfVEFL
RU4uDQo+PiBCdXQgaXQgd2lsbCBub3QgZ2V0IHRoZSBjLT5qaGVhZHNbaV0ud2J1Zi0+bG51bSBM
RUIncyB0YWtlbiBwcm9wZXJ0eSBjbGVhcmVkLCBzbyB0aGVyZQ0KPj4gc2VlbXMgbm8gbmVlZCB0
byBjaGVjayBpZiBhIGMtPmpoZWFkc1tpXS53YnVmLT5sbnVtIExFQiBtaWdodCBiZSBHQ2VkIGFu
ZCB0aGUNCj4+IG5vZGUgd2hldGhlciBmdWxseSBzaXRzIGluIHdpcnRlIGJ1ZmZlci4NCj5Oby4g
VGhlIEdDJ2VkIGNoZWNraW5nIGlzIG5lZWRlZCBoZXJlLiBBcyBJIGhhdmUgbm90ZWQgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlOg0KDQo+PkFuZCBpdCBjYW4gYmUgcmVwcm9kdWNlZCBieSB0aGUgZm9s
bG93aW5nIHN0ZXBzOg0KPj4qIGNyZWF0ZSAxMjggZW1wdHkgZmlsZXMNCj4+KiBvdmVyd3JpdGUg
OCBmaWxlcyBpbiBiYWNrZ3JvdXAgcmVwZWF0ZWRseSB0byB0cmlnZ2VyIEdDDQo+PiogZHJvcCBp
bm9kZSBjYWNoZSBhbmQgc3RhdCB0aGVzZSAxMjggZW1wdHkgZmlsZXMgcmVwZWF0ZWRseQ0KDQo+
SW4gdGhlIGFib3ZlIHN0ZXBzLCB0aGUgbm9kZXMgcmVsYXRlZCB3aXRoIHRoZXNlIGVtcHR5IGZp
bGVzIGFyZSBhbHJlYWR5IGJlZW4gY29tbWl0dGVkDQo+bG9uZyBiZWZvcmUgdGhlIHJ1bm5pbmcg
b2Ygc3RhdCBjb21tYW5kLg0KDQpTb3JyeSwgSSBhbSBhIGxpdHRsZSBjb25mdXNlZCBieSB5b3Vy
IGNvbW1lbnQgc2F5aW5nIHRoZSBub2RlcyBhcmUgYWxyZWFkeSBiZWVuIGNvbW1pdHRlZA0KbG9u
ZyBiZWZvcmUgdGhlIHJ1bm5pbmcgb2Ygc3RhdCBjb21tYW5kLg0KSXQgb25seSBoYXBwZW5zIHdo
ZW4gdGhlcmUgaXMgYSBjb21taXQgYmV0d2VlbiB0bmNfbXV0ZXggcmVsZWFzZWQgYW5kIHViaWZz
X3JlYWRfbm9kZV93YnVmDQpleGVjdXRlZCwgYW0gSSByaWdodCA/IEhvdyBjb3VsZCBpdCBiZSBz
byBsb25nIGluIHRoZSBnYXA/DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KdWJpZnNfdG5jX2xvY2F0ZQ0K
ICAgemJyLT5sbnVtID0gNTQgKGZpbmQgaW4gVE5DKQ0KICAgICB1Ymlmc19nZXRfd2J1Zih6YnIt
PmxudW0gPSA1NCkgaXMgdHJ1ZQ0KICAgICAgICAgIHViaWZzX3RuY19yZWFkX25vZGUNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAtPkdDKGNoYW5nZSB6dC0+bG51bSB0byAyMjQoR0NIRCkgaW4g
X1ROQ18pDQogICAgICAgICAgICAgICAgICAgICAgICAgLT56YnItPmxudW0gPSA1NCBiZWNvbWVz
IERBVEFIRA0KICAgICAgICAgICAgIHViaWZzX2dldF93YnVmKHpici0+bG51bSA9IDU0IGFzIHRo
ZSBEQVRBSEQpIGlzIHRydWUgYWdhaW4NCiAgICAgICAgICAgICB1Ymlmc19yZWFkX25vZGVfd2J1
Zg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCndoZW4gY29tbWl0IGhhcHBlbnMsIHViaWZzX2xvZ19zdGFy
dF9jb21taXQgd2lsbCBnZXQgcHJlc2VudCBqaGVhZHNbREFUQUhEXS53YnVmLT5sbnVtDQp3cml0
dGVuIGJhY2sgdG8gYnVkIGxpc3QgYW5kIGxvZyBMRUIgYWdhaW4uIFNvIFdoYXQgSSBtZWFuIGlz
IHRoYXQgaWYgdGhlIHpici0+bG51bSA9IDU0IGlzIGp1c3QNCmV4YWN0bHkgdGhlIGpoZWFkc1tE
QVRBSERdLndidWYtPmxudW0sIGl0IHdpbGwgbm90IGJlIEdDZWQuDQoNCkJ1dCBpZiB0aGVyZSBh
cmUgbW9yZSB0aGFuIG9uZSBjb21taXRzIGhhcHBlbiwgaXQgY2VydGFpbmx5IG5lZWRzIEdDZWQg
Y2hlY2tpbmcuDQpJIGFtIGp1c3Qgbm90IHN1cmUgaWYgd2UgbmVlZCB0byB0YWtlIHN1Y2ggYSBs
ZXNzIHBvc3NpYmxlIHNpdHVhdGlvbiBpbnRvIGFjY291bnQsIHNpbmNlIEkgdGhvdWdodA0KaXQg
bWlnaHQgbm90IHRha2UgdG9vIGxvbmcgYmV0d2VlbiB0bmNfbXV0ZXggcmVsZWFzZWQgYW5kIHVi
aWZzX3JlYWRfbm9kZV93YnVmIGV4ZWN1dGVkLg0KWW91ciBwYXRjaCBjYW4gYmUgdGhvdWdodCB0
byBoYXZlIHRha2VuIHRoaXMgYWNjb3VudCBpbiBteSB2aWV3Lg0KDQo+RG8geW91IG1lYW4gY2Fs
bCBtYXlfbGViX2djZWQoKSBhZnRlciB0aGUgcmVsZWFzZSBvZiB3YnVmLT5sb2NrID8gSWYgaXQn
cyB0aGUgY2FzZSwNCj5pdCdzIE9LIHRvIG1lIGJlY2F1c2UgaXQgd2lsbCByZWR1Y2UgdGhlIGhv
bGQgdGltZSBvZiB3YnVmLT5sb2NrLg0KWWVzLCB0aGF0IGlzIHdoYXQgSSBtZWFuLg0KDQo+SXQn
cyBpbiB0aGUgZmlyc3QgcGF0Y2ggYW5kIEkgaGF2ZSBub3QgYXR0YWNoZWQgaXQgaGVyZS4gSXQn
cyBhIGhlbHBlciBmdW5jdGlvbiBmYWN0b3JlZCBvdXQNCj5mcm9tIHViaWZzX3JlYWRfbm9kZV93
YnVmKCkgYW5kIGlzIHVzZWQgdG8gY2hlY2sgdGhlIHZhbGlkaXR5IG9mIG5vZGUgaW4gYnVmZmVy
Og0KT2ssIGdldCBpdC4NCg0KVGhhbmtzLg0KQ2Fyc29uLg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KIFRoaXMgZW1haWwgKGluY2x1ZGluZyBpdHMgYXR0YWNobWVudHMpIGlz
IGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIHdoaWNoIGl0IGlzIGFk
ZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBpcyBwcml2aWxlZ2VkLCBj
b25maWRlbnRpYWwgb3Igb3RoZXJ3aXNlIHByb3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUuIFVuYXV0
aG9yaXplZCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiBvciBjb3B5aW5nIG9mIHRo
aXMgZW1haWwgb3IgdGhlIGluZm9ybWF0aW9uIGhlcmVpbiBvciB0YWtpbmcgYW55IGFjdGlvbiBp
biByZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBvciB0aGUgaW5mb3JtYXRp
b24gaGVyZWluLCBieSBhbnlvbmUgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBv
ciBhbiBlbXBsb3llZSBvciBhZ2VudCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcmluZyB0aGUgbWVz
c2FnZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgZG8gbm90IHJlYWQs
IGNvcHksIHVzZSBvciBkaXNjbG9zZSBhbnkgcGFydCBvZiB0aGlzIGUtbWFpbCB0byBvdGhlcnMu
IFBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgcGVybWFuZW50bHkgZGVs
ZXRlIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgaWYgeW91IHJlY2VpdmVkIGl0IGlu
IGVycm9yLiBJbnRlcm5ldCBjb21tdW5pY2F0aW9ucyBjYW5ub3QgYmUgZ3VhcmFudGVlZCB0byBi
ZSB0aW1lbHksIHNlY3VyZSwgZXJyb3ItZnJlZSBvciB2aXJ1cy1mcmVlLiBUaGUgc2VuZGVyIGRv
ZXMgbm90IGFjY2VwdCBsaWFiaWxpdHkgZm9yIGFueSBlcnJvcnMgb3Igb21pc3Npb25zLg0K5pys
6YKu5Lu25Y+K5YW26ZmE5Lu25YW35pyJ5L+d5a+G5oCn6LSo77yM5Y+X5rOV5b6L5L+d5oqk5LiN
5b6X5rOE6Zyy77yM5LuF5Y+R6YCB57uZ5pys6YKu5Lu25omA5oyH54m55a6a5pS25Lu25Lq644CC
5Lil56aB6Z2e57uP5o6I5p2D5L2/55So44CB5a6j5Lyg44CB5Y+R5biD5oiW5aSN5Yi25pys6YKu
5Lu25oiW5YW25YaF5a6544CC6Iul6Z2e6K+l54m55a6a5pS25Lu25Lq677yM6K+35Yu/6ZiF6K+7
44CB5aSN5Yi244CBIOS9v+eUqOaIluaKq+mcsuacrOmCruS7tueahOS7u+S9leWGheWuueOAguiL
peivr+aUtuacrOmCruS7tu+8jOivt+S7juezu+e7n+S4reawuOS5heaAp+WIoOmZpOacrOmCruS7
tuWPiuaJgOaciemZhOS7tu+8jOW5tuS7peWbnuWkjemCruS7tueahOaWueW8j+WNs+WIu+WRiuef
peWPkeS7tuS6uuOAguaXoOazleS/neivgeS6kuiBlOe9kemAmuS/oeWPiuaXtuOAgeWuieWFqOOA
geaXoOivr+aIlumYsuavkuOAguWPkeS7tuS6uuWvueS7u+S9lemUmea8j+Wdh+S4jeaJv+aLhei0
o+S7u+OAgg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
