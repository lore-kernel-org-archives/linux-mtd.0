Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5966C76195
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJUarMWZy3i1zjs+otSJj9Apl4Da1h591iklDy3WsTM=; b=rNRfkAIgOoc+Eo
	l1ABTjpgNBJkktsdPh7b1BN0M5a8pwDK00Okxgug8shmbIzoN3GmzFad7KZWGEVFBj2rvNQTkkFic
	GwaYwuE/13hjnLLGk3yjivmzH4gfKEpGPufZAR6U8uO78DeJj417oIS9l+4MTo34rs2xt1QpNrYlx
	79JaraDC6sfH+LkLjc57E/L6+EcXLyPIyCZBiH9+K/kfhonKTDLKMirmcNJPRx2rLKUqIZxW+puSG
	GC0V2PwSjeDBen/1i1gZ1KLWOHJSpMkS/q8Rqe/Rvrpzq6nmWqvhYVq0aH7W4zuB+oxkipQi6IZQy
	86KXlfjOs9uErcvP3DSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5l4-00DltY-27;
	Tue, 28 Mar 2023 09:36:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5l0-00Dlrb-1J
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 09:36:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l27so11451697wrb.2
        for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2023 02:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679996202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQV5jAujDsjlmJ7i4zzoeSJ8msTMIxUMBP2P8RrksF8=;
        b=Mig5vyIslkZvEXRrGtnwNDJ79tHpngfDxYk99Sqqz63WsvDJV6ZCXlLQWmKNLfO8H8
         2FFB/dIPxmrnuorZKOlXk168FTqEzjMfV2cYS/GntQADcvY2y50Su0U+3+zBlPzeQRoH
         B3LwTgwGUSoekmwy9sWGdWUvU0QrIYCdAV3hAen5URjiP1YLl4lnrS8RpYe3TBR+xfkk
         GjXj+EZJH6xAr1nNQDpgzzHa/3fhOBI55ZEsFA5MONcVQs1XA7IGDwbzJUtlBXeYf16B
         BFHQcmXCO0zxSpGBxmsEK2vWjevflJAX/amSeJlJ4L047/GZgTuuPAnRuNRg13LcwONs
         k4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679996202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQV5jAujDsjlmJ7i4zzoeSJ8msTMIxUMBP2P8RrksF8=;
        b=qCqPRbD2BzoS1/Qlej9MHax8ebWH847Z4biu1HYxD8UJUa5YHC7atdLl1p5v14r8sV
         bTcGg4K8iSOOzMNHvfL4eT8mz492YfZ5lDYT1HN65gA0lTjpEooqG+5jwN5lpMfFcdOi
         vlnX51cgQ0/fPMwso0KpIdyq+HuFF3ht4JTtm7z7O0DDvwSM4q/+s8QevNj12ePDdVxK
         PqIVOp+qcC9rgtJlveQVvRJnXK+wjx0kv4swkZl+vulCjr+QBWESroRCjmrYLDSZn4y0
         zfyqAXdEJmlk/Q4CE/awjm4kFYoOUve/aViVE5fBoB92G5NwaOlRYyuLpTpTpy39FE6D
         1daQ==
X-Gm-Message-State: AAQBX9f7QmlFYOh8PHUPRkHi6s4jaFfxyAlura73hE7kKQ8TlDIAGQSm
	CvWqFWolMAdjAruArhiJMlsNSA==
X-Google-Smtp-Source: AKy350a+LASx+WRjrECQYarn1n17idhSsDraP6ddv/ReLQYmMPK4bvDvhWHQ4zmmyRarSWf+n10QFg==
X-Received: by 2002:adf:f78b:0:b0:2ce:aed4:7f22 with SMTP id q11-20020adff78b000000b002ceaed47f22mr12920141wrp.50.1679996202349;
        Tue, 28 Mar 2023 02:36:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id n12-20020adfe34c000000b002da75c5e143sm14794062wrj.29.2023.03.28.02.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 02:36:42 -0700 (PDT)
Message-ID: <4b8b629b-62f8-8e0d-5de2-9020a955f0e2@linaro.org>
Date: Tue, 28 Mar 2023 10:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/8] ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI
 NOR flash at its maximum frequency
Content-Language: en-US
To: Nicolas Ferre <nicolas.ferre@microchip.com>, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org
References: <20221117105249.115649-1-tudor.ambarus@microchip.com>
 <20221117105249.115649-6-tudor.ambarus@microchip.com>
 <a6fe77b6-4ff4-3c91-0c67-a9da5a638e7b@microchip.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a6fe77b6-4ff4-3c91-0c67-a9da5a638e7b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_023646_446153_64BF0CFD 
X-CRM114-Status: GOOD (  22.19  )
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

