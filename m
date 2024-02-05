Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41338C48295
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvB61RDkxyc9LQDqnP8WpB6hgZaNIiXE4VKYWWE/V1Y=; b=bRxh4C4Tmf5uSO
	IUrBh+AQn0U2egS2a693YsAhZLFZHEI0DdCp0wxbxvDwplZqies5sIlV/sBoMZENzOa/ttouucZMX
	FULW4RXmo1mXtXybE/NGoU2SkEW+dM7xw2WyCUGFndwake77ANhfGzEd7Y7pWHb7m03aAigyluMYh
	Rosnk4dVsBPhxtfsEGXn1zoeFw40+gVUxnmghoKuuRRkW5DDFLbF3TE8w2eqrqIW1cn0GaDa1lNtI
	0LPSDa0FfQXAxQ3vp1wJpqs64gitv16tfLYr/tNRXWks9xY9alwPtUA8BF3cC6BzFD/z91+YcbQqC
	G0OIfq9fhZKNfP7jCnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWyzn-00000003PUI-1ItE;
	Mon, 05 Feb 2024 13:26:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWyzk-00000003PRk-07dn;
	Mon, 05 Feb 2024 13:26:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8ED9BFF811;
	Mon,  5 Feb 2024 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707139601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mJeoLvrMZja6m+m7EbjiMgme3HRnrMEAgds1gESvyI=;
	b=RvR2Io/mFkUOlAI951aA+ed3sDSo1QIzzLxgeg0nB/mmNg96VV9t7LmbyH4flPNVGPrQrl
	3yAOAfohYN73qbkQVkSIlvkX5rv7EHi/Ncn49HOyoHRmJlaI/ozEK/XXngzEMDgTal7tzv
	xKNua8XrpGFgv2/cPgjguRAUmp+tAEcSZTaBd9b5dWh5cHdLOEdm+wm1KtXMEKcJvhSKX9
	TYkAf+D2gHR6opO2wQRE3jSSSktakW48XTIG8d/w5oKiT/nhbjWuA9o0tG59OtVcvnM1Su
	nyP8KpAYL2bKeNsfrlpZxOwricqsAtPWAtO/ujLgEb8B6SIdICgYrebKM+3TCg==
Date: Mon, 5 Feb 2024 14:26:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: William Zhang <william.zhang@broadcom.com>, Linux MTD List
 <linux-mtd@lists.infradead.org>, Linux ARM List
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
Subject: Re: [PATCH v4 03/12] dt-bindings: mtd: brcmnand: Add ecc strap
 property
Message-ID: <20240205142639.5d7c70f0@xps-13>
In-Reply-To: <20240203-expenses-tarmac-c564bc7ae34f@spud>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
	<20240203002834.171462-4-william.zhang@broadcom.com>
	<20240203-expenses-tarmac-c564bc7ae34f@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_052644_389821_EE0B815A 
X-CRM114-Status: GOOD (  26.80  )
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

