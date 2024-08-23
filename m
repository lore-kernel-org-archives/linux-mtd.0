Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F42C531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gD3XPlXNPWJiFBHDTZrknNn1y4dcrnEvd5whW1z4sYo=; b=0JtF9d/nHHVR2e
	j4Jlw9J5GRu7p4uJbwD6V3LGNbbgnB3/tFQC1mdO/QqODDPZNq5LVekyfMoVP0RRi5J+6xJ4Qt1z7
	zafCZHWJ0tOymcLuIhZFnfi9dbNmbzZkwv7T1ut/klm3TPNrDf2/tarn5jMEOZsk8QdUP3WpVpGAs
	Nqo2hxGb26j8evlU0qQtszLaGBtW55xrk3JS53Stg9OwpYjXIaIlZF+HoKfE0+kG95XXIHh15/TZ2
	tm/593C8YuQxK5pUHhHRNWHGvRUUuaQyOYLwr0KhQlO4g4IjvS2h7BbJJe/DBgh4Ui9kLkDcw+ENW
	XbwJMLg+2Kn4zeKLWajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYAK-000000009Vw-2kBN;
	Fri, 23 Aug 2024 17:33:36 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYAH-000000009Ss-28TV
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:33:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55DC9FF802;
	Fri, 23 Aug 2024 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kB7RsilmKxOThANKEwiQDRFUDRaozJrT72dVND4PyBk=;
	b=L0rWyoilr8WfIm+kx7cqFPFnXYBzVv9ncPvfZsJjs/bfdKTdKkqZzdbNEJqAI1CF8JFKg9
	XvVUnraCuxbaiupy2/arVwwx7lhASpKAmqYsBwqwbqqUJakljASMTn9WZPi++5Jh4rTCUx
	0/ZymfspuSbp81nh5K9NYNYuaAB3ToxdoInpPK8zDUXsGQFb38Glhokm3c6eWvoQtxOam7
	bLiOPTna8mjqhqmsYksXFmfNpw8XRlF6yHFUX8SG+FBnSyksQhHfcW2ZV6On5YwFENugKZ
	WkHt7TlPOnzGUfy1GUiTuBFDKjG1SUqU3MZv953LFINc3q/n7TETv/X1wWPfzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mirsad Todorovac <mtodorovac69@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: slram: insert break after errors in parsing the map
Date: Fri, 23 Aug 2024 19:33:29 +0200
Message-ID: <20240823173329.441853-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240711234319.637824-1-mtodorovac69@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'336c218dd7f0588ed8a7345f367975a00a4f003f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_103333_714958_B2CE5DB3 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCAyMDI0LTA3LTExIGF0IDIzOjQzOjIwIFVUQywgTWlyc2FkIFRvZG9yb3ZhYyB3cm90
ZToKPiBHQ0MgMTIuMy4wIGNvbXBpbGVyIG9uIGxpbnV4LW5leHQgbmV4dC0yMDI0MDcwOSB0cmVl
IGZvdW5kIHRoZSBleGVjdXRpb24KPiBwYXRoIGluIHdoaWNoLCBkdWUgdG8gbGF6eSBldmFsdWF0
aW9uLCBkZXZsZW5ndGggaXNuJ3QgaW5pdGlhbGlzZWQgd2l0aCB0aGUKPiBwYXJzZWQgc3RyaW5n
Ogo+IAo+ICAgIDI4OQkJd2hpbGUgKG1hcCkgewo+ICAgIDI5MAkJCWRldm5hbWUgPSBkZXZzdGFy
dCA9IGRldmxlbmd0aCA9IE5VTEw7Cj4gICAgMjkxCj4gICAgMjkyCQkJaWYgKCEoZGV2bmFtZSA9
IHN0cnNlcCgmbWFwLCAiLCIpKSkgewo+ICAgIDI5MwkJCQlFKCJzbHJhbTogTm8gZGV2aWNlbmFt
ZSBzcGVjaWZpZWQuXG4iKTsKPiAgICAyOTQJCQkJYnJlYWs7Cj4gICAgMjk1CQkJfQo+ICAgIDI5
NgkJCVQoInNscmFtOiBkZXZuYW1lID0gJXNcbiIsIGRldm5hbWUpOwo+ICAgIDI5NwkJCWlmICgo
IW1hcCkgfHwgKCEoZGV2c3RhcnQgPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7Cj4gICAgMjk4CQkJ
CUUoInNscmFtOiBObyBkZXZpY2VzdGFydCBzcGVjaWZpZWQuXG4iKTsKPiAgICAyOTkJCQl9Cj4g
ICAgMzAwCQkJVCgic2xyYW06IGRldnN0YXJ0ID0gJXNcbiIsIGRldnN0YXJ0KTsKPiAg4oaSIDMw
MQkJCWlmICgoIW1hcCkgfHwgKCEoZGV2bGVuZ3RoID0gc3Ryc2VwKCZtYXAsICIsIikpKSkgewo+
ICAgIDMwMgkJCQlFKCJzbHJhbTogTm8gZGV2aWNlbGVuZ3RoIC8gLWVuZCBzcGVjaWZpZWQuXG4i
KTsKPiAgICAzMDMJCQl9Cj4gIOKGkiAzMDQJCQlUKCJzbHJhbTogZGV2bGVuZ3RoID0gJXNcbiIs
IGRldmxlbmd0aCk7Cj4gICAgMzA1CQkJaWYgKHBhcnNlX2NtZGxpbmUoZGV2bmFtZSwgZGV2c3Rh
cnQsIGRldmxlbmd0aCkgIT0gMCkgewo+ICAgIDMwNgkJCQlyZXR1cm4oLUVJTlZBTCk7Cj4gICAg
MzA3CQkJfQo+IAo+IFBhcnNpbmcgc2hvdWxkIGJlIGZpbmlzaGVkIGFmdGVyIG1hcCA9PSBOVUxM
LCBzbyBhIGJyZWFrIGlzIGJlc3QgaW5zZXJ0ZWQgYWZ0ZXIKPiBlYWNoIEUoInNscmFtOiAuLi4g
XG4iKSBlcnJvciBtZXNzYWdlLgo+IAo+IEZpeGVzOiAxZGExNzdlNGMzZjQgKCJMaW51eC0yLjYu
MTItcmMyIikKPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
PiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiBDYzogVmlnbmVzaCBS
YWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE1pcnNhZCBUb2Rvcm92YWMgPG10b2Rvcm92YWM2OUBn
bWFpbC5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
