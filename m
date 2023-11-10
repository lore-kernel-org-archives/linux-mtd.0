Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26549C4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gCzgkWpZsB6XoQoJ/UJfHHjMVN9dHqrek3oaCYYucw=; b=C9ktI5anDsjFFV
	4ln+3CySLPI4UZJojSQxwm6cFXzxrD1CtycnV0+4k4vBo96atZIhOUnn+s99gyyeOkl+MtUqisDKy
	ymUHglhRUl4iDfaMZRytj02kJA9QP501fSjDnY2LYKxsioNw6FZBJqEfr3aQuMopfpS/MGJdz2tV5
	K8sn5Y4YAAwa9xW4wYRUVu47xNhVFgTIednVf4Tnmo2YuOtHcJg7T+2G+KwAv5gZS+I9Q/15i+4rI
	hVKGyF1nIgSIM3nLUl38dL06DEg5ZPKSw2aYS19FrkevnX22QDbBR/S0ykwWa5GuEG12lbxQhOg+J
	L6Qn3a81MSwIeejNy4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Oi4-008J1z-2q;
	Fri, 10 Nov 2023 10:25:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Oi2-008J1O-2E
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 10:25:56 +0000
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 585E440C54
	for <linux-mtd@lists.infradead.org>; Fri, 10 Nov 2023 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1699611953;
	bh=gPKnvjH5Hg4muGnCgN2WsdJlG6e8rKiWPTWzq5wjF2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=f32z/KqIUg9uOpPeLiqk6mnrQsxh2MQ+UicMT0GTG6PxSdG/mj9KVK2tUfyVF1Qbr
	 3XFm70xZ0HV9Kiic/2gbQg2cdOPwX8Jz9n4HYXzD3nAITmnafQjHUY2hJQYSSbLjni
	 Ya5/pZzIdZQoqAnYNNECRK6tOWBVYg1Zwm/EV58NEWGP71q9PhV0OiMS5tdDdSRiAw
	 LMduy2JjlT2m2gL/CJ0nWc4zehZLPR8GZ6NPJ1B0xOh2mqeQGjr7EFp8lqTsuEV5hQ
	 6lCrNlAXn6ajGkV5sRkgj8pfIcSHz4FxKzcgoxmkJwkwq0ntYhV0fG6v9eZkybIEUU
	 2nngAJlE0WFew==
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5a7d261a84bso27001317b3.3
        for <linux-mtd@lists.infradead.org>; Fri, 10 Nov 2023 02:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699611952; x=1700216752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPKnvjH5Hg4muGnCgN2WsdJlG6e8rKiWPTWzq5wjF2k=;
        b=BUdl2zFZLoyXjhdDrzE7X7CeXbaApE1rPkK9B0scZgz4Q6j1eMgB45FQ02wxx/ngqt
         xZEFkK+QI8LktGWplkEBCwsrT87dTZtoxLWNQNCyD5SNGZKavv6J5kTAh38+rP6oyIXs
         PYIOWvOgV5fX2QUFQ3krJBiZ0RU0zj39Jlxh1VPHdS3ega+U0C2uwEHXH7T3Pp9v2XcI
         R3g8pjAMta4EiJTKse2s5prcK7tKJf05+gZEY8diemmPQ6WMcxR1iCAyrUri5s1mj+UH
         2SChRWv/x0deM+Z7SWLG4B1qXGiKbU3eAlQOOs1Ob+yHXKYW4lkUpCkAGxEL1OmXj50F
         bvBA==
X-Gm-Message-State: AOJu0YwjOy/tWaxxAhev2FVY2ferE4Lnfa3f/1I3mO69bW8D2y2w9gQv
	x2aEUrvecatRd3v4PLjmroXU94+tKTWNT7Tri8qMqGRHDafbWXxOCK/KraO5Gk3OBxhcnQMMcX+
	FyanfRdlBNI5C4HkCbMCugrtRtIs1FKl49w2Va0bntRvLlGbyI/P3U/C+OWY=
X-Received: by 2002:a25:492:0:b0:da0:4c40:67b7 with SMTP id 140-20020a250492000000b00da04c4067b7mr7527222ybe.31.1699611952378;
        Fri, 10 Nov 2023 02:25:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7Uzw6FsbRf6Dv35NVE2MMC+7rPWfQQ1o1KBRo2GlsBu+Q0CQ62RXpHoloA8Nr+Pl4ZHvt9PLk4RcUggImr4U=
X-Received: by 2002:a25:492:0:b0:da0:4c40:67b7 with SMTP id
 140-20020a250492000000b00da04c4067b7mr7527211ybe.31.1699611952078; Fri, 10
 Nov 2023 02:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20231108094303.46303-1-acelan.kao@canonical.com> <20231110053721.GG17433@black.fi.intel.com>
