Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7676C48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwl9NfNyeOzEfZGrGC6QSpNhQSwiI0pkizZEOiyk+ss=; b=WNDIhX3PYG2y94
	JdwXS0EmckEScYkW6HqEoSsLTbuXLxLpWHQiiU622AiJ72OHcsIs+eN3UbsSrxHTF5gul4qmPsHG7
	rGPB4uMZUQCH8Q8d8R4uQJq0yO8pfWsaxbZwCfEWLbCztiKNwHOrM/ShfJpmm54kkpM/cg2AHEC7p
	5K33oaxXBuX/sNMeHGhICcwXJipGoSh0GevauVKWqmyoyPn7qgRCS8u8HZc4XbR6F5D+Lg3bfBBJy
	VoEb734uYfCT11Larf4whfVmiVDP7dVOVTf/TjKsHYkjgGuFjam7SHhyQgo/se+WNRKTccnDS6jL5
	Ejh+eB0L2Lk0mo6W0ULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMrk-0000000E8Db-0RGa;
	Tue, 20 Feb 2024 09:56:44 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMrg-0000000E8Br-3yrv;
	Tue, 20 Feb 2024 09:56:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29EB1240005;
	Tue, 20 Feb 2024 09:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708422998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8vYmz20JtDfNNRe27+16Y9GfbpnqV9b0nYEvIzUvwE=;
	b=cvDEEtdujSkBM0JSloT0c+vkmgUHZKt59K6583zRWp+UHoVJtv9nUKuxOEXRMkwbgse7Ue
	Yg0earM/LIN0c6sfqzrIsNEZAuGsti2YXWLMqBpgJCi79h8JaYPySLLK8QlQSlEM70T1B6
	BSH6wRyz362bRgFHuRYZ4ry8o3AZY7MHONQZxBgu6wHLdYChFn9Vwp8LtI/Qj/juQQUIx4
	kihISrkrWTksIIg+AwQdNwzcs4bV284PdTRhCL1oOYyrF1gtk57A7fAzxmiIgHLH7vhIwE
	tHViXT0j+R43onIFmbbVlXZ7CiEP4fPVURi7oTK/zjaaX1R/A5/DPa1qRHDJHg==
Date: Tue, 20 Feb 2024 10:56:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: mtd: brcmnand: Add ecc strap
 property
Message-ID: <20240220105634.02b505b6@xps-13>
In-Reply-To: <20240207202257.271784-4-william.zhang@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
	<20240207202257.271784-4-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_015641_302924_9F4D45FD 
