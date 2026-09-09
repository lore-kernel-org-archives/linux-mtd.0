Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95682C79FB7
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 23:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pwy4RpRjEOEY0O7QZ213QHXF+4vJBu9M+7zaFp5UrHc=; b=m2GZhhFj+vAnpu
	qmNCa5pTHXNuGcm5C/IB8gC5J+ohbFMMe/F+WbTGt1xDfaa4IWdqdzZCl4rf9rBav+Iw0wt/ycVM8
	NeY3PDvMLfYhylb8NDmwMBaJDpARilc/pzj7ktY3jkZmnLJPUpMj6YVdg2eNC/fZkhIbCfM2UdmTm
	NOnP5uj4xEsGJXIAE/TI6BgEAApA+LYW3Guj1D6uVcsDjnVJwkJLfthHX6lFfw8FzIAgNx87uMeQw
	zly6hOI2H8n/hYfZ/iZ5lw7Fly3jZTj2XhDM+iYMNAp0YqCMMW+wZT4s6HNKFafxeTH586noBZzMM
	6Lr9o+w62udZ2Qj1+Nig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4RK9-0000000D3sp-2tsE;
	Wed, 09 Sep 2026 23:03:25 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4RK7-0000000D3sA-2iD6
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 23:03:24 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f9f0b23so314313266b.0
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 16:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788995001; cv=none;
        d=google.com; s=arc-20260327;
        b=sXq8E9kZjVLmlxptYVNEWfQZoqBuIzQmGgi8kFlgx8RLgsbN5xiB0kulfutNV7rmI4
         aEURxl7zFbK9CLANo5kRlneA42l0v2Y//iSEuA/dAjrD0uJnWcDOsdyMwr9lYVHTQsx1
         JNazGFGG3CugtZYbsEQw+ZRdv/RJZWnawDlcjv+yB/25WzwVYHoBOpeVsukhPV0LxMaN
         yZ4JzD9SlytGPFe3h+F5cmjPtRTP7dHGoWvevxO7XMNydVCIq/Ls/knfbCbR6rfar8uK
         BWq591L2yX6de10P4OnwWyPySqBy22PqQ5xh2pu/m2INdFXWhcwM5u4p88wi6xaWHaZE
         RFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WrGK+efAYby4F6StwbAB8hZlQQzWTB2dIMgTR2yypkU=;
        fh=Op5cGgSDILhO4m6k20Y29MBIq2bSQHOw3Lbyhm+dKzg=;
        b=LMu/cbiBOwiWtCetsqGs0wFc1zrdkJVrIKwloruh1ZRLYaE1fgB8P4kG7OTstG7HTc
         wSQl3NoNmZrLTY5bW/NNE9/a4GJRHSebW/6WhjDcSPxHdEGTm/48Zan0DVbK2XRDxP9i
         2eAZ431K9ytKgTj+7G8fhN620vonOio/HpOw0aXw587WDcd2n31fdwSuEvvSfeRlsbtM
         MLnq2oba0wbL6wzVt2VVBMWV1Y1koI9yvfd+FcdrlX/fNqqvB5soLfA+/q1c6tZyHFwq
         cU0UZEO0nCubWvt7i3bvLk8gDUafN3QPm4Jv0cujCiF9h+rwCRrybqD0nZWVC+6SGppA
         V5wA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788995001; x=1789599801; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrGK+efAYby4F6StwbAB8hZlQQzWTB2dIMgTR2yypkU=;
        b=bdbR2iToxyYvXbcDvv4ClPtiDmODh3Ki+lCicVYOT/Ncx9k77wY/m2Qcp91pWyRTVC
         TgwqVI+kH3eb699qNcvb2c6ZukpUco4odAMhlYutEjx+h6AvvPRGrretzHWBOtjpezOO
         Z8KGzb83edPvGgERYVuRTEW1NGvnk3thCiSZHrzFtGKJj/IyLSksIB/wnGiWBPYD5I3+
         4kaj/wWKtU7Pzdl4uhwfkEvRY2DNu9iUWOKgBwziXm9Pg3VaP5UKVYgH0fiB8flajg5t
         3VYFeOoaiiDl5YbpMXYikauE524uxs0Gk0ntjKzuqWa0YgVbO0KKOTwijiQDrOCukqMT
         6c1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788995001; x=1789599801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrGK+efAYby4F6StwbAB8hZlQQzWTB2dIMgTR2yypkU=;
        b=UQa8mVeV0y9ddQIkj6rRPNa8k3jBnzhLVGYz6hcUiOFLE8ZhYoZtgPTkYhWvHgNZTr
         7Cajuadk5VXzWbSOGdIDqTcKBAgPH3CnGzAZQj0bcAhn2zSawpTmiCrv1MunxmOUDtjf
         oe+UqktB3dzPfklr48fHL1pg6hTWOEB1nEZ4ofQY6lUcDWXdWay/BRPm6r/15/cz2c8l
         CISKwP4mv4m0SAOxQt4KuFXyLVUzHyagSMGEKzXJxrAnXyrhvOiRitRUWWymvwukc9C4
         WLIMeom7FNMbnflsbWFgIJNj/gT/iSOPTOc6JImfbwiTTqhNtPWrBCdPTEBRKQTnQ5Jt
         fb+A==
