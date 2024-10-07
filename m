Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223B8CFB441
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLDfZr45fEc+87+pnXoevfmt4cbRbOXY7WfQYV71mQQ=; b=MdqQsR5W/htgtG
	3zeNadSTFLa9Sb5G6bvwgSwhU3cCePdJvxpteU8IfGDzhT/Yvdw7kzPV3shesjekIanyT38VaNgBb
	7XNxLZUnIsDex/RnN+gc3RSZYvuxxBgUOYcNSonr59eZYvsDrblaSz4wMXX4phvMzYfLz0euUP1jA
	CvPCl9Sl8PlpGiyCervZ7OJoozyXOBFvGox2FEBF0OdOv0sw3aJDcFnWJSPywqneSDO4XJ6hOEpFv
	nyD6SfOvoTBfZ1I68GAAapdYnmZ89Wkmluj9W3jG02ZxLay8Oxgq9ud49Ah3KzHj0QRpJZcGn9l+l
	lFU+kXBaxRwDVNzyYiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxodG-00000002hKw-3KZj;
	Mon, 07 Oct 2024 14:22:42 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoRT-00000002dvq-0qrh
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 14:10:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 260896000E;
	Mon,  7 Oct 2024 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728310228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QM3e6qzQDy2C99cSqo9Yp5PCA7Kk8OlSQ1p1wJmlJ0I=;
	b=VNQGl7fA6cKQkXXBFMm3vRPJoW/xthQQ5sd+4SZaP1Wxnx9rwhA7fW/jIMP55B5sOYB6m6
	FZQ695yF4qq1jExLgOxiWIL0pSI7AtAwiHje8AQGsb7YPVlxboNHfRI+MPkBCIHcPmyzDN
	lb+mC5pqoCjZPZih+5gIqo2UErqA0jhyBcN3Xtm4fydYMbOnqs4dUrM8kIIcScZ2JaGeDK
	ENqZlBXL+nfiLJGiMT1qydUHCxs3z5FJNg4GyguFi/A8Z1HcJvE7t+NbtSlyeDBxxFCrAG
	s1Y3UwBbZcgbQGlwDNt8O2ZKSuyuQkpNjjMjluYgRfE6UIwakJD2xeDFl/YgGw==
Date: Mon, 7 Oct 2024 16:10:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: keguang.zhang@gmail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: Add Loongson-1 NAND
 Controller
Message-ID: <20241007161027.386e7409@xps-13>
In-Reply-To: <20241002-loongson1-nand-v10-1-17162eff80e2@gmail.com>
References: <20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com>
	<20241002-loongson1-nand-v10-1-17162eff80e2@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_071031_780918_477E41D9 
X-CRM114-Status: UNSURE (   5.44  )
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

SGkgS2VndWFuZywKCj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ICsgICJebmFuZEBbMC0zXSQiOgo+
ICsgICAgdHlwZTogb2JqZWN0Cj4gKyAgICAkcmVmOiByYXctbmFuZC1jaGlwLnlhbWwKPiArCj4g
KyAgICByZXF1aXJlZDoKPiArICAgICAgLSBuYW5kLXVzZS1zb2Z0LWVjYy1lbmdpbmUKPiArICAg
ICAgLSBuYW5kLWVjYy1hbGdvCgpBY3R1YWxseSBJIHRvbGQgeW91IGEgbWlzdGFrZS4gVGhlIG5v
LWVjYy1lbmdpbmUgY2FzZSBzaG91bGQgcmVtYWluCnZhbGlkLCBzbyB3ZSBjYW5ub3QgcmVxdWly
ZSB0aGVzZSBwcm9wZXJ0aWVzIGluIHRoZSBiaW5kaW5ncy4KCk15IGZhdWx0LCBzb3JyeSBhYm91
dCB0aGF0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
