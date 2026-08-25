Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DA4C5DF94
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Apq14DcnIcFQW0t/0QpBcxw6NSkRrDxqE++3wdJPX8U=; b=HiHrrBiyFjoOnE
	u7h+sSeOtmX1qwmQV9UDMpDiy7w1270B39bV+RfoBiLUx+iQ0aeDYKDZGx/9WGzGV6OwtkL6V0MFk
	ds0pkz1Og1O0qoipRVI/jp0jujsbyzC5DSwrMq0i+9OSE4NdW0hn68cHDL7b08KucG+ZNBi4WeNUb
	3crrJdNcwMajasx6BYi13zg3i4km0byr5LNraesGTdObHeW8KGhyDcO1uLfvrnBNdhu13RdUm8Imx
	Csjije4m7U3bxGqKmWa5sH5z6dxB9Hwei2Lma1Tc0eta2SA7UnC0PptHqM6Yq270WRIBrrhWSWWLg
	ltc3jcdTy4iuwrW02tNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynPf-00000000UR3-2EPu;
	Tue, 25 Aug 2026 09:25:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynPc-00000000UOp-2PBa
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 09:25:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E43D14E412E5;
	Tue, 25 Aug 2026 09:25:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B164F604C4;
	Tue, 25 Aug 2026 09:25:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0DBC11C7A2C8;
	Tue, 25 Aug 2026 11:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787649941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PllPwnOb5rVU3nVWYG820WyvGIk0Up/VlF/TuMlHid4=;
	b=eGg7i5fqMxQp/ywvkAiNU0aTyFazg13TUt3rB5mWgcyBuClniEVezivwmkpmImZ+5VuhrV
	eI+nKKBp12Wl7OBmhj8JXhhH1FpM/DeQoM6O0YNzJuFpGAUE7X1G3J32vd2TyrmSSpOZtL
	MGO8Uzk3j1UQ/wIie5SfzRLSJH9dEciIFRYgeRtiERiO4FYitWo0pohrcF1yMH/FZRKQfc
	k4PHXHpiter5YJOSprd4g2gkUdWRaVLCpPoywq+449wqV8f9MzpxnbPBnWjfPBWK4S+olw
	Cm7QD7Ze1fJjbfvtNw3/AL7QUXyXYAHnKDLCCGDI7UOh2fhYmJFKuMkRF6qSug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <mwalle@kernel.org>,  <pratyush@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: Sashiko to track linux-mtd
In-Reply-To: <8733xhiqyn.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 17
	Jul 2026 17:19:28 +0200")
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
	<87pl19s7ng.fsf@bootlin.com>
	<0fe3140096bc48a8e71838362220d9f8@kernel.org>
	<b224c6938e084763b017c63e0aa3fa3f@infineon.com>
	<8733xikmb9.fsf@bootlin.com> <8733xhiqyn.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 11:25:38 +0200
Message-ID: <87v78yimb1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_022544_755154_B35AD9D4 
X-CRM114-Status: UNSURE (   9.66  )
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

SGVsbG8sCgpPbiAxNy8wNy8yMDI2IGF0IDE3OjE5OjI4ICswMiwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvIGZvbGtzLAo+Cj4+IFNvIEkg
d2lsbCBtYWtlIGEgUFIgZm9yIGVuYWJsaW5nIGl0LCBidXQgbGV0J3Mga2VlcCBpbiBtaW5kIHRo
YXQgdGhpcyBpcwo+PiBleHBlcmltZW50YWwgYW5kIGNhbiBiZSByZS1kaXNjdXNzZWQgYXQgYW55
IHRpbWUuCj4KPiBGWUk6IGh0dHBzOi8vZ2l0aHViLmNvbS9zYXNoaWtvLWRldi9zYXNoaWtvL3B1
bGwvMzM2CgpJIGFtIHBhcnRpYWxseSBzYXRpc2ZpZWQgYWJvdXQgaG93IFNhc2hpa28gaW50ZXJ2
ZW5lcyBpbiBteSByZXZpZXcKZmxvdywgaGVyZSBpcyBteSBjdXJyZW50IGZlZWxpbmcuCgpBYm91
dCBTYXNoaWtvIGl0c2VsZjoKKyBtYW55IGludGVyZXN0aW5nIGZpbmRpbmdzLCB3b3J0aCBlbmFi
bGluZyBmb3Igc3VyZQorIG1vc3Qgb2YgdGhlIGZpbmRpbmdzIGFyZSBjb3JyZWN0LCBidXQgbm90
IGFsd2F5cyB3b3J0aCBhbm90aGVyIHZlcnNpb24KLSBubyBwb3NzaWJsZSBmZWVkYmFjayBsb29w
IChlZy4gInRoaXMgaXMgYW4gaGFsbHVjaW5hdGlvbiwgc3RvcAogIGJvdGhlcmluZyB1cyB3aXRo
IHRoaXMiKQotIHByZS1leGlzdGluZyBpc3N1ZXMgYXJlIGZsYWdnZWQgYXQgdGhlIHNhbWUgImxl
dmVsIiBhcyBuZXcgaXNzdWVzCgpBYm91dCBvdXIgY29uZmlndXJhdGlvbiBvZiBTYXNoaWtvOgot
IGl0IHRha2VzIG1vcmUgdGltZSB0byBtZSB0byBkbyB0aGUgY2hlY2ssIGNvcHkgJiBwYXN0ZSBk
YW5jZSBldmVyeQogIHRpbWUgdGhlcmUgaXMgc29tZXRoaW5nIEkgZmluZCByZWFsbHkgbmVlZGVk
Ci0gSSBnZXQgQ2MnZWQgb24gcmV2aWV3cyBvZiBwYXRjaGVzIEkgZGlkIG5vdCByZWNlaXZlIChl
Zy4gamZmczIgdGhpbmdzKQoKSW4gdGhlIGVuZCBJIHdvdWxkIGxpa2UgdG8gbW9kaWZ5IHRoZSBj
dXJyZW50IGNvbmZpZ3VyYXRpb24gaW4gb3JkZXIgZm9yClNhc2hpa28gdG8gYWN0IGFzIGEgcmVn
dWxhciByZXZpZXdlciwgaWUuIGp1c3QgYW5zd2VyIHRvIGFsbCByZWNpcGllbnRzLAppbmNsdWRp
bmcgdGhlIGF1dGhvcjoKCi0gY2MgPSAuLi4KKyByZXBseV9hbGwgPSB0cnVlCisgcmVwbHlfdG9f
YXV0aG9yID0gdHJ1ZQoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
