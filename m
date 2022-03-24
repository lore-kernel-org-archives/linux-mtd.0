Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC76C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Mar 2022 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIVLkL+eNqGqcjtm/FfAL3gaFNz13kHf0qtR6RvY5EI=; b=WGC5SLITAdfVKr
	p0m/75VeAwfrILem9t0GtMQlGj28x8tvXISJclxZjZsQezWjeHT/gG74KTD3OYfN2n1umCgoj1ehL
	n2sAVFowvug9z9Um8amL7QLkdlFY6TC6lsQIW2rKU9xfQ+xe/AeGskAbgVqSuasLZrQ0fw5fJIJk6
	y48KDSmVT5uba3JFzFZkPCpYnuFE08xDyf2/lZ/kqzV63cJXi+VOVrz1FmKiZewc/D30XDQk+6dr1
	60BCjHkyw+0WOgtTvheQuzsbaH5nEGCZ2d54WHbdVWyYmmQK1hTsGsUNxxQDCUHWcx7habgUdXQG4
	a15TocTUHyeKthwloNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXOOp-00GsIM-Cc; Thu, 24 Mar 2022 14:25:15 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXONr-00GrvA-Ta
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2022 14:24:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CB60E4000B;
 Thu, 24 Mar 2022 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648131852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RTV4bfp7EjlzxDpvhNMs/hKWBVvuwoJhnJhw1R8c7M=;
 b=bfKi3OG7gVNzS8RFx9kdp7IjJNFmKX4DnQatCL04cnFA1pgFR8nSochUta2pwht3vnh8E0
 CXfUBMR90BCk3Q6VaKbpVl+VjSOLXlYQRvGn8G+Jw923Ck76NnpyuumBavG8esKTA9bkk1
 G/VNi2NqNMaZTwIxQRK1epL0EYJhshO9EYi5lNCrT0GThEC6BaMXFckbIef1geNLz/2Hh3
 l/8koqQ9xMAjuAuS2TfFINDAoobVTAvbRhMCz78jnrdvVtqsDoYhjtFGB+rAw2ZfFk2KFO
 uP4Zw5LLZfDp0X1l8TcrTIH4pb4HzsN5Tj7uP+39uc6NNjfX6MdUwCnSUmHC+w==
Date: Thu, 24 Mar 2022 15:24:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Han Xu <han.xu@nxp.com>, sbabic@denx.de, frieder.schrempf@kontron.de,
 festevam@gmail.com, ye.li@nxp.com, peng.fan@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: raw: gpmi: fix bch geometry settings issue
Message-ID: <20220324152409.34ef32cc@xps13>
In-Reply-To: <20220324114801.xrniakorpzns3wk6@Seans-MBP.hinnerup>
References: <20220321202028.29017-1-han.xu@nxp.com>
 <20220324114801.xrniakorpzns3wk6@Seans-MBP.hinnerup>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_072416_314284_C032616A 
X-CRM114-Status: GOOD (  25.98  )
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

