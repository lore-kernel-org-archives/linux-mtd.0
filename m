Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD31C25B78
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiYobwmzYznJgG9Wt4jAHQTtOCzLz+xILRYGFu9o2/c=; b=pJMOkV3XW+HQJP
	6ckpQLix3rZ2YvipU9lklUbpoZ8RBXt2doZqi+f4nKcXHNKSSEJqm/w4fDJg2U+U6YhvbMXhrDwmD
	F4EUI95kgGkBXVu6K0noHFPjptDgc7RpuhEYq7UquJUQqorqVymIRkfV3KwrLhZ8t4+hh/I91BgOA
	PPEqvqlRDRu+9hl7yKf+Q30wgQ74MLXHhsU4RttIYkLdZtgE6GQqVa36eFMtTUz2PbX+ty6OOE4eo
	PoJPkxejCjc9BiMARhtLVgijPrPqQ7eWOjGEACpgl159a6BPoPoqAI24wKRgUIhEEM2xOA16qW4Ah
	jmbF131iSahCAR8JbShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwwC-00000000oN2-0cz4;
	Tue, 28 May 2024 13:32:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBww9-00000000oMG-0kLs
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 13:32:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9004620AF;
	Tue, 28 May 2024 13:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C84C3277B;
	Tue, 28 May 2024 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716903140;
	bh=dhSBmo/CC8MHZ1NdaR65BMzydNIYHlnG51CFEasQqa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GGVio4F8HQcSQI6ogGTFqUV09ymhEAV3eJ8dZtUX0yF1uA+tlRby5UG1FgyP+T+gO
	 ilXgioCHnRwpdC7xVWyWcrZE0jvzbK+/T3H/2S1VoFv6LRJUQVKlg8ZHG5NzZmbbkP
	 4Pf7iGGM1d+25rcP7xYZlNNlH7+jlJf4yw+6hmTLeJfgjbAelU365GQS5KqniZM+0+
	 pxcRLATpBOyhV/3VATXPRjqrOKditoOh/+TS9SVgb0oxMfiG2UGp6fVkMfcbKpGsMN
	 oGcUn8F1EsjT0mNNCa/s3cNkcO+0djD/5w/etRNX8oDuCTVYm0l/sCPB0OXBOyug8S
	 ZKQe4BwQH7dZQ==
Message-ID: <56f19120-7ddb-4006-99f6-e1b043ed88e1@kernel.org>
Date: Tue, 28 May 2024 15:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Esben Haabendal <esben@geanix.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
 <20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
 <eb911c50-2f66-43dd-a1ff-398a3e7c56a2@csgroup.eu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <eb911c50-2f66-43dd-a1ff-398a3e7c56a2@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_063221_718281_5E8CAA47 
X-CRM114-Status: GOOD (  15.16  )
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

T24gMjgvMDUvMjAyNCAxNToxNSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAy
OC8wNS8yMDI0IMOgIDE0OjI4LCBFc2JlbiBIYWFiZW5kYWwgYSDDqWNyaXTCoDoKPj4gW1ZvdXMg
bmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgZXNiZW5AZ2Vhbml4LmNvbS4g
RMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6Ly9ha2EubXMv
TGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPj4KPj4gV2hpbGUgdXNlIG9mIGZzbF9p
ZmMgZHJpdmVyIHdpdGggTkFORCBmbGFzaCBpcyBmaW5lLCBhcyB0aGUgZnNsX2lmY19uYW5kCj4+
IGRyaXZlciBzZWxlY3RzIEZTTF9JRkMgYXV0b21hdGljYWxseSwgd2UgbmVlZCB0aGUgQ09ORklH
X0ZTTF9JRkMgb3B0aW9uIHRvCj4+IGJlIHNlbGVjdGFibGUgZm9yIHBsYXRmb3JtcyB1c2luZyBm
c2xfaWZjIHdpdGggTk9SIGZsYXNoLgo+IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZC4KPiAKPiBTaGFs
bCBJIHVuZGVyc3RhbmQgOgo+IAo+IFdoaWxlIHVzZSBvZiBmc2xfaWZjIGRyaXZlciB3aXRoIE5B
TkQgZmxhc2ggaXMgZmluZSBhcyB0aGUgZnNsX2lmY19uYW5kIAo+IGRyaXZlciBzZWxlY3RzIEZT
TF9JRkMgYXV0b21hdGljYWxseSwgLi4uLgo+IAo+IG9yCj4gCj4gLi4uLCBhcyB0aGUgZnNsX2lm
Y19uYW5kIGRyaXZlciBzZWxlY3RzIEZTTF9JRkMgYXV0b21hdGljYWxseSB3ZSBuZWVkIAo+IHRo
ZSBDT05GSUdfRlNMX0lGQyBvcHRpb24gdG8gYmUgc2VsZWN0YWJsZSBmb3IgcGxhdGZvcm1zIHVz
aW5nIGZzbF9pZmMgCj4gd2l0aCBOT1IgZmxhc2gKPiAKPiAKPiAKPiBJJ20gZmluZSB3aXRoIHRo
ZSBmYWN0IHRoYXQgeW91IHdhbnQgdG8gYmUgYWJsZSB0byBzZWxlY3QgaXQgd2hlbiB5b3UgCj4g
dXNlIE5PUiBmbGFzaGVzLCAKCkJ1dCB1c2VycyBhcmUgbm90IGZpbmUuLi4gdGhlaXIgbWVtb3J5
IHdvbid0IHdvcmsgaWYgdGhleSBjYW5ub3QgY2hvb3NlCml0IChpZiB5b3UgbWVhbnQgc2VsZWN0
PWNob29zZSkuCgo+IGFsbHRob3VnaCBJIGNhbid0IHNlZSB3aHksIGJ1dCB3aHkgZG8geW91IG5l
ZWQgdG8gCj4gY2hhbmdlIHRoZSAic2VsZWN0IiB0byBhICJkZXBlbmQiID8gWW91IHNob3VsZCBi
ZSBhYmxlIHRvIGxlYXZlIGl0IGFzIGEgCgpBcyBleHBsYWluZWQgaW4gdjE6IHVzZXItdmlzaWJs
ZSBzeW1ib2xzIHNob3VsZCBub3QgYmUgc2VsZWN0ZWQuIE5vdGhpbmcKb2RkIGhlcmUuCgo+ICJz
ZWxlY3QiIGluIHdoaWNoIGNhc2UgcGF0Y2ggMiB3b3VsZG4ndCBiZSBuZWNlc3NhcnkuCgoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
