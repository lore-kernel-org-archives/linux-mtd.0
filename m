Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73662C4345F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 07:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6idrZCvnYLbH2MkS3nT3TfvKh4Libadrqt8TZXrC7I=; b=r19WdoTiTFUDW9
	o4AXq9PP/5BNn13vixPs7upPnErOqsglcyGvcTpBwggWq0G54SK4bVNyKbYd86V2RObXGl6y0TlGX
	xgJeyeKpRKTgwr2TesJXK4Ms4e25Ov+6tpid9pXs78R8u9jCgwyOyndy/2lF6Uxfw7WvVJ3V+QjHC
	3LuauEwXe0S94a6OfewxR7Uc9iJhVEKstY19c+P0OtSU0DIQYcUDoYqQ2u4i0W/Z3Qdi2/k1X1WcR
	XS4/fcJUZv3GuCb3oJ5p0fgSTO0xeQr1w1JR9aszZNnPaRW0W6IG/Xc7+VzgSHEh4CKY6wcx4XLPO
	qyi4/1XQjdnS8QjMRuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sYl-00000006Q3U-3V63;
	Mon, 06 May 2024 07:14:52 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sYi-00000006Q1p-2r14
	for linux-mtd@lists.infradead.org;
	Mon, 06 May 2024 07:14:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FBFFC0005;
	Mon,  6 May 2024 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714979686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dlMWT58sNslF6/PywFTgVb8B4K2AkFKS2JdJ04ybUM=;
	b=kUjdiYdDz9ua+bFQ4PfrO/xM0z6iIZkKKGkpQs2hkepXleMh07irjTNReu4L1Y01qdwi7s
	sJWfQ7GF2ygAMKH6ACP0GV8uAuzYBSPY5/emANHO/7VflPP8Zbi93Kfv94d+iQK3jClQ58
	d3SBob6DbjPHW2rZKnP8xL5Jv+dyMAPtJ6Bd3eE2K07EaH+L/HpCVKMidFFqxgvhJxZspe
	5a6Tn6i1+CflfPpuLt+fqHKRtimS0C+isz68VVCECZ4ZlmxFZbSjm6Q7wKugnXs7Yp0ZN5
	GbRMgfM3UIaKOGpjwGeWR6kvGGw01YBBbIT9V8ZXWhuSmRRiqDY0MasudHCoLA==
Date: Mon, 6 May 2024 09:14:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: keguang.zhang@gmail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240506091444.59228fa9@xps-13>
In-Reply-To: <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_001449_006778_8C92BC62 
X-CRM114-Status: GOOD (  17.06  )
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

