Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354E0C0032E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 02:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=staJwUOTmB1IE2gZ547v8hyQ3oQOdDrGRda6kUChj5I=; b=vOvrKPxkLWLZ+m
	29VIekZoErPc9N2h1uXAcYc/IpH8V7ObhCYFoJN8Y6aYmfNr4bvwyKSv+Ero6i08BD1LFZ5gt4G/e
	sGCesXVlklup2yqRBZZ23r5yPl4Qx+4gS28zbUUL7QSiMrmYS/bvLXZIGIMmGcq+vWIiQaLwO4T+1
	Zqw/IefYKa3qxB7lGd49aEzAzaLWuTOoDJbl1LIuRvPbN6LuHkl1CJgqHryQbbAmg9ZpFbZhgIdkh
	47V/q3istIF3N3pwbfGw7pKLuG/ypPz1M+E2mkJPAoDQdug3I88tbK39Bb1JGOLS0XTyavRcOtggs
	2gt0NDM9gPg6efuYqjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qukmY-006GBl-06;
	Mon, 23 Oct 2023 02:35:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qukmP-006GAz-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 02:34:59 +0000
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D54663FA69
	for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2023 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698028489;
	bh=/z90kVHSuesNRVY9EhRmSRFJcLC8zb/BUX/p+1SLxl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Pzk5u6rIXZdn2jB0cZhwxhCye4wWAOb6MfsLNnQVwoUJaXy90GcjTQ858JJ/02m8G
	 7Qp6LiSQAfo4Klw4vPGHTrjd44sjZAU4XFzqHaKNh3JaFuPvtBhXN4GTQUZStGKSyi
	 JJBzuYfol1vKiLF26McNDrYJgPop2V6gbURAf/bFg37qPsgsM2Y9IZUQhqB2nXkOJR
	 s4FgzLZb4GsOSUqNAm1EntqJq8O6Gim2pWNRaZRY5ZWEPELRHCWi+dez3AnhIZs93x
	 4Ag+g/PWXUqt+l5ckHTQXn+bpfUSgMU7KHsTNGJ//NpmX6mHGOICInWOt7s09OxfrO
	 JmcS3AXWlBy6A==
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-d9cad450d5fso3508522276.1
        for <linux-mtd@lists.infradead.org>; Sun, 22 Oct 2023 19:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698028487; x=1698633287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z90kVHSuesNRVY9EhRmSRFJcLC8zb/BUX/p+1SLxl0=;
        b=UbNSeF7QvnGLpYKJilCcVwvHpnPmsHhTfMCdY0GfvvOrh1Z5Y5PDigBZleTHcJ58Yn
         ezKa6vFGWmxaO5EfJOCVXPbVNnPGZ2QPkruEXR1JwP6Mr/LxBqVZTiDU+gMlDp7okHSv
         MUXp2CgQywKmSoZK0Etkr1J6m1pNJYEXmxZLcdv3rjrGM/aeHiFKnOhMNERdFAKd/n+l
         JGNVDBa+2abKllf9H0X9/VQLXLSinL2zeh2kb5OzEfqyKtVUUZWRo1T5fR1lkFWyjziq
         lGsM8l+XWjyJmTAudL6BSneCG3GiHJ5oWr8mdfK7w/OkvRL8aS3+PcP39DiwdqkZ1Lj4
         qpcA==
X-Gm-Message-State: AOJu0Yyu9JCxGNxBtvOgRYQR+CO+1+FxBAE/FqNzYxMpLDOLt7Q3AZD5
	ZddPKsriYm+s4nvjBrdUnKzbZTKVp9ZVPFvYVeeSeHi/ArETw5MUpOUSO53OefPj1KOFtLDr+j+
	tCAWrFQyMTvHxJ4gSHLYrSD5f+HHXVmfRhVWg7zFm67vB3iuBlMlePMsQLRM=
X-Received: by 2002:a5b:d44:0:b0:d85:eb7b:5c74 with SMTP id f4-20020a5b0d44000000b00d85eb7b5c74mr8143638ybr.31.1698028487496;
        Sun, 22 Oct 2023 19:34:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnn2GhXGcAB7IHMlOwmoGs3Q0Dar7QVxE6l0kd38MCSzy5MIBmMukQKmx5FXtss0VssztHdzc/ubLiRfOVWb4=
X-Received: by 2002:a5b:d44:0:b0:d85:eb7b:5c74 with SMTP id
 f4-20020a5b0d44000000b00d85eb7b5c74mr8143628ybr.31.1698028487217; Sun, 22 Oct
 2023 19:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231019064547.348446-1-acelan.kao@canonical.com> <mafs07cnin59q.fsf@kernel.org>
In-Reply-To: <mafs07cnin59q.fsf@kernel.org>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Mon, 23 Oct 2023 10:34:34 +0800
Message-ID: <CAFv23QmjV9RAtvZJT2=8BPKZn+LsZbLG45t7fr2Z7Nq2C2nH0A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Lower the priority of the software reset
 failure message
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_193457_504442_55A1D2C6 
X-CRM114-Status: GOOD (  26.54  )
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

UHJhdHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IOaWvCAyMDIz5bm0MTDmnIgxOeaX
pSDpgLHlm5sg5LiL5Y2IODo1MuWvq+mBk++8mgo+Cj4gT24gVGh1LCBPY3QgMTkgMjAyMywgQWNl
TGFuIEthbyB3cm90ZToKPgo+ID4gRnJvbTogIkNoaWEtTGluIEthbyAoQWNlTGFuKSIgPGFjZWxh
bi5rYW9AY2Fub25pY2FsLmNvbT4KPiA+Cj4gPiBOb3QgYWxsIFNQSSBkcml2ZXJzIHN1cHBvcnQg
c29mdCByZXNldCBlbmFibGUgYW5kIHNvZnQgcmVzZXQgY29tbWFuZHMuCj4gPiBUaGlzIGZhaWx1
cmUgaXMgZXhwZWN0ZWQgYW5kIG5vdCBjcml0aWNhbC4gVGh1cywgd2UgYXZvaWQgcmVwb3J0aW5n
IGl0Cj4gPiB0byByZWd1bGFyIHVzZXJzIHRvIHByZXZlbnQgcG90ZW50aWFsIGNvbmZ1c2lvbiBy
ZWdhcmRpbmcgcG93ZXItb2ZmIGlzc3Vlcy4KSGkgUHJhdHl1c2gsCj4KPiBObywgZmFpbHVyZSB0
byBzb2Z0IHJlc2V0IGNhbiB2ZXJ5IG11Y2ggYmUgY3JpdGljYWwgaW4gY2VydGFpbiBjYXNlcy4K
PiBGb3IgZXhhbXBsZSwgaWYgeW91IGFyZSBvcGVyYXRpbmcgdGhlIGZsYXNoIGluIDhELThELThE
IG1vZGUgYW5kIGRvIG5vdAo+IGhhdmUgdGhlIGhhcmQgcmVzZXQgbGluZSBjb25uZWN0ZWQsIHRo
ZSBib290bG9hZGVyIChvciB0aGUga2VybmVsKSB3b3VsZAo+IGJlIHVuYWJsZSB0byBkZXRlY3Qg
b3Igb3BlcmF0ZSB0aGUgZmxhc2ggYWZ0ZXIgYSB3YXJtIHJlYm9vdC4KPgo+IFBlcmhhcHMgaXQg
bWFrZXMgc2Vuc2UgdG8ganVzdCBjYWxsIGl0IHdoZW4gU05PUl9GX0JST0tFTl9SRVNFVCBpcyBz
ZXQ/Cj4gVGhpcyB3YXkgeW91IGRvIG5vdCB1bm5lY2Vzc2FyaWx5IGNhbGwgaXQgd2hlbiB5b3Ug
ZG8gbm90IG5lZWQgdG8sIGFuZAo+IHdvbid0IHNlZSB0aGUgZXJyb3IgbWVzc2FnZS4KVGhlIGlz
c3VlIEkgZm91bmQgd2FzIG9uIGEgeDg2IGRlc2t0b3AsIGFuZCBJIGNhbiBmaW5kIG1hbnkgb3Ro
ZXIgc2FtZQpidWcgcmVwb3J0cyB0YWxrZWQgYWJvdXQgdGhlIHNwaS1ub3IgcmVzZXQgZmFpbHVy
ZS4KClRoZSBpc3N1ZSBpcyBmcm9tIHNwaS1pbnRlbCBkcml2ZXIgdGhhdCBkb2Vzbid0IGFjY2Vw
dCB0aGUgcmVzZXQKY29tbWFuZCBhbmQgcmV0dXJuIGZhbHNlIHdoZW4gY2FsbHMgaXRzIHN1cHBv
cnRzIGZ1bmN0aW9uCnNwaV9ub3Jfc29mdF9yZXNldCgpIC0+IHNwaV9tZW1fZXhlY19vcCgpIC0+
CnNwaV9tZW1faW50ZXJuYWxfc3VwcG9ydHNfb3AoKSAtPiBjdGxyLT5tZW1fb3BzLT5zdXBwb3J0
c19vcCgpIC0+CmludGVsX3NwaV9zdXBwb3J0c19tZW1fb3AoKSByZXR1cm4gZmFsc2UKQW5kICBm
cm9tIHNwaV9tZW1fZXhlY19vcCgpLCBpdCByZXR1cm5zIC1FTk9UU1VQUC4KClNvLCBkbyB5b3Ug
dGhpbmsgaXQncyBiZXR0ZXIgdGhhdCB3ZSBkaXN0aW5ndWlzaCAtRU5PVFNVUFAgYW5kIG90aGVy
CmZhaWx1cmVzIGluIHNwaV9ub3Jfc29mdF9yZXNldCgpIGxpa2VzCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwppbmRl
eCAxYjBjNjc3MGMxNGUuLjc2OTIwZGJjNTY4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3Bp
LW5vci9jb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKQEAgLTMyNTIsNyAr
MzI1MiwxMCBAQCBzdGF0aWMgdm9pZCBzcGlfbm9yX3NvZnRfcmVzZXQoc3RydWN0IHNwaV9ub3Ig
Km5vcikKCiAgICAgICAgcmV0ID0gc3BpX21lbV9leGVjX29wKG5vci0+c3BpbWVtLCAmb3ApOwog
ICAgICAgIGlmIChyZXQpIHsKLSAgICAgICAgICAgICAgIGRldl93YXJuKG5vci0+ZGV2LCAiU29m
dHdhcmUgcmVzZXQgZmFpbGVkOiAlZFxuIiwgcmV0KTsKKyAgICAgICAgICAgICAgIGlmIChyZXQg
PT0gLUVOT1RTVVBQKQorICAgICAgICAgICAgICAgICAgICAgICBkZXZfaW5mbyhub3ItPmRldiwg
IlNvZnR3YXJlIHJlc2V0IGVuYWJsZQpjb21tYW5kIGRvZXNuJ3Qgc3VwcG9ydDogJWRcbiIsIHJl
dCk7CisgICAgICAgICAgICAgICBlbHNlCisgICAgICAgICAgICAgICAgICAgICAgIGRldl93YXJu
KG5vci0+ZGV2LCAiU29mdHdhcmUgcmVzZXQgZmFpbGVkOiAlZFxuIiwgcmV0KTsKICAgICAgICAg
ICAgICAgIHJldHVybjsKICAgICAgICB9CgpAQCAtMzI2Miw3ICszMjY1LDEwIEBAIHN0YXRpYyB2
b2lkIHNwaV9ub3Jfc29mdF9yZXNldChzdHJ1Y3Qgc3BpX25vciAqbm9yKQoKICAgICAgICByZXQg
PSBzcGlfbWVtX2V4ZWNfb3Aobm9yLT5zcGltZW0sICZvcCk7CiAgICAgICAgaWYgKHJldCkgewot
ICAgICAgICAgICAgICAgZGV2X3dhcm4obm9yLT5kZXYsICJTb2Z0d2FyZSByZXNldCBmYWlsZWQ6
ICVkXG4iLCByZXQpOworICAgICAgICAgICAgICAgaWYgKHJldCA9PSAtRU5PVFNVUFApCisgICAg
ICAgICAgICAgICAgICAgICAgIGRldl9pbmZvKG5vci0+ZGV2LCAiU29mdHdhcmUgcmVzZXQgY29t
bWFuZApkb2Vzbid0IHN1cHBvcnQ6ICVkXG4iLCByZXQpOworICAgICAgICAgICAgICAgZWxzZQor
ICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2Fybihub3ItPmRldiwgIlNvZnR3YXJlIHJlc2V0
IGZhaWxlZDogJWRcbiIsIHJldCk7CiAgICAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgfQoK
Pgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoaWEtTGluIEthbyAoQWNlTGFuKSA8YWNlbGFuLmth
b0BjYW5vbmljYWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMg
fCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gPiBpbmRleCAxYjBjNjc3MGMxNGUuLjdiY2E4ZmZj
ZDc1NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gPiArKysg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ID4gQEAgLTMyNTIsNyArMzI1Miw3IEBAIHN0
YXRpYyB2b2lkIHNwaV9ub3Jfc29mdF9yZXNldChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ID4KPiA+
ICAgICAgIHJldCA9IHNwaV9tZW1fZXhlY19vcChub3ItPnNwaW1lbSwgJm9wKTsKPiA+ICAgICAg
IGlmIChyZXQpIHsKPiA+IC0gICAgICAgICAgICAgZGV2X3dhcm4obm9yLT5kZXYsICJTb2Z0d2Fy
ZSByZXNldCBmYWlsZWQ6ICVkXG4iLCByZXQpOwo+ID4gKyAgICAgICAgICAgICBkZXZfaW5mbyhu
b3ItPmRldiwgIlNvZnR3YXJlIHJlc2V0IGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gPiAgICAgICAg
ICAgICAgIHJldHVybjsKPiA+ICAgICAgIH0KPiA+Cj4gPiBAQCAtMzI2Miw3ICszMjYyLDcgQEAg
c3RhdGljIHZvaWQgc3BpX25vcl9zb2Z0X3Jlc2V0KHN0cnVjdCBzcGlfbm9yICpub3IpCj4gPgo+
ID4gICAgICAgcmV0ID0gc3BpX21lbV9leGVjX29wKG5vci0+c3BpbWVtLCAmb3ApOwo+ID4gICAg
ICAgaWYgKHJldCkgewo+ID4gLSAgICAgICAgICAgICBkZXZfd2Fybihub3ItPmRldiwgIlNvZnR3
YXJlIHJlc2V0IGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAgICAgIGRldl9pbmZv
KG5vci0+ZGV2LCAiU29mdHdhcmUgcmVzZXQgZmFpbGVkOiAlZFxuIiwgcmV0KTsKPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuOwo+ID4gICAgICAgfQo+Cj4gLS0KPiBSZWdhcmRzLAo+IFByYXR5dXNo
IFlhZGF2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
