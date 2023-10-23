Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF1BCDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 08:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9bFRdVhmH12+HIfnH2YPWfBFpoAoZb/ioqCEagy9ps=; b=gIGUYq7fTsuusk
	ZX4boFA65/BjsblOQxikpAQinrjP+yzRZm2G7dQulU9my8CEN2tc1l9uniEEWc/NQdswueaFNIQOI
	uVRoj/A1RH3vFb+8BXsFu2bu+1Jam03ky+yGF381FtTstlsgqLYvhgBDP+MPpMkmf2uvnqenTMAzJ
	br4sS9H9asmVS8hK4U1mnCaabUq5EBodDOE2aYXc3NrAqAbXiNXvAsrl7UPCWsZwH7zQ3YhiUVntL
	cJiNgVqNEuzogXgiWkJbtNe4nMOwhBd4cNTMwL9ui/B3ZzA9/oyWSd0uoyPnTBbjipDgga8mNq89q
	phup3i6LNkZpftDQMX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqG9-006kFz-1t;
	Mon, 23 Oct 2023 08:26:01 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqG5-006kEl-2P
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 08:25:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85424E000B;
	Mon, 23 Oct 2023 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698049554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zH7kvmH3ojoWMj9A0P1moFfx4wi0a2NDXu5JLkLu5dI=;
	b=ORcCWdoQOxle8Dj1g3NtvFSN1Kn3zGbnY+5+WIch8s2EmUwNNFyJEX4Yv0BPYN62nhHbxX
	C1SaoZesOnCZWUXZKcNLu1MAqd11Uji4mpuq4/ghZ3VvpHrKSQ8gDln0rNNQTUa2tkmc/O
	Bih2B8DULFedvN6KO7KEiASDeTaGc8xFa5J0H6xDRE3RqeqYLIF1CVp6a7sZFhKUooX5Yi
	1cJ/ZeiB0edSteaBp3HGQoLU7pDMvm+pTzMZuIQ3VYeRj0g/liY2IaBHEdDCibJ012ghyD
	aeUuiZyu5O2LKQO2iFea6Dr2t1dKMlpemycAF3nHsOLUO6Gl9T5d42ydVPknnA==
Date: Mon, 23 Oct 2023 10:25:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Nicolas Pitre
 <nico@fluxnic.net>
Subject: Re: [PATCH v4] mtd: cfi_cmdset_0001: Byte swap OTP info
Message-ID: <20231023102552.4b053b17@xps-13>
In-Reply-To: <20231020-mtd-otp-byteswap-v4-1-0d132c06aa9d@linaro.org>
References: <20231020-mtd-otp-byteswap-v4-1-0d132c06aa9d@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012557_928407_3C1F9F95 
X-CRM114-Status: GOOD (  18.52  )
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

