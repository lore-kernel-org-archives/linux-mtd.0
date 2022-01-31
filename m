Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBA3C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 11:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcdL2YWX7XjN56jzbTFOPg+VYTuSVpwfGgBFvLBfZsg=; b=fxZ40DEj/pp5X/
	yelMzUF1NBUo9KeY/OPvgHVl25V8Z+JXkw2RqjLj8vlW0F3/QaAxii6sWtlGu1g4F6cPj72orQ06y
	VMsQrbfsYQQUIxULZWWMTLEofcknPrWPW1JOEy8XamF1Pn423yJ2eMd2JkSnZTy9/U7c55sufibi3
	FLDVDGE4O3mPfxrslDgdR8JsUhQDj+Q1rsWy/14omBZm2Kzc8rWovJEalORCbvGc0F/Mjhpwob1GR
	3nggNrbAfsgRlSW7q8mICXCRM7/PSwPK9g8UW/9c+ummsUnekepZoJcEGKZAqW+RHBO/HYc0Gw1MP
	bQuCHWJBRFW+XNLyAwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUQW-008zXQ-5r; Mon, 31 Jan 2022 11:00:52 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUQR-008zSg-IE
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 11:00:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6DFB720001C;
 Mon, 31 Jan 2022 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643626845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qpRm2aoCKVDJqwuvd8RI+w5uJK3oRuGvN3L6mkEPIE=;
 b=aUf3OsTGT5vTZZRpsKC1lgW4VHTWAZNJmcFqSchfFXvqxBUnBumttGqbOZfgiQaOKCgxWo
 y2z/M6x2A7FQ5AQhTFyhdImryvvYkiDF37PYc6Y2qI4dnVByjvyzsF1V0RT1+tnO93Vw8G
 CFgG7EXK8yFcRTFNSRQKAWobP4SAk0J6e4Z0HjrQX9CBW6kpP5wV64UGF1n4lY94xNPwn2
 h5ySKU9jVAB7C4LnOK9Mjctk56T6rqwxLRF2QJURSxVr+6r8wLpP+Yy6DvFwpmbx7jww8G
 joVTAHn4k0qnvgtKjc6cY/RZkngv7wE2RhU9edn8+CD2GcXXbApUIYgqMlHkVw==
Date: Mon, 31 Jan 2022 12:00:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH] mtd: nand: ecc: Rework Kconfig dependencies
Message-ID: <20220131120042.0958f89c@xps13>
In-Reply-To: <20220131105754.pwxkhjiuwpgj7kxg@ti.com>
References: <20220128171013.1251796-1-miquel.raynal@bootlin.com>
 <20220131105754.pwxkhjiuwpgj7kxg@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_030047_793993_9ADF6773 
X-CRM114-Status: GOOD (  12.81  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBNb24sIDMxIEphbiAyMDIyIDE2
OjI3OjU0ICswNTMwOgoKPiBPbiAyOC8wMS8yMiAwNjoxMFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gVW5saWtlICJkZXBlbmRzIG9uIiwgInNlbGVjdCIgZG9lcyBub3QgZW5mb3JjZSBhbnkg
dHlwZSAoeSBvciBtKSwgd2hpY2gKPiA+IGNhbiBsZWFkIHRvIHRoZSBmb2xsb3dpbmcgc2l0dWF0
aW9uOgo+ID4gKiBTUElfTVhJQz15IGV4cGVjdHMgdGhlIE5BTkQgc3ltYm9scyB0byBiZSBidWls
dCBzdGF0aWNhbGx5Cj4gPiAqIFNQSV9NWElDIGRlcGVuZHMgb24gTVREX05BTkRfRUNDCj4gPiAq
IE1URF9OQU5EX0VDQyBzZWxlY3RzIE1URF9OQU5EX0NPUkUKPiA+IEluIHRoaXMgY2FzZSBNVERf
TkFORF9DT1JFPW0gaXMgInZhbGlkIiBidXQgd2lsbCB0cmlnZ2VyIGxpbmsgZXJyb3JzCj4gPiBz
dWNoIGFzIHRoZSBvbmUgYmVsb3cuICAKPiAKPiBEaWQgeW91IGZvcmdldCB0byBwYXN0ZSB0aGUg
ZXJyb3IgbG9nPwoKT29wcyEgSW5kZWVkLgoKPiA+IFRoZSBjbGVhbmVzdCB3YXkgdG8gaGFuZGxl
IHRoZSBzaXR1YXRpb24gaXMgdG8gdXNlIGEgImRlcGVuZHMgb24iCj4gPiBiZXR3ZWVuIE1URF9O
QU5EX0VDQyBhbmQgTVREX05BTkRfQ09SRSB0byBhdm9pZCBzdWNoIHNpdHVhdGlvbnMuCj4gPiAK
PiA+IFdoaWxlIGF0IG1vZGlmeWluZyB0aGUgTVREX05BTkRfRUNDIHN5bWJvbCwgZml4IHRoZSBz
cGFjaW5nLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiAgCj4gCj4gUmV2aWV3ZWQtYnk6IFByYXR5dXNoIFlhZGF2IDxwLnlh
ZGF2QHRpLmNvbT4KClRoYW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
