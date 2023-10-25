Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6165DC07545
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 03:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcQcDkKHne2Z5j193s43r9v+Aftjwsawx0xXMDoVBbU=; b=WDee4nGw4/wqph
	zPvDBmFTcQ3o3uIDLv2pNLPPbM1ZFoSBm8q+qBMmnh8vmytTbH9acU0JKowLlCwFfSiIPwIh95MVV
	2f9PaBg6YyWPe2OqRhK1aoAUYmmPIvfXngAGG5awH1f+NKwzbUkR7Xjmb5jahFKEnX286g2Sunyv5
	j0/zLg6RR4CcIZ7HqcprZ1qmHWvRGFMMusn1OaZU/RLyzHlFWdEeBF8W/jCyMZX8bAwqNNhdBPGCm
	6RpiM7EhZarsFVBXF9LOuzAHN6I993vDiqF/jW5LhP0Lb+rsb+BMhjpkGtdMms4/4JYFuDKSt0pQz
	21fJLMTpYVzQIppgjhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvUeu-00BGtD-2j;
	Wed, 25 Oct 2023 03:34:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvUer-00BGsj-22
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 03:34:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99de884ad25so774210066b.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 20:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698204848; x=1698809648; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWHZHPwYwnkCVqN0PLrqFf9g7VSmW+UXk/jLAxN8HYs=;
        b=vHHcoW4Xq0NRzFDJLPN/zY1kZgqCDN5o9IX7PAEM1muEbblBrPZN2U8CoDnvfQBOQk
         KUhLYf7AlhdR8z/uohGcGbrqSYoMJ8fgxDurnMBtTic4qq/m0OOnspVSfWycRngKTrkc
         /K6OqFYv+wMXAFIZET2I3XmjAenPfI4cKNCzds8fneaDJDuPGbz/UKX6e1FoaTvkL7i+
         Wme/iSUFTXMqPeEMpX5XXtPV8D6woj15J9+mKptSIMOGKiJyrqpfmWyewfa3O9q/t4AZ
         yk4tEoUApbeQTo/cGHJ8FHr8/EiBuAkxJHuT+T0QGjaa2Lf1OtbCQOP5hsQSedCHZdpC
         yFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698204848; x=1698809648;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWHZHPwYwnkCVqN0PLrqFf9g7VSmW+UXk/jLAxN8HYs=;
        b=WFc0dPo4zOgzkjO79lh7uVgMYxpnxGsarEIKVybOm4i27JEDLpIIwMinfMZt7j3iO2
         tuzHwT7oo8tFv+CtU2c4pluJEvD7jSwvsxKnSK5Lzj+lSvDJa43eoSC0ap6L0p0E5h1j
         5O//i28JSf6sJZwHm3pdGOIuopg07bmBojo1UXoDlSdODMtKgwVHc07QmG+415zxXCjQ
         yPPlhp/URuVPj7crilKYd6zhYKmWEIQsPfZ76OBZz/9yk2GQb6uuH1R460mLYVd3C5ME
         cZU6qRoKZX271p03U9vjUYZMFq8zAhsDF11Ew2sjMrsd3WZ+4hGpSDD0sS9xw34CfxTO
         Bk2Q==
X-Gm-Message-State: AOJu0YxvGetGFcYDeHPLpp/dtV9d8kv+VL8n+g3InuC0wNfoZqmsEjR3
	3XDwUHkmYuA/pSnUYRG8l8J3pA==
X-Google-Smtp-Source: AGHT+IFQOCsLU7e0gTKH5FM6snwz3g6Re6YzkEdhI15uKmkq0/N4HbFrS2VbeouyNp3St1mMvmzr4A==
X-Received: by 2002:a17:906:c4c6:b0:9c7:6087:49a7 with SMTP id cl6-20020a170906c4c600b009c7608749a7mr8167138ejb.43.1698204848076;
        Tue, 24 Oct 2023 20:34:08 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id f17-20020a1709062c5100b009c5c5c2c5a4sm9017388ejh.219.2023.10.24.20.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 20:34:07 -0700 (PDT)
Message-ID: <47aec8ad-3a30-4d97-9e3a-870df02f5ad7@linaro.org>
Date: Wed, 25 Oct 2023 06:34:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Fabio Estevam <festevam@gmail.com>, Michael Walle <michael@walle.cc>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
References: <20231023213800.2599704-1-festevam@gmail.com>
 <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
 <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc>
 <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
 <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org>
 <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com>
 <4e2de38da5a3e492eac522b9a68141c7@walle.cc>
 <CAOMZO5A98YSykYr+ddJ=v93isw=4jK_KhBLadSDTuBmn_WbqOQ@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <CAOMZO5A98YSykYr+ddJ=v93isw=4jK_KhBLadSDTuBmn_WbqOQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_203413_730309_0C368061 
X-CRM114-Status: GOOD (  21.31  )
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

