Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1267CF319D
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+9WxeRVfUDCS/ya12DtgP4xQimP/0P/m9s8AIQkg6c=; b=YscEa0qojxLbU4
	XAsKRo1L9PaEaxtn9W4C4uI3UpYcpKikGmrdixpvQ0dHoYsKRYWDoumpqfujyMzqZXcWHC9OxGNZi
	XdVYLpAfIjYNnH7TkjgZ957WAS5f/7wLuwWdyz2F4FzOgIhUtztqz5tfx9CVObMShRt8jqTQD1GCV
	wfSyjOJVdoocpZyp4tybvunMvr6Zmr4olCPNBBsW5YrXbFYJr+Spab7nvxxnR6sLrBYPYZLAHZhQn
	pXolC0xHtCo9/xbZKzuTlSMXYpsxatUXOuV2XjSnixUvU+tOCi0yRPI5x0lqeXnvlK3Z69Kv9PAIm
	uqqAa1dXRlMaAbsAXlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svuJX-000000056Wk-2BQm;
	Wed, 02 Oct 2024 08:02:27 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svuHL-000000056BQ-1rRT
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 08:00:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A966B20008;
	Wed,  2 Oct 2024 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727856009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdMVKss6PfGeaKPjGTJR+yfI3wZkKGGFlk5dLU6k4ao=;
	b=AGBD6axw4vf6lVnV1DAOu5qoAiJPXkoDR5TdC6xZLillMX0hyif9k1dLlmwcHGY/42eDNH
	1gns3If6kpWgIiP1UGw5UJIpjq8MoYnQQttDRQg3j7LNdcwlFxCn0uMcYZHQzbcLrZU48r
	RaUSzlQXZYcLUdjx1s8l10ySEtsEuB67fNOyDyyuq5gPvDuwAjQ9dOK0AbXI/NSfyrljhv
	fCTsxA8j9dL9cx7zXrTVQvbmzenZFN9ueLijhEtQ3LuXJBN3IoZSXbJgyIOU7pZXX00Jyx
	KPeJYCunDsRwx7nZU1HYT4T9UEnsZQFZPSQ4BBNBf3ec6wAt0Mc3L4y0Cb+adQ==
Date: Wed, 2 Oct 2024 10:00:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan
 <saravanak@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi
 <lorenzo@kernel.org>, upstream@airoha.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add Documentation for Airoha
 fixed-partitions
Message-ID: <20241002100006.5995fd10@xps-13>
In-Reply-To: <66fbcee8.df0a0220.2ad0cb.4f6a@mx.google.com>
References: <20240925101422.8373-1-ansuelsmth@gmail.com>
	<20240925101422.8373-3-ansuelsmth@gmail.com>
	<20240925133003.619c40c4@xps-13>
	<66f3f58e.5d0a0220.5d655.b48a@mx.google.com>
	<20240925135256.32d3a0f7@xps-13>
	<66f3fcb7.5d0a0220.3ca4c2.ba83@mx.google.com>
	<20240930114819.609f9341@xps-13>
	<66fa7915.050a0220.1da288.aeca@mx.google.com>
	<20241001104225.67483dab@xps-13>
	<66fbcee8.df0a0220.2ad0cb.4f6a@mx.google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_010011_960065_6AACE242 
X-CRM114-Status: GOOD (  46.36  )
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

