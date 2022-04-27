Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CC2C43217
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qYxeYs8MxIqh7yV2SQpLyEKq+x0YOC4G2TGxyERmHM=; b=X3JDAGIhd2bNcp
	Z4b1dXvPUVlJdWOSocNXN3GLmejUccQa+i5I+xJMzdGCZfOWMTKhdX1UOLY+wlJvgcvHubSRhaoGh
	sq/0sHxK6Dj6Uvq2M793ihDM+fT6M08qS+vSvg0Pso/epPKhyJDo6usExL8vTYWNMG2RW538XQ6JC
	aCheAUnCiZk1iZ7Yy9xD+BVxQzYW/3l5DXOwTsbhJqk23blr8C9v3kNsZDmhgKEAroNcnmCndx6W7
	gq2Yk1ORODVlzdf1rYvGmss4J86IpoLZlB79sqpKjrtXCBHABo2L40i8sRn1xosjxc9cU9YdtxCJD
	tADBg3Jrs6Lu9DNqHwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njh4L-001M7F-Uo; Wed, 27 Apr 2022 12:46:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njh4J-001M63-FR
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 12:46:57 +0000
Received: by mail-ed1-x533.google.com with SMTP id k27so1813065edk.4
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2022 05:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=xzaxKfYDUlsCnW3X9n/1WVpaWQCTU0x4d05vWNBDsmQ=;
 b=dJbLOB2mgx/wt5SqqKjnlrG6ijyQ6LfraqVvmxxOpxxIhvAJ0/PKjg/d/NoI/PQdfL
 N+b+jN6uTbzoAkFGZgRpCMVIx+m8o4GmwG09pddz7iOFKDP706v8XZK+QI3bKvGYl9WR
 oQpScB8a/M8XH70af0E/hk392HhjPUPHuPoGa4IvO7OeCWKWVRDpOERqrB40NBS2/uB9
 d9dCcl2tTY3o2FP7DFDnZzPzdZu12J4O+cRhRWzfG6DiqRjv/hrX/ijcNfYauXL9nok2
 sEfkGwTH2FYxjMpa17f2+BdzfIgOT/cFi9HSVHG3iQxGZ7c4daRY8oFA+uwe7RP0q8dF
 Xyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xzaxKfYDUlsCnW3X9n/1WVpaWQCTU0x4d05vWNBDsmQ=;
 b=B1SrX8o4AQCAK6OEMcTOBz5tyHLVxBCJWJv+/m6CeQ6FVTBg+wtBf6l3eopuVVVT6A
 goaUFCjSWrVlv/w2zavSJtuqUFg1JhsusaJBTSc7ST8hLp+i52uMqsR+07KZ8I2TQtvw
 epYSvNIe+1Fy5kIxLmmBnQgNv9EpqFFmRLcGiHcJsHoT72FatmggnvNocoTnJRnvywF2
 VAuCbY/7/FE4D89PjtVpbo2385vYpVBQ1jrxk2Q7bpkD3LjBcBfJ5viw1kqkrGon7wFr
 TPfQEKGX1N946yAYxRkrmfz1Q7uvViOIGckUAXwz3TatuzDgV+PXgwiTbgSv0BoCoMpU
 PyLQ==
X-Gm-Message-State: AOAM531DfZrINJf0UGZvJwG39TWcjr5LcwmGT5c1M3Qia1k2P5/edkNh
 V9Pg6QHflYg49Oz7cWepnfA=
X-Google-Smtp-Source: ABdhPJyhmPj/21nMtM13faPSRhQ6Rb3wpdLNvWGzoTZaCIstR1iVp1UUjvNwQSFixmD3Lyo87gB30g==
X-Received: by 2002:a05:6402:3496:b0:425:ece9:1a99 with SMTP id
 v22-20020a056402349600b00425ece91a99mr15231423edc.319.1651063613320; 
 Wed, 27 Apr 2022 05:46:53 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 lb18-20020a170907785200b006efe7bb40b0sm6705391ejc.74.2022.04.27.05.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 05:46:52 -0700 (PDT)
