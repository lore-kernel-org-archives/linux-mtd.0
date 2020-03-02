Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1817C3F2CE
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 03:14:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A88C22468D
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 03:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwj3mpFd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A88C22468D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEIBB01CBB//SCqgpTUEgZbRvdGP1wlXgmGlTdgoaQ4=; b=uwj3mpFdpTkiJ4
	Umcpk+aCJsZ1LemJo0KSKty6WkMJjfhWCa5/XyJ4c9dzZxxCn1Lk3OH7xPok5wyrpVhHIusvaQMN0
	UiayC/sax76Shj00tZiD68RSUS+oOTvQkW+v7ii6rRhV2Eylqh4qsS4znYjYHMAFI4hZsi3G5K2vI
	2OMEtw7s2G5SNZ9xbqSF04BcN7xeUtJsvNJUXSM8wlc6Nsytxss/eI2SBUVk1L58drdUTR/Jgb3U4
	pzdvBRLzHv9NmA90wjJWIkpn8M5FMHky04Kvy6yQO+mlm6uiUoDYXlyVduYun+vmRBUBB7rJEVtdY
	5e4Jo6IQipzCHB34bAWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8bWd-0005aJ-UF; Mon, 02 Mar 2020 03:13:47 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8bWZ-0005Yn-Lu
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 03:13:45 +0000
Received: from ig2.spreadtrum.com (shmbx02.spreadtrum.com [10.0.1.204])
 by SHSQR01.spreadtrum.com with ESMTPS id 0223CvpY074784
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
 Mon, 2 Mar 2020 11:12:57 +0800 (CST)
 (envelope-from Carson.Li1@unisoc.com)
Received: from SHMBX04.spreadtrum.com (10.0.1.214) by SHMBX02.spreadtrum.com
 (10.0.1.204) with Microsoft SMTP Server (TLS) id 15.0.847.32; Mon, 2 Mar 2020
 11:12:57 +0800
Received: from SHMBX04.spreadtrum.com ([fe80::8532:ef18:9217:26f5]) by
 shmbx04.spreadtrum.com ([fe80::8532:ef18:9217:26f5%13]) with mapi id
 15.00.0847.030; Mon, 2 Mar 2020 11:12:57 +0800
From: =?utf-8?B?5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIp?= <Carson.Li1@unisoc.com>
To: Hou Tao <houtao1@huawei.com>, Richard Weinberger <richard@nod.at>
Subject: RE: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Topic: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Index: AQHVyaL3y4TC5HCNzkiSy+TVWaB7mKfpWzQwG5Qm157/JAOmUHIw88Ik/HDzxSCANiTskIAKghsAgAFc6YD//9dEAAARFrMAAK2+roAAEgFJ4A==
Date: Mon, 2 Mar 2020 03:12:56 +0000
Message-ID: <6a8b67e4baf44534b6c92c80a0edbdd3@shmbx04.spreadtrum.com>
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
In-Reply-To: <6387af1b-d5a8-a175-6936-1f5f3ab003a4@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.1.253]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 0223CvpY074784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200301_191344_332101_0751C4EA 
X-CRM114-Status: UNSURE (   3.42  )
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

