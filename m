Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867FE606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lERsQBLZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gE+OYUHR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8rB9183hC+k1XZKR63KUyniKRMCqOKb5YvybiSCekEk=; b=lERsQBLZySNrZuukpbwAXwRkyd
	w4ZlQCzUi7r2iCEfifSTK8oJBMpK5kgHgwslAXeYwjougH9pDpV1nfRvEJrNj8mvetTWa4NjJ8Ndg
	R7n03i/AakWAV/DIqXWWUTyKbYy8bO/C/3TeNE1sFliWCwm3m1T13RrxPwB9QRmnC79bofihN4+l4
	Q8m9QDBLiD6V4UT6NGF7ilot4iQ3sNVNC9BeArSftroM1X5IGxU2L8g2IxWjNsei588P8KSmANL6a
	9XuP3VlD1xUYATQlYFMjypHw4dVrJGvTn7WJhUKuzpZ+1hFj+fWpsMS2YfY/zV2KnYNy78LsDNXiL
	IFiuIh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Gl-0000000BqJq-4AMU;
	Thu, 19 Nov 2026 12:29:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Gj-0000000BqJP-0eJn
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:29:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 182124E41665;
	Thu, 19 Nov 2026 12:29:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC42360237;
	Thu, 19 Nov 2026 12:29:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDAF011BC03CF;
	Thu, 19 Nov 2026 13:29:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I5kM6fRDA3G9Ft88zbwbvx681/qfCITq2LFIa1aGdno=;
	b=gE+OYUHRuCH4EyQw9q30u+uHjHAX8yoadHzMdng8XO8JLrnll2Rr+IRFc1d8hotzsbhsTL
	+GBazhJVI4CYk0a45zBJbc0QEqX+SAFTFd7QVaS+M2BduBq4/WpfVZZ/c8EG8XKh8wyCjD
	D7397fJqui0aqyGhn5F6pEH8gv+1YDALeaGGHMUOmxwsfOHnOpkegu11bY/BbEO0nyYdnd
	Jv9W5K+At6XZhv+ei9pQx8cHo2aHfl4tShWhbB4jCpCpqpo42t6emVBc5oWETuKtXubi6K
	YvKgeULuHE1TBIcZPxKUeaK6t/7yqm+pimhdC4yT2Sg0UocVQaRt7eac23h8SQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "James Hilliard" <james.hilliard1@gmail.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>,  "Clark Williams"
 <clrkwllms@kernel.org>,  "Steven Rostedt" <rostedt@goodmis.org>,  "Rob
 Herring" <robh@kernel.org>,  "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
  "Conor Dooley" <conor+dt@kernel.org>,  "Philipp Zabel"
 <p.zabel@pengutronix.de>,  sashiko-reviews@lists.linux.dev,  "Chen-Yu
 Tsai" <wens@kernel.org>,  "Jernej Skrabec" <jernej.skrabec@gmail.com>,
  "Samuel Holland" <samuel@sholland.org>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Richard Genoud" <richard.genoud@bootlin.com>,
  "Boris Brezillon" <bbrezillon@kernel.org>,  "Masahiro Yamada"
 <yamada.masahiro@socionext.com>,  "Brian Norris"
 <computersforpeace@gmail.com>,  linux-mtd@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-rt-devel@lists.linux.dev,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 01/26] mtd: rawnand: sunxi: centralize OOB handling
In-Reply-To: <sashiko-outbox-199823@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 05 Nov 2026 19:13:20 +0000")
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
	<20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-1-dca1f6ed29a8@gmail.com>
	<sashiko-outbox-199823@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 13:29:23 +0100
