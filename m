Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA7BC5B552
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jun 2025 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ta1H/Y4ZdIx+Z0Nu1KCdWeBkSSfUnTtUo0NLRr3+QPo=; b=C0f8TFooJFWBDv
	VHHPtcZrBXpaXGbgqUTQlukiCjoFJ40lHaKUYGPRU2eXgjses0r6/Aekr5sC85wUrp0W+/9kDfGzf
	cVOPNZafZLjjCPZG2E57Cfx3I9yj4A5tR0ZdPVkNEX73o0oOdr3SwE2dIkxEEJ9JmzISVHGNp9Xq0
	oh8c/qh4lIz+W4IixLy4nJy3M64jEKKyPSGJqYdZ8JiF53eu/wT3GwLOSeC76sF54yp92Rdmka+pf
	0Cxpm/ruZYVWtsqeBkujW8iKSW2xZPTiLMql3DJ9HFSWDMDew7zsUvdRNhp6unu1RxdfW3bXWfy9O
	NhKlDUDARWRSVl9y5NDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsl3-00000005xaF-0AKb;
	Tue, 10 Jun 2025 06:46:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsl0-00000005xZv-0eba
	for linux-mtd@lists.infradead.org;
	Tue, 10 Jun 2025 06:46:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4202646f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 23:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749538009; x=1750142809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vqSpB1VYji66UrxWEnr+KyQ/qcgfaOfilY2jfXTNHuw=;
        b=KE1fo7pwt0zqq64Qm8DYnt+0Jtc+rIFBDBzmM2qHN3HV5ZBI3qLAiTJQlhAyLnWZmn
         QeXqMDTIu/j1Lt0lJa04KXaBhicpTCuvucBYqZoL+0LzlYqd15OAf1G9fPkSD++0eTbw
         xwsjc+toFEVOMTIHcUcL3PgD5kf96kxkhbxoF4/I1ZmsS26mynKz9E4Bl4MYv7Wshyad
         tnPkdwywMKAhNPQaAgvNqpGurDBAsoDmqhrBB8hrs4V+63jz4DNNYgW8GT5vD1XLzsM0
         sASypoC9Xg4a89Ux44AHnTB4dpWXY/7SGg5vz/x2EDC5cK+Jg6/pISclCb5xFgJHkra8
         1Pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538009; x=1750142809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqSpB1VYji66UrxWEnr+KyQ/qcgfaOfilY2jfXTNHuw=;
        b=uCEerJIveg2A6+TiLXFqmY5DCoKfowm54qQMMGkpS2s/WtGOYzMQyUp9y0oBvY50/d
         axYSwJ3KDhC9qQKz4C9DoMv3vJSCyBXPuAInOa+JCcWStFtn+4gII0ikFLdDnl5pZsc3
         pz/E0VJyZWnOnFntcsyXw9imnqnBPHpK6t5xn5BTPXIicTjR0wGI/iXR61iCfCnFo0A5
         SU632Pil4/aYxN19llWc2NFua35d/PqUyJbNFM2iSMAiI9zLLndipgaq3wNidpdfVIwO
         v38RFsS8+6lPxV9TsV6meLAZRYDEf6ic0B618fCCst39MSrBs6800yKi4Te8tfRcSw0p
         b6UA==
X-Forwarded-Encrypted: i=1; AJvYcCW4IxF//tg8M7O97AEruDghsqn2xvaGO67J8NPDubavgHzzqIbVKvcW/wWJ0PF7jaLyzKDxG0uNSn8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxZkPHWG7fmX+Ou92bbk/F5iiXCEkUbmhYoPpzLLqC5oG1Hdaw
	dMpqM3/epkCHwmYrzAj6QnXcK0aD7GvMx9NNS70/30gWyf6+0d56f4ofRnEOK/seE/s=
