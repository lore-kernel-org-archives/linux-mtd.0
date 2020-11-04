Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD02C388F9
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 07:31:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C622080D
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 07:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9bYr07t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C622080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Mime-Version:References:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=oT0uY+nBM3AjWaPl/XBT5knDhntf/iFUbglaCv3Y9N8=; b=N9bYr07tTR7qx3ttadI68nhsV
	0xB+Sjbg4jIl7B9oeekRWPvc5+cnwnSsJV25I7e5uThqU6nCvCOK2ECmKp7Ccu37UeJGnk9abTXNH
	tt0THtW+yGzfY24T7nRtyg4dCHNIJ7x2IwAt4RMmbmym5u/RSVrKLHaV+matDphufAy3IcfJHc0kb
	p/t5VGqbPYmLttMoWzNiArxoWcpWwFxVTHHzaQvyZJML1mDPF4Hb/kBGwvug0w6o55utL77pXGpIs
	jkrcV4KyshK9Sdcf4Wzt5eGtGuq86dKufWFV7B/KI+PqU26z8+GnxApQA52+Md0uw7B70eeCQuZac
	+YPCwiubw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaDFr-0007fk-I2; Wed, 04 Nov 2020 07:30:51 +0000
Received: from regular1.263xmail.com ([211.150.70.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaDFl-0007eg-U2; Wed, 04 Nov 2020 07:30:47 +0000
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id 7AFB6963;
 Wed,  4 Nov 2020 15:30:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from hp1216 (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P1240T139713990088448S1604475032549643_; 
 Wed, 04 Nov 2020 15:30:33 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <aefef2fffce3b783601dee267a1d00f5>
X-RL-SENDER: zyf@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: zyf@rock-chips.com
X-FST-TO: jbx6244@gmail.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Wed, 4 Nov 2020 15:30:32 +0800
Organization: =?utf-8?B?55Ge6Iqv5b6u55S15a2Q?=
From: =?utf-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>
To: "Johan Jonker" <jbx6244@gmail.com>, 
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: Re: [PATCH v13 2/8] mtd: rawnand: rockchip: NFC drivers for
 RK3308, RK2928 and others
References: <20201028095326.15562-1-yifeng.zhao@rock-chips.com>, 
 <20201028095326.15562-3-yifeng.zhao@rock-chips.com>, 
 <a8a7875b-f08b-62c6-a630-245687e0df3b@gmail.com>, 
 <e02e13a0-769d-6b73-c87e-5b7d75fd4254@rock-chips.com>, 
 <0b417fc2-3503-9bf6-914d-0f8b38df1914@gmail.com>, 
 <20201102140725.66e7dcb1@xps13>, 
 <5ad70fa0-05a9-e1e7-32cc-32933ff25ae9@gmail.com>, 
 <803e291f-67e0-f66c-6c9e-041db1b3847c@gmail.com>, 
 <20201102180039.757d3234@xps13>, 
 <cd349a1f-773d-096a-f0ae-90c5eb847769@gmail.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <20201104152931632919186@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_023046_541693_2298E6C1 
X-CRM114-Status: GOOD (  19.65  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 =?utf-8?B?SGVpa29TdMO8Ym5lcg==?= <heiko@sntech.de>, richard <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 robh+dt <robh+dt@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 vigneshr <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC8xMS8zIDE6MTEsIEpvaGFuIEpvbmtlciB3cm90ZToKPk9uIDExLzIvMjAgNjowMCBQ
TSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGkgSm9oYW4sCj4+Cj4+IEpvaGFuIEpvbmtlciA8
amJ4NjI0NEBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMiBOb3YgMjAyMCAxNzozMToxOAo+PiAr
MDEwMDoKPj4KPj4+IE9uIDExLzIvMjAgMjoxMSBQTSwgSm9oYW4gSm9ua2VyIHdyb3RlOgo+Pj4+
IEhpLAo+Pj4+Cj4+Pj4gT24gMTEvMi8yMCAyOjA3IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
Pj4+PiBIaSBKb2hhbiwgWWlmZW5nCj4+Pj4+Cj4+Pj4+IEpvaGFuIEpvbmtlciA8amJ4NjI0NEBn
bWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMiBOb3YgMjAyMCAxMzo1Nzo1Ngo+Pj4+PiArMDEwMDoK
Pj4+Pj4KPj4+Pj4+IEhpIFlpZmVuZywKPj4+Pj4+Cj4+Pj4+PiBEb24ndCBwb2tlIHdpdGggImVj
Yy0+Ynl0ZXMiIG9uZXMgaXQgaXMgc2V0IGluIHJrX25mY19lY2NfaW5pdCgpLiBJdAo+Pj4+Pj4g
d2lsbCBub3QgYmUgbm90ZWQgYnkgdGhlIE1URCBmcmFtZSB3b3JrIG9yIHVzZXJzcGFjZS4gSSB0
aGluayB0aGVyZSdzCj4+Pj4+PiBjdXJyZW50bHkgbm8gd2F5IHRvIGxldCB0aGUgdXNlciBrbm93
IHRoYXQgYSBkaWZmZXJlbnQgRUNDIG11c3QgYmUgdXNlZC4KPj4+Pj4+IE5laXRoZXIgY2FuIHRo
ZSB1c2VyIHNldCBFQ0Mgb24gdGhlIGZseS4KPj4+Pj4+Cj4+Pj4+PiBFeGFtcGxlIFIvVyBmbG93
Ogo+Pj4+Pj4KPj4+Pj4+wqDCoMKgwqDCoMKgwqDCoCBuYW5kX3NlbGVjdF90YXJnZXQoKQo+Pj4+
Pj4gY2hpcC0+ZWNjLndyaXRlX3BhZ2VfcmF3KCkKPj4+Pj4+IGNoaXAtPmVjYy53cml0ZV9wYWdl
KCkKPj4+Pj4+Cj4+Pj4+PiBbLi5dCj4+Pj4+Pgo+Pj4+Pj4gY2hpcC0+ZWNjLnJlYWRfcGFnZV9y
YXcoKQo+Pj4+Pj4gY2hpcC0+ZWNjLnJlYWRfcGFnZSgpCj4+Pj4+PsKgwqDCoMKgwqDCoMKgwqAg
bmFuZF9kZXNlbGVjdF90YXJnZXQoKQo+Pj4+Pj4KPj4+Pj4+IEEgd3JpdGUvcmVhZCB3aXRoOgo+
Pj4+Pj4KPj4+Pj4+IHJrX25mY19yZWFkX3BhZ2VfaHdlY2MoKQo+Pj4+Pj4gcmtfbmZjX3dyaXRl
X3BhZ2VfaHdlY2MoKQo+Pj4+Pj4KPj4+Pj4+IG9yCj4+Pj4+Pgo+Pj4+Pj4gcmtfbmZjX3JlYWRf
cGFnZV9yYXcoKQo+Pj4+Pj4gcmtfbmZjX3dyaXRlX3BhZ2VfcmF3KCkKPj4+Pj4+Cj4+Pj4+PiBt
dXN0IGVuZCB1cCB3aXRoIHRoZSBzYW1lIHJlc3VsdC4gSWYgd2UgY2FuJ3QgYXJjaGl2ZSB0aGF0
LCB0aGVuIHdlCj4+Pj4+PiBzaG91bGRuJ3Qgb2ZmZXIgUkFXIG1vZGUgdG8gdGhlIHVzZXIgZm9y
IG5vdy4gSWYgTWlxdWVsIGFncmVlcyB5b3UKPj4+Pj4+IHNob3VsZCBqdXN0IGdldCB0aGUgZHJp
dmVyIHJlYWR5IG5vdyB3aXRob3V0IHRoZXNlIDIgZnVuY3Rpb25zIGFuZCByb3VuZAo+Pj4+Pj4g
dGhpbmdzIHVwLgo+Pj4+Pgo+Pj4+PiBXaGF0IGFib3V0IGp1c3Qgbm90IHN1cHBvcnRpbmcgdGhl
IEJvb3RST00gYXJlYSBpZiBpdCB3YXMgbWFya2VkCj4+Pj4+ICJyZXNlcnZlZCIgYnkgdGhlIEJS
b20gaW4gdGhlIERUPwo+Pj4+Cj4+Pj4gU2hvdWxkIHdlIGp1c3QgZmlsbCB0aGUgYnVmZmVycyB3
aXRoICcweGZmJyBmb3IgYm9vdCBibG9ja3M/Cj4+Pgo+Pj4gKHBhcnQgMikgOykKPj4+IE15IGZh
dWx0Li4uLgo+Pj4gQmV0dGVyIHVzZToKPj4+Cj4+PsKgwqDCoMKgIGlmICgoY2hpcC0+b3B0aW9u
cyAmIE5BTkRfSVNfQk9PVF9NRURJVU0pICYmCj4+PsKgwqDCoMKgwqDCoMKgwqAgKHBhZ2UgPCAo
cGFnZXNfcGVyX2JsayAqIHJrbmFuZC0+Ym9vdF9ibGtzKSkpIHsKPj4+Cj4+PiByZXR1cm4gLUVJ
TzsKPj4+Cj4+PsKgwqDCoMKgIH0KPj4KPj4gWXVwLCBJIHdhcyBhYm91dCB0byB0ZWxsIHlvdSB0
aGF0IEkgd291bGQgcHJlZmVyIHJldHVybmluZyBhIG5pY2UKPj4gZXJyb3IsIHRoaXMgaXMgZmlu
ZSBJIGd1ZXNzLgo+Pgo+PiBBbnl3YXksIEkgdGhpbmsgcmVhZGluZyBiYWQgYmxvY2sgbWFya2Vy
cyBpcyBkb25lIGluIHJhdyBtb2RlLCBzbyBpZgo+PiByYXcgYWNjZXNzb3JzIHJlZnVzZSB0byBy
ZXR1cm4gdmFsaWQgdmFsdWVzIGZvciBib290IGJsb2NrcywgeW91IHdvbid0Cj4+IGJlIGFibGUg
dG8gYWNjZXNzIGl0IG5laXRoZXIgd2l0aCByYXcgbm9yIGNvcnJlY3RlZCBob29rcy4KPj4KPj4g
UGVyaGFwcyByZWZ1c2luZyB0aGUgYWNjZXNzIHRvIHRoZSByZWd1bGFyIHBhZ2UgYWNjZXNzIGlz
IG9rLCBidXQgbWF5YmUKPj4gd2Ugc2hvdWxkIGJlIGFibGUgdG8gYXQgbGVhc3QgcmVhZCB0aGVz
ZSBwYWdlcyBpbiByYXcgbW9kZQo+PiAoYW5kIG1vdmUgdGhlIEJCTSB0byBpdHMgcmlnaHQgbG9j
YXRpb24pLiBXaGF0IGRvIHlvdSB0aGluaz8KPgo+SSB0aGluayB0aGF0IHRoZSBwcm9ibGVtIHdp
dGggYXN5bW1ldHJpYyByZWFkIGFuZCB3cml0ZSBhY2Nlc3MgaXMgdGhhdCBhCj51c2VyIHJlYWRz
IGRhdGEgc3VjY2Vzc2Z1bCwgYnV0IHRoYXQgaXQgY2FuJ3Qgd3JpdGUgaXQgYmFjayBhZnRlciBp
dCdzCj5ibG9jayBpcyBlcmFzZWQuIFlvdSBzaG91bGRuJ3QgZ2l2ZSB0aGUgaWxsdXNpb24gdGhh
dCB0aGUgYm9vdCBST00KPmJsb2NrcyBjYW4gYmUgYWNjZXNzZWQgaW4gUkFXIG1vZGUuIFNvbWV0
aGluZyB3aXRoIHBlcmNlcHRpb24uLi5kb2VzCj51c2VyIHNwYWNlIGtub3duIHRoYXQgUm9ja2No
aXAncyBORkMgaXMgc3BlY2lhbC4uLgo+Cj4gCgpJcyBpdCBwb3NzaWJsZSB0byByZXR1cm4gYSBl
cnJvciB3aGVuIHRoZSBFQ0MgaXMgZGlmZmVyZW50IGJldHdlZW4gdGhlIGJvb3QgUk9NIGJsb2Nr
cyBhbmQgb3RoZXIgYmxvY2tzPwpJZiB0aGUgRUNDIGlzIHRoZSBzYW1lLCBhbmQgdGhlIE9PQiBs
YXlvdXQgaXMgdGhlIHNhbWUgYW5kIGRvZXMgbm90IG5lZWQgc3BlY2lhbCB0cmVhdG1lbnQuCgpz
dGF0aWMgaW50IHJrX25mY19yZWFkX3BhZ2VfcmF3KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHU4
ICpidWYsIGludCBvb2Jfb24saW50IHBhZ2UpCnsKLi4uCsKgaWYgKChjaGlwLT5vcHRpb25zICYg
TkFORF9JU19CT09UX01FRElVTSkgJiYKwqAgwqAgwqAgwqAgKHBhZ2UgPCAocGFnZXNfcGVyX2Js
ayAqIHJrbmFuZC0+Ym9vdF9ibGtzKSkgJiYKCShya25hbmQtPmJvb3RfZWNjICE9IGVjYy0+c3Ry
ZW5ndGgpKSB7CgkJcmV0dXJuIC1FSU87CsKgIMKgIH0KLi4uCn0KCkFib3V0IHRoZSBCQk0sIHRo
ZSB1LWJvb3Qgd2lsbCBjcmVhdGUgQkJUIGF0IHRoZSBmaXJzdCBwb3dlciB1cC4KCWNoaXAtPmJi
dF9vcHRpb25zID0gTkFORF9CQlRfVVNFX0ZMQVNIIHwgTkFORF9CQlRfTk9fT09COwpJZiB1Ym9v
dCBkb2VzIG5vdCBjcmVhdGUgQkJULCB0aGVuIHRoZSBmcmFtZXdvcmsgd2lsbCBzY2FuIHRoZSBP
T0Igb2YgYWxsIGJsb2NrcyBhbmQgwqBjcmVhdGUgaXQuCkkgbW9kaWZpZWQgdGhlIHJlYWQgT09C
IGZ1bmN0aW9uIChlbmFibGUgRUNDKSDvvIxhbmQgaXQgY2FuIHJlYWQgdGhlIGNvcnJlY3QgYmFk
IGJsb2NrIG1hc2suCgpzdGF0aWMgaW50IHJrX25mY193cml0ZV9vb2Ioc3RydWN0IG5hbmRfY2hp
cCAqY2hpcCwgaW50IHBhZ2UpCnsKCXJldHVybiBya19uZmNfd3JpdGVfcGFnZV9od2VjYyhjaGlw
LCBOVUxMLCAxLCBwYWdlKTsKfQoKc3RhdGljIGludCBya19uZmNfcmVhZF9vb2Ioc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgaW50IHBhZ2UpCnsKCXJldHVybiBya19uZmNfcmVhZF9wYWdlX2h3ZWNj
KGNoaXAsIE5VTEwsIDEsIHBhZ2UpOwp9CgpjaGlwLT5lY2MucmVhZF9vb2IgPSBya19uZmNfcmVh
ZF9vb2I7CmNoaXAtPmVjYy53cml0ZV9vb2IgPSBya19uZmNfd3JpdGVfb29iOwoKCgo+Pgo+PiBU
aGFua3MsCj4+IE1pcXXDqGwKPj4KPj4+Cj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFJhdyBhY2Nlc3Nv
cnMgaXMgcmVhbGx5IGEgbmljZSBhbmQgYmFzaWMgZmVhdHVyZSB0aGF0IEkgd291bGQgbGlrZSB0
bwo+Pj4+PiBoYXZlIGluIGV2ZXJ5IG5ldyBkcml2ZXIuCj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+
Pj4gTWlxdcOobAo+Pj4+Pgo+Pj4+Cj4+Pgo+Cj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
