Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C434EB64D7
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20db5/2qNLlgjQOVQ+eSdkqaGfZbq4nZ+A2vOPKw3N4=; b=q9r3STcHM0pqLQ
	54UYHzAp5kdFIUyFfXgSN7GhrsRfGnltIDImeQMTC096rmeiCbq+3DVccbAU0y/XpfWG/EMvwtDsv
	yIdI3kYp2LC3oXARDGE7vdkWDSyCXZ+fvED58YuUokhAD+kCp9zvyI7tXhgTDX6bfN37bkjJP/55Y
	ZUNwCsme/khawDj4eKAP5R/q2VqYv+1LCd5vVAqETuiDrbg+ukGgBNx00VC0lJ0wZxtbmVI7GZtXv
	xBzrtJk9DX1ugjJnnH5SQiVwBDoDJZC7tdLXtCXejecKDq290r4nkDDnJyljlru2keCKk5CNH+v+g
	hYxWDUVxPE79T0PIzVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDpYI-00Ah5s-0g;
	Mon, 26 Jun 2023 16:58:58 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDpYF-00Ah55-21;
	Mon, 26 Jun 2023 16:58:57 +0000
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-780c8df59caso174674339f.3;
        Mon, 26 Jun 2023 09:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687798734; x=1690390734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C68yqM+uQF5bxYAeEfhwAi+z+PT5sKlVa+KlpLAFqEs=;
        b=gxVVcTITlV0JY7ENRwk2DHBgcw6qs0n5FP0FZbJ0Y7GnoMwnw3hLOlfpBei+66swuY
         JNeaxaoomcYzv3xZ0mIfcv3KVT/bYCDffppM3or4GJ9DpCSTXK/J+6nTLP9Ohy4AbCBV
         vij9zqsdZyTbyL+Px4wPP2jXM38O4BdHMhICatiA/jmM4iNAp9dyG1iJWTG4H+nzEIIs
         G+MYmmWu+UiWsAA4E4buVyFS+U6kzwXEYvD62GvoFBtp+VKnLbz8wYfQSBbwWfxjHjKH
         SjIg3vuuM0NTWaIM8vt2oa0yy9SCK17mWAovvH1Sp5ZlHpFjXioWIKSiVix7D0sCsaza
         +2SA==
X-Gm-Message-State: AC+VfDzwwYXfMhSuZf2c9aSHjU0VCp5UxCkNqnxcl8nDP84a7Bl229/J
	kCvugKPD96DDcOCLMzpY/g==
X-Google-Smtp-Source: ACHHUZ5CEus2w7VnsWg2fQvqYZxwoYG1DHsqvjJsZhIQE0zdvVKxJF1eFuTYxc/ujTcghM0JMksElw==
X-Received: by 2002:a05:6602:131e:b0:783:4c29:b978 with SMTP id h30-20020a056602131e00b007834c29b978mr6702809iov.12.1687798734371;
        Mon, 26 Jun 2023 09:58:54 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id dq42-20020a0566384d2a00b00423230a3085sm1841238jab.99.2023.06.26.09.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:58:53 -0700 (PDT)
Received: (nullmailer pid 3390691 invoked by uid 1000);
	Mon, 26 Jun 2023 16:58:51 -0000
Date: Mon, 26 Jun 2023 10:58:51 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: nvmem: fixed-cell: add compatible for
 MAC cells