SGkgQ2hyaXN0aWFuLAoKPiA+ID4gPiA+IE9rIHByb2JhYmx5IHRoZSBkZXNjcmlwdGlvbiBpc24n
dCBjbGVhciBlbm91Z2guIFRoZSBtaXNzaW5nIGluZm8gdGhhdAo+ID4gPiA+ID4gcmVxdWlyZSB0
aGlzIHBhcnNlciBpcyB0aGUgZmxhc2ggZW5kLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGb2xsb3dp
bmcgdGhlIGV4YW1wbGUgd2Uga25vdyB0aGUgc2l6ZSBvZiByb290ZnNfZGF0YSBhbmQgc3RhcnQg
b2Zmc2V0Cj4gPiA+ID4gPiBBTkQgd2Uga25vdyB0aGUgc2l6ZSBvZiB0aGUgQVJUIHBhcnRpdGlv
bi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlcmUgbWlnaHQgYmUgYSBzcGFjZSBpbiB0aGUgbWlk
ZGxlIHVudXNlZCBiZXR3ZWVuIHRoZSByb290ZnNfZGF0YQo+ID4gPiA+ID4gcGFydGl0aW9uIGFu
ZCB0aGUgYXJ0IHBhcnRpdGlvbi4gV2hhdCBpcyBkZXJpdmVkIGlzIHRoZSBzdGFydGluZyBvZmZz
ZXQKPiA+ID4gPiA+IG9mIHRoZSBhcnQgcGFydGl0aW9uIHRoYXQgaXMgZmxhc2ggZW5kIC0gYXJ0
IHBhcnRpdGlvbiBzaXplLgo+ID4gPiA+ID4gKHdoZXJlIGZsYXNoIGVuZCBjaGFuZ2UgYW5kIGlz
IG5vdCBhbHdheXMgdGhlIHNhbWUgZHVlIHRvIGhvdyB0aGUgc3BlY2lhbAo+ID4gPiA+ID4gYmFk
IGJsb2NrIG1hbmFnYW1lbnQgdGFibGUgcmVzZXJ2ZWQgc3BhY2UgaXMgaGFuZGxlZCkKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gVGhpcyBpcyB3aHkgMHhmZmZmZmZmZiwgdXNlZCBhcyBhIGR1bW15IG9m
ZnNldCB0byBzaWduYWwgaXQgd2lsbCBiZSBwYXJzZWQgYXQKPiA+ID4gPiA+IHJ1bnRpbWUuIE9u
IHNlY29uZCB0b3VnaHQgdGhvIG1heWJlIHVzaW5nIHRoaXMgZHVtbXkgb2Zmc2V0IGlzIHdyb25n
IGFuZAo+ID4gPiA+ID4gSSBzaG91bGQganVzdCBoYXZlIHNvbWV0aGluZyBsaWtlCj4gPiA+ID4g
PiAKPiA+ID4gPiA+IGxlbmd0aCA9IDwweDMwMDAwMD47Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IElz
IGl0IGNsZWFyIG5vdz8gU29ycnkgZm9yIGFueSBjb25mdXNpb24uICAgIAo+ID4gPiA+IAo+ID4g
PiA+IEknbSBzb3JyeSBidXQgbm90IHJlYWxseS4gWW91IGtub3cgdGhlIGVuZCBvZiB0aGUgcGh5
c2ljYWwgZGV2aWNlIGFuZAo+ID4gPiA+IHRoZSBzaXplIG9mIHRoZSBBUlQgcGFydGl0aW9uLCBz
byB5b3UgbXVzdCBrbm93IGl0cyBzdGFydCBhcyB3ZWxsPwo+ID4gPiA+ICAgIAo+ID4gPiAKPiA+
ID4gQmVmb3JlIHRoZSBzeXN0ZW0gYm9vdCB3ZSBrbm93Ogo+ID4gPiAtIHNpemUgb2YgdGhlIEFS
VCBwYXJ0aXRpb24KPiA+ID4gLSByZWFsIHNpemUgb2YgdGhlIHBoeXNpY2FsIGRldmljZSAoNTEy
bWIuLi4gMUcuLi4gNjRtYi4uLikKPiA+ID4gCj4gPiA+IFdoZW4gdGhlIHBoeXNpY2FsIGRldmlj
ZSBpcyBwcm9iZWQgKG5hbmQpIGEgc3BlY2lhbCBkcml2ZXIgaXMgbG9hZGVkCj4gPiA+IChiZWZv
cmUgbXRkIHBhcnNpbmcgbG9naWMpIHRoYXQgY2hhbmdlIHRoZSBwaHlzaWNhbCBzaXplIG9mIHRo
ZSBkZXZpY2UKPiA+ID4gKG10ZC0+c2l6ZSkgYXMgYXQgdGhlIGVuZCBvZiB0aGUgbmFuZCBzb21l
IHNwYWNlIGlzIHJlc2VydmVkIGZvciBiYWQKPiA+ID4gYmxvY2sgbWFuYWdlbWVudCBhbmQgb3Ro
ZXIgbWV0YWRhdGEgaW5mby4gIAo+ID4gCj4gPiBIZXJlIHlvdSBhcmUgZXhwbGFpbmluZyB3aGF0
IHlvdSBpbnRlbmQgTGludXggdG8gZG8sIHJpZ2h0PyBJIHdvdWxkCj4gPiBsaWtlIHRvIHVuZGVy
c3RhbmQgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBzb2x2ZS4gSSBkb250IHVuZGVyc3RhbmQgd2h5
Cj4gPiB5b3UgbmVlZCB0aGUgc2l6ZSBjaGFuZ2UsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91
IGRvbid0IGtub3cgdGhlCj4gPiBzdGFydCBvZiB0aGUgQVJUIHBhcnRpdGlvbiwgSSBkb24ndCB1
bmRlcnN0YW5kIHdoYXQgdGhlIGRhdGEgeW91IGFyZQo+ID4gaGlkaW5nIGNvbnRhaW5zIGFuZCB3
aG8gdXNlcyBpdCA6LSkgSSdtIHNvcnJ5LCB0aGlzIGlzIHRvbyB1bmNsZWFyIHlldC4gIAo+IAo+
IFRvdGFsbHkgbm90IGEgcHJvYmxlbSBhbmQgdGhhbmtzIGEgbG90IGZvciB5b3Uga2VlcCBhc2tp
bmcgdGhlbS4uLiBNb3JlCj4gdGhhbiBoYXBweSB0byBjbGVhciB0aGluZ3MsIEknbSB0cnlpbmcg
dG8gc29sdmUgYSBwcm9ibGVtIHByZXNlbnQgb24KPiBBaXJvaGEgU29DIGFuZCB1cHN0cmVhbWlu
ZyBhIGNvcnJlY3QgcGFyc2VyIGZvciBpdC4KPiAKPiBXaGF0IEknbSB0cnlpbmcgdG8gc29sdmU6
Cj4gCj4gQ29ycmVjdCBhY2Nlc3MgdG8gdGhpcyBwYXJ0aXRpb24gYXQgdGhlIGVuZCBvZiB0aGUg
Zmxhc2ggaW4gYW4gYXV0b21hdGVkCj4gd2F5Lgo+IAo+IFRoZSBjb250ZW50IG9mIHRoaXMgcGFy
dGl0aW9uIGlzIHRoZSB1c3VhbCBBUlQgcGFydGl0aW9uIGZvdW5kIG9uIGxvdHMgb2YKPiBlbWJl
ZGRlZCBkZXZpY2VzLiBNQUMgYWRkcmVzcywgd2lmaSBjYWxpYnJhdGlvbiBkYXRhLCBzZXJpYWwu
IFVzYWdlIGlzCj4gTlZNRU0gY2VsbHMgYW5kIHVzZXJzcGFjZSB3aXRoIGRkIGNvbW1hbmQgdG8g
ZXh0cmFjdCBkYXRhIGZyb20uCj4gCj4gQWlyb2hhIHVzZSBzb21ldGhpbmcgYWxzbyB1c2VkIGJ5
IHNvbWUgbWVkaWF0ZWsgU29DLiBUaGV5IGNhbGwgaXQgQk1UCj4gYW5kIGl0J3MgY3VycmVudGx5
IHVzZWQgZG93bnN0cmVhbSBpbiBPcGVuV3J0IGFuZCB0aGV5IGZpcm13YXJlLiBUaGlzIGlzCj4g
YWxzbyB1c2VkIGluIHRoZSBib290bG9hZGVyLgo+IAo+IFRoZSB1c2FnZSBvZiBCTVQgaXMgYSBj
dXN0b20gd2F5IHRvIGhhbmRsZSBiYWQgYmxvY2tzIGVudGlyZWx5IGJ5Cj4gc29mdHdhcmUuIEF0
IHRoZSBlbmQgb2YgdGhlIGZsYXNoIHNvbWUgc3BhY2UgaXMgcmVzZXJ2ZWQgd2hlcmUgaW5mbwo+
IGFib3V0IGFsbCB0aGUgYmxvY2tzIG9mIHRoZSBmbGFzaCBhcmUgcHV0LiBJJ20gbm90IDEwMCUg
c3VyZSBhYm91dCB0aGUKPiBmdW5jdGlvbmFsaXR5IG9mIHRoaXMgYnV0IGl0IGNhbiByZWxvY2F0
ZSBibG9jayBhbmQgZG8gbWFnaWMgdGhpbmdzIHRvCj4gaGFuZGxlIGJhZCBibG9ja3MuIEZvciB0
aGUgc2NvcGUgb2YgdGhpcyBjaGFuZ2UsIHRoZSBpbXBvcnRhbnQgaW5mbyBpcwo+IHRoYXQgYWZ0
ZXIgdGhlIEJNVCBpcyBwcm9iZWQsIHRoZSBvcGVyYXRpb24gb2YgInJlc2VydmluZyBzcGFjZSIg
aXMgZG9uZQo+IGJ5IHJlZHVjaW5nIHRoZSBNVEQgZmxhc2ggc2l6ZS4gU28gZnJvbSB0aGUgTVRE
IHN1YnN5c3RlbSwgaXQgZG9lcyBzZWUgYQo+IHNtYWxsZXIgZmxhc2ggdGhhbiBpdCBhY3R1YWxs
eSBpcy4KPiAKPiBUaGUgcmVzZXJ2ZWQgc3BhY2UgY2hhbmdlISBBY3Jvc3MgU29DIG9yIGV2ZW4g
ZGV2aWNlcyBidXQgdGhlIEJNVCBpcyBhCj4gbXVzdCB3aGVyZSBpdCdzIHVzZWQgYXMgYm9vdGxv
YWRlciBtYWtlcyB1c2Ugb2YgaXQgYW5kIHdyaXRpbmcgdG8gaXQKPiBtaWdodCBjb25mdXNlIHRo
ZSBib290bG9hZGVyIGNvcnJ1cHRpbmcgZGF0YS4gKG9uZSBibG9jayBtaWdodCBiZQo+IGZsYWdn
ZWQgYXMgYmFkIGFkIGRhdGEgbW92ZWQsIEJNVCBkcml2ZXIgdmFsaWRhdGVzIGhpcyB0YWJsZSBh
bmQgZG8KPiBvcGVyYXRpb24pCgpPaywgSSB0aGluayB0aGF0J3Mgd2F5IGNsZWFyZXIgbm93LgoK
U28gdGhlIEJNVCBkcml2ZXIgZG9lcyBub3QgZXhpc3QgaW4gbWFpbmxpbmUgTGludXgsIGJ1dCB5
b3Ugd291bGQgbGlrZQp0byBza2lwIHRoaXMgcGFydCBvZiB0aGUgTVREIGRldmljZSB0byBhdm9p
ZCBzbWFzaGluZyBpdC4gQW5kIGl0IGlzIGluCnVzZSBieSB0aGUgdmVuZG9yIEJvb3Rsb2FkZXIg
SSBndWVzcz8KCklzIGl0IHNvbWUga2luZCBvZiB0YWJsZSB0aGF0IGlzIHdyaXR0ZW4gYnkgdGhl
IGNoaXAgaXRzZWxmIGluIG9yZGVyIHRvCm1haW50YWluIGEgbGlzdCBvZiBhdXRvLXJlcGxhY2Vt
ZW50IGJsb2NrcyBmb3IgYmFkIGJsb2Nrcz8gQ2FuIHRoZSBzaXplCm9mIHRoaXMgdGFibGUgbW92
ZSB3aXRoIHRoZSB1c2Ugb2YgdGhlIGRldmljZT8gKGlmIHllcywgaXQncwpwcm9ibGVtYXRpYywg
d2UgZG9uJ3Qgd2FudCB0byByZXNpemUgTVREIHBhcnRpdGlvbnMgd2l0aG91dCBub3RpY2luZywK
aXQgd291bGQgYnJlYWsgZWcuIFVCSSkuCgpJIGJlbGlldmUgdGhpcyBCTVQgYmxvY2sgaXMgZ29p
bmcgYWdhaW5zdCB0aGUgYmFkIGJsb2NrIGhhbmRsaW5nIGluCkxpbnV4LCBzbyBJIHJlYWxseSB3
b25kZXIgaG93IG9uZSBjYW4gdXNlIGJvdGggbWVjaGFuaXNtcyBpbiBhIHN5c3RlbS4KSWYgdGhl
IEJNVCBsYXllciB0YWtlcyAib25lIHJhbmRvbSBibG9jayIgdG8gbWFwIGEgY29ycnVwdGVkIG9u
ZSBvbiBpdCwKaXQgdG90YWxseSBkZWZlYXRzIHRoZSBjdXJyZW50IGJhZCBibG9jayBtb2RlbCB3
ZSBoYXZlIGluIE1URC9VQkkKYW5kIHNpbXBseSBjYW5ub3QgYmUgc3VwcG9ydGVkIGF0IGFsbC4g
SnVzdCBza2lwcGluZyB0aGUKY3VycmVudGx5LXVzZWQtZm9yLUJNVCBibG9ja3Mgc291bmRzIGxp
a2UgYSB2ZXJ5IGJhZCBpZGVhIHRoYXQgd2lsbApicmVhayB5b3VyIHN5c3RlbSwgbGF0ZXIuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
