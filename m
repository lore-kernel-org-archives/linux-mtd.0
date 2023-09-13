Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3FAEDEC4A
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8sRp6byV5havdq0ub+PAlnzNJqLV1MycSXNOrHtU6o=; b=nLcLOTb9Plnckk
	Ca2tgksHNubHkVKCgkdJVVvCB/XtCM99yEEhQPDJGxK7PwAyvFMw9ao9P1u7Ef40wic2Dc0zlrsX6
	Yq0gUMGzdNeuOTNDr4vV5ScEEqrQtRx8yitPVyHpm36+W/vHF0ugdxZs42A7tQYoKoNVUQhIjrNs0
	HmEBZmCe7Rf6kzNW/Dq+3FvqooxYaPJHYi5bt45fGnEGL4GakmSeopIWRA6MabS0XMIoq4dV80jpF
	f+DUCsIxY5qge0Iax02hVA5biek1NkGDtHlNigKC+cC2PeE1kdPTFSZjlP921BKsrDeWEMCjXcnwb
	KUPlhV/NJ2i3ySyi+Iuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOvH-005qtt-1Q;
	Wed, 13 Sep 2023 12:24:47 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOvB-005qs8-1E
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 12:24:45 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d8164e661abso412674276.1
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694607879; x=1695212679; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCKxnDesqkrsZ7yc2N/Fu7/OJ4drr6VqYcEJHvcodks=;
        b=E8Mi+aEwyNjtnmGaEwvBmnBDu5JGWGewky1TBv8XSHnBSKxueAWhTrzpZqdBroi5fn
         vuBTnnfpR8NVgRnddK3/UhHcQB7YVZcW6mRK7Fv3NEm68x72fKEpuqEidMd5BgU4nJpx
         8LI/U826zcxxMNogLiCTWHNtRlDg/tOg4Je3SzpVLGayL0JMSNPaE0isvPkgSPL/6P8m
         jFRFx/ADQqF547KxaTr3NuP7z1eCi0ME8ukjA+HEbjL7dV/Gq3LFHtxBdbO7h6kEiS44
         d8/uKbvcKeatf2qULetyxJm7sHHDOddWlS5pCCrwVv3DAmnMKjSp4258FZy+gMm79cET
         zgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694607879; x=1695212679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCKxnDesqkrsZ7yc2N/Fu7/OJ4drr6VqYcEJHvcodks=;
        b=WUkisW+Ai6KCxkywUJcqOpr98lSY4x4YbNnuiBUEUBptbe2W90Iqrm3I7wDqqwtTds
         KJh4aysNnQNKUtG+0Zo/INwpVT/gM2Bm7Al9mR5mHO8YYJ2sw3VcETkEOoc5QMDRdUUt
         GGveFjtgx1bGBg1fbc+lHNntnpSdPNC3dnF8vps2xZfWsAbGcQ29XG6VtyxUgTRZ6i/U
         9tvNP2n0UpIf3TgLkvYZwqWZC+i4y2HgdiUegwdHCe6mMyT/aNTp20b2peJ4a0ksWO7W
         cf7Q9xHGcDZ0CkMwAiUGIX0IcWmFVZ/mQZKFiVd9La952LaEO+L42tpK6kiohF4Be9WE
         jxcw==
X-Gm-Message-State: AOJu0Ywdjr2aoVOX+1Id66RP9qNcHEME5HYciFaOUDzlinYvIPqqVF1E
	c6sWmbJ4riWBaYNULG8VZaxI4cCrDyibTRXj1LoxvQ==
X-Google-Smtp-Source: AGHT+IE8wHWtBHQhWxeImNTh2xHB8xY4DlJAz5zyhEtTpEQcIyhnt6SupOHKd7UVSyFDSlkPFcRI5nGIciiQMYVkWDE=
X-Received: by 2002:a25:da06:0:b0:d81:70b6:c24b with SMTP id
 n6-20020a25da06000000b00d8170b6c24bmr686830ybf.19.1694607878656; Wed, 13 Sep
 2023 05:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-4-brgl@bgdev.pl>
