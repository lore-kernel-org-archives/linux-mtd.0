Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286DCCD5BD4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpi9ZNjHWIsprSWv7xEw4NEo1eCyvt5qi7/j08Ul5dI=; b=3LlzIMMG3Q+gtJ
	zEYL85ZuufkRYHmno6qAHGrRs+fFOXjIMIXag0LySGR5ZQpaNawsYnRRScXFlrVz7qXirQp/B+eyM
	hOVfq2zNEZ7U37eQ5CDOKabJPo318f6QpF5Toivv/HJPrR5GWuFnckP4aVf0maywI6H54YuNCPrYT
	idQEITZXTKVPNpO3zvOQOoZE8KE2vEMd+sUF19pt3fBjOsWGp/MxU3+VJeVMi0iDvx2RXTlu++7nU
	dyTyD6szkkHwNJlG90SBlUo+bvR/03Zp0N/s6KNFJo50p5d/k0hhaVyg5nYKx6x0JUk2puB+H64wZ
	nzo7P5WjRCg6JOmxxcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDtH-005Lpb-0b;
	Thu, 21 Sep 2023 07:14:23 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDtD-005LoX-14
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 07:14:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9ae22bf33a0so387971966b.0
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 00:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695280455; x=1695885255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGHsvsX08TcwuScXtL9d823K582K+A8pTes6z002G9o=;
        b=zuNVv0AeFEaLJ0MF7pyhtAEPaMylVyc7XO7g21xI7PSeCbXEttEregreg/iEA3PAAm
         op750+bCADKIBUsZFWGvmCKvGl4cdiSb969jRkRzzYMyhjZX/IFjACaxhJqpE3Muf04m
         /hqosE914lNalnOCowLtjfWR02g60BC6VP6PX/mSiBuV9TLoXvOmesRl7QpGvzIXoCaX
         kgS7eiWsxbGF4daLuT6U4qmxQFPO2AFCAwpiSv9Wnxs8t9mp7GbmsuHpIEsARLEczqks
         84JPP5Iy3fz51mwWXQ8C21LTMl7P7OBI4r9wAPrguAKvVTvrbJJEBuj9pzySFcv/XkXB
         Cdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695280455; x=1695885255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGHsvsX08TcwuScXtL9d823K582K+A8pTes6z002G9o=;
        b=V4gyC7p3a3ttDSL/jhrpoF/YVh56GSTWruoVS1Xst2Xl3fH2wzEDQkcdnPF80xRn21
         NTGpq0p9oIY2YVraHbAZpEESw/C4Wl/Hqx8ilf7NqXq69UbwvAk9lpOQm2CCDgoLfR1m
         awEFcUrf15b+VlSphTm1dh6hOyThBNHrin12J7/kUZiY1qXVtUUCAL4VuKXAe3/Un20X
         Psl1dVX0eSsiVROdNQyFJit9sZYRQO1L+F7YcHMhpU4/VzAlh0Dey3PPPVnR50pkI077
         ohAPGspAVmyIGNm9vzu/6MqjQER/qb7l7e9F/q3ABV1r7MhBs3TKQvzpc3j4dqGRScR4
         odRg==
X-Gm-Message-State: AOJu0Ywq+RHUkQDnzlYAsjIEiEsiRhsB2de1igPmebbeoAL1OPG0kJSp
	HyaN3e5E36JAv+mQW3KIqY+7aw==
X-Google-Smtp-Source: AGHT+IF2TRjwqnLhdXNpxqFt3WvhnwZVkscmmf5f8IQZwt6L4LXUKhzrb6S1Q+KTlxJ6x4jj+3Y72Q==
X-Received: by 2002:a17:907:3f8c:b0:9ad:f17a:c712 with SMTP id hr12-20020a1709073f8c00b009adf17ac712mr12276955ejc.25.1695280455612;
        Thu, 21 Sep 2023 00:14:15 -0700 (PDT)
