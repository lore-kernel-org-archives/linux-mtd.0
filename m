Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF37E95A91
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YT5ogbSNA6xbR/N6bQ90krCzeugy1UpVMOe/r0jPpu8=; b=psbFJbGC5vITjK
	+z6VR4MbMHPHN7ml/+Ca6xta7Sus+aI08TB+4gmb1ABnglNKqCdq5TA6CzjKfhtvA005M+EbTIDzo
	8TWMXPZd63RxDN0uFPfmCYzVyVD5gBnY9G3C1XU4OZhYCoGSFVvcqKnjVB2mC/CAM0gIYRVpRxrvv
	iUfwC1+/lK6X7YBbsU0Ruc3yREElTFqVJyUWp1qzEvJpYQIKxy06dGI6uqmHCVF9ZNJ4vlcU8ZpDJ
	FA8hjt6BA2sfoJ26JfxFb4Gj+Wea0EdcbBNOvOkgCEISwrH1gBLYFMrcFCd3rRxnhFNz88GMO83LF
	mqr/yCjaFDm/bJ5ifmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkbd-009tdF-2C;
	Mon, 09 Oct 2023 07:23:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkbb-009tcA-0N
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 07:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12C5460F07
	for <linux-mtd@lists.infradead.org>; Mon,  9 Oct 2023 07:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD75AC433C9
	for <linux-mtd@lists.infradead.org>; Mon,  9 Oct 2023 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696836184;
	bh=gxed+PyPlKV1EIYLptm+8d9sgxEnTJLr23xR3gzhbgc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d/lhPhMr4x42+7y8aq89/c0rprEwKUVbxa5Ur1Nh1DFZ4u/66qF5vIF5wls6iWdIl
	 ICRPra29pQgSxKM2N1um+JM2mqWH3Tq4x8N6U28J6J0qkjL4uzXkb4l6PiDRY/5GAp
	 BUrkk1IUoa96SomdslV1Zw5js6zAPA2Q7TcQmN5d2C4+XZGxkN3xM05UwGFLLGLMWH
	 2I/ZDAAOjUkxeakzvHb+MLzCCxjmAVoK+kS9Nog0pSjqpW2gnfEZInCVQzhcMXCIYL
	 ZRNNgNdt0UjduXXFywSq+Jp7yivSVlN/r8lErbUQ8rjJxLD+z2hQ1hdLpoND073zne
	 sRFvyJqJzeqjA==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6c6504c9ac5so2978189a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 00:23:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YzgdQpV1AG0QDBhLmcOgPLfHcLYFmWGYUvnuH6UtYO73G8JVt69
	sobKfd9wmQoPaOwDDpaA0UhHcjNbSyVwd0hJd+w=
X-Google-Smtp-Source: AGHT+IERynuZ0eRpygHJOJnip83U36ywByKOuj2HMyABKFQ7nt7kfo6a/OqTQJYxIrevx6ZT6gO2J1vlmEOZcYtctXs=
X-Received: by 2002:a05:6870:2b0f:b0:1e1:fe79:6831 with SMTP id
 ld15-20020a0568702b0f00b001e1fe796831mr15440541oab.57.1696836184084; Mon, 09
 Oct 2023 00:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de> <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Oct 2023 16:22:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
Message-ID: <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse <David.Woodhouse@intel.com>, 
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-mtd@lists.infradead.org, kernel@pengutronix.de, 
	linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_002307_264354_DB4FD3A6 
X-CRM114-Status: GOOD (  27.06  )
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

