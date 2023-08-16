Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1447BC001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 05:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Mx9Y0FDMFrDdZp/T1+nLf6PX0E8X6xW6ju7gsLyeMk=; b=kdZwyB95cjfoai
	fU7qrgGxp+29YzxykS+uydiBYpq5ApojVe4+wkHXO8DgSZLPz3xMg9gFCtBDKpmFE+/M1Nsd3pHrI
	c4QJAUzBOHs8M6kVE4TB1q13qP+JCNE/zqubSrduSvyu3Zja4/e8xDb594vWEeGS0fABuj3d1UTgD
	suuUfLwo8zHkLf9VEcP4kuykj7xh83nXopyVFnQ0Q/82Atzg0e6A+c5nJ5gc0n42IGWtHJXbz4wsA
	tNtv3NPmKolYVQV49vcHdkh8uSfDLUsTWZ47vwkIQVGYT0nUzoDuuEX09LCK/Idyko0HDeGWyPU84
	Lxp4CgahJWPHdErnlTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW9BN-003E4I-1n;
	Wed, 16 Aug 2023 05:35:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW9BL-003E3R-0M
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 05:35:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe1d9a8ec6so41162155e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692164096; x=1692768896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5ksSrfoQhUw1ZEBLOq6q8yMh3Ah7S6SGizLhXtxXU4=;
        b=edpuAYQXEQ9OEdOp2KZdnwWqRhLG0RH8xS8zwxGuc6hPqsw3/tTqD43TISmtxNI3zY
         3NqNqIX5YOpcIke3Yb9LLrVuErwNXKBLXFqBPe1R30V59HZaSwm1LfiSZK/AMLkgDZBb
         kk+CaQsjS32+fhWiplRVwcYSAo6N9sFNCTCQ0e82fBAfZdgvPoBS8Qg/MlSzV2lO0dTU
         2hN149zs2tA0+Uv0eBRa1xQ4trlAoaI2FV5JDeiN9p/dm17XRLiSYbxPo7bol2zx0/+Z
         cipG8ZIOEnGz79d/KpNobRcQb78NFmG0XB+x8xeY5zBmax8TxuMy+/u4hofd27tm78fG
         OEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692164096; x=1692768896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5ksSrfoQhUw1ZEBLOq6q8yMh3Ah7S6SGizLhXtxXU4=;
        b=FVaZuCHGjatuzt0vY1DcAQCvvqq9tufS7urdqPjSfJMS4fKfpbmUv0UKLK8qymtrcK
         nlyb6aU3XLLrpGq2KcfUDsWOXJDlmldAKGS16vik1r3O9jHJSXVQb7Gtw4IgLoeEiAzU
         QcyUHZEZKZ8TvWc1vDo/fxHdscc6BSXGYARLgKuY6zKwfW3+jKN6MfD3+bgP26vBCwmO
         ZvdlwJbUQqvw3XjekNseTY1c/6v88JZ+5V7MqF/fDsRR0OHcC8GNa5x7NFlUjprYnvw8
         pwuVysKgmYv4uPO0wN5h6OCU7qGmWzaJZnAO0Algx0OsWIBcQTf+GrAXNHB2Lbsz1jd+
         +ZWw==
X-Gm-Message-State: AOJu0YzUZXmFWztcDg/hT19ar9kK0BexFawIVnnpIdXVWUrSKmYOgaHs
	o6+8K8ja2OXYF2YvIafGnVmeLg==
X-Google-Smtp-Source: AGHT+IGLA5lowKwKuCnX8UwxKBq+NtEWMT+CcurCefj4vhebQX0LZ+LoJXhsNlYcgDdsDgX6fzbbWQ==
X-Received: by 2002:a7b:c7c7:0:b0:3fd:2e87:aa28 with SMTP id z7-20020a7bc7c7000000b003fd2e87aa28mr695024wmk.15.1692164096117;
        Tue, 15 Aug 2023 22:34:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id e7-20020a05600c218700b003fe3674bb39sm20034014wme.2.2023.08.15.22.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 22:34:55 -0700 (PDT)
Message-ID: <1c4aa5ce-df78-b69c-0dc2-2859b0c1c3df@linaro.org>
Date: Wed, 16 Aug 2023 07:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
To: Justin Stitt <justinstitt@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
 <a7956e13-7b94-fb65-8b43-f2c9fd014353@linaro.org>
 <CAFhGd8rTU0o8uiGT1qUKbsOZTgqLR7Sw5h-+07y4SJ6QOd9KsA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFhGd8rTU0o8uiGT1qUKbsOZTgqLR7Sw5h-+07y4SJ6QOd9KsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_223459_146424_7A34AF76 
X-CRM114-Status: GOOD (  17.94  )
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

