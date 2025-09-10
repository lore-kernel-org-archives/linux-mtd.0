Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E2DCA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxNkveGpBOcMRqST3WCjKJpLa7BF+1N8pCmddctrTak=; b=KHMl0zB8b7RzlY
	sCrDj71jEvZ75zkLLe1Duqj683/D2KUfL5jnvRPdvDvPOE3V0tem57CHXeNjBbBFGrnimA554Fm4v
	tNfgZ5cmqn9mdicJ2RQEi3t1Kesz0cLYGKG4srTSamfCK3j/gRVYAiB6tOmxS/39TsX65OtAQxlU7
	nwTKiWN5eEuHtiLR2ly6WIIGxs+PwN48tAUy8KplP5gw4GT9QPoe17faA/cF6fXWj7VLWTCV5t8Wl
	utLw0JW/zLqhE6kJ4yynXRKrl3AqOrdBHFbyD7c/L9E0Fb92JNaIXOEszQJHY+o4FRnr5T2jB2le7
	sKCBHVSh0xfkXs6Zqm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGUu-0000000D2TR-2MZy;
	Wed, 10 Sep 2025 08:48:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGUq-0000000D2QR-28Kj
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 08:48:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D95BD1A094C;
	Wed, 10 Sep 2025 08:48:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD6CD606D4;
	Wed, 10 Sep 2025 08:48:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DABB102F28A1;
	Wed, 10 Sep 2025 10:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757494083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dN+1i6d8UPUpI1B2syCPjraQa4MBlPD0R+WcgvBzssU=;
	b=XzzO2s+gbAYCRDK65qI97IRSh9+XaVduxowWkmB17x9o6kEZ1OC2g5strtFPOv6h+VZTnG
	YYePbp4mpXS3LtlaMNdDk0SFLKgn++vgvrUk+5jBGDgDa68vWdl9eSZ0YEO1vTClikYomj
	VoiyVOWNR8EsrlDMeaaMQbuqf8yn162Y1VdNG2yidqjnBlIbIezpXt+1Bt6qRHvLN0FmqK
	M1ITxZgPiilf4q5Ve9ShN+UD1luo/BvvDAG6P0ufHsjQyfA9E+U44NsxHIhgqHIryhNF2y
	BQ7zTVSjEu0YNeh+ASmZPrktBKYPth53Lm97mGFMzd5Yx0WFqRK5zWF1/4gucQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,  Huacai Chen
 <chenhuacai@loongson.cn>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Keguang Zhang <keguang.zhang@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Huacai Chen
 <chenhuacai@kernel.org>,  Xuerui Wang <kernel@xen0n.name>,
  loongarch@lists.linux.dev,  devicetree@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 1/7] mtd: rawnand: loongson1: Rename the prefix from
 ls1x to loongson
In-Reply-To: <8c804abb75277f0ff389151c1cd58c94f2b258ca.1756991031.git.zhoubinbin@loongson.cn>
	(Binbin Zhou's message of "Thu, 4 Sep 2025 21:06:33 +0800")
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
	<8c804abb75277f0ff389151c1cd58c94f2b258ca.1756991031.git.zhoubinbin@loongson.cn>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 10:47:49 +0200
Message-ID: <87bjnielsa.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_014808_680549_D16E6622 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

SGkgQmluYmluLAoKT24gMDQvMDkvMjAyNSBhdCAyMTowNjozMyArMDgsIEJpbmJpbiBaaG91IDx6
aG91YmluYmluQGxvb25nc29uLmNuPiB3cm90ZToKCj4gSSBhbSBnb2luZyB0byBpbnRyb2R1Y2Ug
dGhlIE5BTkQgY29udHJvbGxlcnMgb2YgdGhlIExvb25nc29uLTJLIHNlcmllcwoKUGxlYXNlIGFk
b3B0IGEgbW9yZSBnbG9iYWwgcGhyYXNpbmcsIGxpa2UgIkluIG9yZGVyIHRvIGludHJvZHVjZSIg
cmF0aGVyCnRoYW4gdGhlIGZpcnN0IHNpbmd1bGFyIHBlcnNvbi4KCj4gQ1BVcywgd2hpY2ggYXJl
IHNpbWlsYXIgdG8gTG9vbmdzb24tMS4KPgo+IEFzIHByZXBhcmF0aW9uLCByZW5hbWUgYWxsIHBy
ZWZpeGVzIGZyb20gTG9vbmdzb24xLXNwZWNpZmljIHRvCj4gTG9vbmdzb24tZ2VuZXJpYy4KPgo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmluYmlu
IFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+Cj4gLS0tCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
