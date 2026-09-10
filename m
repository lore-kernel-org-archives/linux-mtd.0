Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AEEC79FBF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEdavyrGofQplZo4AvE50eZ2vWFMcYXGMeW1Qtc/EYc=; b=OZhl9cjE2vir4o
	9hq5sUNWqSIJXI1il/pMTvP5Gk1J4V313MdP6TYXG4St8eN/1VeGrg3hSxrjWjp7f4CpH/mMnfDXy
	984uSuDpcaQTv5+eFkAJJZvan/uo2CoUFF3NO9m6ec9Ei4GqRWXWMXZUKNsJqv3U3DDMc1Zf2SQNk
	5Q+PubCQWDJ/KJvFARTBDzo4+PbmUnKxpNZ4pYrvbwzHSCi8YCdq4r22vILgP+UnKQ3/kkXCLy0RG
	Bpc51fhIga0e5xKo3YJ5ckdBOuIfx9wxf3fnnWiMkGtvv6nVp4TPLupoTbRdOaS59i46aREPf6i3t
	8Zt5Vza3M5EJnHsXJQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k1m-0000000FE1j-3tR1;
	Thu, 10 Sep 2026 19:01:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k1l-0000000FE1Y-0o0a
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 19:01:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B68E6025B;
	Thu, 10 Sep 2026 19:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6231F000FF;
	Thu, 10 Sep 2026 19:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066900;
	bh=o/aJgC7/v4Ab0Ev6JyLQT1mN8r2uNaekGe8w0Q8Fi4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9kDcbfrBDWRVngAIGGKwdtDSajfbjWd5JjJtsPDjlQZxCUNjMzw01/5bP9X80uKF
	 lHzIUUriCuZerdqhq/yVaYD76SA2MC8dTZGLC/gqIK6nc+xYROXN6vI3a6nd13UkuI
	 mTzSCpnC6FiOa6PoTKWU0gn+yeVP5z8j90WI77F4LAB3lxIdpGGGtLqB7YSiBH/v1e
	 S1vhNjaH0rPBcQYtlEnQisISaxXMp5wiG1AeOlUlyau57RDlln7Sd5w2XfCI4HhVZP
	 zUbSIehwFt0tJXxIpFHQrB1ePpaL3CyzUui++f405FmO3J8p8GikOB6wpOiaxKzFj1
	 0JDwNz23IO70A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: take the flash lock in
 spi_nor_shutdown()
