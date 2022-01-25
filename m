Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7C3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=loTSYGG/4Llz52uYPbhzNBbpfJBYnwD16uwlLNgRgAo=; b=q8T1kvgkTYa7y2
	5WZX1i75epftREGAup5xPgLPmISn77susVTlXLxcezVykPSMYQCTNGP6EjClpldsBhxNTviYaTV1z
	gAJJTE/iec+GRIxRKgidS83G2eXY8AC0fgWfTO3jboAzZdWhWWKeH4OqIalv8EfO1leeXpuxW2f55
	LnvtpZq/7jTiuk9imCyy89Whrd5fDucUssZvFX0TKypbIxQh3lDGDrNaa1vTJuhvqX0Qm+6BFB8wp
	cEI2+RA7e0iegcngC9emcJbiDe8cN6Pe6D4uRVpGuvUhBea5lXcbidJdQLY8cUTw0aS34Ta7it6wI
	mn/GGYkt404io+Z26rwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCSJX-009Tcg-D3; Tue, 25 Jan 2022 20:21:15 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCSJU-009Taz-8i
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 20:21:14 +0000
Received: by mail-lj1-x22f.google.com with SMTP id e9so6292836ljq.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 12:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=wafinEPcxutmBkrShhaSw3X/2HKKywFLaTiGIm9CmRI=;
 b=OgC0ZXfJS6RDbAsvgzpP8R8q7oes1LRkUulaqLkSOb8T4vKiTkaOWGMVwiCvrbYJOw
 Uo+DrHEsCLK2DP/LjE09+Oz9cRDnowq0MZXdzwjhjerUYmSDWZUGJMdPhaUWWG5yT9TO
 p2A6bES1xcBsDYQ7kyr6G9LirrOjWWH/DXfjNSr4AHVJf1JZzuv1VakNv2RTJh6mQeZG
 hT9EcKz4PUlK2OopEsb/Fsxq+KQ/Ki7MVZMBEPod9I5L8BTHXchUlghrJMeh0mB1xJyt
 KlkzRYsc6ZQBSg3qQ2ARnGiJka+lg5dIiNf7aMDC69o2x/IGGkhkGo2o+mXWlkRfKJrl
 +SOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wafinEPcxutmBkrShhaSw3X/2HKKywFLaTiGIm9CmRI=;
 b=kwbf3sAcxxprSXQQzCvUcT/H0CInQTabrG5N8ABZWzMqSIxbv5g/fm8+yTlXyShomq
 UPsLLcHax1CApQ3vc8ACaqnVdWh8chQq3PU1dkCyQ2HJYhb5/zfwKPBB2spaRqxsvWFe
 4X3KOKjDbQIh8LMa+qRvU5xC/MNme2soYi2SoEdl126QecTlko198hsUndrd6K4bT+nL
 eBNaj4fporq8BlU74UtI88yNI+JeiW3DfKMvsduL0ugj4L2tDt6qKVvGj2bYYvaftbQc
 Hzlz4Obeg1aOdlQwaQfelQH0OxG4AeU93NSg1OUX/X7VU0w9GhHV6KHHPPSwWIP0uRAh
 sI/Q==
X-Gm-Message-State: AOAM530F+9GMDbT/pSGlJUxh0GR9PUkZxFx6qZYk47j8kP+eyx+avOMt
 2tQxPG6MV0tz+fFKt+x9Y44=
X-Google-Smtp-Source: ABdhPJy6HDs1CyUW9jvlp5wSS+hPzQ3Rcr4T4/6dPyxGg1Y47p9T/G3A21GU3yBpyt76TgnlmtNTxw==
X-Received: by 2002:a2e:3109:: with SMTP id x9mr3487152ljx.428.1643142070395; 
 Tue, 25 Jan 2022 12:21:10 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id f26sm1152917lfm.251.2022.01.25.12.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 12:21:09 -0800 (PST)
Message-ID: <ef34a0b2-3b13-863b-86b9-71832eace360@gmail.com>
Date: Tue, 25 Jan 2022 21:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partitions node
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220120202615.28076-1-ansuelsmth@gmail.com>
 <20220120202615.28076-2-ansuelsmth@gmail.com>
 <a823e730-853d-901b-1b9f-937e1ec76444@gmail.com>
 <61ef243a.1c69fb81.26cae.716b@mx.google.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <61ef243a.1c69fb81.26cae.716b@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_122112_334405_FC580669 
