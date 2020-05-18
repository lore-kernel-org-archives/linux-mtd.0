Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11392C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 14:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBCC520674
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 14:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lT+AM5+p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBCC520674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ribalda.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOoxhLl0OOVffgjFHPV9SWNt1qIjWNcQddyoJSl0K24=; b=lT+AM5+prF/rEj
	y8oJUt20+wlh/+jUY+Dg4XhYoQci0bp5JWy6rCtpw777pgf8CASFsX76DIICBksADdgJgcQchAM1V
	TqTKcF/ot4JJSe0fzkNCyRKlipo79/q72NK9PwUlXXthfbWP0w4klC03YaA4kV4D7JHSrkmwaEuNI
	5R73Dw1pqqYHLpIJuyz1yTfUWKFS3lp2Y6jTYuwbduAYNB+I7xxzNNSSAx2V4a0sJ7JQgmj1WOxIQ
	A3CQfWaIUvWZInCg8wtM2WdbT78muqJOtWq+8kDSIcO5bibpOVnL4piFyVfRyxlu6yCIhYS+noOKd
	AOoIZ495872uKfOriJQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jagLK-0004vS-6k; Mon, 18 May 2020 14:02:10 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagLH-0004uY-0W
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 14:02:08 +0000
Received: by mail-lf1-f68.google.com with SMTP id x22so5233014lfd.4
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 07:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bCuvQ6iS1rPEzwBXbmiCug01x/Tz4wLq/DBW469rS5I=;
 b=WbmCoHZ2QXkbUkavDfOWXwR4BhIz3DL70BPVqmdUMoG2g28VtEU/64sZ4G8+/RUcq+
 MkdlA4m56fdQb+jSwJMbHwKPiz/ETOni4zhq8hPeEVsZOIdIc0J/AazMgQgcyAQyaHGF
 Xq7vfXtP2TLGfALuA0nZkO3I3LWyk5IrYytiKjOwEvtUFY/Cw6KqhTZLIWNTXejEi1LJ
 s8dWtIETrO8dnO2rmBF483c3c1Dt/UkXJuW6tGnlHWXm8M60WK9XTy4H0DFStq2hjJ2k
 ixazsnECFWgOA2DC7nohoWS+FeSxfBDLqaY02VADmyW+CaxvcShJeuq+5kJRDrwKQiH7
 SrpQ==
X-Gm-Message-State: AOAM5317jbC00BWVIAfDnl0wr+Ba+IkoVkMfTzLIYItEdcMwTynSZZMT
 noN6Th+EiyvmsO4eM70buSg3JFOC+AbFFVlDPOQ=
X-Google-Smtp-Source: ABdhPJy9slnVo8Qy/rj0GFizSHRmydSs7zs0ldMbovWfYdCgDSFv2hF8bDxHESyVfpgFE+Y4y6E0PCBpLmUN2F5PAUo=
X-Received: by 2002:a05:6512:3f8:: with SMTP id
 n24mr12151576lfq.179.1589810524938; 
 Mon, 18 May 2020 07:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200430131721.360064-1-ricardo@ribalda.com>
 <20200504104339.31b4a858@xps13>
