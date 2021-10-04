Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909D7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 15:40:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E67561357
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 15:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E67561357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5VY6ZSlQn7RFFYTxIGF7USwPzMniHOFlsfiC0NvugU=; b=IumNCQVmXbTf9w
	MQm/AQN4Di/k4Vh5wvXwkCOmQFnqIlBtvUtY2a6quHxhnJEhq2YNGu7A2gsuRmv69JImkBqI+AlXh
	SaVyZyFUmIsAymbH3h/B3Nbh7fzcD7aIKdzAFqfdoKSj2OsLpKiasHZA8TgZosWFIzgvmrhweMkv6
	Ww1xKINpz7+iBiUZgYCGwd1tXwrkzw2E0vcRhYvRJuCzWK9Qem5uAg6MEitqWrJLRrOfy+gOJmvUQ
	ZSbF4Onrc9nQOa1Y2Py4KGdW62QpzTpS7asGIggKuC7gtGLqh0qZ9UggsR22yfF8gqarHYIOi52cm
	8cp8+FhER1o6IJSdtaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXQ4A-006vwZ-BV; Mon, 04 Oct 2021 15:39:46 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXQ46-006vtq-Mh
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 15:39:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E4078FF817;
 Mon,  4 Oct 2021 15:39:39 +0000 (UTC)
Date: Mon, 4 Oct 2021 17:39:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>
Subject: Re: [RFC PATCH 1/1] mtd: block2mtd: add support for an optional
 custom MTD label
Message-ID: <20211004173938.12dc2d9a@xps13>
In-Reply-To: <87h7e32yhz.fsf@gmail.com>
References: <20210928154937.2668575-1-troglobit@gmail.com>
 <20210928180521.4516405c@xps13> <87h7e32yhz.fsf@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_083943_043563_58C2C913 
X-CRM114-Status: GOOD (  30.07  )
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

