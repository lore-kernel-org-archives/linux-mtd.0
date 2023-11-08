Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C53C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjY5Ss06umGCVbyrSAwRFwdA0T2OFHmZZzZMHHgS6CI=; b=s2wmlvIJMMJNlz
	K049JBArEmRLWG0gFKlAewsxI4Rp9J4t2MWa+RDastTgJeISjb873f/xL9piCNZbbi8iHLPhzk18H
	V8pSVouu05K5sCltJKr44eUNK9zEoYDuGeriOrJnydOa1XthB2clcHnUnT2MrPBLkDJGxTewq2kLs
	DuJ7VlC1jUwPyiwcJU4ahWf0PuG2Z9wKuZd+cRoND5Y18jiQMV47914MMnfvqaS3QJKItVoYqGHzN
	nztygOVfn40HAJNGPEZyQBKHM8/oFb/alZRGeoG5MTW4MmQFmg9FkGrEofAk75wPfkpujpmtARnin
	K9uEyaiQd2usQIytJMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kxX-004F8W-1Z;
	Wed, 08 Nov 2023 15:59:15 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kxT-004F6P-1m;
	Wed, 08 Nov 2023 15:59:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 705276000A;
	Wed,  8 Nov 2023 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699459147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+kB2MAhqd2CZLOXA9zNCWTpxhkyv6CSvJsAidaTRfM8=;
	b=KKWV5oa4oO9WQ67xnEEwSXBsBlzSskaYTpOkboLkWa5FAVNWFeSdcUgK/5QaocyH62Qu1k
	TcmmbOUN8DpF27Jw8fuIno/znuahXsLUsmLAFLlMLYEzn9foFKHbiC3yZ7snvoHnzjDnsQ
	3Wop1gCuH2cYUViRgtcxTAO/dWjCdALBNakXOjYcWAzxyAKpwj/irGRtn5HO3UO69a0epX
	a6jfLehliImS1qxCAWFp8gvFanv7Admk4FH+Vqly/M5x7Y2hv5gHnV+aDv9A/7cPsqkS0r
	pk29HXu8SZexmLp88HPpYegT1eFpPPdJWNMTVNFNfDXl5AnYSdZZkEWkUoN4HA==
Date: Wed, 8 Nov 2023 16:59:05 +0100
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
Subject: Re: [PATCH 6/6] mtd: rawnand: gpio: Rename file
Message-ID: <20231108165905.4675430e@xps-13>
In-Reply-To: <20231108-fix-mips-nand-v1-6-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
	<20231108-fix-mips-nand-v1-6-5fc5586d04de@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_075911_736328_EA3EFDB1 
X-CRM114-Status: GOOD (  13.30  )
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
MjAyMyAxNTozMzo1NCArMDEwMDoKCj4gVGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBHUElPIE5B
TkQgY29udHJvbGxlciBpcyBqdXN0ICJncGlvIgo+IHdpdGggdGhlIHVzZWNhc2UgZm9yIE5BTkQg
aW1wbGllZCBmcm9tIHRoZSBmb2xkZXIgbmFuZC9yYXcuCj4gCj4gVGhpcyBpcyBub3Qgc28gZ3Jl
YXQgd2hlbiB0aGUgbW9kdWxlIGdldHMgdGhlIG5hbWUgImdwaW8ua28iLgo+IFJlbmFtZSB0aGUg
aW1wbGVtZW50YXRpb24gdG8gbmFuZC1ncGlvLmMgc28gdGhlIG1vZHVsZSBpcwo+IG5hbWVkIG5h
bmQtZ3Bpby5rbyB3aGljaCBpcyBtb3JlIHJlYXNvbmFibGUuCj4gCj4gV2UgcHV0ICJuYW5kIiBm
aXJzdCBpbnN0ZWFkIG9mICJncGlvIiBiZWNhdXNlIHRoZSBvcmRlciBpcwo+IHVzdWFsbHkgPHN1
YnN5c3RlbT4tPGRyaXZlcj4uYywgY2YgbHMgZHJpdmVycy9ncGlvLwoKRG8geW91IG1pbmQgaWYg
d2UgdGFrZSB0aGUgImVuZ2xpc2giIHZlcnNpb24gd2hpY2ggd291bGQgcmF0aGVyIGJlCiJncGlv
LW5hbmQtY29udHJvbGxlci5jL28iPyBJIF9yZWFsbHlfIHdhbnQgcGVvcGxlIHRvIHVuZGVyc3Rh
bmQgd2UKZG9uJ3QgZW11bGF0ZSB0aGUgc3RvcmFnZSBidXQgdGhlIGhvc3QgcGFydCBoZXJlLgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
