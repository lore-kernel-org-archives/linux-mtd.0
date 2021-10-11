Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFE2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 19:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1D860F23
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 19:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC1D860F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IoSlwBRZ1WgGs2kqrRH8u0Qjb4DhnPDvrtRm4DWLxtc=; b=WOyozQ1beWyuktfmeuymlRZjDn
	5+v7qo0MAv0TVSy5lAoPwjcWJEZJ88b7Qoml5sk80jeIL8C6lHrs/UDlFKi/b2pr8rI7ceTAKpz2T
	aHXF6CQmyabJ/whLXAJK20am5QJBethmEu/uNWgXHlmCsR8JYk7XvN+N7pJQx/01WkPGmDPYLx9Bz
	O3Ua9+IpZeiFLRFgaoKBJMyFgDYq/QYXeMNbplaO0ZV2vweDaqozXyNf3Fk4snlDmH/ernUG466hM
	0jMoEPd8ZzMsUG+wtDvnTTdiXDsu49ClpyUzS0EthO/1CPZoR5XEEU8jGdIYsdi+/9WRzFQWcXM4V
	8NqocKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma0Zc-00ARU2-AD; Mon, 11 Oct 2021 19:02:56 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma0ZY-00ARSs-SK
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 19:02:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 51F6161B8F4A;
 Mon, 11 Oct 2021 21:02:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kENXB8xTCFAe; Mon, 11 Oct 2021 21:02:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9D2C961B8F55;
 Mon, 11 Oct 2021 21:02:46 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XdAswtCz58pi; Mon, 11 Oct 2021 21:02:46 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 65EBA61B8F4A;
 Mon, 11 Oct 2021 21:02:46 +0200 (CEST)