T24gMTYvMDgvMjAyMyAwMTowNiwgSnVzdGluIFN0aXR0IHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDE1
LCAyMDIzIGF0IDI6MTXigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDE1LzA4LzIwMjMgMjM6MTEsIEp1c3Rp
biBTdGl0dCB3cm90ZToKPj4+IFdoZW4gYnVpbGRpbmcgd2l0aCBjbGFuZyAxOCBJIHNlZSB0aGUg
Zm9sbG93aW5nIHdhcm5pbmc6Cj4+PiB8ICAgICAgIGRyaXZlcnMvbXRkL21hcHMvcGh5c21hcC12
ZXJzYXRpbGUuYzoyMDk6MjU6IHdhcm5pbmc6IGNhc3QgdG8gc21hbGxlcgo+Pj4gfCAgICAgICAg
ICAgICAgIGludGVnZXIgdHlwZSAnZW51bSB2ZXJzYXRpbGVfZmxhc2hwcm90JyBmcm9tICdjb25z
dCB2b2lkIConIFstV3ZvaWQtcG9pbnRlci10by1lbnVtLWNhc3RdCj4+PiB8ICAgICAgICAgMjA5
IHwgICAgICAgICAgICAgICAgIHZlcnNhdGlsZV9mbGFzaHByb3QgPSAoZW51bSB2ZXJzYXRpbGVf
Zmxhc2hwcm90KWRldmlkLT5kYXRhOwo+Pj4KPj4+IFRoaXMgaXMgZHVlIHRvIHRoZSBmYWN0IHRo
YXQgYGRldmlkLT5kYXRhYCBpcyBhIHZvaWQqIHdoaWxlIGBlbnVtCj4+PiB2ZXJzYXRpbGVfZmxh
c2hwcm90YCBoYXMgdGhlIHNpemUgb2YgYW4gaW50LiBUaGlzIGxlYWRzIHRvIHRydW5jYXRpb24K
Pj4+IGFuZCBwb3NzaWJsZSBkYXRhIGxvc3MuCj4+Cj4+IENhc3QgZG9lcyBub3Qgc29sdmUgdHJ1
bmNhdGlvbi4gVGhpcyBwYXJ0IG9mIGNvbW1pdCBtc2cgc3VnZ2VzdHMgdGhhdAo+PiB5b3UgYWN0
dWFsbHkgZml4IHJlYWwgaXNzdWUuLi4gYW5kIHRoYXQgaXMgYW4gaXNzdWUsIGJlY2F1c2UgdGhl
bgo+PiBBVVRPU0VMIHdpbGwgZ3JhYiBpdC4gVGhpcyBpcyBqdXN0IGNvbXBpbGVyIHdhcm5pbmcg
c2lsZW5jaW5nIGFuZCByYXRoZXIKPj4gY29kaW5nIHN0YW5kYXJkIGNvcnJlY3RuZXNzLCBubyBy
ZWFsIGZpeCwgc28gcGxlYXNlIGRyb3AgdGhlIHNlbnRlbmNlLgo+IE9LLCBtYWtlcyBzZW5zZSBh
Ym91dCB0aGlzIG5vdCB0ZWNobmljYWxseSBzb2x2aW5nIGFuIGlzc3VlIGFuZCB0aHVzCj4gQVVU
T1NFTCBtYXkgcGljayBpdCB1cC4gQ2FuIHlvdSBlbGFib3JhdGUsIHRob3VnaCwgb24gaG93IHRo
ZSBjYXN0Cj4gZG9lc24ndCBzb2x2ZSB0cnVuY2F0aW9uLiAKCkJlY2F1c2UgdGhhdCBpcyBubyBo
b3cgdGhlIEMgbGFuZ3VhZ2Ugd29yaz8KCkNhc3RpbmcgVUlOVE1BWCsxIHRvIHVuc2lnbmVkIGlu
dCwgZG9lcyBub3QgbWFnaWNhbGx5IGNoYW5nZSB0aGUKdW5zaWduZWQgaW50IGludG8gc29tZXRo
aW5nIGVsc2UuLi4KCgo+IElzIHRoZSBpbml0aWFsIGltcGxlbWVudGF0aW9uIG5vdCBhCj4gcG9p
bnRlci13aWR0aCBkb3duIHRvIGludC13aWR0aCBjYXN0PwoKVGhlc2UgYXJlIGRpZmZlcmVudCB3
aWR0aHMsIHNvIGNhc3QgY2Fubm90IHNvbHZlIHRydW5jYXRpb24uCgoKPiBTdXJlbHkgd2UncmUg
bG9zaW5nIHRoZSB0b3AgaGFsZgo+IG9mIGJpdHMuIAoKSWYgd2UgYXJlIGxvc2luZyB0b3AgaGFs
ZiB0aGVuIGhvdyBpcyB0aGUgdHJ1bmNhdGlvbiBhbmQgZGF0YSBsb3NzIHNvbHZlZD8KCj4gSSdt
IHN0aWxsIG5vdCBzYXlpbmcgdGhlcmUncyBkYXRhIGxvc3MsIHRvIGJlIGNsZWFyLiBKdXN0Cj4g
dGhhdCB0aGUgY29tcGlsZXIgaXMgd2FybmluZyBiZWNhdXNlIG9mIHRoZSB0cnVuY2F0aW9uLgoK
U29ycnksIHdoYXQgdHJ1bmNhdGlvbj8gVGhlIG9uZSB3aGljaCB3aWxsIGhhcHBlbiBhbHdheXMg
cmVnYXJkbGVzcyBvZgp0aGUgY2FzdCBhbmQgd2FybmluZz8KCkJlc3QgcmVnYXJkcywKS3J6eXN6
dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
