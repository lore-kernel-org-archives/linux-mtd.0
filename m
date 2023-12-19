Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD59BC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCoAZd+Twv3EpEtIWfT/SgxCe6WSC8y5WbsuhfQtDM0=; b=JXUV/lGpH6fAbU
	CxuzM4B1Xs4r2bEzeb1fi52M84q1I3ikJUr5MNBnfihEEhWbaNysdr2vdOgl3eGJX21lpDWtfKQFX
	Jo9OvPAbhR+ZMmFvmgbjYHVof9kMaCAW3IZXUIYC18nQQWsUQfLOXo7NGgaABLJFdBZWWhp3aJL9b
	MtYfvkaOR2Jed/2TMTky7/X6bvHITUD9YVOBJKUhcfSt1/7gAZO4Xd+tOwnT2xPEsgmSLriqkXAuv
	GTk+VnlVkl2TsT7HZHRb+LNMOmTVc91q3+jiJZ7dT6+10GoZIblaSy/0iSOuDE4bfY1mHgQVUXwNa
	I0XojHMeTvV6XIUJd/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVQu-00DIzA-0j;
	Tue, 19 Dec 2023 08:26:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVQq-00DIx3-11
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 08:26:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33666fb9318so2255293f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 19 Dec 2023 00:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702974383; x=1703579183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44tWTX/RSFAs3xTgaKfAwubj6hvu6hnjcH+agLDrfuI=;
        b=nHPVNsZRUnFeTbfCVC2BBmMRHUj8JIlJbTtfJgITPcAiyuKUlHU6PDERgU4uR00NYz
         ll/ql9NVzayvb3Ts6hn0Z8SdP1I2Ja/LcdXxAMHIevy6uzxlKXcScFCxT+ID26fUeIob
         7SaLFT5bkhUlYyMyk6vOxMoqlIsabjmoaPm6un4fNS3CRmfFbe0atv1oka1uO8FLeywd
         Czf63EbCOXq65syyvFA1cjUVIs4io9OIzSX7LKWQFaomwuc9lpKbk4hYMOlGqDYGNiMf
         c7Pbc/gc0UjXO3XUnPjJN/g0K6WqneP24xy/uiLwJOy4CIDoxG1/TwZRX1tKDGRVKwY0
         OBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702974383; x=1703579183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44tWTX/RSFAs3xTgaKfAwubj6hvu6hnjcH+agLDrfuI=;
        b=MQjXgLQhsEMYg9a1AmPddEbRakCDgVmooeESVzm5Y/PDygSN8dVDaQIH08gP3K9Mph
         BhWTG0d6DXbsOKfWsvzNnEVcw/tBhzZVSoLBPWKx3cK3prvV7Q4hB3g0W7hWzZSax94C
         boUQZ1V4VCbs3bnQdK1f2Yq+nx6in1VfBgfkmTt6n4mAbCqHRNR5zrMv3WX4FRMJjp1u
         SOa6oBtL0RYt/6DMPTKoi7jWgj2s50LQEaGbkm0LKVrBnk0BCleprcjg/rHrdH0n7mof
         DK9AYkAulUNRt/w/5rMOXjLVy6fQRaZCkn+RGj6tEoCSE6k1wZleagwB7CaDI11g29Zc
         Irmg==
X-Gm-Message-State: AOJu0YyzvNxo6msPis4VYDINDffWdTOnD+ukGPTLiyojJ0MxeH+zcATU
	W3S2IeK+wA9TsYS6g9Ucr018+g==
X-Google-Smtp-Source: AGHT+IFhixtyy2y9O5fWKScajlDY2zaXPIfDPrVd3MMvihiJ4///TFioM3EVhUMMvTdIrJts+xU3cQ==
X-Received: by 2002:a5d:6801:0:b0:336:6e12:7c62 with SMTP id w1-20020a5d6801000000b003366e127c62mr861872wru.110.1702974383315;
        Tue, 19 Dec 2023 00:26:23 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id d5-20020a5d5385000000b0033662cf5e51sm6719841wrv.93.2023.12.19.00.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 00:26:22 -0800 (PST)
Message-ID: <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
Date: Tue, 19 Dec 2023 10:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
 <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_002628_365318_34F387AA 
X-CRM114-Status: GOOD (  21.53  )
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

