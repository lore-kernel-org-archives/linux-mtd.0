Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055EECF9C6B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 06:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/WnZMcw14BW9YwDklsmclg05ETNmWrsUQNb71RS7HA=; b=cISmTwxdtbpEqu
	52bqT4hMoHnac6AYwCSFdBJ6XWhrkVfLTC15otkb/J8eoaYCKpR5XcKZOXgQlcvclAv1sBNpdzWhq
	8xC1VUX+sGe3WTahNghl34arYoMbxRFw57/hwxEWvEJzjHjsgNnTY3N/rQu/yOKhTJ09bf2FPaFPZ
	6fJrPnKcB0pF8nu1qAN1fOsXHzH8Du1piZivXqgHYqiDDvp+dMnLYmJi1FUoMz1ymkWVDBH/8AOTY
	hf6uESIeQ5m/HODy4/VkVWCP5Qy+dkqzIM7KU+tcaPkZUXmjS42+26rxIaP7R+mgt2xVEjYSKBUsM
	yZqKS5X9Y93RKGQuhQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssz4y-00000001GBm-40xa;
	Tue, 24 Sep 2024 06:31:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssz0F-00000001FLU-0T8A
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 06:26:28 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3787f30d892so2946678f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727159185; x=1727763985; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gdBSLWTjDz46WnUKd/zsdS9Z+CNhvUe7k25zO7xWOHY=;
        b=HXcw5SdTWl8KxldIET3APuL4bJE+XIwUEylB1N7xJUqPBIcigpKSu0WRv/HsQ5YG0Z
         YQJknRB3JoB5Yfxf/ZBYuIGwMrgRctiMQPGiqItBHPXPlsNC5CxNURzSJvS8tMqvRBH+
         66IR75Rk5KC8lw0P7zpYnnX0nsjltQcaEFwWAL1GjkX/xeowGAI9GesgrrMzELEASd2S
         1BLyE1YCB01yxr2hwF1bgKCvbzYMDRFb849xBkLM3HLDVJqJnNXAbETXIfl4tRKQHCDf
         Jiluqkood0Ra+6L3JvYBmsq01BkLCB7p3Q0Oy+1aBX5/bO8Z9TQuQl6x17lVt6A64bEx
         /i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727159185; x=1727763985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdBSLWTjDz46WnUKd/zsdS9Z+CNhvUe7k25zO7xWOHY=;
        b=N5Gj2UezZLyHnt/WbZrEljuwFyIHwxMMGmq1r1UkaCVemsG77aYjqKapav5vZIkhAq
         +6DZzekk1k2S1kgf0RRdO8hmfJG20RCVJdhPeA/Xiw57Y2Bp6RiLDNq5SadBhq5r71mT
         PFUUvwSR7//5dXa1IR6qhusu4qAbkyOzcjkjhRDSQmZTK4n9gyl29n0k0yRH4wBwfNxx
         EAokuqFIJ5JrgiBYa7YNB+HjubZl0mGV3GKe3EVeQBr33jYJWF57lroEQfmuEn/tkXYn
         2KQKrkosevEV7A6vUPOqrOARcJHnR75+SIPO2uMFf2nJoYk3b7Zw0hUy0kvNn6Jf8SND
         Neeg==
X-Gm-Message-State: AOJu0Yx4oRrQXoaacc2typ7zu289l7MmOO2TAqnm71uTVLDEOJH6bQjJ
	i7poGJRy20d4d5ZE3iD52lzI5PTk85n3OQDrhwaEcIsGtc9ZafEdEjwCt15u6Bk=
X-Google-Smtp-Source: AGHT+IH7QCoWbsnczGD/UHfDyngk5Dnq6vWWlZdr2uSQqSKGcBjiebnb2RSWlwiXS9rCJr2xUVJQxw==
X-Received: by 2002:a5d:4a07:0:b0:374:af19:7992 with SMTP id ffacd0b85a97d-37a42252c42mr6407890f8f.7.1727159185161;
        Mon, 23 Sep 2024 23:26:25 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2c1acasm693353f8f.32.2024.09.23.23.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 23:26:24 -0700 (PDT)
Message-ID: <368cd6fb-cab1-44ad-af46-651d9323bc19@linaro.org>
Date: Tue, 24 Sep 2024 07:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal flash
To: Alvin Zhou <alvinzhou.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>,
 Bough Chen <haibo.chen@nxp.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-7-alvinzhou.tw@gmail.com>
 <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
 <CAPhrvRR3U9=0DuG_FQ81ZJq+RLe6Bn9YO831Mx2n3NkeV3MCdA@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPhrvRR3U9=0DuG_FQ81ZJq+RLe6Bn9YO831Mx2n3NkeV3MCdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_232627_181258_BD832230 
