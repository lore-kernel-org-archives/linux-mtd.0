Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0D1C61DF4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxdG+OYuQx5TdrRD+9jLE5sj6vNOxXiXtGQW357qA0g=; b=tqj0z7rBPzI9fe
	zHcUjsWBglyxMdS++wy9zuMDmw3R8IAXE+Cz5f774LQfae65E32dndjRFw7e/z3KkCDMWk+XhzJ8i
	LySNRictq36jc49sTTEyTCt0J/lOsKaeJk+45ZzHDw+O53tKi5PjxGzzdC6dVUMAcBWzwTht7HCpH
	p38Ic8QYP9jBw+DtsP8qODCNd9avW8EwMUv7Kucv1hXDRKSBeCUbATkl16JjaVTtn9+3p3PJeLbuP
	sEfzINzGr6lodxBLFg3Olb7N6fgZWybDcKsBEQnlWwp+IoEss4ABj7en8//T8Wf4aHu1Q1aE2ps5o
	zWEE2pajAg4XI6TwRV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TCy-006nP0-1u;
	Fri, 24 Nov 2023 10:14:48 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TCv-006nO8-0O;
	Fri, 24 Nov 2023 10:14:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4758262409;
	Fri, 24 Nov 2023 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1700820882; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=zAa8KfhS0OY4Dr6ZXjOsmkXuSyqZRHPE2ALmEU1633Q=;
	b=A8NLSpaGchzPYg8U/On3TW1DCPVS31Yir17LRqipktNHor/u4UVXrsuZnfLQdII0revXqQ
	HzFHRFep0mPkq5oXdzmPwrRJELDfg9hv4SXqBH1PkGW5kS5LJiAzIUBIoohvqMzcl8V6el
	CwS1dyZrV8qLu+/opSR5DGJrYeJgmVwlXeUFBHMTZfEuGWDBmcCJPtypypdQCnwDIPMjCb
	+vKkjlYS6zvbXAI82IQb1lYjldO1Bcjd4EvlqjeNrDuBk2BnmzTBycGCQwNQOg8meh5yzs
	Cpi6L1A1eb65aZCsH983m0xYN90nWpr8bWdEg+lxAssG7iKAgRZarG9t/L+quQ==
Message-ID: <608cf897-55b3-4ccd-b99f-2ebba8bbf17f@lexina.in>
Date: Fri, 24 Nov 2023 13:14:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mtd: rawnand: meson: handle OOB buffer according OOB
 layout
Content-Language: en-US, ru-RU
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231109053953.3863664-1-avkrasnov@salutedevices.com>
 <5a82e3b96c94b45821707eb5d392384e1a026c2e.camel@lexina.in>
 <98c5a6ef-3865-9254-0af7-2d041a64d368@salutedevices.com>
 <ab3f6734-357c-9937-2e21-a935850d3af8@salutedevices.com>
 <20231124100657.245d258f@xps-13>
From: Viacheslav <adeep@lexina.in>
Autocrypt: addr=adeep@lexina.in; keydata=
 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
In-Reply-To: <20231124100657.245d258f@xps-13>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_021445_525646_ED793052 
X-CRM114-Status: GOOD (  16.37  )
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

