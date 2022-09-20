Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17624C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 19:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/B0DL/Rvnef6yedUNDqYa3kWNpl2hCcSrENBE5v/sfw=; b=HX2SC7xEvnQWiFQSQT6Fw6d0pF
	x58UBad/RfAglzOxZCxyG3bcZO2J1RerSUV16PLGMRVp14v31OlFXUbYT3t+97Zg6rKcUv5+b/GE1
	yVF4QL6XW44pH/nwPLmupzkt3vf2LNnMpbspdvJL5FAns9zSwIrabnPadQSgqNGPl5ZI6QSRv1S3m
	kEabIT2mYAK5xGUSfy+lxXXKUWAGa5Joj1vvBBeH8PBM717xTjb7/6VnHGryW30Ya49CrXdBhAz3q
	6p4jwn1LUMWDvCbxXgTExaT5PDsdpJNNHxdr3LEGHx1E0wqDfUvgFQmfJDNyoLfKVVa+Xn7xd37DP
	u/5A2PGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaifE-005x1c-2b; Tue, 20 Sep 2022 19:12:12 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaifA-005wy0-Cv
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 19:12:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2ACD563BBD4B;
	Tue, 20 Sep 2022 21:11:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Sucjpe0Cfkhy; Tue, 20 Sep 2022 21:11:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 664E763BBD41;
	Tue, 20 Sep 2022 21:11:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8wHuVCEmh8N2; Tue, 20 Sep 2022 21:11:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3BC2C63BBD38;
	Tue, 20 Sep 2022 21:11:54 +0200 (CEST)