X-CRM114-Status: GOOD (  17.81  )
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

CgpPbiA5LzI0LzI0IDQ6MjUgQU0sIEFsdmluIFpob3Ugd3JvdGU6Cj4gSGkgVHVkb3IsCj4gCj4g
VHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiDmlrwgMjAyNOW5tDnmnIgy
M+aXpSDpgLHkuIAg5LiL5Y2IMjo1NOWvq+mBk++8mgo+Pgo+PiBIaSwgQWx2aW4sCj4+Cj4+IEkg
cXVpY2tseSBza2ltbWVkIG92ZXIgdGhlIHByZXZpb3VzIDUgcGF0Y2hlcyBhbmQgdGhleSBhcmUg
bG9va2luZyBmaW5lLgo+Pgo+PiBJIGRvbid0IGdldCB0aGlzIHBhdGNoIGhvd2V2ZXIuCj4+Cj4+
IE9uIDcvMTgvMjQgNDo0NiBBTSwgQWx2aW5aaG91IHdyb3RlOgo+Pj4gRnJvbTogQWx2aW5aaG91
IDxhbHZpbnpob3VAbXhpYy5jb20udHc+Cj4+Pgo+Pj4gQWRkaW5nIE1hbnVmYWN0dXJlIElEIDB4
QzIgaW4gbGFzdCBvZiBJRCB0YWJsZSBiZWNhdXNlIG9mCj4+PiBPY3RhbCBGbGFzaCBuZWVkIG1h
bnVmYWN0dXJlciBmaXh1cCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nCj4+PiBPY3RhbCBEVFIgbW9k
ZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWltZUxpYW8gPGphaW1lbGlhb0BteGljLmNvbS50
dz4KPj4+IFNpZ25lZC1vZmYtYnk6IEFsdmluWmhvdSA8YWx2aW56aG91QG14aWMuY29tLnR3Pgo+
Pj4gLS0tCj4+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jIHwgNCArKystCj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL21hY3Jvbml4LmMKPj4+IGluZGV4IGYwMzk4MTlhNTI1Mi4uMWE4Y2NlYmRmZTBlIDEw
MDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4+PiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPj4+IEBAIC0yMDAsNyArMjAwLDkgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIG1hY3Jvbml4X25vcl9wYXJ0c1tdID0gewo+Pj4g
ICAgICAgICAgICAgICAubmFtZSA9ICJteDI1bDMyNTVlIiwKPj4+ICAgICAgICAgICAgICAgLnNp
emUgPSBTWl80TSwKPj4+ICAgICAgICAgICAgICAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRLLAo+
Pj4gLSAgICAgfQo+Pj4gKyAgICAgfSwKPj4+ICsgICAgIC8qIE5lZWQgdGhlIG1hbnVmYWN0dXJl
ciBmaXh1cHMsIEtlZXAgdGhpcyBsYXN0ICovCj4+PiArICAgICB7IC5pZCA9IFNOT1JfSUQoMHhj
MikgfQo+Pj4gIH07Cj4+Pgo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB3aHkgeW91
IG5lZWQganVzdCB0aGUgbWFudWZhY3R1cmVyIGlkIGhlcmU/IEkKPj4gd291bGQgaGF2ZSBleHBl
Y3RlZCB0byBzZWUgYSBzcGVjaWZpYyBmbGFzaCBlbnRyeSBpbnN0ZWFkLgo+IAo+IEdyYXRlZnVs
IHRvIE1pY2hhZWwgZm9yIHRoZSB2YWx1YWJsZSBzdWdnZXN0aW9uLiBUaGlzIGFkZGl0aW9uIG9m
IHRoZQo+IE1hY3Jvbml4IG1hbnVmYWN0dXJlciBJRCBlbmFibGVzIHRoZSBmaXh1cCBmdW5jdGlv
bnMgc3VjaCBhcwo+IG1hY3Jvbml4X25vcl9zZXRfb2N0YWxfZHRyIHRvIGJlIGV4ZWN1dGVkIHdp
dGhvdXQgdGhlIG5lZWQgdG8KPiBjcmVhdGUgc2VwYXJhdGUgSUQgZW50cmllcyBmb3IgZWFjaCBP
Y3RhbCBEVFIgTk9SIEZsYXNoIGluIHRoZQo+IGZsYXNoX2luZm8uCj4gCgpBaCwgbmljZS4gT2th
eSB0aGVuLiBJJ20gZ29pbmcgdG8gcmV2aWV3IHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzLiBUaGV5
Cmxvb2sgcHJvbWlzaW5nIDspLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
