Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5B0C2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 08:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmQfZhKJ2jYy6GC7CBnSzi8jaJlhMPl7KKftXt0/AZ0=; b=ib2otIQPzImfIW
	hU96pdNVuOJ5Bomo8VmKdHmWpxUqxXG19hXFoDqdlFckVSB3MHZLnuKSzKck+6GKbfevYTPuWYdbV
	9tupDfyC5rfpm+tcMhUQcSZ1HxIaIgCx3P3b65sD32bbKCCILYNz1ImgXm592K/Tm9vh7K34VzA2C
	ov9tX4M2KY7B42QFq5s9iiddu0Zy+qnSMyj7vOG8yrM9WyDF17HUgDqsK1yyJ972s6sEP7OBsF65m
	zrAnNgk5pt0Hcga4L21dyOQgiaedQw5OiPaVmY4apBwU9Lx6K1W89JR80YFzT8aLfLU/PMSqrdr4h
	oVsnAtYS8xmrse301ayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkUw-00000009kaV-0bP1;
	Thu, 27 Jun 2024 08:28:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkUl-00000009kXe-1BmH;
	Thu, 27 Jun 2024 08:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 893DD611E2;
	Thu, 27 Jun 2024 08:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF220C2BBFC;
	Thu, 27 Jun 2024 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719476921;
	bh=n/uEXqzaAS0LB/LRznxb+HuYwPZJVllY5Qhdrwu1MqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEJZDHhVhcNiVug6kgdBPbYxRjCNx3u1B6goW2YKr70VVSxpBOxlBUHeSuYa69PEO
	 evUjmHD04cVXV97ioGmV3hC66TnlzhUmiTVfDnx82jeam1/5GVSaKrmaNr8cpBMXOw
	 8ElIXezAY0pkC1nzBYb5NtlIA8abPWhBuy+YAeh32+IqCX00aDhGxRp3lvyLRCz4yO
	 xyZs7jyr3zFqI06WgnbXHULic4LJo+85KS/zFk/1Zy9T4+iB8MD92cf7ss7dqUgoYz
	 jO/xxmlIKNrjscgSLWgU30KlHGdw8b7kuzL9AfjX0Lh1nRVv89E3Db7ACr7prEHib7
	 AgMu06ztKLyiQ==
Date: Thu, 27 Jun 2024 09:28:33 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rahul Tanwar <rtanwar@maxlinear.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: intel,lgm: drop inactive maintainers from
 intel
Message-ID: <20240627082833.GI2532839@google.com>
References: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_012843_690826_85686E80 
X-CRM114-Status: GOOD (  12.89  )
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

T24gV2VkLCAyNiBKdW4gMjAyNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gRW1haWxz
IHRvIGNodWFuaHVhLmxlaUBpbnRlbC5jb20sIG1hbGxpa2FyanVuYXgucmVkZHlAaW50ZWwuY29t
LAo+IHlpeGluLnpodUBpbnRlbC5jb20gYW5kIHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBs
aW51eC5pbnRlbC5jb20KPiBib3VuY2Ugd2l0aCB0aGUgc2FtZSBtZXNzYWdlOgo+IAo+ICAgWW91
ciBtZXNzYWdlIHdhc24ndCBkZWxpdmVyZWQgdG8gWWl4aW4uemh1QGludGVsLmNvbSBiZWNhdXNl
IHRoZQo+ICAgYWRkcmVzcyBjb3VsZG4ndCBiZSBmb3VuZCBvciBpcyB1bmFibGUgdG8gcmVjZWl2
ZSBlbWFpbC4KPiAKPiBUaGUgSW50ZWwgTEdNIFNvQyB3YXMgYXBwYXJlbnRseSBwYXJ0IG9mIEhv
bWUgR2F0ZXdheSBkaXZpc2lvbiB3aGljaCB3YXMKPiBhY3F1aXJlZCBieSBNYXhsaW5lYXIsIHNv
IHN3aXRjaCBtYWludGVuYW5jZSBvZiBhZmZlY3RlZCBiaW5kaW5ncyB0byB0aGUKPiBvbmx5IGtu
b3duIG5vbi1ib3VuY2luZyBNYXhsaW5lYXIgYWRkcmVzczogUmFodWwgVGFud2FyLgo+IAo+IEkg
ZG8gbm90IGtub3cgaWYgUmFodWwgVGFud2FyIG9yIE1heGxpbmVhciB3YW50IHRvIG1haW50YWlu
IHRoZQo+IGJpbmRpbmdzLCBzbyByZWdhcmRsZXNzIG9mIHRoaXMgY2hhbmdlIHdlIHNob3VsZCBj
b25zaWRlciBiaW5kaW5ncwo+IGFiYW5kb25lZCBhbmQgcHJvYmFibHkgZHJvcCBzb29uLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL2ludGVsLGNndS1sZ20ueWFtbCAgICB8IDIgKy0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2RtYS9pbnRlbCxsZG1hLnlhbWwgICAgICAgICB8IDMgKy0tCj4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtbGdtLnlhbWwgICAgICAgICAg
fCAzICstLQoKQWNrZWQtYnk6IExlZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+Cgo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ludGVsLGxnbS1lYnVuYW5kLnlhbWwgIHwg
MiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L2ludGVsLGxnbS1l
bW1jLXBoeS55YW1sIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGh5L2ludGVsLGxnbS11c2ItcGh5LnlhbWwgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9pbnRlbCxsZ20taW8ueWFtbCAgIHwgMiArLQo+ICA3IGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9u
ZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
