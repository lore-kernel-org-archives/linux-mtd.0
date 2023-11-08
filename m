Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206BCC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOwyIfpn5ZVjksqmpk2odbZa45pWqE4zC1c47CNRi6A=; b=hvnCIyP/LYzpPo
	TR60ZvGo5iSEMGfouLEtPUD+sqq/olGEx32SA5aaJQmGFdiXPK7UYgw8daLoW9z61mt/BTYXxDZsx
	+T1juR3xWGj3WI4e0F6s5DaOeiaZjo0r0wXg6QCJIplEVHTbo5+8B5NHgYQErYZNpdZTSjSgHZetb
	OSLThmORn1NIwt1PlxbXBe471viHY1rpOX0/tKmRPxiquMS5phm0OswZZ7Yn5/L67NSfZG+0LbcF9
	NUSfzwqvqeMjpxet7RE35NhG2JvO5P1c3Ig1YJ0XAydCYUKqnm2y4cbL7TSL2UDpvWozgtOIw0UaG
	vhqnfjTDoI9iulDmcETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0ksf-004EFO-0E;
	Wed, 08 Nov 2023 15:54:13 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0ksa-004EDx-2f;
	Wed, 08 Nov 2023 15:54:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C80EA60008;
	Wed,  8 Nov 2023 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699458843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYS94S7++WYKx+tHBKHHGfIvXY84QiR+o61nAhem3TE=;
	b=JMmrAxt6CfsPfRIT849ExEJi2VTTQkFSMaqLfqgUH4rvB5ZfddAYUbwUnjgGxDIq8YaOxl
	B5Zs58doliOu1V5XAgr5Tw38Z1+5CRVNvd7AZsFJ5YKyTc5v/EX8df+BFjxU/kDeqmhRWV
	8mifPlDY5iQb3p6b6jxvAmqf0Y87HAK6Iz/dWJ2ogWB2MW6jdZshdyV/tjYtH+CDrseL6c
	tW0wdNCF061azZnNKVx9kSNfGNTvWf/PXpbdSKGyKItVc1PwwFQztE7OqJlQDOQ8QYNGuv
	K+J87XKp360j9MWnbE3DsJ5UTmGYXLso7wSAid5sirjABqj0oBrNjYf/fsuuPg==
Date: Wed, 8 Nov 2023 16:53:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik
 <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ben Dooks
 <ben.dooks@codethink.co.uk>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH 4/6] mtd: rawnand: gpio: Use device properties
Message-ID: <20231108165359.33dccef0@xps-13>
In-Reply-To: <20231108-fix-mips-nand-v1-4-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
	<20231108-fix-mips-nand-v1-4-5fc5586d04de@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_075409_022511_403A7FF3 
X-CRM114-Status: GOOD (  21.98  )
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

SGkgTGludXMsCgpsaW51cy53YWxsZWlqQGxpbmFyby5vcmcgd3JvdGUgb24gV2VkLCAwOCBOb3Yg
MjAyMyAxNTozMzo1MiArMDEwMDoKCj4gVGhlIHBsYXRmb3JtIGRhdGEgKHN0cnVjdCBncGlvX25h
bmRfcGxhdGRhdGEpIGlzbid0IHJlYWxseSB1c2VkCj4gaW4gYW55IGJvYXJkZmlsZSBpbiB0aGUg
a2VybmVsOiB0aGUgb25seSBwcm9iZSBwYXRoIGlzIGZyb20KPiBkZXZpY2UgdHJlZS4KPiAKPiBD
b252ZXJ0IHRoZSBkcml2ZXIgdG8gbm90IHVzZSB0aGUgcGxhdGZvcm0gZGF0YSBoZWFkZXIgYXQg
YWxsCj4gYW5kIHJlYWQgb3V0IHRoZSBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIHVzaW5nIGRldmlj
ZQo+IHByb3BlcnRpZXMgc28gd2UgZG9uJ3QgbmVlZCB0byBoYXZlIHRoZSBkcml2ZXIgYmUgZXhj
bHVzaXZlbHkKPiBkZXZpY2UgdHJlZSBlaXRoZXI6IEFDUEkgb3Igc29mdHdhcmUgbm9kZXMgd29y
ayBmaW5lIGlmCj4gbmVlZCBiZS4gRHJvcCB0aGUgaWZkZWZmZXJ5IGFyb3VuZCBDT05GSUdfT0Yg
YXMgYSBjb25zZXF1ZW5jZS4KPiAKPiBUaGUgY29kZSByZWFkcyAiYmFuay13aWR0aCIgdG8gcGxh
dC0+b3B0aW9ucyBmbGFncyBhbmQgcGFzc2VzCj4gaXQgZGlyZWN0bHkgdG8gdGhlIE5BTkQgY2hp
cCBzdHJ1Y3QsIHNvIGp1c3QgYXNzaWduIHRoaXMKPiBkaXJlY3RseSB0byB0aGUgY2hpcCBpbnN0
ZWFkLgo+IAo+IFRoZSBjb2RlIHJlYWRzIG9uZSBwcm9wZXJ0eSAiY2hpcC1kZWxheSIgdGhhdCBp
dCBzdG9yZXMKPiBpbiBwZGF0YS0+ZGVsYXkgYW5kIG5ldmVyIHVzZSwgc28gZHJvcCB0aGlzIGFs
dG9nZXRoZXIuCj4gSWYgdGltaW5ncyBzaG91bGQgYmUgc3VwcG9ydGVkIHRoaXMgY2FuIHByb2Jh
Ymx5IGJlIGRvbmUgaW4KPiBhIG1vcmUgZGV0YWlsZWQgd2F5IHVzaW5nIHRoZSBuZXcgZWxhYm9y
YXRlIHRpbWluZ3Mgc3RydWN0cwo+IHRoYXQgZXhpc3QgZm9yIE5BTkQuCj4gCj4gVGhlIHBsYXRm
b3JtIGRhdGEgY29udGFpbnMgYSBjYWxsYmFjayB0byBhdWdtZW50IHBhcnRpdGlvbnMsCj4gYnV0
IHNpbmNlIHRoZXJlIGFyZSBubyBib2FyZCBmaWxlcyB1c2luZyB0aGlzIHBsYXRmb3JtCj4gZGF0
YSB0byBkZWZpbmUgYSBncGlvIE5BTkQgZGV2aWNlLCB0aGlzIGlzIG5ldmVyIHVzZWQgc28KPiB0
aGUgY29kZSBoYW5kbGluZyBpdCBjYW4gYmUgZGVsZXRlZC4KCk5pY2UgY2xlYW51cC4gSSdtIGEg
Yml0IG1vcmUgcmVsdWN0YW50IG9uIHRoZSBiaW5kaW5ncyBzaWRlLCBJJ2xsIGNvbWUKYmFjayB0
byBpdCBsYXRlciwgYnV0IHRoZSBkcml2ZXIgc2lkZSBsb29rcyBuZWF0LgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
