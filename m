Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1001ECC6B2F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 06:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:To:Subject:From:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOZnmiaFeHd4bTwrcXR6ZgwSB0ldu5FpszwyTrhEzl0=; b=Rx2E1I7G7Fjeml
	05cqEARaM8CiXD1oqEfL8Yn83Hdc6ULfgiDNtbUySzX3UqgZbQkbhtbPhEda98lz2NADgs+AE5v3f
	E1GEtWR9ZC4O/dn4KEUWioVKNbdWyTrOnPTNYWRMmZDRh6kX5QPh/0eX4FoBPzSqGy6Sv4/cJ2jKh
	HHWgj9yYF//FF9NjMKVVbptf+/PW4qyVKY38eH5TLKn96dk2RMjAN+5QOm1n28pwnfLZON9OhGRAQ
	8a6Dm1F5Ic5dv4Z0ABjBWDZPk6i2E4b1rrEG70gNlgfy3k4FS2CY0OqobgZPvVyUqMAIaCorcT5Rq
	OKffDbNsvbkcNPJc3f2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFAJ-0000000Gx6U-1Qjz;
	Thu, 15 Oct 2026 06:42:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFAF-0000000Gx6E-1rwq
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 06:42:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8536343CA1;
	Thu, 15 Oct 2026 06:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AAD1F000C4;
	Thu, 15 Oct 2026 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792046525;
	bh=yujhiawfe9b4DmMrS4ot+YODzfxuwyGBR02ykO0KMlA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ViRn7HtHAkoxsK1UoA2Fs0Ibi2g6KWnZucm9nXNbv47qkMMKi5Dzi2BEelt0XWrI4
	 4v9IOs1wDo6hN1B4YfPOZSW/I9gKQd++Ozf6sVpLIxsvsUdJTLYdScH6CEpy3cnRII
	 VSBir92Uo8WkVDLldjAJCg1Ihogse2Bzb5taLKJPjybmdmsCuHMcqYZlN/IKkjHB9B
	 BfGDnzHXfnVkVMCL9XrcSIcKOFk/fjhV1uC79BXtoFuuq967J5LG3F1Uve59l+dnri
	 2FEFNKP1+Hdy0QtGsnZw/IUAmX0qHs896+1/au7qVf1n7PlvE7bQXfxGQyDbTy+MKi
	 wKsQoc4ybadLg==
Message-ID: <sashiko-outbox-172348@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, aaro.koskinen@iki.fi, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
References: <cover.1790847519.git.manikandan.m@microchip.com>
 <093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
