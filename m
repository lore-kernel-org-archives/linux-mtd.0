Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A8DC282DD
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 20:17:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8796920644
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 20:17:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kf4HMTbS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aLLq1LPw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8796920644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yc8pBrL3CaK/XVu2tYAkWLEbQGT0cQVnA6mcYFAkBv8=; b=Kf4HMTbSMg7CIQ
	vyes7EPNbUGSbApb9yihOHvgOuxowkuDG2bcqDLnTvTK2nEhO8d9dcS4v1Wd+S1kxmPIDXqkHzBL9
	7PBD9qwHkXBuYilCKOEYk+2gZcUMIt9nEks1e8U8wOb4YYcce3SuJE1l6EX1FE8tt81BZ/jpBdU5D
	jvO6c31DjRkswMZhP3ajA63xi19rWwrKT6kyiZsHK7UZh4B3lb8d/yWEpEbAbxmb14kGNNoHMyaLO
	90eEmSPSyHf5Bb+BvemKUwzRGqRW53Cj1qWpnLPbl3c6rpkNIwajiwez67tbAtNMTBuLuQGiVuvFe
	b9eGbhQi2ILQVGszM6qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTu9b-0007cf-Ro; Thu, 23 May 2019 20:17:31 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTu9Y-0007bt-NX
 for linux-mtd@lists.infradead.org; Thu, 23 May 2019 20:17:30 +0000
Received: by mail-pf1-x444.google.com with SMTP id q17so3849812pfq.8
 for <linux-mtd@lists.infradead.org>; Thu, 23 May 2019 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SKLfhxDoCRYR8fbnF7GjoyQ7RxwPbketJUbGs3MbAvM=;
 b=aLLq1LPweL6v0NH0VzQsv/BdtOsCHUN+j8yEfKUuVosEi0AqLpqAgpOLM8CllMCFKs
 vZRd37/nw+m9uPkEqnyYU1+ft7yxHDmrKbt1VA66p+R+VPQpHLWUjoCMp475R4NileNN
 82hluF0iQardeJLlE3QARGTtij8YOXiEWItfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SKLfhxDoCRYR8fbnF7GjoyQ7RxwPbketJUbGs3MbAvM=;
 b=fBs/pSx8E1HZ+jJSJAiIZLGmNavYnIWXUXB6NBO5ImY0aJi6RSqlNVYIF4us+9f8J6
 L4xt1YWz/ZDA+iCeW4cPyhSDsQaIX3Bx+f9MCtWEmmFW/ZFbUDuXNITRrOvkyKIBiezK
 o7FXhBxHu7QTxIl8XndGS8RD6K5N4iyuAzeGwnLinTuCCO+PfCFjQs2KrH09gUJZ8FdZ
 dsN5HgObXsxIOK7PfKfP8GCAOLHGBEBUjkJSU+CKw5auJqVH1CD58g6dKP6grh4MEbCM
 o88PRlAUdb/pRfs4HY+eu3W9aHXj2m6OqPM2YfoUDW2Ejpp4M0dsqowOYTk/xlEjWnWG
 7QGQ==
X-Gm-Message-State: APjAAAXz8jHm1z9hfSTarFH2GCFVyohlz2mZwuZyCU8/2EI+DRJB8qLK
 5xZtInTZ92X7AWpcRIIJMd9LUg==
X-Google-Smtp-Source: APXvYqwK/wF9Kj//m0nPMhMHL9Re2ZbD4eTXDat4hg+nF2y3ZlFqGfW81QDITVyEItJ1+/dZvmov0A==
X-Received: by 2002:a62:62c1:: with SMTP id
 w184mr105268547pfb.95.1558642647484; 
 Thu, 23 May 2019 13:17:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h62sm186703pgc.77.2019.05.23.13.17.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 13:17:26 -0700 (PDT)
