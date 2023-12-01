Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5896C10F04
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OMKpG/yGGaimNd+x2dn0lWMOyOJw/msRizsCkm7ba4=; b=FN+OkhTDRN+Lc/
	J58rp0VdvjtIBBY4jUBMMW9ozIRQRfQSrJxgbEJHzwPu1GHrjRITShpK1GghS4BlDjewUsZt83Mah
	BD8Iq4xOgcVNsnxM/AbOj17pfylDAvHxRC+2vhUGmEuoic3CXV9peEAn/8SGxWUaW0Log/KSsLUas
	g6Ph9iQ4lkMOz3r2BNk49ta/gJGZciC1e51zZXNIsd2GxOG9FCwWELERSKNnraZJDfsvGp+LvJqv7
	0KjqAYeClg1xpRRSdDruUS72yqRzANKCCSZBlsPGrXQd2sLWUwf2l4iChUt7a85ed6pViDv3j82tc
	132/66gWsHhT+qCz4sKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r98WY-00ESTt-09;
	Fri, 01 Dec 2023 18:46:02 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r98WV-00ESSa-05
	for linux-mtd@lists.infradead.org;
	Fri, 01 Dec 2023 18:46:00 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6d851dc783fso388362a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 01 Dec 2023 10:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701456354; x=1702061154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXMK7gYwKBc2+MSS7X0vjsoPudj5rbIJ6yvk1AkwxJg=;
        b=bRVgNY5fgg2UgA1/HrXzoXgSo/g3SbKpDL9i606bm3lH7gA9O+xdHBKH5U8I8F/7Mb
         hWe4sxNRfu5EwAyihu12e/bFsuuqmUZ7FB/Qf1DA5TtkMglmKENWWttMyWR/jZtL1Dd9
         +0DHwgFZHMV3/Y6I7lL17cJuD7k4wK4iXm3y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701456354; x=1702061154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXMK7gYwKBc2+MSS7X0vjsoPudj5rbIJ6yvk1AkwxJg=;
        b=U2lCHeJshayCJsjwbLLuIcD6EqC5wytmuhyEfkVFXtYE3ECPrjWWELhX4g2WkwCPQU
         GM0tGDIWE2HeiFIa0ADM8AVoOgaSnXGKqJ96Lujmmnju02CQJfouUH59HUyqQTCRIABe
         ecOpDemHVxT2Vd3mitTlzBuY2YiavW5OapvIoBNZm9aYp30JtpciMaldpNQXoh3+dg/5
         +Ui6qzajXyzJ2WV71AUolomL3HwvtS/blilTZpYvlX1s+rOkZhf+C/RJ/IIx2JKohCuO
         rxsY+HJ1w2NO1VV3bkjazXWpTATSPpEhqDNOMRaCgP9lSJXDdXiB9SIV7F0RDQCiYC61
         NSLg==
X-Gm-Message-State: AOJu0YynlOVmUELAPf0XSNsIscxCf+2Q4Y44rslMOq+UNwAPZHQoztQp
	xsmTRl7ToVKjF7IC8RfxAkBAXvM1RspEqezbEairLkvN/HGurKUj7Yfeog==
X-Google-Smtp-Source: AGHT+IHMHMcYPYJEIHVAEic1PgqT5IKoS7UnELlwPN8I0iVdtmL68Gt5D+mP/xNOZdR+tp4wkE0Og5lhbpj2EQiyud0=
X-Received: by 2002:a05:6870:724f:b0:1fa:2fbe:21f6 with SMTP id
 y15-20020a056870724f00b001fa2fbe21f6mr11207646oaf.12.1701456354652; Fri, 01
 Dec 2023 10:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20231201181542.421077-1-dregan@broadcom.com> <20231201193834.5da80273@collabora.com>
