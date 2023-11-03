Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F00CC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ta8+1d+OrGJQ4nOQB+JF0poPmRROfE1PORPxPa7P5Is=; b=WCV58glGmvAR/e
	0X42TP8BLV2E6IAX39+36vke6nsCCuB0p4qAySYD7nGhreJtzhzjerszqIUYWh0Hli5f57K9QzA47
	Hgc9rsyuBkXILaIkUUSf9PsnU6s2sb2N5jkspPhodzmH6Je0HuGbmJSC48+D6pCYwcAfAP8IZiUcI
	+5G9pV2iOlKcn07cPO4q1ZWIWalXaBtEAJaNu/UWIXkdtnK8fJuU5SXodf2ebQy45nOPwtQtrpnn+
	huWwvpzjizuNxQt4bYnYvcDqqVyUK/+aJG5AXcZyVQrOwcjDwP+uQHgpT1BgOsq+dEw8aZ363vTYS
	bCDXKTs4L691QR7smOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvIy-00Bb1V-2p;
	Fri, 03 Nov 2023 14:37:48 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvIt-00Baz2-0B
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 14:37:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso327450766b.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Nov 2023 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699022257; x=1699627057; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6f26d3UvfXYl+Ewth8xadKQxaGl527f0g8DuDjKaQ9c=;
        b=Dl9zMWU2fJqzTEgLv1Jn603/3Ad3cIuYyErMN9zI0r9uLe1/PckNORv0nsTcNLiZqB
         gBLV5cD9KXSkUB2cpsVW5aIzZhLyR2OGvQ1fKw5W66hOjl/HB5q7wSJNX1HmZFZeZ7Gv
         iiYsgTGjzdr5i2YSKPCIXJNfPAXT68QR8BgYhU1wW8jJMCsZ2SKuhjApSOyfEsC+HByq
         8t/c9j5dFOysiTwiOgUzMM6sq6eMBhu9M30j/5G1T8SLF3lz1KTcvAjRShpEHH0mQOE3
         uyz9q7tGuSLtvbJv03qMHlb0PiCsplH+MgydXX5bbb/ELLqRfveGN6hurU3gvygJjB/m
         PmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699022257; x=1699627057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6f26d3UvfXYl+Ewth8xadKQxaGl527f0g8DuDjKaQ9c=;
        b=IEuRwpEuKcj+b3iCujKa8rV7UF0JJxv3xAfQhYNOv9mV50V++RzLSzwoD2xZCboonB
         gaYDMI8jCgN2MjKRkDNUzKU58hIkCk5FQwXLMUpxoYb3abg85/yeenm2QYNKwuX7cz1l
         BjHaos6J/t7Pcfc+gRtcJBlhNc5DhLmSbXbjckq9YPsW/ZD2JSh5OHI5UATWVtuEUshN
         dbpNaU/RatxrrlMoFlAE+U1M3CQu/TO6cGuKkdqs2lwo3JnWLbDZzeZe+yqPbR43SCGU
         ffAnTlOPxZr+onMzXBsxC8CZ7Apvr5lhsSGqMqFIEkjrd6xKK5INsZyCHDK/6tVQj2RI
         ZS2w==
X-Gm-Message-State: AOJu0YyYgnYj5UpyZSc4vn70LpFBaOcau3IbvgdDWYeM2bGQBhrH0zru
	0Qy4vdpXRpHY+ONYtidcTQAj8A==
X-Google-Smtp-Source: AGHT+IGCu7JPpF6JB8hNYPZLxrGKcoDEhOPljWzTQDwyS562awQX/nxdreZP3Xtc3UI6zhOgbF/8vg==
X-Received: by 2002:a17:907:9612:b0:9d4:2042:775b with SMTP id gb18-20020a170907961200b009d42042775bmr7596011ejc.30.1699022257534;
        Fri, 03 Nov 2023 07:37:37 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id gs10-20020a170906f18a00b009b65b2be80bsm974229ejb.76.2023.11.03.07.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 07:37:37 -0700 (PDT)
Message-ID: <5b3b8de5-b2fc-4c8f-a2d7-662748ce9213@linaro.org>
Date: Fri, 3 Nov 2023 16:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
 <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
 <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
 <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
 <c533a2af60f27d21c9c703b6cb34ff77@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <c533a2af60f27d21c9c703b6cb34ff77@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_073743_100139_1E0E06A7 
X-CRM114-Status: GOOD (  13.79  )
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