CgpPbiAzLzI4LzIzIDA5OjUxLCBOaWNvbGFzIEZlcnJlIHdyb3RlOgo+IEhpIFR1ZG9yLAoKSGkh
Cgo+IAo+IE9uIDE3LzExLzIwMjIgYXQgMTE6NTIsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+IHNh
bWE1ZDI3LXdsc29tMSBwb3B1bGF0ZXMgYW4gc3N0MjZ2ZjA2NGIgU1BJIE5PUiBmbGFzaC4gSXRz
IG1heGltdW0KPj4gb3BlcmF0aW5nIGZyZXF1ZW5jeSBmb3IgMi43LTMuNlYgaXMgMTA0IE1Iei4g
QXMgdGhlIGZsYXNoIGlzIG9wZXJhdGVkCj4+IGF0IDMuM1YsIGluY3JlYXNlIGl0cyBtYXhpbXVt
IHN1cHBvcnRlZCBmcmVxdWVuY3kgdG8gMTA0TUh6LiBUaGUKPj4gaW5jcmVhc2luZyBvZiB0aGUg
c3BpLW1heC1mcmVxdWVuY3kgdmFsdWUgcmVxdWlyZXMgdGhlIHNldHRpbmcgb2YgdGhlCj4+ICJD
RSMgTm90IEFjdGl2ZSBIb2xkIFRpbWUiLCB0aHVzIHNldCB0aGUgc3BpLWNzLXNldHVwLW5zIHRv
IGEgdmFsdWUgb2YgNy4KPj4KPj4gVGhlIHNzdDI2dmYwNjRiIGRhdGFzaGVldCBzcGVjaWZpZXMg
anVzdCBhIG1pbmltdW0gdmFsdWUgZm9yIHRoZQo+PiAiQ0UjIE5vdCBBY3RpdmUgSG9sZCBUaW1l
IiBhbmQgaXQgYWR2ZXJ0aXNlcyBpdCB0byA1IG5zLiBUaGVyZSdzIG5vCj4+IG1heGltdW0gdGlt
ZSBzcGVjaWZpZWQuIEkgZGV0ZXJtaW5lZCBleHBlcmltZW50YWxseSB0aGF0IDUgbnMgZm9yIHRo
ZQo+PiBzcGktY3Mtc2V0dXAtbnMgaXMgbm90IGVub3VnaCB3aGVuIHRoZSBmbGFzaCBpcyBvcGVy
YXRlZCBjbG9zZSB0byBpdHMKPj4gbWF4aW11bSBmcmVxdWVuY3kgYW5kIHRlc3RzIHNob3dlZCB0
aGF0IDcgbnMgaXMganVzdCBmaW5lLCBzbyBzZXQgdGhlCj4+IHNwaS1jcy1zZXR1cC1ucyBkdCBw
cm9wZXJ0eSB0byA3Lgo+Pgo+PiBXaXRoIHRoZSBpbmNyZWFzZSBvZiBmcmVxdWVuY3kgdGhlIHJl
YWRzIGFyZSBub3cgZmFzdGVyIHdpdGggfjM3JS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVHVkb3Ig
QW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9h
cm0vYm9vdC9kdHMvYXQ5MS1zYW1hNWQyN193bHNvbTEuZHRzaSB8IDMgKystCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtYTVkMjdfd2xzb20xLmR0c2kKPj4gYi9hcmNo
L2FybS9ib290L2R0cy9hdDkxLXNhbWE1ZDI3X3dsc29tMS5kdHNpCj4+IGluZGV4IDgzYmNmOWZl
MDE1Mi4uMjBjYWY0MGI0NzU1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hdDkx
LXNhbWE1ZDI3X3dsc29tMS5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2Ft
YTVkMjdfd2xzb20xLmR0c2kKPj4gQEAgLTIyMCw3ICsyMjAsOCBAQCBxc3BpMV9mbGFzaDogZmxh
c2hAMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwxPjsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MD47Cj4+IC3CoMKgwqDCoMKgwqDCoCBzcGktbWF4LWZyZXF1ZW5jeSA9
IDw4MDAwMDAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCBzcGktbWF4LWZyZXF1ZW5jeSA9IDwxMDQw
MDAwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqAgc3BpLWNzLXNldHVwLW5zID0gL2JpdHMvIDE2IDw3
PjsKPiAKPiBGb2xsb3dpbmcgdGhlIGRpZmZlcmVudCBjaGFuZ2VzIHRoYXQgaGFwcGVuZWQgdG8g
dGhpcyBwcm9wZXJ0eSBhZnRlcgo+IHRoaXMgcG9zdCwgYW0gSSByaWdodCBzYXlpbmcgdGhhdCB0
aGlzIG11c3Qgbm93IGJlIGNoYW5nZWQgdG86Cj4gCj4gc3BpLWNzLXNldHVwLWRlbGF5LW5zID0g
PDc+Owo+IAo+ID8KPiAKClllcywgdGhhdCBzaG91bGQgZG8gaXQuIEknbSBhbWVuZGluZyB0aGUg
c2VyaWVzIHJpZ2h0IG5vdy4gQ2FuIHlvdSBkbyBhCmxpdHRsZSB0ZXN0IG9uIHlvdXIgc2lkZSBz
byB0aGF0IHdlIG1ha2Ugc3VyZSBldmVyeXRoaW5nIGlzIGluIHBsYWNlPwpBZnRlciB0aGUgdXBk
YXRlLCBzb21ldGhpbmcgbGlrZSB0aGF0IHNob3VsZCBiZSBydW4gb24gYW55IGJvYXJkIChtYXli
ZQp3bHNvbTEtZWs/KToKIyEvYmluL3NoCgpkZCBpZj0vZGV2L3VyYW5kb20gb2Y9Li9xc3BpX3Rl
c3QgYnM9MU0gY291bnQ9NgptdGRfZGVidWcgd3JpdGUgL2Rldi9tdGQ1IDAgNjI5MTQ1NiBxc3Bp
X3Rlc3QKbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRkNSAwIDYyOTE0NTYKbXRkX2RlYnVnIHJlYWQg
L2Rldi9tdGQ1IDAgNjI5MTQ1NiBxc3BpX3JlYWQKaGV4ZHVtcCBxc3BpX3JlYWQKbXRkX2RlYnVn
IHdyaXRlIC9kZXYvbXRkNSAwIDYyOTE0NTYgcXNwaV90ZXN0Cm10ZF9kZWJ1ZyByZWFkIC9kZXYv
bXRkNSAwIDYyOTE0NTYgcXNwaV9yZWFkCnNoYTFzdW0gcXNwaV90ZXN0IHFzcGlfcmVhZAoKYnJi
LAp0YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
