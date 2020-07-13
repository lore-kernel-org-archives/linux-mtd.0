Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C682FC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 03:31:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94105206E2
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 03:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ja8wZSRa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94105206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J4h2LyG8wt3tsGAglBFRmEFDBYz6GHjlgvgVnDv+0DU=; b=Ja8wZSRaIs184saRva9GmJzZR
	qsAqiff48JuBCypHA3cgsjTxLqXXBcOn712Voj4TeVpWUWJmA0OtpKjEfiyPU6YVXHe45WX01zHJ0
	C0mxPGA0WFNpM+7P350ww3A9DWP6L9nDmixcHxqalgcHxD0P8/kRIkw5cZ8WY8RmYoSwMhGIul3fL
	knEzWM/0U98FKU38fo+NUMgthMZDTLv1+eqz7WJPMgo0qYGgJErefg5lbb0pstT6peLDnwAa3IkVP
	E1bpdCl3hT9XqxDB4lf+O1Rs7LH0jCPCqU/H05mBQrMbLV61S2POPp6lS/BtecS5ZurcwHb9KZAaM
	Ph1pq9zRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jupAi-00043v-Gq; Mon, 13 Jul 2020 03:30:28 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jupAe-000423-HV
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2020 03:30:26 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C03845CF625A9997552B;
 Mon, 13 Jul 2020 11:30:17 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0;
 Mon, 13 Jul 2020 11:30:10 +0800
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
Message-ID: <4b59ffcc-fbbb-e62e-779b-ce4d795f51c7@huawei.com>
Date: Mon, 13 Jul 2020 11:30:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0c543297-d94f-ad40-7dd0-2198f39336bb@huawei.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_233025_365658_64F77D5B 
X-CRM114-Status: GOOD (  19.78  )
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
IG1zZzoKU29ycnksIG5vdCBsb3dlcnRlc3RmaWxlLCBpdCdzIHRlbXBmaWxlIHdoaWNoIGlzIGdl
bmVyYXRlZCBieSBvdmwgCmNvcHktdXAgKG12IG9wZXJhdGlvbikuIFRoZSB0ZW1wZmlsZSBpcyBs
aW5rZWQgYWZ0ZXIgY29weS11cCBmaW5pc2hlZC4gClRoZSB0ZW1wZmlsZSBpcyB0aGVuIHVubGlu
a2VkIGJ5ICdybScgb3BlcmF0aW9uLgo+Cj4gwqAgb3ZlcmxheS8wMDYgMnMgLi4uIC0gb3V0cHV0
IG1pc21hdGNoIChzZWUgCj4gL3Jvb3QvZ2l0L3hmc3Rlc3RzLWRldi9yZXN1bHRzLy9vdmVybGF5
LzAwNi5vdXQuYmFkKQo+IMKgwqDCoCAtLS0gdGVzdHMvb3ZlcmxheS8wMDYub3V0wqDCoMKgIDIw
MjAtMDctMDcgMjE6NDI6NTcuNzM3MDAwMDAwICswODAwCj4gwqDCoMKgICsrKyAvcm9vdC9naXQv
eGZzdGVzdHMtZGV2L3Jlc3VsdHMvL292ZXJsYXkvMDA2Lm91dC5iYWQgMjAyMC0wNy0xMSAKPiAx
NDozMTo1NS4zNDAwMDAwMDAgKzA4MDAKPiDCoMKgwqAgQEAgLTEsMiArMSw0IEBACj4gwqDCoMKg
wqAgUUEgb3V0cHV0IGNyZWF0ZWQgYnkgMDA2Cj4gwqDCoMKgwqAgU2lsZW5jZSBpcyBnb2xkZW4K
PiDCoMKgwqAgK3JtOiBjYW5ub3QgcmVtb3ZlIAo+ICcvdG1wL3NjcmF0Y2gvb3ZsLW1udC91cHBl
cnRlc3RkaXIvbG93ZXJ0ZXN0ZmlsZSc6IEludmFsaWQgYXJndW1lbnQKPiDCoMKgwqAgK2xvd2Vy
dGVzdGZpbGUKPiDCoMKgwqAgLi4uCj4KPiDCoCBbwqAgMzgyLjI1ODIxMF0gVUJJRlMgZXJyb3Ig
KHViaTA6MSBwaWQgMTE4OTYpOiBvcnBoYW5fYWRkIFt1Ymlmc106IAo+IG9ycGhhbmVkIHR3aWNl
Cj4gwqAgW8KgIDM4Mi4zNTI1MzVdIFVCSUZTIGVycm9yICh1YmkwOjEgcGlkIDExOTMwKTogZnJl
ZV9vcnBoYW5zIFt1Ymlmc106IAo+IG9ycGhhbiBsaXN0IG5vdCBlbXB0eSBhdCB1bm1vdW50Cj4K
Pgo+IFNvLCBob3cgYWJvdXQgbW92aW5nIHViaWZzX2RlbGV0ZV9vcnBoYW4oKSBhZnRlciB1Ymlm
c19qbmxfdXBkYXRlKCkgaW4gCj4gZnVuY3Rpb24gdWJpZnNfbGluaygpLiBGb2xsb3dpbmcgbW9k
aWZpY2F0aW9ucyBhcHBsaWVkIGluIGxpbnV4LTUuOCAKPiBoYXMgYmVlbiB0ZXN0ZWQgYnkgb3Zl
cmxheS8wNDEsIG92ZXJsYXkvMDA2IGFuZMKgIG90aGVyIHRtcGZpbGUgY2FzZXMgCj4gKGdlbmVy
aWMvNTMxLCBnZW5lcmljLzUzMCwgZ2VuZXJpYy81MDksIGdlbmVyaWMvMzg5LCBnZW5lcmljLzAw
NCkuCj4KPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+IGlu
ZGV4IGVmODVlYzE2N2E4NC4uZmQ0NDQzYTVlOGM2IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2Rp
ci5jCj4gKysrIGIvZnMvdWJpZnMvZGlyLmMKPiBAQCAtNzIyLDExICs3MjIsNiBAQCBzdGF0aWMg
aW50IHViaWZzX2xpbmsoc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRyeSwgCj4gc3RydWN0IGlub2Rl
ICpkaXIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2ZuYW1lOwo+
Cj4gwqDCoMKgwqDCoMKgwqAgbG9ja18yX2lub2RlcyhkaXIsIGlub2RlKTsKPiAtCj4gLcKgwqDC
oMKgwqDCoCAvKiBIYW5kbGUgT19UTVBGSUxFIGNvcm5lciBjYXNlLCBpdCBpcyBhbGxvd2VkIHRv
IGxpbmsgYSAKPiBPX1RNUEZJTEUuICovCj4gLcKgwqDCoMKgwqDCoCBpZiAoaW5vZGUtPmlfbmxp
bmsgPT0gMCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Ymlmc19kZWxldGVfb3Jw
aGFuKGMsIGlub2RlLT5pX2lubyk7Cj4gLQo+IGluY19ubGluayhpbm9kZSk7Cj4gaWhvbGQoaW5v
ZGUpOwo+IMKgwqDCoMKgwqDCoMKgIGlub2RlLT5pX2N0aW1lID0gY3VycmVudF90aW1lKGlub2Rl
KTsKPiBAQCAtNzM2LDYgKzczMSwxMSBAQCBzdGF0aWMgaW50IHViaWZzX2xpbmsoc3RydWN0IGRl
bnRyeSAqb2xkX2RlbnRyeSwgCj4gc3RydWN0IGlub2RlICpkaXIsCj4gwqDCoMKgwqDCoMKgwqAg
ZXJyID0gdWJpZnNfam5sX3VwZGF0ZShjLCBkaXIsICZubSwgaW5vZGUsIDAsIDApOwo+IMKgwqDC
oMKgwqDCoMKgIGlmIChlcnIpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
b3V0X2NhbmNlbDsKPiArCj4gK8KgwqDCoMKgwqDCoCAvKiBIYW5kbGUgT19UTVBGSUxFIGNvcm5l
ciBjYXNlLCBpdCBpcyBhbGxvd2VkIHRvIGxpbmsgYSAKPiBPX1RNUEZJTEUuICovCj4gK8KgwqDC
oMKgwqDCoCBpZiAoaW5vZGUtPmlfbmxpbmsgPT0gMSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1Ymlmc19kZWxldGVfb3JwaGFuKGMsIGlub2RlLT5pX2lubyk7Cj4gKwo+IMKgwqDC
oMKgwqDCoMKgIHVubG9ja18yX2lub2RlcyhkaXIsIGlub2RlKTsKPgo+IMKgwqDCoMKgwqDCoMKg
IHViaWZzX3JlbGVhc2VfYnVkZ2V0KGMsICZyZXEpOwo+IEBAIC03NDcsOCArNzQ3LDYgQEAgc3Rh
dGljIGludCB1Ymlmc19saW5rKHN0cnVjdCBkZW50cnkgKm9sZF9kZW50cnksIAo+IHN0cnVjdCBp
bm9kZSAqZGlyLAo+IMKgwqDCoMKgwqDCoMKgIGRpci0+aV9zaXplIC09IHN6X2NoYW5nZTsKPiDC
oMKgwqDCoMKgwqDCoCBkaXJfdWktPnVpX3NpemUgPSBkaXItPmlfc2l6ZTsKPiBkcm9wX25saW5r
KGlub2RlKTsKPiAtwqDCoMKgwqDCoMKgIGlmIChpbm9kZS0+aV9ubGluayA9PSAwKQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHViaWZzX2FkZF9vcnBoYW4oYywgaW5vZGUtPmlfaW5v
KTsKPiDCoMKgwqDCoMKgwqDCoCB1bmxvY2tfMl9pbm9kZXMoZGlyLCBpbm9kZSk7Cj4gwqDCoMKg
wqDCoMKgwqAgdWJpZnNfcmVsZWFzZV9idWRnZXQoYywgJnJlcSk7Cj4gaXB1dChpbm9kZSk7Cj4g
LS0gCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