SGksCgpjb25vckBrZXJuZWwub3JnIHdyb3RlIG9uIFNhdCwgMyBGZWIgMjAyNCAxNDo0OTo1MCAr
MDAwMDoKCj4gT24gRnJpLCBGZWIgMDIsIDIwMjQgYXQgMDQ6Mjg6MjRQTSAtMDgwMCwgV2lsbGlh
bSBaaGFuZyB3cm90ZToKPiA+IEFkZCBicmNtLG5hbmQtZWNjLXVzZS1zdHJhcCB0byBnZXQgZWNj
IGFuZCBzcGFyZSBhcmVhIHNpemUgc2V0dGluZ3MgZnJvbQo+ID4gYm9hcmQgYm9vdCBzdHJhcCBm
b3IgYnJvYWRiYW5kIGJvYXJkIGRlc2lnbnMgYmVjYXVzZSB0aGV5IGRvIG5vdCBzcGVjaWZ5Cj4g
PiBlY2Mgc2V0dGluZyBpbiBkdHMgYnV0IHJhdGhlciB1c2luZyB0aGUgc3RyYXAgc2V0dGluZy4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9h
ZGNvbS5jb20+Cj4gPiAKPiA+IC0tLQo+ID4gCj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gLSBNb3Zl
IGVjYyBzdHJhcCBwcm9wZXJ0eSB0byB0aGlzIHNlcGFyYXRlIHBhdGNoIGFuZCByZW1vdmUgc29t
ZQo+ID4gbm9uLWJpbmRpbmcgcmVsYXRlZCB0ZXh0IGZyb20gdGhlIGRlc2NyaXB0aW9uCj4gPiAK
PiA+IENoYW5nZXMgaW4gdjM6IE5vbmUKPiA+IENoYW5nZXMgaW4gdjI6IE5vbmUKPiA+IAo+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1s
IHwgOCArKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJj
bSxicmNtbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9i
cmNtLGJyY21uYW5kLnlhbWwKPiA+IGluZGV4IGQwMTY4ZDU1YzczZS4uMjU5OWQ5MDJlYzNhIDEw
MDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNt
LGJyY21uYW5kLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvYnJjbSxicmNtbmFuZC55YW1sCj4gPiBAQCAtMTQ3LDYgKzE0NywxNCBAQCBwYXR0ZXJu
UHJvcGVydGllczoKPiA+ICAgICAgICAgICAgbGF5b3V0Lgo+ID4gICAgICAgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiAgCj4gPiArICAgICAgYnJj
bSxuYW5kLWVjYy11c2Utc3RyYXA6Cj4gPiArICAgICAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAg
ICAgICAgVGhpcyBmbGFnIGluZGljYXRlcyB0aGUgZWNjIHN0cmVuZ3RoIGFuZCBzcGFyZSBhcmVh
IHNpemUgc2hvdWxkCj4gPiArICAgICAgICAgIGJlIHJldHJpZXZlZCBmcm9tIHRoZSBTb0MgTkFO
RCBib290IHN0cmFwIHNldHRpbmcgaW5zdGVhZCBvZgo+ID4gKyAgICAgICAgICBuYW5kLWVjYy1z
dHJlbmd0aCBhbmQgYnJjbSxuYW5kLW9vYi1zZWN0b3Itc2l6ZSBvciBhdXRvIGRldGVjdGlvbi4g
IAo+IAo+IEknbSBzdGlsbCBvbiB0aGUgZmVuY2UgYWJvdXQgdGhpcyBiZWluZyBvdmVybHkgcHJl
c2NyaXB0aXZlIGFib3V0IHRoZQo+IG9wZXJhdGluZyBzeXN0ZW1zIGJlaGF2aW91ci4gSSB0aGlu
ayBpdCB3b3VsZCBiZSBnb29kIHRvIHNheSB3aHkgdGhlCj4gc3RyYXAgdmFsdWVzIGFyZSBiZXR0
ZXIgdGhhbiB0aG9zZSBleHBsaWNpdGx5IHByb3ZpZGVkIGluIERUIHJhdGhlciB0aGFuCj4ganVz
dCBzYXlpbmcgInRoZXNlIHN0cmFwIHZhbHVlcyBzaG91bGQgYmUgdXNlZCIuCgpJIGRvbid0IGtu
b3cgaWYgdGhlcmUgaXMgYSBwb2ludCBpcyBzYXlpbmcgd2h5IHRoZXkgd291bGQgYmUgYmV0dGVy
LCBhcwp0aGV5IGFyZSBub3QuIEl0IGlzIGEgLXF1ZXN0aW9uYWJsZS0gZGVzaWduIGNob2ljZS4g
SG93ZXZlciBJIHdvdWxkCmp1c3QgZ2V0IHJpZCBvZiBhbnkgbWVudGlvbiB0byBvdGhlciBwcm9w
ZXJ0aWVzLiBKdXN0IHNheSBvbmUgc2hvdWxkCmV4cGVjdCB0aGUgc3RyYXAgdmFsdWUgdG8gYmUg
cmVhZCBhbmQgYXBwbGllZCBieSB0aGUgc3lzdGVtIHdoZW4gdGhpcwpwcm9wZXJ0eSBpcyBwcmVz
ZW50LgoKPiA+ICsgICAgICAgICAgVGhpcyBpcyBjb21tb25seSB1c2VkIGJ5IHRoZSBCQ01CQ0Eg
U29DIGJvYXJkIGRlc2lnbi4KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL2ZsYWcKPiA+ICsKPiA+ICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQo+ID4gIAo+ID4gIGFsbE9mOgo+ID4gLS0gCj4gPiAyLjM3LjMKPiA+ICAgCgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
