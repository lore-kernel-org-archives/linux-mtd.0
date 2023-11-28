Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDFBC4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvc/0+h2LMumBjO0oLUp9ZGJgyqJInLiCuN1O1IEWis=; b=2bH19zVCPKCM27
	yBhh7ze4tfN5/cv3sVI/ySCJf2oeNhuTyMiXOvq7Yy6CSTpu6jVONQmpj1FocL5uNetCSy6COqbHZ
	xG7HaSQKcYjAS/5UK9y9D2FtWjOD1TaLD9BrD7ZopOjqoN+yQdlHAri8PKahSlY/8ZP5z6K/XCgiQ
	eIJg8/LO8nuJQVjVX3gYQ9Mtzz1WeGzbAH8wze7fGI4akpzUjc7vQewNQaKBCsZIkl+Tkc4djvg72
	WgT4WA/F/EOBhZ7illsKzr7+uGbdwhnH4rDE3ZUdm5lYab4sfCr1/IZeKKOtD+2WNbhCNdmWfSnqb
	erLSYXZX/ltWM4XqleUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7vtL-0050Mq-0O;
	Tue, 28 Nov 2023 11:04:35 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7vtI-0050Lf-1y
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 11:04:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17DFA1BF204;
	Tue, 28 Nov 2023 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701169468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALB/2PJEXwYVACiswllyZ9AnZktQ1Oe3z8KlIjb4z+c=;
	b=BPngda0vE5ETpklq77sq1GUwPFNyctL1BJmAT/UCw/0l75QLzSRYcQZASa1txykwx9zeTj
	HPqac2Tr91WodiXNs9mjHoqa+ieBzoDLmMMlG8TbfDNhyCd+NjiKO2hljWG6hy/fQKZDLH
	rFNt4VM60CeXSretMtIn6snkbwFxZ4Z+XxS2wsFOCNBxEvxVzaFlOyF32F5VfASyXpXqIb
	BrSIY4FgH0mnwgxqDsb/FrFpplQLt7m17s9DeEEN1EDuPl0NAyNq1S+6uhRLdSROeM9r9v
	Chw9n1sOUSY6mH4A7mmMLe6xh92sRgajnG+DqETQDD5nJtPApmXdKRyMexYnDw==
Date: Tue, 28 Nov 2023 12:04:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: liao jaime <jaimeliao.tw@gmail.com>, Michael Walle <michael@walle.cc>,
 jaimeliao@mxic.com.tw, pratyush@kernel.org, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
Message-ID: <20231128120424.79f8f215@xps-13>
In-Reply-To: <756aa94a-3237-4689-885a-1e17504e72b6@linaro.org>
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
	<42c96d63d1ea4f7e8f16a3c8eb0a4cf1@walle.cc>
	<20231128100313.3c990f69@xps-13>
	<18ba4126dbd9e49846344b517ad2fbdd@walle.cc>
	<CAAQoYR=ZAEVeoCwkRmky2CHVeKGX55JijM8Q6D5msz_5iW+jtw@mail.gmail.com>
	<d7bb4580-00b9-4206-bbfc-bd203c21a877@linaro.org>
	<756aa94a-3237-4689-885a-1e17504e72b6@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_030432_791442_ADC90F32 
X-CRM114-Status: GOOD (  19.98  )
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