X-CRM114-Status: GOOD (  29.53  )
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

T24gMjQuMDEuMjAyMiAyMzoxMiwgQW5zdWVsIFNtaXRoIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDI0
LCAyMDIyIGF0IDExOjAyOjI0UE0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gT24g
MjAuMDEuMjAyMiAyMToyNiwgQW5zdWVsIFNtaXRoIHdyb3RlOgo+Pj4gRG9jdW1lbnQgbmV3IGR5
bmFtaWMtcGFydGl0aW9ucyBub2RlIHVzZWQgdG8gcHJvdmlkZSBhbiBvZiBub2RlIGZvcgo+Pj4g
cGFydGl0aW9uIHJlZ2lzdHJlZCBhdCBydW50aW1lIGJ5IHBhcnNlcnMuIFRoaXMgaXMgcmVxdWly
ZWQgZm9yIG52bWVtCj4+PiBzeXN0ZW0gdG8gZGVjbGFyZSBhbmQgZGV0ZWN0IG52bWVtLWNlbGxz
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5j
b20+Cj4+PiAtLS0KPj4+ICAgIC4uLi9tdGQvcGFydGl0aW9ucy9keW5hbWljLXBhcnRpdGlvbnMu
eWFtbCAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1
OSBpbnNlcnRpb25zKCspCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2R5bmFtaWMtcGFydGl0aW9ucy55YW1s
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9keW5hbWljLXBhcnRpdGlvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9keW5hbWljLXBhcnRpdGlvbnMueWFtbAo+
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzUyOGU0OWYy
ZDdlCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZHluYW1pYy1wYXJ0aXRpb25zLnlhbWwKPj4+IEBAIC0w
LDAgKzEsNTkgQEAKPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlCj4+PiArJVlBTUwgMS4yCj4+PiArLS0tCj4+PiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvcGFydGl0aW9ucy9keW5hbWljLXBhcnRpdGlvbnMu
eWFtbCMKPj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPj4+ICsKPj4+ICt0aXRsZTogRHluYW1pYyBwYXJ0aXRpb25zCj4+PiArCj4+PiAr
ZGVzY3JpcHRpb246IHwKPj4+ICsgIFRoaXMgYmluZGluZyBjYW4gYmUgdXNlZCBvbiBwbGF0Zm9y
bXMgd2hpY2ggaGF2ZSBwYXJ0aXRpb25zIHJlZ2lzdGVyZWQgYXQKPj4+ICsgIHJ1bnRpbWUgYnkg
cGFyc2VycyBvciBwYXJ0aXRpb24gdGFibGUgcHJlc2VudCBvbiB0aGUgZmxhc2guIEV4YW1wbGUg
YXJlCj4+PiArICBwYXJ0aXRpb25zIGRlY2xhcmVkIGZyb20gc21lbSBwYXJzZXIgb3IgY21kbGlu
ZXBhcnQuIFRoaXMgd2lsbCBjcmVhdGUgYW4KPj4+ICsgIG9mIG5vZGUgZm9yIHRoZXNlIGR5bmFt
aWMgcGFydGl0aW9uIHdoZXJlIHN5c3RlbXMgbGlrZSBOdm1lbSBjYW4gZ2V0IGEKPj4+ICsgIHJl
ZmVyZW5jZSB0byByZWdpc3RlciBudm1lbS1jZWxscy4KPj4+ICsKPj4+ICsgIFRoZSBwYXJ0aXRp
b24gdGFibGUgc2hvdWxkIGJlIGEgbm9kZSBuYW1lZCAiZHluYW1pYy1wYXJ0aXRpb25zIi4KPj4+
ICsgIFBhcnRpdGlvbnMgYXJlIHRoZW4gZGVmaW5lZCBhcyBzdWJub2Rlcy4gT25seSB0aGUgbGFi
ZWwgaXMgcmVxdWlyZWQKPj4+ICsgIGFzIGFueSBvdGhlciBkYXRhIHdpbGwgYmUgdGFrZW4gZnJv
bSB0aGUgcGFyc2VyLgo+Pj4gKwo+Pj4gK21haW50YWluZXJzOgo+Pj4gKyAgLSBBbnN1ZWwgU21p
dGggPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+Pj4gKwo+Pj4gK3Byb3BlcnRpZXM6Cj4+PiArICBj
b21wYXRpYmxlOgo+Pj4gKyAgICBjb25zdDogZHluYW1pYy1wYXJ0aXRpb25zCj4+PiArCj4+PiAr
cGF0dGVyblByb3BlcnRpZXM6Cj4+PiArICAiQFswLTlhLWZdKyQiOgo+Pj4gKyAgICAkcmVmOiAi
cGFydGl0aW9uLnlhbWwjIgo+Pj4gKwo+Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4+
PiArCj4+PiArZXhhbXBsZXM6Cj4+PiArICAtIHwKPj4+ICsgICAgcGFydGl0aW9ucyB7Cj4+PiAr
ICAgICAgICBjb21wYXRpYmxlID0gInFjb20sc21lbSI7Cj4+PiArICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPj4+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+Pj4gKyAgICB9Owo+
Pj4gKwo+Pj4gKyAgICBkeW5hbWljLXBhcnRpdGlvbnMgewo+Pj4gKyAgICAgIGNvbXBhdGlibGUg
PSAiZHluYW1pYy1wYXJ0aXRpb25zIjsKPj4+ICsKPj4+ICsgICAgICBhcnQ6IGFydCB7Cj4+PiAr
ICAgICAgICBsYWJlbCA9ICIwOmFydCI7Cj4+PiArICAgICAgICByZWFkLW9ubHk7Cj4+PiArICAg
ICAgICBjb21wYXRpYmxlID0gIm52bWVtLWNlbGxzIjsKPj4+ICsgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+Pj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4+PiArCj4+PiArICAg
ICAgICBtYWNhZGRyX2FydF8wOiBtYWNhZGRyQDAgewo+Pj4gKyAgICAgICAgICByZWcgPSA8MHgw
IDB4Nj47Cj4+PiArICAgICAgICB9Owo+Pj4gKwo+Pj4gKyAgICAgICAgbWFjYWRkcl9hcnRfNjog
bWFjYWRkckA2IHsKPj4+ICsgICAgICAgICAgcmVnID0gPDB4NiAweDY+Owo+Pj4gKyAgICAgICAg
fTsKPj4+ICsgICAgICB9Owo+Pj4gKyAgICB9Owo+Pgo+PiBGaXJzdCBvZiBhbGw6IEkgZnVsbHkg
c3VwcG9ydCBzdWNoIGEgZmVhdHVyZS4gSSBuZWVkIGl0IGZvciBCcm9hZG9tCj4+IHBsYXRmb3Jt
cyB0aGF0IHVzZSAiYnJjbSxiY205NDd4eC1jZmUtcGFydGl0aW9ucyIgZHluYW1pYyBwYXJ0aXRp
b25zLgo+PiBJbiBteSBjYXNlIGJvb3Rsb2FkZXIgcGFydGl0aW9uIGlzIGNyZWF0ZWQgZHluYW1p
Y2FsbHkgKGl0IGRvZXNuJ3QgaGF2ZQo+PiBjb25zdCBvZmZzZXQgYW5kIHNpemUpLiBJdCBjb250
YWlucyBOVk1FTSBkYXRhIGhvd2V2ZXIgdGhhdCBuZWVkcyB0byBiZQo+PiBkZXNjcmliZWQgaW4g
RFQuCj4+Cj4+IFRoaXMgYmluZGluZyBob3dldmVyIGxvb2tzIGxvb3NlIGFuZCBjb25mdXNpbmcg
dG8gbWUuCj4+Cj4gCj4gSSBhZ3JlZS4KPiAKPj4gRmlyc3Qgb2YgYWxsIGRpZCB5b3UgcmVhbGx5
IG1lYW4gdG8gdXNlICJxY29tLHNtZW0iPyBNeSBmaXJzdCBndWVzcyBpcwo+PiB5b3UgbWVhbnQg
InFjb20sc21lbS1wYXJ0Ii4KPj4KPiAKPiBZZXMgc29ycnksIEkgd2FzIHJlZmVycmluZyB0byB0
aGUgc21lbSBwYXJzZXIgcWNvbSxzbWVtLXBhcnQKPiAKPj4gU2Vjb25kbHkgY2FuJ3Qgd2UgaGF2
ZSBwYXJ0aXRpb25zIGRlZmluZWQganVzdCBhcyBzdWJub2RlcyBvZiB0aGUKPj4gcGFydGl0aW9u
cyB7IC4uLiB9OyBub2RlPwo+Pgo+IAo+IEkgd291bGQgbG92ZSB0byB1c2UgaXQuIE15IG9ubHkg
Y29uY2VybiBpcyB0aGF0IGR1ZSB0byB0aGUgZmFjdAo+IHRoYXQgd2UgaGF2ZSB0byBzdXBwb3J0
IGxlZ2FjeSBwYXJ0aXRpb24gZGVjbGFyaW5nLCB3b25kZXIgaWYgdGhpcyBjb3VsZAo+IGNyZWF0
ZSBzb21lIHByb2JsZW0uIEknbSByZWZlcnJpbmcgdG8gZGVjbGFyaW5nIGZpeGVkIHBhcnRpdGlv
biB3aXRob3V0Cj4gdXNpbmcgYW55IGNvbXBhdGlibGUvc3RhbmRhcmQgYmluZGluZyBuYW1lLgoK
TGVnYWN5IHBhcnRpdGlvbmluZyB3b24ndCBraWNrIGluIGlmIHlvdSBoYXZlICJwYXJ0aXRpb25z
IiB3aXRoCiJjb21wYXRpYmxlIiBzdHJpbmcuIFdlJ3JlIHNhZmUgaGVyZS4gSnVzdCBjaGVja2Vk
IHRvIGJlIHN1cmUuCgoKPiBJIHJlbWVtYmVyIHdlIGltcHJvdmVkIHRoYXQgd2l0aCB0aGUgaW50
cm9kdWN0aW9uIG9mIHRoZSBudm1lbSBiaW5kaW5nCj4gYnkgbWFraW5nIHRoZSBmaXhlZC1wYXJ0
aXRpb24gY29tcGF0aWJsZSBtYW5kYXRvcnkuIEJ1dCBJIHdvdWxkIGxpa2UgdG8KPiBoYXZlIGV4
dHJhIGNoZWNrLiBXb25kZXIgaWYgdG8gYmUgb24gdGhlIHNhZmUgcGFydCB3ZSBjYW4gY29uc2lk
ZXIKPiBhcHBlbmRpbmcgdG8gdGhlICJkeW5hbWljIHBhcnNlciIgYSBjb21wYXRpYmxlIGxpa2Ug
ImR5bmFtaWMtcGFydGl0aW9ucyIKPiBhbmQgdXNlIHlvdXIgd2F5IHRvIGRlY2xhcmUgdGhlbSAo
YWthIGtlZXBpbmcgdGhlIGR5bmFtaWMtcGFydGl0aW9uIGFuZAo+IHJlbW92aW5nIHRoZSBleHRy
YSBwYXJhbGxlbCBwYXJ0aXRpb25zIGxpc3QpCj4gCj4gRmVlbCBmcmVlIHRvIHRlbGwgbWUgaXQn
cyBqdXN0IGEgc3R1cGlkIGFuZCB1bm5lY2Vzc2FyeSBpZGVhLiBJIGp1c3QKPiBoYXZlIGZlYXIg
dG8gaW50cm9kdWNlIHJlZ3Jlc3Npb24gaW4gdGhlIHBhcnRpdGlvbiBwYXJzaW5nIGxvZ2ljLgoK
SSdtIGNvbmZ1c2VkLiBJIHRoaW5rIGFsbCBkeW5hbWljIHBhcnRpdGlvbmVycyBhbHJlYWR5IGhh
dmUgYQoiY29tcGF0aWJsZSIgc2V0LgoKQ2FuIHlvdSBwb3N0IGFuIGV4YW1wbGUgb2YgRFQgYmlu
Z2luZyB5b3UgZGVzY3JpYmVkIGFib3ZlLCBwbGVhc2U/CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
