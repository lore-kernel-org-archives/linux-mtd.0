Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F18C761A6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWqqLQktJxIymq5uf6yEFpqaxRmNJOyN/KEaxF6dQgE=; b=wcyQy/hh/7Cr0K
	Hf7tcgpynLuV+5m+IF368wqzu+e2LZoNZi7M/AVSCehv5KJ71Ishgv7sd3SecRcn3zRLLf1BG3BRd
	xMd1/ILLaPw+stWbcB4gwJtD0NuJTroxZnjxAbgY75webjYjrhVqr+TZPHl6D8ByORVXEKtK8MK9L
	TkEzdE9elWxs/je1MITlRVk90A2MpcYRk1/Zyf8OubmQFW+BNfGrFUKifzk58vXkus6sz4EHAebTg
	KBbC9j2h/d7ScwaLLPbV0yTT9XHSFhkouW9OEZifhNb4QAso1BvfeViHjMLARZ0CowhyiB55sD8bY
	iM21IP5W4YwkyxPQqqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjESv-00EMBs-34;
	Mon, 03 Apr 2023 07:18:57 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjESs-00EMB0-1Z
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 07:18:56 +0000
Received: by mail-lj1-f177.google.com with SMTP id q14so29256673ljm.11
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 00:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680506328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehLyQWH/3+JQgCAyTWgVTaiW/YYZ6U90qQfq4tvZyhI=;
        b=xB342lKJVBLqUgQoEfJV+sBVJQkjbxzBd69x4iZbCMo4AiWsijruNdTOjmJbjbNlBt
         UIJFn5XqTymnfDo2kOZ6ILEhVO4u1VcNGEa+BiBF1tsVdBLNQcj4G6mZlXTLYYo8Rtqp
         JjeMkrv4Gu9zw35htoylat9PCIizTe55yu1CEp6POHuarF29h2JGzepo+x+p+Ru42/ef
         LcgwCiwkXN6LKy6SndWuGEMU4rpaQeO6acMYxaRyf8PTgzk+SzPg2nF8ycGdpSYP21Xj
         cCrm/RlMGU5Ekd7112cFQvGNhY6QdX+YpfBnQ67hAXRP5vj9ExTf+VuJAmUkAC3MKY32
         KWOQ==
X-Gm-Message-State: AAQBX9fgpYJsgX9JzejLg/lLHJxDVG/nYCkYZqTkcM8Wb4397WilbLve
	mykq7IhPZT9gbE8Lxs5eVFzxR3sbqwunnw==
X-Google-Smtp-Source: AKy350YZupp3jfIgfbr9YwYpP7BAArFBM9+WIRLg8abCEF9jTwfEw1JaCKH64cDQpK8ROkeTYtZGDg==
X-Received: by 2002:a2e:7e10:0:b0:2a6:24e6:8cee with SMTP id z16-20020a2e7e10000000b002a624e68ceemr2527055ljc.50.1680506328351;
        Mon, 03 Apr 2023 00:18:48 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id f16-20020a2e9510000000b00295663a8441sm1611281ljh.88.2023.04.03.00.18.46
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 00:18:48 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id q16so36715393lfe.10
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 00:18:46 -0700 (PDT)
X-Received: by 2002:ac2:5e85:0:b0:4e8:5112:1fd5 with SMTP id
 b5-20020ac25e85000000b004e851121fd5mr10079154lfq.1.1680506326048; Mon, 03 Apr
 2023 00:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de> <20230401161938.2503204-40-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230401161938.2503204-40-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Apr 2023 09:18:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr6kXjAMuzPRUnnYi3-z-8TnsOYdCp6jrdMUDa8oS+jA@mail.gmail.com>
Message-ID: <CAMuHMdXr6kXjAMuzPRUnnYi3-z-8TnsOYdCp6jrdMUDa8oS+jA@mail.gmail.com>
Subject: Re: [PATCH 39/49] mtd: rawnand: renesas: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_001854_525890_C95A42BD 
X-CRM114-Status: GOOD (  19.12  )
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

T24gU2F0LCBBcHIgMSwgMjAyMyBhdCA2OjIw4oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFj
ayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBtYW55
IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJyb3Ig
aGFuZGxpbmcgYnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUg
cmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRz
IGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0IHRv
IG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAg
b2YgdGhpcwo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXco
KSB3aGljaCBhbHJlYWR5IHJldHVybnMKPiB2b2lkLgo+Cj4gVHJpdmlhbGx5IGNvbnZlcnQgdGhp
cyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQo+IGNhbGxi
YWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KClJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0
amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