Date: Mon, 11 Oct 2021 21:02:46 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Kristof Havasi <havasiefr@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1041553131.62488.1633978966122.JavaMail.zimbra@nod.at>
In-Reply-To: <CADBnMviweAwc1oFz2-4KtGBAQb3hii1ZkJpZDELXY_CASpd53w@mail.gmail.com>
References: <CADBnMviweAwc1oFz2-4KtGBAQb3hii1ZkJpZDELXY_CASpd53w@mail.gmail.com>
Subject: Re: UBIFS panic during brown-out
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS panic during brown-out
Thread-Index: i7p1Y0mGoU/E6wvB9KxBMBQzxuhL1Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_120253_265273_549FC8B1 
X-CRM114-Status: GOOD (  19.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

S3Jpc3TDs2YsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiS3Jpc3Rv
ZiBIYXZhc2kiIDxoYXZhc2llZnJAZ21haWwuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRA
bm9kLmF0Pgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+
Cj4gR2VzZW5kZXQ6IE1vbnRhZywgMTEuIE9rdG9iZXIgMjAyMSAxOToxNjowMQo+IEJldHJlZmY6
IFVCSUZTIHBhbmljIGR1cmluZyBicm93bi1vdXQKCj4gRGVhciBSaWNoYXJkLAo+IAo+IHdlIGhh
dmUgYmVlbiBpbiBjb250YWN0IHJlZ2FyZGluZyBhbm90aGVyIChzaW1pbGFyKSBrZXJuZWwgcGFu
aWMgYSB5ZWFyIGFnbzoKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGlu
dXgtbXRkLzIwMjAtU2VwdGVtYmVyLzA4MjE3NS5odG1sCj4gCj4gTm93IHdlIGFyZSBzdHJlc3Mg
dGVzdGluZyBvdXIgYm9hcmQgZm9yIGJyb3duLW91dCBzdGFiaWxpdHksIGFuZCB3ZSBjYW4KPiBz
ZWUgcmVwcm9kdWNpYmxlIGZpbGUgc3lzdGVtIGNvcnJ1cHRpb25zLgo+IFRoZSBjdWxwcml0IHdh
cyBuYXJyb3dlZCBkb3duIHRvIGEgcGVuZGluZyBTUUxpdGUgb3BlcmF0aW9uIGR1cmluZyBicm93
bi1vdXQsCj4gaW4gdGhlIGJ1c2luZXNzLWxvZ2ljLgo+IAo+IEFzIGZhciBhcyBJIHVuZGVyc3Rv
b2QsIFVCSUZTIGlzIGV4dHJlbWVseSByb2J1c3QgaW4gc3VjaCBjYXNlcywgc28gSSB3b3VsZAo+
IGV4cGVjdCBhIGNvcnJ1cHRlZCBmaWxlIGFzIHRoZSB3b3JzdCBjYXNlIHNjZW5hcmlvLCBub3Qg
YW4gdW5ib290YWJsZSBzeXN0ZW0uCj4gCj4gQW0gSSB0b28gIm9wdGltaXN0aWMiIGFib3V0IFVC
SUZTJ3MgYnJvd24tb3V0IHN0YWJpbGl0eT8KCkEgYnJvd24tb3V0IGlzIHNvbWV0aGluZyB2ZXJ5
IGJhZC4gRWxlY3Ryb25pYyBjb21wb25lbnRzIHNob3cgdW5kZWZpbmVkIGJlaGF2aW9yCmluIHRo
aXMgcGhhc2UuIFVCSUZTIChhbmQgTGludXgpIGNhbiBub3RoaW5nIGRvIHRoZXJlLgpCdXQgYm90
aCBVQkkgYW5kIFVCSUZTIHRyeSB0byBiZSByb2J1c3QgYWdhaW5zdCBzdWRkZW4gcG93ZXIgbG9z
cyAocG93ZXItY3V0KS4KRS5nLiBhbiBpbnRlcnJ1cHRlZCBlcmFzZSBvciBwcm9ncmFtIG9wZXJh
dGlvbi4gCgpTbywgYXJlIHlvdSByZWFsbHkgdGFsa2luZyBhYm91dCBicm93bi1vdXQ/IElmIHNv
LCBiZXR0ZXIgdGFsayB0byB5b3UgaGFyZHdhcmUgZ3V5cy4KCj4gRG9lcyB0aGUgQXV0aCtFbmNy
eXB0aW9uIGNvbWJvIGluY3JlYXNlIHRoZSBjaGFuY2VzIGZvciBjb3JydXB0aW5nIHRoZSBGUwo+
IGR1cmluZyBicm93bi1vdXQsIGR1ZSB0byB0aGUgZXh0cmEgb3BlcmF0aW9ucz8KCkFzc3VtaW5n
IHlvdSBhY3R1YWxseSBtZWFudCBwb3dlci1jdXQuCkJvdGggZmVhdHVyZXMgYXJlIHJhdGhlciBu
ZXcsIHNvIHRoZXJlIGNhbiBiZSBzdGlsbCBidWdzLgogCj4gV291bGQgeW91IHN1Z2dlc3QgdHVy
bmluZyBvbiBhbnkgb2YgdGhlIGNoa18qIGtub2JzIGluIHRoZSBkZWJ1Z2ZzPwo+IEkgYW0gbm90
IHN1cmUgdGhhdCB0aGV5IGFyZSBoZWxwZnVsLCBvciB3aWxsIGp1c3QgbW9kaWZ5IHRoZSBiZWhh
dmlvdXIgb2YgdGhlCj4gdGltaW5ncyBvZiB0aGUgc3lzdGVtIHRvbyBtdWNoLgoKTGV0J3Mgc3Rh
cnQgd2l0aCBsb2dzIGZpcnN0LgogCj4gV291bGQgaXQgYmUgYSBsYXN0IHJlc29ydCBpbiBjYXNl
IHRoZSBicm93bi1vdXQgaXMgZGV0ZWN0ZWQgdG8gc3dpdGNoIHRoZSBGUwo+IGludG8gcm8gbW9k
ZT8gSXMgdGhlcmUgYW55IEFQSS9BQkkgYXBhcnQgZnJvbSB0aGUgZGVidWdmcydzIHJvX2Vycm9y
IGtub2IgdG8KPiBzd2l0Y2ggdGhlIEZTIGludG8gcmVhZC1vbmx5IG1vZGUgYW5kIHNvIHRyeWlu
ZyB0byBwcmV2ZW50IGZpbGUtc3lzdGVtCj4gY29ycnVwdGlvbj8KCk5vdCByZWFsbHkuIFlvdSBu
ZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBjdXJyZW50IE5BTkQgY29tbWFuZCBpcyBmaW5pc2hl
ZAphbmQgbm8gbmV3IG9uZSB3aWxsIGJlIHNjaGVkdWxlZC4gRGVwZW5kaW5nIG9uIHlvdXIgaGFy
ZHdhcmUgZGVzaWduIHRoaXMgY2FuCmJlIGEgY2hhbGxlbmdlLgoKPiBBbnkgcG9pbnRlcnMgYXJl
IHdlbGNvbWVkIQo+IAo+IFdlIGFyZSBvbiBLZXJuZWwgdjUuNC4xNTAKPiBXZSB1c2UgX2JvdGhf
IFVCSUZTIEF1dGhlbnRpY2F0aW9uIGFuZCBFbmNyeXB0aW9uLgo+IFRoZSBib2FyZCBpcyBhIFNB
TUE1RDMgcG93ZXJlZCBlbWJlZGRlZCBkZXZpY2Ugd2l0aCAxR0IgTkFORCBmbGFzaCwKPiB3aGlj
aCBpcyBub3QgZXZlbiBuZWFybHkgZnVsbCAoMTAlIHVzZWQpLgo+IAo+IEtlcm5lbCBwYW5pYyBh
ZnRlciB0aGUgbGFzdCBicm93bi1vdXQ6Cj4gdWJpMDogc2Nhbm5pbmcgaXMgZmluaXNoZWQKPiB1
YmkwOiBhdHRhY2hlZCBtdGQxIChuYW1lICJ1Yml2b2xzIiwgc2l6ZSAxMDIzIE1pQikKPiB1Ymkw
OiBQRUIgc2l6ZTogMjYyMTQ0IGJ5dGVzICgyNTYgS2lCKSwgTEVCIHNpemU6IDI1Mzk1MiBieXRl
cwo+IHViaTA6IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczogNDA5Ni80MDk2LCBzdWItcGFnZSBz
aXplIDQwOTYKPiB1YmkwOiBWSUQgaGVhZGVyIG9mZnNldDogNDA5NiAoYWxpZ25lZCA0MDk2KSwg
ZGF0YSBvZmZzZXQ6IDgxOTIKPiB1YmkwOiBnb29kIFBFQnM6IDQwODIsIGJhZCBQRUJzOiAxMywg
Y29ycnVwdGVkIFBFQnM6IDAKPiB1YmkwOiB1c2VyIHZvbHVtZTogNSwgaW50ZXJuYWwgdm9sdW1l
czogMSwgbWF4LiB2b2x1bWVzIGNvdW50OiAxMjgKPiB1YmkwOiBtYXgvbWVhbiBlcmFzZSBjb3Vu
dGVyOiAxMTgvMTEsIFdMIHRocmVzaG9sZDogNDA5NiwgaW1hZ2UKPiBzZXF1ZW5jZSBudW1iZXI6
IDkyMTM2MTIzNQo+PnViaTA6IGF2YWlsYWJsZSBQRUJzOiAwLCB0b3RhbCByZXNlcnZlZCBQRUJz
OiA0MDgyLCBQRUJzIHJlc2VydmVkIGZvciBiYWQgUEVCCj4+aGFuZGxpbmc6IDY3Cj4gdWJpMDog
YmFja2dyb3VuZCB0aHJlYWQgInViaV9iZ3QwZCIgc3RhcnRlZCwgUElEIDYxNwo+IFVCSUZTICh1
YmkwOjQpOiBNb3VudGluZyBpbiBhdXRoZW50aWNhdGVkIG1vZGUKPiBVQklGUyAodWJpMDo0KTog
cmVjb3ZlcnkgbmVlZGVkCj4+VkZTOiBDYW5ub3Qgb3BlbiByb290IGRldmljZSAidWJpMDpyb290
ZnMiIG9yIHViaTA6cm9vdGZzOiBlcnJvciAtMQoKVGhlcmUgaXMgYSBsb3Qgb2YgY29udGV4dCBt
aXNzaW5nLiBDYW4geW91IHBsZWFzZSBzaGFyZSB0aGUgZnVsbCBsb2dzPwpVc3VhbGx5IFVCSUZT
IHByaW50cyBpbiBkZXRhaWwgd2hhdCB3ZW50IHdyb25nLgoKPiBQbGVhc2UgYXBwZW5kIGEgY29y
cmVjdCAicm9vdD0iIGJvb3Qgb3B0aW9uOyBoZXJlIGFyZSB0aGUgYXZhaWxhYmxlIHBhcnRpdGlv
bnM6Cj4gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50IHJv
b3QgZnMgb24gdWJpMDpyb290ZnMKPiBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIgTm90IHRh
aW50ZWQgNS40LjEwOS0wMDAzMy1nYTg4OTQzYzFlNjggIzEKCjUuNCBpcyBub3QgZnJlc2guIENh
biB5b3UgdXNlIGEgbW9yZSByZWNlbnQga2VybmVsPwoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
