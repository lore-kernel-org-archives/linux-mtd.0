Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48497C3ABD8
	for <linux-mtd@archiver.kernel.org>; Fri, 16 May 2025 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z03JYhBwNVHRRFxsznIN24QFGu40WEVn2fGLQN85VDk=; b=vAvPho2eawmNWX
	sQzH0ry5t1JsHxYmMLzgHa3uIeZBTDkiLXRtFsPtMgUzIxx8ikKkj3zNMqRDKkUIJV6NRsft5Z4tN
	nT0aeBNI5EeWIwomSFvNKWayImx3fiuGXKbm3mJlftQqtMdRfxhFMX5xCYvGSiuBko8hiZTueRDyf
	Tdv4fmaOUDYeiEf0Vd4S5OtlIx3OV8s1h6RKf5T0t7pyKGJ4R+/eTb4oAuHf6ugD0ouUYi+xDTnd3
	EdLk5Tb0BL9/saoaV4zVbrc6HedRHeia1HjeSDgsrknH9g3REdZULyrlBCv0dIgcpRBHR5OLRoyEo
	4rDtf9q6PsWL/7sUmz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwL3-00000003iCW-39SK;
	Fri, 16 May 2025 14:47:05 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvi6-00000003bzc-0r2m
	for linux-mtd@lists.infradead.org;
	Fri, 16 May 2025 14:06:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC69E4399F;
	Fri, 16 May 2025 14:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747404403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FNaCT4ZQwywoNYi1aikoPuxQeiAAAtXSDPCSbSoQYY=;
	b=Cp8Anbs3tIhc8FvhUb0RNthAJPHEeUjwx9VmSb6FIaINNL81nGtSTJ188OY96x8D3KpVwH
	eM/Vy69l9h8+IzytTJXijZyRXmmNcrexqy4isLI0OWbCzE8ED6/q5/jsX6aqNlJTycUNig
	zJLld6lvyiRe8joEgtGWc2uioTw3gI0ICoojca399xh/ruR4NcfgyNBo07uCBe0q2BJ0nj
	uQ/g+Q3Y/3sy+gdC63lTh6B00vDYFTGzAbuzgTPo+OB0ghdspBOJPByuJqiKGBp3Qhi8K5
	4mRBlYxsqTx3CK1vooo5+H0InweCrOfay/P4VPAUadkU3VY3kJ0/wzqWKAf8Rg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "robh@kernel.org" <robh@kernel.org>,  "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,  "git
 (AMD-Xilinx)" <git@amd.com>,  "amitrkcian2002@gmail.com"
 <amitrkcian2002@gmail.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v12 3/3] mtd: Add driver for concatenating devices
In-Reply-To: <IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Tue, 13 May 2025 14:45:39 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 16 May 2025 16:06:41 +0200
Message-ID: <87o6vsejke.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_070650_830470_0F67E9FC 
X-CRM114-Status: GOOD (  22.85  )
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

