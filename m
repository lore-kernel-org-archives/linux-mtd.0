Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A1AC4741F
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 07:34:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2EAA2224E
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 07:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WUivqe2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2EAA2224E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Mime-Version:References:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=p1lZITM17VcPBMCSv+LcQiB+3NhKFKK0sgqrpacXonw=; b=WUivqe2vaGigUWSyMTVKmQtTU
	kF8iPRn4DcVI6LLqmT6RKbxAKSE0JM3+XHTCLsyaoaRozqliTvwk+TKy7xcv4Vx/8oD/UJ95CUl4h
	CVi8RQ0lzZUUhHbUT3ZVFltt685M9psRwB3PlGhqkt6vXy2GtEaQ9rnkpcYxkPQ9ruquyuVwLzZNh
	9a5k+Gx4QtJsNrX9ZBKB6FFN65O/2vB0WoDjH2Fg/jY+68yVrn5njFxWu1m7FHssvEfQWGpri7lyg
	g9prsre/cFS2wbp4A9bKKirXXQh5vZmL/93l6FIjx1EgcqkJ6UmlHwRSCqzPyNfgIDa8AqQ+qBL/q
	zfRIcf1tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaDJE-00086T-Rc; Wed, 04 Nov 2020 07:34:21 +0000
Received: from regular1.263xmail.com ([211.150.70.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaDJ6-00083z-22; Wed, 04 Nov 2020 07:34:13 +0000
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id 5BC8F1D3D;
 Wed,  4 Nov 2020 15:34:06 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from hp1216 (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P1240T139713711163136S1604475244578897_; 
 Wed, 04 Nov 2020 15:34:05 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <dc2dc0e522a99ecf04dff8204a9eb029>
X-RL-SENDER: zyf@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: zyf@rock-chips.com
X-FST-TO: jbx6244@gmail.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Wed, 4 Nov 2020 15:34:04 +0800
Organization: =?UTF-8?B?55Ge6Iqv5b6u55S15a2Q?=
From: =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>
To: "Johan Jonker" <jbx6244@gmail.com>, 
 "Miquel Raynal" <miquel.raynal@bootlin.com>, richard <richard@nod.at>, 
 vigneshr <vigneshr@ti.com>, robh+dt <robh+dt@kernel.org>
Subject: Re: Re: [PATCH v13 2/8] mtd: rawnand: rockchip: NFC drivers for
 RK3308, RK2928 and others
References: <20201028095326.15562-1-yifeng.zhao@rock-chips.com>, 
 <20201028095326.15562-3-yifeng.zhao@rock-chips.com>, 
 <a8a7875b-f08b-62c6-a630-245687e0df3b@gmail.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <20201104153317363340190@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_023412_676496_40EDA6DE 
X-CRM114-Status: GOOD (  21.21  )
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
 =?UTF-8?B?SGVpa29TdMO8Ym5lcg==?= <heiko@sntech.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9oYW4sCgpPbiAyMDIwLzEwLzMxIDE5OjU4LCBKb2hhbiBKb25rZXIgd3JvdGU6Cj5IaSBZ
aWZlbmcsCi4uLgo+PiArCj4+ICtzdGF0aWMgaW50IHJrX25mY19yZWFkX3BhZ2VfaHdlY2Moc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCwgdTggKmJ1ZiwgaW50IG9vYl9vbiwKPj4gKwnCoCBpbnQgcGFn
ZSkKPj4gK3sKPj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+
PiArCXN0cnVjdCBya19uZmMgKm5mYyA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsK
Pj4gKwlzdHJ1Y3QgcmtfbmZjX25hbmRfY2hpcCAqcmtuYW5kID0gcmtfbmZjX3RvX3JrbmFuZChj
aGlwKTsKPj4gKwlzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJmNoaXAtPmVjYzsKPj4gKwlp
bnQgb29iX3N0ZXAgPSAoZWNjLT5ieXRlcyA+IDYwKSA/IE5GQ19NQVhfT09CX1BFUl9TVEVQIDoK
Pj4gKwlORkNfTUlOX09PQl9QRVJfU1RFUDsKPj4gKwlpbnQgcGFnZXNfcGVyX2JsayA9IG10ZC0+
ZXJhc2VzaXplIC8gbXRkLT53cml0ZXNpemU7Cj4+ICsJZG1hX2FkZHJfdCBkbWFfZGF0YSwgZG1h
X29vYjsKPgo+PiArCWludCByZXQgPSAwLCBpLCBib290X3JvbV9tb2RlID0gMDsKPgo+CWludCBy
ZXQgPSAwLCBpLCBjbnQsIGJvb3Rfcm9tX21vZGUgPSAwOwo+Cj4+ICsJaW50IGJpdGZsaXBzID0g
MCwgYmNoX3N0Owo+PiArCXU4ICpvb2I7Cj4+ICsJdTMyIHRtcDsKPj4gKwo+PiArCW5hbmRfcmVh
ZF9wYWdlX29wKGNoaXAsIHBhZ2UsIDAsIE5VTEwsIDApOwo+PiArCj4+ICsJZG1hX2RhdGEgPSBk
bWFfbWFwX3NpbmdsZShuZmMtPmRldiwgbmZjLT5wYWdlX2J1ZiwKPj4gKwnCoCBtdGQtPndyaXRl
c2l6ZSwKPj4gKwnCoCBETUFfRlJPTV9ERVZJQ0UpOwo+PiArCWRtYV9vb2IgPSBkbWFfbWFwX3Np
bmdsZShuZmMtPmRldiwgbmZjLT5vb2JfYnVmLAo+PiArCWVjYy0+c3RlcHMgKiBvb2Jfc3RlcCwK
Pj4gKwlETUFfRlJPTV9ERVZJQ0UpOwo+PiArCj4+ICsJLyoKPj4gKwkqIFRoZSBmaXJzdCBibG9j
a3MgKDQsIDggb3IgMTYgZGVwZW5kaW5nIG9uIHRoZSBkZXZpY2UpCj4+ICsJKiBhcmUgdXNlZCBi
eSB0aGUgYm9vdCBST00uCj4+ICsJKiBDb25maWd1cmUgdGhlIEVDQyBhbGdvcml0aG0gc3VwcG9y
dGVkIGJ5IHRoZSBib290IFJPTS4KPj4gKwkqLwo+Cj4+ICsJaWYgKChwYWdlIDwgcGFnZXNfcGVy
X2JsayAqIHJrbmFuZC0+Ym9vdF9ibGtzKSAmJgo+Cj4+ICsJaWYgKChwYWdlIDwgKHBhZ2VzX3Bl
cl9ibGsgKiBya25hbmQtPmJvb3RfYmxrcykpICYmCj4KPj4gKwnCoMKgwqAgKGNoaXAtPm9wdGlv
bnMgJiBOQU5EX0lTX0JPT1RfTUVESVVNKSkgewo+PiArCWJvb3Rfcm9tX21vZGUgPSAxOwo+PiAr
CWlmIChya25hbmQtPmJvb3RfZWNjICE9IGVjYy0+c3RyZW5ndGgpCj4+ICsJcmtfbmZjX2h3X2Vj
Y19zZXR1cChjaGlwLCBlY2MsCj4+ICsJwqDCoMKgIHJrbmFuZC0+Ym9vdF9lY2MpOwo+PiArCX0K
Pj4gKwo+PiArCXJlaW5pdF9jb21wbGV0aW9uKCZuZmMtPmRvbmUpOwo+PiArCXdyaXRlbChJTlRf
RE1BLCBuZmMtPnJlZ3MgKyBuZmMtPmNmZy0+aW50X2VuX29mZik7Cj4+ICsJcmtfbmZjX3hmZXJf
c3RhcnQobmZjLCBORkNfUkVBRCwgZWNjLT5zdGVwcywgZG1hX2RhdGEsCj4+ICsJwqAgZG1hX29v
Yik7Cj4+ICsJcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZuZmMtPmRvbmUsCj4+
ICsJwqAgbXNlY3NfdG9famlmZmllcygxMDApKTsKPj4gKwlpZiAoIXJldCkKPj4gKwlkZXZfd2Fy
bihuZmMtPmRldiwgInJlYWQ6IHdhaXQgZG1hIGRvbmUgdGltZW91dC5cbiIpOwo+PiArCS8qCj4+
ICsJKiBXaGV0aGVyIHRoZSBETUEgdHJhbnNmZXIgaXMgY29tcGxldGVkIG9yIG5vdC4gVGhlIGRy
aXZlcgo+PiArCSogbmVlZHMgdG8gY2hlY2sgdGhlIE5GQ2BzIHN0YXR1cyByZWdpc3RlciB0byBz
ZWUgaWYgdGhlIGRhdGEKPj4gKwkqIHRyYW5zZmVyIHdhcyBjb21wbGV0ZWQuCj4+ICsJKi8KPj4g
KwlyZXQgPSBya19uZmNfd2FpdF9mb3JfeGZlcl9kb25lKG5mYyk7Cj4KPmFkZCBlbXB0eSBsaW5l
Cj4KPj4gKwlkbWFfdW5tYXBfc2luZ2xlKG5mYy0+ZGV2LCBkbWFfZGF0YSwgbXRkLT53cml0ZXNp
emUsCj4+ICsJRE1BX0ZST01fREVWSUNFKTsKPj4gKwlkbWFfdW5tYXBfc2luZ2xlKG5mYy0+ZGV2
LCBkbWFfb29iLCBlY2MtPnN0ZXBzICogb29iX3N0ZXAsCj4+ICsJRE1BX0ZST01fREVWSUNFKTsK
Pj4gKwo+PiArCWlmIChyZXQpIHsKPgo+PiArCWJpdGZsaXBzID0gLUVJTzsKPgo+CXJldCA9IC1F
SU87Cj4KPnJldHVybiBvbmx5ICIwIiBvciBvZmZpY2lhbCBlcnJvciBjb2Rlcwo+Cj4+ICsJZGV2
X2VycihuZmMtPmRldiwKPj4gKwkicmVhZDogd2FpdCB0cmFuc2ZlciBkb25lIHRpbWVvdXQuXG4i
KTsKPj4gKwlnb3RvIG91dDsKPj4gKwl9Cj4+ICsKPj4gKwlmb3IgKGkgPSAxOyBpIDwgZWNjLT5z
dGVwczsgaSsrKSB7Cj4+ICsJb29iID0gY2hpcC0+b29iX3BvaSArIChpIC0gMSkgKiBORkNfU1lT
X0RBVEFfU0laRTsKPj4gKwlpZiAobmZjLT5jZmctPnR5cGUgPT0gTkZDX1Y5KQo+PiArCXRtcCA9
IG5mYy0+b29iX2J1ZltpXTsKPj4gKwllbHNlCj4+ICsJdG1wID0gbmZjLT5vb2JfYnVmW2kgKiAo
b29iX3N0ZXAgLyA0KV07Cj4+ICsJKm9vYisrID0gKHU4KXRtcDsKPj4gKwkqb29iKysgPSAodTgp
KHRtcCA+PiA4KTsKPj4gKwkqb29iKysgPSAodTgpKHRtcCA+PiAxNik7Cj4+ICsJKm9vYisrID0g
KHU4KSh0bXAgPj4gMjQpOwo+PiArCX0KPj4gKwo+PiArCWZvciAoaSA9IDA7IGkgPCAoZWNjLT5z
dGVwcyAvIDIpOyBpKyspIHsKPj4gKwliY2hfc3QgPSByZWFkbF9yZWxheGVkKG5mYy0+cmVncyAr
Cj4+ICsJwqDCoMKgwqDCoMKgIG5mYy0+Y2ZnLT5iY2hfc3Rfb2ZmICsgaSAqIDQpOwo+PiArCWlm
IChiY2hfc3QgJiBCSVQobmZjLT5jZmctPmVjYzAuZXJyX2ZsYWdfYml0KSB8fAo+PiArCcKgwqDC
oCBiY2hfc3QgJiBCSVQobmZjLT5jZmctPmVjYzEuZXJyX2ZsYWdfYml0KSkgewo+PiArCW10ZC0+
ZWNjX3N0YXRzLmZhaWxlZCsrOwo+Cj4+ICsJYml0ZmxpcHMgPSAwOwo+Cj5tYXhfYml0ZmxpcHMg
PSAtMTsKPgo+dXNlIG1heF9iaXRmbGlwcyBvbmx5IGZvciB0aGUgZXJyb3Igd2FybmluZywgbm90
IGFzIHJldHVybiB2YWx1ZQo+Cj4+ICsJfSBlbHNlIHsKPgo+PiArCXJldCA9IEVDQ19FUlJfQ05U
KGJjaF9zdCwgbmZjLT5jZmctPmVjYzApOwo+Cj51c2UgcmV0IG9ubHkgd2l0aCAiMCIgb3Igb2Zm
aWNpYWwgZXJyb3IgY29kZXMsIHVzZSBjbnQgaW5zdGVhZAo+Cj4JY250ID0gRUNDX0VSUl9DTlQo
YmNoX3N0LCBuZmMtPmNmZy0+ZWNjMCk7Cj4KPj4gKwltdGQtPmVjY19zdGF0cy5jb3JyZWN0ZWQg
Kz0gcmV0Owo+CW10ZC0+ZWNjX3N0YXRzLmNvcnJlY3RlZCArPSBjbnQ7Cj4KPj4gKwliaXRmbGlw
cyA9IG1heF90KHUzMiwgYml0ZmxpcHMsIHJldCk7Cj4KPgliaXRmbGlwcyA9IG1heF90KHUzMiwg
Yml0ZmxpcHMsIGNudCk7Cj4KPj4gKwo+PiArCXJldCA9IEVDQ19FUlJfQ05UKGJjaF9zdCwgbmZj
LT5jZmctPmVjYzEpOwo+Cj4JY250ID0gRUNDX0VSUl9DTlQoYmNoX3N0LCBuZmMtPmNmZy0+ZWNj
MSk7Cj4KPj4gKwltdGQtPmVjY19zdGF0cy5jb3JyZWN0ZWQgKz0gcmV0Owo+Cj4JbXRkLT5lY2Nf
c3RhdHMuY29ycmVjdGVkICs9IGNudDsKPgo+PiArCWJpdGZsaXBzID0gbWF4X3QodTMyLCBiaXRm
bGlwcywgcmV0KTsKPgo+CWJpdGZsaXBzID0gbWF4X3QodTMyLCBiaXRmbGlwcywgY250KTsKPj4g
Kwl9Cj4+ICsJfQo+PiArb3V0Ogo+PiArCW1lbWNweShidWYsIG5mYy0+cGFnZV9idWYsIG10ZC0+
d3JpdGVzaXplKTsKPj4gKwo+Cj4+ICsJaWYgKGJvb3Rfcm9tX21vZGUgJiYgcmtuYW5kLT5ib290
X2VjYyAhPSBlY2MtPnN0cmVuZ3RoKQo+PiArCXJrX25mY19od19lY2Nfc2V0dXAoY2hpcCwgZWNj
LCBlY2MtPnN0cmVuZ3RoKTsKPj4gKwo+Cj4+ICsJaWYgKGJpdGZsaXBzID4gZWNjLT5zdHJlbmd0
aCkKPgo+CWlmIChiaXRmbGlwc8KgID09IC0xKSB7Cj4JcmV0ID0gLUVJTzsKPgo+PiArCWRldl9l
cnIobmZjLT5kZXYsICJyZWFkIHBhZ2U6ICV4IGVjYyBlcnJvciFcbiIsIHBhZ2UpOwo+Cj59CgpJ
dCBjYW5ub3QgcmV0dXJuIC0gRUlPIHdoaWxlIEVDQyBmYWlsLCByZWZlciB0byB0aGUgZnVuY3Rp
b24gbmFuZF9kb19yZWFkX29wcywKCm1heWJlIG5lZWQgZG8gcmVhZF9yZXRyeSB3aGlsZSBFQ0Mg
ZmFpbC4KCkkgdGhpbmsgcmV0dXJuIDAgaXMgYmV0dGVyIHdoaWxlIGVjYyBmYWls77yMYXMgc3Vn
Z2VzdGVkIGJ5IE1pcXVlbC4KCkluIG90aGVyIGNhc2VzLCByZXR1cm4gdGhlIGFjdHVhbCBFQ0Mg
ZXJyb3IgYml0LCBiZWNhdXNlIHRoZSBmaWxlIHN5c3RlbShzdWNoIGFzIHViaWZzKSBuZWVkcyB0
bwoKa25vdyB3aGV0aGVyIHRoZSBkYXRhIGlzIHJlbGlhYmxlIG9yIG5lZWRzIHRvIGJlIHJlZnJl
c2hlZCAoLUVVQ0xFQU4pLgoKaW50IG10ZF9yZWFkX29vYihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
bG9mZl90IGZyb20sIHN0cnVjdCBtdGRfb29iX29wcyAqb3BzKQp7CgouLi4KCnJldHVybiByZXRf
Y29kZSA+PSBtdGQtPmJpdGZsaXBfdGhyZXNob2xkID8gLUVVQ0xFQU4gOiAwOwoKfQoKPj4gKwo+
PiArCS8qCj4+ICsJKiBEZXNlbGVjdCB0aGUgY3VycmVudGx5IHNlbGVjdGVkIHRhcmdldCBhZnRl
ciB0aGUgb3BzIGlzIGRvbmUKPj4gKwkqIHRvIHJlZHVjZSB0aGUgcG93ZXIgY29uc3VtcHRpb24u
Cj4+ICsJKi8KPj4gKwlya19uZmNfc2VsZWN0X2NoaXAoY2hpcCwgLTEpOwo+PiArCj4KPj4gKwly
ZXR1cm4gYml0ZmxpcHM7Cj4KPglyZXR1cm4gcmV0Owo+Cj5SZXR1cm4gb25seSAiMCIgb3Igb2Zm
aWNpYWwgZXJyb3IgY29kZXMKPklmIHlvdSB3YW50IHRvIGRvIGEgImJhZCBibG9jayBzY2FuIiBm
dW5jdGlvbiBpbiB1c2VyIHNwYWNlIGFuYWx5c2UvdXNlCj4ibXRkLT5lY2Nfc3RhdHMiIGluc3Rl
YWQuCj4KPj4gK30KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