Message-ID: <20230626165851.GA3387880-robh@kernel.org>
References: <20230626113716.17674-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626113716.17674-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_095855_667613_ADDA4EE9 
X-CRM114-Status: GOOD (  29.79  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMDE6Mzc6MTZQTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBB
IGxvdCBvZiBob21lIHJvdXRlcnMgaGF2ZSBOVk1FTSBmaXhlZCBjZWxscyBjb250YWluaW5nIE1B
QyBhZGRyZXNzIHRoYXQKPiBuZWVkIHNvbWUgZnVydGhlciBwcm9jZXNzaW5nLiBJbiB+OTklIGNh
c2VzIE1BQyBuZWVkcyB0byBiZToKPiAxLiBPcHRpb25hbGx5IHBhcnNlZCBmcm9tIEFTQ0lJIGZv
cm1hdAo+IDIuIEluY3JlYXNlZCBieSBhIHZlbmRvci1waWNrZWQgdmFsdWUKPiAKPiBUaGVyZSB3
YXMgYWxyZWFkeSBhbiBhdHRlbXB0IHRvIGRlc2lnbiBhIGJpbmRpbmcgZm9yIHRoYXQgYXQgTlZN
RU0KPiBkZXZpY2UgbGV2ZWwgaW4gdGhlIHBhc3QuIEl0IHdhc24ndCBhY2NlcHRlZCB0aG91Z2gg
YXMgaXQgZGlkbid0IHJlYWxseQo+IGZpdCBOVk1FTSBkZXZpY2UgbGF5ZXIuCj4gCj4gVGhlIGlu
dHJvZHVjdGlvbiBvZiBOVk1FTSBmaXhlZC1jZWxscyBsYXlvdXQgc2VlbXMgdG8gYmUgYW4gb3Bw
b3J0dW5pdHkKPiB0byBwcm92aWRlIGEgcmVsZXZhbnQgYmluZGluZyBpbiBhIGNsZWFuIHdheS4K
PiAKPiBUaGlzIGNvbW1pdCBhZGRzIGEgKmdlbmVyaWMqIGNvbXBhdGlibGUgc3RyaW5nOiAibWFj
LWJhc2UiLiBBcyBhbHdheXMgaXQKPiBuZWVkcyB0byBiZSBjYXJlZnVsbHkgcmV2aWV3ZWQuCj4g
Cj4gT3BlbldydCBwcm9qZWN0IGN1cnJlbnRseSBzdXBwb3J0cyB+MzAwIGhvbWUgcm91dGVycyB0
aGF0IGhhdmUgTlZNRU0KPiBjZWxsIHdpdGggYmluYXJ5LXN0b3JlZCBiYXNlIE1BQy5UIGhvc2Ug
ZGV2aWNlcyBhcmUgbWFudWZhY3R1cmVkIGJ5Cj4gbXVsdGlwbGUgdmVuZG9ycy4gVGhlcmUgYXJl
IFRQLUxpbmsgZGV2aWNlcyAoNzYgb2YgdGhlbSksIE5ldGdlYXIgKDE5KSwKPiBELUxpbmsgKDEx
KSwgT3Blbk1lc2ggKDkpLCBFbkdlbml1cyAoOCksIEdMLmlOZXQgKDgpLCBaVEUgKDcpLAo+IFhp
YW9taSAoNSksIFViaXF1aXRpICg2KSBhbmQgbW9yZS4gVGhvc2UgZGV2aWNlcyBkb24ndCBzaGFy
ZSBhbgo+IGFyY2hpdGVjdHVyZSBvciBTb0MuCj4gCj4gQW5vdGhlciAyMDAgZGV2aWNlcyBoYXZl
IGJhc2UgTUFDIHN0b3JlZCBpbiBhbiBBU0NJSSBmb3JtYXQgKG5vdCBhbGwKPiB0aG9zZSBkZXZp
Y2VzIGhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8gRFQgdGhvdWdoKS4KPiAKPiBJdCB3b3VsZCBiZSBp
bXByYWN0aWNhbCB0byBwcm92aWRlIHVuaXF1ZSAiY29tcGF0aWJsZSIgc3RyaW5ncyBmb3IgTlZN
RU0KPiBsYXlvdXRzIG9mIGFsbCB0aG9zZSBkZXZpY2VzLiBJdCBzZWVtcyBsaWtlIGEgdmFsaWQg
Y2FzZSBmb3IgYWxsb3dpbmcgYQo+IGdlbmVyaWMgYmluZGluZyBpbnN0ZWFkLiBFdmVuIGlmIHRo
aXMgYmluZGluZyB3aWxsIG5vdCBiZSBzdWZmaWNpZW50IGZvcgo+IHNvbWUgZnVydGhlciBkZXZp
Y2VzIGl0IHNlZW1zIHRvIGJlIHVzZWZ1bCBlbm91Z2ggYXMgaXQgaXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IFYyOiBEcm9w
ICJtYWMtYXNjaWkiIGFzIGxlbmd0aCBjYW4gYmUgY2hlY2tlZCBpbnN0ZWFkCj4gICAgIEZpeCAi
YWxsT2YiIGJ5IGFkZGluZyByZXF1aXJlZDogWyBjb21wYXRpYmxlIF0KPiAtLS0KPiAgLi4uL2Jp
bmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtY2VsbC55YW1sICAgIHwgMjYgKysrKysrKysrKysr
KysrKysrKwo+ICAuLi4vYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1sYXlvdXQueWFtbCAg
fCAxMiArKysrKysrKysKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0ueWFt
bCAgICAgIHwgIDUgKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtY2VsbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtY2VsbC55YW1sCj4gaW5kZXggZTY5
ODA5ODQ1MGUxLi4wMzZhOWVkODg4OTMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtY2VsbC55YW1sCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtY2VsbC55
YW1sCj4gQEAgLTExLDYgKzExLDE1IEBAIG1haW50YWluZXJzOgo+ICAgIC0gU3Jpbml2YXMgS2Fu
ZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+ICAKPiAgcHJvcGVydGll
czoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgb25lT2Y6Cj4gKyAgICAgIC0gY29uc3Q6IG1hYy1i
YXNlCj4gKyAgICAgICAgZGVzY3JpcHRpb246ID4KPiArICAgICAgICAgIENlbGwgd2l0aCBiYXNl
IE1BQyBhZGRyZXNzIHRvIGJlIHVzZWQgZm9yIGNhbGN1bGF0aW5nIGV4dHJhIHJlbGF0aXZlCj4g
KyAgICAgICAgICBhZGRyZXNzZXMuCj4gKyAgICAgICAgICBJdCBjYW4gYmUgc3RvcmVkIGluIGEg
cGxhaW4gYmluYXJ5IGZvcm1hdCAoY2VsbCBsZW5ndGggMTIpIG9yIGFzIGFuCgpEb24ndCB5b3Ug
bWVhbiBhIGxlbmd0aCBvZiA2PwoKPiArICAgICAgICAgIEFTQ0lJIHRleHQgbGlrZSAiMDA6MTE6
MjI6MzM6NDQ6NTUiIChjZWxsIGxlbmd0aCAxNykuCj4gKwo+ICAgIHJlZzoKPiAgICAgIG1heEl0
ZW1zOiAxCj4gIAo+IEBAIC0yNSw2ICszNCwyMyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgIGRl
c2NyaXB0aW9uOgo+ICAgICAgICAgICAgU2l6ZSBpbiBiaXQgd2l0aGluIHRoZSBhZGRyZXNzIHJh
bmdlIHNwZWNpZmllZCBieSByZWcuCj4gIAo+ICthbGxPZjoKPiArICAtIGlmOgo+ICsgICAgICBy
ZXF1aXJlZDogWyBjb21wYXRpYmxlIF0KPiArICAgIHRoZW46Cj4gKyAgICAgIGlmOgo+ICsgICAg
ICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgICBjb21wYXRpYmxlOgo+ICsgICAgICAgICAgICBj
b250YWluczoKPiArICAgICAgICAgICAgICBjb25zdDogbWFjLWJhc2UKPiArICAgICAgdGhlbjoK
PiArICAgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgICAgIiNudm1lbS1jZWxsLWNlbGxzIjoK
PiArICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBmaXJzdCBhcmd1bWVudCBpcyBhIE1BQyBh
ZGRyZXNzIG9mZnNldC4KPiArICAgICAgICAgICAgY29uc3Q6IDEKPiArICAgICAgICByZXF1aXJl
ZDoKPiArICAgICAgICAgIC0gIiNudm1lbS1jZWxsLWNlbGxzIgo+ICsKPiAgcmVxdWlyZWQ6Cj4g
ICAgLSByZWcKPiAgCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWxheW91dC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtbGF5b3V0LnlhbWwKPiBpbmRleCBj
MjcxNTM3ZDA3MTQuLmIzYTA5ZTg4NjRmMSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1sYXlvdXQueWFtbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWxh
eW91dC55YW1sCj4gQEAgLTQ0LDYgKzQ0LDE4IEBAIGV4YW1wbGVzOgo+ICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Owo+ICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ICAKPiArICAg
ICAgICBtYWNAMTAwIHsKPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtYWMtYmFzZSI7Cj4g
KyAgICAgICAgICAgIHJlZyA9IDwweDEwMCAweGM+Owo+ICsgICAgICAgICAgICAjbnZtZW0tY2Vs
bC1jZWxscyA9IDwxPjsKPiArICAgICAgICB9Owo+ICsKPiArICAgICAgICBtYWNAMTEwIHsKPiAr
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtYWMtYmFzZSI7Cj4gKyAgICAgICAgICAgIHJlZyA9
IDwweDExMCAweDExPjsKPiArICAgICAgICAgICAgI252bWVtLWNlbGwtY2VsbHMgPSA8MT47Cj4g
KyAgICAgICAgfTsKPiArCj4gICAgICAgICAgY2FsaWJyYXRpb25ANDAwMCB7Cj4gICAgICAgICAg
ICAgIHJlZyA9IDwweDQwMDAgMHgxMDA+Owo+ICAgICAgICAgIH07Cj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLnlhbWwKPiBpbmRleCA5ODAy
NDQxMDA2OTAuLjlmOTIxZDk0MDE0MiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0ueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55YW1sCj4gQEAgLTQ5LDcgKzQ5LDEwIEBAIHBy
b3BlcnRpZXM6Cj4gIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICJAWzAtOWEtZl0rKCxbMC03XSk/
JCI6Cj4gICAgICB0eXBlOiBvYmplY3QKPiAtICAgICRyZWY6IGxheW91dHMvZml4ZWQtY2VsbC55
YW1sCj4gKyAgICBhbGxPZjoKPiArICAgICAgLSAkcmVmOiBsYXlvdXRzL2ZpeGVkLWNlbGwueWFt
bAo+ICsgICAgICAtIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgICBjb21wYXRpYmxlOiBmYWxzZQo+
ICAgICAgZGVwcmVjYXRlZDogdHJ1ZQo+ICAKPiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUK
PiAtLSAKPiAyLjM1LjMKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