In-Reply-To: <20231110053721.GG17433@black.fi.intel.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Fri, 10 Nov 2023 18:25:41 +0800
Message-ID: <CAFv23QnbG0QX=cGjVYA1GnQFf9HFd7M7gXuAxBDO4o-POvO9yg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] spi: Replace -ENOTSUPP with -EOPNOTSUPP in op checking
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_022554_852716_36C43393 
X-CRM114-Status: GOOD (  20.09  )
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

SGkgTWlrYSwKCk1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNv
bT4g5pa8IDIwMjPlubQxMeaciDEw5pelIOmAseS6lCDkuIvljYgxOjM35a+r6YGT77yaCj4KPiBI
aSwKPgo+IE9uIFdlZCwgTm92IDA4LCAyMDIzIGF0IDA1OjQzOjAyUE0gKzA4MDAsIEFjZUxhbiBL
YW8gd3JvdGU6Cj4gPiBGcm9tOiAiQ2hpYS1MaW4gS2FvIChBY2VMYW4pIiA8YWNlbGFuLmthb0Bj
YW5vbmljYWwuY29tPgo+ID4KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBhcmUgaW50cm9kdWNl
ZCBieSB0aGlzIHBhdGNoOyBpdCdzIGEgY29kZSBjbGVhbnVwCj4gPiB0byB1c2UgdGhlIGNvcnJl
Y3QgZXJyb3IgY29kZS4KPgo+IFByb2JhYmx5IGdvb2QgdG8gbWVudGlvbiBoZXJlIHRoYXQgdGhp
cyBhZmZlY3Qgb25seSB0aGUgIlNQSSBNRU0iCj4gZHJpdmVycyBhbmQgdGhlIGNvcmUgcGFydHMu
IEFsc28geW91IGNvdWxkIGV4cGxhaW4gaGVyZSB0aGF0IHRoZSByZWFvc24KPiBmb3IgdGhpcyBp
cyB0byBtYWtlIHN1cmUgd2UgdXNlIHVuaWZpZWQgIm9wZXJhdGlvbiBub3Qgc3VwcG9ydGVkIiBy
ZXR1cm4KPiBjb2RlIGFjY3Jvc3MgdGhlc2UuCkdvdCBpdC4KPgo+IERvZXMgc29tZSBrZXJuZWwt
ZG9jIG5lZWQgdXBkYXRpbmcgYXMgd2VsbCB0byBtYWtlIHN1cmUgdGhlIGZ1dHVyZQo+IGRyaXZl
cnMgd2lsbCByZXR1cm4gdGhlIGNvcnJlY3Qgb25lIGlmIHRoZXkgZG8gbm90IHN1cHBvcnQgZ2l2
ZW4KPiBvcHRpb25hbCBvcGVyYXRpb25zPwpJIGhhdmUgbm8gaWRlYSB3aGVyZSB0byBhZGQgdGhp
cywgZG8geW91IG1lYW4gYWRkIGEgc2VjdGlvbiBpbgpEb2N1bWVudGF0aW9uL3NwaS9zcGktc3Vt
bWFyeS5yc3Q/Cj4KPiA+IFNpZ25lZC1vZmYtYnk6IENoaWEtTGluIEthbyAoQWNlTGFuKSA8YWNl
bGFuLmthb0BjYW5vbmljYWwuY29tPgo+ID4KPiA+IC0tLQo+ID4gdjUuIGRpc3Rpbmd1aXNoIC1F
T1BOT1RTVVBQIGZyb20gLUVOT1RTVVBQCj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMgfCAyICstCj4gPiAgZHJpdmVycy9zcGkvYXRtZWwtcXVhZHNwaS5jIHwgMiArLQo+
ID4gIGRyaXZlcnMvc3BpL3NwaS1hdGg3OS5jICAgICB8IDIgKy0KPiA+ICBkcml2ZXJzL3NwaS9z
cGktYmNtLXFzcGkuYyAgfCAyICstCj4gPiAgZHJpdmVycy9zcGkvc3BpLW1lbS5jICAgICAgIHwg
NiArKystLS0KPiA+ICBkcml2ZXJzL3NwaS9zcGktbnBjbS1maXUuYyAgfCAyICstCj4gPiAgZHJp
dmVycy9zcGkvc3BpLXRpLXFzcGkuYyAgIHwgNCArKy0tCj4gPiAgZHJpdmVycy9zcGkvc3BpLXdw
Y20tZml1LmMgIHwgMiArLQo+Cj4gSSB0aGluayB5b3Ugc2hvdWxkIGluY2x1ZGUgdGhlIFNQSSBz
dWJzeXN0ZW0gbWFpbnRhaW5lciBhcyB3ZWxsLCBhdAo+IGxlYXN0IGZvciB2aXNpYmlsaXR5LgpS
aWdodCwgSSBzaG91bGQgQ0MgdGhlbS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
