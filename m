Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F74DD5E149
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2024 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lv4rA3IPPIiT5VWKSYKSNXk0ayLJrV8kE0uAi1GPMwQ=; b=r/rpE+239+dAVd
	JZZ9xWjZfCwLBBnfsatKHJEtojqulOduL4vVwkwAdoNTdeM2/GmTMRIwyVoSCN/aSps0S+GsQGshi
	E6ixZx7mjBN2iwSw7RRvhdw6xjxPE6oXSNP5gav4X3lXZ7V/HH05gO1vLBsMW8L6dpgggapTGABd3
	ZjnvFMv+C27SCVqC4s6YcSYLtohVvohDK9kNHMXIddMN3mdkguepYqY+qULRJ7Z1Yk1fsWgrnjVpj
	1rcFthscc/1hsDgSx9OefRwIpKOqtpSMf0hMtRBXPQTemCaLn4qsiWlG/H+5xg7ICtyQ1VYlkCw0k
	lvswyiFqgo/n1SFkgM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kw0-00000009tef-0G2D;
	Fri, 08 Nov 2024 09:05:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kly-00000009rId-0Wr9
	for linux-mtd@lists.infradead.org;
	Fri, 08 Nov 2024 08:55:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D52D60005;
	Fri,  8 Nov 2024 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731056112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X94KPNwmhHzAdqRW/pWfSff8gFIpYD5QqakcI48JnXw=;
	b=cePuNSJfAYXZRpL2j7/G2hPHIgEBeR2zp+wKJC/hvotjgcPvat5CeJbluC0ERZH0bIRcN7
	ABvPW1oTC43WcVo6j2X+yom5/pm3oKb5bdjYL7rwfGrj6VcpfT+kRnqxEka9mdRUzrjlCf
	eI0Dj1zVRBkUouYVVp6d8TVNMM1ZDSiSsZ3NB4imPD0lcUKk4RYBK3GXnYiwrkkRQVTxB8
	sSTufNgiVjhYW3N4OhKTXunv5lAQ/PBgpOHDlRZMI7+kp0FupeM/LjNTKWwqxRfneyTwiQ
	rXdb4z5raHfKMp6e05rf6T8e7aFMulHbmN/PSXpfYnbiUin6njaonx/ICu6FBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  linux-mtd@lists.infradead.org,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 02/24] spi: spi-mem: Add a new controller capability
In-Reply-To: <f0ea6706-17a2-4500-b426-a53c836c52b8@sirena.org.uk> (Mark
	Brown's message of "Thu, 7 Nov 2024 17:15:03 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-3-miquel.raynal@bootlin.com>
	<586cf617-37ee-4859-a11b-67654d650380@sirena.org.uk>
	<871pznqqdb.fsf@bootlin.com>
	<f0ea6706-17a2-4500-b426-a53c836c52b8@sirena.org.uk>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Fri, 08 Nov 2024 09:55:07 +0100
Message-ID: <87ttciayvo.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_005518_327510_35F2D254 
X-CRM114-Status: GOOD (  14.83  )
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

T24gMDcvMTEvMjAyNCBhdCAxNzoxNTowMyBHTVQsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgTm92IDA3LCAyMDI0IGF0IDExOjQwOjAwQU0gKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIDAxLzExLzIwMjQgYXQgMjA6MTc6MzMgR01ULCBN
YXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4+ID4gQWZ0ZXIgYXBwbHlp
bmcgdGhpcyBwYXRjaCAoSSBiaXNlY3RlZCB0aGUgc2VyaWVzKSBteSBBdmVuZ2VyOTYgYm9hcmQK
Pj4gPiBzdGFydGVkIGZhaWxpbmcgdG8gcHJvYmUgdGhlIFNQSSBOT1IgZmxhc2ggaXQgaGFzOgo+
Cj4+ID4gWyAgICAzLjU2Nzg3Nl0gc3BpLW5vciBzcGkwLjA6IHByb2JlIHdpdGggZHJpdmVyIHNw
aS1ub3IgZmFpbGVkIHdpdGgKPj4gPiBlcnJvciAtOTUKPgo+PiBXb3VsZCB5b3UgbWluZCB0ZXN0
aW5nIHRoZSBzZXJpZXMgd2l0aCB0aGlzIGNoYW5nZSBvbiB0b3AgYW5kIHRlbGwgbWUgaWYKPj4g
dGhhdCBmaXhlcyBpdD8KPj4gCj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+PiArKysg
Yi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPj4gQEAgLTE4NCw3ICsxODQsNyBAQCBib29sIHNwaV9t
ZW1fZGVmYXVsdF9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLAo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+ICAgICAgICAgfQo+PiAgCj4+IC0gICAgICAg
aWYgKG9wLT5tYXhfZnJlcSA8IG1lbS0+c3BpLT5tYXhfc3BlZWRfaHopIHsKPj4gKyAgICAgICBp
ZiAob3AtPm1heF9mcmVxICYmIG9wLT5tYXhfZnJlcSA8IG1lbS0+c3BpLT5tYXhfc3BlZWRfaHop
IHsKPj4gICAgICAgICAgICAgICAgIGlmICghc3BpX21lbV9jb250cm9sbGVyX2lzX2NhcGFibGUo
Y3RsciwgcGVyX29wX2ZyZXEpKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7Cj4+ICAgICAgICAgfQo+Cj4gWWVzLCB0aGF0IHNlZW1zIHRvIGhhdmUgYmVlbiB0aGUgaXNz
dWUuCgpHcmVhdCwgdGhhbmtzIGZvciB0ZXN0aW5nLiBJJ2xsIHNvb24gc2VuZCBhIHYyLCBidXQg
SSBndWVzcyB0aGF0J3MgdG9vCmxhdGUgZm9yIHRoaXMgbWVyZ2Ugd2luZG93LgoKUmVnYXJkaW5n
IGhvdyB0byBhcHBseSwgSSBiZWxpZXZlIEknbGwgaGF2ZSBtb3JlIHNwaS1uYW5kIHBhdGNoZXMg
b24gdG9wCm9mIHRoYXQgaW4gdGhlIG5leHQgY3ljbGUsIHNvIGVpdGhlciBJIGFwcGx5IHRoZW0g
d2l0aCB5b3VyIEFjayBhbmQKc2hhcmUgYW4gaW1tdXRhYmxlIHRhZywgb3IgeW91IGFwcGx5IGl0
IGFuZCBnaXZlIG1lIG9uZS4gRWl0aGVyIHdheXMKd29ya3MgZmluZSBmb3IgbWUuIEl0J3MgbW9y
ZSB3b3JrIHRvIGNyZWF0ZSB0aGUgYnJhbmNoL3RhZyBzbyBJIGNhbgpoYW5kbGUgaXQgKG9uY2Ug
d2Ugc2V0dGxlIG9uIHRoZSBjb250ZW50IG9mYykuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
