Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DB0E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyIrO4AX4KF4tLZKCuC8oWr5KtsAxgQoGKiqRuDo5Ps=; b=dF4Y6HBvMr/8/r
	1tDKUT79YRKfdPnoUDT+/dH/1JC55fX9JjZIJVI8aIPuFBJYT9Z8P73n59kYwQA/PtsVDnCTIG/5S
	Ku1f6Vu/Q8O6f4+rYah/HmYLEWIwiUvsjK3BTRJh5f/Si9+P1DTVs0qWW4KfhAsARt3KRtUevRTab
	gmHY0LwoFqK58AGyviRUujD1unN+OJItseH5F+RXlCOZlNbfonq/Spc/AjAsMOKm/SlP5UdxTJfr/
	11uGNLqbv3u7nQuOcqaTaIEXpfMQ/kbNFDz2TSI+jBfNfY+j3unKePYw/6YW7kkF4wjuq1JbZPuv8
	TfHjGktqxDQjck8qnB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJ8R-00000002IbR-3mBE;
	Thu, 19 Dec 2024 16:12:23 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJ8O-00000002IZy-3BlE
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 16:12:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9870C1BF20D;
	Thu, 19 Dec 2024 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734624737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvRSHK5bNFiDE6BSVtHafrHHc5HkI14nnlQQyrtKneI=;
	b=pvh6wFEaKGR/RBELeUbwxgeFFppP1J87eJfT1dkCZyocAko/BL8AVKL8Dv2tp0qZ7dCHdn
	ImyVN2Rw5Cf2+wieHCCRZ+IJ8C6DxaNwBrUWI5cdACDOJfzj5oPvdZecBRbWiPXzFOpkJP
	hSejNiSYbNr3VzHRok6Nideq3gbQR85inI0N1S8R5RTtWYh20YGfLDrdMKjFFK0Hk76zg6
	zNJy38iX4O7EZ6Yc6XbAF6XSPwujVbwhxxR5bVEbwBR9OWJ5EDuS2aA4+4ptZ/uvHTe+i3
	i0feZiJDfmmjE7kR3QgFewae6H9YqSXu9PdgORe5aTzVyrsk2em4EXEUnXNZxw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v2] mtd: rawnand: davinci: Reduce polling interval in
 NAND_OP_WAITRDY_INSTR
In-Reply-To: <20241219-patch-nand-poll-v2-1-cc80a1ee4e0f@bootlin.com> (Bastien
	Curutchet's message of "Thu, 19 Dec 2024 15:58:10 +0100")
References: <20241219-patch-nand-poll-v2-1-cc80a1ee4e0f@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 19 Dec 2024 17:12:16 +0100
Message-ID: <87a5crabz3.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_081221_075482_E4254361 
X-CRM114-Status: GOOD (  11.90  )
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

SGVsbG8gQmFzdGllbiwKCk9uIDE5LzEyLzIwMjQgYXQgMTU6NTg6MTAgKzAxLCBCYXN0aWVuIEN1
cnV0Y2hldCA8YmFzdGllbi5jdXJ1dGNoZXRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBGb3IgZWFj
aCBOQU5EX09QX1dBSVRSRFlfSU5TVFIgb3BlcmF0aW9uLCB0aGUgTkFOREZTUiByZWdpc3RlciBp
cwo+IHBvbGxlZCBvbmx5IG9uY2UgZXZlcnkgMTAwIHVzIHRvIGNoZWNrIGZvciB0aGUgRU1BX1dB
SVQgcGluLiBUaGlzCj4gaXNuJ3QgZnJlcXVlbnQgZW5vdWdoIGFuZCBjYXVzZXMgZGVsYXlzIGlu
IE5BTkQgYWNjZXNzZXMuCj4KPiBTZXQgdGhlIHBvbGxpbmcgaW50ZXJ2YWwgdG8gMHMuIEl0IGlu
Y3JlYXNlcyB0aGUgcGFnZSByZWFkIHNwZWVkCj4gcmVwb3J0ZWQgYnkgZmxhc2hfc3BlZWQgYnkg
fjQwJSAofjMwJSBvbiBwYWdlIHdyaXRlcykuCgouLi4KCj4gIAljYXNlIE5BTkRfT1BfV0FJVFJE
WV9JTlNUUjoKPiAgCQl0aW1lb3V0X3VzID0gaW5zdHItPmN0eC53YWl0cmR5LnRpbWVvdXRfbXMg
KiAxMDAwOwo+ICAJCXJldCA9IHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0KGluZm8tPmJhc2Ug
KyBOQU5ERlNSX09GRlNFVCwKPiAtCQkJCQkJIHN0YXR1cywgc3RhdHVzICYgQklUKDApLCAxMDAs
Cj4gKwkJCQkJCSBzdGF0dXMsIHN0YXR1cyAmIEJJVCgwKSwgMCwKClRoaXMga2luZCBvZiBvcHRp
bWl6YXRpb24gaXMgdmVyeSB0ZW1wdGluZyBidXQgaGFzIGFuIGltcGFjdCBvbiB0aGUKc3lzdGVt
LiBJIGFtIGZpbmUgcmVkdWNpbmcgdGhpcyBwb2xsaW5nIGRlbGF5LCBidXQgbWF5YmUgbm90IGRv
d24gdG8gMAp3aGljaCBtZWFucyB5b3UgYnVzeSB3YWl0IHRoZSBlbnRpcmUgdGltZS4gRm9yIHJl
YWRzIGl0IG1pZ2h0IGJlIGZpbmUKYmVjYXVzZSB0UiBpcyByYXRoZXIgc2hvcnQsIGJ1dCBmb3Ig
d3JpdGVzIGl0IGlzIGEgYml0IG1vcmUgaW1wYWN0aW5nCmFuZCBmb3IgZXJhc2VzIGl0IHdpbGwg
aGF2ZSBhIHRydWUgc3lzdGVtIHdpZGUgaW1wYWN0LiBTbyB3aGF0IHlvdSBzZWUKaW4gdGhlIGJl
bmNobWFyayBpcyBzcGVjaWZpYyB0byB0aGUgTkFORCBkcml2ZXIgcGVyZm9ybWFuY2VzLCBidXQg
ZmFpbHMKdG8gZ2l2ZSB5b3UgdGhlIHN5c3RlbS13aWRlIGJpZyBwaWN0dXJlIHdoaWNoIEkgdGhp
bmsgaXMgd29ydGgga2VlcGluZwppbiBtaW5kLgoKQXMgdGhpcyB2YWx1ZSB3aWxsIGJlIE5BTkQg
c3BlY2lmaWMgd2UgY2Fubm90IGZpbmUgdHVuZSBpdCB0b28gbXVjaCwgYnV0Ckkgd291bGQgc3Vn
Z2VzdCB0byB0cnkgZmluZGluZyBhIGxvd2VyIHZhbHVlIHdpdGhvdXQgcmVhY2hpbmcgMC4gTGlr
ZSA1Cm9yIDEwIHVzIG1heWJlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
