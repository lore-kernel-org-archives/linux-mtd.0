Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10639C4725D
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jan 2024 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O28NseoblVvwvjle60iiQQ58KngfM+Tcri1LxJ4Vl4E=; b=IiSr1oNzZmi/1u
	1DWdJVbG6m9xdvd6Ak8ZuwhKi/74RWgguSgJKCnN5oueoZ3WhPeiYvHOIvOFrE7fmjzLWCNicB8yI
	u/QWm9P/NDgVQiiDYUBamYLbb+Dhr+/mNdsrwEFQ46lMcVBHQRtQarSmXqkTAELWvxRoc3hYQi8da
	vQFdyleJzEwlrpoRpNFVrbD5EZSQxwYCvrahbpZuDvYdFue8Z3Joms12SUakzdpwjmMlY8Z00iIEU
	facytGcFBQjtyksCDpc32w/HZhyPn9/OBqRjTzxE6xUoU+Viy5T2VoIJzaypXA+8/ikdk+NfvacX1
	RllYMMJHrFUtlw1dgfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQimc-004dOc-2M;
	Fri, 19 Jan 2024 06:55:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQimZ-004dOA-11
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jan 2024 06:55:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a27733ae1dfso37458466b.3
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 22:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705647311; x=1706252111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkAmqRw7w2yYqf2W3GOHqjv2WlmB1qzHLqaGERc954U=;
        b=UUx233YlmDSC4tSVuTAV+eDAWcl7Ip2hFmZmU+9N7EhtIURaSxSjn1QnRPiJgzFSwr
         F0pnWmQPJeszTg/T0Mv10tz/zyEZ31m+Fw6fEbSrHd2iITT6VV2DO+Ey9D7NfGKm7Nnb
         hriU3CpvAdPHGmW0FK63SUWJ0sTn/BB8/ZdWxZLu7TQ9YTJ7McIFHKqgcb71TjVi2Vfz
         7H4AfYd/SvsK7JVqf0xF5r14rvStMwsqT9sC0JaTc2djcjPS9DsEIxiu7S2U3sZ1yySv
         jMDOzWTUHpJoGkhXwLzXwxUijZM8/rGSzWxwzXvsC+JY061C2R/tB+Ov6KacycbYtvKd
         nUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705647311; x=1706252111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkAmqRw7w2yYqf2W3GOHqjv2WlmB1qzHLqaGERc954U=;
        b=mZBcUUv5Cx4C86pcPR70iRpFCiRUC/ZZPbGtBk7OdXdYfvsLX97nfRCuiL5SjhPhCU
         igzYJfvoVbAiMRPAhUV/TtWTnt0eJUWZ+C9nf9LyCip/aP0UjnXkmX/pTucJJ18O4JrC
         8TSPSfNi9i06ocH4DIZ5++eZUW4qhOoyiPxQFz5Yauro5PG8/8QW06yU6t5ZSEJA/N3z
         dKb7szutoVSt80hfv1/XhB+x9jLBt8B6HqIUNU5+m9EWkxycoj1M/dt9ZbDyPgbZ00Ra
         wa0IyetfVMKYlPDmOehEexg1ThUo6o/f9gcDJCNq7uSXwJs8N6T4wwy26ZPsd+J3oIsd
         POHw==
X-Gm-Message-State: AOJu0Yxw0sGyWpXadm5Rbl2f+QewZzAg8tW+6SnSU8uKe4fO4Z4ea1VA
	mK8fy2EdPxpdYoV7SixmVa8Rs1sFjNmivY5W+6WkDVlua5wkSwlM3dCXbgM7MHA=