CgpPbiAwMy4xMS4yMDIzIDE2OjE2LCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IE9uIDAzLzExLzIw
MjMgMTA6NDgsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4+IFllcCwgaXQncyBzdHJhbmdlLCB3
ZSdsbCBoYXZlIHRvIGNoZWNrIHdoYXQncyBoYXBwZW5pbmcuIEkgZm91bmQgbXkKPj4gbjI1cTAw
IGZsYXNoLCBvbiBteSBzaWRlIGFsbCBpdHMgNCBkaWNlIGFyZSBlcmFzZWQgaW4gNSBzZWMuwqAg
U0ZEUAo+PiBkZWZpbmVzIGhvdyBsb25nIHRoZSBlcmFzZSBkaWUgc2hvdWxkIHRha2UsIHNlZSBC
RlBUIGR3b3JkIDExLiBZb3UgY2FuCj4+IHN0YXJ0IHdpdGggdGhhdC4KPiAKPiBXaGVyZSBkb2Vz
IEJGUFQgZHdvcmQgMTEgcmVzaWRlIGluc2lkZSBTRkRQPwoKQkZQVCBzdGFuZHMgZm9yIEJhc2lj
IEZsYXNoIFBhcmFtZXRlciBUYWJsZS4gQkZQVCBpcyB0aGUgZmlyc3QgdGFibGUgb2YKU0ZEUC4g
UGxlYXNlIGNvbXBhcmUgdGhlIHN0YW5kYXJkIHdpdGggdGhlIGR1bXAuIFdlIGhhdmVuJ3Qgd3Jp
dHRlbiB5ZXQKYW4gdXRpbGl0eSB0byBkZWNvZGUgdGhlIFNGRFAgZGF0YS4KPiAKPiB+IyBoZXhk
dW1wIC1DCj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvY0AwLzMwODAwMDAwLmJ1cy8zMGJiMDAw
MC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMC9zcGktbm9yL3NmZHAKPiAwMDAwMDAwMMKgIDUz
IDQ2IDQ0IDUwIDA2IDAxIDAxIGZmwqAgMDAgMDYgMDEgMTAgMzAgMDAgMDAgZmbCoAo+IHxTRkRQ
Li4uLi4uLi4wLi4ufAo+IDAwMDAwMDEwwqAgODQgMDAgMDEgMDIgODAgMDAgMDAgZmbCoCBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZsKgCj4gfC4uLi4uLi4uLi4uLi4uLi58Cj4gMDAwMDAwMjDCoCBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZsKgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmwqAKPiB8Li4u
Li4uLi4uLi4uLi4uLnwKPiAwMDAwMDAzMMKgIGU1IDIwIGZiIGZmIGZmIGZmIGZmIDNmwqAgMjkg
ZWIgMjcgNmIgMjcgM2IgMjcgYmLCoCB8Lgo+IC4uLi4uPykuJ2snOycufAo+IDAwMDAwMDQwwqAg
ZmYgZmYgZmYgZmYgZmYgZmYgMjcgYmLCoCBmZiBmZiAyOSBlYiAwYyAyMCAxMCBkOMKgCj4gfC4u
Li4uLicuLi4pLi4gLi58Cj4gMDAwMDAwNTDCoCAwZiA1MiAwMCAwMCAyNCA0YSA5OSAwMMKgIDhi
IDhlIDAzIGUxIGFjIDAxIDI3IDM4wqAKPiB8LlIuLiRKLi4uLi4uLi4nOHwKPiAwMDAwMDA2MMKg
IDdhIDc1IDdhIDc1IGZiIGJkIGQ1IDVjwqAgNGEgMGYgODIgZmYgODEgYmQgM2QgMzbCoAo+IHx6
dXp1Li4uXEouLi4uLj02fAo+IDAwMDAwMDcwwqAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZsKgCj4gfC4uLi4uLi4uLi4uLi4uLi58Cj4gMDAwMDAwODDC
oCBmZiBlNyBmZiBmZiAyMSBkYyBmZiBmZsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfC4uLi4hLi4ufAo+IDAwMDAwMDg4Cj4gCj4gRG8gd2UgbmVl
ZCBhIGZpeHVwIHRvIHRlbGwgdGhlIGVyYXNlIGRpZSB0byBiZSBmYXN0ZXI/Cgpuby4gV2UgY2Fu
IHJldHJpZXZlIHRoZSBlcmFzZSB0aW1lIGZyb20gQkZQVCBhbmQgdXNlIGl0IHRvIG5hcnJvdyB0
aGUKd2FpdCB0aW1lLgo+IAo+IEkgaGF2ZW4ndCBmb3VuZCB0aGUgJ0JGUFQnIHRlcm0gaW4gdGhl
IEpFREVDIHNwZWMuCj4gCj4+IHJlYWzCoMKgwqAgMG01LjQ4NXMKPj4gdXNlcsKgwqDCoCAwbTAu
MDAwcwo+PiBzeXPCoMKgwqAgMG01LjQ2MXMKPiAKPiBCZWZvcmUgZXJhc2luZywgZGlkIHRoZSBm
bGFzaCBjb250YWluIDEyOE1CIG9mIHJhbmRvbSBkYXRhIG9uIHlvdXIgdGVzdD8KCm5vdCBldmVy
eXdoZXJlCgo+IAo+IE9uIG15IHRlc3RzLCB3aGVuIHRoZSBmbGFzaCBjb250YWlucyAxMjhNQiBv
ZiByYW5kb20gZGF0YSwgdGhlIGZpcnN0IGVyYXNlCj4gdGFrZXMgNCBtaW51dGVzLiBTdWJzZXF1
ZW50IGVyYXNlcyB0YWtlIG9ubHkgMiBzZWNvbmRzLgo+IAoKSSBjb25maXJtIEkgc2VlIHRoZSBz
YW1lIGJlaGF2aW9yIG9uIG4yNXEwMCBmbGFzaC4KRXJhc2VkIDEzNDIxNzcyOCBieXRlcyBmcm9t
IGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaAoKcmVhbAkzbTQ5LjA4MnMKdXNlcgkwbTAuMDAw
cwpzeXMJM200OC40ODVzCgpJJ2xsIGNvbnRpbnVlIHRvIGludmVzdGlnYXRlIHRoaXMgYXQgYSBi
ZXN0IGVmZm9ydCByYXRlLCBleHBlY3QgZm9yIHNvbWUKZGVsYXlzLCBJJ20gaGFuZGxpbmcgU1BJ
IE5PUiBtb3N0bHkgaW4gbXkgc3BhcmUgdGltZS4gSGFwcHkgdG8gZ3VpZGUgeW91CnRob3VnaC4g
WW91IG1heSBqb2luICNtdGQgaXJjIGNoYW5uZWwgZm9yIHNob3J0IHF1ZXN0aW9ucywgc2VlIHdo
ZXJlIGl0CmlzIGluIHRoZSBNQUlOVEFJTkVSUyBmaWxlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
