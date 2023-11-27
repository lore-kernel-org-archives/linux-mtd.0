Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E10C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85PNvrCizD2QGelDjisdq7vjPbOjDX9CwshjZN86Eyk=; b=IQ2BeUouqPcWTC
	Xb/TM6/OMMAVZuEmoLghFNH4f75rswoJh3eQkFzuZPYY5y2wgVY7yooHniqjJUnL1VQmUM5NO453y
	NDra6SB2j3ly07c5x7OWNHnimwNC4EfCkAX2B6+H8mK2zev4dpoe4+bx37ZsquuJbLaYvJHb2J7pq
	XlL5vV6PPEyrhojf8YLdL4rU6WNnNF3rojzCf9XP+WCfpttcWA5ZhgTRdCvuT8WFgBrQirsQHpbsp
	vTyi2eZhZD1g2tDuSkUzAYcSCiBU8s9iA37ubpwTznziKYXm5/VfoqYt8xB5LzSiFJFRaUv9/zWoT
	mb+ETYchCisgILrga77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cts-002jSb-0t;
	Mon, 27 Nov 2023 14:47:52 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ctp-002jRv-1q
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 14:47:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4566640003;
	Mon, 27 Nov 2023 14:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701096460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d4es/s7jXNWdh0W2dp3PUo0s5Znm1ftbj1uQMoP0s20=;
	b=CPEviVh/HK4SP/E7Jt3gUpBXwyd2LXM461WCttyrfMy+rRC3m5zQMbtEm2Iv8Z4iW2atJl
	gUv1YJ0CRPH4QozBojXKRGPy1AwNW2J76K1uPA6Cd26NJeTDiTh1bA35v+KX4tGgEQ/8cw
	L5H8bEZYExaaH1EddqoJlKJg/nV4NORvETiBvXUCVGb9qQLyT6lgaaYKrai9dztjp/fnHy
	ojBJi+r9StcwYHnb3FYtJ1BVaxyqQn2l5UZzK98YDtBdjDrRC32BjJWSYrnzxBa5omBxkm
	aqbpLirCnNgVH3+//R1y1wiBG665aIN1opUVeerd18F37B5QmfLWEiBD90UeYw==
Date: Mon, 27 Nov 2023 15:47:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: hide flash name when the flash
 name does not exist
Message-ID: <20231127154737.534db375@xps-13>
In-Reply-To: <6d362dd698095b04dd895019d3af26d0@walle.cc>
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
	<20231127100756.41605-3-jaimeliao.tw@gmail.com>
	<6d362dd698095b04dd895019d3af26d0@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_064749_924260_18D5D6D9 
X-CRM114-Status: GOOD (  16.79  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gTW9uLCAyNyBOb3YgMjAyMyAx
MzoyMTozNCArMDEwMDoKCj4gSGksCj4gCj4gPiAobnVsbCkgd2lsbCBwcmludCB3aGVuIGZsYXNo
IElEIGZvdW5kZWQgaW4gSUQgdGFibGUgYnV0Cj4gPiB0aGUgZmxhc2ggbmFtZSBkaWRuJ3QgaW5j
bHVkZSBpbiBpdC4KPiA+IAo+ID4gTWFrZSBpbmZvLT5uYW1lIG9wdGlvbmFsIGluIHRoZSBwcmlu
dCBmb3Igc2hvd2luZyBmbGFzaCBuYW1lCj4gPiBhbmQgZmxhc2ggc2l6ZS4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogSmFpbWVMaWFvIDxqYWltZWxpYW9AbXhpYy5jb20udHc+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+IGlu
ZGV4IDFjNDQzZmU1NjhjZi4uNzM0MDViZWQyYTVhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4g
PiBAQCAtMzUxOCw3ICszNTE4LDcgQEAgaW50IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25vciAq
bm9yLCBjb25zdCBjaGFyID4gKm5hbWUsCj4gPiAgCS8qIE5vIG10ZF9pbmZvIGZpZWxkcyBzaG91
bGQgYmUgdXNlZCB1cCB0byB0aGlzIHBvaW50LiAqLwo+ID4gIAlzcGlfbm9yX3NldF9tdGRfaW5m
byhub3IpOwo+ID4gCj4gPiAtCWRldl9pbmZvKGRldiwgIiVzICglbGxkIEtieXRlcylcbiIsIGlu
Zm8tPm5hbWUsCj4gPiArCWRldl9pbmZvKGRldiwgIiVzICglbGxkIEtieXRlcylcbiIsIGluZm8t
Pm5hbWUgPzogIiIsICAKPiAKPiBNYXliZSBwcmludCB0aGUgamVkZWMgaWQgaWYgdGhlIG5hbWUg
aXMgZW1wdHkuCgpXaGF0IGFib3V0IGFsd2F5cyBwcmludGluZyB0aGUgamVkZWMgaWQgaWYgbmFt
ZXMgYXJlbid0IHJlbGlhYmxlCmVub3VnaD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
