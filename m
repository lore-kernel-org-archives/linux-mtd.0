Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8206ECF45D7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jan 2026 22:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mwb6Y0G0YvW3xb/uC4GeI/mpI/cYTZVDnWxens75kgs=; b=hL3XKc3ggBsm9O
	WETttznNOTdnTINVhP/F3FVSPiR0B2WTn3y7MqmGvFRv7cLng3+biVVuwnx48QOdnEQQJflU1PBT5
	MQ+cZIhwnRwDpNW6UGUPLOygTmHEySDVbe/nd+KDzlmQFm1nax2oPT5v+5zVwrvWSaa8DqK6PK7e4
	pTxWx4N75iplXw0veZsiGHJW4R1bAIyXgrWLVu3kL9Esl2+985iaINDMMlL3yJg2xv9zI5den1lKL
	PXPKg4Gv9WZoswkiZzmEa/yI/vIgDVIVgHoKLKnTvuRSI7hdIjSiFWKiNnZNuv0Fzr/s2YTRB2ArL
	CnfPEA1KZFhKce7fBcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQrS-00000006H3p-3CTb;
	Mon, 12 Jan 2026 22:58:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQrQ-00000006H3i-1h0Q
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jan 2026 22:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 762ED600AE
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2026 22:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9E4C2BCB2
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2026 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768258686;
	bh=rGR4ZRN/eUN4de0udno9CMQ1JKZLoES5FgqCMPiLzqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZF1A2oSwK1WsbWs/HUBcLdTtmiUbK6URLC2b/N/uRpduXWfNWd7sFJHylH1WBFPGl
	 4W0qbD7+vI9ygSTKuxXub3hNW7e1OIABaHbvYwbMe1ze08bnQOEEeoYfB68cbMoZT4
	 t67BRBrPgRvrAJE9u9zTWFlb/F60evXfpOPf++hM/o6hBw3aSuKfcMvBGTetT6KeKP
	 QVOleN8aFaTqWZvRKkG6U13zjX8OYXDZDZOi6QHouEIPkJGHxnUt9q/x82RH815ikV
	 TjLUQA5zdmbV8F+L7qyGbJfx//yFgmhG46XYsjeZN8DO4O5jXhEpEuN5jtVf6u/Nc4
	 7naZe4GyxLteA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b4b35c812so11310482a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2026 14:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2fdqB6C/cn6I7B6GJKbRRxyabquYwH7b+zjs7wTAlydHQprYbIOqDECDpG3X7SleZ5KAq7Jnvku4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0zxhUUCBdyYBJNOD0QKOWiht2kJDoBTQlH6ZLXKQvKHNNyCtC
	PO5qnaLKK3zEbc7uCjrriPY6wLq3ci3XSUOwuBLVSKHDrKSNdp6qvxQOlpS7Q9tFz8S68io1UUu
	7y9WstYIfNHatwOtPkt0BtB7DcLWJpA==
X-Google-Smtp-Source: AGHT+IFvZMR6ZXQzmmWssKqU5VU1/QG0Dy+4mHOcf7yoi13by1s1GpP8Cl1/EvHF9RRVm6QkOUCvmPjShbd8Q2d+EvI=
X-Received: by 2002:a17:907:1ca8:b0:b72:b289:6de3 with SMTP id
 a640c23a62f3a-b84453ff014mr1934265266b.58.1768258685308; Mon, 12 Jan 2026
 14:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-6-124a53ce6279@kernel.org> <20260109-bright-purring-oyster-8c9f0b@quoll>
