Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E1E606D838
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M7GgZns+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LL7eXSG8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cmkS6ovKR5zmd7H+gcByR84V7QRaulb6xcimqMK8h+s=; b=M7GgZns++hLG7C0WXBdoH/HYsb
	pNMWn19DpDfMLVuuidiMtY8yDjN6lZZD12QaTneMGzD23/FXu2E9PGFq3k5/iSY7RVHEAI7Gzqb3i
	wwaYggYuR/F9+y4alaSlz4t49xwgMaRBDO9crbV02pPpdJS0GMJaJFm92ZYfPFv/kD1yeeMScefGJ
	0695MIrRma1giiDVb5/KKCJ1jzxCZIVqu31I/RtlnwSWB/4O7+40MVm0i7zX3Sl4/MAgVHHJ9lpki
	YPFm7kQerHMtSWiGILkfJ919LlRL2xbgJHju82KFHT3uAuF9otTN95sY1MUxaBOH/64sqoa4Vb/yr
	3V5R2pQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1CW-00000009u2N-1S5X;
	Thu, 05 Nov 2026 17:24:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1CL-00000009txO-0HQS
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:24:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 863006014C;
	Thu,  5 Nov 2026 17:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E835E1F00919;
	Thu,  5 Nov 2026 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899464;
	bh=F/r/taA5sCMRvqVktlJOopdUX8B8n5SPYrBkY0H1V54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LL7eXSG8EndjZfPSBEZWHjpichTuQR7f9DhZNMoahmt2VajGyueBmua2Pjp/glPEt
	 gmcp71HVTPagO1fJKmIecOVMkS/fbRrDVItaPzOsnhJQPsK9S6Tdj6/tlg0Ui0e22u
	 IIt10QsffaOfq4lQtnIzO61lrUF1C+RcBDllsG/NZmlp6J+udKrIaiXINXbdbQ4eQg
	 7yW/jR0FipApmPYXOxuGoDl1KzXLnwZnUri5y98edrAUhqqoepFN+QxRKhJvPow7g5
	 mabJN4dmIfd23erTVQxiJc3Fg34AxchVzVTkhoTsvsucsGHJkvcLBFpXLSBea88Jv6
	 QK2IIK67l/Thg==
Message-ID: <sashiko-outbox-199606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/12] mtd: physmap: Remove #ifdef guards for PM related
 functions
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261105171158.399247-5-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
 <20261105171158.399247-5-paul.cercueil@bootlin.com>
