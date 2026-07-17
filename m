Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E609C4451C
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gO52f3SmYF/nve9sGW5byTbqYX1Vw42JmPeDvq6xInE=; b=J5ab1DR7LA5cxS
	qwTNNeeeCcQ9H4mTOhnwzC/lrTCMzS0ABV3kcckByXTk2dK2L/s8ks97ZL4EKINTXPaXvNvMhbgpl
	0czldhw+L6JLwsZaSAOQ4YlR3MZgI/9M4dD4BKafY8mGvyi4mu2bd75hqhBR9LpG4uxgDTkWjvjGN
	9UZq8aU4i7cqaJ2Lm/UbMPxkNp++S3g+xYgQ8eGMSTr2TX/Zd/hITEV8J7M649tftfEy8HEruswhT
	2NUfq1NxkvZhpNpCfV+6E771sfZJD4JaXkHuJE+gq0OS9aWZzE38ytXgFDBoJMnApkIPIHE5ImvFg
	8QO5zImOnt7o3x9+2LQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhAL-00000002CMq-24Wn;
	Fri, 17 Jul 2026 11:55:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhAH-00000002CLu-2XQC;
	Fri, 17 Jul 2026 11:55:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A8E5C2B9F9;
	Fri, 17 Jul 2026 11:55:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B542860361;
	Fri, 17 Jul 2026 11:55:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D107811BD013E;
	Fri, 17 Jul 2026 13:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784289332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=olb07j+R4KRuYDDsVWwKXD1OEB5dTfTfM1jnrVire4o=;
	b=yXXP7Pval4WDA/Rcwb+NuWA918Ql9SeQC53coAvcqFKI2q+nVCeCIPdGvZXsQK/cgmJwXu
	rxnEETip2qaGBb3miTiLJf4GlRcxIEarrHbRcUe6Wg7JqOuvahWSb/9V5GpX/fUkgky0Mj
	v49VDKAKy5ybZzFxAZTCgNTpj0kSz60ad2VmLEmVRMo+bN2pNuwl2RVKyLZ6QNfW9t3ZB7
	OqAOjpLEkOCC+pE1qDa4MSZbEtOzaYyUutJQVVflfgOtkrDedwXov4HTmK70CLjiXbDRH7
	llX5muQWl4ULLMzwqT/e0OaHceTR2WyHA2sd9kosxCUBYJi04OTD724YsF0LEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: fix H6/H616 controller timings
