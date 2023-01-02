Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EB6C46467
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 12:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzvSKZfPSQxoYeEOWNCLgzvuO9hNK2it2/y4J8JTjwo=; b=y5v0y1D9KyzaXn
	5ZuEzNW5Bip51UJ/QzgBr9Q5XZOKLlIT+tKi+U0zLCSD5hmqLC6EV9WKQ3F4sR5A7w+DLRxQadkEO
	Lgqje4jm0r/UrIWps8RhvhNcXOI8pFphZ3WqpoOr5fUKistcwS6jNsnLW+XfWJRobGHBGynlJ8koD
	EIQaOa6RZEkPnXUJx0q0PeQirFSq4AjFcjYdiX2wiMaTZTG7kIJEJxpUNeOfO5eXzdn6i+GaQRnop
	pQwGfe0DBvmzIifSigCfhKkjxMwiPWoszXNRHOlUcGtP4d59xpCJySuDuTQGfVHTjWd4LPt3tU8/i
	qveFkypMxD8kikcUAEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCJi2-00BAGv-6I; Mon, 02 Jan 2023 12:14:30 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCJek-00B8m7-Jd
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 12:11:08 +0000
Received: by mail-ed1-x534.google.com with SMTP id s5so39676394edc.12
        for <linux-mtd@lists.infradead.org>; Mon, 02 Jan 2023 04:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11NdqoQWvtMGVBH5+YEPkXuBY0lT6IFLrzJv1n1sPnE=;
        b=AO3QSnKZUCNrin6KCkWVd8Jr2r7Nu/jya+MCUKVa1tD+DS3R5MfhW3456aHMhQtkDQ
         B7Qn/2IVuIJOUadjcAm8fF1Ye6QqGskK967CV0XcVe56pKe7XiA+p9Mo9+D/mlez+Quc
         +cszJn/avxfC1ERzeey9Ry1upOtY+I5nfBKehunVnny20UhZ6Dit318Yw4HvTnWJIMsP
         2PurGEapYYoEb3eNgQ/qUL6Dxv2KyAKUuNcEvFG0cngKUM2mx17twk0utgOTU5fiVeZJ
         a9ItXG+gjM/m7D6zdNyoFolrt+btLiuv6hS4sSQOqBeusOP7z5V80gEJPjkq/KykCMRB
         jC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11NdqoQWvtMGVBH5+YEPkXuBY0lT6IFLrzJv1n1sPnE=;
        b=kLESAjs+TVz72GfHkvAEh7HZ50PNpFJfYZAV4vgj04qZoKd6MPhSaHBa3k/Xf2cqI3
         fv8CV7Aj4Yiynm+2/u6NX7V/56aXjVbRqDY2LFYnRUd84pqanCipQ3lSUH06EMQrT138
         pxhS3VhKDdct9TtZXLNdpO4TIUb4H5tYvFSFPifnPzEiu3b4RZ+zGom2yjP0Wz80muX3
         jId2gX3DFyiJtFS/CHnd+MuEwRvR4uMWByFm+o/HUH7sBjR1oaJXUGHo0+z+pQyKeHpS
         bMRP/ygbbp3ILyQ84hYHDwIZRt/nevbVIn/dAP/uWAzjS5GZhXTtyNLs1uhWBuEKq0sF
         7kMw==
X-Gm-Message-State: AFqh2kqaYsauRAG49RuKojEjsz68wneyh0hmuGhvXrL4vc7r+h61Tejm
	tN3D5pyDrGFRRKSSxXJDqMvNFPMja0DqHA9g
X-Google-Smtp-Source: AMrXdXudBKoxijSiMeNTK/zRwLLjFRAdMIjw+wuQUh3XfFI8ZV6BWdECXCN8vk4IEYwfjIK8Q9wN0g==
X-Received: by 2002:a05:6402:1298:b0:461:75f1:9254 with SMTP id w24-20020a056402129800b0046175f19254mr36983003edv.2.1672661461828;
        Mon, 02 Jan 2023 04:11:01 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.242])
        by smtp.gmail.com with ESMTPSA id bc2-20020a056402204200b00467481df198sm12579597edb.48.2023.01.02.04.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 04:11:01 -0800 (PST)
