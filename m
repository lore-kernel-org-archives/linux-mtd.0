Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61247C33CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 09:46:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6182080D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 09:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFp2rqAC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6182080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FygejyFiXNhplc7kSrTl1QBWqk3Y4PHlwFmtstVWc0o=; b=CFp2rqACS4Vw5Z
	v/NiGlPzdFnQALlbjdUJ4rlveoVe8237qXT0RcuSsSXou2J86mUzFO/u0KRs79guQIHDrXX+CySq0
	D//IwwFkhpR3f2KazGIEzQDceR55N7Sb1xlPjM7L9BZxQS51m4WbWmKiBj9jT4zrWhtshg7QH+xqQ
	PQ8ZWDJuePw0Wbj8LTtAHJo1JP4PxovwsYx7qhSFOU82IuIUzEArjdrx5L7mXdIsm7no0SOLmJCrr
	1oHJBLS/IdZvNHcvNLdHzYDDYqn+ZGHqR6v3rfMVGQblpNYDiAg8VgDi9DRYxaTkr1ddjcEFATyOk
	s1OazZ8ZHBgN0N8QCJ6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipqsF-0003uw-1J; Fri, 10 Jan 2020 09:46:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipqsB-0003t3-0d
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 09:46:33 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 29AD629397B;
 Fri, 10 Jan 2020 09:46:29 +0000 (GMT)
Date: Fri, 10 Jan 2020 10:46:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: implement proper partition handling
Message-ID: <20200110104626.0531d556@collabora.com>
In-Reply-To: <20200110092855.79f18339@xps13>
References: <20191230111948.27005-1-miquel.raynal@bootlin.com>
 <1651325521.16954.1578526458487.JavaMail.zimbra@nod.at>
 <20200109191304.636c82e7@xps13>
 <1737779363.17836.1578595384783.JavaMail.zimbra@nod.at>
 <20200109194556.34cf67dc@xps13>
 <20200109201355.707c5b0d@collabora.com>
 <20200109202358.2a428a8d@xps13>
 <20200109203722.4423ed09@collabora.com>
 <20200110092855.79f18339@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_014631_333310_657B1609 