Message-ID: <4054f0df-1c1f-da21-71fb-96fb7b3358ff@gmail.com>
Date: Wed, 27 Apr 2022 14:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] dt-bindings: mtd: partitions: add UBI binding
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tom Rini <trini@konsulko.com>,
 Ricardo Salveti <ricardo@foundries.io>,
 Michal Simek <michal.simek@xilinx.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220217102448.27586-1-zajec5@gmail.com>
 <Yh/ovYMV104jc+CE@robh.at.kernel.org>
 <fb18b5e2-d273-adf6-3e14-77628abc4560@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <fb18b5e2-d273-adf6-3e14-77628abc4560@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_054655_556420_D837F49A 
X-CRM114-Status: GOOD (  26.14  )
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

SGkgUm9iLCBjb3VsZCB5b3UgcmUtcmV2aWV3IG15IHBhdGNoIGFzIEkgcHJvdmlkZWQgYW5zd2Vy
cyAoc2VlIGJlbG93KSwgcGxlYXNlPwoKT24gMy4wMy4yMDIyIDA5OjMyLCBSYWZhxYIgTWnFgmVj
a2kgd3JvdGU6Cj4gT24gMi4wMy4yMDIyIDIyOjU5LCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24g
VGh1LCBGZWIgMTcsIDIwMjIgYXQgMTE6MjQ6NDhBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdy
b3RlOgo+Pj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pj4KPj4+
IFVCSSBpcyBvZnRlbiB1c2VkIG9uIGVtYmVkZGVkIGRldmljZXMgdG8gc3RvcmUgVUJJIHZvbHVt
ZXMgd2l0aCBkZXZpY2UKPj4+IGNvbmZpZ3VyYXRpb24gLyBjYWxpYnJhdGlvbiBkYXRhLiBTdWNo
IHZvbHVtZXMgbWF5IG5lZWQgdG8gYmUgZG9jdW1lbnRlZAo+Pj4gYW5kIHJlZmVyZW5jZWQgZm9y
IHByb3BlciBib290ICYgc2V0dXAuCj4+Pgo+Pj4gU29tZSBleGFtcGxlczoKPj4+IDEuIFUtQm9v
dCBlbnZpcm9ubWVudCB2YXJpYWJsZXMKPj4+IDIuIERldmljZSBjYWxpYnJhdGlvbiBkYXRhCj4+
PiAzLiBEZWZhdWx0IHNldHVwIChlLmcuIGluaXRpYWwgcGFzc3dvcmQpCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pj4gLS0tCj4+PiDC
oCAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWzCoMKgwqDCoMKgwqDCoMKgwqAg
fCA2NyArKysrKysrKysrKysrKysrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0
aW9ucygrKQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91YmkueWFtbAo+Pj4KPj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlh
bWwKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmNkMDgx
ZjA2ZDRjYgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3ViaS55YW1sCj4+PiBAQCAtMCwwICsxLDY3IEBA
Cj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZQo+Pj4gKyVZQU1MIDEuMgo+Pj4gKy0tLQo+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwjCj4+PiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+PiArCj4+PiArdGl0bGU6
IFVCSSAoVW5zb3J0ZWQgQmxvY2sgSW1hZ2VzKSBkZXZpY2UKPj4+ICsKPj4+ICtkZXNjcmlwdGlv
bjogfAo+Pj4gK8KgIFVCSSBpcyBhIGxheWVyIHByb3ZpZGluZyBsb2dpY2FsIHZvbHVtZXMgKGNv
bnNpc3Rpbmcgb2YgbG9naWNhbCBibG9ja3MpIG9uIHRvcAo+Pj4gK8KgIG9mIHJhdyBmbGFzaCBk
ZXZpY2VzLiBJdCBkZWFscyB3aXRoIGxvdy1sZXZlbCBmbGFzaCBpc3N1ZXMgKGJpdC1mbGlwcywg
YmFkCj4+PiArwqAgcGh5c2ljYWwgZXJhc2VibG9ja3MsIHdlYXJpbmcpIHByb3ZpZGluZyBhIHJl
bGlhYmxlIGRhdGEgc3RvcmFnZS4KPj4+ICsKPj4+ICvCoCBVQkkgZGV2aWNlIGlzIGJ1aWx0IGFu
ZCBzdG9yZWQgaW4gYSBzaW5nbGUgZmxhc2ggcGFydGl0aW9uLgo+Pj4gKwo+Pj4gK8KgIFNvbWUg
KHVzdWFsbHkgZW1iZWRkZWQpIGRldmljZXMgdXNlIFVCSSB2b2x1bWVzIG9mIHNwZWNpZmljIG5h
bWVzIG9yIGluZGV4ZXMKPj4+ICvCoCB0byBzdG9yZSBzZXR1cCAvIGNvbmZpZ3VyYXRpb24gZGF0
YS4gVGhpcyBiaW5kaW5nIGFsbG93cyBkZXNjcmliaW5nIHN1Y2gKPj4+ICvCoCB2b2x1bWVzIHNv
IHRoZXkgY2FuIGJlIGlkZW50aWZpZWQgYW5kIHJlZmVyZW5jZWQgYnkgY29uc3VtZXJzLgo+Pj4g
Kwo+Pj4gK21haW50YWluZXJzOgo+Pj4gK8KgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgo+Pj4gKwo+Pj4gK2FsbE9mOgo+Pj4gK8KgIC0gJHJlZjogcGFydGl0aW9uLnlhbWwj
Cj4+PiArCj4+PiArcHJvcGVydGllczoKPj4+ICvCoCBjb21wYXRpYmxlOgo+Pj4gK8KgwqDCoCBj
b25zdDogdWJpCj4+PiArCj4+PiArcGF0dGVyblByb3BlcnRpZXM6Cj4+PiArwqAgIl52b2x1bWUt
WzAtOWEtZl0rJCI6Cj4+PiArwqDCoMKgIHR5cGU6IG9iamVjdAo+Pj4gK8KgwqDCoCBkZXNjcmlw
dGlvbjogVUJJIHZvbHVtZQo+Pj4gK8KgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4gK8KgwqDCoMKgwqAg
dm9sdW1lLW5hbWU6Cj4+PiArwqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvc3RyaW5nCj4+PiArwqDCoMKgwqDCoCB2b2x1bWUtaWQ6Cj4+PiArwqDC
oMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
Cj4+PiArwqDCoMKgIGFueU9mOgo+Pj4gK8KgwqDCoMKgwqAgLSByZXF1aXJlZDoKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqAgLSB2b2x1bWUtbmFtZQo+Pj4gK8KgwqDCoMKgwqAgLSByZXF1aXJlZDoK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSB2b2x1bWUtaWQKPj4+ICsKPj4+ICt1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlCj4+PiArCj4+PiArZXhhbXBsZXM6Cj4+PiArwqAgLSB8Cj4+PiAr
wqDCoMKgIHBhcnRpdGlvbnMgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiZml4
ZWQtcGFydGl0aW9ucyI7Cj4+PiArwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
Cj4+PiArwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MT47Cj4+PiArCj4+PiArwqDCoMKg
wqDCoMKgwqAgcGFydGl0aW9uQDAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0
aWJsZSA9ICJ1YmkiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MDAwMDAw
MCAweDEwMDAwMDA+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAiZmlsZXN5
c3RlbSI7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnY6IHZvbHVtZS0wIHsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9sdW1lLW5hbWUgPSAidS1ib290
LWVudiI7Cj4+Cj4+IFdoeSBub3QgZG8gJ2NvbXBhdGlibGUgPSAidS1ib290LGVudiI7JyB0byBh
bGlnbiB3aXRoIG5vcm1hbCBwYXJ0aXRpb25zPwo+IAo+IEkgbWVhbiB0byByZXNlcnZlICJjb21w
YXRpYmxlIiBmb3IgZGVzY3JpYmluZyBVQkkgdm9sdW1lIGNvbnRlbnQuCj4gCj4gSWYgSSBtYW5h
Z2UgdG8gZ2V0Cj4gW1BBVENIIFYzXSBkdC1iaW5kaW5nczogbnZtZW06IGFkZCBVLUJvb3QgZW52
aXJvbm1lbnQgdmFyaWFibGVzIGJpbmRpbmcKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDIyMDIyODEzMTI1MC4xNjk0My0x
LXphamVjNUBnbWFpbC5jb20vCj4gYWNjZXB0ZWQsIGl0J2xsIGFsbG93IG1lIHRvIGxhdGVyIHdv
cmsgb24gc29tZXRoaW5nIGxpa2U6Cj4gCj4gZW52OiB2b2x1bWUtMCB7Cj4gIMKgwqDCoCBjb21w
YXRpYmxlID0gInUtYm9vdCxlbnYiOwo+ICDCoMKgwqAgdm9sdW1lLW5hbWUgPSAidS1ib290LWVu
diI7Cj4gfTsKPiAKPiAoSSBiZWxpZXZlKSBJJ2xsIG5lZWQgKGluIHRoZSBmaW5hbCBzaGFwZSkg
dHdvIHByb3BlcnRpZXM6Cj4gMS4gT25lIGZvciBkZXNjcmliaW5nIFVCSSB2b2x1bWUgKCJjb21w
YXRpYmxlIikKPiAyLiBPbmUgZm9yIGlkZW50aWZ5aW5nIFVCSSB2b2x1bWUgKCJ2b2x1bWUtbmFt
ZSIgLyAidm9sdW1lLWlkIikKPiAKPiBJdCdzIHNpbWlsYXIgZGVzaWduIHRvIHRoZSAiY29tcGF0
aWJsZSIgdnMuICJyZWciIGluIElPIGh3IGJsb2Nrcy4KPiAKPiAKPj4gT3IgJ2xhYmVsJz8KPiAK
PiBJIGNvdWxkIHJlcGxhY2UgInZvbHVtZS1uYW1lIiB3aXRoICJsYWJlbCIgYnV0IHNvbWVvbmUg
b25jZSB0b2xkIG1lIHRoYXQ6Cj4gID4gJ2xhYmVsJyBpcyBzdXBwb3NlZCB0byBjb3JyZXNwb25k
IHRvIGEgc3RpY2tlciBvbiBhIHBvcnQgb3Igc29tZXRoaW5nCj4gID4gaHVtYW4gaWRlbnRpZmlh
YmxlCj4gCj4gOykgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9jb21tZW50LzI4MTIyMTQv
Cj4gCj4gU28gSSBkb24ndCB3YW50IHRvIGFidXNlICJsYWJlbCIgaGVyZS4KPiAKPiAKPj4gV2Ug
aGF2ZSBlbm91Z2ggd2F5cyB0byBpZGVudGlmeSB0aGluZ3MsIEkgZG9uJ3QgdGhpbmsgd2UgbmVl
ZCBhbm90aGVyLgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhbGlicmF0aW9uOiB2b2x1bWUtMSB7Cj4+Cj4+IEFyZSAw
IGFuZCAxIG1lYW5pbmdmdWwgb3IganVzdCBtYWRlIHVwIGluZGV4aW5nPwo+IAo+IE1hZGUgdXAg
aW5kZXhpbmcuIEkgbmVlZCB1bmlxdWUgbm9kZW5hbWVzIGJ1dCBAWzAtOWEtZl0gZG9lc24ndCBh
cHBwbHkgaGVyZS4KPiAKPiAKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9s
dW1lLWlkID0gPDk5PjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+PiArwqDCoMKg
wqDCoMKgwqAgfTsKPj4+ICvCoMKgwqAgfTsKPj4+IC0tIAo+Pj4gMi4zNC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