Message-ID: <1ee9cf77-1ca0-6e4e-ba7d-896838bd71de@linaro.org>
Date: Mon, 2 Jan 2023 14:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/8] spi: dt-bindings: Introduce spi-cs-setup-ns property
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Mark Brown <broonie@kernel.org>, tudor.ambarus@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 nicolas.ferre@microchip.com, robh+dt@kernel.org
References: <20221117105249.115649-2-tudor.ambarus@microchip.com>
 <20221118141458.954646-1-michael@walle.cc> <Y3elIdM3Xz1H4kKk@sirena.org.uk>
 <28da9e33-57e8-7ac1-7e6c-13c297a945d6@gmail.com>
 <a2f58ad34ba74ff135852bc1e24da4d6@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a2f58ad34ba74ff135852bc1e24da4d6@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_041106_706341_48CA0EAC 
X-CRM114-Status: GOOD (  23.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwMi4wMS4yMDIzIDEzOjQ4LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAoKSGksCgo+
IAo+IEFtIDIwMjMtMDEtMDIgMTA6MzcsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gSGksCj4+
Cj4+IE9uIDE4LjExLjIwMjIgMTc6MzAsIE1hcmsgQnJvd24gd3JvdGU6Cj4+PiBPbiBGcmksIE5v
diAxOCwgMjAyMiBhdCAwMzoxNDo1OFBNICswMTAwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4+
IEZyb206IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4KPj4+Cj4+
Pj4+ICvCoCBzcGktY3Mtc2V0dXAtbnM6Cj4+Pj4+ICvCoMKgwqAgZGVzY3JpcHRpb246Cj4+Pj4+
ICvCoMKgwqDCoMKgIERlbGF5IGluIG5hbm9zZWNvZHMgdG8gYmUgaW50cm9kdWNlZCBieSB0aGUg
Y29udHJvbGxlciBhZnRlciAKPj4+Pj4gQ1MgaXMKPj4+Pj4gK8KgwqDCoMKgwqAgYXNzZXJ0ZWQu
Cj4+Pgo+Pj4+IERvZXMgdGhpcyBuZWVkIGEgdHlwZSBhcyB0aGUgc3BpLWNzLXNldHVwLW5zIGlz
IGFwcGFyZW50bHkganVzdCAKPj4+PiAxNmJpdD8gQXQKPj4+PiBsZWFzdCB0aGUgZHJpdmVyIHVz
ZXMgaXQgdGhhdCB3YXkuCj4+Pgo+Pj4+IEJ1dCBJTUhPIHRoaXMgc2hvdWxkIGp1c3QgYmUgYSBu
b3JtYWwgdWludDMyIHZhbHVlIHRvIGJlIGNvbnNpc3RlbnQgCj4+Pj4gd2l0aAo+Pj4+IGFsbCB0
aGUgb3RoZXIgcHJvcGVydGllcy4gQWxzbyB0aGUgbWF4IHZhbHVlIHdpdGggMTZiaXQgd2lsbCBi
ZSAnanVzdCcKPj4+PiA2NXVzLgo+Pj4KPj4+IE1ha2luZyBpdCAzMiBiaXQgZG9lcyBzZWVtIHNh
ZmVyLsKgIEkndmUgYXBwbGllZCB0aGUgc2VyaWVzCj4+Cj4+IFRoYW5rcy4gVGhlcmUgYXJlIGZl
dyBpbXBsaWNhdGlvbnMgdG8gY29uc2lkZXIgYmVmb3JlIG1ha2luZyB0aGlzIHByb3AgYQo+PiB1
MzIsIGFuZCBJJ2QgbGlrZSB0byBjaGVjayB0aGVtIHdpdGggeW91Lgo+Pgo+PiBzdHJ1Y3Qgc3Bp
X2RlbGF5IHdpbGwgaGF2ZSB0byBiZSB1cGRhdGVkIHRvIGhhdmUgYSB1MzIgdmFsdWUsIG5vdyBp
dCdzIGEKPj4gdTE2LiBUaGlzIG1lYW5zIHRoYXQgd2UnbGwgaGF2ZSB0byB1cGRhdGUgc3BpX2Rl
bGF5X3RvX25zKCkgdG8gZWl0aGVyCj4+IHJldHVybiBhIHM2NCBvciB0byBhZGQgYSB1NjQgKmRl
bGF5IHBhcmFtZXRlciB0byB0aGUgZnVuY3Rpb24gc28gdGhhdCB3ZQo+PiBjYW4gc3RpbGwgaGFu
ZGxlIHRoZSBjb252ZXJzaW9ucyBmcm9tIHVzZWNzIGFuZCB0aGUgZXJyb3IgY29kZXMgaW4gdGhl
Cj4+IFNQSV9ERUxBWV9VTklUX1NDSyBjYXNlLiBUaGVuIGFsbCBpdHMgY2FsbGVycyBoYXZlIHRv
IGJlIHVwZGF0ZWQgdG8KPj4gY29uc2lkZXIgdGhlIHU2NCBkZWxheS4KPiAKPiBJIHdhcyB0YWxr
aW5nIGFib3V0IHRoZSBkZXZpY2UgdHJlZSBwcm9wZXJ0eS4gRXZlbiBpZiB0aGUgZHJpdmVyIGNv
bnRpbnVlCj4gdG8gdXNlIGp1c3QgMTZiaXQsIHRoZSBEVCBwcm9wZXJ0eSBjb3VsZCBiZSAzMmJp
dCBJTUhPLgoKYnV0IHRoZW4geW91J2xsIGhhdmUgYW4gaW1wbGljaXQgY2FzdCB0byB1MTYgYXQ6
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc3BpL3NwaS5jI24yMzE0CndoaWNoIHdpbGwgbWFrZSB0
aGUgdTMyIGR0IHByb3AgbWlzbGVhZGluZy4KCj4gCj4gQXQgdGhlIG1vbWVudCwgdGhlIHNjaGVt
YSBzYXlzIGl0cyAzMmJpdCAoaWYgSSdtIG5vdCBtaXN0YWtlbiwgYmVjYXVzZQo+IGl0IGRvZXNu
J3QgaGF2ZSBhIHR5cGUpLCBidXQgdGhlIGRyaXZlciB3aWxsIHBhcnNlIHRoZSBwcm9wZXJ0eSBh
cwo+IDE2Yml0IGFuZCB5b3VyIGRldmljZSB0cmVlIGFsc28gaGFzIHRoaXMgL2JpdHMvIHRoaW5n
eS4gU28gcmVnYXJkbGVzcwo+IGlmIHRoZSBkcml2ZXIgaXMgdXNpbmcgMTZiaXQgb3IgMzJiaXQg
Zm9yIHRoZSB2YWx1ZSwgdGhlcmUgc2VlbXMgdG8gYmUKPiBhIGRpc2NyZXBhbmN5IGJldHdlZW4g
dGhlIHNjaGVtYSBhbmQgdGhlIGRldmljZXRyZWUgKGFuZCBkcml2ZXIpLgoKb2theSwgdGhhbmtz
IGZvciBwb2ludGluZyBpdCBvdXQuIExldCdzIGRlY2lkZSBob3cgd2UgZml4IHRoaXMuCgo+IAo+
IEFsbCBvdGhlciBwcm9wZXJ0aWVzIGFyZSBqdXN0IHRoZSByZWd1bGFyIDMyYml0IHZhbHVlcywg
dGh1cyBJIHdhcwo+IHN1Z2dlc3RpbmcgdG8gY2hhbmdlIHRoZSBEVCBwcm9wZXJ0eSB0byAzMmJp
dC4KCklmIHdlIHdhbnQgdG8gY2hhbmdlIHRoZSBkdCBwcm9wIHRvIDMyYml0IEkgdGhpbmsgd2Ug
c2hvdWxkIGFsc28gaGFuZGxlCnRoZSBwYXJzZWQgdmFsdWUgYXMgdTMyLCBub3QgYXMgdTE2LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
