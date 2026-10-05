Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E794BCA5FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tj336u9Z2FRUhgB16VrWJB0UDpQcnUe4XOwxYqgoTdI=; b=xiJJLsycZ37Ana
	kBznM2kjNxuPT0LaF5/S/zSKx07AaaNsfAGjRywu7cfWVUP2MwB7YqyF1QIQj4/mhXWu9ikpiFB0S
	QseY8nUlkGl/Fd0BctJgGG0yIHNENIDzKcveF1p0TLWryRTVr9IcssfyF5sxqqAqvnU+qHBMCZAV2
	qHgDTI8m/2MTisloQ26ifpAv7o3toZ7s3UmQglOIaaMrCHN1x18K2869u+fhC+PsF15nVOFTwc0vW
	F82ro0N8PicvpvKxgwM4CD3ycRp23YEGMM35XNRw2gQfuZlRtLV0rYdnr/8CjpZ8ikwlV8JseKbgn
	+OBiL+Uh6HcMJqPtzBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdyl-0000000FsEL-0WCv;
	Mon, 05 Oct 2026 08:23:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdyj-0000000FsE4-1FPI
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 08:23:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D1166022E;
	Mon,  5 Oct 2026 08:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFFB1F00893;
	Mon,  5 Oct 2026 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791188600;
	bh=JXtmNkDO/zngR307i5pw0zwBcB9EHK5hI5rUTmwK4BE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OWy4GupnZgQTGwrkD8RIOQL7DCeuTNOFfU9icdRm7OLmwJ3ziuRjTlb5+IJGNko6M
	 F6CpyrF1S8VhCH1VRnWP/Q1sgg+FfE/C/idCYZXfFQemlk0ZNNQb9w5Z0Q/JpNC8UW
	 pXbQfl/g6rwB7t8TgeK2Ebqj4KYnzUnT+7xNpDz3P8ZWnmWPCmNeyTqh5ZctJK56z0
	 mfHo8+i2VR5C9el/Z/YcBq5pScvVrByf6cYWGw3i+lEv6uAvRouEdbs3xkN8O7WIu+
	 mOGViERr4XwkSMLbmvrZjIfF1RiNCR/nYi/383U0dNZmH94l0qx7KL+My9MSQcNZ0s
	 UTtAgDtzrWVyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] mtd: spi-nor: Add support for panic writes
To: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Paul Cercueil" <paul.cercueil@bootlin.com>, "Mark
 Brown" <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, "Kees Cook" <kees@kernel.org>, "Tanmay
 Jagdale" <tanmay@marvell.com>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261005081141.33688-3-paul.cercueil@bootlin.com>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
 <20261005081141.33688-3-paul.cercueil@bootlin.com>