Date: Thu, 15 Oct 2026 06:42:03 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
VUFGIG9mIFNGRFAgY2FjaGVkIGRhdGEgdmlhIE5WTUVNIGNlbGwgY29uc3VtZXIgYWZ0ZXIgdW5i
aW5kCi0tCgpjb21taXQgMjdlYmU4MzMyOWNkZjZmMmUwNjJjYzUwMDQxYmJmM2E4NzdmY2FiYQpB
dXRob3I6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNv
bT4KCm10ZDogc3BpLW5vcjogc2ZkcDogZXhwb3NlIHRoZSBTRkRQIGFzIGEgcmVhZC1vbmx5IE5W
TUVNIGRldmljZQoKVGhpcyBjb21taXQgZXhwb3NlcyB0aGUgU0ZEUCB0YWJsZXMgcmVhZCBmcm9t
IHRoZSBTUEkgTk9SIGZsYXNoIGFzIGEKcmVhZC1vbmx5IE5WTUVNIGRldmljZS4gVGhlIGRldmlj
ZSBpcyBjb25kaXRpb25hbGx5IHJlZ2lzdGVyZWQgd2hlbiBhCmplZGVjLHNmZHAgY2hpbGQgbm9k
ZSBpcyBwcmVzZW50IGluIHRoZSBkZXZpY2UgdHJlZSwgYWxsb3dpbmcgY29uc3VtZXJzCnRvIHJl
ZmVyZW5jZSBhbnkgU0ZEUCBkYXRhLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IC0tLSBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKClsgLi4u
IF0KCj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zZmRwX3JlZ19yZWFkKHZvaWQgKnByaXYsIHVuc2ln
bmVkIGludCBvZmZzZXQsCj4gKwkJCQkgdm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpCj4gK3sKPiAr
CXN0cnVjdCBzcGlfbm9yICpub3IgPSBwcml2Owo+ICsJc3RydWN0IHNmZHAgKnNmZHAgPSBub3It
PnNmZHA7Cj4gKwlzaXplX3Qgc2ZkcF9zaXplID0gc2ZkcC0+bnVtX2R3b3JkcyAqIHNpemVvZigq
c2ZkcC0+ZHdvcmRzKTsKPiArCj4gKwlpZiAob2Zmc2V0ID49IHNmZHBfc2l6ZSB8fCBieXRlcyA+
IHNmZHBfc2l6ZSAtIG9mZnNldCkKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gKwkvKiBUaGUg
Y2FjaGVkIFNGRFAgaXMga2VwdCBpbiBvbi1mbGFzaCAobGl0dGxlLWVuZGlhbikgYnl0ZSBvcmRl
ci4gKi8KPiArCW1lbWNweSh2YWwsICh1OCAqKXNmZHAtPmR3b3JkcyArIG9mZnNldCwgYnl0ZXMp
OwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29kZSBpbnRyb2R1Y2UgYSBwb3RlbnRpYWwg
dXNlLWFmdGVyLWZyZWUgaWYgdGhlIFNQSSBOT1IgZGV2aWNlIGlzCnVuYm91bmQgd2hpbGUgYW4g
TlZNRU0gY2VsbCBjb25zdW1lciBzdGlsbCBob2xkcyBhIHJlZmVyZW5jZT8KCldoZW4gYW4gaW4t
a2VybmVsIGNvbnN1bWVyIGRyaXZlciBvYnRhaW5zIGFuIE5WTUVNIGNlbGwgcmVmZXJlbmNlIHRv
IHRoZQpTRkRQIGRldmljZSwgaXQgaW5jcmVtZW50cyB0aGUgbnZtZW1fZGV2aWNlIHJlZmVyZW5j
ZSBjb3VudC4gTGF0ZXIsIGlmIHRoZQpTUEkgTk9SIGRldmljZSBpcyB1bmJvdW5kIHZpYSBzeXNm
cywgdGhlIGRldnJlcyBmcmFtZXdvcmsgcnVucwpkZXZtX252bWVtX3VucmVnaXN0ZXIuCgpMb29r
aW5nIGF0IG52bWVtX3VucmVnaXN0ZXIgaW4gZHJpdmVycy9udm1lbS9jb3JlLmMsIGl0IG9ubHkg
ZHJvcHMgdGhlCnByb3ZpZGVyJ3MgcmVmZXJlbmNlIGNvdW50LiBJdCBkb2VzIG5vdCBleHBsaWNp
dGx5IGJsb2NrIGZ1dHVyZSByZWFkcywgY2xlYXIKdGhlIG9wZXJhdGlvbnMgcG9pbnRlciwgb3Ig
ZGlzY29ubmVjdCBhY3RpdmUgY29uc3VtZXJzLiBCZWNhdXNlIHRoZSBjb25zdW1lcgpzdGlsbCBo
b2xkcyBhIGNlbGwgcmVmZXJlbmNlLCB0aGUgbnZtZW1fZGV2aWNlIG9iamVjdCBhbmQgaXRzIHJl
Z19yZWFkIG9wcwpyZW1haW4gYWN0aXZlLgoKRGV2cmVzIHRoZW4gcHJvY2VlZHMgdG8gZnJlZSB0
aGUgbm9yIHN0cnVjdCBhbmQgbm9yLT5zZmRwLT5kd29yZHMgYnVmZmVycwp3aGljaCB3ZXJlIGFs
bG9jYXRlZCBlYXJsaWVyIGluIHRoZSBwcm9iZSBzZXF1ZW5jZS4KCklmIHRoZSBjb25zdW1lciBz
dWJzZXF1ZW50bHkgY2FsbHMgbnZtZW1fY2VsbF9yZWFkLCB0aGUgcmVhZCBpcyBmb3J3YXJkZWQK
dG8gc3BpX25vcl9zZmRwX3JlZ19yZWFkLCB3aGljaCBkZXJlZmVyZW5jZXMgdGhlIGFscmVhZHkg
ZnJlZWQgbm9yIGFuZCBzZmRwCm1lbW9yeS4KCj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KClsgLi4u
IF0KCj4gK3N0YXRpYyBpbnQgc3BpX25vcl9yZWdpc3Rlcl9zZmRwX252bWVtKHN0cnVjdCBzcGlf
bm9yICpub3IpCj4gK3sKPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IG5vci0+ZGV2Owo+ICsJc3Ry
dWN0IG52bWVtX2NvbmZpZyBjb25maWcgPSB7IH07Cj4gKwlzdHJ1Y3QgbnZtZW1fZGV2aWNlICpu
dm1lbTsKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7Cj4gKwo+ICsJaWYgKCFub3ItPnNmZHAp
Cj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJbnAgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChkZXZf
b2Zfbm9kZShkZXYpLCAiamVkZWMsc2ZkcCIpOwo+ICsJaWYgKCFucCkKPiArCQlyZXR1cm4gMDsK
PiArCj4gKwljb25maWcuZGV2ID0gZGV2Owo+ICsJY29uZmlnLm9mX25vZGUgPSBucDsKPiArCWNv
bmZpZy5uYW1lID0gInNmZHAiOwo+ICsJY29uZmlnLmlkID0gTlZNRU1fREVWSURfQVVUTzsKPiAr
CWNvbmZpZy5vd25lciA9IFRISVNfTU9EVUxFOwo+ICsJY29uZmlnLnJlYWRfb25seSA9IHRydWU7
Cj4gKwljb25maWcud29yZF9zaXplID0gMTsKPiArCWNvbmZpZy5zdHJpZGUgPSAxOwo+ICsJY29u
ZmlnLnNpemUgPSAoaW50KShub3ItPnNmZHAtPm51bV9kd29yZHMgKiBzaXplb2YoKm5vci0+c2Zk
cC0+ZHdvcmRzKSk7Cj4gKwljb25maWcucmVnX3JlYWQgPSBzcGlfbm9yX3NmZHBfcmVnX3JlYWQ7
Cj4gKwljb25maWcucHJpdiA9IG5vcjsKPiArCj4gKwludm1lbSA9IGRldm1fbnZtZW1fcmVnaXN0
ZXIoZGV2LCAmY29uZmlnKTsKCltTZXZlcml0eTogSGlnaF0KSXMgdGhlcmUgYSByaXNrIHRvIGJp
bmRpbmcgdGhlIE5WTUVNIHJlZ2lzdHJhdGlvbiB0byB0aGUgZGV2cmVzIGxpZmVjeWNsZQpoZXJl
PwoKU2luY2UgZGV2cmVzIHRlYXJzIGRvd24gaW4gcmV2ZXJzZSBvcmRlciwgZGV2bV9udm1lbV91
bnJlZ2lzdGVyIHdpbGwgcnVuCmJlZm9yZSB0aGUgU0ZEUCBtZW1vcnkgaXMgZnJlZWQuIEJ1dCBh
cyBub3RlZCBhYm92ZSwgdGhpcyBkb2VzIG5vdCBzYWZlbHkKZGVzdHJveSB0aGUgTlZNRU0gZGV2
aWNlIGlmIGEgY29uc3VtZXIgaXMgaG9sZGluZyBhIGNlbGwgcmVmZXJlbmNlLCBhbGxvd2luZwp0
aGUgb3BlcmF0aW9ucyBwb2ludGVyIHRvIG91dGxpdmUgdGhlIG1lbW9yeSBpdCBhY2Nlc3Nlcy4K
Cj4gKwlvZl9ub2RlX3B1dChucCk7Cj4gKwlpZiAoSVNfRVJSKG52bWVtKSkgewoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9jb3Zlci4xNzkw
ODQ3NTE5LmdpdC5tYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT9wYXJ0PTQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