SGkgTGludXMsCgpsaW51cy53YWxsZWlqQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAyMCBPY3Qg
MjAyMyAyMjozMDoyOSArMDIwMDoKCj4gQ3VycmVudGx5IHRoZSBvZmZzZXQgaW50byB0aGUgZGV2
aWNlIHdoZW4gbG9va2luZyBmb3IgT1RQCj4gYml0cyBjYW4gZ28gb3V0c2lkZSBvZiB0aGUgYWRk
cmVzcyBvZiB0aGUgTVREIE5PUiBkZXZpY2VzLAo+IGFuZCBpZiB0aGF0IG1lbW9yeSBpc24ndCBy
ZWFkYWJsZSwgYmFkIHRoaW5ncyBoYXBwZW4KPiBvbiB0aGUgSVhQNHh4IChhZGRlZCBwcmludHMg
dGhhdCBpbGx1c3RyYXRlIHRoZSBwcm9ibGVtIGJlZm9yZQo+IHRoZSBjcmFzaCk6Cj4gCj4gY2Zp
X2ludGVsZXh0X290cF93YWxrIHdhbGsgT1RQIG9uIGNoaXAgMCBzdGFydCBhdCByZWdfcHJvdF9v
ZmZzZXQgMHgwMDAwMDEwMAo+IGl4cDR4eF9jb3B5X2Zyb20gY29weSBmcm9tIDB4MDAwMDAxMDAg
dG8gMHhjODgwZGQ3OAo+IGNmaV9pbnRlbGV4dF9vdHBfd2FsayB3YWxrIE9UUCBvbiBjaGlwIDAg
c3RhcnQgYXQgcmVnX3Byb3Rfb2Zmc2V0IDB4MTIwMDAwMDAKPiBpeHA0eHhfY29weV9mcm9tIGNv
cHkgZnJvbSAweDEyMDAwMDAwIHRvIDB4Yzg4MGRkNzgKPiA4PC0tLSBjdXQgaGVyZSAtLS0KPiBV
bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3Mg
ZGIwMDAwMDAKPiBbZGIwMDAwMDBdICpwZ2Q9MDAwMDAwMDAKPiAoLi4uKQo+IAo+IFRoaXMgaGFw
cGVucyBpbiB0aGlzIGNhc2UgYmVjYXVzZSB0aGUgSVhQNHh4IGlzIGJpZyBlbmRpYW4gYW5kCj4g
dGhlIDMyLSBhbmQgMTYtYml0IGZpZWxkcyBpbiB0aGUgc3RydWN0IGNmaV9pbnRlbGV4dF9vdHBp
bmZvIGFyZSBub3QKPiBwcm9wZXJseSBieXRlc3dhcHBlZC4gQ29tcGFyZSB0byBob3cgdGhlIGNv
ZGUgaW4gcmVhZF9wcmlfaW50ZWxleHQoKQo+IGJ5dGVzd2FwcyB0aGUgZmllbGRzIGluIHN0cnVj
dCBjZmlfcHJpX2ludGVsZXh0Lgo+IAo+IEFkZGluZyBhIHNtYWxsIGJ5dGUgc3dhcHBpbmcgbG9v
cCBmb3IgdGhlIE9UUCBpbiByZWFkX3ByaV9pbnRlbGV4dCgpCj4gYW5kIHRoZSBjcmFzaCBnb2Vz
IGF3YXkuCj4gCj4gVGhlIHByb2JsZW0gd2VudCB1bm5vdGljZWQgZm9yIG1hbnkgeWVhcnMgdW50
aWwgSSBlbmFibGVkCj4gQ09ORklHX01URF9PVFAgb24gdGhlIElYUDR4eCBhcyB3ZWxsLCB0cmln
Z2VyaW5nIHRoZSBidWcuCj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCldvdWxkIHlv
dSBsaWtlIHRvIGFkZCBhIEZpeGVzIHRhZyBhcyB3ZWxsPyBPciBpcyB0aGlzIHNraXBwZWQgb24K
cHVycG9zZT8KCj4gUmV2aWV3ZWQtYnk6IE5pY29sYXMgUGl0cmUgPG5pY29AZmx1eG5pYy5uZXQ+
Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
Pgo+IC0tLQo+IENoYW5nZUxvZyB2My0+djQ6Cj4gLSBDb2xsZWN0ZWQgTmljbydzIEFDSy4KPiAt
IFN0YWxsZWQgc2luY2UganVuZSEgSGFzIHRoaXMgYmVlbiBtaXNzZWQ/CgpPdXIgY3VycmVudCBv
cmdhbml6YXRpb24gcmVsaWVzIG9uIFZpZ25lc2ggdG8gcGljay11cCAob3IgdGVsbCBtZSB0bwpw
aWNrLXVwKSBjZmkgcGF0Y2hlcy4gQnV0IGhlIGlzIHNsaWdodGx5IGxlc3MgYWN0aXZlIHRoZXNl
IGRheXMsIHNvIGlmIEkKZG9uJ3QgZ2V0IGFueSBmZWVkYmFjayBmcm9tIGhpbSBzb29uIEkgd2ls
bCB0YWtlIGl0IGZvciB0aGUgbmV4dCBtZXJnZQp3aW5kb3cuCgpTb3JyeSBmb3IgdGhlIGRlbGF5
IGFueXdheS4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