In-Reply-To: <20200504104339.31b4a858@xps13>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Mon, 18 May 2020 16:01:47 +0200
Message-ID: <CAPybu_3D5p7P5ND5qb8-2QmaQhQuvdEbiNKkeK5PbHdF3s-2Fg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Fix mtd not registered due to nvmem name collision
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_070207_049044_C04DEBD7 
X-CRM114-Status: GOOD (  20.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, Alban Bedel <albeu@free.fr>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkKClRoaXMgaXMganVzdCBhIGZyaWVuZGx5IHBpbmcgYWZ0ZXIgdHdvIHdlZWtzIDspCgpPbiBN
b24sIE1heSA0LCAyMDIwIGF0IDEwOjQ0IEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgUmljaGFyZCwKPgo+IFJpY2FyZG8gUmliYWxkYSBE
ZWxnYWRvIDxyaWNhcmRvQHJpYmFsZGEuY29tPiB3cm90ZSBvbiBUaHUsIDMwIEFwciAyMDIwCj4g
MTU6MTc6MjEgKzAyMDA6Cj4KPiA+IEZyb206IFJpY2FyZG8gUmliYWxkYSBEZWxnYWRvIDxyaWJh
bGRhQGtlcm5lbC5vcmc+Cj4gPgo+ID4gV2hlbiB0aGUgbnZtZW0gZnJhbWV3b3JrIGlzIGVuYWJs
ZWQsIGEgbnZtZW0gZGV2aWNlIGlzIGNyZWF0ZWQgcGVyIG10ZAo+ID4gZGV2aWNlL3BhcnRpdGlv
bi4KPiA+Cj4gPiBJdCBpcyBub3QgdW5jb21tb24gdGhhdCBhIGRldmljZSBjYW4gaGF2ZSBtdWx0
aXBsZSBtdGQgZGV2aWNlcyB3aXRoCj4gPiBwYXJ0aXRpb25zIHRoYXQgaGF2ZSB0aGUgc2FtZSBu
YW1lLiBFZywgd2hlbiB0aGVyZSBEVCBvdmVybGF5IGlzIGFsbG93ZWQKPiA+IGFuZCB0aGUgc2Ft
ZSBkZXZpY2Ugd2l0aCBtdGQgaXMgYXR0YWNoZWQgdHdpY2UuCj4gPgo+ID4gVW5kZXIgdGhhdCBj
aXJjdW1zdGFuY2VzLCB0aGUgbXRkIGZhaWxzIHRvIHJlZ2lzdGVyIGR1ZSB0byBhIG5hbWUKPiA+
IGR1cGxpY2F0aW9uIG9uIHRoZSBudm1lbSBmcmFtZXdvcmsuCj4gPgo+ID4gV2l0aCB0aGlzIHBh
dGNoIHdlIHVzZSB0aGUgbXRkWCBuYW1lIGluc3RlYWQgb2YgdGhlIHBhcnRpdGlvbiBuYW1lLAo+
ID4gd2hpY2ggaXMgdW5pcXVlLgo+ID4KPiA+IFsgICAgOC45NDg5OTFdIHN5c2ZzOiBjYW5ub3Qg
Y3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFtZSAnL2J1cy9udm1lbS9kZXZpY2VzL1Byb2R1Y3Rpb24g
RGF0YScKPiA+IFsgICAgOC45NDg5OTJdIENQVTogNyBQSUQ6IDI0NiBDb21tOiBzeXN0ZW1kLXVk
ZXZkIE5vdCB0YWludGVkIDUuNS4wLXF0ZWMtc3RhbmRhcmQgIzEzCj4gPiBbICAgIDguOTQ4OTkz
XSBIYXJkd2FyZSBuYW1lOiBBTUQgRGliYmxlci9EaWJibGVyLCBCSU9TIDA1LjIyLjA0LjAwMTkg
MTAvMjYvMjAxOQo+ID4gWyAgICA4Ljk0ODk5NF0gQ2FsbCBUcmFjZToKPiA+IFsgICAgOC45NDg5
OTZdICBkdW1wX3N0YWNrKzB4NTAvMHg3MAo+ID4gWyAgICA4Ljk0ODk5OF0gIHN5c2ZzX3dhcm5f
ZHVwLmNvbGQrMHgxNy8weDJkCj4gPiBbICAgIDguOTQ5MDAwXSAgc3lzZnNfZG9fY3JlYXRlX2xp
bmtfc2QuaXNyYS4wKzB4YzIvMHhkMAo+ID4gWyAgICA4Ljk0OTAwMl0gIGJ1c19hZGRfZGV2aWNl
KzB4NzQvMHgxNDAKPiA+IFsgICAgOC45NDkwMDRdICBkZXZpY2VfYWRkKzB4MzRiLzB4ODUwCj4g
PiBbICAgIDguOTQ5MDA2XSAgbnZtZW1fcmVnaXN0ZXIucGFydC4wKzB4MWJmLzB4NjQwCj4gPiAu
Li4KPiA+IFsgICAgOC45NDg5MjZdIG10ZCBtdGQ4OiBGYWlsZWQgdG8gcmVnaXN0ZXIgTlZNRU0g
ZGV2aWNlCj4gPgo+ID4gRml4ZXM6IGM0ZGZhMjVhYjMwNyAoIm10ZDogYWRkIHN1cHBvcnQgZm9y
IHJlYWRpbmcgTVREIGRldmljZXMgdmlhIHRoZSBudm1lbSBBUEkiKQo+ID4gU2lnbmVkLW9mZi1i
eTogUmljYXJkbyBSaWJhbGRhIERlbGdhZG8gPHJpYmFsZGFAa2VybmVsLm9yZz4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvbXRkL210ZGNvcmUuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiBpbmRleCAyOTE2Njc0MjA4
YjMuLjI5ZDQxMDAzZDZlMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+
ID4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiBAQCAtNTU1LDcgKzU1NSw3IEBAIHN0
YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+Cj4gPiAgICAg
ICBjb25maWcuaWQgPSAtMTsKPiA+ICAgICAgIGNvbmZpZy5kZXYgPSAmbXRkLT5kZXY7Cj4gPiAt
ICAgICBjb25maWcubmFtZSA9IG10ZC0+bmFtZTsKPiA+ICsgICAgIGNvbmZpZy5uYW1lID0gZGV2
X25hbWUoJm10ZC0+ZGV2KTsKPiA+ICAgICAgIGNvbmZpZy5vd25lciA9IFRISVNfTU9EVUxFOwo+
ID4gICAgICAgY29uZmlnLnJlZ19yZWFkID0gbXRkX252bWVtX3JlZ19yZWFkOwo+ID4gICAgICAg
Y29uZmlnLnNpemUgPSBtdGQtPnNpemU7Cj4KPiBXZSBob3BlIHRoaXMgd2lsbCBkZWZpbml0ZWx5
IGZpeCB0aGUgTlZNRU0gZHVwbGljYXRlIG5hbWUgaXNzdWUuIElmIGl0Cj4gZG9lcyBub3QgcmVs
aWFibHksIHdlIG1pZ2h0IHdhbnQgdG8gcmV2ZXJ0IHRoaXMgcGF0Y2ggYW5kIGNyZWF0ZSBhbiBN
VEQKPiB1bmlxdWUgSUQgZmllbGQgd2hpY2gsIGZvciBlYWNoIE1URCBkZXZpY2UsIGNvbmNhdGVu
YXRlcyB0aGUgbmFtZSBvZgo+IGl0cyBwYXJlbnQgYW5kIGl0cyBvd24gbXRkLT5uYW1lLgo+Cj4g
QWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4KPiBU
aGFua3MsCj4gTWlxdcOobAoKCgotLSAKUmljYXJkbyBSaWJhbGRhCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