Date: Thu, 23 May 2019 13:17:25 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v2] mtd: onenand_base: Avoid fall-through warnings
Message-ID: <201905231316.97C0BBF15@keescook>
References: <20190523191606.GA9838@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523191606.GA9838@embeddedor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_131728_797803_18000AAE 
X-CRM114-Status: GOOD (  21.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDI6MTY6MDZQTSAtMDUwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBOT1RJQ0UgVEhBVDoKPiAKPiAiLi4ud2UgZG9uJ3Qga25vdyB3aGV0aGVy
IHdlIG5lZWQgZmFsbHRocm91Z2hzIG9yIGJyZWFrcyBoZXJlIGFuZCB0aGlzCj4gaXMganVzdCBh
IGNoYW5nZSB0byBhdm9pZCBoYXZpbmcgbmV3IHdhcm5pbmdzIHdoZW4gc3dpdGNoaW5nIHRvCj4g
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaCBidXQgdGhpcyBjaGFuZ2UgbWlnaHQgYmUgZW50aXJlbHkg
d3JvbmcuIlsxXQo+IAo+IFNlZSB0aGUgb3JpZ2luYWwgdGhyZWFkIG9mIGRpc2N1c3Npb24gaGVy
ZToKPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTAzNjI1MS8K
PiAKPiBTbywgaW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aCwgdGhpcyBwYXRjaCBzaWxlbmNlcwo+IHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4gCj4gZHJp
dmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jOiBJbiBmdW5jdGlvbiDigJhvbmVu
YW5kX2NoZWNrX2ZlYXR1cmVz4oCZOgo+IGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5k
X2Jhc2UuYzozMjY0OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2gg
Wy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIGlmIChPTkVOQU5EX0lTX0REUCh0aGlzKSkK
PiAgICAgICBeCj4gZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jOjMyODQ6
Mjogbm90ZTogaGVyZQo+ICAgY2FzZSBPTkVOQU5EX0RFVklDRV9ERU5TSVRZXzJHYjoKPiAgIF5+
fn4KPiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI4ODoxNzogd2Fy
bmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhy
b3VnaD1dCj4gICAgdGhpcy0+b3B0aW9ucyB8PSBPTkVOQU5EX0hBU19VTkxPQ0tfQUxMOwo+IGRy
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYzozMjkwOjI6IG5vdGU6IGhlcmUK
PiAgIGNhc2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8xR2I6Cj4gICBefn5+Cj4gCj4gV2Fybmlu
ZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPiAKPiBBbHNvLCBu
b3RpY2UgdGhhdCB0aGlzIHBhdGNoIGRvZXNuJ3QgY2hhbmdlIGFueSBmdW5jdGlvbmFsaXR5LiBT
ZWUgdGhlCj4gbW9zdCByZWNlbnQgdGhyZWFkIG9mIGRpc2N1c3Npb24gaGVyZToKPiAKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA3NzM5NS8KPiAKPiBUaGlzIHBh
dGNoIGlzIHBhcnQgb2YgdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUKPiAtV2ltcGxpY2l0
LWZhbGx0aHJvdWdoLgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkw
NTA5MDg1MzE4LjM0YTlkNGJlQHhwczEzLwo+IAo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgo+IFN1Z2dlc3RlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jp
cy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEg
PGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29v
a0BjaHJvbWl1bS5vcmc+CgpUaGFua3MgZm9yIHVwZGF0aW5nIHRoaXMhCgo+IC0tLQo+IENoYW5n
ZXMgaW4gdjI6Cj4gIC0gQWRkIGJyZWFrcyBpbnN0ZWFkIG9mIGZhbGwtdGhyb3VnaCBtYXJraW5n
cyB3aXRob3V0IGFsdGVyaW5nIGFueQo+ICAgIGZ1bmN0aW9uYWxpdHkuCj4gIC0gVXBkYXRlIGNo
YW5nZWxvZyB0ZXh0Lgo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNl
LmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2RyaXZlcnMv
bXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+IGluZGV4IGY0MWQ3NjI0ODU1MC4uZmQw
ZGE1YzM0N2RiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5k
X2Jhc2UuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+
IEBAIC0zMjgwLDEyICszMjgwLDE1IEBAIHN0YXRpYyB2b2lkIG9uZW5hbmRfY2hlY2tfZmVhdHVy
ZXMoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAkJCWlmICgodGhpcy0+dmVyc2lvbl9pZCAmIDB4
ZikgPT0gMHhlKQo+ICAJCQkJdGhpcy0+b3B0aW9ucyB8PSBPTkVOQU5EX0hBU19OT1BfMTsKPiAg
CQl9Cj4gKwkJdGhpcy0+b3B0aW9ucyB8PSBPTkVOQU5EX0hBU19VTkxPQ0tfQUxMOwo+ICsJCWJy
ZWFrOwo+ICAKPiAgCWNhc2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8yR2I6Cj4gIAkJLyogMkdi
IEREUCBkb2VzIG5vdCBoYXZlIDIgcGxhbmUgKi8KPiAgCQlpZiAoIU9ORU5BTkRfSVNfRERQKHRo
aXMpKQo+ICAJCQl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTXzJQTEFORTsKPiAgCQl0aGlz
LT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTX1VOTE9DS19BTEw7Cj4gKwkJYnJlYWs7Cj4gIAo+ICAJ
Y2FzZSBPTkVOQU5EX0RFVklDRV9ERU5TSVRZXzFHYjoKPiAgCQkvKiBBLURpZSBoYXMgYWxsIGJs
b2NrIHVubG9jayAqLwo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gCktlZXMgQ29vawoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