X-Gm-Gg: ASbGncthFQ7Oo3f/7+IsX5n9QWPkZ9N99VVOTAAN0rDSmpymEVtxTbADKJ0yIDR7vq+
	tgbg4S/E/FpZssxW/MacczJuRZqdZB7IecC/sZ6OZ3xi4mjKjNr5glIA6m55MskKzbjkoqWTOLb
	/I50k4F3oM2spYjROEIPDZYRDVyBRMrRLXMCx/vSlXWIkn6XEaLizWs/0ENI+zWkDPNaFPIr05m
	lDsb4gwrFxMLwzYLL10J0UtAIFZ6TU5s6J192u6p1xpt/a3hIhUeYRmyypmTagDd8gqDOoyUE7a
	7TYEgRn778fOHRFHFZiTn8+gNDqJdIf4hPHUHj6323Zp2sVdR1B5oSabY+1Jvuka3FOeqLD4
X-Google-Smtp-Source: AGHT+IFrvXuAlyVXUyEaQFR+5fxkcaKYPjt9eYihFz8/x8SuyqMfsQMw3MyVs6uvpOSWLordZmvkUw==
X-Received: by 2002:a5d:64e5:0:b0:3a4:d367:c591 with SMTP id ffacd0b85a97d-3a5319b69demr12142196f8f.10.1749538008608;
        Mon, 09 Jun 2025 23:46:48 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm127265205e9.23.2025.06.09.23.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 23:46:48 -0700 (PDT)
Message-ID: <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
Date: Tue, 10 Jun 2025 07:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Guenter Roeck <linux@roeck-us.net>, Pratyush Yadav <pratyush@kernel.org>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_234650_201424_9C658B27 
X-CRM114-Status: GOOD (  19.68  )
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

