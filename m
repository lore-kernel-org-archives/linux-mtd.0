Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF10C02198
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YA8Wo4n/SXityj0Qkc52qitoCHAbxeHk5wXAGTKmlBk=; b=vSvO/M0dyPIrze
	7ajnEu1oBpmic6RwGhFYQpeoe9288RJd+rzi9FZ28yvYtV5yr+0yHe8qqmC7/vYhzbDIBt/1Ui3ui
	4DFaT4qrzDAacGwl7YQpRL68poHwKsRwBQ6cM6ujLkCsXqIWRF1RZUA5eqc6I+4n+DY2UvfoUuUcu
	7i71Q+92T71LmI3JFsBzYk/fHO24P3xv+BmaRLY4kghvILSpkEy3d9UA7YK+XREBpCd/A1Ab4b3QJ
	zvfAVpuiZSLr5fmKP2I9fjILXnuekgDrpoYKQu8imoq86HoVCW/B0jg9kkI3x64AV8AAIq8EZifQp
	ye6NfBVt9pFeVmWeVWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFeP-000000085hz-2lG5;
	Wed, 12 Feb 2025 16:31:49 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFRk-000000082bd-1wkf
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 16:18:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A62C44419;
	Wed, 12 Feb 2025 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739377120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JSBE115N7U9CMQpZg6ZPZBsdfvFaB3/geDg7qbYTHHU=;
	b=dAG8SAQlqiIZbfuzzhstCGWm+L9Dbfjcybrs1hu50NYmrj612zYGM9rM5S5H96pxSREXPg
	aWhS4n4Na7gekB6QW63VfnQAnw20W+bGhF6YqRDN1jMnRJT/UkoJCLgPXf9uTYxu9k+Jai
	n1rDqsCTv3cezCmSeWCZnmIpYmoKkjSWA/MSPrdKFkBAbdWkmIupX1Im/7yEbkiSdCmH+I
	5U9tcUTaBUqiz66eFrreUccik+VM7a5gw+fWK3F3jvrg0+J9UoRsEn4bpSLqvT0aXdKLPW
	dPjeh9XAwQtdUT9oRHVsVqmtJSsq4fj/tAWeN7wseNLGmTCwNv4dF9Y7X6c4ag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,  richard@nod.at,
  vigneshr@ti.com,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  git@amd.com,  amitrkcian2002@gmail.com
Subject: Re: [PATCH v12 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
In-Reply-To: <20250212160659.GA3883406-robh@kernel.org> (Rob Herring's message
	of "Wed, 12 Feb 2025 10:06:59 -0600")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
	<20250211212928.GA1188800-robh@kernel.org>
	<87r043r2lq.fsf@bootlin.com>
	<20250212160659.GA3883406-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 12 Feb 2025 17:18:39 +0100
Message-ID: <874j0zqgps.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_081844_798665_2DCE2FE1 
X-CRM114-Status: GOOD (  14.63  )
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

T24gMTIvMDIvMjAyNSBhdCAxMDowNjo1OSAtMDYsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgoKPiBPbiBXZWQsIEZlYiAxMiwgMjAyNSBhdCAwOToyNTo1M0FNICswMTAwLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSwKPj4gCj4+ID4+IFRoZSBwYXJ0aXRpb25zIHRoYXQg
Z2V0cyBjcmVhdGVkIGFyZQo+PiA+PiBwYXJ0MF8wCj4+ID4+IHBhcnQxXzEKPj4gPj4gcGFydDBf
MS1wYXJ0MV8wLWNvbmNhdAo+PiA+Cj4+ID4gJ3BhcnQtY29uY2F0JyBkb2Vzbid0IHdvcmsgaWYg
eW91IGhhdmUgbXVsdGlwbGUgc2V0cyBvZiBwYXJ0aXRpb25zIHlvdSAKPj4gPiB3YW50IHRvIGNv
bmNhdGVuYXRlLgo+PiA+Cj4+ID4gSSB0aGluayB5b3UgbmVlZCBzb21ldGhpbmcgbGlrZSAncHJl
di1wYXJ0aXRpb24nIG9yICduZXh0LXBhcnRpdGlvbicgaW4gCj4+ID4gdGhlIHBhcnRpdGlvbiBu
b2RlcyB0byBjcmVhdGUgYSBsaW5rZWQgbGlzdCBvZiBwYXJ0aXRpb25zLiBIb3BlZnVsbHksIAo+
PiA+IHlvdSBkb24ndCBuZWVkIGJvdGggcHJvcGVydGllcywgYnV0IHlvdSBkbyBoYXZlIHRvIHNj
YW4gZXZlcnl0aGluZyB0byAKPj4gPiBmaWd1cmUgb3V0IHdoaWNoIG9uZXMgYXJlIGNvbmNhdGVu
YXRlZCBvciBub3QuIEZvciBleGFtcGxlLCBubyBwcm9wZXJ0eSAKPj4gPiBjYW4gbWVhbiBub3Qg
Y29uY2F0ZW5hdGVkIG9yIGxhc3QgcGFydGl0aW9uIGlmIHlvdSB1c2UgJ25leHQtcGFydGl0aW9u
Jy4gCj4+IAo+PiBPdXQgb2YgY3VyaW9zaXR5LCB3b3VsZCB0aGUgY2hvc2VuIG5vZGUgYmUgZWxp
Z2libGUgYXMgYSBjZW50cmFsIHBsYWNlCj4+IHdoZXJlIHRvIGxvb2sgYXQ/Cj4KPiBXaHkgd291
bGQgeW91IG5lZWQgdGhhdD8KCkknbSB0YWxraW5nIGFib3V0IHN0b3JpbmcgaW4gYSBjZW50cmFs
IHBsYWNlIGFsbCB0aGUgY29uY2F0ZW5hdGVkCnBhcnRpdGlvbnMuIFlvdXIgcHJvcG9zYWwgd2l0
aCAibmV4dC1wYXJ0aXRpb24iIHdvcmtzIGZpbmUgaWYgd2UgbG9jYXRlCml0IGluc2lkZSB0aGUg
J3BhcnRpdGlvbnMnIG5vZGUsIGJ1dCBJIGZlZWwgbGlrZSB0aGUgJ3BhcnQtY29uY2F0JwppbnN0
ZWFkIHdhcyBub3QgZml0dGluZyB2ZXJ5IHdlbGwgdGhlcmUuIFNvIEkgd2FzIHdvbmRlcmluZyBp
biB0aGlzIGNhc2UKaWYgbW92aW5nIHRoZSBjb25jYXRlbmF0aW9uIG9mIHRoZSBwYXJ0aXRpb25z
IHdvdWxkIGJlIGVsaWdpYmxlIHRvIHRoZQpjaG9zZW4gbm9kZSwgb3IgaWYgdGhhdCdzIHJlc2Vy
dmVkIHRvICp2ZXJ5KiBmZXcgcHJvcGVydGllcyAoYW5kIHNob3VsZApyZW1haW4gbGlrZSB0aGF0
KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
