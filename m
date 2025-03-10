Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0752C282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Mar 2025 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUUQz2wdmJxtJdsK0KIrKmopWpkwJv7uJRY89ytiPTY=; b=VyasutEQ2cEpXe
	39mUUhzxOU7E1Ggc3Bvt23aG6GkbOYORPx+unqEehkh2UYQG7nrPnE13RPpr+D7gF6R4TWaDxPaPM
	FkuJ5iJfxHur+R6/f1eHZTy91DmsJZ53jErzWiDErlRdqH3M9M/fCgsvTFljr+1zMputOtKqnBnMN
	D+h4lmHA9wxlntUHqa7yzPbJttheHkWFzWtNcobUeLtwwlsKixGhBatzUKTmYmaXKXXz3q0itaTgc
	DcpnzdP+F3hcN5Ply+IHcdy7iEF250LjzzwNx7cBsZDyZFx84puNKFhr+M1IZoB5XiFhOgvCOd/Jg
	ojGS0fIlWAYAHKTiOJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treq2-0000000385E-3ebr;
	Mon, 10 Mar 2025 15:14:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdgj-00000002s8C-24Ez
	for linux-mtd@lists.infradead.org;
	Mon, 10 Mar 2025 14:01:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8F6344287;
	Mon, 10 Mar 2025 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741615255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic1Dx7Jc0GBQUrs269FgO1VmANg/4PfSayG+I8hDFAw=;
	b=DuK80jpkLcFQYmRVTQyZYRzbWd5veudVS7lStznyElUVSl4NgOQMEwoub8NqVmncBWeIN3
	rITac9+BaOxeX/0oMlHZZXVKP7XhTSkVc2X7R58j4qlUD3T8n7y3YwjdfgYMyc56g5RlGI
	V7uO9XmSG9G15dT+Ui3SJkI2Yw/0sFxzLTCoAmwC9MJHGpzvsut4sPo39pr1ftGDdzHHLk
	becCl4cOkHPGy6BeoqQBEYVbRb7Kw6YFX5tZxHHfGSylO7zH/oLvhhiKDWuNWm/6HccR8z
	7dZk2DzQqcMZ52w0chHlB5oo610DZbP6n+4Udifr4zHSrJoaEk3PEhTFUIq1UA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin
 <npiggin@gmail.com>,  Conor Dooley <conor+dt@kernel.org>,
  linux-kernel@vger.kernel.org,  Crystal Wood <oss@buserror.net>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,
  devicetree@vger.kernel.org,  Frank Li <Frank.Li@nxp.com>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Madhavan Srinivasan <maddy@linux.ibm.com>,
  linux-mtd@lists.infradead.org,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Krzysztof Kozlowski <krzk@kernel.org>,  Naveen N Rao <naveen@kernel.org>,
  linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
