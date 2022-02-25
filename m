Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DCEC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+o8WJa18OACs28653PEjGn8FEpYSh5yLAD7sk5TxgfY=; b=a0ppvBFOAVw1Sh
	PHkWGEwUPmWxX2CwTJaadXT0ei2uFjwp5T8U6Io/KTs5qHxZ+7hmTpq8bfDty3JDKWIRn0Mgf8Zlp
	hjma86puJECCiLrboSs/1gZb51wTr3Y7JQv2JFRiOuMN9ioA4OYDqzWvl3zkS61AgZbRtnP4hBOM5
	w7D/DofMZ+Ttm1OjcPHY/UAfvq6BajPR++0BsfVjx5jAUiCSmZ42AsF78XJjXd9Saf1ITF9dwXdDF
	H2ViV9/nzJKskTjs7aZiwZj2AI6vDvgY+aHo3EKjYbvEIYmWcHIr7Fkkz9zQzi/BujlMkdvDwoeA2
	GmnVCALMOLAWA3LuQqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWZU-00444o-H6; Fri, 25 Feb 2022 09:07:28 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWZS-00443Q-2C; Fri, 25 Feb 2022 09:07:27 +0000
Received: by mail-lj1-x232.google.com with SMTP id bn33so6499862ljb.6;
 Fri, 25 Feb 2022 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=fn5NcQdFGV/AZHgQDeYIwdp5G2hT9QR6G0E+BTlLLmM=;
 b=N4g2+9yHMZqtwmQBiD8FqkUqq7CN1X/YvuxhJtdC2yuzcykeqaWPcVsnE4q042Y1UM
 TOstBjOfrs2dQGVhhVqEvZU5oGfGhNtdkzNl4sLRAWoTOlLB3I0ckBen1AD2h+dXW2gO
 8dO+oN62JifG2yLMMzik0ruT0F2/q53F1ywRyatSUKcFj0kaBg6fPA9JTtUIi6BN9SRZ
 zFPuBV7RWF1QCfP4uUGx5GaXb+4oL6ZjinYGnIA1HcvzFhA/GMrOy4EHOQ5zy9JXgN3Z
 zODn0JQq0F4ayIEO7RqUY4WStUFENzoQERU5bRWuOSq9x0UuPVzo5bmueMq19oEeOrD9
 Wh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fn5NcQdFGV/AZHgQDeYIwdp5G2hT9QR6G0E+BTlLLmM=;
 b=xwd4WdR47m6lcmyNZZ/zYHlZ4frUxOVKQd+cZW2cFNOiKNvw1vq2yyUGYxq3fdFtxT
 EBVUPmWFHBJwsYqv4tKaXGx1js2tTpW54LT1VL4OFYp0jLAk8Ew7Fh1dOE4sMkFKX4cn
 kwY03Dxf8ajgUG8xuqZ7hafyczJTXrByERfna1eJFmIE+UD79XVF2xmUKXlelkSBJtwR
 1FVQrz0qJ010GGiUAp/rT58j+Md+q/69Y+Rtya1feGmkhab6P7rkk62COfGvsfl6LYgq
 hYL0yCJg0Vh20fksGmdo2qR/0Lla1sd6czWJlxAJrwLMyUzubm4eX4pZXZ+WuWEzOSsi
 2Qzw==
X-Gm-Message-State: AOAM533/Mfk3kSjU9WNTlr3pT6kYh/cLvvkRxxKMsNTzZNMW6GsxjiDz
 s0aia2K98glyLGbWrfkITNc=
X-Google-Smtp-Source: ABdhPJyRoQba/jYURANAI4qY0Lq8l8uQgYFjt5ERV9t62ofrEn4pz2Xf8hUUah9/wcUDX+4xRslvZA==
X-Received: by 2002:a2e:9919:0:b0:244:b934:aa36 with SMTP id
 v25-20020a2e9919000000b00244b934aa36mr4658632lji.388.1645780042456; 
 Fri, 25 Feb 2022 01:07:22 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 a5-20020ac25e65000000b00443c375b7a7sm149342lfr.20.2022.02.25.01.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 01:07:21 -0800 (PST)
