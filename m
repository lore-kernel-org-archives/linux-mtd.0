Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B23CA0EEC
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmmv/ZBKheRxpnNvo1xerJWSllg/AJR+oBMRY3svzlI=; b=XWlrnkiJWwG52D
	fym6tV1NeLXAut5EmZJ5sVLKar2Iarv9cj/fW8GwhmKNeehG2qdQEiNwHErMg3Hty86dOCc8ZczSW
	h/HDUaBToNFS4VjXSD2Ra2TIlxO4xbZXnjIwwGMobNo+dUOS+hueFg494Ol8wOIdAurwupEfnJh5E
	KnOTiFVEMCL3FT2TqCGSbI7mOZglkll8p7Mabtjc7kCnjrCo7dnkup9L/iNTtTNWDsCI37ItuXtxu
	YqxdBmIqpYSZ6xnXttNnR0i6ZRYj450fGPJ+cMS/y3wP+LJ49xA5l3CSPad5RzOFQVsYNlMNSvzjR
	W3aotc/iJUK1VdgW9vhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Da-003WWv-1B;
	Tue, 12 Sep 2023 14:18:18 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4DG-003WCN-2u
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 14:18:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6E296000C;
	Tue, 12 Sep 2023 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694528274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmAVbqcex+wu8olNhaYbX0tmtwogpGqw3k+C3D9P9VI=;
	b=Gduo1njbql4zsOOX46pEawW4iAGIrEwd/vg4NTaj6RNg7BhwWspIo5fpLZKCcmFAjflXo/
	FMO3qVv2/ulexxC1Nx3DIwwBpLERek3OK3rCzvS4Tmuj1kVXXhjfkUIgJh1r7uYRghPhk/
	jutZ72PuLt99lt2CumNaqE+PuirQyXfs3ehiR2tpwMAczC3QOzXeMA+wA8YYQ2IDM0Rdry
	Aq7vBugTH10L1tBsB8MtiM2GwnEoT/D7afquVBXkzDT3Ye7Six3R7gKOHvYMU18XmM5l7q
	93OJBujlC0LOz7pXBBzItwrGfFjAe765t5Xf2ZJFgMIDlWfvh/SBgnT8Zo8Bwg==
Date: Tue, 12 Sep 2023 16:17:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: rawnand: arasan: Ensure program page
 operations are successful
Message-ID: <20230912161752.581019bc@xps-13>
In-Reply-To: <cf1a0b96-0f1e-4a6d-960b-93185faf27ba@amd.com>
References: <20230717194221.229778-1-miquel.raynal@bootlin.com>
	<20230717194221.229778-2-miquel.raynal@bootlin.com>
	<20230911175247.44c1d894@xps-13>
	<cf1a0b96-0f1e-4a6d-960b-93185faf27ba@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_071759_263294_082DE8C4 
X-CRM114-Status: GOOD (  24.45  )
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