Message-ID: <877bi9dmxo.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_042937_330922_B9661D47 
X-CRM114-Status: GOOD (  14.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDUvMTEvMjAyNiBhdCAxOToxMzoyMCBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hdIG10ZDog
cmF3bmFuZDogc3VueGk6IHByZW1hdHVyZSBvb2Jfb3BzIHNlbGVjdGlvbiBpbiBzdW54aV9uYW5k
X2F0dGFjaF9jaGlwKCkKPiAtIFtNZWRpdW1dIG10ZDogcmF3bmFuZDogc3VueGk6IHVuYWRkcmVz
c2VkIG1haW50YWluZXIgTkFDSyBvbiB2ZW5kb3IgT09CIGxheW91dCBvcHMKPiAtLQo+Cj4gY29t
bWl0IDhmZGE1Yzk5ZDliZWZhMTc3MTQxODUxNjgyOGYwNDBkZTYwYzU4NDUKPiBBdXRob3I6IEph
bWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Cj4gbXRkOiByYXduYW5k
OiBzdW54aTogY2VudHJhbGl6ZSBPT0IgaGFuZGxpbmcKPgo+IFRoaXMgY29tbWl0IGNlbnRyYWxp
emVzIGhhcmR3YXJlIEVDQyByZXN1bHQgaW50ZXJwcmV0YXRpb24sIHByb3RlY3RlZCBPT0IKPiBy
ZXRyaWV2YWwsIGVyYXNlZC1jaHVuayBjaGVja2luZywgYW5kIHVzZXItZGF0YSBsYXlvdXQgcmVz
ZXJ2YXRpb24gYmVoaW5kCj4gcGVyLWNoaXAgc3VueGlfbmZjX29vYl9vcHMgY2FsbGJhY2tzIGZv
ciBib3RoIFBJTyBhbmQgRE1BIHBhdGhzLgo+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMK
Pj4gaW5kZXggZjQxZmVlYmU0MjU3MS4uODAwMDZkMWEzM2Q2OCAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3N1bnhpX25hbmQuYwo+IFsgLi4uIF0KPj4gQEAgLTIwNjYsNiArMjA5Niw1OCBAQCBzdGF0
aWMgaW50IHN1bnhpX25mY19tYXhpbWl6ZV91c2VyX2RhdGEoc3RydWN0Cj4+IG5hbmRfY2hpcCAq
bmFuZCwgdWludDMyX3Qgb29ic2l6ZQo+IFsgLi4uIF0KPj4gKy8qCj4+ICsgKiBCb3RoIG1vZGVz
IHVzZSB0aGUgc2FtZSBsYXlvdXQgYW5kIEVDQyBwb2xpY3kuIFNjcmFtYmxlZCB0cmFuc2ZlcnMg
YWxzbwo+PiArICogY29tcGVuc2F0ZSB0aGUgZmlyc3QgdHdvIHVzZXIgYnl0ZXMgdG8ga2VlcCB0
aGUgb24tZmxhc2ggQkJNIHVubW9kaWZpZWQuCj4+ICsgKi8KPj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3Qgc3VueGlfbmZjX29vYl9vcHMgc3VueGlfbmZjX3BsYWluX29vYl9vcHMgPSB7Cj4+ICsJLm1p
bl91c2VyX2RhdGEgPSBzdW54aV9uZmNfb29iX21pbl91c2VyX2RhdGEsCj4+ICsJLmluaXRfdXNl
cl9kYXRhID0gc3VueGlfbmZjX29vYl9pbml0X3VzZXJfZGF0YSwKPj4gKwkucmVhZF9iYXRjaCA9
IHN1bnhpX25mY19vb2JfcmVhZF9iYXRjaCwKPj4gKwkuZmluaXNoX3JlYWQgPSBzdW54aV9uZmNf
b29iX2ZpbmlzaF9yZWFkLAo+PiArfTsKPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzdW54
aV9uZmNfb29iX29wcyBzdW54aV9uZmNfc2NyYW1ibGVkX3BsYWluX2JibV9vb2Jfb3BzID0gewo+
PiArCS5taW5fdXNlcl9kYXRhID0gc3VueGlfbmZjX29vYl9taW5fdXNlcl9kYXRhLAo+PiArCS5p
bml0X3VzZXJfZGF0YSA9IHN1bnhpX25mY19vb2JfaW5pdF91c2VyX2RhdGEsCj4+ICsJLnRyYW5z
Zm9ybV9iYm0gPSBzdW54aV9uZmNfcmFuZG9taXplX2JibSwKPj4gKwkucmVhZF9iYXRjaCA9IHN1
bnhpX25mY19vb2JfcmVhZF9iYXRjaCwKPj4gKwkuZmluaXNoX3JlYWQgPSBzdW54aV9uZmNfb29i
X2ZpbmlzaF9yZWFkLAo+PiArfTsKPgo+IFtTZXZlcml0eTogTWVkaXVtXQo+IEFzIHJlcG9ydGVk
IGJ5IE1pcXVlbCBSYXluYWwgb24gdjYgWzFdLCB0aGUgc2VyaWVzIGFkZGluZyBzdXBwb3J0IGZv
ciB0aGUKPiB2ZW5kb3Itc3BlY2lmaWMgQWxsd2lubmVyIHJhbmRvbWl6ZWQgT09CIGxheW91dCB3
YXMgZGVjbGluZWQgZHVlIHRvCj4gbWFpbnRhaW5hYmlsaXR5IGNvbmNlcm5zIGFuZCBrZXJuZWwg
cG9saWN5IGFnYWluc3QgdmVuZG9yLXNwZWNpZmljIE5BTkQKPiBsYXlvdXRzLCB3aXRoIGFuIGlu
dml0YXRpb24gdG8gc3VibWl0IG9ubHkgdGhlIHN0YW5kYWxvbmUgZml4ZXMgb3V0c2lkZSBvZgo+
IHRoZSByYW5kb21pemVkIGxheW91dCBzdXBwb3J0LgoKSSBoZXJlYnkgY29uZmlybSB0aGF0IEkg
ZG8gbm90IHdoaWNoIHRvIG1lcmdlIHRoZSBzdXBwb3J0IGZvciB0aGlzCmxheW91dC4KClBsZWFz
ZSBkcm9wIGl0IGZyb20geW91ciBzZXJpZXMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
