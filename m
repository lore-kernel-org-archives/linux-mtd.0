Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C4AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfZlQNo2mzolhsS6W5eDzruoS3ZUbal6IF9Q0EsBafI=; b=Qd7TfS+TZQ7yel
	5W3c/BLWzhN3bgGHuizXAzkvc03+ckx7y93KME8C68scHeR8D1xG0XjrxlrVc+c2xJzHacXS91zai
	otVzMbbspVb6HqkFLly1m32kZ4Y1nK54MbrfZj6Ss1jFHCi5c3evHMaAkOb/gUKtyX7Idx7jbWQMg
	eBmsXyNYs0RY75TCthjcTF6R8a9lBPtbVFICgxpsMG3xuMPRZMcQEhuvEYNqUhYU7PXQoyXKfHVyq
	HR4tR1O76+jXZf14NJmuuCZDSUWdurFtTZXcJxviSbfsOOkGz2Qm4VPjbKpxYcDVL7I3Jd0ZGIgJu
	p2PZlSt5lsaUzqFWJG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwjAh-009Aw8-NY; Mon, 13 Dec 2021 11:07:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwjAe-009AvE-Az
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 11:07:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0FB331F44952;
 Mon, 13 Dec 2021 11:07:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639393622; bh=04bequcs/NusDXEPCLT88FK1oMcTVoR+NRtV8yyK19Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HPNa0pEfIv5hz6GQwg7ADSOI51qVUCd/TfMdvCH8ku4dokzLlTwYUlnHF+7KdlYVC
 es/+H7R0Wapod9i7t5ThTjnFFIPLAcnnWoAAjAp1aaBSMcUVmMOn+nTln1rkvFoCur
 GLWAgdzgdri+jR4cx8wNswkEeY7Op9czgpY97qLRd0JUWL7QWBiNJm8jnNNgiCVMME
 dMSSxK2M+9N2zlQ4HU+MLN59N0bjXqM/VePCWMoJwabqapJlGKVMBSYfc/LLeBIgWl
 lzVPj72aHm+EwDEEpZC7pc/BTaRun+PpKExRo/DnLECuZq7Mos0BWQ4BhiN0caVfQC
 VyhDvSBVm/OJw==
Date: Mon, 13 Dec 2021 12:06:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while
 in suspend
Message-ID: <20211213120658.45f312a6@collabora.com>
In-Reply-To: <20211213105012.65jk4rylxzncqdfy@skn-laptop>
References: <20211130132912.v6v45boce2zbnoy3@skn-laptop>
 <20211130143705.5d0404aa@collabora.com>
 <20211203143958.40645506@xps13>
 <20211209140721.6ki7gznvxwyn3cze@skn-laptop.hinnerup>
 <20211209152811.318bdf17@xps13>
 <20211210132535.gy7rqj5zblqlnz5y@skn-laptop.hadsten>
 <20211213101025.42c27b43@xps13>
 <20211213102801.569b50b1@collabora.com>
 <20211213103350.22590c13@xps13>
 <20211213105336.7be369b7@collabora.com>
 <20211213105012.65jk4rylxzncqdfy@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_030704_573873_D19E9A33 
X-CRM114-Status: GOOD (  27.65  )
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

