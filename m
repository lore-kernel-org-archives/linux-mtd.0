Return-Path: <SRS0=N9+R=AW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EB7C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jul 2020 06:45:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B591B206F0
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jul 2020 06:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y4+AZAIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B591B206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C0QuhGDXhHUh9hX09nvS5uqlFR46PFREJOiqo1w71qM=; b=Y4+AZAIenfGXVmJipqTK1p1la
	2X2H5Kj6pMA/BY4x7QDU8NpqEmeYLw70WMwIhxvtwMJNraQsh2kf73tu5v42OTtGSgoxK0KhaAwh6
	jNjJrsZ4raJWT2EZflKsXFPN4lU8VCHIHrRTCFxMZyfn7k1bbYlSaszg0+MpS8PbtDUSYIBj9Fc/Q
	BibDHzcdZiQiXVI3LK4jF5WgIRcKfaz5ZkHXAzzFPqzGkM1wJrpOvnnMgRcgCz7Jwi2z/rHVCr4rS
	zg3Or7bJxGLfzHMgW23OHnURRKVH/fKyXTz97rfHUMxOgHTIR0Ra1vNOPPdl++hSAGD/aCH9ux9GU
	zM5Jv+zTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju9G5-0000fu-7j; Sat, 11 Jul 2020 06:45:13 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju9G2-0000fJ-6A
 for linux-mtd@lists.infradead.org; Sat, 11 Jul 2020 06:45:11 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2F1755B6A57830D19173;
 Sat, 11 Jul 2020 14:45:04 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 11 Jul 2020 14:44:53 +0800
Subject: Re: [PATCH] ubifs: Fix a potential space leak problem while linking
 tmpfile
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Richard Weinberger <richard@nod.at>
References: <20200701112643.726986-1-chengzhihao1@huawei.com>
 <CAFLxGvyO_aXGfgoO0mrNsoGP4Bfh3n6CUQxDx=ecH6o2ZDNYDg@mail.gmail.com>
 <082f18e0-d6f0-6389-43af-3159edb244cb@huawei.com>
 <1463101229.103384.1594123741187.JavaMail.zimbra@nod.at>
 <963fa5c8-414f-783f-871e-47e751b54d87@huawei.com>
 <1480699627.103583.1594126053947.JavaMail.zimbra@nod.at>
 <0c543297-d94f-ad40-7dd0-2198f39336bb@huawei.com>
Message-ID: <a3421498-e3a5-f7dc-50c6-15ef3cdfb51b@huawei.com>
Date: Sat, 11 Jul 2020 14:44:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0c543297-d94f-ad40-7dd0-2198f39336bb@huawei.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_024510_545481_9CA6617B 
X-CRM114-Status: GOOD (  18.49  )
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

