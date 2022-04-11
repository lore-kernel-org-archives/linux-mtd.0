Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC60C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbyVFc17JNiFpOY5qp0SSr4Kl6we7io3kd72YXzMkLc=; b=ugv+dfE8CMmwI6
	WoyP5KI1E479aeBRkP0TbelnZhxmEe7+rZKOb7iQEZFrY5TvDWGaK9UtsWMwIrIQrm/fk3MGKDpPQ
	0UXlf+PIy1x4DZVeutatV+EA50Md9uuZ06bqdJngwWTwMgJP4FvQM5k964UAA45O7BE0gIhb6pq6a
	IRZvExWz5qo5j1DzFo7PCSTrnR90PdBh6/k2BVHM49GEEehfT5WrLGo6Xghb917x4lfJod92kZt7C
	Uo2R+ZG9ZVW/wkfC0bmY6ts7+BMR4KykxwJZWydVfjcE3P0V2ah1xmaYGYBu/GHiWNmEVBrqHizzY
	oCw+g0oL9RxXTI0XPetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne0GC-00AOwU-5j; Mon, 11 Apr 2022 20:03:40 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne0Fp-00AOhi-M9
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 20:03:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7CDFA20005;
 Mon, 11 Apr 2022 20:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649707393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKnSIbvUuStN5hLZe40R8c1uB7vB9Kw6MK6UQp86Rns=;
 b=a4FCd+ukP6vnLVBImS+lwm1MylWr3RUFvWHn3KoaO5ojNIBlZ/LJmx6NlSDCCZYV3DK6nE
 wo7npjiAyNf0G1a7lL/GauwOAB5rCYijblprnImiEvHMsfURR4GlU9gl44YnvMHNyk1XyJ
 pv0wOZ7uIrTqtp2/GgQMIxLQ/zArXOr0Ia0Wofc9xIxkmzAnMcxEw8V+i+96Aw3srPfJFn
 1SxT+XZ2OJRlz8gUBHtyO5Ll+JbCp/Z60L+j7B2I7Dbbokizx7d4LfrVVowhAHrvHb3nLP
 4TV+pj7rQMd39lfrHFKz8O2Q+R76YWIRySg+YxIR8DNfEWO9QEHjyMB81REAPA==
Date: Mon, 11 Apr 2022 22:03:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Felix Matouschek <felix@matouschek.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add support for XTX XT26G0xA
Message-ID: <20220411220310.14e2da32@xps13>
In-Reply-To: <e697bea9-29b6-2f83-7d42-02afd88fa6b1@matouschek.org>
References: <20220408161904.94383-1-felix@matouschek.org>
 <20220411092311.3f0b97b3@xps13>
 <e697bea9-29b6-2f83-7d42-02afd88fa6b1@matouschek.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_130318_051617_CB8A873D 
X-CRM114-Status: GOOD (  16.25  )
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

SGkgRmVsaXgsCgpmZWxpeEBtYXRvdXNjaGVrLm9yZyB3cm90ZSBvbiBNb24sIDExIEFwciAyMDIy
IDIxOjUzOjA2ICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gQW0gMTEuMDQuMjIgdW0gMDk6MjMg
c2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+ID4+ICtzdGF0aWMgaW50IHh0MjZnMHhhX2VjY19nZXRf
c3RhdHVzKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiA+PiArCQkJCQkgdTggc3Rh
dHVzKQo+ID4+ICt7Cj4gPj4gKwlzd2l0Y2ggKHN0YXR1cyAmIFhUMjZHMFhBX1NUQVRVU19FQ0Nf
TUFTSykgewo+ID4+ICsJY2FzZSBYVDI2RzBYQV9TVEFUVVNfRUNDX05PX0RFVEVDVEVEOgo+ID4+
ICsJCXJldHVybiAwOwo+ID4+ICsJY2FzZSBYVDI2RzBYQV9TVEFUVVNfRUNDXzhfQ09SUkVDVEVE
Ogo+ID4+ICsJCXJldHVybiA4Owo+ID4+ICsJY2FzZSBYVDI2RzBYQV9TVEFUVVNfRUNDX1VOQ09S
X0VSUk9SOgo+ID4+ICsJCXJldHVybiAtRUJBRE1TRzsKPiA+PiArCWRlZmF1bHQ6IC8qICgxIDw8
IDIpIHRocm91Z2ggKDcgPDwgMikgYXJlIDEtNyBjb3JyZWN0ZWQgZXJyb3JzICovCj4gPj4gKwkJ
cmV0dXJuIChzdGF0dXMgJiBYVDI2RzBYQV9TVEFUVVNfRUNDX01BU0spID4+IDI7Cj4gPj4gKwl9
Cj4gPj4gKwo+ID4+ICsJcmV0dXJuIC1FSU5WQUw7ICAKPiA+IAo+ID4gWW91J2xsIG5ldmVyIGVu
ZCBoZXJlLCByaWdodD8gUGVyaGFwcyB0aGVyZSBhcmUgdmFsdWVzIHRoYXQgeW91IGNhbm5vdAo+
ID4gaGFuZGxlIGNvcnJlY3RseSBpbiB0aGUgc3dpdGNoIGFuZCB5b3Ugc2hvdWxkIGFkZCBhIGJp
dCBtb3JlIGxvZ2ljIHRvCj4gPiByZXR1cm4gLUVJTlZBTCBpZiBzb21ldGhpbmcgaXMgd3Jvbmc/
IE90aGVyd2lzZSB5b3Ugd2lsbCByZXR1cm4gMAo+ID4gYWJvdmUsIHdoaWNoIG1pZ2h0IGJlIGNv
cnJlY3QgKEknbGwgbGV0IHlvdSB2ZXJpZnkgYnV0IGluIHRoaXMKPiA+IGNhc2UgdGhlIGZpbmFs
ICJyZXR1cm4gLUVJTlZBTCIgc2VlbXMgdXNlbGVzcy4gIAo+IAo+IEFjY29yZGluZyB0byB0aGUg
ZGF0YS1zaGVldCAoc2VjdGlvbiA3LCBwYWdlIDI3KSB0aGUgc3dpdGNoIHNob3VsZCBiZQo+IGFi
bGUgdG8gaGFuZGxlIGFsbCB2YWx1ZXMgb2YgdGhlIHN0YXR1cyByZWdpc3Rlci4gU28gc2hvdWxk
IEkgcmVtb3ZlIHRoZQo+IGZpbmFsICJyZXR1cm4gLUVJTlZBTCI/CgpJIHRoaW5rIHNvLCB5ZXMu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
