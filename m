Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A45EB8FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0T63SkxVugW+vyQyiZr9BPkV+qRD545ncunYXjfsnOU=; b=mOrxIB+AGg/9tf
	Qe/co5UsOxE/Rtzs5Koyr9qH5IiZ0Z3FuyXLG+d9P5QqT+Q186pWHX9GH7ND0KN9FXv2lq6Jdk38J
	3vCrRv1mtxDMZ/tXTjFK1DnuZvHAcgne06IXdqQXJehJjntI608CZ/0DiN5vkav5ORYL9nc9N7BYk
	5oTnA6z6UrYR62HVH4c2DgL4Jf/ln+c4htKTOiQ3XLv9AA54+xPeTDPeGuwHbYiaYOBK7MB017STf
	/dpf5Q/EMC8zbMsAmiAsP9u83Cqfr2KQLD9OYxF4jmN/jK/l4AYy66HC6ItrUAOVUSX+arRbT3cW8
	mw6NKVOksWcnmWSXHMGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmky-007Su4-2g;
	Wed, 06 Sep 2023 07:15:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmkw-007Ssw-0g
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:15:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so4410965a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693984514; x=1694589314; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvYk7hlbdfvGIQ0UNsbh1lqI3GDQsOHgcvyHeWCevbw=;
        b=xIIz2+FlUFXA8MwWxd6lAPozil3lWIRhhro+OGbpQIwmmov5IGoRFMfpfgWlGhxNgZ
         lXOdEqFDtsSp0tnzrWmghmPg0jFKAPYIuykXgjKEtzlIQmVKr/ZJtP/BW+1Bd2c+f0O7
         c9689bendsWN7HMokIsS4eaxs5tUGUuTLrDFroDLyFKrwAopjcunIPmPO1clQZIrH/oI
         xPITczlTdlyZL3L5yImBiZJKOj7q+njLelgchlZQevfuQ0dGdGF8BZoSdTvR3PhWUyDA
         aUyyIVIFd0vHg3z56nacGrVk8YOrFNrW+g2UBBtdxVfEadMVO46HjN30CL1ubxb/D5dJ
         DXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693984514; x=1694589314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvYk7hlbdfvGIQ0UNsbh1lqI3GDQsOHgcvyHeWCevbw=;
        b=Ks6hc4oDA2o2DcmLFxoCHK9SVFCzuuTioKFX1ts1olvQSwRWGYNbjLuhtWs4T0QiRX
         O6ZmRbBqfPmyX6LatR778h997vKCvm3HYl0EBo26i0hQ01Q/uooYtBlTPfUx0Dz06Sd4
         6Xp0EF4NuypoDaqLn8IYoWamkFyddxgAzBqW1BF6ptlT0aq91yklq5S4GrFLLd2R+kFI
         R2YrwtC+2LphCi82r3kwp0nZq0ruNDW2bdeWCzommD1/p0q2fEKUrFlD1pmQ7bqlWeha
         hd5teoYXMb1so15Ofz6ujhO8RuMAZY5BqVrKQt/5E+JIFrekFJgimVWm+nbLTm0Lc54z
         Uy/A==
X-Gm-Message-State: AOJu0Yx5k/mSwu/XzI2szdUc5GN3cO6dQdGK+EBgUs4nflFA4ISJ/V8I
	XB9Gr05OqC9DiLcLL2eFkTw6UQ53Rsuwp8In+MQ=
X-Google-Smtp-Source: AGHT+IHtNFCR173u9LjNnxCJ8MwOIIla9Ptsuwn6OYk5gXsHEzJAWQqQpBcBnd0dMzsMxi2Jj4CSig==
X-Received: by 2002:a50:ee0b:0:b0:52e:1d58:a6ff with SMTP id g11-20020a50ee0b000000b0052e1d58a6ffmr1444100eds.35.1693984514369;
        Wed, 06 Sep 2023 00:15:14 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id w16-20020a056402269000b0052e1959db1csm4011232edd.20.2023.09.06.00.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:15:13 -0700 (PDT)
