Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A475C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yG5UZxjigdId7yF2uD25CyI3I/JmBitYCP1LJwxtH7w=; b=FZf1po8/j2PkFJ
	nidsqxXVTP6D8FygYiJBmmebxfsxwPLHagEb05v6TV+x2SbMkNJ9wQ1H+/KdiNdlKt6vQ+viuS0zY
	/+Ij/3JFSuqb4y+B4rn9PdfeQJ14licYgSuNAiRT1KNDfiPj5VYFwODmBi6NHP+DZCCTE+hOZCwG3
	jClafsiWzpRY+MJw6vSHEqosfXk0IXa4x9MoYBx1HRRJh7GQPrVy4MKNMAvczs5hPi/C+gaUGhB7o
	JWwZ7pz1AQql2Hmu1ra3tDzkIvCm55+1n/1dWuvSU5/znCqzlRJggv51CNa3T4CzVrejfaMiIEGL3
	KKWl1YjvjMf1klJuic3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p18PQ-00HDrT-GS; Fri, 02 Dec 2022 15:57:04 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p18PM-00HDnP-Vs; Fri, 02 Dec 2022 15:57:02 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p18PD-0003kr-Pp; Fri, 02 Dec 2022 16:56:51 +0100
Message-ID: <f6417f32-cf30-2e01-701e-ed1634055c6a@leemhuis.info>
Date: Fri, 2 Dec 2022 16:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US, de-DE
To: Marek Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669996621;183cb4f6;
X-HE-SMSGID: 1p18PD-0003kr-Pp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_075701_203071_13E91C44 
X-CRM114-Status: GOOD (  14.64  )
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

T24gMDIuMTIuMjIgMTU6MzEsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEyLzIvMjIgMTU6MDUs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gWy4uLl0KPj4gMy4gVG8gZml4IHRoZSBjdXJyZW50IHNp
dHVhdGlvbjoKPj4gwqDCoMKgIEltbWVkaWF0ZWx5IHJldmVydCBjb21taXQgKGFuZCBwcmV2ZW50
IGl0IGZyb20gYmVpbmcgYmFja3BvcnRlZCk6Cj4+IMKgwqDCoCA3NTMzOTVlYTFlNDUgKCJBUk06
IGR0czogaW14NzogRml4IE5BTkQgY29udHJvbGxlciBzaXplLWNlbGxzIikKPj4gwqDCoMKgIFRo
aXMgd2F5IHlvdXIgb3duIGJvb3QgZmxvdyBpcyBmaXhlZCBpbiB0aGUgc2hvcnQgdGVybS4KPiAK
PiBIZXJlIEkgZGlzYWdyZWUsIHRoZSBmaXggaXMgY29ycmVjdCBhbmQgSSB0aGluayB3ZSBzaG91
bGRuJ3QgcHJvbGlmZXJhdGUKPiBpbmNvcnJlY3QgRFRzIHdoaWNoIGRvbid0IG1hdGNoIHRoZSBi
aW5kaW5nIGRvY3VtZW50LiBSYXRoZXIsIGlmIGEKPiBib290bG9hZGVyIGdlbmVyYXRlcyBpbmNv
cnJlY3QgKG5ldykgRFQgZW50cmllcywgSSBiZWxpZXZlIHRoZSBkcml2ZXIKPiBzaG91bGQgaW1w
bGVtZW50IGEgZml4dXAgYW5kIHdhcm4gdXNlciBhYm91dCB0aGlzLiBQQyBkb2VzIHRoYXQgYXMg
d2VsbAo+IHdpdGggYnJva2VuIEFDUEkgdGFibGVzIGFzIGZhciBhcyBJIGNhbiB0ZWxsLgoKV2Vs
bCwgdGhhdCBtaWdodCBiZSB0aGUgcmlnaHQgc29sdXRpb24gaW4gdGhlIGxvbmcgcnVuLCB0aGF0
J3MgdXAgZm9yCm90aGVycyB0byBkZWNpZGUsIGJ1dCB3ZSBuZWVkIHRvIGZpeCB0aGlzICpxdWlj
a2x5Ki4gRm9yIHR3byByZWFzb25zCmFjdHVhbGx5OiB0aGUgNi4xIHJlbGVhc2UgaXMgbmVhciBh
bmQgdGhlIGNoYW5nZSB3YXMgYmFja3BvcnRlZCB0bwpzdGFibGUgYWxyZWFkeS4KCkZvciBkZXRh
aWxzIHdydCB0byB0aGUgInF1aWNrbHkiLCBzZWUgIlByaW9yaXRpemUgd29yayBvbiBmaXhpbmcK
cmVncmVzc2lvbnMiIGhlcmU6Cmh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nlc3MvaGFuZGxp
bmctcmVncmVzc2lvbnMuaHRtbAoKSU9XOiBJZGVhbGx5IGl0IHNob3VsZCBiZSBmaXhlZCBieSBT
dW5kYXkuCgpJJ2xsIGhlbmNlIGxpa2VseSBzb29uIHdpbGwgcG9pbnQgTGludXMgdG8gdGhpcyBh
bmQgc3VnZ2VzdCB0byByZXZlcnQKdGhpcywgdW5sZXNzIHRoZXJlIGFyZSBzdHJvbmcgcmVhc29u
cyBhZ2FpbnN0IHRoYXQgb3Igc29tZSBzb3J0IG9mCmFncmVlbWVudCBvbiBhIGJldHRlciBzb2x1
dGlvbi4KCkNpYW8sIFRob3JzdGVuICh3ZWFyaW5nIGhpcyAndGhlIExpbnV4IGtlcm5lbCdzIHJl
Z3Jlc3Npb24gdHJhY2tlcicgaGF0KQoKUC5TLjogQXMgdGhlIExpbnV4IGtlcm5lbCdzIHJlZ3Jl
c3Npb24gdHJhY2tlciBJIGRlYWwgd2l0aCBhIGxvdCBvZgpyZXBvcnRzIGFuZCBzb21ldGltZXMg
bWlzcyBzb21ldGhpbmcgaW1wb3J0YW50IHdoZW4gd3JpdGluZyBtYWlscyBsaWtlCnRoaXMuIElm
IHRoYXQncyB0aGUgY2FzZSBoZXJlLCBkb24ndCBoZXNpdGF0ZSB0byB0ZWxsIG1lIGluIGEgcHVi
bGljCnJlcGx5LCBpdCdzIGluIGV2ZXJ5b25lJ3MgaW50ZXJlc3QgdG8gc2V0IHRoZSBwdWJsaWMg
cmVjb3JkIHN0cmFpZ2h0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