X-CRM114-Status: GOOD (  20.61  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFdlZCwgIDcg
RmViIDIwMjQgMTI6MjI6NDggLTA4MDA6Cgo+IEFkZCBicmNtLG5hbmQtZWNjLXVzZS1zdHJhcCB0
byBnZXQgZWNjIGFuZCBzcGFyZSBhcmVhIHNpemUgc2V0dGluZ3MgZnJvbQo+IGJvYXJkIGJvb3Qg
c3RyYXAgZm9yIGJyb2FkYmFuZCBib2FyZCBkZXNpZ25zIGJlY2F1c2UgdGhleSBkbyBub3Qgc3Bl
Y2lmeQo+IGVjYyBzZXR0aW5nIGluIGR0cyBidXQgcmF0aGVyIHVzaW5nIHRoZSBzdHJhcCBzZXR0
aW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJv
YWRjb20uY29tPgo+IAo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjU6Cj4gLSBVcGRhdGUgdGhlIGRl
c2NyaXB0aW9uIGZvciB0aGlzIGVjYyBzdHJhcCBwcm9wZXJ0eQo+IC0gQWRkIGNoZWNrIHRvIG1h
a2Ugc3VyZSBicmNtLG5hbmQtZWNjLXVzZS1zdHJhcCBhbmQKPiAgIG5hbmQtZWNjLXN0cmVuZ3Ro
L2JyY20sbmFuZC1vb2Itc2VjdG9yLXNpemUgY2FuIG5vdCBiZSB1c2VkIGF0IHRoZQo+ICAgc2Ft
ZSB0aW1lCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIE1vdmUgZWNjIHN0cmFwIHByb3BlcnR5IHRv
IHRoaXMgc2VwYXJhdGUgcGF0Y2ggYW5kIHJlbW92ZSBzb21lCj4gbm9uLWJpbmRpbmcgcmVsYXRl
ZCB0ZXh0IGZyb20gdGhlIGRlc2NyaXB0aW9uCj4gCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+IENo
YW5nZXMgaW4gdjI6IE5vbmUKPiAKPiAgLi4uL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlh
bWwgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sCj4gaW5kZXggNmE3MTdiY2VkZmQz
Li41MmE0Yzk5M2I2ZjEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQueWFtbAo+IEBAIC0xNDYsNiArMTQ2LDEz
IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgbGF5b3V0Lgo+ICAgICAgICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ICAKPiArICAgICAg
YnJjbSxuYW5kLWVjYy11c2Utc3RyYXA6Cj4gKyAgICAgICAgZGVzY3JpcHRpb246Cj4gKyAgICAg
ICAgICBUaGlzIHByb3BlcnR5IHJlcXVpcmVzIHRoZSBob3N0IHN5c3RlbSB0byBnZXQgdGhlIEVD
QyBzdHJlbmd0aAo+ICsgICAgICAgICAgYW5kIHN0ZXAgc2l6ZSBmcm9tIHRoZSBTb0MgTkFORCBi
b290IHN0cmFwIHNldHRpbmcuIFRoaXMgaXMgYQo+ICsgICAgICAgICAgY29tbW9uIGhhcmR3YXJl
IGRlc2lnbiBvbiBCQ01CQ0EgYmFzZWQgYm9hcmRzLgo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcKPiArCj4gICAgICB1bmV2YWx1YXRlZFByb3Bl
cnRpZXM6IGZhbHNlCj4gIAo+ICBhbGxPZjoKPiBAQCAtMTk1LDYgKzIwMiwxOCBAQCBhbGxPZjoK
PiAgICAgICAgcmVxdWlyZWQ6Cj4gICAgICAgICAgLSBpbnRlcnJ1cHQtbmFtZXMKPiAgCj4gKyAg
LSBpZjoKPiArICAgICAgcGF0dGVyblByb3BlcnRpZXM6Cj4gKyAgICAgICAgIl5uYW5kQFthLWYw
LTldJCI6Cj4gKyAgICAgICAgICByZXF1aXJlZDoKPiArICAgICAgICAgICAgLSBicmNtLG5hbmQt
ZWNjLXVzZS1zdHJhcAo+ICsgICAgdGhlbjoKPiArICAgICAgcGF0dGVyblByb3BlcnRpZXM6Cj4g
KyAgICAgICAgIl5uYW5kQFthLWYwLTldJCI6Cj4gKyAgICAgICAgICBwcm9wZXJ0aWVzOgo+ICsg
ICAgICAgICAgICBuYW5kLWVjYy1zdHJlbmd0aDogZmFsc2UKPiArICAgICAgICAgICAgYnJjbSxu
YW5kLW9vYi1zZWN0b3Itc2l6ZTogZmFsc2UKCkNhbiB5b3UgYWxzbyBleGNsdXNlIGFsbCB0aGUg
b3RoZXIgbmFuZC1lY2MtIHNldHRpbmdzIGFuZCBicmNtLApzZXR0aW5ncyBhcyB3ZWxsPyBFaXRo
ZXIgeW91IHVzZSB0aGUgc3RyYXAgKm9yKiB5b3UgcHJvdmlkZSB2YWx1ZXMgaW4KdGhlIERULCBi
dXQgbm90IGJvdGguCgo+ICsKPiAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICAKPiAg
cmVxdWlyZWQ6CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