SGkgTWljaGFsLAoKbWljaGFsLnNpbWVrQGFtZC5jb20gd3JvdGUgb24gVHVlLCAxMiBTZXAgMjAy
MyAxNTo1NToyMyArMDIwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDkvMTEvMjMgMTc6NTIsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBNaWNoYWwsCj4gPiAKPiA+IG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20gd3JvdGUgb24gTW9uLCAxNyBKdWwgMjAyMyAyMTo0MjoyMCArMDIwMDoKPiA+
ICAgCj4gPj4gVGhlIE5BTkQgY29yZSBjb21wbGllcyB3aXRoIHRoZSBPTkZJIHNwZWNpZmljYXRp
b24sIHdoaWNoIGl0c2VsZgo+ID4+IG1lbnRpb25zIHRoYXQgYWZ0ZXIgYW55IHByb2dyYW0gb3Ig
ZXJhc2Ugb3BlcmF0aW9uLCBhIHN0YXR1cyBjaGVjawo+ID4+IHNob3VsZCBiZSBwZXJmb3JtZWQg
dG8gc2VlIHdoZXRoZXIgdGhlIG9wZXJhdGlvbiB3YXMgZmluaXNoZWQgKmFuZCoKPiA+PiBzdWNj
ZXNzZnVsLgo+ID4+Cj4gPj4gVGhlIE5BTkQgY29yZSBvZmZlcnMgaGVscGVycyB0byBmaW5pc2gg
YSBwYWdlIHdyaXRlIChzZW5kaW5nIHRoZQo+ID4+ICJQQUdFIFBST0ciIGNvbW1hbmQsIHdhaXRp
bmcgZm9yIHRoZSBOQU5EIGNoaXAgdG8gYmUgcmVhZHkgYWdhaW4sIGFuZAo+ID4+IGNoZWNraW5n
IHRoZSBvcGVyYXRpb24gc3RhdHVzKS4gQnV0IGluIHNvbWUgY2FzZXMsIGFkdmFuY2VkIGNvbnRy
b2xsZXIKPiA+PiBkcml2ZXJzIG1pZ2h0IHdhbnQgdG8gb3B0aW1pemUgdGhpcyBhbmQgY3JhZnQg
dGhlaXIgb3duIHBhZ2Ugd3JpdGUKPiA+PiBoZWxwZXIgdG8gbGV2ZXJhZ2UgYWRkaXRpb25hbCBo
YXJkd2FyZSBjYXBhYmlsaXRpZXMsIHRodXMgbm90IGFsd2F5cwo+ID4+IHVzaW5nIHRoZSBjb3Jl
IGZhY2lsaXRpZXMuCj4gPj4KPiA+PiBTb21lIGRyaXZlcnMsIGxpa2UgdGhpcyBvbmUsIGRvIG5v
dCB1c2UgdGhlIGNvcmUgaGVscGVyIHRvIGZpbmlzaCBhIHBhZ2UKPiA+PiB3cml0ZSBiZWNhdXNl
IHRoZSBmaW5hbCBjeWNsZXMgYXJlIGF1dG9tYXRpY2FsbHkgbWFuYWdlZCBieSB0aGUKPiA+PiBo
YXJkd2FyZS4gSW4gdGhpcyBjYXNlLCB0aGUgYWRkaXRpb25hbCBjYXJlIG11c3QgYmUgdGFrZW4g
dG8gbWFudWFsbHkKPiA+PiBwZXJmb3JtIHRoZSBmaW5hbCBzdGF0dXMgY2hlY2suCj4gPj4KPiA+
PiBMZXQncyByZWFkIHRoZSBOQU5EIGNoaXAgc3RhdHVzIGF0IHRoZSBlbmQgb2YgdGhlIHBhZ2Ug
d3JpdGUgaGVscGVyIGFuZAo+ID4+IHJldHVybiAtRUlPIHVwb24gZXJyb3IuCj4gPj4KPiA+PiBD
YzogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KPiA+PiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+ID4+IEZpeGVzOiA4OGZmZWYxYjY1Y2YgKCJtdGQ6IHJhd25hbmQ6IGFy
YXNhbjogU3VwcG9ydCB0aGUgaGFyZHdhcmUgQkNIIEVDQyBlbmdpbmUiKQo+ID4+IFNpZ25lZC1v
ZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPj4KPiA+
PiAtLS0KPiA+Pgo+ID4+IEhlbGxvIE1pY2hhbCwKPiA+Pgo+ID4+IEkgaGF2ZSBub3QgdGVzdGVk
IHRoaXMsIGJ1dCBiYXNlZCBvbiBhIHJlcG9ydCBvbiBhbm90aGVyIGRyaXZlciwgSQo+ID4+IGJl
bGlldmUgdGhlIHN0YXR1cyBjaGVjayBpcyBhbHNvIG1pc3NpbmcgaGVyZSBhbmQgY291bGQgc29t
ZXRpbWVzCj4gPj4gbGVhZCB0byB1bm5vdGljZWQgcGFydGlhbCB3cml0ZXMuCj4gPj4KPiA+PiBQ
bGVhc2UgdGVzdCBvbiB5b3VyIHNpZGUgdGhhdCBldmVyeXRoaW5nIHN0aWxsIHdvcmtzIGFuZCBs
ZXQgbWUKPiA+PiBrbm93IGhvdyBpdCBnb2VzLiAgCj4gPiAKPiA+IEFueSBuZXdzIGZyb20gdGhl
IHRlc3RpbmcgdGVhbSBhYm91dCBwYXRjaGVzIDIvMyBhbmQgMy8zPyAgCj4gCj4gSSBhc2tlZCBB
bWl0IHRvIHRlc3QgYW5kIGhlIGRpZG4ndCBnZXQgYmFjayB0byBtZSBldmVuIEkgYXNrZWQgZm9y
IGl0IGNvdXBsZSBvZiB0aW1lcy4KCk9rLgoKPiBDYW4geW91IHBsZWFzZSB0ZWxsIG1lIGhvdyB0
byB0ZXN0IGl0PyBJIHdpbGwgc2V0dXAgSFcgbXlzZWxmIGFuZCB0ZXN0IGl0IGFuZCBnZXQgYmFj
ayB0byB5b3UuCgpJIGJlbGlldmUgc2V0dGluZyB1cCB0aGUgYm9hcmQgdG8gdXNlIHRoZSBoYXJk
d2FyZSBCQ0ggZW5naW5lIGFuZApwZXJmb3JtaW5nIGJhc2ljIGVyYXNlL3dyaXRlL3JlYWQgdGVz
dGluZyB3aXRoIGEga25vd24gZmlsZSBhbmQgY2hlY2sKaXQgc3RpbGwgYmVoYXZlcyBjb3JyZWN0
bHkgd291bGQgd29yay4gWW91IGNhbiBhbHNvIHJ1bgoKCW5hbmRiaXRlcnJzIC1pIC9kZXYvbXRk
eAoKYXMgYSBzZWNvbmQgc3RlcCBhbmQgdmVyaWZ5IHRoZXJlIGlzIG5vIGRpZmZlcmVuY2Ugd2l0
aCBhbmQgd2l0aG91dCB0aGUKcGF0Y2ggYW5kIGZpbmFsbHkgY2hlY2sgdGhlIGltcGFjdDoKCglm
bGFzaF9zcGVlZCAtZCAtYyAxMCAvZGV2L210ZHgKCShiZSBjYXJlZnVsOiB0aGlzIGlzIGEgZGVz
dHJ1Y3RpdmUgb3BlcmF0aW9uKQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
