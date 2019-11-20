Return-Path: <SRS0=AqdO=ZM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEF2C432C0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2019 09:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F4E2243F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2019 09:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pjH42HI9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F4E2243F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X68i2Eo5QutgExgUexMpk6CprJeLn6RK+HahfyemiS8=; b=pjH42HI9JX1NBY
	GnOKbI4SEZJDEhD5WXnpicsmyCoeJ300kjXo2lXkJTK2AtW9TRnjzZXQFKmQkHzEXVMOT+HHtOWS6
	w2GE2IrrDzG9Fn/YWaH0M0goZwaEE3bPTiUA7cRPBoI8YCdmDFCL7v66DYb+m7Tgutdd5Xrv3SKx6
	HizotXiis8DNnxhi70G2GMh1vEC+RB1x8b3mZCXMCTE9xm9DEffSfCb2Jb/4ig4ERKaqCcbQJH0Va
	excRK8iSZx2dJ7MHUX3MAW844HWfHyk7K8Yur/xfzkDbVZsvYyAeXBB++lJrJbbkFpzn+xnTUSABt
	e6/+NjXQ1agICAq4EekQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXLu7-0000Rh-7F; Wed, 20 Nov 2019 09:04:03 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXLu3-0000Q8-OH
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2019 09:04:01 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-1-2154-102.w90-76.abo.wanadoo.fr [90.76.211.102])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 54F251C0016;
 Wed, 20 Nov 2019 09:03:46 +0000 (UTC)
Date: Wed, 20 Nov 2019 10:03:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] {tty: serial, nand: onenand}: samsung: rename to fix
 build warning
Message-ID: <20191120100345.038dd232@xps13>
In-Reply-To: <20191118194010.GA606660@kroah.com>
References: <20191117202435.28127-1-sudipm.mukherjee@gmail.com>
 <20191118114657.GA228826@kroah.com>
 <1505628642.90849.1574081270290.JavaMail.zimbra@nod.at>
 <20191118202257.6cfd1a7e@xps13>
 <884028732.91086.1574105504462.JavaMail.zimbra@nod.at>
 <20191118194010.GA606660@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_010359_924364_A182C5F1 