X-Google-Smtp-Source: AGHT+IFoHBkaZsvSNMgorYF9lQb9z7Z9TsHx6UHengBWE+66SEKwumDwZIHXWhMTTDyN6n421hiWGA==
X-Received: by 2002:a17:906:358c:b0:a2e:d29d:8997 with SMTP id o12-20020a170906358c00b00a2ed29d8997mr474959ejb.58.1705647311622;
        Thu, 18 Jan 2024 22:55:11 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id kw7-20020a170907770700b00a29dcbe1e72sm9906260ejc.56.2024.01.18.22.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 22:55:11 -0800 (PST)
Message-ID: <de7d244c-9e0b-4d8b-a04b-e3c701cdec7c@linaro.org>
Date: Fri, 19 Jan 2024 06:55:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
Content-Language: en-US
To: Takahiro Kuwano <tkuw584924@gmail.com>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <740bf235110e05eae9ec7768603e6e2a@walle.cc>
 <d9cf5631-951e-45a0-930f-cc3afac05df9@gmail.com>
 <d63b6363-2d90-4fed-97c3-be69948aae57@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <d63b6363-2d90-4fed-97c3-be69948aae57@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_225515_384288_4CE47488 
X-CRM114-Status: GOOD (  22.08  )
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

CgpPbiAxLzE5LzI0IDA2OjI5LCBUYWthaGlybyBLdXdhbm8gd3JvdGU6Cj4gT24gMS8xMi8yMDI0
IDQ6MTQgUE0sIFRha2FoaXJvIEt1d2FubyB3cm90ZToKPj4gT24gMS81LzIwMjQgOToyMyBQTSwg
TWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+PiAtc3RhdGljIHZvaWQgc3BpX25v
cl9zZXRfbXRkX2luZm8oc3RydWN0IHNwaV9ub3IgKm5vcikKPj4+PiArc3RhdGljIGludCBzcGlf
bm9yX3NldF9tdGRfZXJhc2VyZWdpb25zKHN0cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4gK3sKPj4+
PiArwqDCoMKgIHN0cnVjdCBzcGlfbm9yX2VyYXNlX21hcCAqbWFwID0gJm5vci0+cGFyYW1zLT5l
cmFzZV9tYXA7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3BpX25vcl9lcmFzZV9yZWdpb24gKnJlZ2lv
biA9IG1hcC0+cmVnaW9uczsKPj4+PiArwqDCoMKgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gJm5v
ci0+bXRkOwo+Pj4+ICvCoMKgwqAgc3RydWN0IG10ZF9lcmFzZV9yZWdpb25faW5mbyAqbXRkX3Jl
Z2lvbjsKPj4+PiArwqDCoMKgIHUzMiBlcmFzZV9zaXplOwo+Pj4+ICvCoMKgwqAgdTggZXJhc2Vf
bWFzazsKPj4+PiArwqDCoMKgIGludCBuX3JlZ2lvbnMsIGksIGo7Cj4+Pj4gKwo+Pj4+ICvCoMKg
wqAgZm9yIChpID0gMDsgIXNwaV9ub3JfcmVnaW9uX2lzX2xhc3QoJnJlZ2lvbltpXSk7IGkrKykK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgOwo+Pj4KPj4+IFBsZWFzZSBwdXQgdGhhdCBpbnRvIGEgaGVs
cGVyIHdoaWNoIHJldHVybnMgdGhlIG51bWJlciBvZiByZWdpb25zLgo+Pj4KPj4gWWVzLCBJIHdp
bGwgZG8gaXQuCj4+Cj4+PiBGV0lXLCBJIHJlYWxseSBkaXNsaWtlIHRoZSBtYWdpYyBhcm91bmQg
ZW5jb2RpbmcgYWxsIHNvcnRzIG9mIHN0dWZmCj4+PiBpbnRvIHRoZSBvZmZzZXQuIEl0IG1ha2Vz
IHRoZSBjb2RlIGp1c3QgaGFyZCB0byByZWFkLgo+Pj4KPj4+Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAg
bl9yZWdpb25zID0gaSArIDE7Cj4+Pj4gK8KgwqDCoCBtdGRfcmVnaW9uID0gZGV2bV9rY2FsbG9j
KG5vci0+ZGV2LCBuX3JlZ2lvbnMsIHNpemVvZigqbXRkX3JlZ2lvbiksCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+Pgo+Pj4gV2hvJ3MgdGhl
IG93bmVyPyBtdGQtPmRldiBvciBub3ItPmRldj8KPj4+Cj4+IEkgdGhpbmsgaXQgc2hvdWxkIGJl
IG5vci0+ZGV2Lgo+PiBUaGUgbXRkIGRldmljZSBpcyBub3QgeWV0IHJlZ2lzdGVyZWQgYXQgdGhp
cyBwb2ludC4KPj4KPj4+PiArwqDCoMKgIGlmICghbXRkX3JlZ2lvbikKPj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8
IG5fcmVnaW9uczsgaSsrKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZWdpb25baV0ub2Zm
c2V0ICYgU05PUl9PVkVSTEFJRF9SRUdJT04pIHsKPj4+Cj4+PiBCdHcuIHdoYXQgaXMgYW4gb3Zl
cmxhaWQgcmVnaW9uPyBJIGNvdWxkbid0IGZpbmQgYW55IGNvbW1lbnQKPj4+IGFib3V0IGl0Lgo+
Pj4KPj4gSXQgaXMgdGhlIHJlbWFpbmluZyBwYXJ0IG9mIHJlZ3VsYXIgc2VjdG9yIHRoYXQgb3Zl
cmxhaWQgYnkgNEtCIHNlY3RvcnMuCj4+IEluIFNFTVBFUiBjYXNlLCByZWd1bGFyIHNlY3RvciBp
cyAyNTZLQi4gSWYgMzIgeCA0S0Igc2VjdG9ycyBhcmUgb3ZlcmxhaWQgb24KPj4gYm90dG9tIGFk
ZHJlc3MsIDEyOEtCIGlzIG92ZXJsYWlkIHJlZ2lvbi4gVGhlIGVyYXNlIG9wY29kZSBmb3IgdGhp
cyByZWdpb24gaXMKPj4gc2FtZSBhcyAyNTZLQiBzZWN0b3JzLgo+Pgo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGVyYXNlX3NpemUgPSByZWdpb25baV0uc2l6ZTsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgfSBlbHNlIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcmFzZV9tYXNrID0g
cmVnaW9uW2ldLm9mZnNldCAmIFNOT1JfRVJBU0VfVFlQRV9NQVNLOwo+Pj4+ICsKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSBTTk9SX0VSQVNFX1RZUEVfTUFYIC0gMTsgaiA+
PSAwOyBqLS0pIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcmFz
ZV9tYXNrICYgQklUKGopKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVyYXNlX3NpemUgPSBtYXAtPmVyYXNlX3R5cGVbal0uc2l6ZTsKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIG10ZF9yZWdpb25baV0uZXJh
c2VzaXplID0gZXJhc2Vfc2l6ZTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgbXRkX3JlZ2lvbltpXS5u
dW1ibG9ja3MgPSBkaXY2NF91bChyZWdpb25baV0uc2l6ZSwgZXJhc2Vfc2l6ZSk7Cj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIG10ZF9yZWdpb25baV0ub2Zmc2V0ID0gcmVnaW9uW2ldLm9mZnNldCAmCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH5TTk9SX0VS
QVNFX0ZMQUdTX01BU0s7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgbXRkLT5u
dW1lcmFzZXJlZ2lvbnMgPSBuX3JlZ2lvbnM7Cj4+Pj4gK8KgwqDCoCBtdGQtPmVyYXNlcmVnaW9u
cyA9IG10ZF9yZWdpb247Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gK30KPj4+
PiArCj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zZXRfbXRkX2luZm8oc3RydWN0IHNwaV9ub3Ig
Km5vcikKPj4+PiDCoHsKPj4+PiDCoMKgwqDCoCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9ICZub3It
Pm10ZDsKPj4+PiDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBub3ItPmRldjsKPj4+PiBA
QCAtMzQzOSw2ICszNDgzLDExIEBAIHN0YXRpYyB2b2lkIHNwaV9ub3Jfc2V0X210ZF9pbmZvKHN0
cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4gwqDCoMKgwqAgbXRkLT5fcmVzdW1lID0gc3BpX25vcl9y
ZXN1bWU7Cj4+Pj4gwqDCoMKgwqAgbXRkLT5fZ2V0X2RldmljZSA9IHNwaV9ub3JfZ2V0X2Rldmlj
ZTsKPj4+PiDCoMKgwqDCoCBtdGQtPl9wdXRfZGV2aWNlID0gc3BpX25vcl9wdXRfZGV2aWNlOwo+
Pj4+ICsKPj4+PiArwqDCoMKgIGlmIChzcGlfbm9yX2hhc191bmlmb3JtX2VyYXNlKG5vcikpCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHJldHVybiBz
cGlfbm9yX3NldF9tdGRfZXJhc2VyZWdpb25zKG5vcik7Cj4+Pgo+Pj4gbXRkLT5lcmFzZXNpemUg
aXMgc2V0IHNvbWV3aGVyZSBlbHNlLCBwbGVhc2UgbW92ZSBpdCBpbnRvIHRoaXMKPj4+IGZ1bmN0
aW9uLCBiZWNhdXNlIGl0IHdpbGwgYWxzbyBoYXZlIGEgc3BlY2lhbCBjYXNlIGZvciB0aGUKPj4+
IG5vbl91bmlmb3JtIGZsYXNoZXMuIE1heWJlIHdlJ2xsIG5lZWQgb3VyIG93biBlcmFzZXNpemUg
c3RvcmVkCj4+PiB0b2dldGhlciB3aXRoIHRoZSBvcGNvZGUuCj4+Pgo+PiBMZXQgbWUgaW50cm9k
dWNlIHBhcmFtcy0+ZXJhc2VzaXplIHdoaWNoIHNldCB0aHJvdWdoIFNGRFAgcGFyc2UsIHRoZW4K
Pj4KPj4gICAgIG10ZC0+ZXJhc2VzaXplID0gbm9yLT5wYXJhbXMtPmVyYXNlc2l6ZTsKPj4KPj4g
bGlrZSBhcyBvdGhlciAnc2l6ZScgcGFyYW1zLgo+Pgo+IEkgdHJpZWQgdG8gaW1wbGVtZW50IHRo
aXMsIGJ1dCBmb3VuZCBtdGQtPmVyYXNlc2l6ZSBpcyBzZXQgaW4gc29tZSBmaXh1cCBob29rcwo+
IGluIG1hbnVmYWN0dXJlciBkcml2ZXIgYW5kIG5lZWQgdG8gdGhpbmsgY2FyZWZ1bGx5IGFib3V0
IGNoYW5naW5nIHRoZW0uCj4gTGV0IG1lIGRvIHRoaXMgbGF0ZXIgaW4gYW5vdGhlciBzZXJpZXMg
b2YgcGF0Y2hlcy4KPiAKCkRvIHlvdSBtZWFuIHhpbGlueD8gVGhhdCdzIGEgZGVhZCB3ZWlnaHQs
IEkgaGF2ZW4ndCBzZWVuIHBhdGNoZXMgZm9yIGl0CnNpbmNlIGl0cyBpbnRyb2R1Y3Rpb24uIEkn
bSB0aGlua2luZyBvZiBnZXR0aW5nIHJpZCBvZiB0aGUgeGlsaW54IHMzYW4KZmxhc2hlcyBmcm9t
IHRoZSBTUEkgTk9SLiBNaWNoYWVsLCBQcmF0eXVzaD8KCkNoZWVycywKdGEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