Date: Tue, 20 Sep 2022 21:11:54 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <955252833.244763.1663701114159.JavaMail.zimbra@nod.at>
In-Reply-To: <20220629125737.14418-5-kernel@kempniu.pl>
References: <20220629125737.14418-1-kernel@kempniu.pl> <20220629125737.14418-5-kernel@kempniu.pl>
Subject: Re: [PATCH v4 4/4] mtdchar: add MEMREAD ioctl
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdchar: add MEMREAD ioctl
Thread-Index: x3jbmUpbWewkvCtv3NAUFhw8zSthgg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_121208_781035_219F01FF 
X-CRM114-Status: GOOD (  23.02  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pY2hhxYIgS8SZcGllxYQi
IDxrZXJuZWxAa2VtcG5pdS5wbD4KPiBBbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hh
dmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPgo+IENDOiAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMu
YnJlemlsbG9uQGNvbGxhYm9yYS5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIgo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgMjkuIEp1bmkgMjAyMiAxNDo1NzozNwo+IEJldHJl
ZmY6IFtQQVRDSCB2NCA0LzRdIG10ZGNoYXI6IGFkZCBNRU1SRUFEIGlvY3RsCgo+IFVzZXItc3Bh
Y2UgYXBwbGljYXRpb25zIG1ha2luZyB1c2Ugb2YgTVREIGRldmljZXMgdmlhIC9kZXYvbXRkKgo+
IGNoYXJhY3RlciBkZXZpY2VzIGN1cnJlbnRseSBoYXZlIGxpbWl0ZWQgY2FwYWJpbGl0aWVzIGZv
ciByZWFkaW5nIGRhdGE6Cj4gCj4gIC0gb25seSBkZXByZWNhdGVkIG1ldGhvZHMgb2YgYWNjZXNz
aW5nIE9PQiBsYXlvdXQgaW5mb3JtYXRpb24gZXhpc3QsCj4gCj4gIC0gdGhlcmUgaXMgbm8gd2F5
IHRvIGV4cGxpY2l0bHkgc3BlY2lmeSBNVEQgb3BlcmF0aW9uIG1vZGUgdG8gdXNlOyBpdAo+ICAg
IGlzIGF1dG8tc2VsZWN0ZWQgYmFzZWQgb24gdGhlIE1URCBmaWxlIG1vZGUgKE1URF9GSUxFX01P
REVfKikgc2V0Cj4gICAgZm9yIHRoZSBjaGFyYWN0ZXIgZGV2aWNlOyBpbiBwYXJ0aWN1bGFyLCB0
aGlzIHByZXZlbnRzIHVzaW5nCj4gICAgTVREX09QU19BVVRPX09PQiBmb3IgcmVhZHMsCj4gCj4g
IC0gYWxsIGV4aXN0aW5nIHVzZXItc3BhY2UgaW50ZXJmYWNlcyB3aGljaCBjYXVzZSBtdGRfcmVh
ZCgpIG9yCj4gICAgbXRkX3JlYWRfb29iKCkgdG8gYmUgY2FsbGVkICh2aWEgbXRkY2hhcl9yZWFk
KCkgYW5kCj4gICAgbXRkY2hhcl9yZWFkX29vYigpLCByZXNwZWN0aXZlbHkpIHJldHVybiBzdWNj
ZXNzIGV2ZW4gd2hlbiB0aG9zZQo+ICAgIGZ1bmN0aW9ucyByZXR1cm4gLUVVQ0xFQU4gb3IgLUVC
QURNU0c7IHRoaXMgcmVuZGVycyB1c2VyLXNwYWNlCj4gICAgYXBwbGljYXRpb25zIHVzaW5nIHRo
ZXNlIGludGVyZmFjZXMgdW5hd2FyZSBvZiBhbnkgY29ycmVjdGVkCj4gICAgYml0ZmxpcHMgb3Ig
dW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3JzIGRldGVjdGVkIGR1cmluZyByZWFkcy4KPiAKPiBOb3Rl
IHRoYXQgdGhlIGV4aXN0aW5nIE1FTVdSSVRFIGlvY3RsIGFsbG93cyB0aGUgTVREIG9wZXJhdGlv
biBtb2RlIHRvCj4gYmUgZXhwbGljaXRseSBzZXQsIGFsbG93aW5nIHVzZXItc3BhY2UgYXBwbGlj
YXRpb25zIHRvIHdyaXRlIHBhZ2UgZGF0YQo+IGFuZCBPT0IgZGF0YSB3aXRob3V0IHJlcXVpcmlu
ZyB0aGVtIHRvIGtub3cgYW55dGhpbmcgYWJvdXQgdGhlIE9PQgo+IGxheW91dCBvZiB0aGUgTVRE
IGRldmljZSB0aGV5IGFyZSB3cml0aW5nIHRvIChNVERfT1BTX0FVVE9fT09CKS4gIEFsc28sCj4g
dGhlIE1FTVdSSVRFIGlvY3RsIGRvZXMgbm90IG1hbmdsZSB0aGUgcmV0dXJuIHZhbHVlIG9mIG10
ZF93cml0ZV9vb2IoKS4KPiAKPiBBZGQgYSBuZXcgaW9jdGwsIE1FTVJFQUQsIHdoaWNoIGFkZHJl
c3NlcyB0aGUgYWJvdmUgaXNzdWVzLiAgSXQgaXMKPiBpbnRlbmRlZCB0byBiZSBhIHJlYWQtc2lk
ZSBjb3VudGVycGFydCBvZiB0aGUgZXhpc3RpbmcgTUVNV1JJVEUgaW9jdGwuCj4gU2ltaWxhcmx5
IHRvIHRoZSBsYXR0ZXIsIHRoZSByZWFkIG9wZXJhdGlvbiBpcyBwZXJmb3JtZWQgaW4gYSBsb29w
IHdoaWNoCj4gcHJvY2Vzc2VzIGF0IG1vc3QgbXRkLT5lcmFzZXNpemUgYnl0ZXMgaW4gZWFjaCBp
dGVyYXRpb24uICBUaGlzIGlzIGRvbmUKPiB0byBwcmV2ZW50IHVuYm91bmRlZCBtZW1vcnkgYWxs
b2NhdGlvbnMgY2F1c2VkIGJ5IGNhbGxpbmcga21hbGxvYygpIHdpdGgKPiB0aGUgJ3NpemUnIGFy
Z3VtZW50IHRha2VuIGRpcmVjdGx5IGZyb20gdGhlIHN0cnVjdCBtdGRfcmVhZF9yZXEgcHJvdmlk
ZWQKPiBieSB1c2VyIHNwYWNlLiAgSG93ZXZlciwgdGhlIG5ldyBpb2N0bCBpcyBpbXBsZW1lbnRl
ZCBzbyB0aGF0IHRoZSB2YWx1ZXMKPiBpdCByZXR1cm5zIG1hdGNoIHRob3NlIHRoYXQgd291bGQg
aGF2ZSBiZWVuIHJldHVybmVkIGlmIGp1c3QgYSBzaW5nbGUKPiBtdGRfcmVhZF9vb2IoKSBjYWxs
IHdhcyBpc3N1ZWQgdG8gaGFuZGxlIHRoZSBlbnRpcmUgcmVhZCBvcGVyYXRpb24gaW4KPiBvbmUg
Z28uCj4gCj4gTm90ZSB0aGF0IHdoaWxlIGp1c3QgcmV0dXJuaW5nIC1FVUNMRUFOIG9yIC1FQkFE
TVNHIHRvIHVzZXIgc3BhY2Ugd291bGQKPiBhbHJlYWR5IGJlIGEgdmFsaWQgYW5kIHVzZWZ1bCBp
bmRpY2F0aW9uIG9mIHRoZSBFQ0MgYWxnb3JpdGhtIGRldGVjdGluZwo+IGVycm9ycyBkdXJpbmcg
YSByZWFkIG9wZXJhdGlvbiwgdGhhdCBzaWduYWwgd291bGQgbm90IGJlIGdyYW51bGFyIGVub3Vn
aAo+IHRvIGNvdmVyIGFsbCB1c2UgY2FzZXMuICBGb3IgZXhhbXBsZSwga25vd2luZyB0aGUgbWF4
aW11bSBudW1iZXIgb2YKPiBiaXRmbGlwcyBkZXRlY3RlZCBpbiBhIHNpbmdsZSBFQ0Mgc3RlcCBk
dXJpbmcgYSByZWFkIG9wZXJhdGlvbiBwZXJmb3JtZWQKPiBvbiBhIGdpdmVuIHBhZ2UgbWF5IGJl
IHVzZWZ1bCB3aGVuIGRlYWxpbmcgd2l0aCBhbiBNVEQgcGFydGl0aW9uIHdob3NlCj4gRUNDIGxh
eW91dCB2YXJpZXMgYWNyb3NzIHBhZ2VzIChlLmcuIGEgcGFydGl0aW9uIGNvbnNpc3Rpbmcgb2Yg
YQo+IGJvb3Rsb2FkZXIgYXJlYSB1c2luZyBhICJjdXN0b20iIEVDQyBsYXlvdXQgZm9sbG93ZWQg
YnkgZGF0YSBwYWdlcyB1c2luZwo+IGEgInN0YW5kYXJkIiBFQ0MgbGF5b3V0KS4gIFRvIGFkZHJl
c3MgdGhhdCwgaW5jbHVkZSBFQ0Mgc3RhdGlzdGljcyBpbgo+IHRoZSBzdHJ1Y3R1cmUgcmV0dXJu
ZWQgdG8gdXNlciBzcGFjZSBieSB0aGUgbmV3IE1FTVJFQUQgaW9jdGwuCj4gCj4gTGluazogaHR0
cHM6Ly93d3cuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMTYtQXByaWwvMDY3
MDg1Lmh0bWwKPiAKPiBTdWdnZXN0ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBLxJlwaWXFhCA8a2Vy
bmVsQGtlbXBuaXUucGw+Cj4gLS0tCj4gZHJpdmVycy9tdGQvbXRkY2hhci5jICAgICAgfCAxMzkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IGluY2x1ZGUvdWFwaS9tdGQv
bXRkLWFiaS5oIHwgIDY0ICsrKysrKysrKysrKysrKy0tCj4gMiBmaWxlcyBjaGFuZ2VkLCAxOTgg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJn
ZXIgPHJpY2hhcmRAbm9kLmF0PgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