SGVsbG8sCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCAyOCBOb3YgMjAy
MyAwOTo0NzoyMiArMDAwMDoKCj4gT24gMTEvMjgvMjMgMDk6MzksIFR1ZG9yIEFtYmFydXMgd3Jv
dGU6Cj4gPiAKPiA+IGN1dAo+ID4gICAKPiA+Pj4+IE1heWJlIHdlIGRvbid0IG5lZWQgdGhpcyBh
dCBhbGwsIGFzIGxvbmcgYXMgb25lIG1lc3NhZ2UgcmVtYWlucyBhYm91dAo+ID4+Pj4gdGhlIEpF
REVDIElELCBidXQga2VlcCBpbiBtaW5kIHRoYXQgc3BpLW5vcnMgYXJlIGNvbW1vbmx5IHN0b3Jp
bmcgdGhlCj4gPj4+PiByb290ZnMgYW5kIGlmIHlvdXIgc3BpLW5vciBkb2VzIG5vdCBib290IHlv
dSBkb24ndCBoYXZlIGEgdXNlcnNwYWNlIHlldAo+ID4+Pj4gYW5kIGFsbCB0aGUgZGVidWdmcyBl
bnRyaWVzIGFyZSBwdXJlbHkgdXNlbGVzcy4gIAo+ID4+Pgo+ID4+PiBHb29kIHBvaW50Lgo+ID4+
Pgo+ID4+PiBKdXN0IGN1cmlvdXMsIGRvIHlvdSBrbm93IGFueSBib2FyZHMgd2hpY2ggaGFzIHRo
ZSByb290ZnMgd3JpdGFibGUgb24KPiA+Pj4gdGhlIHNwaS1ub3IgZmxhc2g/ICAKPiA+PiBJIGFt
IGFsc28gaW50ZXJlc3RlZC4KPiA+PiAgCj4gPiAKPiA+IEhhdmluZyB0aGUgcm9vdGZzIHN0b3Jl
ZCBvbiBTUEkgTk9SIGlzIGEgcG9vciBkZXNpZ24gZGVjaXNpb24gYXMgeW91J3JlCj4gPiBiZXR0
ZXIgb2Ygd2l0aCBhIE5BTkQsIHdoaWNoIGlzIGNoZWFwZXIgYW5kIGZhc3RlciBvbiB3cml0ZXMu
IEkgdHJpZWQgaW4KPiA+IHRoZSBwYXN0IGEgdWJpZnMgb24gdG9wIG9mIGEgbGFyZ2UgKDY0IGFu
ZCAxMjhNQikgU1BJIE5PUiBmbGFzaC4gQnV0Cj4gPiB0aGV5IHdlcmUgcGx1Zy1hYmxlIGZsYXNo
ZXMsIG5vdCBzb21ldGhpbmcgdGhhdCBpcyBhbHdheXMgdGllZCB0byB0aGUKPiA+IGJvYXJkLiBN
aWNyb2NoaXAncyBzYW1hN2c1ZWsgY29tZXMgd2l0aCBhIDEyOE1CIG1hY3Jvbml4IFNQSSBOT1Ig
Zmxhc2gKPiA+IHBvcHVsYXRlZC4gQnV0IHRoZXJlIGFyZSBvdGhlciB2ZW5kb3JzIHRoYXQgcHJv
dmlkZSBsYXJnZSBTUEkgTk9ScyBpZgo+ID4gcmVhbGx5IG5lZWRlZC4KPiA+ICAgCj4gCj4gcHJl
c3NlZCBzZW50IHRvbyBzb29uIDopLiBXaGF0IEkgd2FudGVkIHRvIHNheSBpcyB0aGF0IGl0J3Mg
bm90IHVuY29tbW9uCj4gZm9yIHZlbmRvcnMgdG8gcG9wdWxhdGUgbGFyZ2UgU1BJIE5PUiBmbGFz
aGVzLCB0aGVyZSBhcmUgb3RoZXJzIGFzIHdlbGwsCj4gdGh1cyBNaXF1ZWwncyBjb25jZXJucyBh
cmUgdmFsaWQuIFRoZXJlIG1heSBiZSBwZW9wbGUgb3V0IHRoZXJlIGhhdmluZwo+IHJvb3RmcyBv
biB0b3Agb2YgU1BJIE5PUnMuCgpJIGRvbid0IHRoaW5rIGl0IGlzIGEgdG9vIGJhZCBhcHByb2Fj
aCB0byBzdG9yZSBhIHJvb3RmcyBvbiBhIHNwaS1ub3IsCmFzIGxvbmcgYXMgeW91ciAicmVndWxh
cmx5IHdyaXR0ZW4iIGRhdGEgZmlsZXMgYXJlIHNvbWV3aGVyZSBlbHNlCihvdGhlcndpc2UgaXQn
cyBmaW5lLCBidXQgc2xvdykuIEl0J3MgYWN0dWFsbHkgbmljZSB0byBrZWVwIHlvdXIgYm9vdApm
aWxlcyBhbmQgcm9vdGZzIGluIGEgInNhZmUiIHBsYWNlIHdoZXJlYXMgeW91ciBhcHAgaXMgc3Rv
cmVkIHNvbWV3aGVyZQplbHNlLCBzbyB1c2VycyBjYW4gbWVzcyBhcm91bmQ6IHRoZXkgd2lsbCBu
b3QgYnJlYWsgdGhlIHN5c3RlbS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
