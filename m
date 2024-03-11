Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1773C54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0xJLV923uQ9UPTIOgc2N7IUSvKo+wcZXFN+BjvqrLk=; b=odTANaoecYbPh6
	Mu13d4bmGDYNxCdraQRNDc7YgYJfrZ5MctKTMEBoyuUyDrF/WuoieiJf0P9RCSzt8Bu4/rCKNDvEh
	7kqUPxYk8UkIOY9KvqIX0hEYgLIUWd5tQATKZK5eHzJlXZCMQN3GVqKMVWULYVjAJcdSV3E1Mwcz7
	yniEOjNZtRZVeZW4sXQ5rSQa8KGDaeNH6eRlo78YWrhBKwKzcijWLzwrK6RxUU8DQTpsLGCUd41zy
	DpollbfqKkZ4w7qxJLVeWEb7pSwV3qRzKu4IbitArzv1Ny9w7Oa43NyoDeKafc5/jTOZ1UoHwAFIF
	RNEYo5VDCPIfEj3uWDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjh4C-00000001vyp-3O4j;
	Mon, 11 Mar 2024 14:55:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjh3s-00000001vj2-0E1c
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 14:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B04DCE10FE;
	Mon, 11 Mar 2024 14:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3417C433B2;
	Mon, 11 Mar 2024 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710168927;
	bh=LvW9nTAyldiPop/Tibv4R+2RE6G1PnecV6XkNaBzfHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C/FdvGT1IhklU0hQgvncDarCtzuZJg/X9/A/KRM2Ok9EyBGOGD9918a269te/L6dJ
	 PjHJA3rntAnFWHn9/3NsK2F6kTxh6I9FK/1akxCWbSzW8IPdxcUTHkjDgM8AWd6Nxm
	 ycdRRfkkBdbmksRI6cJwQvY75MnN6I9QzrNBJ8FYOqVkidwteJJSEz50MUJ9wPEObw
	 Vf8wnp2LhIoaQoHY4lLmhaRItN2s/p4UvKtHxpjiuot0vL/M7Edl/KrzGCT8a1hWDe
	 Hvj3IicHJ2d1PXu8/XS+UvMgpBtvHjikO4FJizE2CvIDA9LKq9Xb0ea7RjPfbY84un
	 i0aj9TzbTD7mg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>,  Mark Brown
 <broonie@kernel.org>,
  Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Vaishnav Achath <vaishnav.a@ti.com>,  Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mips@vger.kernel.org,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 11/11] MIPS: mobileye: eyeq5: add octal flash node to
 eval board DTS
In-Reply-To: <f6b8d9bc-d95a-4d85-a2bc-820b1206fcaf@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Mar 2024 14:06:10 +0000")
References: <20240308-cdns-qspi-mbly-v1-0-a503856dd205@bootlin.com>
	<20240308-cdns-qspi-mbly-v1-11-a503856dd205@bootlin.com>
	<f6b8d9bc-d95a-4d85-a2bc-820b1206fcaf@linaro.org>
Date: Mon, 11 Mar 2024 15:55:23 +0100
Message-ID: <mafs0v85s95t0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_075532_603711_28EBD45D 
X-CRM114-Status: GOOD (  13.56  )
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

T24gTW9uLCBNYXIgMTEgMjAyNCwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKCj4gT24gMy84LzI0IDE3
OjE4LCBUaMOpbyBMZWJydW4gd3JvdGU6Cj4+IEFkZCBTUEktTk9SIG9jdGFsIGZsYXNoIG5vZGUg
dG8gZXZhbHVhdGlvbiBib2FyZCBkZXZpY2V0cmVlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogVGjD
qW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KPj4gLS0tCj4+ICBhcmNoL21pcHMv
Ym9vdC9kdHMvbW9iaWxleWUvZXllcTUtZXBtNS5kdHMgfCAxNSArKysrKysrKysrKysrKysKPj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9taXBzL2Jvb3QvZHRzL21vYmlsZXllL2V5ZXE1LWVwbTUuZHRzIGIvYXJjaC9taXBzL2Jvb3Qv
ZHRzL21vYmlsZXllL2V5ZXE1LWVwbTUuZHRzCj4+IGluZGV4IDY4OThiMmQ4MjY3ZC4uMGU1ZmVl
N2I2ODBjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL21pcHMvYm9vdC9kdHMvbW9iaWxleWUvZXllcTUt
ZXBtNS5kdHMKPj4gKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL21vYmlsZXllL2V5ZXE1LWVwbTUu
ZHRzCj4+IEBAIC0yMSwzICsyMSwxOCBAQCBtZW1vcnlAMCB7Cj4+ICAJCSAgICAgIDwweDggMHgw
MjAwMDAwMCAweDAgMHg3RTAwMDAwMD47Cj4+ICAJfTsKPj4gIH07Cj4+ICsKPj4gKyZvc3BpIHsK
Pj4gKwlmbGFzaDA6IGZsYXNoQDAgewo+PiArCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3Ii
Owo+PiArCQlyZWcgPSA8MD47IC8qIGNoaXAgc2VsZWN0ICovCj4+ICsKPj4gKwkJc3BpLW1heC1m
cmVxdWVuY3kgPSA8NDAwMDAwMDA+Owo+PiArCQlzcGktcngtYnVzLXdpZHRoID0gPDg+Owo+PiAr
CQljZG5zLHJlYWQtZGVsYXkgPSA8MT47Cj4+ICsJCWNkbnMsdHNoc2wtbnMgPSA8NDAwPjsKPj4g
KwkJY2Rucyx0c2QyZC1ucyA9IDw0MDA+Owo+PiArCQljZG5zLHRjaHNoLW5zID0gPDEyNT47Cj4+
ICsJCWNkbnMsdHNsY2gtbnMgPSA8NTA+Owo+Cj4gVGhlc2UgY2RucyBwcm9wZXJ0aWVzIGxvb2sg
YmFkLCB0aGV5IGJ5cGFzcyBTUEkgTk9SIGVudGlyZWx5LiBJJ2QgY2hlY2sKPiBpZiB0aGVzZSB0
aW1pbmdzIGNhbiBiZSBkZXRlcm1pbmVkIGF0IFNGRFAgcGFyc2luZyB0aW1lLCB0aGVuIEknZCBw
YXNzCj4gdGhlbSB0byB0aGUgU1BJIGNvbnRyb2xsZXIuCgpJIGFncmVlLCBidXQgSSBkb24ndCBz
ZWUgYW55IHRhYmxlIGluIFNGRFAgdGhhdCBkZXNjcmliZXMgdGhlc2UgdGltaW5ncy4KU28gSSBk
b24ndCB0aGluayB0aGVyZSBpcyBhIHdheSB0byBkaXNjb3ZlciB0aGVtLgoKPgo+IEkgc2VlIHRo
ZXNlIHByb3BlcnRpZXMgYXJlIGFscmVhZHkgYWNjZXB0ZWQgaW4gdGhlIGJpbmRpbmdzIGZpbGUg
Zm9yIGZldwo+IHllYXJzIG5vdy4gU29tZXRoaW5nIHRvIGltcHJvdmUgbGF0ZXIgb24uCgotLSAK
UmVnYXJkcywKUHJhdHl1c2ggWWFkYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