In-Reply-To: <20231201193834.5da80273@collabora.com>
From: David Regan <dregan@broadcom.com>
Date: Fri, 1 Dec 2023 10:45:43 -0800
Message-ID: <CAA_RMS7DJEdC_uUcT2MF4crVvPFiDGCpx+wKGYtPP=u3xRuOAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: rawnand: Add deassert_wp comment
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dregan <dregan@broadcom.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Boris Brezillon <bbrezillon@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_104559_090193_CF835AA7 
X-CRM114-Status: GOOD (  21.33  )
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

SSdtIHNvcnJ5IG15IG1pc3Rha2UsIEkgaGFkIG9yaWdpbmFsbHkgbWlzc2VkIHRoaXMgY29tbWVu
dCB3aGljaCBjYW1lIGZyb20gaGVyZToKaHR0cHM6Ly9naXRodWIuY29tL2JicmV6aWxsb24vbGlu
dXgvY29tbWl0L2U2MTJlMWYyYzY5YTMzYWM1ZjJjOTFkMTM2NjlmMGYxNzJkNTg3MTcKCk9uIEZy
aSwgRGVjIDEsIDIwMjMgYXQgMTA6MzjigK9BTSBCb3JpcyBCcmV6aWxsb24KPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgIDEgRGVjIDIwMjMgMTA6MTU6
NDIgLTA4MDAKPiBkcmVnYW4gPGRyZWdhbkBicm9hZGNvbS5jb20+IHdyb3RlOgo+Cj4gPiBGcm9t
OiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4KPgo+IEknbSBwcmV0dHkg
c3VyZSBJIHNob3VsZG4ndCBiZSB0aGUgYXV0aG9yLiBUaGUgb3JpZ2luYWwgcGF0Y2ggbWlnaHQK
PiBoYXZlIGJlZW4gcGFydGx5IHdyaXR0ZW4gYnkgbWUsIGJ1dCB0aGlzIGlzIGEgZml4dXAgb24g
dG9wIG9mIGl0Lgo+Cj4gPgo+ID4gQWRkIGRlYXNzZXJ0X3dwIGRlc2NyaXB0aW9uIGNvbW1lbnQK
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVs
Lm9yZz4KPgo+IGFuZCB5b3Ugc2hvdWxkIGRyb3AgbXkgU29CIHRvby4KPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBicm9hZGNvbS5jb20+Cj4gPiAtLS0KPiA+ICBpbmNs
dWRlL2xpbnV4L210ZC9yYXduYW5kLmggfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5k
LmggYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiA+IGluZGV4IGZjYWQ5NGFhMDUxNS4u
MzA0OWIwNWQ4YTIwIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5o
Cj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiA+IEBAIC0xMDAxLDYgKzEw
MDEsOCBAQCBzdHJ1Y3QgbmFuZF9vcF9wYXJzZXIgewo+ID4gIC8qKgo+ID4gICAqIHN0cnVjdCBu
YW5kX29wZXJhdGlvbiAtIE5BTkQgb3BlcmF0aW9uIGRlc2NyaXB0b3IKPiA+ICAgKiBAY3M6IHRo
ZSBDUyBsaW5lIHRvIHNlbGVjdCBmb3IgdGhpcyBOQU5EIG9wZXJhdGlvbgo+ID4gKyAqIEBkZWFz
c2VydF93cDogc2V0IHRvIHRydWUgd2hlbiB0aGUgb3BlcmF0aW9uIHJlcXVpcmVzIHRoZSBXUCBw
aW4gdG8gYmUKPiA+ICsgKiAgICAgICAgICAgIGRlLWFzc2VydGVkIChFUkFTRSwgUFJPRywgLi4u
KQo+ID4gICAqIEBpbnN0cnM6IGFycmF5IG9mIGluc3RydWN0aW9ucyB0byBleGVjdXRlCj4gPiAg
ICogQG5pbnN0cnM6IGxlbmd0aCBvZiB0aGUgQGluc3RycyBhcnJheQo+ID4gICAqCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