Message-ID: <c085d93b-2759-47ac-b21b-aac0b924349b@linaro.org>
Date: Wed, 6 Sep 2023 08:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/41] mtd: spi-nor: move the .id and .id_len into an
 own structure
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-13-291a0f39f8d8@kernel.org>
 <4cbc9c03-7b47-48e9-8a91-f08c44284579@linaro.org>
 <bbf76bffaa699b2a8f4f9e33809dea06@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <bbf76bffaa699b2a8f4f9e33809dea06@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_001518_265329_01408F23 
X-CRM114-Status: GOOD (  23.94  )
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

CgpPbiA5LzYvMjMgMDg6MTMsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMy0wOS0wNiAw
ODoxMiwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+PiBPbiA4LzIyLzIzIDA4OjA5LCBNaWNoYWVs
IFdhbGxlIHdyb3RlOgo+Pj4gQ3JlYXRlIGEgbmV3IHN0cnVjdHVyZSB0byBob2xkIGEgZmxhc2gg
SUQgYW5kIGl0cyBsZW5ndGguIFRoZSBnb2FsIGlzIHRvCj4+PiBoYXZlIGEgbmV3IG1hY3JvIFNO
T1JfSUQoKSB3aGljaCBjYW4gaGF2ZSBhIGZsZXhpYmxlIGlkIGxlbmd0aC4gVGhpcyB3YXkKPj4+
IHdlIGNhbiBnZXQgcmlkIG9mIGFsbCB0aGUgaW5kaXZpZHVhbCBJTkZPeCgpIG1hY3Jvcy4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4KPj4+
IC0tLQo+Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuY8KgwqDCoMKgwqAgfMKgIDYgKysr
LS0tCj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5owqDCoMKgwqDCoCB8IDMzICsrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL21p
Y3Jvbi1zdC5jIHzCoCA0ICsrLS0KPj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5j
wqAgfMKgIDQgKystLQo+Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL3N5c2ZzLmPCoMKgwqDCoCB8
wqAgNiArKystLS0KPj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmPCoMKgIHzCoCAx
IC0KPj4+IMKgNiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4gaW5kZXggNGJhMTc3OGVkYTRiLi44MGMzNDBjNzg2
M2EgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4gKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4+IEBAIC0yMDI4LDggKzIwMjgsOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8KPj4+ICpzcGlfbm9yX21hdGNoX2lkKHN0cnVjdCBz
cGlfbm9yICpub3IsCj4+PiDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShtYW51
ZmFjdHVyZXJzKTsgaSsrKSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBt
YW51ZmFjdHVyZXJzW2ldLT5ucGFydHM7IGorKykgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHBhcnQgPSAmbWFudWZhY3R1cmVyc1tpXS0+cGFydHNbal07Cj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAocGFydC0+aWRfbGVuICYmCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICFtZW1jbXAocGFydC0+aWQsIGlkLCBwYXJ0LT5pZF9sZW4pKSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocGFydC0+aWQgJiYKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIW1lbWNtcChwYXJ0LT5pZC0+Ynl0ZXMsIGlkLCBwYXJ0LT5pZC0+bGVu
KSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5tYW51ZmFjdHVy
ZXIgPSBtYW51ZmFjdHVyZXJzW2ldOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHBhcnQ7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gQEAgLTMz
NzAsNyArMzM3MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbwo+Pj4gKnNwaV9u
b3JfZ2V0X2ZsYXNoX2luZm8oc3RydWN0IHNwaV9ub3IgKm5vciwKPj4+IMKgwqDCoMKgwqAgKiBJ
ZiBjYWxsZXIgaGFzIHNwZWNpZmllZCBuYW1lIG9mIGZsYXNoIG1vZGVsIHRoYXQgY2FuIG5vcm1h
bGx5IGJlCj4+PiDCoMKgwqDCoMKgICogZGV0ZWN0ZWQgdXNpbmcgSkVERUMsIGxldCdzIHZlcmlm
eSBpdC4KPj4+IMKgwqDCoMKgwqAgKi8KPj4+IC3CoMKgwqAgaWYgKG5hbWUgJiYgaW5mby0+aWRf
bGVuKSB7Cj4+PiArwqDCoMKgIGlmIChuYW1lICYmIGluZm8tPmlkKSB7Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvICpqaW5mbzsKPj4+Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgIGppbmZvID0gc3BpX25vcl9kZXRlY3Qobm9yKTsKPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuaCBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oCj4+PiBp
bmRleCBjNDJiNjU2MjNkYTcuLjgxNTM1ZjMxOTA3ZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5oCj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaAo+
Pj4gQEAgLTQ0NiwxMiArNDQ2LDIyIEBAIHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyB7Cj4+PiDCoMKg
wqDCoCBpbnQgKCpsYXRlX2luaXQpKHN0cnVjdCBzcGlfbm9yICpub3IpOwo+Pj4gwqB9Owo+Pj4K
Pj4+ICsvKioKPj4+ICsgKiBzdHJ1Y3Qgc3BpX25vcl9pZCAtIFNQSSBOT1IgZmxhc2ggSUQuCj4+
PiArICoKPj4+ICsgKiBAYnl0ZXM6IHRoZSBmbGFzaCdzIElEIGJ5dGVzLiBUaGUgZmlyc3QgdGhy
ZWUgYnl0ZXMgYXJlIHRoZSBKRURJQwo+Pj4gSUQuCj4+Cj4+IHR5cG8sIEpFRElDLiBCdXQgYXJl
IHRoZXJlIDMgYnl0ZXMgb2YgSUQgc3BlY2lmaWVkIGJ5IEpFREVDPyBJIHJlbWViZXIKPj4gdGhl
cmUncyBvbmx5IHRoZSBNRlIgSUQgc3BlY2lmaWVkLCB0aGUgcmVzdCBhcmUgZmxhc2ggc3BlY2lm
aWMsIHdoaWNoCj4+IGFyZSBub3QgbWVudGlvbmVkIGJ5IEpFREVDLgo+IAo+IEkganVzdCBtb3Zl
ZCB0aGUgZGVzY3JpcHRpb24gZnJvbSBmbGFzaF9pbmZvIDpwCj4gCj4gQXMgZmFyIGFzIEkga25v
dywgdGhpcyBpc24ndCByZWFsbHkgc3BlY2lmaWVkIGF0IGFsbCwgaXMgaXQ/IEkgY291bGRuJ3QK
PiBldmVuIGZpbmQgdGhhdCB0aGUgInJlYWQgamVkZWMgaWQiIGNvbW1hbmQgOUYgaXMgc3BlY2lm
aWVkIGFueXdoZXJlLiBEbwo+IHlvdSBrbm93IG1vcmU/CgppdCdzIG5vdCBwYXJ0IG9mIGplc2Qy
MTUgYXMgZmFyIGFzIEkgcmVtZW1iZXIsIGluZGVlZC4KPiAKPiBBbHNvIHRoZSBmaXJzdCB0aHJl
ZSBieXRlcyBpcyBhbHNvIHdyb25nLiBJdCBtaWdodCBiZSBtb3JlIG9yIGxlc3MuIEknZAo+IHRy
ZWF0IGl0IGFzIG9wYXF1ZSAtIHRoZSBTTk9SX0lEKCkgY2FuIG5vdyBoYXZlIGFuIGFyYml0cmFy
eSBsZW5ndGggLQo+IGJ1dCBJIHdvdWxkIG1lbnRpb24gdGhhdCB0aGlzICp0eXBpY2FsbHkqIGhh
cyB0aGUgZm9ybSBvZgo+IDwxIGJ5dGUgbWZyIGlkPiA8MiBieXRlIGZsYXNoIHBhcnQgaWQ+Cj4g
Cj4gSS5lLgo+IEBieXRlczogdGhlIGJ5dGVzIHJldHVybmVkIGJ5IHRoZSBmbGFzaCB3aGVuIGlz
c3VpbmcgY29tbWFuZCA5Ri4KPiDCoMKgwqDCoMKgwqDCoCBUeXBpY2FsbHksIHRoZSBmaXJzdCBi
eXRlIGlzIHRoZSBtYW51ZmFjdHVyZXIgSUQgY29kZSAoc2VlCj4gwqDCoMKgwqDCoMKgwqAgSkVQ
MTA2KSBhbmQgdGhlIG5leHQgdHdvIGJ5dGVzIGFyZSBhIGZsYXNoIHBhcnQgc3BlY2lmaWMgSUQu
Cj4gCgpzb3VuZHMgZ29vZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