In-Reply-To: <20260715013142.640977-1-james.hilliard1@gmail.com> (James
	Hilliard's message of "Tue, 14 Jul 2026 19:31:38 -0600")
References: <20260715013142.640977-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 13:55:29 +0200
Message-ID: <87a4rpkez2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_045537_816024_330FC8D9 
X-CRM114-Status: GOOD (  15.82  )
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

SGVsbG8gSmFtZXMsCgpPbiAxNC8wNy8yMDI2IGF0IDE5OjMxOjM4IC0wNiwgSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgTkFORCB0aW1pbmcg
Y2FsY3VsYXRpb24gd2FzIHdyaXR0ZW4gZm9yIHRoZSBvcmlnaW5hbCBBMTAgTkRGQy4gSXQKPiBh
c3N1bWVzIGNvbW1hbmQgYW5kIGFkZHJlc3Mgc2V0dXAgYW5kIGhvbGQgaW50ZXJ2YWxzIFQxLVQ0
LCBUNyBhbmQgVDExCj4gYXJlIG9uZSBjb250cm9sbGVyIGNsb2NrIGFuZCB1c2VzIHRoZSBBMTAg
dGltaW5nLXJlZ2lzdGVyIGVuY29kaW5ncy4KPgo+IFRoZSBINi9INjE2IE5ERkMgaW5zdGVhZCBk
ZWZpbmVzIHRob3NlIGludGVydmFscyBhcyB0d28gaW50ZXJuYWwgY2xvY2sKPiBjeWNsZXMgYW5k
IHVzZXMgZGlmZmVyZW50IGVuY29kaW5ncyBmb3IgdFdCLCB0QURMLCB0V0hSIGFuZCB0UkhXLCBh
cwo+IGRvY3VtZW50ZWQgaW4gdGhlIEg2MTYgVXNlciBNYW51YWwuCj4KPiBEZXNjcmliZSB0aGUg
dGltaW5nIGNoYXJhY3RlcmlzdGljcyBpbiB0aGUgY29udHJvbGxlciBjYXBhYmlsaXR5IGRhdGEK
PiBzbyB0aGUgY2xvY2sgc29sdmVyIGNhbiBzZWxlY3QgYSByYXRlIHBlcm1pdHRlZCBieSB0aGUg
TkFORCBTRFIgdGltaW5ncwo+IGFuZCBwcm9ncmFtIHZhbGlkIGRlbGF5IGZpZWxkcy4gS2VlcCB0
aGUgbGVnYWN5IEExMCBiZWhhdmlvciB1bmNoYW5nZWQuCj4KPiBGaXhlczogODhmZDRlNGRlYWU4
ICgibXRkOiByYXduYW5kOiBzdW54aTogQWRkIHN1cHBvcnQgZm9yIEg2MTYgbmFuZCBjb250cm9s
bGVyIikKCkNjOiBzdGFibGUgbWlzc2luZyBoZXJlCgo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKLi4uCgo+IEBAIC0xNjY3LDE2ICsx
NjgxLDM1IEBAIHN0YXRpYyBpbnQgc3VueGlfbmZjX2h3X2VjY193cml0ZV9vb2Ioc3RydWN0IG5h
bmRfY2hpcCAqbmFuZCwgaW50IHBhZ2UpCj4gIAlyZXR1cm4gbmFuZF9wcm9nX3BhZ2VfZW5kX29w
KG5hbmQpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgY29uc3QgczMyIHRXQl9sdXRbXSA9IHs2LCAxMiwg
MTYsIDIwfTsKPiAtc3RhdGljIGNvbnN0IHMzMiB0UkhXX2x1dFtdID0gezQsIDgsIDEyLCAyMH07
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VueGlfbmZjX3RpbWluZ3Mgc3VuNGlfYTEwX25mY190
aW1pbmdzID0gewo+ICsJLnNldHVwX2N5Y2xlcyA9IDEsCj4gKwkudFdCID0geyA2LCAxMiwgMTYs
IDIwIH0sCj4gKwkudEFETCA9IHsgNywgMTUsIDIzLCAzMSB9LAo+ICsJLnRXSFIgPSB7IDcsIDE1
LCAyMywgMzEgfSwKPiArCS50UkhXID0geyA0LCA4LCAxMiwgMjAgfSwKPiArfTsKClRoaXMgcGF0
Y2ggbG9va3Mgb3ZlcmFsbCBjb3JyZWN0IGJ1dCBtdXN0IGJlIHNwbGl0LiBGb3IgaW5zdGFuY2Us
IHRoZQpmYWN0IHRoYXQgeW91IGRyb3AgdGhlIExVVCBpbiBmYXZvdXIgb2YgeW91IG93biB0aW1p
bmcgYXJyYXkgc2hhbGwgYmUKZG9uZSBpbiBhIHByZXBhcmF0aW9uIHBhdGNoLCB3aXRob3V0IGFk
ZGluZyBuZXcgdGltaW5ncywgbm9yIGFkZGluZyB0aGUKbmV3IGNvbnRyb2xsZXIgdGltaW5ncy4K
ClRoZW4gaW4gYSBzZWNvbmQgdGltZSB5b3UgY291bGQgYWRkIHRBREwgYW5kIHRXSFIgc3VwcG9y
dCwgZXRjLgoKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VueGlfbmZjX3RpbWluZ3Mgc3Vu
NTBpX2g2X25mY190aW1pbmdzID0gewo+ICsJLnNldHVwX2N5Y2xlcyA9IDIsCj4gKwkudFdCID0g
eyAyOCwgNDQsIDYwLCA3NiB9LAo+ICsJLnRBREwgPSB7IDAsIDEyLCAyOCwgNDQgfSwKPiArCS50
V0hSID0geyAwLCAxMiwgMjgsIDQ0IH0sCj4gKwkudFJIVyA9IHsgOCwgMjQsIDQwLCA1NiB9LAo+
ICt9Owo+ICsKPiArc3RhdGljIHZvaWQgc3VueGlfbmFuZF91cGRhdGVfbWluX3BlcmlvZCh1MzIg
Km1pbl9wZXJpb2QsIHUzMiBkdXJhdGlvbiwKPiArCQkJCQkgdW5zaWduZWQgaW50IGN5Y2xlcykK
PiArewo+ICsJKm1pbl9wZXJpb2QgPSBtYXgoKm1pbl9wZXJpb2QsIERJVl9ST1VORF9VUChkdXJh
dGlvbiwgY3ljbGVzKSk7Cj4gK30KPiAgCj4gLXN0YXRpYyBpbnQgX3N1bnhpX25hbmRfbG9va3Vw
X3RpbWluZyhjb25zdCBzMzIgKmx1dCwgaW50IGx1dF9zaXplLCB1MzIgZHVyYXRpb24sCj4gLQkJ
dTMyIGNsa19wZXJpb2QpCj4gK3N0YXRpYyBpbnQgc3VueGlfbmFuZF9sb29rdXBfdGltaW5nKGNv
bnN0IHU4ICpsdXQsIHUzMiBkdXJhdGlvbiwKPiArCQkJCSAgICB1MzIgY2xrX3BlcmlvZCkKClRo
aXMgY2hhbmdlIGlzIGZpbmUgYnV0IGxpa2VseSBhbHNvIHVucmVsYXRlZCBhbmQgc2hvdWxkICht
YXliZSkgYmUgbW92ZWQgaW4gaXRzCm93biBjb21taXQuCgo+ICB7Cj4gIAl1MzIgY2xrX2N5Y2xl
cyA9IERJVl9ST1VORF9VUChkdXJhdGlvbiwgY2xrX3BlcmlvZCk7Cj4gIAlpbnQgaTsKPiAgCj4g
LQlmb3IgKGkgPSAwOyBpIDwgbHV0X3NpemU7IGkrKykgewo+ICsJZm9yIChpID0gMDsgaSA8IFNV
TlhJX05GQ19USU1JTkdfU1RFUFM7IGkrKykgewo+ICAJCWlmIChjbGtfY3ljbGVzIDw9IGx1dFtp
XSkKPiAgCQkJcmV0dXJuIGk7Cj4gIAl9CgouLi4KCj4gQEAgLTE3MDMsNzcgKzE3MzQsNjUgQEAg
c3RhdGljIGludCBzdW54aV9uZmNfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKm5h
bmQsIGludCBjc2xpbmUsCj4gIAkJcmV0dXJuIC1FTk9UU1VQUDsKPiAgCj4gIAkvKiBUMSA8PT4g
dENMUyAqLwo+IC0JaWYgKHRpbWluZ3MtPnRDTFNfbWluID4gbWluX2Nsa19wZXJpb2QpCj4gLQkJ
bWluX2Nsa19wZXJpb2QgPSB0aW1pbmdzLT50Q0xTX21pbjsKPiArCXN1bnhpX25hbmRfdXBkYXRl
X21pbl9wZXJpb2QoJm1pbl9jbGtfcGVyaW9kLCB0aW1pbmdzLT50Q0xTX21pbiwKPiArCQkJCSAg
ICAgbmZjX3RpbWluZ3MtPnNldHVwX2N5Y2xlcyk7CgpJIGFtIG5vdCBzdXJlIEkgZ2V0IHRoZSBh
ZGRlZCB2YWx1ZSBvZiB0aGlzIGhlbHBlcj8KCj4gIAo+ICAJLyogVDIgPD0+IHRDTEggKi8KPiAt
CWlmICh0aW1pbmdzLT50Q0xIX21pbiA+IG1pbl9jbGtfcGVyaW9kKQo+IC0JCW1pbl9jbGtfcGVy
aW9kID0gdGltaW5ncy0+dENMSF9taW47Cj4gKwlzdW54aV9uYW5kX3VwZGF0ZV9taW5fcGVyaW9k
KCZtaW5fY2xrX3BlcmlvZCwgdGltaW5ncy0+dENMSF9taW4sCj4gKwkJCQkgICAgIG5mY190aW1p
bmdzLT5zZXR1cF9jeWNsZXMpOwo+ICAKCi4uLgoKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c3VueGlfbmZjX2NhcHMgc3VueGlfbmZjX2g2MTZfY2FwcyA9IHsKPiBAQCAtMjY0MSw2ICsyNjY0
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW54aV9uZmNfY2FwcyBzdW54aV9uZmNfaDYxNl9j
YXBzID0gewo+ICAJLm51c2VyX2RhdGFfdGFiID0gQVJSQVlfU0laRShzdW54aV91c2VyX2RhdGFf
bGVuX2g2KSwKPiAgCS5tYXhfZWNjX3N0ZXBzID0gMzIsCj4gIAkuc3JhbV9zaXplID0gODE5MiwK
PiArCS50aW1pbmdzID0gJnN1bjUwaV9oNl9uZmNfdGltaW5ncywKCkFuZCB0aGlzIHNob3VsZCBi
ZSB0aGUgbGFzdCBjaGFuZ2UgaW4geW91ciBzZXJpZXMuCgpCVFcgd291bGQgaXQgYmUgcmVsZXZh
bnQgdG8gYWxpZ24gdGhlIHZhcmlvdXMgbmFtZXMgPyAoaDYgdGltaW5ncyBpbiB0aGUKaDYxNiBz
dHJ1Y3R1cmUpLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