SGkgSGFuLAoKc2VhbkBnZWFuaXguY29tIHdyb3RlIG9uIFRodSwgMjQgTWFyIDIwMjIgMTI6NDg6
MDEgKzAxMDA6Cgo+IEhpIEhhbiwKPiAKPiBPbiBNb24sIE1hciAyMSwgMjAyMiBhdCAwMzoyMDoy
OFBNIC0wNTAwLCBIYW4gWHUgd3JvdGU6Cj4gPiBUaGUgY29kZSBjaGFuZ2UgZml4ZWQgdGhlIGtl
cm5lbCBncG1pIGRyaXZlciBiY2ggZ2VvbWV0cnkgc2V0dGluZ3Mgbm90Cj4gPiBhbGlnbmVkIHdp
dGggdS1ib290IHNldHRpbmdzIGlzc3VlLiBGb3IgdGhlIGJhY2t3YXJkIGNvbXBhdGliaWxpdHks
IGl0Cj4gPiBzdGlsbCBrZWVwcyB0aGUgbGVnYWN5IGJjaCBzZXR0aW5nIGFzIGRlZmF1bHQuIFVz
ZXJzIG1heSBjaG9vc2UgdG8gdXNlCj4gPiBjaGlwcyByZXF1aXJlZCBtaW5pbXVtIGVjYyBzdHJl
bmd0aCBieSBEVCBmbGFnICJmc2wsdXNlLW1pbmltdW0tZWNjIi4KPiA+IEl0IGFsc28gcHJvcG9z
ZXMgYSBuZXcgd2F5IHRvIHNldCBiY2ggZ2VvbWV0cnkgZm9yIGxhcmdlIG9vYiBOQU5ELgo+ID4g
Cj4gPiAtIEZvciB0aGUgbGVnYWN5IGJjaCBnZW9tZXRyeSBzZXR0aW5ncwo+ID4gVGhlIGRyaXZl
ciB1c2VzIGxlZ2FjeSBiY2ggZ2VvbWV0cnkgc2V0dGluZ3MgYnkgZGVmYXVsdCwgaWYgdGhlIE5B
TkQKPiA+IGNoaXBzIG9vYiBzaXplIGlzIGxlc3MgdGhhbiAxS0IuIFRoZSBsZWdhY3lfc2V0X2dl
b21ldHJ5KCkgc2V0cyB0aGUgZGF0YQo+ID4gY2h1bmsgc2l6ZShzdGVwX3NpemUpIGxhcmdlciB0
aGFuIG9vYiBzaXplIHRvIG1ha2Ugc3VyZSBCQk0gbG9jYXRlcyBpbgo+ID4gZGF0YSBjaHVuaywg
dGhlbiBzZXQgdGhlIG1heGltdW0gZWNjIHN0ZW5ndGggb29iIGNhbiBob2xkLiBJdCBhbHdheXMg
dXNlCj4gPiB1bmJhbGFuY2VkIEVDQyBsYXlvdXQsIHdoaWNoIGVjYzAgd2lsbCBjb3ZlciBib3Ro
IG1ldGEgYW5kIGRhdGEwIGNodW5rLgo+ID4gCj4gPiAtIEZvciB0aGUgbGFyZ2Ugb29iIGJjaCBn
ZW9tZXRyeSBzZXR0aW5ncwo+ID4gVGhpcyB0eXBlIG9mIHNldHRpbmcgd2lsbCBiZSB1c2VkIGZv
ciBOQU5EIGNoaXBzIHRoYXQgb29iIHNpemUgaXMKPiA+IGxhcmdlciB0aGFuIDFLQiwgdGhlIGdl
bmVyYWwgaWRlYSBpcywKPiA+IAo+ID4gICAgIDEuVHJ5IGFsbCBFQ0Mgc3RyZW5ndGggZnJvbSB0
aGUgbWluaW11bSB2YWx1ZSByZXF1aXJlZCBieSBOQU5EIGNoaXAKPiA+ICAgICAgIHRvIHRoZSBt
YXhpbXVtIG9uZSB0aGF0IHdvcmtzLCBhbnkgRUNDIG1ha2VzIHRoZSBCQk0gbG9jYXRlIGluCj4g
PiAgICAgICBkYXRhIGNodW5rIGNhbiBiZSBlbGlnaWJsZS4KPiA+IAo+ID4gICAgIDIuSWYgbm9u
ZSBvZiB0aGVtIHdvcmtzLCB1c2luZyBzZXBhcmF0ZSBFQ0MgZm9yIG1ldGEsIHdoaWNoIHdpbGwg
YWRkCj4gPiAgICAgICBvbmUgZXh0cmEgZWNjIHdpdGggdGhlIHNhbWUgRUNDIHN0cmVuZ3RoIGFz
IG90aGVyIGRhdGEgY2h1bmtzLgo+ID4gICAgICAgVGhpcyBleHRyYSBFQ0MgY2FuIGd1YXJhbnRl
ZSBCQk0gbG9jYXRlZCBpbiBkYXRhIGNodW5rLCBhbHNvIHdlCj4gPiAgICAgICBuZWVkIHRvIGNo
ZWNrIGlmIG9vYiBjYW4gYWZmb3JkIGl0Lgo+ID4gCj4gPiAtIEZvciBhbGwgb3RoZXIgY2FzZXMK
PiA+IHNldCB0aGUgYmNoIGdlb21ldHJ5IGJ5IGNoaXAgcmVxdWlyZWQgc3RyZW5ndGggYW5kIHN0
ZXAgc2l6ZSwgd2hpY2ggdXNlcwo+ID4gdGhlIG1pbmltdW0gZWNjIHN0cmVuZ3RoIGNoaXAgcmVx
dWlyZWQuIEl0IGNhbiBiZSBleHBsaWNpdGx5IGVuYWJsZWQgYnkKPiA+IERUIGZsYWcgImZzbCx1
c2UtbWluaW11bS1lY2MiLCBidXQgbmVlZCB0byBiZSBlbi9kaXNhYmxlZCBpbiBib3RoIHUtYm9v
dAo+ID4gYW5kIGtlcm5lbCBhdCB0aGUgc2FtZSB0aW1lLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBIYW4gWHUgPGhhbi54dUBueHAuY29tPiAgCj4gVGVzdGVkLWJ5OiBTZWFuIE55ZWtqYWVyIDxz
ZWFuQGdlYW5peC5jb20+Cj4gCj4gPiAtLS0gIAo+IAo+IFsgLi4uIF0KPiAKPiBGcm9tIG15IHNp
ZGUgaXQncyBsb29raW5nIGdvb2QuIEkgaGF2ZSB0ZXN0ZWQgdGhpcyBpbiBsZWdhY3kgbW9kZSBh
bmQgaXQKPiBrZWVwcyBmdW5jdGlvbmluZy4KPiAKPiBTaW5jZSB0aGlzIGludHJvZHVjZXMgMiBj
aGFuZ2VzIG1heWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBzZXBlcmF0ZSB0aGUKPiBjaGFuZ2Vz
IGludG8gMiBwYXRjaGVzPwoKWWVhaCBJIHdhcyBhYm91dCB0byBhc2sgZm9yIGl0IGFzIHdlbGwu
CgpBbmQgcGxlYXNlIHVzZSAibXRkOiByYXduYW5kOiBncG1pOiIgYXMgcHJlZml4LgoKPiAKPiBU
aGFua3MgZm9yIGZpbmFsbHkgZml4aW5nIHRoZSBMaW51eCB2cy4gVS1ib290IHVuYWxpZ25tZW50
Lgo+IAo+IC9TZWFuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
