Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B32BD167F4
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Swq1RlYPUJ6koJg8kgLKN18St3LJZleTMl/ZLTEQSU4=; b=2M7mMjyFYstuFP
	MVj5APjLV7yLOYZJHbuJ8MyMEFBMb6FFNGc6bdKwmNCgmwA5IW9OQ+sG/kX5hmRgY53BxOHKHD3VD
	IedAndOjkMfrUqKyz/K3t5bQfkfDKCOoEAaGBVcs+BIYTlsRJgaBmY/EAfzdssANPeAAxiviWnaJ7
	wJUV66w+MFctKlH2+5bsh2StXiJF8O07iPNI6821OV4j2xLs28APEiTnLJWbNxBA2E2z8tJBG1je8
	6/+SlbqxqEzU4rPFMWmIB+xw6q9Cw6k8CxiyZngNN3GF8745lcWJxtXFXcq1B0bu6BTA0KiRC2/oO
	TX0oOP32rmH6LvKk9ncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9AU-000000024BF-2cxh;
	Fri, 09 Jan 2026 09:52:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9AR-000000024AZ-2C9A
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 09:52:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3EBD443A2
	for <linux-mtd@lists.infradead.org>; Fri,  9 Jan 2026 09:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96143C19423
	for <linux-mtd@lists.infradead.org>; Fri,  9 Jan 2026 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767952346;
	bh=fQ1tJffQT1qprHD9d7yQZUs66p4r8g3jJv8f9N6H0Jw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h+v9zXR3HWbP85MwT80vJwaM9+gGJ2B1x1jbzhTJvwbE7JtROxnKqjBzFpB6/Bppb
	 KCnY67jWW5w7iztq15s8GJ3N4TbFJpDSyf6GHSmmsno/4qoy4R/gL3ZQyUSW/AgXi6
	 4klsGdtiDBn8RG/wEkhreeHE2/yNvuwryTCfEFjM/99Sw9iF9M60h0oVhjXyaHXxLA
	 yg79WP6Q1ClZybgSFBigxf2kOuMT72c7uxEFohv26IOSoXF9IuOUVJJLDbX71s55GK
	 Oyd9dbUiztSe+Kyb/QuSVf1uoNZXCg8ENF7292SyYWrr0oNJgNosGNvxn6pZGTedTo
	 1M7xXQm1mm6Hg==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-640d4f2f13dso3997043d50.1
        for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2026 01:52:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYUWYqsY/tETETmYhH8xbdtCUctIKd08nwxLijzpxnFTRl3o7EY7Vlyutcv8b25PgLOMXtP37hnUo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGbo6rMjgcLZNCsGizeuK3frNRKcib28JdTVJ5b0XvxegU//OD
	/w0QzD8Q9Rsc8m5JK2J17cPY23gvgqiajIyKOjKC0J7L2AM9KQfqmw7sWb6FbLeyix1nC8lFNwl
	JYMSradJr6eR4OEXFiYCFLyFMKbqAQI4=
X-Google-Smtp-Source: AGHT+IFl+ErtwuC5vJB7FQDU7XpIoJtBTN3jHxe+AWD5ehVTJ4NoJsDHhflCFGEIV2ALI+7K1MxEBTnysWlIEE1/Is4=
X-Received: by 2002:a05:690e:1882:b0:648:3d3:790a with SMTP id
 956f58d0204a3-64803d381e8mr1065328d50.17.1767952345952; Fri, 09 Jan 2026
 01:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com> <20260107-mtd-memregion-v3-3-f9fc9107b992@bootlin.com>
In-Reply-To: <20260107-mtd-memregion-v3-3-f9fc9107b992@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:52:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLn9RdCPXQQi-7z2Pba2od4n5jSvh_7X-e0fUKWC+dfM-A@mail.gmail.com>
X-Gm-Features: AZwV_Qg5QQFy3AmO1hR3ASLJtvCVyx_cqfPdctjeTMOQ0Cjj3dOpo4MEYroa2cg
Message-ID: <CAD++jLn9RdCPXQQi-7z2Pba2od4n5jSvh_7X-e0fUKWC+dfM-A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: mtd: physmap: Allow using
 memory-region to access memory resources
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_015227_602975_34BF1B60 
X-CRM114-Status: GOOD (  13.67  )
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