T24gMTMvMDUvMjAyNSBhdCAxNDo0NTozOSBHTVQsICJNYWhhcGF0cmEsIEFtaXQgS3VtYXIiIDxh
bWl0Lmt1bWFyLW1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToKCj4gW0FNRCBPZmZpY2lhbCBVc2Ug
T25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0KPgo+IEhlbGxvIE1pcXVlbCwK
Pgo+PiA+PiA+ICsgICAgICAgICAgIG10ZC0+ZGV2LnBhcmVudCA9IGNvbmNhdC0+c3ViZGV2WzBd
LT5kZXYucGFyZW50Owo+PiA+PiA+ICsgICAgICAgICAgIG10ZC0+ZGV2ID0gY29uY2F0LT5zdWJk
ZXZbMF0tPmRldjsKPj4gPj4gPiArCj4+ID4+ID4gKyAgICAgICAgICAgLyogUmVnaXN0ZXIgdGhl
IHBsYXRmb3JtIGRldmljZSAqLwo+PiA+PiA+ICsgICAgICAgICAgIHJldCA9IG10ZF9kZXZpY2Vf
cmVnaXN0ZXIobXRkLCBOVUxMLCAwKTsKPj4gPj4gPiArICAgICAgICAgICBpZiAocmV0KQo+PiA+
PiA+ICsgICAgICAgICAgICAgICAgICAgZ290byBkZXN0cm95X2NvbmNhdDsKPj4gPj4gPiArICAg
fQo+PiA+PiA+ICsKPj4gPj4gPiArICAgcmV0dXJuIDA7Cj4+ID4+ID4gKwo+PiA+PiA+ICtkZXN0
cm95X2NvbmNhdDoKPj4gPj4gPiArICAgbXRkX2NvbmNhdF9kZXN0cm95KG10ZCk7Cj4+ID4+ID4g
Kwo+PiA+PiA+ICsgICByZXR1cm4gcmV0Owo+PiA+PiA+ICt9Cj4+ID4+ID4gKwo+PiA+PiA+ICts
YXRlX2luaXRjYWxsKG10ZF92aXJ0X2NvbmNhdF9jcmVhdGVfam9pbik7Cj4+ID4+Cj4+ID4+IFRo
ZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRvZXMgbm90IHN1cHBvcnQgcHJvYmUgZGVmZXJyYWxz
LCBJCj4+ID4+IGJlbGlldmUgaXQgc2hvdWxkIGJlIGhhbmRsZWQuCj4+ID4KPj4gPiBJIHNlZSB0
aGF0IHRoZSBwYXJzZV9tdGRfcGFydGl0aW9ucygpIEFQSSBjYW4gcmV0dXJuIC1FUFJPQkVfREVG
RVIKPj4gPiBkdXJpbmcgTVREIGRldmljZSByZWdpc3RyYXRpb24sIGJ1dCB0aGlzIGJlaGF2aW9y
IGlzIHNwZWNpZmljIHRvIHRoZQo+PiA+IHBhcnNlX3Fjb21zbWVtX3BhcnQgcGFyc2VyLiBOb25l
IG9mIHRoZSBvdGhlciBwYXJzZXJzIGFwcGVhciB0bwo+PiA+IHN1cHBvcnQgcHJvYmUgZGVmZXJy
YWwuIEFzIGRpc2N1c3NlZCBpbiBSRkMgWzFdLCB0aGUgdmlydHVhbCBjb25jYXQKPj4gPiBmZWF0
dXJlIGlzIHB1cmVseSBhIGZpeGVkLXBhcnRpdGlvbiBjYXBhYmlsaXR5LCBhbmQgYmFzZWQgb24g
bXkKPj4gPiB1bmRlcnN0YW5kaW5nLCB0aGUgZml4ZWQtcGFydGl0aW9uIHBhcnNlciBkb2VzIG5v
dCBzdXBwb3J0IHByb2JlIGRlZmVycmFsLgo+PiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ug
Y2FuIHRoaW5rIG9mIGFueSBvdGhlciBwcm9iZSBkZWZlcnJhbAo+PiA+IHNjZW5hcmlvcyB0aGF0
IG1pZ2h0IGltcGFjdCB0aGUgdmlydHVhbCBjb25jYXQgZHJpdmVyLgo+Pgo+PiBUaGF0J3MgdHJ1
ZSwgYnV0IEkga2luZCBvZiBkaXNsaWtlIHRoZSBsYXRlX2luaXRjYWxsLCBJIGZlYXIgaXQgbWln
aHQgYnJlYWsgaW4gY3JlYXRpdmUgd2F5cy4KPgo+IEkgdW5kZXJzdGFuZCwgYnV0IHNpbmNlIHdl
IHJlcXVpcmUgdGhlIHBhcnRpdGlvbiBpbmZvcm1hdGlvbiB0byBiZQo+IGF2YWlsYWJsZSwgbGF0
ZV9pbml0Y2FsbCBzZWVtcyB0byBiZSB0aGUgbW9zdCBzdWl0YWJsZSBjaG9pY2UgYW1vbmcgdGhl
Cj4gaW5pdGNhbGwgbGV2ZWxz4oCUaWYgd2UgZGVjaWRlIHRvIHByb2NlZWQgd2l0aCB1c2luZyBh
biBpbml0Y2FsbC4KPiBSZWdhcmRpbmcgcG90ZW50aWFsIGZhaWx1cmVzLCBhcyBmYXIgYXMgSSBj
YW4gdGVsbCwgdGhlIG9wZXJhdGlvbiB3b3VsZAo+IGZhaWwgaWYsIGF0IHRoZSB0aW1lIG9mIGNv
bmNhdGVuYXRpb24sIG9uZSBvciBtb3JlIG9mIHRoZSBNVEQgZGV2aWNlcwo+IGludm9sdmVkIGlu
IHRoZSBjb25jYXQgYXJlIG5vdCB5ZXQgYXZhaWxhYmxlLiBJbiBzdWNoIGEgc2NlbmFyaW8sIHdl
IGNhbgo+IGlzc3VlIGEga2VybmVsIHdhcm5pbmcgYW5kIGV4aXQgZ3JhY2VmdWxseS4gQnV0LCBI
b3dldmVyLCBpZiB5b3UgcHJlZmVyCj4gdG8gbW92ZSBhd2F5IGZyb20gdXNpbmcgaW5pdGNhbGxz
IGFuZCBoYXZlIGFuIGFsdGVybmF0aXZlCj4gaW1wbGVtZW50YXRpb24gYXBwcm9hY2ggaW4gbWlu
ZCwgcGxlYXNlIGxldCB1cyBrbm93LgoKSSBhbSBzb3JyeSBidXQgdGhpcyBkb2VzIG5vdCB3b3Jr
IHdpdGggbW9kdWxlcywgYW5kIHdlIGNhbm5vdCBpZ25vcmUgdGhpcwpjYXNlIEkgYmVsaWV2ZS4g
TW9yZSBzcGVjaWZpY2FsbHksIGlmIGEgY29udHJvbGxlciBwcm9iZSBpcyBkZWZlcnJlZAood2l0
aCBFUFJPQkVfREVGRVIgb3IganVzdCBwcmV2ZW50ZWQgYmVjYXVzZSBzb21lIGRlcGVuZGVuY2ll
cyBhcmUgbm90CnlldCBzYXRpc2ZpZWQpLCB5b3UnbGwgZ2V0IGluY29ycmVjdGx5IGRlZmluZWQg
bXRkIGRldmljZXMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