Received: from [172.20.34.61] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id u12-20020a1709064acc00b009a1e73f2b4bsm598440ejt.48.2023.09.21.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 00:14:15 -0700 (PDT)
Message-ID: <306a6aa0-c608-418a-a591-6f8aa95817fb@linaro.org>
Date: Thu, 21 Sep 2023 08:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: atmel: add at25ff321a entry
To: Nicolas Ferre <nicolas.ferre@microchip.com>, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230908151400.164470-1-nicolas.ferre@microchip.com>
 <8d72820d-bbaa-abc8-4448-87f0f054c381@linaro.org>
 <4c9b0dff-6350-376b-60ac-c36f98378a51@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <4c9b0dff-6350-376b-60ac-c36f98378a51@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_001419_377312_B7E99A01 
X-CRM114-Status: GOOD (  25.11  )
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

CgpPbiA5LzIwLzIzIDE3OjE2LCBOaWNvbGFzIEZlcnJlIHdyb3RlOgo+IE9uIDE5LzA5LzIwMjMg
YXQgMTg6MTIsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+IE9uIDA4LjA5LjIwMjMgMTg6MTQsIG5p
Y29sYXMuZmVycmVAbWljcm9jaGlwLmNvbSB3cm90ZToKPj4+IEZyb206IE5pY29sYXMgRmVycmUg
PG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4KPj4+Cj4+PiBBZGQgdGhlIGF0MjVmZjMyMWEg
NE1CIFNQSSBmbGFzaCB3aGljaCBpcyBhYmxlIHRvIHByb3ZpZGUKPj4+IFNGRFAgaW5mb3JtYXRp
b25zLgo+Pj4gRGF0YXNoZWV0Ogo+Pj4gaHR0cHM6Ly93d3cucmVuZXNhcy5jb20vdXMvZW4vZG9j
dW1lbnQvZHN0L2F0MjVmZjMyMWEtZGF0YXNoZWV0Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTmlj
b2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgo+Pj4gLS0tCj4gCj4gWy4u
XQo+IAo+Pj4gwqAgZHJpdmVycy9tdGQvc3BpLW5vci9hdG1lbC5jIHwgNCArKysrCj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvYXRtZWwuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYwo+Pj4g
aW5kZXggNTg5NjhjMWU3ZDJmLi5jOTRkNTI5NTE0ODEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJz
L210ZC9zcGktbm9yL2F0bWVsLmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwu
Ywo+Pj4gQEAgLTE4NCw2ICsxODQsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZv
IGF0bWVsX25vcl9wYXJ0c1tdCj4+PiA9IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgRkxBR1MoU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfU1dQX0lTX1ZPTEFUSUxFKQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEspCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmYXRtZWxfbm9yX2dsb2JhbF9w
cm90ZWN0aW9uX2ZpeHVwcyB9LAo+Pj4gK8KgwqDCoMKgIHsgImF0MjVmZjMyMWEiLCBJTkZPKDB4
MWY0NzA4LCAwLCA2NCAqIDEwMjQswqAgNjQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEZMQUdTKFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX1NXUF9JU19WT0xBVElMRSkKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFSU0VfU0ZEUAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuZml4dXBzID0gJmF0bWVsX25vcl9nbG9iYWxfcHJvdGVjdGlvbl9maXh1cHMgfSwK
Pj4KPj4gV2UgaGF2ZSByZWNlbnRseSBjaGFuZ2VkIGhvdyB0aGUgZmxhc2ggZW50cmllcyBhcmUg
ZGVmaW5lZC4gV291bGQgeW91Cj4+IHBsZWFzZSB0cnkgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIGlu
c3RlYWQ/Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMKPj4gaW5kZXggOTVmMGUxMzkyODRlLi40NDIxODcx
NmQ4MWUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYwo+PiArKysg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMKPj4gQEAgLTIxMyw2ICsyMTMsMTIgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGF0bWVsX25vcl9wYXJ0c1tdID0gewo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLIHwg
U1BJX05PUl9TV1BfSVNfVk9MQVRJTEUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLmZpeHVwcyA9ICZhdG1lbF9ub3JfZ2xvYmFsX3Byb3RlY3Rpb25fZml4dXBzCj4+
ICvCoMKgwqDCoMKgwqAgfSwgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuaWQg
PSBTTk9SX0lEKDB4MWYsIDB4NDcsIDB4MDgpLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAubmFtZSA9ICJhdDI1ZmYzMjFhIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfU1dQX0lTX1ZPTEFUSUxFLAo+
IAo+IEhlcmUsIEkgYWRkZWQ6Cj4gCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubm9f
c2ZkcF9mbGFncyA9IFNFQ1RfNEssCj4gCj4gdG8gbWF0Y2ggdGhlIG90aGVyIGRldmljZXMgb2Yg
dGhlIGZhbWlseS4uLiBJIGNoZWNrZWQgb24gdGhlIGRhdGFzaGVldCwKPiA0SyBzZWN0b3JzIGFy
ZSBva2F5LCBidXQgSSBkb24ndCBrbm93IGV4YWN0bHkgaWYgdGhpcyBpcyBlbGlnaWJsZSB0byB0
aGUKPiAibm9fc2ZkYl9mbGFncyIgcHJvcGVydHkuLi4gZm9yZ2l2ZSBtZSwgSSBkaWRuJ3QgY2hl
Y2sgZnVydGhlciBrbm93aW5nCj4gdGhhdCB5b3UgbWlnaHQgaGF2ZSBiZXR0ZXIgdmlldyBvbiB0
aGlzIHRoYW4gbWUgOy0pCgp5ZWFoLCBubyB3b3JyaWVzLiBZb3Ugc2hvdWxkIG5vdCBzcGVjaWZ5
IDRrIGhlcmUsIGFzIGl0IHNob3VsZCBhbHJlYWR5CmJlIHNldCB3aGVuIHBhcnNpbmcgU0ZEUC4g
WW91IGNhbiB1c2UgbXRkaW5mbyAvZGV2L210ZHggdG8gY2hlY2sgd2hhdAplcmFzZSBzaXplIGdl
dHMgc2V0LiBJbiB0aGUgY29yZSB3ZSBzZXQgdGhlIG1heGltdW0gc3VwcG9ydGVkIGVyYXNlIHNp
emUKZm9yIHNwZWVkIGNvbnNpZGVyYXRpb25zIGFuZCBtYWtpbmcgdWJpZnMgaGFwcHksIHNvIHlv
dSdsbCBwcm9iYWJseSBzZWUKNjRrIHdoZW4gY2hlY2tpbmcgd2l0aCBtdGRpbmZvLiBCdXQgeW91
IGNhbiB0cnkgNGsgZXJhc2VzIGFzIHdlbGwgYnkKc2V0dGluZyBNVERfU1BJX05PUl9VU0VfNEtf
U0VDVE9SUy4KCj4gCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAm
YXRtZWxfbm9yX2dsb2JhbF9wcm90ZWN0aW9uX2ZpeHVwcwo+PiArwqDCoMKgwqDCoMKgIH0sIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoCB9LCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC5pZCA9IFNOT1JfSUQoMHgxZiwgMHg0OCwgMHgwMCksCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5uYW1lID0gImF0MjVkZjY0MSIsCj4gCj4gVGhhdCB3b3JrcyBwZXJm
ZWN0bHkgd2VsbCAoSSBjYW4gcmUtcG9zdCB0aGUgdGVzdCByZXN1bHRzIGFzIG15IHByZXZpb3Vz
Cj4gcGF0Y2ggaWYgbmVlZGVkKTogZG8geW91IHdhbnQgbWUgdG8gc2VuZCB0aGUgdXBkYXRlZCBw
YXRjaCB3aXRoIHlvdXIKPiBTdWdnZXN0ZWQtYnkgdGFnIG9yIHlvdSBjYW4gc2VuZCB5b3Vycywg
dGVsbCBtZSB3aGF0IHlvdSBwcmVmZXIuCgpTZW5kIGEgbmV3IHBhdGNoIHBsZWFzZSwgaXQgd2Fz
IGp1c3QgYSBzdWdnZXN0aW9uIHRvIHNwZWVkIHRoZSB0aGluZ3MgdXAuCj4gCj4gVGhhbmtzIGZv
ciB0aGUgaGVhZHMtdXAgb24gdGhpcyB1cGRhdGUgdGhhdCBJIGhhZG4ndCBub3RpY2VkLiBCZXN0
IHJlZ2FyZHMsCj4gwqAgTmljb2xhcwo+IAp5b3UncmUgd2VsY29tZSEgQ2hlZXJzIQp0YQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
