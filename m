Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7080C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 23:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlXLWpHGyqcZIH3kyXnIVFCCPFaMZnoARvzmaXNWV5Q=; b=X4p9GSco0kJiNb
	rZ/yiJsasTqq8aZBDpHD0QdG2VxGbYlD7yttGSTS5n6Pw+ycYrEI0ejq3GDqj0HheKKIPRkzsEXDo
	0jdX+kqs+5QL4iIO4OZtA5AImgMg8sLhQkCP0Skq0gKbsyFQ4AeBOpQIaaJCQfvwxIgIpy7zJUUm1
	dfWsT7buiH20rO0+GUCByD8gFfRangCKDyo1yS2yVO9SW3oQDObun1qMIxSSeh72Kf18dNIu1EWT2
	aJIEW5t4jLpbFOu882BdazUcOIdFDtBDoKOdCojIAsAWnmBOuamSVf8yR9YYih8/AZ41aKQ6IG1S8
	0hx765GH6rjqEwl2qcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW37i-002mG6-25;
	Tue, 15 Aug 2023 23:06:50 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW37f-002mFD-2C
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 23:06:49 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bdcade7fbso764758266b.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 16:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692140800; x=1692745600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrPa0mBv24tqWNTDwul7//LSN1cVDKf7kn8qJcAv5os=;
        b=I2gqKHVnynhn5a6q7JufzjrjRBbX85r9laDBvivZCmJTEHBX/D5v38OrAFPAQ4Ahuc
         BiyPhwLlWkv5/U0J+sAvWtfA/Ee5uB0NoidvQXMtfa0FS74sBrPLCyRJmmEIQzd8EV7y
         6/y3/f3zM1JfDx/29KU52/0d6Ru65VZzlri72Sx5Xe31cTIDpCeu0hsdP3cBw8UiVdIa
         bJ2H2pnogg1LR7+3bKP5HbfMwKxX9p5tNM4N4yGhHNM0AjDm19KPz9SZ0cpmztJdTEJm
         JYpg4T9J1ZqP6T57bMG+D2pVB60Cbw1NXwlJoKjH8PZ6RtPiWJAYrfjgcJMBFI4n/rwr
         VBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692140800; x=1692745600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrPa0mBv24tqWNTDwul7//LSN1cVDKf7kn8qJcAv5os=;
        b=JvsEAnIgmbtf9iQXqBumoSwkMLJijHks8Q3Kwx92T3pC0UE3aNhe7/jotibiT7+tZl
         UD+CmyVXR8kv5yfNJTCJCEB5XD5EsJvEZgp+98rr4EZR0v5J+8KlymOz6DTxUrvuHdyq
         zd0I88c9IeOtGKnYtKJsgVhQsMgjyhj2af40iNR+Z0rRA2iZ8BOYJLf2g8maKKMrxyYb
         16dzYlxZdIz8E7kFtXgXYiN+WSlVvm6mdfagDscDFUFYAXttjooWV6duoOcGNu2+KFwK
         5oFPaArwrg3KMTFg9TTfbggxlOTSU8atvxmxqpdrgsiuzR56YmZYeThiWHQUbuBgQR+v
         spMg==
X-Gm-Message-State: AOJu0YyEKWyoY9n1TbTJx4HVlUiypGeva22D4CftAKy6tl3k74+RmUCl
	ptYz/ZLk0U+3nqhAC74T/OvrP66tliK6dZs00pF+iw==
X-Google-Smtp-Source: AGHT+IEYf/fyOVx0742lOUxeNNrFI2vcP6VhqTkYiAQ+DS6mXjvMmtfl0u01KMqRzs8F2tE5QS8vH45FY5IvumziGEA=
X-Received: by 2002:a17:906:19:b0:992:bc8:58e4 with SMTP id
 25-20020a170906001900b009920bc858e4mr75813eja.20.1692140800125; Tue, 15 Aug
 2023 16:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
 <a7956e13-7b94-fb65-8b43-f2c9fd014353@linaro.org>
In-Reply-To: <a7956e13-7b94-fb65-8b43-f2c9fd014353@linaro.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 15 Aug 2023 16:06:28 -0700
Message-ID: <CAFhGd8rTU0o8uiGT1qUKbsOZTgqLR7Sw5h-+07y4SJ6QOd9KsA@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_160647_720732_BDF4F06B 
X-CRM114-Status: GOOD (  21.22  )
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