X-Gm-Message-State: AFuF++ntMDw8Zyzg5gVz+tqbLpYm/n/xMbdb5pgcyX08tUZSrzyrT9VH
	Ew7zmaR9V/+HXiM1TKl55oJe/e7f7TFFaQ2Ck+XzXIEgsjv5PrQQYxee3nlNDWZUXOHQ+d420Fp
	5WZJwG075gTg8eOFAdQ4X1L41OjvWzNGxLw==
X-Gm-Gg: AYBFou3zV1uVVeFTpu2rF4fQHCKmL8NeggBN6q2MFXIPoRTFr16e/+qUDhVReR0fKKw
	Bk/B1FLOehE2/grI/m4mFj0Boj302I0xCvu5pUFKZ8rx21cVi0fYvKgmiq2bTQWgwHuVt/XuzUb
	B6q7WHI+YeyjNi/8SCnpXxdvY/avkMAM5ptUa7dbSkGOQi2cgVUI0t1MG9NrAVRqmqU8VvlIGql
	tfuVDHUDWJ80XTnuuRECHE62oXwF9DB+rjWBAbNskQeL5NmnLuco10L2JnQ1Hn7+FWXfmDznA+h
	mhwaxoNyffm0hdPv1goNrCi6TzBVl5LIVdvytlJ8SmWbT7FJKhu+cwX4zei91JnCl/7OITyRKT5
	3Cuaf/GwEYnq8XceRnf6HREU9m6RNCK5iP8eXY2fKO7RM+OZO4TGGgTAL4iRKb20dfeRPGm6H5p
	HNE9/etDvqx3QaIZTdsIofECHf2Vc+5f8X9j/ylDPhVyi2mGVWZm6tiMTjcYcq1v+okg==
X-Received: by 2002:a17:907:c653:20b0:c29:4147:f4e2 with SMTP id
 a640c23a62f3a-c29414802c6mr263639966b.15.1788995001495; Wed, 09 Sep 2026
 16:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260909223813.69028-1-rosenp@gmail.com>
In-Reply-To: <20260909223813.69028-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 9 Sep 2026 16:03:09 -0700
X-Gm-Features: AcwNN1VC-6hHLvbxTegsPts35TfNWRTPgWH-LDOxn9y7jxLY48LzNU3w4xiIwTo
Message-ID: <CAKxU2N8fTU6at2tobF3Ny2aaYq+KOSz0JduWfh+jn-gNTRrDQw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: use devm_kasprintf for mtd name
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_160323_705494_6E3186DA 
X-CRM114-Status: GOOD (  17.08  )
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