T24gTW9uLCBPY3QgOSwgMjAyMyBhdCA1OjAy4oCvQU0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBBcyBkZXNjcmliZWQgaW4gdGhl
IGFkZGVkIGNvZGUgY29tbWVudCwgYSByZWZlcmVuY2UgdG8gLmV4aXQudGV4dCBpcyBvawo+IGZv
ciBkcml2ZXJzIHJlZ2lzdGVyZWQgdmlhIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKS4g
TWFrZSB0aGlzCj4gZXhwbGljaXQgdG8gcHJldmVudCBhIHNlY3Rpb24gbWlzbWF0Y2ggd2Fybmlu
ZyB3aXRoCj4gQ09ORklHX01URF9OQU5EX1RYWDlOREZNQz1tOgo+Cj4gICAgICAgICBXQVJOSU5H
OiBtb2Rwb3N0OiBkcml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWM6IHNlY3Rpb24gbWlzbWF0
Y2ggaW4gcmVmZXJlbmNlOiB0eHg5bmRmbWNfZHJpdmVyKzB4NCAoc2VjdGlvbjogLmRhdGEpIC0+
IHR4eDluZGZtY19yZW1vdmUgKHNlY3Rpb246IC5leGl0LnRleHQpCj4KPiBGaXhlczogNjRmYjY1
YmFmZmE1ICgiW01URF0gVFh4OSBTb0MgTkFORCBGbGFzaCBNZW1vcnkgQ29udHJvbGxlciBkcml2
ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gSGVsbG8sCj4KPiBub3RlIHRoaXMgd2FybmluZyBvbmx5
IHRyaWdnZXJzIHdpdGggZjE3N2NkMGMxNWZjICgibW9kcG9zdDogRG9uJ3QgbGV0Cj4gImRyaXZl
ciJzIHJlZmVyZW5jZSAuZXhpdC4qIikgdGhhdCBjdXJyZW50bHkgd2FpdHMgaW4gbmV4dCBmb3Ig
dGhlIG5leHQKPiBtZXJnZSB3aW5kb3cgKyBidWlsZGluZyB3aXRoIFc9MS4KPgo+IEJlc3QgcmVn
YXJkcwo+IFV3ZQo+Cj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jIHwgOCArKysr
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1jLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYwo+IGluZGV4IGVkZGNjMDcyOGE2Ny4uYWZmOWQ2ZjE2
ODUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jCj4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1jLmMKPiBAQCAtNDA2LDcgKzQwNiwxMyBA
QCBzdGF0aWMgaW50IHR4eDluZGZtY19yZXN1bWUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2
KQo+ICAjZGVmaW5lIHR4eDluZGZtY19yZXN1bWUgTlVMTAo+ICAjZW5kaWYKPgo+IC1zdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciB0eHg5bmRmbWNfZHJpdmVyID0gewo+ICsvKgo+ICsgKiB0
eHg5bmRmbWNfcmVtb3ZlKCkgbGl2ZXMgaW4gLmV4aXQudGV4dC4gRm9yIGRyaXZlcnMgcmVnaXN0
ZXJlZCB2aWEKPiArICogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgpIHRoaXMgaXMgb2sg
YmVjYXVzZSB0aGV5IGNhbm5vdCBnZXQgdW5ib3VuZCBhdAo+ICsgKiBydW50aW1lLiBTbyBtYXJr
IHRoZSBkcml2ZXIgc3RydWN0IHdpdGggX19yZWZkYXRhIHRvIHByZXZlbnQgbW9kcG9zdAo+ICsg
KiB0cmlnZ2VyaW5nIGEgc2VjdGlvbiBtaXNtYXRjaCB3YXJuaW5nLgo+ICsgKi8KPiArc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdHh4OW5kZm1jX2RyaXZlciBfX3JlZmRhdGEgPSB7Cj4g
ICAgICAgICAucmVtb3ZlICAgICAgICAgPSBfX2V4aXRfcCh0eHg5bmRmbWNfcmVtb3ZlKSwKPiAg
ICAgICAgIC5yZXN1bWUgICAgICAgICA9IHR4eDluZGZtY19yZXN1bWUsCj4gICAgICAgICAuZHJp
dmVyICAgICAgICAgPSB7Cj4gLS0KPiAyLjQwLjEKPgoKCldlIGhhdmUgdGhvdXNhbmRzIG9mIG1v
ZHVsZV9wbGF0Zm9ybV9kcml2ZXJzLgpJIHdvdWxkIGJlIHNjYXJlZCBpZiB0aGV5IHN0YXJ0ZWQg
dG8gYWRkIF9fcmVmZGF0YS4KCkkgYW0gbm90IHN1cmUgaWYgdGhpcyBpcyB0aGUgcmlnaHQgZGly
ZWN0aW9uLgoKSSBhZGRlZCBHcmVnIGFuZCBBcm5kIHRvIENDLgoKCgpJbiBteSB1bmRlcnN0YW5k
aW5nIG9mIHRoZSBjdXJyZW50IERUIG92ZXJsYXksCnRoZXJlIGlzIG5vIHdheSB0byBjcmVhdGUv
cmVtb3ZlIGEgcGxhdGZvcm0gZGV2aWNlIGR5bmFtaWNhbGx5LgpJIGRvIG5vdCBrbm93IGlmIHRo
YXQgd2lsbCBoYXBwZW4gaW4gdGhlIGZ1dHVyZS4KCgoKLS0KQmVzdCBSZWdhcmRzCk1hc2FoaXJv
IFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
