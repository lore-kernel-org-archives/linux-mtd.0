Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A83C2BD05
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2024 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EN5CMPQXptLpsC844DduN2N+46mTIPFX0o13Va17CG0=; b=n8fCd8a3eK/OpK
	yimPyg+OMGp2/Y8LsEdcOC9wUtHC8p3lvDeB3BNa5nBmidVAllpw/b8WxPGwh0VXF4Y5PUQ+x4owx
	/xbUI02ZtG1ojKMt4Tz02mU/ZIyRxfkY7D4CBKIW78mmzLydRwkp2LpO2BhpHCxgzciMs4QwDtOs7
	mwpZN+80+pt1kVlYU5FZ+YpxwAnhRY/g4e53Iy5xxwDDIcDE73/ym2EGx+PifJPm6Mn76O/aNj/VF
	9rXxrwtQfxE0IXZAwkXK2GYueti5CGmdK9iBFRKjUVxVlyDVhG9dK4SqFWiRbJfLMx1cxm+ZVs0tF
	GRccUlEHDEKTEpn1ds7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLfXt-0000000G9s1-21HK;
	Mon, 24 Jun 2024 08:59:29 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLfXp-0000000G9r7-0eRo
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jun 2024 08:59:27 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-795569eedcaso223155885a.3
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2024 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719219563; x=1719824363; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=z53/IqVzfQn19xGBDQZAWHCCB+OQnfGr1RpZSk712hMZrcoKgIUWIJHyrZnOsBy28w
         s75/99W8E4Y1SJmJQD7MO/F+3TOFnSS8uOnVuT/9iln1CoLxUHIa/mDMkkxswpID1bpe
         AEeki1ddME0QY5gVsw/WRo8IpSRp6vcCLxDbYFZogDBHkWGCbPU2EXZ5c0cwQ0xrYYD7
         setCLocxX2XbeR5aL6EBwr8qxFMk+dWIfdGrCga1lc4jhD2iI0aJR2uApPY4ujsB4b8h
         Ce7KxpQgKjRvT8AIZOFWn4DEK5ewDsRuYAqiyx0N17INnOl8JdDEfkt4F/EEw/QWaK8k
         DqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219563; x=1719824363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=iH04H2XJrSQdhFjUE1ozatas3hH94+h1YW8Pizhx0jkKREqLRQNHL17z8l4GZDuoR8
         mZbKTSFraa0ZLDjh/K2/uUMv+0jNQTCea8H0alZU4iBjlxsM9xQrbgrlB4TWKsRrv0/I
         hPhRo0VDFxfo9DxTaaNrWetpYTbQxoJZfxVHMjM2MW2Fu6wzOqZmOzfkQ9bYnrFpu394
         AN3Zhko3G6IMwZg7mBayUPifqvosrP7ovy9b4ZhKfiJ4iyH4C5XNMp5Tu2qydHQq8Vdf
         DOdQ6VubJUB9Y+u+1/PK2wiVjLCXh8REoLma1tmSM0GkLtsnlDKrnnDv1U9H/1nJSAWr
         nEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtiy9oGb1RybF9VDhJuNsQtu5Laqmw0bIiA9Veg1hVURRJ5pSIBvk/LVIjhc1CLYYAI+jVBPKPIreiKdjLykT51oZWmBqAR3PX1FMctQ==
X-Gm-Message-State: AOJu0YxFaNaom9+MDEWfS9inR8Zf8WajuieQAKFGQFtkWnVErFFPM1H0
	8o+4oZOy6Tb9G9KcFDLra1ALUtnbYTynTuK/U0jjmarklvzxT1Eo6659DDPtPqv6GPbAYF9utNX
	Ve4U0ULdDVBCvrQj9Rw3gwcagOjYZ4zYMMn3ZBA==
X-Google-Smtp-Source: AGHT+IHJdukmHTX31XZGqN8Ya5O7xqbZeOSn9ad1olNhKCpFsHEHdPHP6m4H5tAF93YKuWVFl5Mnqdf3Ba8kIeeVBLc=
X-Received: by 2002:a05:6214:4a45:b0:6b4:ff32:8287 with SMTP id
 6a1803df08f44-6b5409be0b9mr37950676d6.22.1719219562855; Mon, 24 Jun 2024
 01:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com> <ZnkGcwd8M1QFfmxl@matsya>
In-Reply-To: <ZnkGcwd8M1QFfmxl@matsya>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 24 Jun 2024 10:59:11 +0200
Message-ID: <CAG+cZ06R5P1g+1Pk3gbQ6Yod0mBM41dFTgvnBWg61HZFUtmx-w@mail.gmail.com>
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX SoC
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>, Li Zetao <lizetao1@huawei.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_015925_419191_48779AD7 
X-CRM114-Status: GOOD (  13.91  )
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

T24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgNzozOeKAr0FNIFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IEFueSByZWFzb24gd2h5IGRtYWVuZ2luZSBwYXJ0cyBjYW50IGJlIHNl
bnQgc2VwYXJhdGVseSwgd2h5IGFyZSB0aGV5Cj4gY2x1YmJlZCB0b2dldGhlciwgSSBkb250IHNl
ZSBhbnkgb2J2aW91cyBkZXBlbmRlbmNpZXMuLi4KClRoZSBJMlMgZHJpdmVyIGRlcGVuZHMgb24g
dGhlIGRtYWVuZ2luZSBwYXJ0cwoKPiBPbiAyMC0wNi0yNCwgMTk6NTYsIFBpb3RyIFdvanRhc3pj
enlrIHdyb3RlOgo+ID4gTFBDMzJYWCBjb25uZWN0cyBmZXcgb2YgaXRzIHBlcmlwaGVyYWxzIHRv
IHBsMDh4IERNQSB0aHJ1IGEgbXVsdGlwbGV4ZXIsCj4gPiB0aGlzIGRyaXZlciBhbGxvd3MgdG8g
cm91dGUgYSBzaWduYWwgcmVxdWVzdCBsaW5lIHRocnUgdGhlIG11bHRpcGxleGVyIGZvcgo+ID4g
Z2l2ZW4gcGVyaXBoZXJhbC4KPgo+IFdoYXQgaXMgdGhlIGRpZmZlcmVuY2UgYi93IHRoaXMgYW5k
IGxwYzE4eHggZHJpdmVyLCB3aHkgbm90IHJldXNlIHRoYXQKPiBvbmU/CgpUaGUgbHBjMTh4eCB1
c2VkIHRoZSBzYW1lIGRtYSBwZXJpcGhlcmFsIChwbDA4eCkgYnV0IHRoZSByZXF1ZXN0IHNpZ25h
bAptdWx0aXBsZXhlciBhcm91bmQgcGwwOHggaXMgY29tcGxldGVseSBkaWZmZXJlbnQgLSB0aGVy
ZSBhcmUgbm8gY29tbW9uIHBhcnRzLgoKLS0gClBpb3RyIFdvanRhc3pjenlrClRpbWVzeXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