SGksIE1pcXVlbCEKCjI0LzExLzIwMjMgMTIuMDYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkg
QXJzZW5peSwKPiAKPiBhdmtyYXNub3ZAc2FsdXRlZGV2aWNlcy5jb20gd3JvdGUgb24gRnJpLCAy
NCBOb3YgMjAyMyAxMDo1MDo1NCArMDMwMDoKPiAKPj4gSGVsbG8gYWxsLCAyIHdlZWtzIGZyb20g
OS4xMSwgcGxlYXNlIHBpbmcKPiAKPiBJJ20gd2FpdGluZyBmb3IgVmlhY2hlc2xhdi4KCldlIGRp
c2N1c3NlZCB0aGlzIHVwZGF0ZSB3aXRoIEFyc2VuaXkuIE15IHN1Z2dlc3Rpb24gd2FzIGJhc2Vk
IG9uIHRoZSAKZGlmZmVyZW5jZSBpbiBwYXRjaCBmcm9tIHRoZSBhbGdvcml0aG1zIHVzZWQgaW4g
YW1sb2dpYyB1LWJvb3QuICBBcnNlbml5IApjbGFpbXMgdGhhdCBldmVyeXRoaW5nIHdvcmtzIGZv
ciB0aGVtLgoKVW5mb3J0dW5hdGVseSwgSSBkb24ndCBoYXZlIHRoZSBkZXZpY2VzIGF2YWlsYWJs
ZSB0byB0ZXN0IHRoaXMuCgo+IAo+Pgo+PiBUaGFua3MsIEFyc2VuaXkKPj4KPj4KPj4gT24gMDku
MTEuMjAyMyAxMjowOSwgQXJzZW5peSBLcmFzbm92IHdyb3RlOgo+Pj4gSGVsbG8sIHRoYW5rcyBm
b3IgcmV2aWV3IQo+Pj4KPj4+IE9uIDA5LjExLjIwMjMgMTE6MDYsIFZpYWNoZXNsYXYgQm9jaGFy
b3Ygd3JvdGU6Cj4+Pj4gSGkhCj4+Pj4KPj4+PiBPbiBUaHUsIDIwMjMtMTEtMDkgYXQgMDg6Mzkg
KzAzMDAsIEFyc2VuaXkgS3Jhc25vdiB3cm90ZToKPj4+Pj4gSW4gY2FzZSBvZiBNVERfT1BTX0FV
VE9fT09CIG1vZGUsIE1URC9OQU5EIGxheWVyIGZpbGxzL3JlYWRzIE9PQiBidWZmZXIKPj4+Pj4g
YWNjb3JkaW5nIGN1cnJlbnQgT09CIGxheW91dCBzbyB3ZSBuZWVkIHRvIGZvbGxvdyBpdCBpbiB0
aGUgZHJpdmVyLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPGF2
a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgNCArKy0tCj4+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYwo+Pj4+PiBpbmRleCA1NjFkNDZkODYwYjcuLjBkNGQzNTgxNTJkNyAxMDA2NDQK
Pj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+PiBAQCAtNTEwLDcgKzUxMCw3
IEBAIHN0YXRpYyB2b2lkIG1lc29uX25mY19zZXRfdXNlcl9ieXRlKHN0cnVjdCBuYW5kX2NoaXAg
Km5hbmQsIHU4ICpvb2JfYnVmKQo+Pj4+PiAgIAlfX2xlNjQgKmluZm87Cj4+Pj4+ICAgCWludCBp
LCBjb3VudDsKPj4+Pj4gICAKPj4+Pj4gLQlmb3IgKGkgPSAwLCBjb3VudCA9IDA7IGkgPCBuYW5k
LT5lY2Muc3RlcHM7IGkrKywgY291bnQgKz0gMikgewo+Pj4+PiArCWZvciAoaSA9IDAsIGNvdW50
ID0gMDsgaSA8IG5hbmQtPmVjYy5zdGVwczsgaSsrLCBjb3VudCArPSAoMiArIG5hbmQtPmVjYy5i
eXRlcykpIHsKPj4+Pj4gICAJCWluZm8gPSAmbWVzb25fY2hpcC0+aW5mb19idWZbaV07Cj4+Pj4+
ICAgCQkqaW5mbyB8PSBvb2JfYnVmW2NvdW50XTsKPj4+Pj4gICAJCSppbmZvIHw9IG9vYl9idWZb
Y291bnQgKyAxXSA8PCA4Owo+Pj4+IFNlZW1zIHNvbWV0aGluZyB3cm9uZyB3aXRoIHlvdXIgbG9n
aWMgaGVyZS4KPj4+PiBJIHRoaW5rIHRoaXMgY29kZSBzaG91bGQgbW9zdCBsaWtlbHkgbG9vayBs
aWtlIHRoaXM6Cj4+Pj4KPj4+PiBmb3IgKGkgPSAwLCBjb3VudCA9IDA7IGkgPCBuYW5kLT5lY2Mu
c3RlcHM7IGkrKywgY291bnQgKz0gbmFuZC0+ZWNjLmJ5dGVzKSB7Cj4+Pj4gICAgICBpbmZvID0g
Jm1lc29uX2NoaXAtPmluZm9fYnVmW2ldOwo+Pj4+ICAgICAgKmluZm8gfD0gb29iX2J1Zltjb3Vu
dF07Cj4+Pj4gICAgICBpZiAobmFuZC0+ZWNjLmJ5dGVzID4gMSkKPj4+PiAgICAgICAgKmluZm8g
fD0gb29iX2J1Zltjb3VudCArIDFdIDw8IDg7Cj4+Pj4gfQo+Pj4KPj4+IEZvciA2NCBieXRlcyBP
T0IgYW5kIDUxMiBieXRlcyBFQ0MgdGhpcyBkcml2ZXIgcmVwb3J0cyBmcmVlIGFyZWFzIGFzOgo+
Pj4KPj4+IEFBIEFBIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCCj4+
PiBBQSBBQSBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQiBCQgo+Pj4gQUEg
QUEgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIgQkIKPj4+IEFBIEFBIEJC
IEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCIEJCCj4+Pgo+Pj4gd2hlcmUgQUEg
aXMgZnJlZSBieXRlKHVzZXIgYnl0ZSksIEJCIC0gRUNDIGNvZGVzLiBTbyB0byBhY2Nlc3MgdXNl
ciBieXRlcwo+Pj4gd2UgbmVlZCBieXRlcyAwLDEsMTYsMTcsMzIsMzMsNDgsNDkuIG5hbmQtPmVj
Yy5ieXRlcyA9PSAxNCwgc28gJ2NvdW50JyBpcwo+Pj4gaW5jcmVhc2VkIGF0IDE2IGV2ZXJ5IGl0
ZXJhdGlvbiwgc28gaSBndWVzcyB0aGlzIGlzIGNvcnJlY3QuCj4+Pgo+Pj4gV0RZVD8KPj4+Cj4+
PiBUaGFua3MsIEFyc2VuaXkKPj4+ICAgIAo+Pj4+Cj4+Pj4gICAKPj4+Pj4gQEAgLTUyMyw3ICs1
MjMsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNfZ2V0X3VzZXJfYnl0ZShzdHJ1Y3QgbmFuZF9j
aGlwICpuYW5kLCB1OCAqb29iX2J1ZikKPj4+Pj4gICAJX19sZTY0ICppbmZvOwo+Pj4+PiAgIAlp
bnQgaSwgY291bnQ7Cj4+Pj4+ICAgCj4+Pj4+IC0JZm9yIChpID0gMCwgY291bnQgPSAwOyBpIDwg
bmFuZC0+ZWNjLnN0ZXBzOyBpKyssIGNvdW50ICs9IDIpIHsKPj4+Pj4gKwlmb3IgKGkgPSAwLCBj
b3VudCA9IDA7IGkgPCBuYW5kLT5lY2Muc3RlcHM7IGkrKywgY291bnQgKz0gKDIgKyBuYW5kLT5l
Y2MuYnl0ZXMpKSB7Cj4+Pj4+ICAgCQlpbmZvID0gJm1lc29uX2NoaXAtPmluZm9fYnVmW2ldOwo+
Pj4+PiAgIAkJb29iX2J1Zltjb3VudF0gPSAqaW5mbzsKPj4+Pj4gICAJCW9vYl9idWZbY291bnQg
KyAxXSA9ICppbmZvID4+IDg7Cj4+Pj4gQW5kIHRoZXJlOgo+Pj4+Cj4+Pj4gZm9yIChpID0gMCwg
Y291bnQgPSAwOyBpIDwgbmFuZC0+ZWNjLnN0ZXBzOyBpKyssIGNvdW50ICs9IG5hbmQtPmVjYy5i
eXRlcykgewo+Pj4+ICAgICAgaW5mbyA9ICZtZXNvbl9jaGlwLT5pbmZvX2J1ZltpXTsKPj4+PiAg
ICAgIG9vYl9idWZbY291bnRdID0gKmluZm87Cj4+Pj4gICAgICBpZiAobmFuZC0+ZWNjLmJ5dGVz
ID4gMSkKPj4+PiAgICAgICAgICBvb2JfYnVmW2NvdW50ICsgMV0gPSAqaW5mbyA+PiA4Owo+Pj4+
IH0KPj4+Pgo+Pj4+Cj4+Pj4gVGhpcyBpcyBtb3JlIHNpbWlsYXIgdG8gdGhlIGJlaGF2aW9yIG9m
IHNpbWlsYXIgZnVuY3Rpb25zIGluIHRoZSBwcm9wcmlldGFyeSBVLUJvb3QuCj4+Pj4KPj4+PiAt
LQo+Pj4+IFZpYWNoZXNsYXYgQm9jaGFyb3YKPj4+PiAgIAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgotLQpWaWFjaGVzbGF2IEJvY2hhcm92CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