In-Reply-To: <20260109-bright-purring-oyster-8c9f0b@quoll>
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Jan 2026 16:57:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0NRHx5JVvcZZC1PX0UByFq7PmvZbH6QoNn3kBZgrbPg@mail.gmail.com>
X-Gm-Features: AZwV_Qju7S_APdjvo6ENgv2SSZg3sdeIvTR8mamw1g2_RQbQl5m7gRsuwu8q2uU
Message-ID: <CAL_Jsq+0NRHx5JVvcZZC1PX0UByFq7PmvZbH6QoNn3kBZgrbPg@mail.gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: mtd: partitions: Drop partitions.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAzOjM04oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSmFuIDA4LCAyMDI2IGF0IDExOjUzOjE1
QU0gLTA2MDAsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+ID4gIHBhdHRlcm5Qcm9wZXJ0aWVz
Ogo+ID4gICAgIl5wYXJ0aXRpb25zKC1ib290WzEyXXwtZ3BbMTRdKT8kIjoKPiA+IC0gICAgJHJl
ZjogL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9ucy55YW1sCj4gPiArICAgIHR5cGU6
IG9iamVjdAo+ID4gKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQo+ID4KPiA+IC0gICAg
cGF0dGVyblByb3BlcnRpZXM6Cj4gPiAtICAgICAgIl5wYXJ0aXRpb25AWzAtOWEtZl0rJCI6Cj4g
PiAtICAgICAgICAkcmVmOiAvc2NoZW1hcy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+
ID4gLQo+ID4gLSAgICAgICAgcHJvcGVydGllczoKPiA+IC0gICAgICAgICAgcmVnOgo+ID4gLSAg
ICAgICAgICAgIGRlc2NyaXB0aW9uOiBNdXN0IGJlIG11bHRpcGxlIG9mIDUxMiBhcyBpdCdzIGNv
bnZlcnRlZAo+ID4gLSAgICAgICAgICAgICAgaW50ZXJuYWxseSBmcm9tIGJ5dGVzIHRvIFNFQ1RP
Ul9TSVpFICg1MTIgYnl0ZXMpCj4gPiAtCj4gPiAtICAgICAgICByZXF1aXJlZDoKPiA+IC0gICAg
ICAgICAgLSByZWcKPiA+IC0KPiA+IC0gICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UKPiA+ICsgICAgcHJvcGVydGllczoKPiA+ICsgICAgICBjb21wYXRpYmxlOgo+ID4gKyAgICAg
ICAgY29udGFpbnM6Cj4gPiArICAgICAgICAgIGNvbnN0OiBmaXhlZC1wYXJ0aXRpb25zCj4gPgo+
ID4gIHJlcXVpcmVkOgo+ID4gICAgLSBjb21wYXRpYmxlCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLnlhbWwKPiA+IGluZGV4IGJiYjU2MjE2YTRlMi4u
ZTU2ZGJhODNmMDBhIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9tdGQueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9tdGQueWFtbAo+ID4gQEAgLTMwLDcgKzMwLDcgQEAgcHJvcGVydGllczoKPiA+
ICAgICAgZGVwcmVjYXRlZDogdHJ1ZQo+ID4KPiA+ICAgIHBhcnRpdGlvbnM6Cj4gPiAtICAgICRy
ZWY6IC9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbnMueWFtbAo+ID4gKyAgICB0eXBl
OiBvYmplY3QKPgo+IEkgdGhpbmsgeW91IG5lZWQgZXhwbGljaXQsIHNpbmNlIHdlIHJlcXVpcmUg
aXQgZm9yIGluY29tcGxldGUgbm9kZXM6Cj4KPiBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQoK
SSBwdXQgd2hhdCB0aGUgdG9vbHMgcmVxdWlyZWQgbWUgdG8gcHV0LiA6KSBXZSBvbmx5IHJlcXVp
cmUgaXQgd2hlbgpwcm9wZXJ0aWVzIGdldCBkZWZpbmVkIGJlY2F1c2UgdGhhdCdzIHRoZSBjYXNl
IHdlIGRvbid0IGtub3cgaWYgdGhlCnNjaGVtYSBpcyAqYWxsKiBwcm9wZXJ0aWVzIG9yIG5vdC4K
ClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
