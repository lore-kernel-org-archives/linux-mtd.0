Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5440FC43334
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Xn/Z8vZfcTGRBqmgt75pYQVegbgCkkbeKpVevCOS8s=; b=Xkyqn9Y0d4RpeRDdTFhDnXpXRM
	SpjShyEE79b0tMUBHafIQWeOaGc0oin6tF0+i3gkyotqUfZ9jaBMyXLcbqQP9e0c4bJNqpNuM1w2q
	r3nqtb7k+tu2MaCa1TKp15XHgpawLAwc6rC75XgG3lxgJkOx9ER2yxi1VralSMtDw6XkVNWzBId0V
	PmwZvLWeliFvsDjMwldPDVIw5AWbtFfAde0RB9L+zmXqsh+nxCyYchmEJnPkRlWNEKfF7UFa7LpFw
	Nmw9aNBMJ984OgJgD+Ya2XL95VeYbNA6Wd0ea5oqunR7N+96FrjCrCKGddXwwKxEYJsQh6YGi+p79
	RZ03QhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFIam-005qGf-Jp; Sat, 23 Jul 2022 17:07:04 +0000
Received: from out28-170.mail.aliyun.com ([115.124.28.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFIaj-005qD3-3I
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 17:07:03 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07462738|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0428046-0.00500691-0.952188;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.Obm0Iun_1658595976;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Obm0Iun_1658595976)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 01:06:18 +0800
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
To: Mark Brown <broonie@kernel.org>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
 <YtrukeLk9fInqQIL@sirena.org.uk>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <89d22457-8c62-e441-3bf4-2734ec2a45e1@wanyeetech.com>
Date: Sun, 24 Jul 2022 01:06:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <YtrukeLk9fInqQIL@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_100701_374194_68FF8DAC 
X-CRM114-Status: GOOD (  28.31  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyaywKCk9uIDIwMjIvNy8yMyDkuIrljYgyOjM4LCBNYXJrIEJyb3duIHdyb3RlOgo+IE9u
IFNhdCwgSnVsIDIzLCAyMDIyIGF0IDEyOjQ4OjMwQU0gKzA4MDAsIOWRqOeQsOadsCAoWmhvdSBZ
YW5qaWUpIHdyb3RlOgo+Cj4gVGhpcyBsb29rcyBtb3N0bHkgZ29vZCwgYSBmZXcgc21hbGwgaXNz
dWVzIHRob3VnaDoKPgo+PiArKysgYi9kcml2ZXJzL3NwaS9zcGktaW5nZW5pYy1zZmMuYwo+PiBA
QCAtMCwwICsxLDY2MiBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+PiArLyoKPj4gKyAqIEluZ2VuaWMgU29DcyBTUEkgRmxh
c2ggQ29udHJvbGxlciBEcml2ZXIKPiBQbGVhc2UgbWFrZSB0aGUgZW50aXJlIGNvbW1lbnQgYSBD
Kysgb25lIHNvIHRoaW5ncyBsb29rIG1vcmUKPiBpbnRlbnRpb25hbC4KCgpJJ20gc29ycnksIEkg
ZGlkbid0IHVuZGVyc3RhbmQgd2VsbCB3aGF0IHlvdSBtZWFudCA6KApDb3VsZCB5b3UgcGxlYXNl
IGV4cGxhaW4gYSBsaXR0bGUgbW9yZSBkZXRhaWw/CgoKPgo+PiArc3RhdGljIGlycXJldHVybl90
IGluZ2VuaWNfc2ZjX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4+ICt7Cj4+ICsJ
c3RydWN0IGluZ2VuaWNfc2ZjICpzZmMgPSBkYXRhOwo+PiArCj4+ICsJd3JpdGVsKDB4MWYsIHNm
Yy0+YmFzZSArIFNGQ19SRUdfSU5UQyk7Cj4+ICsKPj4gKwljb21wbGV0ZSgmc2ZjLT5jb21wbGV0
aW9uKTsKPj4gKwo+PiArCXJldHVybiBJUlFfSEFORExFRDsKPj4gK30KPiBUaGlzIGRvZXNuJ3Qg
cGF5IGFueSBhdHRlbnRpb24gdG8gYW55IHN0YXR1cyByZWdpc3RlcnMgaW4gdGhlIGNoaXAgc28K
PiB3b24ndCB3b3JrIGlmIHRoZSBpbnRlcnJ1cHQgaXMgc2hhcmVkIGFuZCB3b24ndCBub3RpY2Ug
YW55IGVycm9yIHJlcG9ydHMKPiBmcm9tIHRoZSBkZXZpY2UuLi4KCgpUaGlzIGludGVycnVwdCBp
cyBleGNsdXNpdmVseSBvd25lZCBieSBTRkMsIGRvIHdlIHN0aWxsCm5lZWQgdG8gcGVyZm9ybSB0
aGUgb3BlcmF0aW9uIHlvdSBzYWlkPyBJIGhhdmVuJ3QgZG9uZQp0aGVzZSBvcGVyYXRpb25zIGJl
Zm9yZSBiZWNhdXNlIEkgd2FudCB0byBtaW5pbWl6ZSB0aGUKb3ZlcmhlYWQgYW5kIGF2b2lkIGFm
ZmVjdGluZyBwZXJmb3JtYW5jZS4KCgo+Cj4+ICtzdGF0aWMgaW50IGluZ2VuaWNfc2ZjX3NldHVw
KHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCj4+ICt7Cj4+ICsJc3RydWN0IGluZ2VuaWNfc2ZjICpz
ZmMgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0YShzcGktPm1hc3Rlcik7Cj4+ICsJdW5zaWdu
ZWQgbG9uZyByYXRlOwo+PiArCWludCByZXQsIHZhbDsKPj4gKwo+PiArCWlmICghc3BpLT5tYXhf
c3BlZWRfaHopCj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCj4+ICsJcmV0ID0gY2xrX3NldF9y
YXRlKHNmYy0+Y2xrLCBzcGktPm1heF9zcGVlZF9oeiAqIDIpOwo+PiArCWlmIChyZXQpCj4+ICsJ
CXJldHVybiAtRUlOVkFMOwo+IFRoZSBzZXR1cCgpIG9wZXJhdGlvbiBzaG91bGQgYmUgc2FmZSBm
b3IgdXNlIG9uIG9uZSBkZXZpY2Ugd2hpbGUgYW5vdGhlcgo+IGRldmljZSBpcyBhY3RpdmUuICBJ
dCdzIG5vdCBnb2luZyB0byBiZSBhIHByb2JsZW0gdW50aWwgdGhlcmUncyBhCj4gdmVyc2lvbiBv
ZiB0aGUgSVAgd2l0aCBtb3JlIHRoYW4gb25lIGNoaXAgc2VsZWN0LCBidXQgdGhhdCBjb3VsZCBo
YXBwZW4KPiBzb21lIHRpbWUgKGFuZCBzb21lb25lIG1pZ2h0IGRlY2lkZSB0byBtYWtlIGEgYm9h
cmQgdXNpbmcgR1BJTyBjaGlwCj4gc2VsZWN0cy4uLikgYnV0IHRoaXMgc2hvdWxkIHJlYWxseSBn
byBpbnRvIHRoZSBkYXRhIHBhdGguCgoKU3VyZSwgSSB3aWxsIGNoYW5nZSBpdCBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgoKCj4+ICsJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHNmYy0+Y2xrKTsKPj4g
KwlpZiAocmV0KQo+PiArCQlnb3RvIGVycl9wdXRfbWFzdGVyOwo+IE5vdGhpbmcgZXZlciBkaXNh
YmxlcyB0aGlzIGNsb2NrLiAgSXQgbWlnaHQgYWxzbyBiZSBuaWNlIHRvIGVuYWJsZSB0aGUKPiBj
bG9jayBvbmx5IHdoZW4gdGhlIGNvbnRyb2xsZXIgaXMgaW4gdXNlLCB0aGF0IGJpdCBpcyBub3Qg
c3VwZXIKPiBpbXBvcnRhbnQgdGhvdWdoLgoKClN1cmUsIHdpbGwgYWRkIGl0LgoKCj4KPj4gKwly
ZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIHNmYy0+aXJxLCBpbmdlbmljX3NmY19p
cnFfaGFuZGxlciwgMCwKPj4gKwkJCWRldl9uYW1lKCZwZGV2LT5kZXYpLCBzZmMpOwo+PiArCWlm
IChyZXQpIHsKPj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3QgaXJx
JWQsIHJldCA9ICVkXG4iLCBzZmMtPmlycSwgcmV0KTsKPj4gKwkJZ290byBlcnJfcHV0X21hc3Rl
cjsKPj4gKwl9Cj4gSXQncyBub3Qgc2FmZSB0byB1c2UgZGV2bSBoZXJlLi4uCgoKU3VyZSwgd2ls
bCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCgo+Cj4+ICsJcmV0ID0gZGV2bV9zcGlfcmVn
aXN0ZXJfY29udHJvbGxlcigmcGRldi0+ZGV2LCBjdGxyKTsKPj4gKwlpZiAocmV0KQo+PiArCQln
b3RvIGVycl9wdXRfbWFzdGVyOwo+IC4uLnVucmVnaXN0ZXJpbmcgdGhlIGNvbnRyb2xsZXIgbWF5
IGZyZWUgdGhlIGRyaXZlciBkYXRhIHN0cnVjdHVyZSBhbmQKPiB0aGUgaW50ZXJydXB0IGhhbmRs
ZXIgdXNlcyBpdCBzbyB3ZSBjb3VsZCBhdHRlbXB0IHRvIHVzZSBmcmVlZCBkYXRhIGluCj4gdGhl
IHdpbmRvdyBiZXR3ZWVuIHRoZSBjb250cm9sbGVyIGJlaW5nIHVucmVnaXN0ZXJlZCBhbmQgdGhl
IGludGVycnVwdAo+IGJlaW5nIGZyZWVkLgoKClN1cmUuCgoKVGhhbmtzIGFuZCBiZXN0IHJlZ2Fy
ZHMhCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