In-Reply-To: <20230913115001.23183-4-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Sep 2023 14:24:27 +0200
Message-ID: <CACRpkdax-CrB42LeQ1bs3E7VqMncsgEwMs7b_v7J6R5AE+BjAg@mail.gmail.com>
Subject: Re: [PATCH 3/5] mmc: slot-gpio: use gpiod_set_active_[low|high]()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_052443_560263_965D6BC6 
X-CRM114-Status: GOOD (  13.93  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTo1MOKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4KPiBXZSBoYXZlIG5ldywgbGVzcyBjdW1iZXJzb21l
IGFuZCBjbGVhcmVyIGludGVyZmFjZXMgZm9yIGNvbnRyb2xsaW5nIEdQSU8KPiBwb2xhcml0eS4g
VXNlIHRoZW0gaW4gdGhlIE1NQyBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgoKSSBsaWtlIHRoZSBsb29r
cyBvZiB0aGUgY29kZSBiZXR0ZXIsIG9idmlvdXNseSBidXQgdGhpcyBsb29rcyBsaWtlIHRoaXMg
Zm9yCmEgcmVhc29uIHVuZm9ydHVuYXRlbHkuCgpTZWUgdGhlIGZvbGxvd2luZyBmcm9tCkRvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jLWNvbnRyb2xsZXIueWFtbDoKCiAg
IyBDRCBhbmQgV1AgbGluZXMgY2FuIGJlIGltcGxlbWVudGVkIG9uIHRoZSBoYXJkd2FyZSBpbiBv
bmUgb2YgdHdvCiAgIyB3YXlzOiBhcyBHUElPcywgc3BlY2lmaWVkIGluIGNkLWdwaW9zIGFuZCB3
cC1ncGlvcyBwcm9wZXJ0aWVzLCBvcgogICMgYXMgZGVkaWNhdGVkIHBpbnMuIFBvbGFyaXR5IG9m
IGRlZGljYXRlZCBwaW5zIGNhbiBiZSBzcGVjaWZpZWQsCiAgIyB1c2luZyAqLWludmVydGVkIHBy
b3BlcnRpZXMuIEdQSU8gcG9sYXJpdHkgY2FuIGFsc28gYmUgc3BlY2lmaWVkCiAgIyB1c2luZyB0
aGUgR1BJT19BQ1RJVkVfTE9XIGZsYWcuIFRoaXMgY3JlYXRlcyBhbiBhbWJpZ3VpdHkgaW4gdGhl
CiAgIyBsYXR0ZXIgY2FzZS4gV2UgY2hvb3NlIHRvIHVzZSB0aGUgWE9SIGxvZ2ljIGZvciBHUElP
IENEIGFuZCBXUAogICMgbGluZXMuICBUaGlzIG1lYW5zLCB0aGUgdHdvIHByb3BlcnRpZXMgYXJl
ICJzdXBlcmltcG9zZWQsIiBmb3IKICAjIGV4YW1wbGUgbGVhdmluZyB0aGUgR1BJT19BQ1RJVkVf
TE9XIGZsYWcgY2xlYXIgYW5kIHNwZWNpZnlpbmcgdGhlCiAgIyByZXNwZWN0aXZlICotaW52ZXJ0
ZWQgcHJvcGVydHkgcHJvcGVydHkgcmVzdWx0cyBpbiBhCiAgIyBkb3VibGUtaW52ZXJzaW9uIGFu
ZCBhY3R1YWxseSBtZWFucyB0aGUgIm5vcm1hbCIgbGluZSBwb2xhcml0eSBpcwogICMgaW4gZWZm
ZWN0LgoKV2lsbCB5b3Ugc3RpbGwgcHJvdmlkZSB0aGUgZGVzaXJlZCAiZG91YmxlIGludmVyc2lv
biIgYWZ0ZXIgdGhpcyBwYXRjaD8KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