X-CRM114-Status: GOOD (  29.05  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMCBKYW4gMjAyMCAwOToyODo1NSArMDEwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgQm9yaXMsCj4gCj4gQm9yaXMgQnJlemls
bG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGUgb24gVGh1LCA5IEphbgo+
IDIwMjAgMjA6Mzc6MjIgKzAxMDA6Cj4gCj4gPiBPbiBUaHUsIDkgSmFuIDIwMjAgMjA6MjM6NTgg
KzAxMDAKPiA+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3Rl
Ogo+ID4gICAKPiA+ID4gSGkgQm9yaXMsCj4gPiA+IAo+ID4gPiBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZSBvbiBUaHUsIDkgSmFuCj4gPiA+IDIw
MjAgMjA6MTM6NTUgKzAxMDA6Cj4gPiA+ICAgICAKPiA+ID4gPiBPbiBUaHUsIDkgSmFuIDIwMjAg
MTk6NDU6NTYgKzAxMDAKPiA+ID4gPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPiB3cm90ZToKPiA+ID4gPiAgICAgICAKPiA+ID4gPiA+IEhpIFJpY2hhcmQsCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3Rl
IG9uIFRodSwgOSBKYW4gMjAyMCAxOTo0MzowNAo+ID4gPiA+ID4gKzAxMDAgKENFVCk6Cj4gPiA+
ID4gPiAgICAgICAgIAo+ID4gPiA+ID4gPiBNaXF1ZWwsCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tICAgICAgICAgIAo+ID4gPiA+ID4gPiA+
PiBXaGF0IHByb2JsZW0gZG9lcyB0aGlzIHNvbHZlPwo+ID4gPiA+ID4gPiA+PiAuLi5iZXNpZGUg
b2YgYSBuaWNlIGRpZmZzdGF0IHdoaWNoIHJlbW92ZXMgbW9yZSB0aGFuIGl0IGFkZHMuIDotKSAg
ICAgICAgICAgIAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEl0IGlzIG11Y2ggZWFzaWVy
IHRvIGVzY2FsYWRlIHRvIHRoZSB0b3AgbW9zdCAibWFzdGVyIiBkZXZpY2Ugd2hlbgo+ID4gPiA+
ID4gPiA+IHRoZXJlIGFyZSBtdWx0aXBsZSBsZXZlbHMgb2YgcGFydGl0aW9uaW5nLCB3aGljaCB3
YXMgbm90IGNsZWFubHkKPiA+ID4gPiA+ID4gPiBkZXNjcmliZWQgSU1ITy4gQWxzbyBpdCBpcyBh
bHJlYWR5IHVzZWQgaW4gdGhlIE1MQy1pbi1wc2V1ZG8tU0xDLW1vZGUKPiA+ID4gPiA+ID4gPiBz
ZXJpZXMgOikgICAgICAgICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE9rLiBJbiBmYWN0
IEkgImZvdW5kIiB0aGlzIHBhdGNoIG15IGxvb2tpbmcgYXQgdGhlIFNMQyBlbXVsYXRpb24gcGF0
Y2hlcy4KPiA+ID4gPiA+ID4gICAgICAgICAgIAo+ID4gPiA+ID4gPiA+PiA+ICtzdGF0aWMgaW5s
aW5lIHN0cnVjdCBtdGRfaW5mbyAqbXRkX2dldF9tYXN0ZXIoc3RydWN0IG10ZF9pbmZvICptdGQp
Cj4gPiA+ID4gPiA+ID4+ID4gK3sKPiA+ID4gPiA+ID4gPj4gPiArCXdoaWxlIChtdGQtPnBhcmVu
dCkKPiA+ID4gPiA+ID4gPj4gPiArCQltdGQgPSBtdGQtPnBhcmVudDsKPiA+ID4gPiA+ID4gPj4g
PiArCj4gPiA+ID4gPiA+ID4+ID4gKwlyZXR1cm4gbXRkOwo+ID4gPiA+ID4gPiA+PiA+ICt9ICAg
ICAgICAgICAgCj4gPiA+ID4gPiA+ID4+IAo+ID4gPiA+ID4gPiA+PiBTbywgcGFyZW50ID09IG1h
c3Rlcj8gICAgICAgICAgICAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiB0b3AgbW9zdCBw
YXJlbnQgKHRoZSBvbmUgd2l0aG91dCBwYXJlbnQpID09IG1hc3RlciAhCj4gPiA+ID4gPiA+ID4g
ICAgICAgICAgICAgCj4gPiA+ID4gPiA+ID4+IAo+ID4gPiA+ID4gPiA+PiBXaGVuIEkgY3JlYXRl
IGEgTVREIG9udG9wIG9mIFVCSSB1c2luZyBnbHVlYmksIHdobyB3aWxsIGJlIHBhcmVudC9tYXN0
ZXI/ICAgICAgICAgICAgCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSSBkb24ndCByZWFs
bHkgdW5kZXJzdGFuZCB0aGUgaXNzdWUgaGVyZT8gICAgICAgICAgICAKPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IExldCdzIHNheSBJIGhhdmUgbXRkMCB3aXRoIGFuIHViaSBhbmQgYSB2b2x1bWUg
Inh4eCIuIEFmdGVyIGVuYWJsaW5nCj4gPiA+ID4gPiA+IGdsdWViaSBhIG5ldyBtdGQxIHdpbGwg
YXJyaXZlIG9uIHRoZSBzeXN0ZW0uCj4gPiA+ID4gPiA+IFRoZSBzdGFja2luZyBpcyBtdGQwIC0+
IHViaSAodm9sdW1lIHh4eCkgLT4gbXRkMS4gICAgICAgICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IFRoaXMgaXMgbXVjaCBjbGVhcmVyLCB0aGFua3MhCj4gPiA+ID4gPiAgICAgICAgIAo+ID4gPiA+
ID4gPiBJcyBub3cgYSByZWxhdGlvbnNoaXAgYmV0d2VlbiBtdGQxIGFuZCBtdGQwPyAgICAgICAg
ICAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gTm8gdGhlcmUgaXMgbm9uZS4gCj4gPiA+ID4gPiAgICAg
ICAgIAo+ID4gPiA+ID4gPiBJJ2QgZXhwZWN0IG10ZDEncyBwYXJlbnQgYmVpbmcgbXRkMC4gICAg
ICAgICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgd291bGQgYmUgYSBuZXcgZmVhdHVyZSwg
cmlnaHQ/IEkgZG9uJ3QgdGhpbmsgaXQgaXMgdGhlIGNhc2UgdG9kYXkuICAgICAgICAKPiA+ID4g
PiAKPiA+ID4gPiBXZSBkZWZpbml0ZWx5IGRvbid0IHdhbnQgbXRkMSB0byBhcHBlYXIgYXMgYSBw
YXJ0aXRpb24gb2YgbXRkMCBpbiB0aGF0Cj4gPiA+ID4gY2FzZSAoYmxvY2tzIGluIG10ZDEgY2Fu
J3QgYmUgbWFwcGVkIHRvIGJsb2NrcyBpbiBtdGQwIHdpdGhvdXQgdGhlIFVCSQo+ID4gPiA+IGxh
eWVyIGJlaW5nIGludm9sdmVkKS4gTWF5YmUgaXQnZCBiZSBjbGVhcmVyIGlmIHdlIG1vdmUgdGhl
IHBhcmVudAo+ID4gPiA+IGZpZWxkIHRvIG10ZF9wYXJ0IGFuZCBhZGQgYW4gTVREX0lTX1BBUlRJ
VElPTiBmbGFnLiBPciBtYXliZSB3ZSBjYW4KPiA+ID4gPiBqdXN0IGNob29zZSBhIGJldHRlciBu
YW1lLiAgICAgIAo+ID4gPiAKPiA+ID4gSSBwcmVmZXIgdGhlIG5hbWUgY2hhbmdlLiBJIHRoaW5r
IHRoZSBjdXJyZW50IHN0cnVjdCBvcmdhbml6YXRpb24KPiA+ID4gaXMgcmlnaHQuIFdoYXQgZG8g
eW91IHN1Z2dlc3Q/ICAgIAo+ID4gCj4gPiBJIGRvbid0IGhhdmUgYSBiZXR0ZXIgbmFtZSwgc29y
cnkuICAKPiAKPiBBY3R1YWxseSBJIGZpbmQgLT5wYXJlbnQgdG90YWxseSBkZXNjcmlwdGl2ZSwg
YW5kIGluIFJpY2hhcmQncyBleGFtcGxlLAo+IEkgd291bGQgbm90IGNhbGwgbXRkMSBhcyBtdGQw
J3MgcGFyZW50LCBpdCdzIG1vcmUgbGlrZSBhICJ0b3AgdmlydHVhbAo+IGRldmljZSIgYnV0IGNl
cnRhaW5seSBub3QgYSAiZGlyZWN0IiBwYXJlbnQuCgpJdCBkZXBlbmRzIHdoYXQga2luZCBvZiBw
YXJlbnRpbmcgd2UncmUgdGFsa2luZyBhYm91dCA6UC4gRnJvbSB0aGUKZGV2aWNlIG1vZGVsIHBl
cnNwZWN0aXZlLCBtdGQxJ3MgcGFyZW50IGlzIHViaTAuIEZyb20gdGhlIE1URCBwYXJ0aXRpb24K
cGVyc3BlY3RpdmUsIG10ZDEgaGFzIG5vIHBhcmVudCAoaXQncyBhIG1hc3RlciBNVEQgZGV2aWNl
KS4gVGhlIHByb2JsZW0KaGVyZSBpcyB0aGF0ICdwYXJlbnQnIGlzIHZhZ3VlIGVub3VnaCB0aGF0
IGl0IGxldHMgcGVvcGxlIHRoaW5rIGl0J3MKcmVwcmVzZW50aW5nIG1vcmUgdGhhbiBhIHBhcnRp
dGlvbiAtPiBwYXJ0aXRpb25fcGFyZW50IHJlbGF0aW9uc2hpcCwKaGVuY2UgbXkgc3VnZ2VzdGlv
biB0byBtb3ZlIHRoZSBmaWVsZCB0byBtdGRfcGFydCBzbyBpdCBjYW4gYmUKbmFtZXNwYWNlZCBp
biBtdGQtPnBhcnQucGFyZW50LgoKPiAKPiBtdGQtPmRpcmVjdF9wYXJlbnQgd291bGQgd29yayBi
dXQgSSB0aGluayBpdCBpcyBhIGJpdCB0b28gbG9uZyBhbmQgbW9zdAo+IG9mIHRoZSBwZW9wbGUg
d291bGQgbm90IHVuZGVyc3RhbmQgd2h5IHdlIGNhbGwgaXQgdGhpcyB3YXksIGluc3RlYWQgb2YK
PiBqdXN0ICJwYXJlbnQiLgoKLT5wYXJ0aXRpb25fcGFyZW50IHdvdWxkIGJlIG1vcmUgYWNjdXJh
dGUsIGJ1dCBJIGFncmVlIHdpdGggeW91LCBJJ20Kbm90IGEgYmlnIGZhbiBvZiB0aG9zZSBsb25n
IG5hbWVzLiBNYXliZSAtPmNvbnRhaW5lcj8KCj4gCj4gSSB3b3VsZCBsaWtlIHRvIHRha2UgdGhp
cyBwYXRjaCBpbnRvIDUuNiwgc28gcGxlYXNlIHRlbGwgbWUgd2hhdCB5b3UKPiBwcmVmZXIgKCJw
YXJlbnQiIGJlaW5nIHRoZSBtb3N0IHN0cmFpZ2h0Zm9yd2FyZCBhbmQgc2ltcGxlIHNvbHV0aW9u
IHRvCj4gbWUgOikgKQoKSSB0aGluayB0aGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcgaGVyZSBpcyBk
b2N1bWVudGluZyB3aGF0IHRoaXMgZmllbGQKaXMgcmVwcmVzZW50aW5nIHNvIHBlb3BsZSBjYW4g
cmVmZXIgdG8gdGhlIGRvYyBpZiB0aGV5IGdldCBjb25mdXNlZC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