Message-ID: <e1458f39-a2fe-36bf-af8d-ef2162f7c514@gmail.com>
Date: Fri, 25 Feb 2022 10:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH REBASED 2/2] dt-bindings: nvmem: cells: add MAC address
 cell
To: Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220125180114.12286-1-zajec5@gmail.com>
 <20220126070745.32305-1-zajec5@gmail.com>
 <20220126070745.32305-2-zajec5@gmail.com>
 <YflX6kxWTD6qMnhJ@robh.at.kernel.org>
 <0b7b8f7ea6569f79524aea1a3d783665@walle.cc>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <0b7b8f7ea6569f79524aea1a3d783665@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_010726_128510_73F5EA9C 
X-CRM114-Status: GOOD (  25.66  )
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

T24gMS4wMi4yMDIyIDE4OjAxLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjItMDItMDEg
MTY6NTUsIHNjaHJpZWIgUm9iIEhlcnJpbmc6Cj4+IE9uIFdlZCwgSmFuIDI2LCAyMDIyIGF0IDA4
OjA3OjQ1QU0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4+IEZyb206IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4+Cj4+PiBUaGlzIGFkZHMgc3VwcG9ydCBmb3Ig
ZGVzY3JpYmluZyBkZXRhaWxzIG9mIE5WTUVNIGNlbGwgY29udGFpbmluZyBNQUMKPj4+IGFkZHJl
c3MuIFRob3NlIGFyZSBvZnRlbiBkZXZpY2Ugc3BlY2lmaWMgYW5kIGNvdWxkIGJlIG5pY2VseSBz
dG9yZWQgaW4KPj4+IERULgo+Pj4KPj4+IEluaXRpYWwgZG9jdW1lbnRhdGlvbiBpbmNsdWRlcyBz
dXBwb3J0IGZvciBkZXNjcmliaW5nOgo+Pj4gMS4gQ2VsbCBkYXRhIGZvcm1hdCAoZS5nLiBCcm9h
ZGNvbSdzIE5WUkFNIHVzZXMgQVNDSUkgdG8gc3RvcmUgTUFDKQo+Pj4gMi4gUmV2ZXJzZWQgYnl0
ZXMgZmxhc2ggKHJlcXVpcmVkIGZvciBpLk1YNi9pLk1YNyBPQ09UUCBzdXBwb3J0KQo+Pj4gMy4g
U291cmNlIGZvciBtdWx0aXBsZSBhZGRyZXNzZXMgKHZlcnkgY29tbW9uIGluIGhvbWUgcm91dGVy
cykKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+Cj4+PiAtLS0KPj4+IMKgLi4uL2JpbmRpbmdzL252bWVtL2NlbGxzL21hYy1hZGRyZXNzLnlh
bWzCoMKgwqDCoCB8IDk0ICsrKysrKysrKysrKysrKysrKysKPj4+IMKgMSBmaWxlIGNoYW5nZWQs
IDk0IGluc2VydGlvbnMoKykKPj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxscy9tYWMtYWRkcmVzcy55YW1sCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxs
cy9tYWMtYWRkcmVzcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252
bWVtL2NlbGxzL21hYy1hZGRyZXNzLnlhbWwKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLmY4ZDE5ZTg3Y2RmMAo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2NlbGxzL21hYy1hZGRy
ZXNzLnlhbWwKPj4+IEBAIC0wLDAgKzEsOTQgQEAKPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4+PiArJVlBTUwgMS4yCj4+PiArLS0t
Cj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9udm1lbS9jZWxscy9tYWMt
YWRkcmVzcy55YW1sIwo+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+Pj4gKwo+Pj4gK3RpdGxlOiBOVk1FTSBjZWxsIGNvbnRhaW5pbmcg
YSBNQUMgYWRkcmVzcwo+Pj4gKwo+Pj4gK21haW50YWluZXJzOgo+Pj4gK8KgIC0gUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pj4gKwo+Pj4gK3Byb3BlcnRpZXM6Cj4+PiArwqAg
Y29tcGF0aWJsZToKPj4+ICvCoMKgwqAgY29uc3Q6IG1hYy1hZGRyZXNzCj4+PiArCj4+PiArwqAg
Zm9ybWF0Ogo+Pj4gK8KgwqDCoCBkZXNjcmlwdGlvbjogfAo+Pj4gK8KgwqDCoMKgwqAgU29tZSBO
Vk1FTSBjZWxscyBjb250YWluIE1BQyBpbiBhIG5vbi1iaW5hcnkgZm9ybWF0Lgo+Pj4gKwo+Pj4g
K8KgwqDCoMKgwqAgQVNDSUkgc2hvdWxkIGJlIHNwZWNpZmllZCBpZiBNQUMgaXMgc3RyaW5nIGZv
cm1hdHRlZCBsaWtlOgo+Pj4gK8KgwqDCoMKgwqAgLSAiMDE6MjM6NDU6Njc6ODk6QUIiICgzMCAz
MSAzYSAzMiAzMyAzYSAzNCAzNSAzYSAzNiAzNyAzYSAzOCAzOSAzYSA0MSA0MikKPj4+ICvCoMKg
wqDCoMKgIC0gIjAxLTIzLTQ1LTY3LTg5LUFCIgo+Pj4gK8KgwqDCoMKgwqAgLSAiMDEyMzQ1Njc4
OUFCIgo+Pj4gK8KgwqDCoCBlbnVtOgo+Pj4gK8KgwqDCoMKgwqAgLSBhc2NpaQo+Pj4gKwo+Pj4g
K8KgIHJldmVyc2VkLWJ5dGVzOgo+Pj4gK8KgwqDCoCB0eXBlOiBib29sZWFuCj4+PiArwqDCoMKg
IGRlc2NyaXB0aW9uOiB8Cj4+PiArwqDCoMKgwqDCoCBNQUMgaXMgc3RvcmVkIGluIHJldmVyc2Vk
IGJ5dGVzIG9yZGVyLiBFeGFtcGxlOgo+Pj4gK8KgwqDCoMKgwqAgU3RvcmVkIHZhbHVlOiBBQiA4
OSA2NyA0NSAyMyAwMQo+Pj4gK8KgwqDCoMKgwqAgQWN0dWFsIE1BQzogMDEgMjMgNDUgNjcgODkg
QUIKPj4+ICsKPj4+ICvCoCBiYXNlLWFkZHJlc3M6Cj4+PiArwqDCoMKgIHR5cGU6IGJvb2xlYW4K
Pj4+ICvCoMKgwqAgZGVzY3JpcHRpb246IHwKPj4+ICvCoMKgwqDCoMKgIE1hcmtzIE5WTUVNIGNl
bGwgYXMgcHJvdmlkZXIgb2YgbXVsdGlwbGUgYWRkcmVzc2VzIHRoYXQgYXJlIHJlbGF0aXZlIHRv
Cj4+PiArwqDCoMKgwqDCoCB0aGUgb25lIGFjdHVhbGx5IHN0b3JlZCBwaHlzaWNhbGx5LiBSZXNw
ZWN0aXZlIGFkZHJlc3NlcyBjYW4gYmUgcmVxdWVzdGVkCj4+PiArwqDCoMKgwqDCoCBieSBzcGVj
aWZ5aW5nIGNlbGwgaW5kZXggb2YgTlZNRU0gY2VsbC4KPj4KPj4gV2hpbGUgYSBiYXNlIGFkZHJl
c3MgaXMgY29tbW9uLCBhcmVuJ3QgdGhlcmUgZGlmZmVyZW50IHdheXMgdGhlIGJhc2UgaXMKPj4g
bW9kaWZpZWQuCj4+Cj4+IFRoZSBwcm9ibGVtIHdpdGggdGhlc2UgcHJvcGVydGllcyBpcyBldmVy
eSBuZXcgdmFyaWF0aW9uIHJlc3VsdHMgaW4gYQo+PiBuZXcgcHJvcGVydHkgYW5kIHRoZSBlbmQg
cmVzdWx0IGlzIHNvbWV0aGluZyBub3Qgd2VsbCBkZXNpZ25lZC4gQSB1bmlxdWUKPj4gY29tcGF0
aWJsZSBzdHJpbmcsICIjbnZtZW0tY2VsbC1jZWxscyIgYW5kIGNvZGUgdG8gaW50ZXJwcmV0IHRo
ZSBkYXRhIGlzCj4+IG1vcmUgZmxleGlibGUuCj4gCj4gSSBhY3R1YWxseSBsaWtlIGhhdmluZyBh
IHVuaXF1ZSBjb21wYXRpYmxlIGZvciBhbnl0aGluZyBidXQgdGhlIGJhc2ljCj4gb3BlcmF0aW9u
cy4gRm9yIGV4YW1wbGUsIHRoZSBzbDI4IHZwZCBhcmVhIGFsc28gaGFzIGEgY2hlY2tzdW0sIHdo
aWNoCj4gY291bGQgYmUgaGFuZGxlZCBpZiB0aGVyZSBpcyBhbiBvd24gY29tcGF0aWJsZS4gSSBk
b24ndCB0aGluayB0aGlzIGlzCj4gcG9zc2libGUgd2l0aCB0aGlzIHByb3Bvc2FsLiBBbHNvIHRo
ZXJlIGlzIGEgdmVyc2lvbiBmaWVsZCwgd2hhdCBpZgo+IHdlIGNoYW5nZSB0aGUgbGF5b3V0IG9m
IHRoYXQgdGhpbmc/IEFtIEkgc3VwcG9zZWQgdG8gY2hhbmdlIHRoZQo+IGRldmljZSB0cmVlPyBU
aGUgbW9yZSBJIHRoaW5rIGFib3V0IFJvYidzIHByb3Bvc2FsIHRvIGhhdmUgYSBjb21wYXRpYmxl
Cj4gdGhlIG1vcmUgSSBsaWtlIGl0LgoKSGF2aW5nIG1vcmUgZGV0YWlsZWQgYmluZGluZyBmb3Ig
Y2VsbHMgZG9lc24ndCBzdG9wIHlvdSBmcm9tIHVzaW5nIE5WTUVNCmRldmljZSBzcGVjaWZpYyBi
aW5kaW5nLgoKWW91IGNvdWxkIGhhdmUgZS5nLgoKcGFydGl0aW9uQGYwMDAwMCB7CiAgICAgIGNv
bXBhdGlibGUgPSAiZm9vLGZvby1jZWxscyIsICJudm1lbS1jZWxscyI7CiAgICAgICguLi4pCgog
ICAgICBtYWNAMTAwIHsKICAgICAgICAgIGNvbXBhdGlibGUgPSAibWFjLWFkZHJlc3MiOwogICAg
ICAgICAgcmVnID0gPDB4MTAwIDB4Nj47CiAgICAgIH07CgogICAgICBPUgoKICAgICAgbWFjQDEw
MCB7CiAgICAgICAgICBjb21wYXRpYmxlID0gIm1hYy1hZGRyZXNzIjsKICAgICAgICAgIHJlZyA9
IDwweDEwMCAweDExPjsKICAgICAgICAgIGZvcm1hdCA9ICJhc2NpaSI7CiAgICAgIH07Cn07CgpU
aGVuIHlvdSBjYW4gaGF2ZSAiZm9vLGZvby1jZWxscyIgZHJpdmVyIGhhbmRsaW5nIGNoZWNrc3Vt
LgoKSSdtIG5vdCBzYXlpbmcgd2UgaGF2ZSB0byB1c2UgdGhpcyBzb2x1dGlvbiwganVzdCBzYXlp
bmcgaXQncyBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
