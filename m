Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077DDC021A6
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2025 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHa3fhgqFa0ozPSmG6XDdo5N/JFYBLOtqPkC227HF4Y=; b=CxiDAA2tfDkyfl
	ltZ85uTTuF94tC7Q5/lp2Qe13+Leyr1RX2mGvSGCyjaIcYLHA1bHK/SluuTsjP1SrL8z6gXgkOAmP
	V04Vt3+b+2kPz/EfaPnSVo+VuUvXjq4oWlK3ORfqkZYdwc5IOa6tfuvEGPKw7svqOqv2Ofr4kGtcY
	7vJNqEY7dK71wNS7xVqpxOOOgJkaCGseQS7N8TAsuBmpmm/XygjJOpclKrkuxA06ovs0cuUfjnInU
	ajxNvPh3VTUYQbJ5W+REswoIkhYswNKV6wxBbC3+GmnWAyfZlSqaSAn/4DYbyU3e84a9THMmXtx6q
	JTzOhu4glAj2UhQqtt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0yA-0000000FyLL-3aKy;
	Fri, 14 Feb 2025 19:03:22 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0U4-0000000FtA1-3u8Q
	for linux-mtd@lists.infradead.org;
	Fri, 14 Feb 2025 18:32:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF1D443147;
	Fri, 14 Feb 2025 18:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739557934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LVaNtaF6lM1ysdLnJydaXHpyn1kIjoK7UiOQfCmaWY=;
	b=PJeY04CDbX3dy9gEg2lL2dLUTVXQvkK/dLHnSOzoxVI/p3NpOIiJUIuNFBW4c5pvYXuRj4
	xgFKfsqsLcv2P8e0sW/FJeTqfO+idxcGzc5wnW837qfMhV9BOkf4XnvY01h/ob2iqKwOl1
	7V7dymut0kzp5mobiI00A68nF220THUpFuqicyP3PA7Xw2f/xu/GF22fezNYCLYoN4MvZR
	MDK0rSnM7F8fu2FjkOJ8udyJI12eeapr81zf3LM/zgKdf4t7O/KwiM+Fbzqc8ZeVXgcuRU
	Lq+RnzPo0pfLE831/QRXs0tIrzasLafSMizSVw+Pfcg+lRQacr37a70A/xYV6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <quic_sridsn@quicinc.com>,
  <quic_mdalam@quicinc.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <p-mantena@ti.com>,
  <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: winbond: Fix oob_layout for W25N01JW
In-Reply-To: <20250213060018.2664518-1-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Thu, 13 Feb 2025 11:30:18 +0530")
References: <20250213060018.2664518-1-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 14 Feb 2025 19:32:12 +0100
Message-ID: <87wmdsml77.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvteeffedtffeiveefueevjedtledufeduvedvkeetudeftddtfeehtdevhfdtgfenucffohhmrghinhepfihinhgsohhnugdrtghomhdpkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepledvrddukeegrdelkedrudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdduieejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepshdqkheisehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhiughsnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrt
 ghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehpqdhmrghnthgvnhgrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_103217_099227_2DEE4A42 
X-CRM114-Status: GOOD (  15.70  )
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

T24gMTMvMDIvMjAyNSBhdCAxMTozMDoxOCArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBGaXggdGhlIFcyNU4wMUpXJ3Mgb29iX2xheW91dCBhY2NvcmRpbmcg
dG8gdGhlIGRhdGFzaGVldC4gWzFdCj4KPiBbMV0gaHR0cHM6Ly93d3cud2luYm9uZC5jb20vaHEv
cHJvZHVjdC9jb2RlLXN0b3JhZ2UtZmxhc2gtbWVtb3J5L3FzcGluYW5kLWZsYXNoLz9fX2xvY2Fs
ZT1lbiZwYXJ0Tm89VzI1TjAxSlcKPgo+IEZpeGVzOiA2YTgwNGZiNzJkZTUgKCJtdGQ6IHNwaW5h
bmQ6IHdpbmJvbmQ6IGFkZCBzdXBwb3J0IGZvciBzZXJpYWwgTkFORCBmbGFzaCIpCj4gQ2M6IFNy
aWRoYXJhbiBTIE4gPHF1aWNfc3JpZHNuQHF1aWNpbmMuY29tPgo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+
Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIERldGFjaCBwYXRjaCAzLzMgZnJvbSB2MQo+
ICAtIFJlYmFzZSBvbiBuZXh0Cj4gIC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbXRkLzIwMjUwMTAyMTE1MTEwLjE0MDI0NDAtMS1zLWs2QHRpLmNvbS8KPiAgCj4g
UmVwbzogaHR0cHM6Ly9naXRodWIuY29tL3NhbnRob3NoMjEvbGludXgvdHJlZS91TF9uZXh0Cj4g
VGVzdCByZXN1bHRzOiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9zYW50aG9zaDIxLzcxYWI2NjQ2
ZGNjYzIzOGEwYjNjNDdjMDM4MmYyMTlhCj4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkv
d2luYm9uZC5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dp
bmJvbmQuYwo+IGluZGV4IGVhMTFhZTEyNDIzZi4uNDFjZDBhNTFlNDUwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
c3BpL3dpbmJvbmQuYwo+IEBAIC0xMzQsNiArMTM0LDMwIEBAIHN0YXRpYyBpbnQgdzI1bjAya3Zf
b29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAo+ICAJcmV0
dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgdzI1bjAxandfb29ibGF5b3V0X2VjYyhzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gKwkJCQkgIHN0cnVjdCBtdGRfb29iX3Jl
Z2lvbiAqcmVnaW9uKQo+ICt7Cj4gKwlpZiAoc2VjdGlvbiA+IDMpCj4gKwkJcmV0dXJuIC1FUkFO
R0U7Cj4gKwo+ICsJcmVnaW9uLT5vZmZzZXQgPSAoMTYgKiBzZWN0aW9uKSArIDEyOwo+ICsJcmVn
aW9uLT5sZW5ndGggPSA0Owo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50
IHcyNW4wMWp3X29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlv
biwKPiArCQkJCSAgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+ICt7Cj4gKwlpZiAo
c2VjdGlvbiA+IDMpCj4gKwkJcmV0dXJuIC1FUkFOR0U7Cj4gKwo+ICsJcmVnaW9uLT5vZmZzZXQg
PSAoMTYgKiBzZWN0aW9uKSArIDI7CgpUaGlzIGlzIGFjdHVhbGx5IHdyb25nIGkgYmVsaWV2ZS4g
T25seSB0aGUgZmlyc3Qgc2VjdGlvbiBuZWVkcyArIDIuCgpZb3UgY2FuIHByb2JhYmx5IGhhdmUg
dGhlIGZvbGxvd2luZyBjb25kaXRpb246CgppZiAoc2VjdGlvbiA+IDMpIHsKICAgICBvZmZzZXQg
Kz0gMjsKICAgICBsZW5ndGggLT0gMjsKfQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
