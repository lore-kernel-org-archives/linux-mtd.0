Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ABEC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zx+DrYK0XcRGrfNq2JouX4k5b8rO2hF6O/FnQsILkLk=; b=q9O/AloC+kJd8K
	PU7vwMk0WuFJCsmkkPkfvOUnbqIUnIZgfzWJN1L5aPFs+v2JtpbKrSqyHewCcWuT7yCIBMh0YSfhq
	zRrARaJBqolfalbbfDoSD62av4VL/5GL58ClFhyURENG1z8oP62yu7OM36IVWTRsx0gXZSanh21Z8
	bQzG4ZeEzedRX8ToL8buWoe1vsA7LmqYaYdB54uqpjQzoyBlcWoHesiZrtLlVxVg9c5itKBVJc0c9
	lb69hC3Ebkvn2cupVrDtqdHEDQ38vLsriOIiJdvVtM88ldXTdUOfMvY5KrPxsgH9i0cvErxGsaz3g
	r9kp5iqmTj4BfpiXTviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHng5-000JwT-VR; Wed, 09 Feb 2022 14:10:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHng2-000JvF-Ha
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 14:10:36 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B8DB23F1E9
 for <linux-mtd@lists.infradead.org>; Wed,  9 Feb 2022 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644415832;
 bh=Gp85bAVKigcTYq1v2tN4u8qzn6W9Z6vP8e5aBoQbQLA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=dbT6T3c0DgwV36k/vsYWdVvRCuIw/mfFtN9DsdwUlqds8WZ4gTFXWtjmnb8Sv7KIG
 DlSyMbPQJ769fMtWZ5KmjgfyOK7On+uo3GLaavvc6iY0r4wN2T1eDSn8zpuN61I7f1
 fW8l6wguc+YJ5F63e8vNe9fUxHQ9CXxwElho70E1CYXeKru1Ep9GJNgtJkbe+6kaN+
 TM5AbMgVLHb9TGY+qdsE5Ub7axxuOywTl4vLLRppZ6HOz3zEFdr6vyAr725dBUypHK
 MxnGHsPb0Wc7J1DBeyL3aB8Jvp9w5n6xZ4Els7/aSsPOVHITUFauRW9Jd5MOZ5izKw
 SSK0Z6H/q8qZw==
Received: by mail-ed1-f71.google.com with SMTP id
 ee7-20020a056402290700b0040f680071c9so1410401edb.9
 for <linux-mtd@lists.infradead.org>; Wed, 09 Feb 2022 06:10:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gp85bAVKigcTYq1v2tN4u8qzn6W9Z6vP8e5aBoQbQLA=;
 b=hHJc3t97nsmzTnRhOWm573kIayRWbRQRNRPjoALpwbN5MtneUUYKgYuGpSTXdLNJw0
 MNGmJnuqG2OgS8H+ml22hdm6HHwcvSemf5wDhpaWgfcX/2wNm7+com3rc3UzN7w1NxqW
 XTKhnVU56hhQ7LsEpq9WLdspH4Muw89Sk5r5Nphp3R34XZhFDI35m7l17Jhcls58XGmd
 6pG0U2wFanWhKr3B1Igt1180mY+0McxY9X5c+rpxXIu9PiYLrj4GKjHa/+9J4BG2w5Ci
 0l7fWrYje2JG1Ej3urYa8k2xo96RaO2qWOIHMlipgORI6BZEq/BoEy4mYlcoPzQj4Cfi
 QMSQ==
X-Gm-Message-State: AOAM532D4MlcQj+zTF0jcgingbMR4mwcV3Ovvf+NxAIscizj4FE/CDCI
 CAJfxEoZkuY1hXtokGb4847LIIT3s1LZ7KDqMOogIMLsIJ38uiwq8Wda+4oN/bhBFlFUzf6szrq
 BgR7VW6/2kx+G9Av1O2F7jvjX0dW1fQwy2HN2pS87BhI=
X-Received: by 2002:a50:ab16:: with SMTP id s22mr1041152edc.287.1644415832451; 
 Wed, 09 Feb 2022 06:10:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGb6ExJzJVPtgKiFWvDsy4Fh0iFTj8KEq7+2K6RV3YoTMH9vYTqaeKJqeOYkixAO//NYpGcg==
X-Received: by 2002:a50:ab16:: with SMTP id s22mr1041129edc.287.1644415832309; 
 Wed, 09 Feb 2022 06:10:32 -0800 (PST)
Received: from [192.168.0.94] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id bm4sm6687334edb.21.2022.02.09.06.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 06:10:30 -0800 (PST)
Message-ID: <1d1d8ef6-6924-226b-348b-7562fc657f25@canonical.com>
Date: Wed, 9 Feb 2022 15:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd/memory: omap: Fix build dependencies
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 rogerq@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220127105652.1063624-1-miquel.raynal@bootlin.com>
 <20220209135732.fig35edxzgwdgugd@those>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220209135732.fig35edxzgwdgugd@those>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_061034_820423_58518825 
X-CRM114-Status: GOOD (  21.57  )
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