5ZyoIDIwMjAvNy8xMSAxNDozNywgWmhpaGFvIENoZW5nIOWGmemBkzoKPiDlnKggMjAyMC83Lzcg
MjA6NDcsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4+IC0tLS0tIFVyc3Byw7xuZ2xpY2hl
IE1haWwgLS0tLS0KPj4+Pj4gUGVyaGFwcyBJIG1pc3VuZGVyc3Rvb2Qgd2hhdCBjb21taXQgMzJm
ZTkwNWMxN2YwMDEgKCJ1YmlmczogRml4Cj4+Pj4+IE9fVE1QRklMRSBjb3JuZXIgY2FzZSBpbiB1
Ymlmc19saW5rKCkiKSB3YW50ZWQgdG8gZml4Lgo+Pj4+PiBJIHRoaW5rIG9ycGhhbiBhcmVhIGlz
IHVzZWQgdG8gcmVtaW5kIGZpbGVzeXN0ZW0gZG9uJ3QgZm9yZ2V0IHRvIAo+Pj4+PiBkZWxldGUK
Pj4+Pj4gaW5vZGVzICh3aG9zZSBubGluayBpcyAwKSBpbiBuZXh0IHVuY2xlYW4gcmVib290aW5n
LiBHZW5lcmFsbHksIAo+Pj4+PiB0aGUgZmlsZQo+Pj4+PiBzeXN0ZW0gaXMgbm90IGNvcnJ1cHRl
ZCBjYXVzZWQgYnkgcmVwbGF5aW5nIG9ycGhhbiBub2Rlcy4KPj4+Pj4gUmFscGggcmVwb3J0ZWQg
YSBmaWxlc3lzdGVtIGNvcnJ1cHRpb24gaW4gY29tYmluYXRpb24gd2l0aCBvdmVybGF5ZnMuCj4+
Pj4+IENhbiB5b3UgdGVsbCBtZSB0aGUgZGV0YWlscyBhYm91dCB0aGF0IHByb2JsZW0/IFRoYW5r
cy4KPj4+PiBPbiBteSB0ZXN0IGJlZCBJIGRpZG4ndCBzZWUgYSBmcyBjb3JydXB0aW9uLCB3aGF0
IEkgc2F3IHdhcyBhIAo+Pj4+IGZhaWxpbmcgb3JwaGFuCj4+Pj4gc2VsZiB0ZXN0IHdoaWxlIHBs
YXlpbmcgd2l0aCBPX1RNUEZJTEUgYW5kIGxpbmthdCgpLgo+Pj4gRG8gd2UgaGF2ZSBhIHJlcHJv
ZHVjZXIsIG9yIGNhbiBJIGdldCB0aGUgZmFpbCB0ZXN0Y2FzZT8gSXMgaXQgYSAKPj4+IHhmc3Rl
c3QKPj4+IGNhc2U/Cj4+IEkgdGhpbmsgeGZzdGVzdHMgdHJpZ2dlcmVkIGl0LCB5ZXMuCj4+IExh
dGVyIHRvZGF5IEkgY2FuIGNoZWNrLiA6KQo+Pgo+PiBUaGFua3MsCj4+IC8vcmljaGFyZAo+Pgo+
PiAuCj4KPiBJIHRoaW5rIEkgaGF2ZSBmb3VuZCB0aGUgdGVzdGNhc2VzLCBvdmVybGF5LzAwNiBh
bmQgb3ZlcmxheS8wNDEuCj4KPiBUaGUgJ212JyBhbmQgJ3JtJyBvcGVyYXRpb25zIHdpbGwgcHV0
IGxvd2VydGVzdGZpbGUgaW50byBvcnBoYW4gbGlzdCAKPiB0d2ljZSwgc28gd2UgbXVzdCByZXNl
dmUgdGhlIG9ycGhhbiBkZWxldGlvbiBvcGVyYXRpb24gaW4gCj4gdWJpZnNfbGluaygpLCBvdGhl
cndpc2UgdGhlIHRlc3RjYXNlIGZhaWxzIGFuZCB3ZSB3aWxsIHNlZSB0aGUgCj4gZm9sbG93aW5n
IG1zZzoKPgo+IMKgIG92ZXJsYXkvMDA2IDJzIC4uLiAtIG91dHB1dCBtaXNtYXRjaCAoc2VlIAo+
IC9yb290L2dpdC94ZnN0ZXN0cy1kZXYvcmVzdWx0cy8vb3ZlcmxheS8wMDYub3V0LmJhZCkKPiDC
oMKgwqAgLS0tIHRlc3RzL292ZXJsYXkvMDA2Lm91dMKgwqDCoCAyMDIwLTA3LTA3IDIxOjQyOjU3
LjczNzAwMDAwMCArMDgwMAo+IMKgwqDCoCArKysgL3Jvb3QvZ2l0L3hmc3Rlc3RzLWRldi9yZXN1
bHRzLy9vdmVybGF5LzAwNi5vdXQuYmFkIDIwMjAtMDctMTEgCj4gMTQ6MzE6NTUuMzQwMDAwMDAw
ICswODAwCj4gwqDCoMKgIEBAIC0xLDIgKzEsNCBAQAo+IMKgwqDCoMKgIFFBIG91dHB1dCBjcmVh
dGVkIGJ5IDAwNgo+IMKgwqDCoMKgIFNpbGVuY2UgaXMgZ29sZGVuCj4gwqDCoMKgICtybTogY2Fu
bm90IHJlbW92ZSAKPiAnL3RtcC9zY3JhdGNoL292bC1tbnQvdXBwZXJ0ZXN0ZGlyL2xvd2VydGVz
dGZpbGUnOiBJbnZhbGlkIGFyZ3VtZW50Cj4gwqDCoMKgICtsb3dlcnRlc3RmaWxlCj4gwqDCoMKg
IC4uLgo+Cj4gwqAgW8KgIDM4Mi4yNTgyMTBdIFVCSUZTIGVycm9yICh1YmkwOjEgcGlkIDExODk2
KTogb3JwaGFuX2FkZCBbdWJpZnNdOiAKPiBvcnBoYW5lZCB0d2ljZQo+IMKgIFvCoCAzODIuMzUy
NTM1XSBVQklGUyBlcnJvciAodWJpMDoxIHBpZCAxMTkzMCk6IGZyZWVfb3JwaGFucyBbdWJpZnNd
OiAKPiBvcnBoYW4gbGlzdCBub3QgZW1wdHkgYXQgdW5tb3VudAo+Cj4KPiBTbywgaG93IGFib3V0
IG1vdmluZyB1Ymlmc19kZWxldGVfb3JwaGFuKCkgYWZ0ZXIgdWJpZnNfam5sX3VwZGF0ZSgpIGlu
IAo+IGZ1bmN0aW9uIHViaWZzX2xpbmsoKS4gRm9sbG93aW5nIG1vZGlmaWNhdGlvbnMgYXBwbGll
ZCBpbiBsaW51eC01LjggCj4gaGFzIGJlZW4gdGVzdGVkIGJ5IG92ZXJsYXkvMDQxLCBvdmVybGF5
LzAwNiBhbmTCoCBvdGhlciB0bXBmaWxlIGNhc2VzIAo+IChnZW5lcmljLzUzMSwgZ2VuZXJpYy81
MzAsIGdlbmVyaWMvNTA5LCBnZW5lcmljLzM4OSwgZ2VuZXJpYy8wMDQpLgo+ClJlc3VsdHMgZm9y
IHRlc3RjYXNlcyBnZW5lcmljLzUzMCwgZ2VuZXJpYy81MDksIGdlbmVyaWMvMzg5IGFuZCAKZ2Vu
ZXJpYy8wMDQgYXJlIHN0aWxsICJub3QgcnVuIi4KPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZGly
LmMgYi9mcy91Ymlmcy9kaXIuYwo+IGluZGV4IGVmODVlYzE2N2E4NC4uZmQ0NDQzYTVlOGM2IDEw
MDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2Rpci5jCj4gKysrIGIvZnMvdWJpZnMvZGlyLmMKPiBAQCAt
NzIyLDExICs3MjIsNiBAQCBzdGF0aWMgaW50IHViaWZzX2xpbmsoc3RydWN0IGRlbnRyeSAqb2xk
X2RlbnRyeSwgCj4gc3RydWN0IGlub2RlICpkaXIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gb3V0X2ZuYW1lOwo+Cj4gwqDCoMKgwqDCoMKgwqAgbG9ja18yX2lub2Rlcyhk
aXIsIGlub2RlKTsKPiAtCj4gLcKgwqDCoMKgwqDCoCAvKiBIYW5kbGUgT19UTVBGSUxFIGNvcm5l
ciBjYXNlLCBpdCBpcyBhbGxvd2VkIHRvIGxpbmsgYSAKPiBPX1RNUEZJTEUuICovCj4gLcKgwqDC
oMKgwqDCoCBpZiAoaW5vZGUtPmlfbmxpbmsgPT0gMCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1Ymlmc19kZWxldGVfb3JwaGFuKGMsIGlub2RlLT5pX2lubyk7Cj4gLQo+IGluY19u
bGluayhpbm9kZSk7Cj4gaWhvbGQoaW5vZGUpOwo+IMKgwqDCoMKgwqDCoMKgIGlub2RlLT5pX2N0
aW1lID0gY3VycmVudF90aW1lKGlub2RlKTsKPiBAQCAtNzM2LDYgKzczMSwxMSBAQCBzdGF0aWMg
aW50IHViaWZzX2xpbmsoc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRyeSwgCj4gc3RydWN0IGlub2Rl
ICpkaXIsCj4gwqDCoMKgwqDCoMKgwqAgZXJyID0gdWJpZnNfam5sX3VwZGF0ZShjLCBkaXIsICZu
bSwgaW5vZGUsIDAsIDApOwo+IMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2NhbmNlbDsKPiArCj4gK8KgwqDCoMKgwqDCoCAv
KiBIYW5kbGUgT19UTVBGSUxFIGNvcm5lciBjYXNlLCBpdCBpcyBhbGxvd2VkIHRvIGxpbmsgYSAK
PiBPX1RNUEZJTEUuICovCj4gK8KgwqDCoMKgwqDCoCBpZiAoaW5vZGUtPmlfbmxpbmsgPT0gMSkK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Ymlmc19kZWxldGVfb3JwaGFuKGMsIGlu
b2RlLT5pX2lubyk7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgIHVubG9ja18yX2lub2RlcyhkaXIsIGlu
b2RlKTsKPgo+IMKgwqDCoMKgwqDCoMKgIHViaWZzX3JlbGVhc2VfYnVkZ2V0KGMsICZyZXEpOwo+
IEBAIC03NDcsOCArNzQ3LDYgQEAgc3RhdGljIGludCB1Ymlmc19saW5rKHN0cnVjdCBkZW50cnkg
Km9sZF9kZW50cnksIAo+IHN0cnVjdCBpbm9kZSAqZGlyLAo+IMKgwqDCoMKgwqDCoMKgIGRpci0+
aV9zaXplIC09IHN6X2NoYW5nZTsKPiDCoMKgwqDCoMKgwqDCoCBkaXJfdWktPnVpX3NpemUgPSBk
aXItPmlfc2l6ZTsKPiBkcm9wX25saW5rKGlub2RlKTsKPiAtwqDCoMKgwqDCoMKgIGlmIChpbm9k
ZS0+aV9ubGluayA9PSAwKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHViaWZzX2Fk
ZF9vcnBoYW4oYywgaW5vZGUtPmlfaW5vKTsKPiDCoMKgwqDCoMKgwqDCoCB1bmxvY2tfMl9pbm9k
ZXMoZGlyLCBpbm9kZSk7Cj4gwqDCoMKgwqDCoMKgwqAgdWJpZnNfcmVsZWFzZV9idWRnZXQoYywg
JnJlcSk7Cj4gaXB1dChpbm9kZSk7Cj4gLS0gCj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
