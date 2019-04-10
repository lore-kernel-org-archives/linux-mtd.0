Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DABC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:47:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F1E520830
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sAyVA4s2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M3PkFBip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F1E520830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvYIaw5iQ+s4HjxSuRbXD+0Mv0ncvT0rcndSFccq9C4=; b=sAyVA4s2wYt817
	LXbDiKhZWaxWCiFAaSNJNjBaIGiQxdTsXoetoK00YoVlwbKNlGARvMq7Gjq/a3QWmZlnRn73MSHXD
	Pge07oIqkBQ5owKuk0mosO3pFM/WOOxJGhdseake/heFd55Gfdf0xNBYg/gIHfuG6GKhuL77ALygX
	ULlUYtVZqjJ/9xWK+Ei3tP0ug3wkdO6H8OBaQyGBvEkY6BbByiG12LrtslgmlhL0EkRog5BRlA0tW
	txpZ8Ddk/PaAzuloYgjiRfaOoNcv9JLPU3iYyQSMkDVw1OCGIBSOk/WEIlhuho+tuVmkU5vwS9mTl
	OuBz26eJKc/XUGDoxt1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEL3y-0001sP-Sn; Wed, 10 Apr 2019 21:47:22 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEL3w-0001ro-BI
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 21:47:21 +0000
Received: by mail-vs1-xe43.google.com with SMTP id w13so2290679vsc.4
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 14:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QXiJ2lj9JMynWfUKN3oco9k+HtXMmTEkaf5hOpFuSF0=;
 b=M3PkFBipDHKGS5UOcLR0+UhlihZ24+1iPN5mHuqvm0Od6lBF8iUekWEXKlR03/hZ9M
 nGSioiCcJNj1f6zI3xHdrsc5tCVC+K0LM8KWyvM7Vwc1P+mb5hYsptfrS095OGOBJVLO
 YShxXzd9fG9ZqI8fPEfeuhZxAaliAEIpo9IAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QXiJ2lj9JMynWfUKN3oco9k+HtXMmTEkaf5hOpFuSF0=;
 b=CCsHbxmzLJYeYewhwRyyb8vO1Ja2RuAOnXpZj2ZybuZscGnguSiuSzrnmLHLeVIA6k
 +7khFQBsheq+iBFKHfmVKcyz/tKwv+XVykc/kFk/7YAodorWqKX2SLXVJ93mvFh6Iq2i
 CIgOgf74fKm0gucMXIIhOfPj46sH4dmG+m6qdFbVXPkF9w9DWK1NXiL0+qQWGnY5MrPm
 zeZVKHV4UEsOPJ5jjXyNVEsd1QcA2shAj0sk4L0RoV5hn/km6hJH3Fl290ce/5lNaLD9
 X2abdKTBzOFtZyX9YEHY4HOmApSsDGOeZ3Y6J0oE9+tatUQ/foXb+TwEcgDleQVe+GSN
 kjDw==
X-Gm-Message-State: APjAAAXfiY7Te2TbTun3ekCxWCIyfVhQP4tuGuPZXbet0HHUJINnmcKj
 S/6lOaSQidk7LrhliJdAzl+W+Wi/d3I=
X-Google-Smtp-Source: APXvYqzarBz3/t/ZzUcONWKu0fsmscM+Qa+G9Ct3wIRBtjXy3MgUdQGlkzk+fTIW2jhgk86dWA0A5g==
X-Received: by 2002:a67:6991:: with SMTP id e139mr26402861vsc.80.1554932838096; 
 Wed, 10 Apr 2019 14:47:18 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id l15sm4888729vsq.22.2019.04.10.14.47.16
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Apr 2019 14:47:17 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id d8so2293518vsp.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 14:47:16 -0700 (PDT)
X-Received: by 2002:a67:7e12:: with SMTP id z18mr1959700vsc.82.1554932836399; 
 Wed, 10 Apr 2019 14:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190208181210.GA8388@embeddedor>
In-Reply-To: <20190208181210.GA8388@embeddedor>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 10 Apr 2019 14:47:05 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+_CGq=69qAaZz1zYpHx-khRT+VSLtARkU+8txBkdzk2A@mail.gmail.com>
Message-ID: <CAGXu5j+_CGq=69qAaZz1zYpHx-khRT+VSLtARkU+8txBkdzk2A@mail.gmail.com>
Subject: Re: [PATCH] mtd: lpddr_cmds: Mark expected switch fall-through
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_144720_383303_84E2322E 
X-CRM114-Status: GOOD (  19.71  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Linux mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgOCwgMjAxOSBhdCAxMDoxMiBBTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPiB3cm90ZToKPgo+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5n
IC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoCj4gY2FzZXMgd2hlcmUgd2UgYXJl
IGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCj4KPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xs
b3dpbmcgd2FybmluZ3M6Cj4KPiBkcml2ZXJzL210ZC9scGRkci9scGRkcl9jbWRzLmM6IEluIGZ1
bmN0aW9uIOKAmGNoaXBfcmVhZHnigJk6Cj4gZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJfY21kcy5j
OjMxOTo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KPiAgICBpZiAobW9kZSA9PSBGTF9SRUFEWSAmJiBjaGlwLT5vbGRz
dGF0ZSA9PSBGTF9SRUFEWSkKPiAgICAgICBeCj4gZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJfY21k
cy5jOjMyMjoyOiBub3RlOiBoZXJlCj4gICBkZWZhdWx0Ogo+ICAgXn5+fn5+fgo+Cj4gV2Fybmlu
ZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPgo+IFRoaXMgcGF0
Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsaW5nCj4gLVdpbXBsaWNp
dC1mYWxsdGhyb3VnaC4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1
c3Rhdm9AZW1iZWRkZWRvci5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0Bj
aHJvbWl1bS5vcmc+CgotS2VlcwoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJfY21k
cy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMuYyBiL2RyaXZlcnMvbXRkL2xwZGRyL2xw
ZGRyX2NtZHMuYwo+IGluZGV4IGIxMzU1N2ZlNTJiZC4uNzZhNGM3M2UxMDBlIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL2xw
ZGRyL2xwZGRyX2NtZHMuYwo+IEBAIC0zMTgsNiArMzE4LDcgQEAgc3RhdGljIGludCBjaGlwX3Jl
YWR5KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLCBpbnQgbW9kZSkK
PiAgICAgICAgICAgICAgICAgLyogT25seSBpZiB0aGVyZSdzIG5vIG9wZXJhdGlvbiBzdXNwZW5k
ZWQuLi4gKi8KPiAgICAgICAgICAgICAgICAgaWYgKG1vZGUgPT0gRkxfUkVBRFkgJiYgY2hpcC0+
b2xkc3RhdGUgPT0gRkxfUkVBRFkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gKyAgICAgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwo+Cj4gICAgICAgICBkZWZhdWx0
Ogo+ICBzbGVlcDoKPiAtLQo+IDIuMjAuMQo+CgoKLS0gCktlZXMgQ29vawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