SGksDQoNCj5JdCBzZWVtcyB0aGUgTEVCIHVzZWQgYXMgREFUQSBqb3VybmFsIGhlYWQgaXMgR0Mn
ZWQsIGFuZCB1Ymlmc190bmNfbG9jYXRlKCkNCj5yZWFkIGFuIGludmFsaWQgbm9kZS4gQnV0IG5v
dyB0aGUgcHJvcGVydHkgb2Ygam91cm5hbCBoZWFkIExFQiBoYXMNCj5MUFJPUFNfVEFLRU4gZmxh
ZyBzZXQgYW5kIEdDIHdpbGwgc2tpcCB0aGVzZSBMRUJzLg0KDQo+VGhlIGFjdHVhbCBzaXR1YXRp
b24gb2YgdGhlIHByb2JsZW0gaXMgdGhlIExFQiBpcyBHQ2VkLCBmcmVlZCBhbmQgdGhlbg0KPnJl
dXNlZCBhcyBqb3VybmFsIGhlYWQsIGFuZCBmaW5hbGx5IHViaWZzX3RuY19sb2NhdGUoKSByZWFk
cyBhbiBpbnZhbGlkIG5vZGUuDQoNCkFjdHVhbGx5LCBJIHRoaW5rIHRoYXQgc2l0dWF0aW9uIG1p
Z2h0IG9ubHkgYmUgY2F1c2VkIGJ5IGEgY29tbWl0LCBpcyB0aGF0IHJpZ2h0Pw0KU2luY2Ugb25s
eSBjb21taXQgbWlnaHQgY2xlYXIgdGhlIGpvdXJuYWwgaGVhZCBMRUJzJyBwcm9wZXJ0eSBvZiBM
UFJPUFNfVEFLRU4uDQpCdXQgaXQgd2lsbCBub3QgZ2V0IHRoZSBjLT5qaGVhZHNbaV0ud2J1Zi0+
bG51bSBMRUIncyB0YWtlbiBwcm9wZXJ0eSBjbGVhcmVkLCBzbyB0aGVyZQ0Kc2VlbXMgbm8gbmVl
ZCB0byBjaGVjayBpZiBhIGMtPmpoZWFkc1tpXS53YnVmLT5sbnVtIExFQiBtaWdodCBiZSBHQ2Vk
IGFuZCB0aGUNCm5vZGUgd2hldGhlciBmdWxseSBzaXRzIGluIHdpcnRlIGJ1ZmZlci4NCg0KYnV0
IGl0IGlzIGFub3RoZXIgc2l0dWF0aW9uIGlmIHRoZXJlIGlzIG5vdCBvbmx5IG9uZSBidXQgdHdv
IG9yIG1vcmUgY29tbWl0cyBoYXBwZW4sDQp0aGUgTEVCIHdpdGggamhlYWRzW2ldLndidWYtPmxu
dW0gc2hvdWxkIGJlIGNvbnNpZGVyZWQgd2hldGhlciBpdCBoYXMgYmVlbiBHQ2VkLg0KSSBhbSBu
b3Qgc3VyZSBpZiB3ZSBuZWVkIHRvIGdldCBzdWNoIGEgbGVzcyBwb3NzaWJsZSBzaXR1YXRpb24g
aW50byBhY2NvdW50IDooIC4NCg0KPitzdGF0aWMgaW50IHViaWZzX2NoZWNrX2FuZF9yZWFkX3di
dWYoc3RydWN0IHViaWZzX2luZm8gKmMsDQo+KyAgICAgY29uc3Qgc3RydWN0IHViaWZzX3picmFu
Y2ggKnpiciwNCj4rICAgICBpbnQgZ2Nfc2VxLCB2b2lkICpidWYsIGJvb2wgKnJldHJ5KQ0KPit7
DQo+K2Jvb2wgZm91bmQgPSBmYWxzZTsNCj4raW50IGxudW0gPSB6YnItPmxudW07DQo+K2ludCBv
ZmZzID0gemJyLT5vZmZzOw0KPitpbnQgbGVuID0gemJyLT5sZW47DQo+K2ludCB0eXBlOw0KPitp
bnQgaTsNCj4raW50IGVycjsNCj4rDQo+KypyZXRyeSA9IGZhbHNlOw0KPitmb3IgKGkgPSAwOyBp
IDwgYy0+amhlYWRfY250OyBpKyspIHsNCj4rc3RydWN0IHViaWZzX3didWYgKndidWYgPSAmYy0+
amhlYWRzW2ldLndidWY7DQo+Kw0KPisvKiBDaGVjayB3aGV0aGVyIHRoZSBub2RlIGlzIGZ1bGx5
IGluY2x1ZGVkIGluIHdidWYgKi8NCj4rc3Bpbl9sb2NrKCZ3YnVmLT5sb2NrKTsNCj4raWYgKHdi
dWYtPmxudW0gPT0gbG51bSAmJiB3YnVmLT5vZmZzIDw9IG9mZnMgJiYNCj4rICAgIG9mZnMgKyBs
ZW4gPD0gd2J1Zi0+b2ZmcyArIHdidWYtPnVzZWQpIHsNCj4rLyoNCj4rICogbG51bSBpcyBHQydl
ZCBhbmQgcmV1c2VkIGFzIGpvdXJuYWwgaGVhZCwNCj4rICogd2UgbmVlZCB0byBsb29rdXAgVE5D
IGFnYWluLg0KPisgKi8NCj4raWYgKG1heWJlX2xlYl9nY2VkKGMsIGxudW0sIGdjX3NlcSkpIHsN
Cj4rc3Bpbl91bmxvY2soJndidWYtPmxvY2spOw0KPisqcmV0cnkgPSB0cnVlOw0KPiticmVhazsN
Cj4rfQ0KPisNCj4rbWVtY3B5KGJ1Ziwgd2J1Zi0+YnVmICsgb2ZmcyAtIHdidWYtPm9mZnMsIGxl
bik7DQo+K3NwaW5fdW5sb2NrKCZ3YnVmLT5sb2NrKTsNCj4rZm91bmQgPSB0cnVlOw0KPiticmVh
azsNCj4rfQ0KPitzcGluX3VubG9jaygmd2J1Zi0+bG9jayk7DQo+K30NCj4rDQoNCklzIGl0IG1v
cmUgc2FmZWx5IHRvIGhhdmUgbWF5X2xlYl9nY2VkIGFmdGVyIG1lbWNweSB0aG91Z2ggbWVtY3B5
IGlzIHF1aWNrbHk/DQoNCj4raWYgKCFmb3VuZCkNCityZXR1cm4gMDsNCisNCit0eXBlID0ga2V5
X3R5cGUoYywgJnpici0+a2V5KTsNCitlcnIgPSB1Ymlmc19jaGVja19ub2RlX2J1ZihjLCBidWYs
IHR5cGUsIGxlbiwgbG51bSwgb2Zmcyk7DQoraWYgKGVycikNCityZXR1cm4gZXJyOw0KKw0KK3Jl
dHVybiAxOw0KK30NCisNCg0KSSBkb24ndCBmaW5kIHRoZSB1Ymlmc19jaGVja19ub2RlX2J1ZiAs
IGlzIGl0IGEgZnVuY3Rpb24geW91IG5ld2x5IGRlZmluZWQgaW4gdGhpcyBwYXRjaD8NCg0KVGhh
bmtzLg0KQ2Fyc29uDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQogVGhpcyBl
bWFpbCAoaW5jbHVkaW5nIGl0cyBhdHRhY2htZW50cykgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhl
IHBlcnNvbiBvciBlbnRpdHkgdG8gd2hpY2ggaXQgaXMgYWRkcmVzc2VkIGFuZCBtYXkgY29udGFp
biBpbmZvcm1hdGlvbiB0aGF0IGlzIHByaXZpbGVnZWQsIGNvbmZpZGVudGlhbCBvciBvdGhlcndp
c2UgcHJvdGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gVW5hdXRob3JpemVkIHVzZSwgZGlzc2VtaW5h
dGlvbiwgZGlzdHJpYnV0aW9uIG9yIGNvcHlpbmcgb2YgdGhpcyBlbWFpbCBvciB0aGUgaW5mb3Jt
YXRpb24gaGVyZWluIG9yIHRha2luZyBhbnkgYWN0aW9uIGluIHJlbGlhbmNlIG9uIHRoZSBjb250
ZW50cyBvZiB0aGlzIGVtYWlsIG9yIHRoZSBpbmZvcm1hdGlvbiBoZXJlaW4sIGJ5IGFueW9uZSBv
dGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIG9yIGFuIGVtcGxveWVlIG9yIGFnZW50
IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVyaW5nIHRoZSBtZXNzYWdlIHRvIHRoZSBpbnRlbmRlZCBy
ZWNpcGllbnQsIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRl
bmRlZCByZWNpcGllbnQsIHBsZWFzZSBkbyBub3QgcmVhZCwgY29weSwgdXNlIG9yIGRpc2Nsb3Nl
IGFueSBwYXJ0IG9mIHRoaXMgZS1tYWlsIHRvIG90aGVycy4gUGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIGltbWVkaWF0ZWx5IGFuZCBwZXJtYW5lbnRseSBkZWxldGUgdGhpcyBlLW1haWwgYW5kIGFu
eSBhdHRhY2htZW50cyBpZiB5b3UgcmVjZWl2ZWQgaXQgaW4gZXJyb3IuIEludGVybmV0IGNvbW11
bmljYXRpb25zIGNhbm5vdCBiZSBndWFyYW50ZWVkIHRvIGJlIHRpbWVseSwgc2VjdXJlLCBlcnJv
ci1mcmVlIG9yIHZpcnVzLWZyZWUuIFRoZSBzZW5kZXIgZG9lcyBub3QgYWNjZXB0IGxpYWJpbGl0
eSBmb3IgYW55IGVycm9ycyBvciBvbWlzc2lvbnMuDQrmnKzpgq7ku7blj4rlhbbpmYTku7blhbfm
nInkv53lr4bmgKfotKjvvIzlj5fms5Xlvovkv53miqTkuI3lvpfms4TpnLLvvIzku4Xlj5HpgIHn
u5nmnKzpgq7ku7bmiYDmjIfnibnlrprmlLbku7bkurrjgILkuKXnpoHpnZ7nu4/mjojmnYPkvb/n
lKjjgIHlrqPkvKDjgIHlj5HluIPmiJblpI3liLbmnKzpgq7ku7bmiJblhbblhoXlrrnjgILoi6Xp
nZ7or6XnibnlrprmlLbku7bkurrvvIzor7fli7/pmIXor7vjgIHlpI3liLbjgIEg5L2/55So5oiW
5oqr6Zyy5pys6YKu5Lu255qE5Lu75L2V5YaF5a6544CC6Iul6K+v5pS25pys6YKu5Lu277yM6K+3
5LuO57O757uf5Lit5rC45LmF5oCn5Yig6Zmk5pys6YKu5Lu25Y+K5omA5pyJ6ZmE5Lu277yM5bm2
5Lul5Zue5aSN6YKu5Lu255qE5pa55byP5Y2z5Yi75ZGK55+l5Y+R5Lu25Lq644CC5peg5rOV5L+d
6K+B5LqS6IGU572R6YCa5L+h5Y+K5pe244CB5a6J5YWo44CB5peg6K+v5oiW6Ziy5q+S44CC5Y+R
5Lu25Lq65a+55Lu75L2V6ZSZ5ryP5Z2H5LiN5om/5ouF6LSj5Lu744CCDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
