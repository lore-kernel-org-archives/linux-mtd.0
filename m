Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FE9C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Dec 2022 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrqVVhWXvIP66FdOMWxQiZWlUcC3PfvGZdEH9mKxgS8=; b=TOu7UyIJ9y4smm
	xCxjcaOIw183+aixlXh8fbQQmtMvDqRty6KApYEY/TbGCIhnpZ9s0zSnaEBdP0cwrG0WPifj+2JTe
	ZqafTjrNwN60bwEaIudiDL/zIFyYlZoQCoSrtzny8QqyXSaINbLKY2XMYxJ0EDWcKHbUA4KcrTduJ
	4plOrWf2LGTLgp62XMlPp5ViSR4zi/oh0AhuNEaCaHOFp2JFsaEPj1OQOGaDloDGyUxS9Fgw48QeO
	nZgSiuiXZ4od5u+n7ziwLgrdlkXo2+4C4FfZfvC5SciW+7ZM/5TFpS5EdAP2pFx6RjzKoL1u7cNf8
	eAveXR8h5WFe4sHYNYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Y4C-00C91B-2E; Tue, 20 Dec 2022 08:33:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Y41-00C8nY-7H
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2022 08:33:37 +0000
Received: by mail-pl1-x62b.google.com with SMTP id l4so263063pld.13
        for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2022 00:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JjS69/Ixd4q4GSHhs0B/xrBfaSKxFWqJiG+5G88a0pI=;
        b=BaThoQ8s+wnMec8NW8q+6wwa6fPmxr6UmPVgbZ8FnnG6SCxwyxch5IhXD3bPEjPWFO
         DZTrsHZFIhSkA4CCQJqfzraqQP7PuSTcg/QqoZJM6mGLzmH0qvH0zpUctKMH73XefQxZ
         pswkSdQV0UF3yDdIkOGk6ZpK8BK/cbhIkdKZL87fTvxTid5iOu02SyR/GQAjBigvYiva
         kWltLA1XY1vvBDBRWcLWU/g/YP8MS1xQABE2oaePn5oqB04+OH32tn/akGW3vJ0555bI
         ukv3TwKIP0dtwnr6gAROLm6wsWe7Zu/LIk6h2WXJSGnrDbiUrcXL4cFOMTEEoNZQw604
         Ea8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JjS69/Ixd4q4GSHhs0B/xrBfaSKxFWqJiG+5G88a0pI=;
        b=OoR01h+f1em7caejDqbdp2JXmOTrMnIiojgS/PS0bSikNxaH6TD/hK0OEhlkCyXHE0
         VUOfjvf10fqzLYGmulNlMnTZsineSKueosNRK5xlrZEv9BjHL/xrpcHZKtKLdI5kedAd
         /S8LlX9PmmwjrGvqwcX+zIcN5f9Cy143o87DFdUk1F+km0/G+Fju7E1Vcaewc9K+/hoo
         yLb4TYFAKPjGVZu0WJpPnfFZgLJ3+Mk0nl7CSPbKimqymcwG2WJQlVE65DNO+C0hDtCn
         M2XzD9JRuTiDkQuRG5Qi4r4B4/ZKXkmT9fURluZMsrX2qxwPOEYc7g4NDKYBc6uUXdsI
         +UHw==
X-Gm-Message-State: ANoB5pmyTQk/cCyNmOD3FM8x+3n508RdjpK6AG0rJZcu38R7qEZR8TlY
	SXJ/syQ2X4SpT4IJWiA7Hx4=
X-Google-Smtp-Source: AA0mqf4VO8cMxe7sqi4KXkWDVmhXjZE4zB+NDoHnVzCHJ0fV82ZuH4DKcY7KqUA2EJKoSH9Z5pyBjg==
X-Received: by 2002:a17:902:9a43:b0:187:16c2:d52c with SMTP id x3-20020a1709029a4300b0018716c2d52cmr42478325plv.50.1671525207051;
        Tue, 20 Dec 2022 00:33:27 -0800 (PST)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b00186cf82717fsm8678521plb.165.2022.12.20.00.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 00:33:26 -0800 (PST)
Message-ID: <34a4c547-86d6-d0e4-504f-1c04c4f69a32@gmail.com>
Date: Tue, 20 Dec 2022 17:33:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for Infineon
 S25FS256T
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20221219015509.15075-1-Takahiro.Kuwano@infineon.com>
 <511703b7a86075387b5bf07434077724@walle.cc>
 <46ee3e2bac101849af6f39a999bb47d2@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <46ee3e2bac101849af6f39a999bb47d2@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_003329_617601_FE500CE9 