T24gMDkvMDIvMjAyMiAxNDo1NywgTmlzaGFudGggTWVub24gd3JvdGU6Cj4gT24gMTE6NTYtMjAy
MjAxMjcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IFRoZSBPbWFwMiByYXcgTkFORCBjb250cm9s
bGVyIChNVERfTkFORF9PTUFQMikgc2VsZWN0cyB0aGUgT21hcCBtZW1vcnkKPj4gY29udHJvbGxl
ciAoT01BUF9HUE1DKSBmb3IgdGhlIEFSQ0hfSzMgcGxhdGZvcm1zIGFuZCBmb3IgY29tcGlsZQo+
PiB0ZXN0aW5nLgo+Pgo+PiBUaGUgT21hcCBtZW1vcnkgY29udHJvbGxlciAoT01BUF9HUE1DKSBk
ZXBlbmRzIG9uIE9GX0FERFJFU1MgYmVjYXVzZSB0aGUKPj4gZHJpdmVyIHVzZXMgb2ZfYWRkcmVz
c190b19yZXNvdXJjZSgpLgo+Pgo+PiBUaGlzIG1heSBwcm9kdWNlIHRoZSBmb2xsb3dpbmcgd2Fy
bmluZzoKPj4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3Ig
T01BUF9HUE1DCj4+IERlcGVuZHMgb24gW25dOgo+PiAgIC0gTUVNT1JZIFs9eV0gJiYgT0ZfQURE
UkVTUyBbPW5dCj4+IFNlbGVjdGVkIGJ5IFttXToKPj4gICAtIE1URF9OQU5EX09NQVAyIFs9bV0g
JiYgTVREIFs9bV0gJiYgTVREX1JBV19OQU5EIFs9bV0gJiYKPj4gICAgIChBUkNIX09NQVAyUExV
UyB8fCBBUkNIX0tFWVNUT05FIHx8IEFSQ0hfSzMgfHwgQ09NUElMRV9URVNUIFs9eV0pICYmCj4+
ICAgICBIQVNfSU9NRU0gWz15XQo+Pgo+PiBBcyB0aGUgb2ZfYWRkcmVzc190b19yZXNvdXJjZSgp
IGhlbHBlciBoYXMgYSBkdW1teSBpbXBsZW1lbnRhdGlvbgo+PiByZXR1cm5pbmcgYW4gZXJyb3Ig
d2hlbiBPRl9BRERSRVNTIGlzIG5vdCBzZWxlY3RlZCwgd2UgZG8gbm90IG5lZWQgdG8KPj4gc2Vs
ZWN0IE9GX0FERFJFU1MgZnJvbSB0aGUgT01BUF9HUE1DIEtjb25maWcgbWVudSBmb3IgY29tcGls
ZSB0ZXN0aW5nCj4+IHB1cnBvc2VzLiBOb3Igd2UgYWN0dWFsbHkgZG8gZm9yIEszIHBsYXRmb3Jt
cywgYnV0IGluIG9yZGVyIHRvIG5vdCBicmVhawo+PiB0aGVzZSBwbGF0Zm9ybXMgd2UgY2FuIGp1
c3Qgc2VsZWN0IE9GX0FERFJFU1MgZnJvbSBBUkNIX0szIGRpcmVjdGx5Lgo+Pgo+PiBGaXhlczog
ZGJjYjEyNGFjZWJkICgibXRkOiByYXduYW5kOiBvbWFwMjogU2VsZWN0IEdQTUMgZGV2aWNlIGRy
aXZlciBmb3IgQVJDSF9LMyIpCj4+IFJlcG9ydGVkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+PiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4+IFNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4+IC0tLQo+PiAgYXJj
aC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyB8IDEgKwo+PiAgZHJpdmVycy9tZW1vcnkvS2NvbmZp
ZyAgICAgICB8IDEgLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyBi
L2FyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMKPj4gaW5kZXggN2Q1ZDU4ODAwMTcwLi4xYTBk
NGI1NzViOTUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMKPj4g
KysrIGIvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3Jtcwo+PiBAQCAtMTIzLDYgKzEyMyw3IEBA
IGNvbmZpZyBBUkNIX0szCj4+ICAJc2VsZWN0IFRJX1NDSV9JTlRSX0lSUUNISVAKPj4gIAlzZWxl
Y3QgVElfU0NJX0lOVEFfSVJRQ0hJUAo+PiAgCXNlbGVjdCBUSV9LM19TT0NJTkZPCj4+ICsJc2Vs
ZWN0IE9GX0FERFJFU1MKPiAKPiBJIHVuZGVyc3RhbmQgdGhlIGJ1aWxkIGZhaWx1cmUsIGJ1dCwg
SSBkb24ndCBzZWUgYW55IG90aGVyIFNvQyBzZWxlY3RpbmcKPiBPRl9BRERSRVNTIGJlY2F1c2Ug
YSBkcml2ZXIgaGFzIGEgcHJvYmxlbT8KPiAKClRoZSBBUk0gcGxhdGZvcm1zIGRvIG5vdCBuZWVk
IHRvIHNlbGVjdCBPRl9BRERSRVNTIGJlY2F1c2UgaXQgaXMgYWx3YXlzCnRoZXJlLiBUaGUgZXJy
b3IgbG9va3MgbGlrZSBhIGNvbXBpbGUgdGVzdCwgc28gaXMgdGhpcyBwYXRjaCByZWFsbHkgYQpm
aXggZm9yIHJlcG9ydGVkIGVycm9yPwoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