T24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgMjoxNeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNS8wOC8yMDIzIDIz
OjExLCBKdXN0aW4gU3RpdHQgd3JvdGU6Cj4gPiBXaGVuIGJ1aWxkaW5nIHdpdGggY2xhbmcgMTgg
SSBzZWUgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+ID4gfCAgICAgICBkcml2ZXJzL210ZC9tYXBz
L3BoeXNtYXAtdmVyc2F0aWxlLmM6MjA5OjI1OiB3YXJuaW5nOiBjYXN0IHRvIHNtYWxsZXIKPiA+
IHwgICAgICAgICAgICAgICBpbnRlZ2VyIHR5cGUgJ2VudW0gdmVyc2F0aWxlX2ZsYXNocHJvdCcg
ZnJvbSAnY29uc3Qgdm9pZCAqJyBbLVd2b2lkLXBvaW50ZXItdG8tZW51bS1jYXN0XQo+ID4gfCAg
ICAgICAgIDIwOSB8ICAgICAgICAgICAgICAgICB2ZXJzYXRpbGVfZmxhc2hwcm90ID0gKGVudW0g
dmVyc2F0aWxlX2ZsYXNocHJvdClkZXZpZC0+ZGF0YTsKPiA+Cj4gPiBUaGlzIGlzIGR1ZSB0byB0
aGUgZmFjdCB0aGF0IGBkZXZpZC0+ZGF0YWAgaXMgYSB2b2lkKiB3aGlsZSBgZW51bQo+ID4gdmVy
c2F0aWxlX2ZsYXNocHJvdGAgaGFzIHRoZSBzaXplIG9mIGFuIGludC4gVGhpcyBsZWFkcyB0byB0
cnVuY2F0aW9uCj4gPiBhbmQgcG9zc2libGUgZGF0YSBsb3NzLgo+Cj4gQ2FzdCBkb2VzIG5vdCBz
b2x2ZSB0cnVuY2F0aW9uLiBUaGlzIHBhcnQgb2YgY29tbWl0IG1zZyBzdWdnZXN0cyB0aGF0Cj4g
eW91IGFjdHVhbGx5IGZpeCByZWFsIGlzc3VlLi4uIGFuZCB0aGF0IGlzIGFuIGlzc3VlLCBiZWNh
dXNlIHRoZW4KPiBBVVRPU0VMIHdpbGwgZ3JhYiBpdC4gVGhpcyBpcyBqdXN0IGNvbXBpbGVyIHdh
cm5pbmcgc2lsZW5jaW5nIGFuZCByYXRoZXIKPiBjb2Rpbmcgc3RhbmRhcmQgY29ycmVjdG5lc3Ms
IG5vIHJlYWwgZml4LCBzbyBwbGVhc2UgZHJvcCB0aGUgc2VudGVuY2UuCk9LLCBtYWtlcyBzZW5z
ZSBhYm91dCB0aGlzIG5vdCB0ZWNobmljYWxseSBzb2x2aW5nIGFuIGlzc3VlIGFuZCB0aHVzCkFV
VE9TRUwgbWF5IHBpY2sgaXQgdXAuIENhbiB5b3UgZWxhYm9yYXRlLCB0aG91Z2gsIG9uIGhvdyB0
aGUgY2FzdApkb2Vzbid0IHNvbHZlIHRydW5jYXRpb24uIElzIHRoZSBpbml0aWFsIGltcGxlbWVu
dGF0aW9uIG5vdCBhCnBvaW50ZXItd2lkdGggZG93biB0byBpbnQtd2lkdGggY2FzdD8gU3VyZWx5
IHdlJ3JlIGxvc2luZyB0aGUgdG9wIGhhbGYKb2YgYml0cy4gSSdtIHN0aWxsIG5vdCBzYXlpbmcg
dGhlcmUncyBkYXRhIGxvc3MsIHRvIGJlIGNsZWFyLiBKdXN0CnRoYXQgdGhlIGNvbXBpbGVyIGlz
IHdhcm5pbmcgYmVjYXVzZSBvZiB0aGUgdHJ1bmNhdGlvbi4KCj4KPiA+Cj4gPiBMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xOTEwCj4gPiBSZXBv
cnRlZC1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+ID4gU2lnbmVk
LW9mZi1ieTogSnVzdGluIFN0aXR0IDxqdXN0aW5zdGl0dEBnb29nbGUuY29tPgo+ID4gLS0tCj4g
PiBOb3RlOiBUaGVyZSBpcyBsaWtlbHkgbm8gZGF0YSBsb3NzIG9jY3VycmluZyBoZXJlIGR1ZSB0
byB0aGUgZmFjdCB0aGF0Cj4gPiBgZW51bSB2ZXJzYXRpbGVfZmxhc2hwcm90YCBoYXMgb25seSBh
IGZldyBlbnVtZXJhdGVkIGZpZWxkcywgbm9uZSBvZgo+ID4gd2hpY2ggYXJlIGxhcmdlIGVub3Vn
aCB0byBjYXVzZSBkYXRhIGxvc3MuCj4KPiBJZiB0aGVyZSBpcyBhIGRhdGEgbG9zcywgY2FzdCBk
b2VzIG5vdCBzb2x2ZSBpdC4KPgo+ID4gTm9uZXRoZWxlc3MsIHRoaXMgcGF0Y2ggaGVscHMKPiA+
IHRvd2FyZHMgdGhlIGdvYWwgb2YgZXZlbnR1YWxseSBlbmFibGluZyB0aGlzIHdhcm5pbmcgZm9y
IG1vcmUgYnVpbGRzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEp1c3RpbiBTdGl0dCA8anVzdGlu
c3RpdHRAZ29vZ2xlLmNvbT4KPgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