SGkgSm9hY2hpbSwKCnRyb2dsb2JpdEBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAyOSBTZXAgMjAy
MSAxNzoyNzoyMCArMDIwMDoKCj4gSGkgTWlxdWVsIQo+IAo+IE9uIFR1ZSwgU2VwIDI4LCAyMDIx
IGF0IDE4OjA1LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKPiA+IEhpIEpvYWNoaW0sCj4gPiB0cm9nbG9iaXRAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwg
MjggU2VwIDIwMjEgMTc6NDk6MzggKzAyMDA6ICAKPiA+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9y
dCBmb3IgYW4gb3B0aW9uYWwgTVREIGxhYmVsIGZvciBtdGQyYmxvY2sgZW11bGF0ZWQKPiA+PiBN
VEQgZGV2aWNlcy4gIFVzZWZ1bCB3aGVuLCBlLmcuIHRlc3RpbmcgZGV2aWNlIGltYWdlcyB1c2lu
ZyBRZW11LiAgVGhlCj4gPj4gZm9sbG93aW5nIC9ldGMvZnN0YWIgbGluZSBpbiBjYW4gdGhlbiBi
ZSB1c2VkIHRvIG1vdW50IGEgZmlsZSBzeXN0ZW0KPiA+PiByZWdhcmRsZXNzIG9mIHRoZSBhY3R1
YWwgTVREIHBhcnRpdGlvbiBudW1iZXI6Cj4gPj4gCj4gPj4gICAgIG10ZDpDb25maWcgIC9tbnQg
ICAgamZmczIgICBub2F0aW1lLG5vZGlyYXRpbWUgICAgICAwICAgIDAKPiA+PiAKPiA+PiBLZXJu
ZWwgY29tbWFuZCBsaW5lIHN5bnRheDoKPiA+PiAKPiA+PiAgICAgYmxvY2sybXRkLmJsb2NrMm10
ZD0vZGV2L3NkYSwsQ29uZmlnCj4gPj4gCj4gPj4gVGhlICcsLCcgaXMgdGhlIG9wdGlvbmFsIGVy
YXNlX3NpemUsIHdoaWNoIGxpa2UgYmVmb3JlIHRoaXMgcGF0Y2gsCj4gPj4gZGVmYXVsdHMgdG8g
UEFHRV9TSVpFIHdoZW4gb21pdHRlZC4gIAo+ID4gV2UgYWxyZWFkeSBoYXZlIGEgbGFiZWwgcHJv
cGVydHkgdGhhdCBjYW4gYmUgYWRkZWQgaW4gdGhlIERULCBpc24ndAo+ID4gaXQgZW5vdWdoPyAg
Cj4gCj4gVW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZywgbm8uICBTb3JyeSBpZiBpZiB0aGUg
ZGVzY3JpcHRpb24gd2FzIGEgYml0Cj4gdW5jbGVhci4gIExldCBtZSB0cnkgZXhwYW5kaW5nIG9u
IGl0IGEgYml0Lgo+IAo+IFRoZSBibG9jazJtdGQgZHJpdmVyIGlzIHVzZWQgYSBsb3Qgd2hlbiBl
bXVsYXRpbmcgcHJvcGVyIE1URHMsIEknbSBzdXJlCj4gd2UgYXJlIG5vdCBhbG9uZSBpbiBidWls
ZGluZyBzeXN0ZW0gaW1hZ2VzIHRoYXQgYSBmbGFzaGVkIHRvIGFuIE1URAo+IGRldmljZSwgd2hp
Y2ggd2Ugd2FudCB0byBiZSBhYmxlIHRvIHRlc3QgaW4gUWVtdSBiZWZvcmUgZGVwbG95aW5nLgo+
IAo+IFNvIHdoYXQgd2UgdHlwaWNhbGx5IGRvIGlzIGhhdmUgYSByZWFkLW9ubHkgcm9vdGZzIChz
cXVhc2hmcykgb24gb25lCj4gcGFydGl0aW9uLCBhbmQgYW5vdGhlciBmb3IgY29uZmlnIGRhdGEg
dGhhdCB1c2VzIG92ZXJsYXlmcyB0byBnZXQgYQo+IHdyaXRhYmxlIC9ldGMsIGZvciBpbnN0YW5j
ZS4gIFRoaXMgaXMgYSByZWR1Y2VkIGV4YW1wbGUsIGFuZCB0aGUgb3JkZXIKPiBvZiBwYXJpdGl0
aW9ucyBzb21ldGltZXMgZGlmZmVyLCBzbyB3ZSB1c2UgcGFyaXRpb24gbGFiZWxzLiBXaGVuIHdl
IHRlc3QKPiBpbiBRZW11IHRoZXJlJ3Mgb25seSB0aGUgYXV0b21hdGljIERUQiBmcm9tIFFlbXUg
aXRzZWxmIHRoYXQncyBpbmplY3RlZCwKPiBlLmcuCj4gCj4gICBxZW11LXN5c3RlbS1hYXJjaDY0
IC1NIHZpcnQgLWNwdSBjb3J0ZXgtYTUzIC1ub2dyYXBoaWMgICAgICAgXAo+IAkta2VybmVsIElt
YWdlIC1pbml0cmQgcm9vdGZzLmltZyAtYXBwZW5kICAgICAgICAgICAgICAgXAo+ICAgICAgICAg
ICAicm9vdD0vZGV2L3JhbSBibG9jazJtdGQuYmxvY2sybXRkPS9kZXYvdmRhIiAgICAgICAgIFwK
PiAgICAgICAgIC1kcml2ZSBmaWxlPWNvbmZpZy5pbWcsaWY9bm9uZSxmb3JtYXQ9cmF3LGlkPWhk
MCAgICAgICBcCj4gICAgICAgICAtZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMAo+
IAo+IFdpdGggdGhlIGRlZmF1bHQgYmxvY2t0Mm10ZCBhcmdzIHdlIGNvbnZlcnQgdGhlIGVtdWxh
dGVkIGRpc2sgdG8gYmUKPiB1c2VkIGFzIGFuIE1URCBwYXJ0aXRpb24sIGJ1dCB0aGUgbmFtZSB3
ZSBnZXQgaW4gTGludXggaXMgbm90IHRoZQo+IG5hbWUgd2UgaGF2ZSBpbiBvdXIgL2V0Yy9mc3Rh
YiBvbiBhIHJlYWwgdGFyZ2V0Lgo+IAo+ICAgIyBjYXQgL3Byb2MvbXRkIAo+ICAgZGV2OiAgICBz
aXplICAgZXJhc2VzaXplICBuYW1lCj4gICBtdGQwOiAwMGYwMDAwMCAwMDAwMTAwMCAiYmxvY2sy
bXRkOiAvZGV2L3ZkYSIKPiAKPiBXaXRoIHRoZSBwYXRjaCB3ZSBjYW4gYWxpZ24gdGhlIHR3byBj
YXNlczsgdGhlIGVtYmVkZGVkIHN5c3RlbSBhbmQgdGhlCj4gZW11bGF0ZWQgb25lLCBieSB1c2lu
ZyB0aGUgc2FtZSBwYXJpdGl0aW9uIGxhYmVsLiAgSS5lLiwgd2l0aCB0aGUgcGF0Y2gKPiBhbmQg
dGhlIG5ldyBhcmd1bWVudCB0byB0aGUga2VybmVsIGNtZGxpbmU6Cj4gCj4gICBxZW11LXN5c3Rl
bS1hYXJjaDY0IC1NIHZpcnQgLWNwdSBjb3J0ZXgtYTUzIC1ub2dyYXBoaWMgICAgICAgXAo+IAkt
a2VybmVsIEltYWdlIC1pbml0cmQgcm9vdGZzLmltZyAtYXBwZW5kICAgICAgICAgICAgICAgXAo+
ICAgICAgICAgICAicm9vdD0vZGV2L3JhbSBibG9jazJtdGQuYmxvY2sybXRkPS9kZXYvdmRhLCxD
b25maWciIFwKPiAgICAgICAgIC1kcml2ZSBmaWxlPWNvbmZpZy5pbWcsaWY9bm9uZSxmb3JtYXQ9
cmF3LGlkPWhkMCAgICAgICBcCj4gICAgICAgICAtZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRy
aXZlPWhkMAo+IAo+IExpbnV4IGdpdmVzIHRoZSBlbXVsYXRlZCBNVEQgdGhlIHNhbWUgcGFydGl0
aW9uIG5hbWUgd2UgdXNlIGluIHRoZQo+IHJlYWwgZW1iZWRkZWQgc3lzdGVtOgo+IAo+ICAgIyBj
YXQgL3Byb2MvbXRkIAo+ICAgZGV2OiAgICBzaXplICAgZXJhc2VzaXplICBuYW1lCj4gICBtdGQw
OiAwMGYwMDAwMCAwMDAwMTAwMCAiQ29uZmlnIgoKSSBkb24ndCBrbm93IHRoaXMgcG9ydGlvbiBv
ZiB0aGUgY29kZSB2ZXJ5IHdlbGwsIGJ1dCBpbmRlZWQgaWYgdGhpcyBpcwpzb21ldGhpbmcgb25s
eSBkZWNsYXJlZCBvbiB0aGUgY21kbGluZSBJIHVuZGVyc3RhbmQgdGhlIHJlcXVlc3QuCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