To: mwalle@kernel.org, "Itai Handler" <itai.handler@gmail.com>, pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org, takahiro.kuwano@infineon.com, richard@nod.at, stable@vger.kernel.org, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, vigneshr@ti.com
In-Reply-To: <20260910184452.895485-2-itai.handler@gmail.com>
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-2-itai.handler@gmail.com>
Date: Thu, 10 Sep 2026 19:01:39 +0000
Message-Id: <20260910190139.BF6231F000FF@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBV
bnNhZmUgS2lsbGFibGUgV2FpdCBpbiBTaHV0ZG93bi9SZW1vdmUgc2tpcHMgaGFyZHdhcmUgcmVz
dG9yYXRpb24KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0NyaXRpY2FsXSBSYWNlIGNvbmRpdGlv
biBsZWFkaW5nIHRvIGRhdGEgY29ycnVwdGlvbiBhZnRlciBzaHV0ZG93biByZXN0b3JlCi0gW0hp
Z2hdIFJlc291cmNlIGxlYWsgaW4gbG9ja2luZyBoZWxwZXJzIG9uIGZhdGFsIHNpZ25hbCBpbnRl
cnJ1cHRpb24KLS0KCmNvbW1pdCA3ZDdiMDMyZDYzY2U5YjQwMDlmN2Q4ODZlODIxMjYxZDI5ZmI3
YzJhCkF1dGhvcjogSXRhaSBIYW5kbGVyIDxpdGFpLmhhbmRsZXJAZ21haWwuY29tPgoKbXRkOiBz
cGktbm9yOiB0YWtlIHRoZSBmbGFzaCBsb2NrIGluIHNwaV9ub3Jfc2h1dGRvd24oKQoKVGhpcyBj
b21taXQgbW9kaWZpZXMgc3BpX25vcl9zaHV0ZG93bigpIHRvIGFjcXVpcmUgdGhlIGRldmljZSBs
b2NrIGJlZm9yZQpyZXN0b3JpbmcgdGhlIGZsYXNoIGFkZHJlc3NpbmcgbW9kZS4gVGhpcyBzZXJp
YWxpemVzIHRoZSByZXN0b3JlIG9wZXJhdGlvbgphZ2FpbnN0IG9wZXJhdGlvbnMgYWxyZWFkeSBp
biBmbGlnaHQgZHVyaW5nIHN5c3RlbSBzaHV0ZG93bi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBpbmRleCBj
Y2Y0Mzk2Y2RjZDA0Li45NmRkNmFlNmQ2MTkxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBAQCAtMzg2
Miw4ICszODYyLDIxIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9yZW1vdmUoc3RydWN0IHNwaV9tZW0g
KnNwaW1lbSkKPiAgc3RhdGljIHZvaWQgc3BpX25vcl9zaHV0ZG93bihzdHJ1Y3Qgc3BpX21lbSAq
c3BpbWVtKQo+ICB7Cj4gIAlzdHJ1Y3Qgc3BpX25vciAqbm9yID0gc3BpX21lbV9nZXRfZHJ2ZGF0
YShzcGltZW0pOwo+ICsJaW50IHJldDsKPiArCj4gKwkvKgo+ICsJICogV2FpdCBmb3IgYW4gb3Bl
cmF0aW9uIHN0YXJ0ZWQgYnkgYW5vdGhlciB0aHJlYWQgdG8gZmluaXNoLgo+ICsJICogZGV2aWNl
X3NodXRkb3duKCkgcnVucyB3aXRoIE1URCB1c2VycyBzdGlsbCBhY3RpdmU6IGEgYnVzeSBmbGFz
aAo+ICsJICogaWdub3JlcyB0aGUgY29tbWFuZHMgc3BpX25vcl9yZXN0b3JlKCkgaXNzdWVzLCBs
ZWF2aW5nIGl0IGluCj4gKwkgKiA0LWJ5dGUgYWRkcmVzcyBtb2RlLCBhbmQgYSByZXN0b3JlIGxh
bmRpbmcgbWlkLXJlYWQgY2hhbmdlcyB0aGUKPiArCSAqIGNoaXAncyBhZGRyZXNzIHdpZHRoIHVu
ZGVyIHRoZSB0cmFuc2Zlci4KPiArCSAqLwo+ICsJcmV0ID0gc3BpX25vcl9wcmVwX2FuZF9sb2Nr
KG5vcik7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1
dCBkb2VzIHNwaV9ub3JfcHJlcF9hbmRfbG9jaygpIGxlYWsgZGV2aWNlCnByZXBhcmF0aW9uIHJl
c291cmNlcyBpZiBpbnRlcnJ1cHRlZCBieSBhIGZhdGFsIHNpZ25hbD8KCklmIGEgcHJvY2VzcyBp
cyBraWxsZWQgd2hpbGUgd2FpdGluZyBvbiB3YWl0X2V2ZW50X2tpbGxhYmxlKCkgaW5zaWRlCnNw
aV9ub3JfcHJlcF9hbmRfbG9jaygpLCBpdCByZXR1cm5zIC1FUkVTVEFSVFNZUyBidXQgZmFpbHMg
dG8gaW52b2tlCnNwaV9ub3JfdW5wcmVwKCkgdG8gcm9sbCBiYWNrIHRoZSBlYXJsaWVyIHNwaV9u
b3JfcHJlcCgpIGNhbGwuIERvZXMgdGhpcwphbHNvIGFwcGx5IHRvIHRoZSBvdGhlciBsb2NraW5n
IGhlbHBlcnMgbGlrZSBzcGlfbm9yX3ByZXBfYW5kX2xvY2tfcGUoKSBhbmQKc3BpX25vcl9wcmVw
X2FuZF9sb2NrX3JkKCk/Cgo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm47CgpbU2V2ZXJpdHk6IEhp
Z2hdCklmIGEgZmF0YWwgc2lnbmFsIGlzIHBlbmRpbmcgZHVyaW5nIHRoZSByZWJvb3QgcHJvY2Vz
cywgc3VjaCBhcyBmcm9tIHRoZSBPT00Ka2lsbGVyIG9yIGEgbWFudWFsIFNJR0tJTEwsIHdhaXRf
ZXZlbnRfa2lsbGFibGUoKSBpbiBzcGlfbm9yX3ByZXBfYW5kX2xvY2soKQp3aWxsIGltbWVkaWF0
ZWx5IHJldHVybiAtRVJFU1RBUlRTWVMuCgpXaWxsIHRoaXMgZWFybHkgcmV0dXJuIHNraXAgdGhl
IHNwaV9ub3JfcmVzdG9yZSgpIGhhcmR3YXJlIHN0YXRlIHJlc2V0PyBTaW5jZQp0aGlzIHNraXBz
IHJlc3RvcmluZyB0aGUgMy1ieXRlIGFkZHJlc3NpbmcgbW9kZSwgY291bGQgdGhlIGJvb3Rsb2Fk
ZXIgcmVhZApnYXJiYWdlIG9uIHRoZSBuZXh0IGJvb3QsIGxlYXZpbmcgdGhlIGRldmljZSB1bmJv
b3RhYmxlIHVudGlsIGEgcG93ZXIgY3ljbGU/Cgo+ICAKPiAgCXNwaV9ub3JfcmVzdG9yZShub3Ip
Owo+ICsJc3BpX25vcl91bmxvY2tfYW5kX3VucHJlcChub3IpOwoKW1NldmVyaXR5OiBDcml0aWNh
bF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGNvdWxkIHJlbGVhc2luZyB0aGUg
bG9jayB3aGlsZSB0aGUgTVRECmRldmljZSByZW1haW5zIGFjdGl2ZSBleHBvc2UgdGhlIGZsYXNo
J3MgbW9kaWZpZWQgMy1ieXRlIGFkZHJlc3Npbmcgc3RhdGUKdG8gY29uY3VycmVudCBvcGVyYXRp
b25zPwoKSWYgYSBjb25jdXJyZW50IHRocmVhZCBhY3F1aXJlcyB0aGUgbG9jayBpbW1lZGlhdGVs
eSBhZnRlciBzcGlfbm9yX3NodXRkb3duKCkKZmluaXNoZXMgYW5kIGlzc3VlcyBhIHdyaXRlIGNv
bW1hbmQsIHRoZSBkcml2ZXIgd2lsbCBhc3N1bWUgNC1ieXRlIG1vZGUKYW5kIHNlbmQgNCBhZGRy
ZXNzIGJ5dGVzLiBDb3VsZCB0aGUgaGFyZHdhcmUgbWlzaW50ZXJwcmV0IHRoZSA0dGggYWRkcmVz
cwpieXRlIGFzIGRhdGEsIHJlc3VsdGluZyBpbiBwZXJtYW5lbnQgZGF0YSBjb3JydXB0aW9uIGJ5
IHNoaWZ0aW5nIHRoZQpkZXN0aW5hdGlvbiBhZGRyZXNzPwoKPiAgfQoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxMDE4NDQ1Mi44
OTU0ODUtMS1pdGFpLmhhbmRsZXJAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