Date: Thu, 05 Nov 2026 17:24:23 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiBwaHlzbWFwOiBt
aXN1c2Ugb2YgcG1fcHRyKCkgb24gc2h1dGRvd24gaG9vayBwaHlzbWFwX2ZsYXNoX3NodXRkb3du
KCkKLS0KCmNvbW1pdCBiYjhmZjM1NzU5ODVhNzBkMWFiM2ViM2NlOWRlODhlODBiZTJjMWMwCkF1
dGhvcjogUGF1bCBDZXJjdWVpbCA8cGF1bC5jZXJjdWVpbEBib290bGluLmNvbT4KCm10ZDogcGh5
c21hcDogUmVtb3ZlICNpZmRlZiBndWFyZHMgZm9yIFBNIHJlbGF0ZWQgZnVuY3Rpb25zCgpUaGlz
IGNvbW1pdCByZW1vdmVzIHRoZSBDT05GSUdfUE0gI2lmZGVmIGd1YXJkIGFyb3VuZApwaHlzbWFw
X2ZsYXNoX3NodXRkb3duKCkgYW5kIHdyYXBzIGl0cyBhc3NpZ25tZW50IGluIHBoeXNtYXBfZmxh
c2hfZHJpdmVyCndpdGggcG1fcHRyKCkuCgo+ICAgICBtdGQ6IHBoeXNtYXA6IFJlbW92ZSAjaWZk
ZWYgZ3VhcmRzIGZvciBQTSByZWxhdGVkIGZ1bmN0aW9ucwo+ICAgICAKPiAgICAgVXNlIHRoZSBu
ZXcgUE0gbWFjcm9zIGZvciB0aGUgc3VzcGVuZCBhbmQgcmVzdW1lIGZ1bmN0aW9ucyB0byBiZQo+
ICAgICBhdXRvbWF0aWNhbGx5IGRyb3BwZWQgYnkgdGhlIGNvbXBpbGVyIHdoZW4gQ09ORklHX1BN
IG9yCj4gICAgIENPTkZJR19QTV9TTEVFUCBhcmUgZGlzYWJsZWQsIHdpdGhvdXQgaGF2aW5nIHRv
IHVzZSAjaWZkZWYgZ3VhcmRzLgo+ICAgICAKPiAgICAgVGhpcyBoYXMgdGhlIGFkdmFudGFnZSBv
ZiBhbHdheXMgY29tcGlsaW5nIHRoZXNlIGZ1bmN0aW9ucyBpbiwKPiAgICAgaW5kZXBlbmRlbnRs
eSBvZiBhbnkgS2NvbmZpZyBvcHRpb24uIFRoYW5rcyB0byB0aGF0LCBidWdzIGFuZCBvdGhlcgo+
ICAgICByZWdyZXNzaW9ucyBhcmUgc3Vic2VxdWVudGx5IGVhc2llciB0byBjYXRjaC4KPiAgICAg
Cj4gICAgIFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWwuY2VyY3VlaWxAYm9vdGxp
bi5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1jb3JlLmMg
Yi9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtY29yZS5jCj4gaW5kZXggZGNkYTc2ODVmYzk5Yi4u
YWZkYTkwZmMyM2VlZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtY29y
ZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYwo+IEBAIC02MDAsNyAr
NjAwLDYgQEAgc3RhdGljIGludCBwaHlzbWFwX2ZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKmRldikKPiAgCXJldHVybiBlcnI7Cj4gIH0KPiAgCj4gLSNpZmRlZiBDT05GSUdfUE0K
PiAgc3RhdGljIHZvaWQgcGh5c21hcF9mbGFzaF9zaHV0ZG93bihzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpkZXYpCj4gIHsKPiAgCXN0cnVjdCBwaHlzbWFwX2ZsYXNoX2luZm8gKmluZm8gPSBwbGF0
Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpOwo+IEBAIC02MTAsMTQgKzYwOSwxMSBAQCBzdGF0aWMgdm9p
ZCBwaHlzbWFwX2ZsYXNoX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKPiAg
CQlpZiAobXRkX3N1c3BlbmQoaW5mby0+bXRkc1tpXSkgPT0gMCkKPiAgCQkJbXRkX3Jlc3VtZShp
bmZvLT5tdGRzW2ldKTsKPiAgfQo+IC0jZWxzZQo+IC0jZGVmaW5lIHBoeXNtYXBfZmxhc2hfc2h1
dGRvd24gTlVMTAo+IC0jZW5kaWYKPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IHBoeXNtYXBfZmxhc2hfZHJpdmVyID0gewo+ICAJLnByb2JlCQk9IHBoeXNtYXBfZmxhc2hfcHJv
YmUsCj4gIAkucmVtb3ZlCQk9IHBoeXNtYXBfZmxhc2hfcmVtb3ZlLAo+IC0JLnNodXRkb3duCT0g
cGh5c21hcF9mbGFzaF9zaHV0ZG93biwKPiArCS5zaHV0ZG93bgk9IHBtX3B0cihwaHlzbWFwX2Zs
YXNoX3NodXRkb3duKSwKCltTZXZlcml0eTogTG93XQpUaGUgY29tbWl0IG1lc3NhZ2UgZGVzY3Jp
YmVzIHVzaW5nIFBNIG1hY3JvcyBmb3Igc3VzcGVuZCBhbmQgcmVzdW1lCmZ1bmN0aW9ucywgYW5k
IHRoaXMgd3JhcHMgcGh5c21hcF9mbGFzaF9zaHV0ZG93bigpIGluIHBtX3B0cigpLiBIb3dldmVy
LApwaHlzbWFwX2ZsYXNoX3NodXRkb3duKCkgaXMgdGhlIHBsYXRmb3JtX2RyaXZlciAuc2h1dGRv
d24gaG9vayByYXRoZXIgdGhhbiBhCmRldl9wbV9vcHMgY2FsbGJhY2suCgpUaGUgb3JpZ2luYWwg
I2lmZGVmIENPTkZJR19QTSBndWFyZCBhcHBlYXJzIHRvIGJlIGEgbGVmdG92ZXIgZnJvbSBjb21t
aXQKMTdjMmRhZTNhYWZmOWIsIHdoaWNoIHBsYWNlZCBwaHlzbWFwX2ZsYXNoX3N1c3BlbmQoKSwK
cGh5c21hcF9mbGFzaF9yZXN1bWUoKSwgYW5kIHBoeXNtYXBfZmxhc2hfc2h1dGRvd24oKSBpbnNp
ZGUgYSBzaW5nbGUKI2lmZGVmIENPTkZJR19QTSBibG9jayBiZWZvcmUgdGhlIGRyaXZlcidzIHN1
c3BlbmQgYW5kIHJlc3VtZSBjYWxsYmFja3Mgd2VyZQpsYXRlciByZW1vdmVkIGluIGZhdm9yIG9m
IG10ZF9jbGFzcyBQTSBvcHMuCgpTaW5jZSBkZXZpY2Vfc2h1dGRvd24oKSAtPiBwbGF0Zm9ybV9z
aHV0ZG93bigpIGludm9rZXMgdGhlIC5zaHV0ZG93biBob29rCmR1cmluZyBzeXN0ZW0gcmVib290
LCBoYWx0LCBwb3dlcm9mZiwgb3Iga2V4ZWMgcmVnYXJkbGVzcyBvZiBDT05GSUdfUE0gKHRvCnJl
dHVybiBmbGFzaCBjaGlwcyB0byByZWFkLWFycmF5IG1vZGUpLCBhbmQgYm90aCBtdGRfc3VzcGVu
ZCgpIGFuZAptdGRfcmVzdW1lKCkgaW4gaW5jbHVkZS9saW51eC9tdGQvbXRkLmggYXJlIGRlZmlu
ZWQgdW5jb25kaXRpb25hbGx5LCBkb2VzCnBoeXNtYXBfZmxhc2hfc2h1dGRvd24oKSBuZWVkIHRv
IGRlcGVuZCBvbiBDT05GSUdfUE0gYXQgYWxsPyBDb3VsZAouc2h1dGRvd24gYmUgYXNzaWduZWQg
dW5jb25kaXRpb25hbGx5IHdpdGhvdXQgcG1fcHRyKCksIHdpdGggdGhlIGNvbW1pdAptZXNzYWdl
IHVwZGF0ZWQgdG8gbWF0Y2g/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA1MTcxMTU4LjM5OTI0Ny0xLXBhdWwuY2VyY3VlaWxA
Ym9vdGxpbi5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
