Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BDCC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:55:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7775421473
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ImoLChKK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7775421473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ugeM3JsvRBJsrm+LQK23Bd0hJYR2D10Y6cXEDflRF4=; b=ImoLChKKbijVdE
	XQ23B0j4vwRy+o2Umgw+TgIDohvituQGb0oqv6f4KtPkAigC/H5TDqiOzXgfL/YIygQXUJ4ZtZqaH
	MXVhfDE3roSGiuL/qSrw/7LnUWcMb5V7Z+rE8tmOm4OO51hFMRxxsQiZdom+vtZAkiAIlXK8NQkUD
	x7H7GCw87l4cX23eWtFf0ZStHn6ch7NJiav8mIconZ9eMFRn4yB3tjZZWp+t1xGTJCqm10LvVOT4j
	AoZFMIwxRpE+xt/upRO95HNnpKr2XHpv1GAjYact/O09jf5/QYAXos4XiQgSWWY5O/9FNn4jLnbfv
	jvryD/1Lh2F9e5S215hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL30l-0000cg-3M; Mon, 29 Apr 2019 09:55:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL30h-0000cB-P9
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 09:55:45 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C7BD3FF811;
 Mon, 29 Apr 2019 09:55:41 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:55:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>
Subject: Re: atmel nand bindings vs. actual dts files
Message-ID: <20190429115540.7d577a50@xps13>
In-Reply-To: <4099561.5sHrvDXGx3@ada>
References: <1823900.qPX5mxbl1h@ada>
	<4099561.5sHrvDXGx3@ada>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_025543_961057_7B1FAAA7 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWxleGFuZGVyLAoKU29ycnkgZm9yIHRoZSBiaWcgZGVsYXkuCgpBbGV4YW5kZXIgRGFobCA8
YWRhQHRob3JzaXMuY29tPiB3cm90ZSBvbiBUaHUsIDA3IE1hciAyMDE5IDE3OjI1OjE3CiswMTAw
OgoKPiBIZWxsbywKPiAKPiBBbSBNaXR0d29jaCwgNi4gTcOkcnogMjAxOSwgMTU6MDc6NTIgQ0VU
IHNjaHJpZWIgQWxleGFuZGVyIERhaGw6Cj4gPiBTbyBpbnN0ZWFkIG9mICJhbHdheXMgMHg4MDAw
MDAiIHRoYXQgbm9kZSBoYXMgMHgyIGFzIHRoaXJkIGVudHJ5IGZvciB0aGUKPiA+ICdyZWcnIHBy
b3BlcnR5LiBXaHkgaXMgdGhhdD8gIAo+IAo+IEkgZGlkbid0IGludmVzdGlnYXRlIHRoYXQgZnVy
dGhlciB5ZXQsIGJ1dCBJJ20gY3VyaW91cywgc28gaWYgYW55b25lIGtub3dzPwoKSSBzdXBwb3Nl
IHRoZSBiaW5kaW5ncyBbMV0gZXhwbGFpbiB0aGUgc2l0dWF0aW9uLgoKWzFdIGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjAvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYXRtZWwtbmFuZC50eHQjTDMyCgo+IAo+ID4gQm9udXMgcXVlc3Rpb246
IGlmIHRoZSBSL0IgbGluZSBpcyBub3QgY29ubmVjdGVkLCBob3cgaXMgdGhhdCBleHByZXNzZWQg
aW4KPiA+IGR0cz8gQXMgZmFyIGFzIEkgdW5kZXJzdG9vZCB0aGF0IGlzIHBvc3NpYmxlLCBpZiB0
aGUgZHJpdmVyIHBvbGxzIHNvbWUKPiA+IHN0YXR1cyByZWdpc3RlciBpbnN0ZWFkIG9mIHRoYXQg
bGluZSBsZXZlbCwgcmlnaHQ/ICAKClRoZXJlIGlzIGFuIGF0bWVsLHJiIHByb3BlcnR5IHdpdGgg
dGhlIHJlYWR5L2J1c3kgR1BJTyBsaW5lLiBJZiBpdCBpcwptaXNzaW5nLCBJIHRoaW5rIHRoZSBk
cml2ZXIgd2lsbCBkbyBhIE1NSU8gcmVhZCBpbnN0ZWFkLgoKPiAKPiBPciBqdXN0IHdhaXRzIHVu
dGlsIGEgY2VydGFpbiB0aW1lb3V0IOKApgo+IAo+IEZvciB2NC4xOS4yNSAodGhpcyBpcyB0aGUg
Y3VycmVudGx5IGxhdGVzdCBiYXNlIGZvciBQUkVFTVBUIFJUIHBhdGNoZXMpIEkgCj4gZm91bmQg
dGhpczoKPiAKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NC4xOS4yNS9zb3Vy
Y2UvaW5jbHVkZS9saW51eC9tdGQvCj4gcmF3bmFuZC5oI0wxMTk1Cj4gCj4gSXQgc2F5czogCj4g
Cj4gICogQGRldl9yZWFkeToJCVtCT0FSRFNQRUNJRklDXSBoYXJkd2FyZXNwZWNpZmljIGZ1bmN0
aW9uIGZvciBhY2Nlc3NpbmcKPiAgKgkJCWRldmljZSByZWFkeS9idXN5IGxpbmUuIElmIHNldCB0
byBOVUxMIG5vIGFjY2VzcyB0bwo+ICAqCQkJcmVhZHkvYnVzeSBpcyBhdmFpbGFibGUgYW5kIHRo
ZSByZWFkeS9idXN5IGluZm9ybWF0aW9uCj4gICoJCQlpcyByZWFkIGZyb20gdGhlIGNoaXAgc3Rh
dHVzIHJlZ2lzdGVyLgo+IAo+IEhvd2V2ZXIgSSBzZWUgbm8gd2F5IHRvIGV4cGxpY2l0bHkgc2V0
IHRoaXMgdG8gTlVMTCB2aWEgZGV2aWNlIHRyZWUgZm9yIHRoZSAKPiBhdG1lbCByYXcgbmFuZCBk
cml2ZXIsIG9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nPyAKPiAKPiBJIGd1ZXNzIHRoYXQncyBubyBy
ZWNvbW1lbmRlZCBoYXJkd2FyZSBzZXR1cD8KCi0+ZGV2X3JlYWR5KCkgaXMgYSBsZWdhY3kgaG9v
ay4gTm93IHdlIHVzZSAtPmV4ZWNfb3AoKSBhbmQgdGhlIHdhaXQKcGVyaW9kcyBhcmUgZGlyZWN0
bHkgaGFuZGxlZCBpbnNpZGUgaXQgKHNlZSBhdG1lbF9uZmNfd2FpdCgpKS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