CgpPbiAxNS4xMi4yMDIzIDEzOjIwLCBNYWhhcGF0cmEsIEFtaXQgS3VtYXIgd3JvdGU6Cj4gSGVs
bG8gVHVkb3IsCj4gCgpIaSEKCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206
IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPj4gU2VudDogRnJpZGF5
LCBEZWNlbWJlciAxNSwgMjAyMyA0OjAzIFBNCj4+IFRvOiBNYWhhcGF0cmEsIEFtaXQgS3VtYXIg
PGFtaXQua3VtYXItbWFoYXBhdHJhQGFtZC5jb20+Owo+PiBicm9vbmllQGtlcm5lbC5vcmc7IHBy
YXR5dXNoQGtlcm5lbC5vcmc7IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb207Cj4+IHJpY2hhcmRA
bm9kLmF0OyB2aWduZXNockB0aS5jb207IHNiaW5kaW5nQG9wZW5zb3VyY2UuY2lycnVzLmNvbTsK
Pj4gbGVlQGtlcm5lbC5vcmc7IGphbWVzLnNjaHVsbWFuQGNpcnJ1cy5jb207IGRhdmlkLnJob2Rl
c0BjaXJydXMuY29tOwo+PiByZkBvcGVuc291cmNlLmNpcnJ1cy5jb207IHBlcmV4QHBlcmV4LmN6
OyB0aXdhaUBzdXNlLmNvbQo+PiBDYzogbGludXgtc3BpQHZnZXIua2VybmVsLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgbWljaGFlbEB3YWxsZS5jYzsKPj4gbGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc7IG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbTsKPj4gYWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207IGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldjsgU2ltZWss
IE1pY2hhbAo+PiA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7IGFsc2EtCj4+IGRldmVsQGFsc2EtcHJvamVjdC5vcmc7IHBhdGNoZXNA
b3BlbnNvdXJjZS5jaXJydXMuY29tOyBsaW51eC0KPj4gc291bmRAdmdlci5rZXJuZWwub3JnOyBn
aXQgKEFNRC1YaWxpbngpIDxnaXRAYW1kLmNvbT47Cj4+IGFtaXRya2NpYW4yMDAyQGdtYWlsLmNv
bQo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSAwNy8xMF0gbXRkOiBzcGktbm9yOiBBZGQgc3Rh
Y2tlZCBtZW1vcmllcyBzdXBwb3J0Cj4+IGluIHNwaS1ub3IKPj4KPj4KPj4KPj4gT24gMTIvMTUv
MjMgMTA6MDIsIE1haGFwYXRyYSwgQW1pdCBLdW1hciB3cm90ZToKPj4+IEhlbGxvIFR1ZG9yLAo+
Pgo+PiBIaSwKPj4KPj4+Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9t
OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4+Pj4gU2VudDogRnJp
ZGF5LCBEZWNlbWJlciAxNSwgMjAyMyAxOjQwIFBNCj4+Pj4gVG86IE1haGFwYXRyYSwgQW1pdCBL
dW1hciA8YW1pdC5rdW1hci1tYWhhcGF0cmFAYW1kLmNvbT47Cj4+Pj4gYnJvb25pZUBrZXJuZWwu
b3JnOyBwcmF0eXVzaEBrZXJuZWwub3JnOyBtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tOwo+Pj4+
IHJpY2hhcmRAbm9kLmF0OyB2aWduZXNockB0aS5jb207IHNiaW5kaW5nQG9wZW5zb3VyY2UuY2ly
cnVzLmNvbTsKPj4+PiBsZWVAa2VybmVsLm9yZzsgamFtZXMuc2NodWxtYW5AY2lycnVzLmNvbTsg
ZGF2aWQucmhvZGVzQGNpcnJ1cy5jb207Cj4+Pj4gcmZAb3BlbnNvdXJjZS5jaXJydXMuY29tOyBw
ZXJleEBwZXJleC5jejsgdGl3YWlAc3VzZS5jb20KPj4+PiBDYzogbGludXgtc3BpQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsKPj4+PiBtaWNoYWVsQHdhbGxl
LmNjOyBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsKPj4+PiBuaWNvbGFzLmZlcnJlQG1p
Y3JvY2hpcC5jb207IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOwo+Pj4+IGNsYXVkaXUu
YmV6bmVhQHR1eG9uLmRldjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+Owo+
Pj4+IGxpbnV4LSBhcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZzsKPj4+PiBwYXRjaGVzQG9wZW5zb3VyY2UuY2lycnVzLmNvbTsgbGludXgt
c291bmRAdmdlci5rZXJuZWwub3JnOyBnaXQgKEFNRC0KPj4+PiBYaWxpbngpIDxnaXRAYW1kLmNv
bT47IGFtaXRya2NpYW4yMDAyQGdtYWlsLmNvbQo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEx
IDA3LzEwXSBtdGQ6IHNwaS1ub3I6IEFkZCBzdGFja2VkIG1lbW9yaWVzCj4+Pj4gc3VwcG9ydCBp
biBzcGktbm9yCj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gT24gMTUuMTIuMjAyMyAwOTo1NSwgTWFoYXBh
dHJhLCBBbWl0IEt1bWFyIHdyb3RlOgo+Pj4+Pj4gVGhhbmtzISBDYW4geW91IHNoYXJlIHdpdGgg
dXMgd2hhdCBmbGFzaGVzIHlvdSB1c2VkIGZvciB0ZXN0aW5nIGluCj4+Pj4+PiB0aGUgc3RhY2tl
ZCBhbmQgcGFyYWxsZWwgY29uZmlndXJhdGlvbnM/Cj4+Pj4+IEkgdXNlZCBTUEktTk9SIFFTUEkg
Zmxhc2hlcyBmb3IgdGVzdGluZyBzdGFja2VkIGFuZCBwYXJhbGxlbC4KPj4+Pgo+Pj4+IEkgZ290
IHRoYXQsIEkgd2FudGVkIHRoZSBmbGFzaCBuYW1lIG9yIGRldmljZSBJRC4KPj4+Cj4+PiBOMjVR
MDBBLCBNWDY2VTJHNDVHLCBJUzI1TFAwMUcgJiBXMjVIMDJKViBhcmUgc29tZSBvZiB0aGUgUVNQ
SQo+PiBmbGFzaGVzCj4+PiBvbiB3aGljaCB3ZSB0ZXN0ZWQuIEFkZGl0aW9uYWxseSwgd2UgY29u
ZHVjdGVkIHRlc3RzIG9uIG92ZXIgMzAKPj4+IGRpZmZlcmVudCBRU1BJIGZsYXNoZXMgZnJvbSBm
b3VyIGRpc3RpbmN0IHZlbmRvcnMgKE1pcm9uLCBXaW5ib25kLAo+PiBNYWNyb25peCwgYW5kIElT
U0kpLgo+Pj4KPj4KPj4gR3JlYXQuCj4+Cj4+Pj4gV2hhdCBJJ20gaW50ZXJlc3RlZCBpcyBpZiBl
YWNoIGZsYXNoIGlzIGluIGl0cyBvd24gcGFja2FnZS4gQXJlIHRoZXk/Cj4+Pgo+Pj4gSSdtIHNv
cnJ5LCBidXQgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gYnkgImlmIGVh
Y2gKPj4+IGZsYXNoIGluIGl0cyBvd24gcGFja2FnZS4iCj4+Pgo+Pgo+PiBUaGVyZSBhcmUgZmxh
c2hlcyB0aGF0IGFyZSBzdGFja2VkIGF0IHRoZSBwaHlzaWNhbCBsZXZlbC4gSXQncyBhIHNpbmds
ZSBmbGFzaCB3aXRoCj4+IG11bHRpcGxlIGRpZXMsIHRoYXQgYXJlIGFsbCB1bmRlciBhIHNpbmds
ZSBwaHlzaWNhbCBwYWNrYWdlLgo+IAo+IEdvdCBpdC4gVGhlIFcyNUgwMkpWIFFTUEkgZmxhc2gg
SSBtZW50aW9uZWQgZWFybGllciBpcyBhIGRldmljZSB3aXRoIAo+IHdpdGggZm91ciBkaWVzIHRo
YXQgYXJlIHN0YWNrZWQgYXQgdGhlIHBoeXNpY2FsIGxldmVsLgo+IAo+Pgo+PiBBcyBJIHVuZGVy
c3RhbmQsIHlvdXIgc3RhY2tlZCBmbGFzaCBtb2RlbCBpcyBhdCBsb2dpY2FsIGxldmVsLiBZb3Ug
aGF2ZQo+PiAyIGZsYXNoZXMgZWFjaCBpbiBpdHMgb3duIHBhY2thZ2UuIDIgZGlmZmVyZW50IGVu
dGl0aWVzLiBJcyBteSB1bmRlcnN0YW5kaW5nCj4+IGNvcnJlY3Q/Cj4gCj4gWWVzLCB0aGF04oCZ
cyBjb3JyZWN0Lgo+IAo+IEknZCBsaWtlIHRvIGNvbnRyaWJ1dGUgdG8geW91ciBlYXJsaWVyIHBv
aW50IHJlZ2FyZGluZyB0aGUgcGxhY2VtZW50IG9mIAo+IHRoZSBzdGFja2VkIGxheWVyLiBBcyB5
b3UgY29ycmVjdGx5IGhpZ2hsaWdodGVkLCBpdCBzaG91bGQgYmUgaW4gdGhlIAo+IHNwaS1tZW0g
Z2VuZXJpYyBsYXllci4gRm9yIGluc3RhbmNlLCB3aGVuIGEgcmVhZC93cml0ZSBvcGVyYXRpb24g
ZXh0ZW5kcyAKPiBhY3Jvc3MgbXVsdGlwbGUgZmxhc2hlcyAod2hldGhlciBTUEktTk9SIG9yIFNQ
SS1OQU5EKSwgdGhlIHN0YWNrZWQgbGF5ZXIgCj4gbXVzdCBoYW5kbGUgdGhlIGZsYXNoIGNyb3Nz
b3Zlci4gVGhpcyByZXF1aXJlcyBzZXR0aW5nIHRoZSBhcHByb3ByaWF0ZSBDUyAKPiBpbmRleCBp
biBtZW0tPnNwaS0+Y3NfaW5kZXhfbWFzayB0byBzZWxlY3QgdGhlIGNvcnJlY3Qgc2xhdmUgZGV2
aWNlIGFuZCAKPiB1cGRhdGluZyB0aGUgZGF0YSBidWZmZXIsIGFkZHJlc3MgJiBkYXRhIGxlbmd0
aCBpbiBzcGlfbWVtX29wIHN0cnVjdCAKPiB2YXJpYWJsZS4gRG9lcyB0aGlzIGFsaWduIHdpdGgg
eW91ciB1bmRlcnN0YW5kaW5nPwo+IAoKVGhpcyB3YXMgdGhlIGluaXRpYWwgaWRlYSwgeWVzLCBi
dXQgd2UnbGwgaGF2ZSB0byBzZWUgaG93IG10ZCBjb25jYXQKZml0cyBpbi4gTWF5YmUgdGhlIGFi
c3RyYWN0aW9uIGNhbiBiZSBtYWRlIGF0IHRoZSBtdGQgbGV2ZWwsIHdoaWNoIEkKc3VzcGVjdCBt
dGQgY29uY2F0IGRvZXMuIEkgaGF2ZSB0byByZWFkIHRoYXQgZHJpdmVyLCBuZXZlciBvcGVuZWQg
aXQuCgpTb21ldGhpbmcgZWxzZSB0byBjb25zaWRlcjogSSBzZWUgdGhhdCBNaWNyb24gaGFzIGEg
dHdpbiBxdWFkIG1vZGU6Cmh0dHBzOi8vbWVkaWEtd3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGll
bnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25vci1mbGFzaC9zZXJpYWwt
bm9yL210MjV0L2dlbmVyYXRpb24tYi9tdDI1dF9xbGpzX2xfNTEyX3hiYV8wLnBkZj9yZXY9ZGU3
MGI3NzBjNWRjNGRhOGI4ZWFkMDZiNTdjMDM1MDAKClRoZSBtaWNyb24ncyAiU2VwYXJhdGUgQ2hp
cC1TZWxlY3QgYW5kIENsb2NrIFNpZ25hbHMiIHJlc2VtYmxlcyB0aGUKQU1EJ3MgZHVhbCBwYXJh
bGxlbCA4LWJpdC4KTWljcm9uJ3MgIlNoYXJlZCBDaGlwLVNlbGVjdCBhbmQgQ2xvY2sgU2lnbmFs
cyIgZGlmZmVycyBmcm9tIHRoZSBBTUQncwpzdGFja2VkIG1vZGUsIGFzIE1pY3JvbiB1c2VzIERR
WzM6MF0gYW5kIERRWzc6NF0sIHdoZXJlYXMgQU1EIGNvbnNpZGVycwpib3RoIGFzIERRWzM6MF0u
CgpJIGhhZCBhIHNob3J0IGNoYXQgd2l0aCBNaWNoYWVsIGFuZCBoZSBoaWdobGlnaHRlZCB0aGF0
IGluc3RlYWQgb2YgdGhlCnBhcmFsbGVsIG1vZGUsIG9uZSB3b3VsZCBiZSBiZXR0ZXIgb2Ygd2l0
aCBhbiBvY3RhbCBkZXZpY2UuIEkgd29uZGVyCndoZXRoZXIgdGhlIHF1YWQgcGFyYWxsZWwgaXMg
d29ydGggdGhlIGVmZm9ydC4gSSBzZWUgQU1EIGNhbiBzZWxlY3QKZWl0aGVyIHF1YWQgKHNpbmds
ZS9zdGFja2VkL3BhcmFsbGVsKSBvciBvY3RhbCAoc2luZ2xlL3N0YWNrZWQpLiBJcyB0aGUKcGFy
YWxsZWwgbW9kZSBjb25zaWRlcmVkIG9ic29sZXRlIGZvciBuZXcgSVBzPwoKQ2hlZXJzLAp0YQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
