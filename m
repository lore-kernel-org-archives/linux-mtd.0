Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B1BC25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzL5yMQIC+xtCUAnKAhESG5XZqBZJrstRaCXvEIzGSk=; b=kupkoGF8tBfIYU
	UfxkXINR5CryAveHoVSXKV9+8qtY0IiQgft0dOhM2Sc1X8EeXnMJrwRd3LVrdMfiIi2idWoxRrsHQ
	ULSfFR3Vh4UsW20DuUX6BynTfms2YL263i0kglBsz/zeX9hSnkczlW8VegeF3w8ffNV4XbzBGCgmO
	t+wmAKI/Yb9eiH2ZZsB+HnblfElv8o15/8CTXHJhssQQvPFk3mZL3gd2CPPbFcIZ/uzJxMUakJDaA
	SMD4Db5vbm4PvtMjQQ5mYFMM4JuMtbTlifdtkD+1Wjjy+A+Xxvf6zY9gGpB0T2+TqwPYK/bzTZQYx
	VZ6BZup9B5T6yJqoOh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7arU-00000004x07-2sxV;
	Thu, 16 May 2024 13:09:32 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7arQ-00000004wxA-2flv
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 13:09:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F87C1C0006;
	Thu, 16 May 2024 13:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715864966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AToU5AIFALBM7r0eZ6ZWKjQjRupuMORQSk8DoQTPoaU=;
	b=EpVoNl/PLweZX1UQu/60zZH4S/fB+lYjJ3t9ifkXUwYUpiIrqZBpMkkrbw5yuS+/iMppXc
	qm7cwMM9Auzy+PmwB+8ZDe+XGm5uhxiqkqrMkBUo85g22Q1raZAjcyhDoguIUmZ8DUBRwj
	ZNI4IR8mdXKl/CWRb3rTk61ds9Rl507aZNOodUHxb0X2B19uCG0y6dtjnkKUueJ/kcDx87
	GstCyPaBaSkAUl68VHGcU1Qpkw4xZDATaE8aSfpm9cxoORLeNCgYqsu42dkJphZbTlEgNk
	7dF2ay9C+SeUifLaLoBMj+xvQCabk6BlgZ/XN/6Pfpq2fOdUZopb2c4VLLaunQ==
Date: Thu, 16 May 2024 15:09:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: rawnand: onfi: read parameter pages in one go
Message-ID: <20240516150925.5c65319b@xps-13>
In-Reply-To: <ZkXylC2xrlqGW_xV@pengutronix.de>
References: <20240514134140.1050141-1-s.hauer@pengutronix.de>
	<20240516101350.78e5ee29@xps-13>
	<20240516115812.02908822@xps-13>
	<ZkXylC2xrlqGW_xV@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_060928_879471_2F69C9A8 
X-CRM114-Status: GOOD (  22.79  )
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

SGkgU2FzY2hhLAoKPiA+ID4gPiBuYW5kX3JlYWRfZGF0YV9vcCgpIGlzIG5vdCBzdXBwb3J0ZWQg
YnkgYWxsIE5BTkQgY29udHJvbGxlcnMuCj4gPiA+ID4gbmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5f
b3AoKSBpcyBub3Qgc3VwcG9ydGVkIG9yIGF0IGxlYXN0IGlzIGhhcmQgdG8KPiA+ID4gPiBzdXBw
b3J0IGJ5IE5BTkQgY29udHJvbGxlcnMgdGhhdCB1c2UgYSBkaWZmZXJlbnQgcGFnZSBsYXlvdXQg
dGhhbgo+ID4gPiA+IGV4cGVjdGVkIGJ5IHRoZSBOQU5EIGNvcmUuICAgIAo+ID4gPiAKPiA+ID4g
SSdtIHNvcnJ5IGJ1dCBSTkRPVVQgaXMgbm90IHNvIGhhcmQgdG8gc3VwcG9ydCwgYW5kIEkga25v
dyBubyBOQU5ECj4gPiA+IGNvbnRyb2xsZXIgd2l0aG91dCB0aGlzIGZlYXR1cmUgKEkgdGhpbmsg
ZXZlbiB0aGUgZmlyc3QgbXhjIGNvbnRyb2xsZXIKPiA+ID4gc3VwcG9ydHMgaXQ/KS4gSG93ZXZl
ciwgdGhlIGNvbW1hbmQgZG9lcyBub3QgZXhpc3Qgb24gc21hbGwgcGFnZSBOQU5Ecwo+ID4gPiAo
NTEyIGJ5dGVzKS4gIAo+ID4gCj4gPiBOZXZlcm1pbmQsIHRoZSBPTkZJIHNwZWMgKGluIGFsbCB2
ZXJzaW9ucykgc3RhdGVzIHRoYXQgUk5ET1VUIGFyZQo+ID4gYWxsb3dlZCBkdXJpbmcgcGFyYW1l
dGVyIHBhZ2UgcmVhZHMsIHJlZ2FyZGxlc3Mgb2YgdGhlIHNpemUgb2YgdGhlIGNoaXAKPiA+IChh
dCBsZWFzdCwgdGhhdCBpcyBub3QgbWVudGlvbmVkKS4gIAo+IAo+IEkgY291bGQgaW1hZ2luZSB0
aGF0IHRoZXJlIGFyZSBubyBPTkZJIGNvbXBsaWFudCBjaGlwcyB3aXRoIHNtYWxsIHBhZ2VzLAo+
IEkgZG9uJ3Qga25vdyBob3cgdG8gdmVyaWZ5IHRoaXMgdGhvdWdoLgo+IAo+IEFueXdheSwgdGhp
cyB3YXMgYSB0cnkgdG8gbWFrZSByZWFkaW5nIHRoZSBwYXJhbWV0ZXIgcGFnZXMgYSBiaXQgbW9y
ZQo+IHN0cmFpZ2h0IGZvcndhcmQuIEl0IHNlZW1zIHRoZSBNWEMgTkFORCBjb250cm9sbGVyIGNh
bid0IHN1cHBvcnQgcmVhZGluZwo+IHRocmVlIHBhcmFtZXRlciBwYWdlcyBpbiBvbmUgZ28gZWl0
aGVyLiBJdCB3b3JrcyBpbiBzb2Z0d2FyZSBFQ0MgbW9kZQo+IGJlY2F1c2UgSSByZXZlcnNlIHRo
ZSBzeW5kb21lIHR5cGUgbGF5b3V0IHRoZSBjb250cm9sbGVyIGludHJvZHVjZXMsIGJ1dAo+IGl0
IGNhbid0IHdvcmsgd2l0aCBoYXJkd2FyZSBFQ0MuCgpIYXJkd2FyZSBFQ0Mgc2hvdWxkIG5vdCBi
ZSB1c2VkIGF0IHRoaXMgc3RlcCBhbmQgc2hvdWxkIGJlIGRpc2FibGVkLgpUaGVyZSBzaG91bGQg
bm90IGJlIGFueSBFQ0MgaW50ZXJmZXJlbmNlLgoKPiBTbyBkaXNyZWdhcmQgdGhpcyBwYXRjaC4K
Ckkgbm93IGhhdmUgYSBwcm9wb3NhbCwgSSdsbCBzZW5kIGEgdjIgb2YgbXkgcHJldmlvdXMgc2Vy
aWVzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
