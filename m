Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A431D1AD29
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IoAy12ghhJ+OUNDCPUUB+Q9NIRexDAShtZ8wUAwN9E=; b=okAjNgY6r3qT7M
	5P7oh8+w7g77doyl+BMJCeMY75eJXrYB6I2oF0WmWd3nsM4JAn5/2J/851LvYVOoRL0QXWJd9eGlo
	eC1Q1pXAIzaJKEpqMDm0LbY34MVq+ZuSZbHOHFVGswCUewgF1k81fij4V+cMdrvNAHRLY1VnNlLMZ
	VWP1Rcj5Zfizz2d0XZImB1AaYPBkWMtbKX1cRPWV6gReutXsImd5iKmEaHcIEVoc85Zz3dZi3NeYt
	OlYXhZsuC7D4gbwhOF6Xjiw1FceCPvJ3NZ6GpAaVTXOieXBBX1kfzmWfNbXaQ8YWKVDMWZC7LrLW/
	1XAf7n7a06esUu+hTn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zPP-0000000B1uN-0y3B;
	Wed, 16 Oct 2024 08:29:31 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0z3Q-0000000Awz5-02LB
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 08:06:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso983831a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2024 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729066006; x=1729670806; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ+Pwy0sO7KTFjfQbkx5Q5BjDMCnpAj1lw8a8QHrCPU=;
        b=c/Oplb+NhDzmU2WdS7K9yQqCYQJa4JZb8g7Dy3fXToaCYBdTKO7G4xyStbmEZIvBEP
         UxfZJtnAJJecGJdDtdRl9ZLbxFQTTH+QOQBpDQib5dEpttCusCc9AxVQdf/FFS+aEteF
         QIk9cX0R/zigcUgxUdSg3GlYCF5bHmmjIbz01fLq8CHHCFGlwELZsyXMfiKmC0517TS8
         iT0AE6uX35FjoaGognXC7UNsDdc8KzFGFxAjidgkTBdr62IUwwMM27k702pEBjb9ZuWY
         hhWg4sqFmAzYekxrstSQPXdtaAyAZdaSgBM6soxKoUwc5K5JIOvT38x5eXjyp0slT3yP
         TQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729066006; x=1729670806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ+Pwy0sO7KTFjfQbkx5Q5BjDMCnpAj1lw8a8QHrCPU=;
        b=lh5rGonmekYaXu/gkO4v+PXMPW1a7mAitZ0vdf4z0Gx04hBRjSdkIhoIQc8RmNYATZ
         zEHOO2cTp6E0v/hAELNXgYTm8RFWBJhgsa2mmxzh0W8LAztJSiRUlhPmF/Zf1GT35nn/
         JiHgWTUE0OC1qZZveMYcuxS73Lmv1zbhuTZi2WRvxE3GZy2NsTIK3GMSEL1wcloaV5aL
         PuG+rGrhCb7x81/E/VJHq07L3/t7jZM7JQp127rBtZp0ys3HvG+S5al2ZRW/pX6JETA4
         o16DnEquk1Tu7Phk5LA5gLBs1UELK2abXmYnm2969pN9/J5R5dsvxZzBmQf/KybiBG4z
         UxLg==
X-Forwarded-Encrypted: i=1; AJvYcCW5Z4ZxzcrMDiQEJCTMiiKaLOPBB0mAHgCKoXeqwxWYa7xJMPvNGZzTdgM6wnS4tizkcmDiKUobMaU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr8yBUqR8F5O9zA6C5ymSk+4kTYow+HHq6hllv02fhi3jsAmnh
	wthWaoJwiT6NU1NuSLTcd20lnnl2aN6ai0uZGGu2dfpTPB0DxTQVz8rWU9/Iznk4GMZaQE0P+vG
	vblZ8hN7aOJYgwqs9TlJQVeHfkfY=
X-Google-Smtp-Source: AGHT+IELHAX1Zdgya2iptNDYcVweVOP5k9eiqHiaYUUTND9YWXi3LqGeoL60P6fovY+AORNzpYwtKnigCag2iUcXFao=
X-Received: by 2002:a05:6402:84d:b0:5c2:5f31:8888 with SMTP id
 4fb4d7f45d1cf-5c99498135amr3427379a12.15.1729066005384; Wed, 16 Oct 2024
 01:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com>
 <20241002-loongson1-nand-v10-1-17162eff80e2@gmail.com> <20241007161027.386e7409@xps-13>
In-Reply-To: <20241007161027.386e7409@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 16 Oct 2024 16:06:09 +0800
Message-ID: <CAJhJPsW+cRY13in41NpTrEB4VP7jYLFdgrt8+9EJSwgkvXZR=g@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_010648_073682_73091B10 
X-CRM114-Status: UNSURE (   9.37  )
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

T24gTW9uLCBPY3QgNywgMjAyNCBhdCAxMDoxMOKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgS2VndWFuZywKPgo+ID4gK3BhdHRlcm5Q
cm9wZXJ0aWVzOgo+ID4gKyAgIl5uYW5kQFswLTNdJCI6Cj4gPiArICAgIHR5cGU6IG9iamVjdAo+
ID4gKyAgICAkcmVmOiByYXctbmFuZC1jaGlwLnlhbWwKPiA+ICsKPiA+ICsgICAgcmVxdWlyZWQ6
Cj4gPiArICAgICAgLSBuYW5kLXVzZS1zb2Z0LWVjYy1lbmdpbmUKPiA+ICsgICAgICAtIG5hbmQt
ZWNjLWFsZ28KPgo+IEFjdHVhbGx5IEkgdG9sZCB5b3UgYSBtaXN0YWtlLiBUaGUgbm8tZWNjLWVu
Z2luZSBjYXNlIHNob3VsZCByZW1haW4KPiB2YWxpZCwgc28gd2UgY2Fubm90IHJlcXVpcmUgdGhl
c2UgcHJvcGVydGllcyBpbiB0aGUgYmluZGluZ3MuCj4KVGhlbiwgcmVtb3ZlIHRoaXMgc2VjdGlv
biwgcmlnaHQ/Cgo+IE15IGZhdWx0LCBzb3JyeSBhYm91dCB0aGF0Lgo+Cj4gVGhhbmtzLAo+IE1p
cXXDqGwKCgoKLS0gCkJlc3QgcmVnYXJkcywKCktlZ3VhbmcgWmhhbmcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
