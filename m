Return-Path: <SRS0=N9+R=AW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEE1C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jul 2020 06:41:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399BE206F0
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jul 2020 06:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AkPXR5W0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 399BE206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VIs1+3xTkptfCAjFMlE1xgYusrNsdNTlFMjTk4jAmZQ=; b=AkPXR5W0vak2MHZ8EBprzKgQG
	CBKPuQfvLdYFljcqZrNVRk6yeb9+uBW9neOwzSg4SQ3O8JPZ0JoYKubtEmFKMBD5jboye5qA1pjkO
	63dtghcjvwhlaFoN1FSp6D3FSOEtvImXBrqWXSYZFIHdNvGxoTD2jGQBFpSMGF7i2+7f9OBI3N8sS
	SzsC6oLyfO4VIEW6SR1FVNzYko34Sa7WINAn0Gc0222PXWyT10xD/sfothx/wVTVBCQFDKJt7F0ui
	Mt7notthP/baphedCymFUdYuVmAMoNZ2KXq5j76fBpvJakPkG6O76esNNsawqRi76ul+F1Wx+qh8E
	E2rbfgdxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju98m-0000L7-Jw; Sat, 11 Jul 2020 06:37:40 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju98h-0000KX-UH
 for linux-mtd@lists.infradead.org; Sat, 11 Jul 2020 06:37:37 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9D5481A42142F8C833DA;
 Sat, 11 Jul 2020 14:37:25 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 11 Jul 2020 14:37:18 +0800
Subject: Re: [PATCH] ubifs: Fix a potential space leak problem while linking
 tmpfile
To: Richard Weinberger <richard@nod.at>
References: <20200701112643.726986-1-chengzhihao1@huawei.com>
 <CAFLxGvyO_aXGfgoO0mrNsoGP4Bfh3n6CUQxDx=ecH6o2ZDNYDg@mail.gmail.com>
 <082f18e0-d6f0-6389-43af-3159edb244cb@huawei.com>
 <1463101229.103384.1594123741187.JavaMail.zimbra@nod.at>
 <963fa5c8-414f-783f-871e-47e751b54d87@huawei.com>
 <1480699627.103583.1594126053947.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0c543297-d94f-ad40-7dd0-2198f39336bb@huawei.com>