T24gTW9uLCAxMyBEZWMgMjAyMSAxMjo1MDoxMiArMDIwMApTZWFuIE55ZWtqYWVyIDxzZWFuQGdl
YW5peC5jb20+IHdyb3RlOgoKPiBIaSBNaXF1ZWwgYW5kIEJvcmlzLAo+IAo+IE9uIE1vbiwgRGVj
IDEzLCAyMDIxIGF0IDEwOjUzOjM2QU0gKzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+
IE9uIE1vbiwgMTMgRGVjIDIwMjEgMTA6MzM6NTAgKzAxMDAKPiA+IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4gSGVsbG8sCj4gPiA+
IAo+ID4gPiBib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBNb24sIDEzIERl
YyAyMDIxIDEwOjI4OjAxICswMTAwOgo+ID4gPiAgIAo+ID4gPiA+IE9uIE1vbiwgMTMgRGVjIDIw
MjEgMTA6MTA6MjUgKzAxMDAKPiA+ID4gPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiB3cm90ZToKPiA+ID4gPiAgICAgCj4gPiA+ID4gPiBIaSBTZWFuLAo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBzZWFuQGdlYW5peC5jb20gd3JvdGUgb24gRnJpLCAxMCBEZWMgMjAyMSAx
NDoyNTozNSArMDEwMDoKPiA+ID4gPiA+ICAgICAgIAo+ID4gPiA+ID4gPiBPbiBUaHUsIERlYyAw
OSwgMjAyMSBhdCAwMzoyODoxMVBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgICAgICAg
Cj4gPiA+ID4gPiA+ID4gSGkgU2VhbiwKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBzZWFu
QGdlYW5peC5jb20gd3JvdGUgb24gVGh1LCA5IERlYyAyMDIxIDE1OjA3OjIxICswMTAwOgo+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAKPiA+ID4gPiA+ID4gPiA+IE9uIEZyaSwgRGVjIDAzLCAyMDIx
IGF0IDAyOjM5OjU4UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAgICAgICAgIAo+ID4g
PiA+ID4gPiA+ID4gPiBIZWxsbywKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiBGaW5lIGJ5IG1lLCBsZXRzIGRyb3AgdGhpcyBzZXJpZXMuICAgICAg
ICAgICAgCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBGWUkgSSd2ZSBkcm9w
cGVkIHRoZSBlbnRpcmUgc2VyaWVzIGZyb20gbXRkL25leHQuIEknbSB3YWl0aW5nIGZvciB0aGUK
PiA+ID4gPiA+ID4gPiA+ID4gZml4IGRpc2N1c3NlZCBiZWxvdyAod2l0aG91dCBhYnVzaW5nIHRo
ZSBjaGlwIG11dGV4IDstKSApLiAgICAgICAgICAgIAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiBDb29sLCBsb29raW5nIGZvcndhcmQgdG8gdGVzdCBhIHBhdGNoIHNlcmllcyA6KSAg
ICAgICAgICAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUZXN0PyBZb3UgbWVhbiAid3Jp
dGUiPyA6KQo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IENoZWVycywKPiA+ID4gPiA+ID4g
PiBNaXF1w6hsICAgICAgICAgIAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSGkgTWlxdWVsLAo+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU2hvdWxkIHdlIHVzIGEgYXRvbWljIGZvciB0aGUgc3Vz
cGVuZGVkIHZhcmlhYmxlPyAgICAgICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgaGF2ZW4ndCB0
aG91Z2h0IGFib3V0IGl0IGV4dGVuc2l2ZWx5LCBhbiBhdG9taWMgdmFyaWFibGUgc291bmQgZmlu
ZQo+ID4gPiA+ID4gYnV0IEkgYW0gZGVmaW5pdGVseSBub3QgYSBsb2NraW5nIGV4cGVydC4uLiAg
ICAgIAo+ID4gPiA+IAo+ID4gPiA+IE5vIG5lZWQgdG8gdXNlIGFuIGF0b21pYyBpZiB0aGUgdmFy
aWFibGUgaXMgYWxyZWFkeSBwcm90ZWN0ZWQgYnkgYSBsb2NrCj4gPiA+ID4gd2hlbiBhY2Nlc3Nl
ZCwgYW5kIHRoaXMgc2VlbXMgdG8gYmUgY2FzZS4gICAgCj4gPiA+IAo+ID4gPiBNYXliZSB0aGVy
ZSB3YXMgYSBjb25mdXNpb24gYWJvdXQgdGhpcyBsb2NrOiBJIHRoaW5rIEJvcmlzIGp1c3QgZG8g
bm90Cj4gPiA+IHdhbnQgdGhlIGNvcmUgdG8gdGFrZSBhbnkgbG9jayBkdXJpbmcgYSBzdXNwZW5k
IG9wZXJhdGlvbi4gQnV0IHlvdSBjYW4KPiA+ID4gc3RpbGwgdXNlIGxvY2tzLCBhcyBsb25nIGFz
IHlvdSByZWxlYXNlIHRoZW0gYmVmb3JlIHN1c3BlbmRpbmcuCj4gPiA+IAo+ID4gPiBBbmQgYWxz
bywgdGhhdCBjaGlwIGxvY2sgbWlnaHQgbm90IGJlIHRoZSBvbmUgeW91IHdhbnQgdG8gdGFrZSBi
ZWNhdXNlCj4gPiA+IGl0J3MgYmVlbiBpbnRyb2R1Y2VkIGZvciBhbm90aGVyIHB1cnBvc2UuICAK
PiA+IAo+ID4gQWNjZXNzIHRvIHRoZSBzdXNwZW5kZWQgZmllbGQgaXMgYWxyZWFkeSBwcm90ZWN0
ZWQgYnkgdGhlIGNoaXAgbG9jaywKPiA+IGFuZCBJIHRoaW5rIGl0J3MganVzdCBmaW5lIHRvIGtl
ZXAgaXQgdGhpcyB3YXkuICAKPiAKPiBJJ20gcmVhZGluZyB0aGUgc3VzcGVuZGVkIHZhcmlhYmxl
IGluIHdhaXRfZXZlbnQoKSBvdXRzaWRlIHRoZSBsb2NrIDovCgpJdCBkb2Vzbid0IG1hdHRlciBi
ZWNhdXNlIHlvdSdyZSBjaGVja2luZyBpdCBhZ2FpbiB3aXRoIHRoZSBsb2NrIGhlbGQKd2hlbiBk
b2luZyBhIG5ldyBsb29wIGl0ZXJhdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