In-Reply-To: <Z8yPKx1U-sT1OGeb@probook> ("J. =?utf-8?Q?Neusch=C3=A4fer=22'?=
 =?utf-8?Q?s?= message of "Sat, 8
	Mar 2025 18:40:43 +0000")
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
	<20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
	<174059551678.3319332.12055848852503108874.robh@kernel.org>
	<20250303140021.GA1732495-robh@kernel.org> <Z8yPKx1U-sT1OGeb@probook>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Mar 2025 15:00:53 +0100
Message-ID: <87o6y97zoq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffuddvueeigeegkeffveeuledtvdefteeiuddthffhtdefhfffledtleeuteejvdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgpdihrghmlhdrshhonecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepjhdrnhgvsehpohhsthgvohdrnhgvthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghom
 hdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhsshessghushgvrhhrohhrrdhnvght
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_070102_327603_E0C99E60 
X-CRM114-Status: GOOD (  21.68  )
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

T24gMDgvMDMvMjAyNSBhdCAxODo0MDo0MyBHTVQsIEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rl
by5uZXQ+IHdyb3RlOgoKPiBNaXF1ZWwsIHdoYXQgZG8geW91IHRoaW5rIGFib3V0IFJvYidzIHN1
Z2dlc3Rpb24gYmVsb3c/Cj4KPiBPbiBNb24sIE1hciAwMywgMjAyNSBhdCAwODowMDoyMUFNIC0w
NjAwLCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgMTI6NDU6
MTdQTSAtMDYwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4+ID4gCj4+ID4gT24gV2VkLCAy
NiBGZWIgMjAyNSAxODowMTo0MSArMDEwMCwgSi4gTmV1c2Now6RmZXIgd3JvdGU6Cj4+ID4gPiBG
b3JtYWxpemUgdGhlIGJpbmRpbmcgYWxyZWFkeSBzdXBwb3J0ZWQgYnkgdGhlIGZzbF9lbGJjX25h
bmQuYyBkcml2ZXIKPj4gPiA+IGFuZCB1c2VkIGluIHNldmVyYWwgZGV2aWNlIHRyZWVzIGluIGFy
Y2gvcG93ZXJwYy9ib290L2R0cy8uCj4+ID4gPiAKPj4gPiA+IHJhdy1uYW5kLWNoaXAueWFtbCBp
cyByZWZlcmVuY2VkIGluIG9yZGVyIHRvIGFjY29tbW9kYXRlIHNpdHVhdGlvbnMgaW4KPj4gPiA+
IHdoaWNoIHRoZSBFQ0MgcGFyYW1ldGVycyBzZXR0aW5ncyBhcmUgc2V0IGluIHRoZSBkZXZpY2Ug
dHJlZS4gT25lIHN1Y2gKPj4gPiA+IGV4YW1wbGUgaXMgaW4gYXJjaC9wb3dlcnBjL2Jvb3QvZHRz
L3R1cnJpczF4LmR0czoKPj4gPiA+IAo+PiA+ID4gCS8qIE1UMjlGMkcwOEFCQUVBV1A6RSBOQU5E
ICovCj4+ID4gPiAJbmFuZEAxLDAgewo+PiA+ID4gCQljb21wYXRpYmxlID0gImZzbCxwMjAyMC1m
Y20tbmFuZCIsICJmc2wsZWxiYy1mY20tbmFuZCI7Cj4+ID4gPiAJCXJlZyA9IDwweDEgMHgwIDB4
MDAwNDAwMDA+Owo+PiA+ID4gCQluYW5kLWVjYy1tb2RlID0gInNvZnQiOwo+PiA+ID4gCQluYW5k
LWVjYy1hbGdvID0gImJjaCI7Cj4+ID4gPiAKPj4gPiA+IAkJcGFydGl0aW9ucyB7IC4uLiB9Owo+
PiA+ID4gCX07Cj4+ID4gPiAKPj4gPiA+IFJldmlld2VkLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlA
bnhwLmNvbT4KPj4gPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rl
by5uZXQ+Cj4+ID4gPiAtLS0KPj4gPiA+IAo+PiA+ID4gVjM6Cj4+ID4gPiAtIHJlbW92ZSB1bm5l
Y2Vzc2FyeSAjYWRkcmVzcy9zaXplLWNlbGxzIGZyb20gbmFuZCBub2RlIGluIGV4YW1wbGUKPj4g
PiA+IC0gYWRkIEZyYW5rIExpJ3MgcmV2aWV3IHRhZwo+PiA+ID4gLSBhZGQgbWlzc2luZyBlbmQg
b2YgZG9jdW1lbnQgbWFya2VyICguLi4pCj4+ID4gPiAtIGV4cGxhaW4gY2hvaWNlIHRvIHJlZmVy
ZW5jZSByYXctbmFuZC1jaGlwLnlhbWwKPj4gPiA+IAo+PiA+ID4gVjI6Cj4+ID4gPiAtIHNwbGl0
IG91dCBmcm9tIGZzbCxlbGJjIGJpbmRpbmcgcGF0Y2gKPj4gPiA+IC0gY29uc3RyYWluICNhZGRy
ZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscwo+PiA+ID4gLSBhZGQgYSBnZW5lcmFsIGRlc2NyaXB0
aW9uCj4+ID4gPiAtIHVzZSB1bmV2YWx1YXRlZFByb3BlcnRpZXM9ZmFsc2UgaW5zdGVhZCBvZiBh
ZGRpdGlvbmFsUHJvcGVydGllcz1mYWxzZQo+PiA+ID4gLSBmaXggcHJvcGVydHkgb3JkZXIgdG8g
Y29tcGx5IHdpdGggZHRzIGNvZGluZyBzdHlsZQo+PiA+ID4gLSBpbmNsdWRlIHJhdy1uYW5kLWNo
aXAueWFtbCBpbnN0ZWFkIG9mIG5hbmQtY2hpcC55YW1sCj4+ID4gPiAtLS0KPj4gPiA+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNsLGVsYmMtZmNtLW5hbmQueWFtbCB8IDY4ICsrKysr
KysrKysrKysrKysrKysrKysKPj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygr
KQo+PiA+ID4gCj4+ID4gCj4+ID4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0
X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4+ID4gCj4+ID4geWFtbGxpbnQgd2Fybmlu
Z3MvZXJyb3JzOgo+PiA+IAo+PiA+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Cj4+ID4g
L2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLmV4YW1wbGUuZHRiOiBuYW5kQDEs
MDogJG5vZGVuYW1lOjA6ICduYW5kQDEsMCcgZG9lcyBub3QgbWF0Y2ggJ15uYW5kQFthLWYwLTld
JCcKPj4gPiAJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9t
dGQvZnNsLGVsYmMtZmNtLW5hbmQueWFtbCMKPj4gCj4+IERyb3AgdGhlIHVuaXQgYWRkcmVzcyBp
biByYXctbmFuZC1jaGlwLnlhbWwuIFNvOiAKPj4gCj4+IHByb3BlcnRpZXM6Cj4+ICAgJG5vZGVu
YW1lOgo+PiAgICAgcGF0dGVybjogIl5uYW5kQCIKCkkgYW0gbm90IGEgYmlnIGZhbiBvZiBsb3dl
cmluZyB0aGUgY29uc3RyYWludCwgYnV0IGlmIG91ciBjdXJyZW50IHNjaGVtYQpkb2Vzbid0IGFs
bG93IHRvIGV4cHJlc3MgdGhpcyBuZWVkIGRpZmZlcmVudGx5LCB3ZSBtYXkgbmVlZCB0byBkbyB0
aGF0LgpJIG9idmlvdXNseSB0cnVzdCBSb2Igb24gdGhpcyByZWdhcmQuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
