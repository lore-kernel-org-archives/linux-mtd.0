Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1196CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:29:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C956760F90
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C956760F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYgRYYLBgcpNVUB5R7wMs+mC/s4F+qj0JXZ5f19cWF8=; b=TaAyH5eifWl4yj
	zHV/bfdFvdKRWYML4w8PJiqg7pVojPq8FjytXiNcC29hz0Cjit6IFBYsBSnNo+RedD6jIfOsuVTiC
	76dEguz8A38eIDltz679h9NIKL7FZAwwoqn//U05av0j8Mo+LR6Vc2rKNWIHncfHpFFkFxB/tubwQ
	y6iMchjvEP7lgQZMT/1Wwmm6b0j/wWXpUx4Vi5PL6tjF3JNKZJ2Cj+WeJiuGtrBoJ5oF8yzgSrIod
	aW/tU054QXPVqSxJnoDTV1RM3RKdplPf2ayo7WCqqkqJLtjkkLdG5B40Z+iwkAtqQOD3D0SHzns0f
	lkRZZ9XK6Q2Zk+syXQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYpw3-002t3s-QC; Fri, 08 Oct 2021 13:29:15 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYpw0-002t26-2u
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 13:29:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4CC4D100005;
 Fri,  8 Oct 2021 13:29:06 +0000 (UTC)
Date: Fri, 8 Oct 2021 15:29:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>
Cc: Stefan =?UTF-8?B?UmllZG3DvGxsZXI=?= <S.Riedmueller@phytec.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20211008152905.2fbdcce9@xps13>
In-Reply-To: <13290228.RDIVbhacDa@n95hx1g2>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
 <20211008142724.7fbeed6a@xps13> <13290228.RDIVbhacDa@n95hx1g2>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_062912_425254_4034779D 
X-CRM114-Status: GOOD (  23.87  )
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

