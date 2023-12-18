Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62616C35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4enrzbJcmDbHv+NABDQCo+O8jRzpTXJnMgOV4gyrnwU=; b=atW9KUrfEa9C6Y
	6cjY+BVVfpckN+KTJw5DMxi9T6Ij0mhUqNfx/Y2HhGLCOqegz6kTx8cDngTSZVo64j48Kjfez2oda
	z9fcOoR3IA1yKjO4CIHNvFVenAT4ip4pEneVLPtsLM+YONY0NEJ7GvwvKvcJnFnOQH9a+By68jFwr
	NHizjcLpKNnGx2sS9dlBthAzXTe5hBpyT2+egFQ8MQ2PMXDI0lhrGpm39ywlgiWPmBzNN8V8KDdzM
	0I1CP//LzgxuhyjOqxgFMLe6EUoe4cR+O9CnikgghItjW8Ul+IVCQBWHhsX9cKaw7PEw6lbJWOmih
	UEQYUKBqygHz5b1mduEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFEvD-00B5z3-1R;
	Mon, 18 Dec 2023 14:48:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFEv8-00B5xI-1f;
	Mon, 18 Dec 2023 14:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7EC66101E;
	Mon, 18 Dec 2023 14:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438EEC433C8;
	Mon, 18 Dec 2023 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702910914;
	bh=Nl/4Qju8StrRIofVcTdVeGpmbqeL4PjNP1NAI3w2Biw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TdEYnNi0HD1pTzTsCxVjg07p8VmSZlcpuYuu9jZDnd4KLp6h24Uox/LC/G5VWYfZI
	 INgPRbB5yVwG+fBPMlXaicwaIWEtC3h4/lbTxT7yf9w7VREY5SBF3xqryU72nnjTej
	 InTQveRKJluXad38RyMvVbvldJk1UnEJMMm7XQFzqZWqYyHyUWUaEWUR2/1dh3gRFd
	 KsDeO4nvGicz+RbzPr8SJHJJrQmsuqWrLjvlTZ3HK7CIv9pVuf5Lfpv/Cgu21gNgdV
	 G7Q7aj+AJabj73GT5d73y0RmbReHZ3NLgA9FYv7h2yekBb3abZa5X8MH5hD6eVSZ12
	 I/4uexH/YOIjQ==
Received: (nullmailer pid 3792451 invoked by uid 1000);
	Mon, 18 Dec 2023 14:48:32 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, u-boot@lists.denx.de
In-Reply-To: <20231218133722.16150-1-zajec5@gmail.com>
References: <20231218133722.16150-1-zajec5@gmail.com>
Message-Id: <170291091219.3792434.8389294947030479112.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: layouts: add U-Boot
 environment variables layout
Date: Mon, 18 Dec 2023 08:48:32 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_064838_660567_0FCA4F86 
X-CRM114-Status: GOOD (  14.92  )
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

Ck9uIE1vbiwgMTggRGVjIDIwMjMgMTQ6Mzc6MTkgKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVS1Cb290
IGVudiBkYXRhIGlzIGEgd2F5IG9mIHN0b3JpbmcgZmlybXdhcmUgdmFyaWFibGVzLiBJdCdzIGEg
Zm9ybWF0Cj4gdGhhdCBjYW4gYmUgdXNlZCBvZiB0b3Agb2YgdmFyaW91cyBzdG9yYWdlIGRldmlj
ZXMuIEl0cyBiaW5kaW5nIHNob3VsZAo+IGJlIGFuIE5WTUVNIGxheW91dCBpbnN0ZWFkIG9mIGEg
c3RhbmRhbG9uZSBkZXZpY2UuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIGxheW91dCBiaW5kaW5nIHdo
aWNoIGFsbG93cyB1c2luZyBpdCBvbiB0b3Agb2YgTVREIE5WTUVNCj4gZGV2aWNlIGFzIHdlbGwg
YXMgYW55IG90aGVyLiBBdCB0aGUgc2FtZSB0aW1lIGl0IGRlcHJlY2F0ZXMgdGhlIG9sZAo+IGNv
bWJpbmVkIGJpbmRpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZh
bEBtaWxlY2tpLnBsPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbnZtZW0vbGF5b3V0cy91LWJvb3Qs
ZW52LnlhbWwgICAgfCA1NSArKysrKysrKysrKysrKysrKysrCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCB8ICA2ICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NjEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvdS1ib290LGVudi55YW1sCj4gCgpNeSBib3Qg
Zm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgRFRfQ0hFQ0tFUl9GTEFHUz0tbSBkdF9iaW5kaW5n
X2NoZWNrJwpvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4xMyk6
Cgp5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6CgpkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3Jz
OgovYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LmV4YW1wbGUuZHRiOiBwYXJ0aXRpb25A
NDAwMDA6ICdldGhhZGRyJywgJ3JlZycgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczog
J3BpbmN0cmwtWzAtOV0rJwoJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYueWFtbCMKL2J1aWxkcy9yb2JoZXJyaW5n
L2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZt
ZW0vdS1ib290LGVudi5leGFtcGxlLmR0YjogcGFydGl0aW9uLXUtYm9vdC1lbnY6ICdldGhhZGRy
JyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLVswLTldKycKCWZy
b20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbnZtZW0vbGF5b3V0
cy91LWJvb3QsZW52LnlhbWwjCgpkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2Rv
Y3MpOgoKU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVl
LWJpbmRpbmdzL3BhdGNoLzIwMjMxMjE4MTMzNzIyLjE2MTUwLTEtemFqZWM1QGdtYWlsLmNvbQoK
VGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRp
ZmZlcmVudCBkZXBlbmRlbmN5CnNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5
b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhl
IGFib3ZlCmVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBh
bmQgZHQtc2NoZW1hIGlzIHVwIHRvCmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdy
YWRlCgpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBj
b21tYW5kIHlvdXJzZWxmLiBOb3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8g
eW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZl
ciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1h
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