Date: Sat, 11 Jul 2020 14:37:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1480699627.103583.1594126053947.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_023736_243877_C9649650 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvNy83IDIwOjQ3LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4+PiBQZXJoYXBzIEkgbWlzdW5kZXJzdG9vZCB3aGF0
IGNvbW1pdCAzMmZlOTA1YzE3ZjAwMSAoInViaWZzOiBGaXgKPj4+PiBPX1RNUEZJTEUgY29ybmVy
IGNhc2UgaW4gdWJpZnNfbGluaygpIikgd2FudGVkIHRvIGZpeC4KPj4+PiBJIHRoaW5rIG9ycGhh
biBhcmVhIGlzIHVzZWQgdG8gcmVtaW5kIGZpbGVzeXN0ZW0gZG9uJ3QgZm9yZ2V0IHRvIGRlbGV0
ZQo+Pj4+IGlub2RlcyAod2hvc2UgbmxpbmsgaXMgMCkgaW4gbmV4dCB1bmNsZWFuIHJlYm9vdGlu
Zy4gR2VuZXJhbGx5LCB0aGUgZmlsZQo+Pj4+IHN5c3RlbSBpcyBub3QgY29ycnVwdGVkIGNhdXNl
ZCBieSByZXBsYXlpbmcgb3JwaGFuIG5vZGVzLgo+Pj4+IFJhbHBoIHJlcG9ydGVkIGEgZmlsZXN5
c3RlbSBjb3JydXB0aW9uIGluIGNvbWJpbmF0aW9uIHdpdGggb3ZlcmxheWZzLgo+Pj4+IENhbiB5
b3UgdGVsbCBtZSB0aGUgZGV0YWlscyBhYm91dCB0aGF0IHByb2JsZW0/IFRoYW5rcy4KPj4+IE9u
IG15IHRlc3QgYmVkIEkgZGlkbid0IHNlZSBhIGZzIGNvcnJ1cHRpb24sIHdoYXQgSSBzYXcgd2Fz
IGEgZmFpbGluZyBvcnBoYW4KPj4+IHNlbGYgdGVzdCB3aGlsZSBwbGF5aW5nIHdpdGggT19UTVBG
SUxFIGFuZCBsaW5rYXQoKS4KPj4gRG8gd2UgaGF2ZSBhIHJlcHJvZHVjZXIsIG9yIGNhbiBJIGdl
dCB0aGUgZmFpbCB0ZXN0Y2FzZT8gSXMgaXQgYSB4ZnN0ZXN0Cj4+IGNhc2U/Cj4gSSB0aGluayB4
ZnN0ZXN0cyB0cmlnZ2VyZWQgaXQsIHllcy4KPiBMYXRlciB0b2RheSBJIGNhbiBjaGVjay4gOikK
Pgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPgo+IC4KCkkgdGhpbmsgSSBoYXZlIGZvdW5kIHRoZSB0
ZXN0Y2FzZXMsIG92ZXJsYXkvMDA2IGFuZCBvdmVybGF5LzA0MS4KClRoZSAnbXYnIGFuZCAncm0n
IG9wZXJhdGlvbnMgd2lsbCBwdXQgbG93ZXJ0ZXN0ZmlsZSBpbnRvIG9ycGhhbiBsaXN0IAp0d2lj
ZSwgc28gd2UgbXVzdCByZXNldmUgdGhlIG9ycGhhbiBkZWxldGlvbiBvcGVyYXRpb24gaW4gdWJp
ZnNfbGluaygpLCAKb3RoZXJ3aXNlIHRoZSB0ZXN0Y2FzZSBmYWlscyBhbmQgd2Ugd2lsbCBzZWUg
dGhlIGZvbGxvd2luZyBtc2c6CgogwqAgb3ZlcmxheS8wMDYgMnMgLi4uIC0gb3V0cHV0IG1pc21h
dGNoIChzZWUgCi9yb290L2dpdC94ZnN0ZXN0cy1kZXYvcmVzdWx0cy8vb3ZlcmxheS8wMDYub3V0
LmJhZCkKIMKgwqDCoCAtLS0gdGVzdHMvb3ZlcmxheS8wMDYub3V0wqDCoMKgIDIwMjAtMDctMDcg
MjE6NDI6NTcuNzM3MDAwMDAwICswODAwCiDCoMKgwqAgKysrIC9yb290L2dpdC94ZnN0ZXN0cy1k
ZXYvcmVzdWx0cy8vb3ZlcmxheS8wMDYub3V0LmJhZCAyMDIwLTA3LTExIAoxNDozMTo1NS4zNDAw
MDAwMDAgKzA4MDAKIMKgwqDCoCBAQCAtMSwyICsxLDQgQEAKIMKgwqDCoMKgIFFBIG91dHB1dCBj
cmVhdGVkIGJ5IDAwNgogwqDCoMKgwqAgU2lsZW5jZSBpcyBnb2xkZW4KIMKgwqDCoCArcm06IGNh
bm5vdCByZW1vdmUgCicvdG1wL3NjcmF0Y2gvb3ZsLW1udC91cHBlcnRlc3RkaXIvbG93ZXJ0ZXN0
ZmlsZSc6IEludmFsaWQgYXJndW1lbnQKIMKgwqDCoCArbG93ZXJ0ZXN0ZmlsZQogwqDCoMKgIC4u
LgoKIMKgIFvCoCAzODIuMjU4MjEwXSBVQklGUyBlcnJvciAodWJpMDoxIHBpZCAxMTg5Nik6IG9y
cGhhbl9hZGQgW3ViaWZzXTogCm9ycGhhbmVkIHR3aWNlCiDCoCBbwqAgMzgyLjM1MjUzNV0gVUJJ
RlMgZXJyb3IgKHViaTA6MSBwaWQgMTE5MzApOiBmcmVlX29ycGhhbnMgW3ViaWZzXTogCm9ycGhh
biBsaXN0IG5vdCBlbXB0eSBhdCB1bm1vdW50CgoKU28sIGhvdyBhYm91dCBtb3ZpbmcgdWJpZnNf
ZGVsZXRlX29ycGhhbigpIGFmdGVyIHViaWZzX2pubF91cGRhdGUoKSBpbiAKZnVuY3Rpb24gdWJp
ZnNfbGluaygpLiBGb2xsb3dpbmcgbW9kaWZpY2F0aW9ucyBhcHBsaWVkIGluIGxpbnV4LTUuOCBo
YXMgCmJlZW4gdGVzdGVkIGJ5IG92ZXJsYXkvMDQxLCBvdmVybGF5LzAwNiBhbmTCoCBvdGhlciB0
bXBmaWxlIGNhc2VzIAooZ2VuZXJpYy81MzEsIGdlbmVyaWMvNTMwLCBnZW5lcmljLzUwOSwgZ2Vu
ZXJpYy8zODksIGdlbmVyaWMvMDA0KS4KCmRpZmYgLS1naXQgYS9mcy91Ymlmcy9kaXIuYyBiL2Zz
L3ViaWZzL2Rpci5jCmluZGV4IGVmODVlYzE2N2E4NC4uZmQ0NDQzYTVlOGM2IDEwMDY0NAotLS0g
YS9mcy91Ymlmcy9kaXIuYworKysgYi9mcy91Ymlmcy9kaXIuYwpAQCAtNzIyLDExICs3MjIsNiBA
QCBzdGF0aWMgaW50IHViaWZzX2xpbmsoc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRyeSwgCnN0cnVj
dCBpbm9kZSAqZGlyLAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2Zu
YW1lOwoKIMKgwqDCoMKgwqDCoMKgIGxvY2tfMl9pbm9kZXMoZGlyLCBpbm9kZSk7Ci0KLcKgwqDC
oMKgwqDCoCAvKiBIYW5kbGUgT19UTVBGSUxFIGNvcm5lciBjYXNlLCBpdCBpcyBhbGxvd2VkIHRv
IGxpbmsgYSAKT19UTVBGSUxFLiAqLwotwqDCoMKgwqDCoMKgIGlmIChpbm9kZS0+aV9ubGluayA9
PSAwKQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Ymlmc19kZWxldGVfb3JwaGFuKGMs
IGlub2RlLT5pX2lubyk7Ci0KaW5jX25saW5rKGlub2RlKTsKaWhvbGQoaW5vZGUpOwogwqDCoMKg
wqDCoMKgwqAgaW5vZGUtPmlfY3RpbWUgPSBjdXJyZW50X3RpbWUoaW5vZGUpOwpAQCAtNzM2LDYg
KzczMSwxMSBAQCBzdGF0aWMgaW50IHViaWZzX2xpbmsoc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRy
eSwgCnN0cnVjdCBpbm9kZSAqZGlyLAogwqDCoMKgwqDCoMKgwqAgZXJyID0gdWJpZnNfam5sX3Vw
ZGF0ZShjLCBkaXIsICZubSwgaW5vZGUsIDAsIDApOwogwqDCoMKgwqDCoMKgwqAgaWYgKGVycikK
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9jYW5jZWw7CisKK8KgwqDC
oMKgwqDCoCAvKiBIYW5kbGUgT19UTVBGSUxFIGNvcm5lciBjYXNlLCBpdCBpcyBhbGxvd2VkIHRv
IGxpbmsgYSAKT19UTVBGSUxFLiAqLworwqDCoMKgwqDCoMKgIGlmIChpbm9kZS0+aV9ubGluayA9
PSAxKQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Ymlmc19kZWxldGVfb3JwaGFuKGMs
IGlub2RlLT5pX2lubyk7CisKIMKgwqDCoMKgwqDCoMKgIHVubG9ja18yX2lub2RlcyhkaXIsIGlu
b2RlKTsKCiDCoMKgwqDCoMKgwqDCoCB1Ymlmc19yZWxlYXNlX2J1ZGdldChjLCAmcmVxKTsKQEAg
LTc0Nyw4ICs3NDcsNiBAQCBzdGF0aWMgaW50IHViaWZzX2xpbmsoc3RydWN0IGRlbnRyeSAqb2xk
X2RlbnRyeSwgCnN0cnVjdCBpbm9kZSAqZGlyLAogwqDCoMKgwqDCoMKgwqAgZGlyLT5pX3NpemUg
LT0gc3pfY2hhbmdlOwogwqDCoMKgwqDCoMKgwqAgZGlyX3VpLT51aV9zaXplID0gZGlyLT5pX3Np
emU7CmRyb3BfbmxpbmsoaW5vZGUpOwotwqDCoMKgwqDCoMKgIGlmIChpbm9kZS0+aV9ubGluayA9
PSAwKQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Ymlmc19hZGRfb3JwaGFuKGMsIGlu
b2RlLT5pX2lubyk7CiDCoMKgwqDCoMKgwqDCoCB1bmxvY2tfMl9pbm9kZXMoZGlyLCBpbm9kZSk7
CiDCoMKgwqDCoMKgwqDCoCB1Ymlmc19yZWxlYXNlX2J1ZGdldChjLCAmcmVxKTsKaXB1dChpbm9k
ZSk7Ci0tCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