X-CRM114-Status: GOOD (  11.49  )
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

T24gMTIvMTkvMjAyMiA1OjI3IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+IEFt
IDIwMjItMTItMTkgMDg6MjksIHNjaHJpZWIgTWljaGFlbCBXYWxsZToKPj4gQW0gMjAyMi0xMi0x
OSAwMjo1NSwgc2NocmllYiB0a3V3NTg0OTI0QGdtYWlsLmNvbToKPj4+IEZyb206IFRha2FoaXJv
IEt1d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT4KPj4+Cj4+PiBJbmZpbmVvbiBT
MjVGUzI1NlQgaXMgMjU2TWJpdCBRdWFkIFNQSSBOT1IgZmxhc2guIFRoZSBrZXkgZmVhdHVyZXMg
YW5kCj4+PiBkaWZmZXJlbmNlcyBjb21wYXJpbmcgdG8gb3RoZXIgU3BhbnNpb24vQ3lwcmVzcyBm
bGFzaCBmYW1pbGVzIGFyZToKPj4+IMKgIC0gNC1ieXRlIGFkZHJlc3MgbW9kZSBieSBmYWN0b3J5
IGRlZmF1bHQKPj4+IMKgIC0gUXVhZCBtb2RlIGlzIGVuYWJsZWQgYnkgZmFjdG9yeSBkZWZhdWx0
Cj4+PiDCoCAtIFN1cHBvcnRzIG1peHR1cmUgb2YgMTI4S0IgYW5kIDY0S0Igc2VjdG9ycyBieSBP
VFAgY29uZmlndXJhdGlvbgo+Pj4gwqDCoMKgICh0aGlzIHBhdGNoIHN1cHBvcnRzIHVuaWZvcm0g
MTI4S0Igb25seSBkdWUgdG8gY29tcGxleGl0eSBvZgo+Pj4gwqDCoMKgwqAgbm9uLXVuaWZvcm0g
bGF5b3V0KQo+Pj4KPj4+IFRlc3RlZCBvbiBYaWxpbnggWnlucS03MDAwIEZQR0EgYm9hcmQuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5m
aW5lb24uY29tPgo+Pj4gLS0tCj4+PiBEYXRhc2hlZXQ6Cj4+PiBmaWxlSWQ9OGFjNzhjOGM4MDAy
N2VjZDAxODA3NDBjNWE0NjcwN2h0dHBzOi8vd3d3LmluZmluZW9uLmNvbS9kZ2RsYWMvSW5maW5l
b24tUzI1RlMyNTZUXzI1Nk1iX1NFTVBFUl9OYW5vX0ZsYXNoX1F1YWRfU1BJXzEuOFYtRGF0YVNo
ZWV0LXYxMl8wMC1FTi5wZGY/YQo+IAo+IFRoaXMgc2hvdWxkIGJlIGEgTGluazogdGFnIGluIHRo
ZSBjb21taXQgbWVzc2FnZS4KPiAKVGhhbmsgeW91IQoKPj4gQWxzbyBJJ20gbm90IHN1cmUgd2hl
biBzZXRfNGJ5dGVfYWRkcl9tb2RlKCkgaXMgY2FsbGVkIGR1cmluZyBpbml0Lgo+PiBJdCBzZWVt
cyBzbGlnaHRseSB3cm9uZyB0byBtZSBiZWNhdXNlIGl0IHdpbGwgY2hlY2sgd2V0aGVyCj4+IFNO
T1JfRl80Ql9PUENPREVTIGlzIHNldC4gQnV0IGluIHRoZSByZXN0b3JlIHBhdGgsIGl0IGlzIGNo
ZWNrZWQgZm9yCj4+ICFTTk9SX0ZfNEJfT1BDT0RFUyBiZWZvcmUgMyBieXRlIG1vZGUgaXMgZW5h
YmxlZCBhZ2Fpbi4gTWhoLgo+IAo+IFNjcmFwIHRoYXQgY29tbWVudC4gSSByZWFkIHRoZSBjb2Rl
IHdyb25nLiBUaGUgcGxhY2UgSSBsb29rZWQgYXQKPiBqdXN0IHRyYW5zbGF0ZSB0aGUgM0Igb3Bj
b2RlcyB0byB0aGUgNEIgb25lcy4KPiAKPiAtbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