T24gV2VkLCBTZXAgOSwgMjAyNiBhdCAzOjM44oCvUE0gUm9zZW4gUGVuZXYgPHJvc2VucEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gUmVwbGFjZSB0aGUgbWFudWFsIGthc3ByaW50ZigpIGluIHByb2Jl
IHdpdGggZGV2bV9rYXNwcmludGYoKSBzbyB0aGUKPiBuYW1lIGlzIGZyZWVkIGF1dG9tYXRpY2Fs
bHkgb24gZHJpdmVyIHJlbW92YWwsIGFuZCBkcm9wIHRoZSBub3cKPiB1bm5lY2Vzc2FyeSBrZnJl
ZSgpIGluIGZzbF9pZmNfY2hpcF9yZW1vdmUoKSBhbmQgaXRzIGxlZnRvdmVyIG10ZAo+IGxvY2Fs
Lgo+Cj4gQXNzaXN0ZWQtYnk6IG9wZW5jb2RlOmJpZy1waWNrbGUKPiBTaWduZWQtb2ZmLWJ5OiBS
b3NlbiBQZW5ldiA8cm9zZW5wQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvZnNsX2lmY19uYW5kLmMgfCA2ICstLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvZnNsX2lmY19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfaWZjX25hbmQuYwo+
IGluZGV4IDQ2OWIyMzNkYjczZS4uY2M3NWI2YTY3ZTA3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2ZzbF9pZmNfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
ZnNsX2lmY19uYW5kLmMKPiBAQCAtOTYzLDEwICs5NjMsNiBAQCBzdGF0aWMgaW50IGZzbF9pZmNf
Y2hpcF9pbml0KHN0cnVjdCBmc2xfaWZjX210ZCAqcHJpdikKPgo+ICBzdGF0aWMgaW50IGZzbF9p
ZmNfY2hpcF9yZW1vdmUoc3RydWN0IGZzbF9pZmNfbXRkICpwcml2KQo+ICB7Cj4gLSAgICAgICBz
dHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKCZwcml2LT5jaGlwKTsKPiAtCj4gLSAg
ICAgICBrZnJlZShtdGQtPm5hbWUpOwo+IC0KPiAgICAgICAgIGlmY19uYW5kX2N0cmwtPmNoaXBz
W3ByaXYtPmJhbmtdID0gTlVMTDsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gQEAgLTEwNjEsNyAr
MTA1Nyw3IEBAIHN0YXRpYyBpbnQgZnNsX2lmY19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKmRldikKPiAgICAgICAgICAgICAgICAgICAmaWZjLT5pZmNfbmFuZC5uYW5kX2V2dGVy
X2ludHJfZW4pOwo+Cj4gICAgICAgICBtdGQgPSBuYW5kX3RvX210ZCgmcHJpdi0+Y2hpcCk7Cj4g
LSAgICAgICBtdGQtPm5hbWUgPSBrYXNwcmludGYoR0ZQX0tFUk5FTCwgIiVsbHguZmxhc2giLCAo
dTY0KXJlcy0+c3RhcnQpOwo+ICsgICAgICAgbXRkLT5uYW1lID0gZGV2bV9rYXNwcmludGYocHJp
di0+ZGV2LCBHRlBfS0VSTkVMLCAiJWxseC5mbGFzaCIsICh1NjQpcmVzLT5zdGFydCk7Ckhhdmlu
ZyAmbXRkLT5kZXYgYXMgdGhlIGZpcnN0IGFyZ3VtZW50IHdvdWxkIGJlIGludGVyZXN0aW5nIGJ1
dCBub2JvZHkKZG9lcyB0aGlzLgo+ICAgICAgICAgaWYgKCFtdGQtPm5hbWUpIHsKPiAgICAgICAg
ICAgICAgICAgcmV0ID0gLUVOT01FTTsKPiAgICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gLS0K
PiAyLjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