SGkgR3JlZ29yeSwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFdlZCwgSmFuIDcsIDIwMjYg
YXQgMjowNeKAr1BNIEdyZWdvcnkgQ0xFTUVOVAo8Z3JlZ29yeS5jbGVtZW50QGJvb3RsaW4uY29t
PiB3cm90ZToKCj4gRW5hYmxlIGFjY2VzcyB0byBtZW1vcnkgcmVzb3VyY2VzIG5vdCBvbmx5IHZp
YSBJL08gYWRkcmVzcyB1c2luZyByZWcsCj4gYnV0IGFsc28gdGhyb3VnaCBhIHBvcnRpb24gb2Yg
bWFpbiBtZW1vcnkgdXNpbmcgbWVtb3J5LXJlZ2lvbi4gVG8KPiBhY2hpZXZlIHRoaXMsIG5ldyBj
b21wYXRpYmxlIHN0cmluZ3MgaGF2ZSBiZWVuIGludHJvZHVjZWQ6IG10ZC1tZW0gYW5kCj4gbXRk
LW1lbXJvLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3JlZ29yeSBDTEVNRU5UIDxncmVnb3J5LmNsZW1l
bnRAYm9vdGxpbi5jb20+CgpJIGhhdmUgdHdvIGlzc3VlcyB3aXRoIHRoaXMgcGF0Y2g6CgoxLiBJ
dCBuZWVkcyBhIGRlc2NyaXB0aW9uOiB0ZWxsaW5nIHVzIHdoZW4gdG8gdXNlIHRoaXMgYW5kIHdo
eSwgYW5kCndoYXQgbWFrZXMgaXQgbmVjZXNzYXJ5IHRvIHVzZSB0aGVzZSBuZXcgYmluZGluZ3Mg
aW5zdGVhZCBvZiBleGlzdGluZwpiaW5kaW5ncywgbGlrZSB0aGUgZm9sbG93aW5nOgoKMi4gVG8g
bWUgdGhpcyBsb29rcyBzdXNwaWNpb3VzbHkgc2ltaWxhciB0byByZXNlcnZlZCBSQU0sICJyZXNl
cnZlZC1tZW1vcnkiLgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQt
bWVtb3J5L3BocmFtLnlhbWwKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVt
L3JtZW0ueWFtbApEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtbWVt
b3J5L3JhbW9vcHMueWFtbAoKQWxzbyBzZWUgdGhlIGR0c2NoZW1hIHJlc2VydmVkLW1lbW9yeToK
aHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9ibG9iL21haW4vZHRz
Y2hlbWEvc2NoZW1hcy9yZXNlcnZlZC1tZW1vcnkvcmVzZXJ2ZWQtbWVtb3J5LnlhbWwKCldoeSBp
cyB0aGlzIHVzaW5nICJtdGQsKiIgY29tcGF0aWJsZXM/IFdoYXQgbWFrZXMgaXMgYQoibWVtb3J5
IHRlY2hub2xvZ3kgZGV2aWNlIiwgd2hpY2ggaXMgYWRtaXR0ZWRseSBhIGxvb3NlIHRlcm0gYnV0
CnVzdWFsbHkgbWVhbnMgc29tZSBraW5kIG9mIHBlcnNpc3RlbnQgbWVtb3J5IHN1Y2ggYXMgZmxh
c2guIFRoaXMgZG9lcwpub3QgbG9vayBwZXJzaXN0ZW50IGF0IGFsbC4KClRvIG1lIGl0IHNlZW1z
IG1vcmUgcmVsYXRlZCB0byBzcGVjaWZpYyBMaW51eC1saW5nbyBhcm91bmQgdGhlIE1URApzdWJz
eXN0ZW0gYW5kIGp1c3QgaGFwcGVucyB0byBiZSBoYW5kbGVkIGluc2lkZSB0aGF0IHN1YnN5c3Rl
bSBpbgpMaW51eC4gV2hpY2ggbWVhbnMgaXQgaGFzIG5vdGhpbmcgdG8gZG8gaW5zaWRlIGEgKE9T
LW5ldXRyYWwpIERUIGJpbmRpbmcuCgpTbyBJJ20gYSBiaXQgY29uY2VybmVkLCBidXQgbWF5YmUg
SSBtaXN1bmRlcnN0b29kIHNvbWV0aGluZyEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