Date: Mon, 05 Oct 2026 08:23:19 +0000
Message-Id: <20261005082319.7BFFB1F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
aW5maW5pdGUgbG9vcCBpbiBwYW5pYyB3cml0ZSB0aW1lb3V0IHZpYSBqaWZmaWVzCi0gW0hpZ2hd
IG10ZDogc3BpLW5vcjogcGFuaWMgd3JpdGUgaWdub3JlcyBvbmdvaW5nX3BlIGNhdXNpbmcgaGFy
ZHdhcmUgY29uZmxpY3QKLSBbSGlnaF0gbXRkOiBzcGktbm9yOiBzbGVlcCBpbiBhdG9taWMgY29u
dGV4dCBkdXJpbmcgcGFuaWMgd3JpdGUKLS0KCmNvbW1pdCA2ODY2Y2VlMzA0OTA0M2FiOTFkYmYz
YjQ1ZjgyM2E0MDEwYmI5N2NjCkF1dGhvcjogVGFubWF5IEphZ2RhbGUgPHRhbm1heUBtYXJ2ZWxs
LmNvbT4KCm10ZDogc3BpLW5vcjogQWRkIHN1cHBvcnQgZm9yIHBhbmljIHdyaXRlcwoKVGhpcyBj
b21taXQgYWRkcyBzdXBwb3J0IGZvciBwYW5pYyB3cml0ZXMgdG8gdGhlIFNQSSBOT1IgZnJhbWV3
b3JrLiBJdApwbHVtYnMgdGhlIG9vcHNfcGFuaWNfd3JpdGUgZmxhZyB0aHJvdWdoIHRvIHRoZSBT
UEkgY29udHJvbGxlcnMsCmF2b2lkaW5nIG11dGV4ZXMgYW5kIGJsb2NraW5nIGNhbGxzIHdoZW4g
cHJlZW1wdGlvbiBhbmQgSVJRcyBhcmUKZGlzYWJsZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gLS0tIGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
cmUuYwoKWyAuLi4gXQoKPiBAQCAtNzI5LDcgKzczOCwxMCBAQCBzdGF0aWMgaW50IHNwaV9ub3Jf
d2FpdF90aWxsX3JlYWR5X3dpdGhfdGltZW91dChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+ICAJCWlm
IChyZXQpCj4gIAkJCXJldHVybiAwOwo+ICAKPiAtCQljb25kX3Jlc2NoZWQoKTsKPiArCQlpZiAo
bm9yLT5tdGQub29wc19wYW5pY193cml0ZSkKPiArCQkJY3B1X3JlbGF4KCk7CgpbU2V2ZXJpdHk6
IEhpZ2hdCkluIHNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5X3dpdGhfdGltZW91dCgpLCB0aGUgbG9v
cCBjb25kaXRpb24gcmVsaWVzIG9uOgoKaWYgKHRpbWVfYWZ0ZXJfZXEoamlmZmllcywgZGVhZGxp
bmUpKQoKU2luY2UgamlmZmllcyBkb2VzIG5vdCBhZHZhbmNlIGluIGEgcGFuaWMgY29udGV4dCBi
ZWNhdXNlIGxvY2FsIElSUXMgYXJlCmRpc2FibGVkLCBkb2VzIHRoaXMgbWVhbiB0aGUgc3lzdGVt
IHdpbGwgaGFuZyBpbmRlZmluaXRlbHkgZHVyaW5nIGEgcGFuaWMKaWYgdGhlIGZsYXNoIGNoaXAg
dGFrZXMgdGltZSB0byBjb21wbGV0ZSBvciBiZWNvbWVzIHVucmVzcG9uc2l2ZT8KCj4gKwkJZWxz
ZQo+ICsJCQljb25kX3Jlc2NoZWQoKTsKPiAgCX0KClsgLi4uIF0KCj4gQEAgLTMzOTMsNiArMzQy
OSwyNiBAQCBzdGF0aWMgdm9pZCBzcGlfbm9yX3NvZnRfcmVzZXQoc3RydWN0IHNwaV9ub3IgKm5v
cikKPiAgCXVzbGVlcF9yYW5nZShTUElfTk9SX1NSU1RfU0xFRVBfTUlOLCBTUElfTk9SX1NSU1Rf
U0xFRVBfTUFYKTsKPiAgfQo+ICAKPiArc3RhdGljIGludCBzcGlfbm9yX3BhbmljX3dyaXRlKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sCj4gKwkJCSAgICAgICBz
aXplX3QgKnJldGxlbiwgY29uc3QgdV9jaGFyICpidWYpCj4gK3sKPiArCXN0cnVjdCBzcGlfbm9y
ICpub3IgPSBtdGRfdG9fc3BpX25vcihtdGQpOwo+ICsKPiArCS8qCj4gKwkgKiBBdCB0aGlzIHBv
aW50IHByZWVtcHRpb24gYW5kIGxvY2FsIGludGVycnVwdHMgYXJlIGRpc2FibGVkLCBzbyB3ZQo+
ICsJICogY2FuJ3QgZ2V0IHRoZSBsb2NrIGlmIGl0J3MgdGFrZW4uCj4gKwkgKi8KPiArCWlmICht
dXRleF9pc19sb2NrZWQoJm5vci0+bG9jaykpCj4gKwkJcmV0dXJuIC1FUEVSTTsKPiArCj4gKwlp
ZiAoc3BpX25vcl91c2VfcGFyYWxsZWxfbG9ja2luZyhub3IpICYmCj4gKwkgICAgKG5vci0+cnd3
Lm9uZ29pbmdfaW8gfHwgbm9yLT5yd3cub25nb2luZ19yZCkpIHsKPiArCQlyZXR1cm4gLUVQRVJN
Owo+ICsJfQoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgb21pdCBjaGVja2luZyBub3ItPnJ3
dy5vbmdvaW5nX3BlPwoKSWYgYSBwYW5pYyBvY2N1cnMgd2hpbGUgYSBsb25nLXJ1bm5pbmcgZXJh
c2Ugb3IgcHJvZ3JhbSBvcGVyYXRpb24gaXMgaW4KcHJvZ3Jlc3MsIG9uZ29pbmdfcGUgd2lsbCBi
ZSB0cnVlLiBJZiB0aGUgbG9jayB3YXMgcmVsZWFzZWQgZHVyaW5nIHRoZQpwYXJhbGxlbCBoYXJk
d2FyZSBvcGVyYXRpb24sIHRoZSBwYW5pYyB3cml0ZSBtaWdodCBwcm9jZWVkIGFuZCBzZW5kIHdy
aXRlCmNvbW1hbmRzIHdoaWxlIHRoZSBoYXJkd2FyZSB3cml0ZSBpbiBwcm9ncmVzcyBiaXQgaXMg
c2V0LgoKVGhlIGhhcmR3YXJlIHdpbGwgaWdub3JlIHRoZSBjb21tYW5kcywgYnV0IHRoZSBzb2Z0
d2FyZSB3aWxsIGxvb3AgaW4Kc3BpX25vcl93YWl0X3RpbGxfcmVhZHkoKSB1bnRpbCB0aGUgb3Jp
Z2luYWwgb3BlcmF0aW9uIGZpbmlzaGVzLCBpbmNvcnJlY3RseQphc3N1bWluZyB0aGUgcGFuaWMg
ZHVtcCB3YXMgc3VjY2Vzc2Z1bGx5IHdyaXR0ZW4uCgo+ICsKPiArCXJldHVybiBzcGlfbm9yX3dy
aXRlKG10ZCwgdG8sIGxlbiwgcmV0bGVuLCBidWYpOwoKW1NldmVyaXR5OiBIaWdoXQpDYW4gdGhp
cyBzZXF1ZW5jZSBsZWFkIHRvIGEgc2xlZXAtaW4tYXRvbWljIGJ1Zz8KCnNwaV9ub3Jfd3JpdGUo
KSBjYW4gY2FsbCBkb3duIHRvIHNwaV9ub3Jfb2N0YWxfZHRyX3dyaXRlKCkgd2hpY2ggZG9lcyBh
CnNsZWVwYWJsZSBtZW1vcnkgYWxsb2NhdGlvbiB3aGVuIHVuYWxpZ25lZCBhZGRyZXNzZXMgYXJl
IHBhc3NlZDoKCnRtcF9idWYgPSBrbWFsbG9jKG5vci0+cGFyYW1zLT5wYWdlX3NpemUsIEdGUF9L
RVJORUwpOwoKQWRkaXRpb25hbGx5LCB0aGUgd3JpdGUgZXZlbnR1YWxseSByZWFjaGVzIHNwaV9t
ZW1fZXhlY19vcCgpIGFuZCB0aGVuCnNwaV9tZW1fYWNjZXNzX3N0YXJ0KCksIHdoaWNoIHVuY29u
ZGl0aW9uYWxseSB0YWtlcyBtdXRleGVzOgoKbXV0ZXhfbG9jaygmY3Rsci0+YnVzX2xvY2tfbXV0
ZXgpOwptdXRleF9sb2NrKCZjdGxyLT5pb19tdXRleCk7CgpTaW5jZSBtdGQtPl9wYW5pY193cml0
ZSBvcGVyYXRlcyB3aXRoIGxvY2FsIElSUXMgYW5kIHByZWVtcHRpb24gZGlzYWJsZWQsCndvdWxk
IHRoZXNlIHBhdGhzIGNhdXNlIGEgcmVjdXJzaXZlIHBhbmljIGFuZCBjb21wbGV0ZWx5IGhhbHQg
dGhlIGNyYXNoCmR1bXAgcHJvY2Vzcz8KCj4gK30KPiArCj4gIC8qIG10ZCBzdXNwZW5kIGhhbmRs
ZXIgKi8KPiAgc3RhdGljIGludCBzcGlfbm9yX3N1c3BlbmQoc3RydWN0IG10ZF9pbmZvICptdGQp
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYxMDA1MDgxMTQxLjMzNjg4LTEtcGF1bC5jZXJjdWVpbEBib290bGluLmNvbT9wYXJ0PTIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