CgpPbiAyNC4xMC4yMDIzIDE5OjQzLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IE9uIFR1ZSwgT2N0
IDI0LCAyMDIzIGF0IDE6MzbigK9QTSBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPiB3
cm90ZToKPiAKPj4gTWhoLCB0aGF0J3MgYSBwaXR5LiBJdCBzZWVtcyB0aGF0IHlvdXIgU0ZEUCBp
biB0aGUgZmxhc2ggZG9lc24ndAo+PiBjb250YWluIHRoYXQgdGFibGUuIEkgaGF2ZW4ndCBjb25m
aXJtZWQgaXQgYnkgbG9va2luZyBhdCB5b3VyIGR1bXAKPj4gYXMgSSdtIGFib3V0IHRvIGdvIG9u
IHZhY2F0aW9uIHRvbW9ycm93IGFuZCBwYWNraW5nIHJpZ2h0IG5vdy4KPiAKPiBKdXN0IGRpZCBh
IGhhY2sgdG8gZm9yY2UgY2FsbGluZyAgc3BpX25vcl9wYXJzZV9zY2NyX21jKCk6Cj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jIGIvZHJpdmVycy9tdGQvc3BpLW5v
ci9zZmRwLmMKPiBpbmRleCBiM2IxMWRmZWQ3ODkuLmRjNjFiYjVjNGY3ZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c2ZkcC5jCj4gQEAgLTEzMjAsNyArMTMyMCw4IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9wYXJzZV9z
Y2NyX21jKHN0cnVjdCBzcGlfbm9yICpub3IsCj4gICAgICAgICAgICAgICAgIHBhcmFtcy0+dnJl
Z19vZmZzZXRbaV0gPSBkd29yZHNbU0ZEUF9EV09SRChpKSAqIDJdOwo+IAo+ICAgICAgICAgcGFy
YW1zLT5uX2RpY2UgPSBuX2RpY2U7Cj4gLQo+ICsKPiArICAgICAgIHByX2VycigiKioqKiogcGFy
YW1zLT5uX2RpY2UgaXMgJWRcbiIsIHBhcmFtcy0+bl9kaWNlKTsKPiAgb3V0Ogo+ICAgICAgICAg
a2ZyZWUoZHdvcmRzKTsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gQEAgLTE1MzIsNiArMTUzMyw3
IEBAIGludCBzcGlfbm9yX3BhcnNlX3NmZHAoc3RydWN0IHNwaV9ub3IgKm5vcikKPiAKPiAgICAg
ICAgICAgICAgICAgY2FzZSBTRkRQXzRCQUlUX0lEOgo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBlcnIgPSBzcGlfbm9yX3BhcnNlXzRiYWl0KG5vciwgcGFyYW1faGVhZGVyKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBlcnIgPSBzcGlfbm9yX3BhcnNlX3NjY3JfbWMobm9yLCBwYXJhbV9o
ZWFkZXIpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+IAo+ICAgICAgICAgICAg
ICAgICBjYXNlIFNGRFBfUFJPRklMRTFfSUQ6Cj4gCj4gV2hlbiBib290aW5nIHdpdGggdGhpcyBj
aGFuZ2UgSSBnZXQ6Cj4gCj4gWyAgICAxLjg1NTkwM10gKioqKiogcGFyYW1zLT5uX2RpY2UgaXMg
Mgo+IFsgICAgMS44NTk2MjZdIHNwaS1ub3Igc3BpMC4wOiBtdDI1cXUwMWcgKDEzMTA3MiBLYnl0
ZXMpCj4gCj4gU28gc3BpX25vcl9wYXJzZV9zY2NyX21jKCkgd2FzIGFibGUgdG8gcmVhZCB0aGUg
bnVtYmVyIG9mIGRpZXMgY29ycmVjdGx5LgoKeW91IHByb2JhYmx5IGp1c3QgZ290IGx1Y2t5LCB0
aGUgU0ZEUCB0YWJsZXMgYXJlIGp1c3QgMzJiaXQgZGF0YS4gWW91CmFjdHVhbGx5IGhhdmUgdG8g
aGF2ZSB0aGF0IHRhYmxlIGRlZmluZWQgaW4gdGhlIFNGRFAgc3BhY2UuCgpDaGVjayB0aGUgamVz
ZDIxNiBzZmRwIHN0YW5kYXJkIGFuZCBsb29rIGludG8gdGhlIFNGRFAgUGFyYW1ldGVyIEhlYWRl
cgooc2VjdGlvbiA2LjMpLiBFYWNoIHRhYmxlIGhhcyBhIElEIExTQiAmIE1TQiBhbmQgYSBwYXJh
bWV0ZXIgdGFibGUKcG9pbnRlci4gSWYgdGhlIFNDQ1IgSUQgaXMgbm90IHRoZXJlIHRoZW4gdGhl
IHRhYmxlIGlzIG5vdCBkZWZpbmVkLCB0aHVzCm5vdCBzdXBwb3J0ZWQuIExldCBtZSBrbm93IHdo
YXQgeW91IGZpbmQuIEknbGwgdGFrZSBhIGxvb2sgdG9vIGlmIHlvdQpoYXZlIHRyb3VibGVzIGRl
Y29kaW5nIHRoZSBzZmRwIGR1bXAgZGF0YS4gV2UnZCBsaWtlIHRvIGFkZCBhIHNmZHAKZGVjb2Rl
ciBpbiB0aGUgZnV0dXJlIHRvIGVhc2UgdGhlIHByb2Nlc3MsIGJ1dCBpdCdzIG5vdCBzb21ldGhp
bmcgdGhhdCBJCmNhbiBhbGxvY2F0ZSB0aW1lIGZvciBub3cuCgo+IAo+PiBXaGF0IGRvIHdlIGRv
IGluIHRoYXQgY2FzZSwgVHVkb3I/IEkgcHJlc3VtZSBhIGZpeHVwIHdoaWNoIHNldHMgbl9kaWNl
Cj4+IChhbnkgbWF5YmUgb3RoZXJzKSB0byB0aGUgY29ycmVjdCB2YWx1ZT8KPiAKPiBNYXliZSBJ
IGNhbiBhZGQgYSBmaXh1cCB0aGF0IGNhbGxzIHNwaV9ub3JfcGFyc2Vfc2Njcl9tYygpPwoKSSBk
b3VidCBpdC4gWW91IHByb2JhYmx5IG5lZWQgc29tZXRoaW5nIGxpa2UgczI1ZnMyNTZ0X3Bvc3Rf
c2ZkcF9maXh1cCgpLgoKY2hlZXJzLAp0YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