CgpPbiA2LzEwLzI1IDE6MTQgQU0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gT24gNi84LzI1IDE4
OjEzLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+PiBPbiA2LzgvMjUgMDU6NTMsIFByYXR5dXNoIFlh
ZGF2IHdyb3RlOgo+Pj4gT24gU2F0LCBKdW4gMDcgMjAyNSwgR3VlbnRlciBSb2VjayB3cm90ZToK
Pj4+Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiBNb24sIEFwciAwNywgMjAyNSBhdCAwMzo1Mzo1OFBN
ICswODAwLCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPj4+Pj4gRnJvbTogQ2hlbmcgTWluZyBMaW4g
PGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPj4+Pj4KPj4+Pj4gTWFueSBmbGFzaCBkZXZpY2Vz
IHNoYXJlIHRoZSBzYW1lIElEIGJ1dCBoYXZlIGRpZmZlcmVudCBwYXJ0IG51bWJlcnMuCj4+Pj4+
IFRvIGF2b2lkIGNvbmZ1c2lvbiwgdGhlIHBhcnQgbnVtYmVyIGZpZWxkIGlzIHJlbW92ZWQuCj4+
Pj4+Cj4+Pj4+IEFkZGl0aW9uYWxseSwgc2luY2UgU0ZEUCBhbHJlYWR5IHByb3ZpZGVzIHNpemUg
aW5mb3JtYXRpb24gYW5kCj4+Pj4+IGZ1bmN0aW9uYWxpdHkgY292ZXJlZCBieSBub19zZmRwX2Zs
YWdzLCB0aGVzZSBmaWVsZHMgYXJlIGFsc28gcmVtb3ZlZC4KPj4+Pj4KPj4+Pj4gRnVydGhlcm1v
cmUsIHdoZW4gNC1ieXRlIGFkZHJlc3MgaW5zdHJ1Y3Rpb24gdGFibGUgaXMgYXZhaWxhYmxlLAo+
Pj4+PiB0aGUgU1BJX05PUl80Ql9PUENPREVTIGZsYWcgaXMgbm8gbG9uZ2VyIG5lZWRlZCBhbmQg
aXMgcmVtb3ZlZC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWluZyBMaW4gPGNo
ZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPj4+Pj4gQWNrZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1
ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPj4+Pgo+Pj4+IFdpdGggdGhpcyBwYXRjaCBpbiBwbGFj
ZSwgc29tZSBvZiBteSBxZW11IHRlc3RzIG5vIGxvbmdlciByZWNvZ25pemUgdGhlCj4+Pj4gZmxh
c2ggY2hpcHMgKE1YMjVMMjU2MzVFL0YpLiBEbyB5b3UgaGF2ZSBhIHN1Z2dlc3Rpb24gb24gaG93
IHRvIGhhbmRsZQo+Pj4+IHRoaXMgb3RoZXIgdGhhbiBhdm9pZGluZyBNYWNyb25peCBmbGFzaCBj
aGlwcyB3aGVuIHdvcmtpbmcgd2l0aCBxZW11ID8KPj4+Cj4+PiBDb3VsZCB5b3Ugc2hhcmUgc29t
ZSBsb2dzPyBEb2VzIHRoZSBmbGFzaCBmYWlsIHRvIGRldGVjdCwgb3IgZG9lcyB0aGUKPj4+IFNG
RFAtYmFzZWQgcHJvYmluZyBmYWlsPyBTaW5jZSB0aGlzIGlzIHFlbXUsIGl0IHdvdWxkIGJlIGV2
ZW4gYmV0dGVyIGlmCj4+PiB5b3UgY2FuIHNoYXJlIGEgc2V0dXAvcmVwcm9kdWN0aW9uIGd1aWRl
LiBJIGhhdmUgYmVlbiBtZWFuaW5nIHRvIHNldCB1cAo+Pj4gcWVtdSBmb3IgU1BJIE5PUiB0ZXN0
aW5nIGZvciBzb21lIHRpbWUgbm93LCBidXQgbmV2ZXIgZ290IGFyb3VuZCB0bwo+Pj4gZmlndXJp
bmcgaXQgb3V0Lgo+Pj4KPj4KPj4gSSBzdXNwZWN0IHRoYXQgdGhlIFNGRFAgZGF0YSBmb3IgdGhl
IGFmZmVjdGVkIGZsYXNoZXMgaXMgaW5jb3JyZWN0IGluCj4+IHFlbXUuCj4+IFNpbmNlIHRoaXMg
aXMgdmVyeSBsaWtlbHkgYSBxZW11IHByb2JsZW0sIEknbGwganVzdCBjb25maWd1cmUKPj4gZGlm
ZmVyZW50IGZsYXNoCj4+IGNoaXBzIHdoZW4gcnVubmluZyBhZmZlY3RlZCB0ZXN0cy4KPj4KPiAK
PiBJIHdhcyBhYmxlIHRvIGNvbmZpcm0gdGhlIGFib3ZlLiBUaGlzIGlzIGZyb20gdGhlIGtlcm5l
bCBsb2c6Cj4gCj4gW8KgwqDCoCA0LjUwMDAwMF0gc3BpLW5vciBzcGkwLjA6IEJGUFQgcGFyc2lu
ZyBmYWlsZWQuIFBsZWFzZSBjb25zaWRlcgo+IHVzaW5nIFNQSV9OT1JfU0tJUF9TRkRQIHdoZW4g
ZGVjbGFyaW5nIHRoZSBmbGFzaAo+IFvCoMKgwqAgNC41MDAwMDBdIHNwaS1ub3Igc3BpMC4wOiBw
cm9iZSB3aXRoIGRyaXZlciBzcGktbm9yIGZhaWxlZCB3aXRoCj4gZXJyb3IgLTIyCj4gCgpJdCdz
IGxpa2VseSB0aGUgcHJvYmxlbSB3aGVyZSB0aGUgc2FtZSBmbGFzaCBJRCBpcyB1c2VkIGZvciBk
aWZmZXJlbnQKZmxhdm9ycyBvZiBmbGFzaGVzLiBUeXBpY2FsbHkgd2UgZGlmZmVyZW50aWF0ZSB0
aGUgZmxhdm9ycyBieSBjb21wYXJpbmcKdGhlaXIgU0ZEUCBkYXRhIGFuZCB1c2UgcG9zdCBTRkRQ
IGhvb2tzIHRvIGFtZW5kIHdoZXJlIG5lZWRlZC4gSWYgbm8gb25lCmNhcmVzIGFib3V0IGZpeGlu
ZyBpdCwgd2UgY2FuIHVuZG8gdGhlIGNoYW5nZSBmb3IgdGhlIGFmZmVjdGVkIGZsYXNoIG9yCnJl
dmVydCB0aGUgcGF0Y2ggZW50aXJlbHkuIENoZW5nPwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
