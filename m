Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E50DC4345F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 06:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSDdmo8RrIqYjpU0xdKIlaiwr/RgS84WIj8gsHdgtDM=; b=NfXl/qQbKmrtH0
	ImdahFrEaBFxKwyK/nrh23ssBsWzVg9qNYjbzm96Y1z/Kmt6lqpLPvxrbOBFYE+hSTr586KYxJu5D
	CAtKcqLOWguWi4V7PN1J2u1obn8TPPxPu7O/GpSG6EjHInbTMzFLtH4ZwH2aBTPjXg7Jd3TFhmrtn
	6B5+OGi1rQLOBChl7Yzc8E0xQE0ZjNkqSJWHbtuV51EN01CMuKr6bMYAFu2uI53xFvFxmGLDheMEz
	Pzc/rT56zk5cDsDLmdG3cPrJNMChhtx6kuf1FATqOhrJ0uH4f20EBOmApZGHRsdDmxBFLaT0mLSZ3
	05Z0ax5AEWnfyhZw6IdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3rrO-00000006J5h-2nz8;
	Mon, 06 May 2024 06:30:02 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3rrK-00000006J3V-2Xyt
	for linux-mtd@lists.infradead.org;
	Mon, 06 May 2024 06:30:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3029520009;
	Mon,  6 May 2024 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714976994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mbe52SsrGtFjVUxzVcPXdTIv8tO7ZFSm6CXXG49YCtU=;
	b=lf2eOVXCHOhCPhhLOG49d0BOL9BLWcSYcvXKv5WGS6MxkZYPTV1WCz2/vSgrPiuSGv0X6t
	YxzGe+i6bC0lFh3mTeaWoLOL763zqt464WKjyX5ghxGjqKglarQfnko5zcBCdPOl4WiScu
	l/XbZpiKtujeQPAeWAPOSgACNmE/LCeJo3841n0TZ86qnPBO381HH3sGeORvAfmC6jUmrS
	fQTNrMTqmolY9dOnzYVweBrFr62CLpFXt+RGfPoR4w7kmxBzTXTMzDKwNe/qPutTvptb2C
	ryYQznj22a4alrjorblL/g19t1sun8H+oH8fCavHvBM2pQepsgY+nrXg/02UyQ==
Date: Mon, 6 May 2024 08:29:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ming Qian <ming.qian@nxp.com>, Zhou Peng
 <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jeff
 LaBundy <jeff@labundy.com>, Shijie Qin <shijie.qin@nxp.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Use full path to other schemas
Message-ID: <20240506082952.6715fc8d@xps-13>
In-Reply-To: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
References: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_232958_950456_EA94A249 
X-CRM114-Status: UNSURE (   9.50  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFN1
biwgIDUgTWF5IDIwMjQgMTA6NDY6MTggKzAyMDA6Cgo+IFdoZW4gcmVmZXJlbmNpbmcgb3RoZXIg
c2NoZW1hLCBpdCBpcyBwcmVmZXJyZWQgdG8gdXNlIGFuIGFic29sdXRlIHBhdGgKPiAoL3NjaGVt
YXMvLi4uLiksIHdoaWNoIGFsbG93cyBhbHNvIGFuIHNlYW1sZXNzIG1vdmUgb2YgcGFydGljdWxh
ciBzY2hlbWEKPiBvdXQgb2YgTGludXgga2VybmVsIHRvIGR0c2NoZW1hLgoKSSBkaWRuJ3Qga25v
dyBhYm91dCB0aGlzLiBZb3UgcHJvYmFibHkgd2FudCB0byBhZGQgYSBjaGVjayBvdmVyIHVzZXMg
b2YKcmVsYXRpdmUgcGF0aHMgaW4gdGhlIHRvb2xpbmcgbm93IDotKQoKPiBTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4g
Cj4gLS0tCj4gCj4gUm9iLCBtYXliZSB5b3UgY2FuIHRha2UgaXQgZGlyZWN0bHk/IFNob3VsZCBh
cHBseSBjbGVhbmx5IG9uIHlvdXIgdHJlZS4KCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