SGVsbG8sCgpkZXZudWxsK2tlZ3VhbmcuemhhbmcuZ21haWwuY29tQGtlcm5lbC5vcmcgd3JvdGUg
b24gVHVlLCAzMCBBcHIgMjAyNAoxOToxMToxMCArMDgwMDoKCj4gRnJvbTogS2VndWFuZyBaaGFu
ZyA8a2VndWFuZy56aGFuZ0BnbWFpbC5jb20+Cj4gCj4gQWRkIGRldmljZXRyZWUgYmluZGluZyBk
b2N1bWVudCBmb3IgTG9vbmdzb24tMSBOQU5EIENvbnRyb2xsZXIuCj4gCj4gU2lnbmVkLW9mZi1i
eTogS2VndWFuZyBaaGFuZyA8a2VndWFuZy56aGFuZ0BnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2NzoKPiAtIHJlbmFtZSB0aGUgZmlsZSB0byBsb29uZ3NvbixsczFiLW5mYy55YW1sCj4g
Cj4gQ2hhbmdlcyBpbiB2NjoKPiAtIEEgbmV3bHkgYWRkZWQgcGF0Y2gKPiAtLS0KPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2xvb25nc29uLGxzMWItbmZjLnlhbWwgfCA2NiArKysrKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbG9vbmdz
b24sbHMxYi1uZmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
bG9vbmdzb24sbHMxYi1uZmMueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5hNjlmMjJiOWZkOWUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9sb29uZ3NvbixsczFiLW5mYy55YW1sCj4gQEAg
LTAsMCArMSw2NiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL210ZC9sb29uZ3NvbixsczFiLW5mYy55YW1sIwo+ICskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3Rp
dGxlOiBMb29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxlcgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAg
LSBLZWd1YW5nIFpoYW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiArCj4gK2FsbE9mOgo+
ICsgIC0gJHJlZjogbmFuZC1jb250cm9sbGVyLnlhbWwKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAg
Y29tcGF0aWJsZToKPiArICAgIG9uZU9mOgo+ICsgICAgICAtIGNvbnN0OiBsb29uZ3NvbixsczFi
LW5mYwoKV2hhdCBpcyB0aGUgcmF0aW9uYWxlIGJlaGluZCB0aGlzIGNob2ljZT8gU2VlbXMgbGlr
ZSB0aGUgYiB2YXJpYW50IGhhcwp0d28gcG9zc2libGUgaW1wbGVtZW50YXRpb25zIGFuZCBzaG91
bGQgYWx3YXlzIGJlIHByZWNlZGVkIGJ5IGEgbW9yZQpzcGVjaWZpYyBjb21wYXRpYmxlLgoKQXMg
dGhlcmUgaXMgY3VycmVudGx5IG5vIGRlc2NyaXB0aW9uIG9mIHRoaXMgY29udHJvbGxlciB1cHN0
cmVhbSwgSQp3b3VsZCBub3QgY2FyZSB0b28gbXVjaCBhYm91dCBhbnkgb3V0LW9mLXRyZWUgZGVz
Y3JpcHRpb24gYW5kIGRpcmVjdGx5CmdvIGZvciBhIGNsZWFuIGRlc2NyaXB0aW9uLgoKPiArICAg
ICAgLSBpdGVtczoKPiArICAgICAgICAgIC0gZW51bToKPiArICAgICAgICAgICAgICAtIGxvb25n
c29uLGxzMWEtbmZjCj4gKyAgICAgICAgICAgICAgLSBsb29uZ3NvbixsczFjLW5mYwo+ICsgICAg
ICAgICAgLSBjb25zdDogbG9vbmdzb24sbHMxYi1uZmMKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4
SXRlbXM6IDEKPiArCj4gKyAgZG1hczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGRtYS1u
YW1lczoKPiArICAgIGNvbnN0OiByeHR4Cj4gKwo+ICtwYXR0ZXJuUHJvcGVydGllczoKPiArICAi
Xm5hbmRAWzAtM10kIjoKPiArICAgIHR5cGU6IG9iamVjdAo+ICsgICAgJHJlZjogcmF3LW5hbmQt
Y2hpcC55YW1sCj4gKwo+ICsgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiAr
cmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGRtYXMKPiArICAt
IGRtYS1uYW1lcwoKU2hvdWxkIERNQSBwcm9wcyBiZSByZXF1aXJlZD8KCj4gKwo+ICt1bmV2YWx1
YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgIG5h
bmQtY29udHJvbGxlckAxZmU3ODAwMCB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJsb29uZ3Nv
bixsczFiLW5mYyI7Cj4gKyAgICAgICAgcmVnID0gPDB4MWZlNzgwMDAgMHg0MD47Cj4gKwo+ICsg
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+
Owo+ICsKPiArICAgICAgICBkbWFzID0gPCZkbWEgMD47Cj4gKyAgICAgICAgZG1hLW5hbWVzID0g
InJ4dHgiOwoKVGhlcmUgaXMgYSBwcmVmZXJyZWQgc3BhY2luZyBmb3IgRFQgbm9kZXMsIHNlZToK
aHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZGV2aWNldHJlZS9iaW5kaW5ncy9kdHMtY29kaW5nLXN0
eWxlLmh0bWwKCj4gKwo+ICsgICAgICAgIG5hbmRAMCB7Cj4gKyAgICAgICAgICAgIHJlZyA9IDww
PjsKPiArICAgICAgICAgICAgbmFuZC11c2Utc29mdC1lY2MtZW5naW5lOwo+ICsgICAgICAgICAg
ICBuYW5kLWVjYy1hbGdvID0gImhhbW1pbmciOwoKVGhlc2UgdHdvIHByb3BlcnRpZXMgYXJlIG5v
dCBuZWVkZWQuIFVubGVzcyB0aGVyZSBpcyBubyBoYXJkd2FyZSBFQ0MKY2FwYWJpbGl0eSBvbiB0
aGlzIGNvbnRyb2xsZXIgYW5kIGluIHRoaXMgY2FzZSB5b3UgbmVlZCB0byBlbnN1cmUgdGhlCnBy
b3BlcnRpZXMgYXJlIHByZXNlbnQgaW4gdGhlIHNjaGVtYS4KCj4gKyAgICAgICAgfTsKPiArICAg
IH07Cj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