SGkgQ2hyaXN0aWFuLAoKY2VnZ2Vyc0BhcnJpLmRlIHdyb3RlIG9uIEZyaSwgOCBPY3QgMjAyMSAx
NToxMTo1OSArMDIwMDoKCj4gT24gRnJpZGF5LCA4IE9jdG9iZXIgMjAyMSwgMTE6NTU6NTYgQ0VT
VCwgQ2hyaXN0aWFuIEVnZ2VycyB3cm90ZToKPiAKPiA+IEkgZ290IGFub3RoZXIgc29sdXRpb24g
ZnJvbSBQSFlURUMgKFsyXSwgbm90IGxlbmd0aHkgdGVzdGVkIHlldCksIHdoaWNoCj4gPiBkaXNh
YmxlcyBhbGwgR1BNSS9CQ0ggY2xvY2tzIG9uIENDR1I0ICAKPiAKPiA+IC1zdGF0aWMgdm9pZCBn
cG1pX25mY19hcHBseV90aW1pbmdzKHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiA+ICtz
dGF0aWMgaW50IGdwbWlfbmZjX2FwcGx5X3RpbWluZ3Moc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0
aGlzKQo+ID4gCj4gPiAgewo+ID4gIAo+ID4gIAlzdHJ1Y3QgZ3BtaV9uZmNfaGFyZHdhcmVfdGlt
aW5nICpodyA9ICZ0aGlzLT5odzsKPiA+ICAJc3RydWN0IHJlc291cmNlcyAqciA9ICZ0aGlzLT5y
ZXNvdXJjZXM7Cj4gPiAgCXZvaWQgX19pb21lbSAqZ3BtaV9yZWdzID0gci0+Z3BtaV9yZWdzOwo+
ID4gIAl1bnNpZ25lZCBpbnQgZGxsX3dhaXRfdGltZV91czsKPiA+IAo+ID4gKwlpbnQgcmV0Owo+
ID4gCj4gPiArCXJldCA9IF9fZ3BtaV9lbmFibGVfY2xrKHRoaXMsIGZhbHNlKTsKPiA+ICsJaWYg
KHJldCkKPiA+ICsJCXJldHVybiByZXQ7Cj4gPiAKPiA+ICAJY2xrX3NldF9yYXRlKHItPmNsb2Nr
WzBdLCBody0+Y2xrX3JhdGUpOwo+ID4gCj4gPiArCXJldCA9IF9fZ3BtaV9lbmFibGVfY2xrKHRo
aXMsIHRydWUpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIHJldDsKPiA+IAo+ID4gIAl3
cml0ZWwoaHctPnRpbWluZzAsIGdwbWlfcmVncyArIEhXX0dQTUlfVElNSU5HMCk7Cj4gPiAgCXdy
aXRlbChody0+dGltaW5nMSwgZ3BtaV9yZWdzICsgSFdfR1BNSV9USU1JTkcxKTsgIAo+IAo+IAo+
IEkgdGhpbmsgdGhhdCB0aGlzIGlzIGFsc28gcmVxdWlyZWQgZm9yIHRoZSBmaXJzdCBjYWxsIHRv
IGNsa19zZXRfcmF0ZSgpIGluCj4gZ3BtaV9nZXRfY2xrcygpLiBGcm9tIHRoZSBrZXJuZWwncyBw
b2ludCBvZiB2aWV3LCB0aGUgY2xvY2tzIGFyZSBub3QgZW5hYmxlZAo+IHlldCwgc28gbm8gImd1
YXJkIiBpcyByZXF1aXJlZC4gUHV0dGluZyB0aGUgc2FtZSBndWFyZCBoZXJlIHdpbGwgYWN0dWFs
bHkgZ2l2ZQo+IGEgd2FybmluZyBhdCBydW50aW1lIHRoYXQgSSBhbSB0cnlpbmcgdG8gZGlzYWJs
ZSBhIGNsb2NrIHdoaWNoIGlzIG5vdCBlbmFibGVkLgo+IEJ1dCBvbiBteSBzeXN0ZW0sIGFsbCBj
bG9jayBnYXRlcyBhcmUgZW5hYmxlZCBieSB0aGUgYm9vdGxvYWRlciAoYmFyZWJveCkKPiBhbmQg
dGhlcmVmb3JlIHRoZSBnbGl0Y2ggY291bGQgYWxzbyBoYXBwZW4gaGVyZS4KPiAKPiBJZiBzZXR0
aW5nIHRoZSBjbG9jayB0byBhICJkZWZhdWx0IiByYXRlIGlzIHJlYWxseSByZXF1aXJlZCAob24g
bXkgc3lzdGVtLCB0aGUKPiBjbG9jayBpcyBzd2l0Y2hlZCBmcm9tIDk5IE1IeiB0byAyMiBNSHos
IGFuZCBiYWNrIHRvIDk5IE1IeiBvbiBhIGxhdGVyIGNhbGwuLi4pLAo+IEkgc3VnZ2VzdCBtb3Zp
bmcgdGhpcyBjYWxsIHRvIGdwbWlfbmFuZF9wcm9iZSgpIChiZWxvdyBfX2dwbWlfZW5hYmxlX2Ns
b2NrKCkpCj4gYW5kIGd1YXJkIGl0LiBUaGUgcmVzdWx0IHdvdWxkIGxvb2sgbGlrZToKPiAKPiAu
Li4KPiAJcmV0ID0gYWNxdWlyZV9yZXNvdXJjZXModGhpcyk7Cj4gCWlmIChyZXQpCj4gCQlnb3Rv
IGV4aXRfYWNxdWlyZV9yZXNvdXJjZXM7Cj4gCj4gCXJldCA9IF9fZ3BtaV9lbmFibGVfY2xrKHRo
aXMsIHRydWUpOwo+IAlpZiAocmV0KQo+IAkJZ290byBleGl0X2FjcXVpcmVfcmVzb3VyY2VzOwo+
IAo+IAlpZiAoR1BNSV9JU19NWDYodGhpcykpIHsKPiAJCS8qCj4gCQkgKiBTZXQgdGhlIGRlZmF1
bHQgdmFsdWUgZm9yIHRoZSBncG1pIGNsb2NrLgo+IAkJICoKPiAJCSAqIElmIHlvdSB3YW50IHRv
IHVzZSB0aGUgT05GSSBuYW5kIHdoaWNoIGlzIGluIHRoZQo+IAkJICogU3luY2hyb25vdXMgTW9k
ZSwgeW91IHNob3VsZCBjaGFuZ2UgdGhlIGNsb2NrIGFzIHlvdSBuZWVkLgo+IAkJICovCj4gCQlf
X2dwbWlfZW5hYmxlX2Nsayh0aGlzLCBmYWxzZSk7Cj4gCQljbGtfc2V0X3JhdGUodGhpcy0+cmVz
b3VyY2VzLmNsb2NrWzBdLCAyMjAwMDAwMCk7Cj4gCQlfX2dwbWlfZW5hYmxlX2Nsayh0aGlzLCB0
cnVlKTsKPiAJfQo+IAo+IAlwbV9ydW50aW1lX3NldF9hdXRvc3VzcGVuZF9kZWxheSgmcGRldi0+
ZGV2LCA1MDApOwoKSWYgdGhpcyBjbG9jayAoYXMgSSB1bmRlcnN0YW5kKSBkb2VzIG5vdCBwcmV2
ZW50IHVzIHRvIGFjY2VzcyB0aGUKcmVnaXN0ZXJzIGJ1dCBvbmx5IGZlZWRzIHRoZSBleHRlcm5h
bCBOQU5EIGJ1cyBwYXJ0LCB0aGVuIHRoZXJlIGlzIG5vCm5lZWQgdG8gZW5hYmxlIGl0IGluIHRo
ZSBwcm9iZSwganVzdCBhY3F1aXJpbmcgaXQgd2lsbCBiZSBlbm91Z2guCgpUaGVuLCB0aGUgZmly
c3QgY2FsbCBmb3IgYW4gSU8gb3BlcmF0aW9uIHdpdGggLT5tdXN0X2FwcGx5X3RpbWluZ3MKc2hv
dWxkOgoKCWlmIChpbXg2KQoJCWRpc2FibGVfY2xrKCk7CgoJY2xrX3NldF9yYXRlKCk7CgoJaWYg
KGlteDYpCgkJZW5hYmxlX2NsaygpOwoKSSBiZWxpZXZlIHRoaXMgc2hvdWxkIGNvdmVyIGl0IGFs
bC4KCj4gLi4uCj4gCj4gSXQgbG9va3MgYSBsaXR0bGUgYml0IHVzZWxlc3MgdG8gZW5hYmxlIHRo
ZSBjbG9ja3MgYW5kIGltbWVkaWF0ZWx5IGRpc2FibGUKPiB0aGVtLiBCdXQgcHJvYmFibHkgdGhp
cyBpcyB0aGUgb25seSB3YXkgdG8gbWFrZSBzdXJlIHRoYXQgY2xvY2tzIGVuYWJsZWQgYnkKPiB0
aGUgYm9vdGxvYWRlciBhcmUgY2VydGFpbmx5IG9mZi4KPiAKPiByZWdhcmRzCj4gQ2hyaXN0aWFu
Cj4gCj4gCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