X-CRM114-Status: GOOD (  20.72  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-serial <linux-serial@vger.kernel.org>, Jiri Slaby <jslaby@suse.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3JlZywKCkdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
IHdyb3RlIG9uIE1vbiwgMTggTm92CjIwMTkgMjA6NDA6MTAgKzAxMDA6Cgo+IE9uIE1vbiwgTm92
IDE4LCAyMDE5IGF0IDA4OjMxOjQ0UE0gKzAxMDAsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToK
PiA+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0gIAo+ID4gPiBWb246ICJNaXF1ZWwg
UmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ID4gQW46ICJyaWNoYXJkIiA8
cmljaGFyZEBub2QuYXQ+Cj4gPiA+IENDOiAiR3JlZyBLcm9haC1IYXJ0bWFuIiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+LCAiU3VkaXAgTXVraGVyamVlIiA8c3VkaXBtLm11a2hlcmplZUBn
bWFpbC5jb20+LCAiS3l1bmdtaW4gUGFyayIKPiA+ID4gPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5j
b20+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJKaXJpIFNsYWJ5
IiA8anNsYWJ5QHN1c2UuY29tPiwgImxpbnV4LWtlcm5lbCIKPiA+ID4gPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmc+LCAibGludXgtc2VyaWFsIgo+ID4gPiA8bGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZz4K
PiA+ID4gR2VzZW5kZXQ6IE1vbnRhZywgMTguIE5vdmVtYmVyIDIwMTkgMjA6MjI6NTcKPiA+ID4g
QmV0cmVmZjogUmU6IFtQQVRDSCB2Ml0ge3R0eTogc2VyaWFsLCBuYW5kOiBvbmVuYW5kfTogc2Ft
c3VuZzogcmVuYW1lIHRvIGZpeCBidWlsZCB3YXJuaW5nICAKPiA+ICAgCj4gPiA+IEhpIGFsbCwK
PiA+ID4gCj4gPiA+IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlIG9u
IE1vbiwgMTggTm92IDIwMTkgMTM6NDc6NTAKPiA+ID4gKzAxMDAgKENFVCk6Cj4gPiA+ICAgCj4g
PiA+PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tICAKPiA+ID4+ID4+IEkgd2FzIG5v
dCBzdXJlIGlmIHRoaXMgc2hvdWxkIGhhdmUgYmVlbiB0d28gZGlmZmVyZW50IHBhdGNoLCBidXQg
c2luY2UKPiA+ID4+ID4+IHRoaXMgd2lsbCBiZSBmaXhpbmcgdGhlIHNhbWUgcHJvYmxlbSBzbyBp
dCBzZWVtcyBpdHMgYmV0dGVyIHRvIGhhdmUgdGhlbQo+ID4gPj4gPj4gaW4gYSBzaW5nbGUgcGF0
Y2guCj4gPiA+PiA+PiAKPiA+ID4+ID4+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4+ID4+ICBkcml2ZXJzL210ZC9uYW5k
L29uZW5hbmQve3NhbXN1bmcuYyA9PiBzYW1zdW5nX210ZC5jfSB8IDAKPiA+ID4+ID4+ICBkcml2
ZXJzL3R0eS9zZXJpYWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
PiA+ID4+ID4+ICBkcml2ZXJzL3R0eS9zZXJpYWwve3NhbXN1bmcuYyA9PiBzYW1zdW5nX3R0eS5j
fSAgICAgICB8IDAKPiA+ID4+ID4+ICA0IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+ID4+ID4+ICByZW5hbWUgZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5k
L3tzYW1zdW5nLmMgPT4gc2Ftc3VuZ19tdGQuY30gKDEwMCUpCj4gPiA+PiA+PiAgcmVuYW1lIGRy
aXZlcnMvdHR5L3NlcmlhbC97c2Ftc3VuZy5jID0+IHNhbXN1bmdfdHR5LmN9ICgxMDAlKSAgCj4g
PiA+PiA+IAo+ID4gPj4gPiBJIGNhbiB0YWtlIHRoaXMgaW4gdGhlIHR0eSB0cmVlIGlmIHRoZSBt
dGQgbWFpbnRhaW5lciBnaXZlcyBhbiBhY2sgZm9yCj4gPiA+PiA+IGl0Li4uICAKPiA+ID4+IAo+
ID4gPj4gQWNrZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+ICAKPiA+
ID4gCj4gPiA+IElmIGl0IGlzIG5vdCB0b28gbGF0ZSwgSSBhbSBub3QgYSBiaWcgZmFuIG9mIHRo
ZSBuZXcgbmFtaW5nIHdoaWNoIGlzCj4gPiA+IHJhdGhlciBub3QgZGVzY3JpcHRpdmUuIEZpbGVz
IGluIHRoZSBvbmVuYW5kIHN1YmRpcmVjdG9yeSBhcmU6Cj4gPiA+ICogb25lbmFuZF88c29tZXRo
aW5nPi5jIGZvciB0aGUgYmFzZSBmaWxlcwo+ID4gPiAqIDx2ZW5kb3I+LmMgZm9yIHRoZSB2ZW5k
b3JzIGZpbGVzIChjdXJyZW50bHk6IG9tYXAyLmMgYW5kIHNhbXN1bmcuYykuICAKPiA+IAo+ID4g
V2VsbCwgSSdtIGZpbmUgd2l0aCB0aGUgbmFtaW5nIGVpdGhlciB3YXkuIDotKSAgCj4gCj4gSWYg
eW91IHdhbnQgdG8gcmVuYW1lIHRoZSBtdGQgZHJpdmVyIGxhdGVyLCB0aGF0J3MgZmluZSwgSSds
bCB0YWtlIHRoaXMKPiBmb3Igbm93IGZvciA1LjUtcmMxIGFuZCB5b3UgYWxsIGNhbiBiaWtlc2hl
ZCBpdCBmb3IgNS41LWZpbmFsIDopCgpMZXQncyBub3QgcmVuYW1lIGl0IHR3aWNlLCBpZiBub2Jv
ZHkgd2FudCdzIGFub3RoZXIgbmFtaW5nIEknbSBmaW5lCndpdGggdGhpcyBvbmUuCgpBY2tlZC1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCkNoZWVycyEKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
