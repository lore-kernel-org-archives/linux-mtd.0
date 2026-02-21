Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0B9C61DE2
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xJDrTUeAZZiL/xzInikVk5sHVGBKdW7L22NzndNs5s=; b=lCsU/afTixaENL
	MMH0sTDHuzj7kjkFVr2m+sM8FoHO0TL/hMXJ1h8ACFD9Km9UunQEz51DgBiNul7BtRiwi8IBh9E8x
	2Sy0vv1WZs9gd0bDlSLC0xqWzpFJXpdoxo78r9fSYDgECQRhfEWKlYPB7pbVZYH42Myj4ch1A/0b3
	8A7C0clBpbYF3ISKX70CJNDCRoOqiD2j1FKGkvyOUFxhNUTJJRZHvgdoGCerj8IQYvDfR/HVWCxfm
	E6KBUGP9rZQsAhW8VQr6+ooKNFqL4fVOFMFZFrod1UJYg7DZRZ8MVZqhE6GTrVMvN+DJjb5XIge+N
	ZGPpEXNpjrlwNazFlKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT9-0000000Fwfz-1JKE;
	Sat, 21 Feb 2026 09:40:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT5-0000000Fwcj-1EhZ
	for linux-mtd@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48370174e18so16334925e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 21 Feb 2026 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666805; x=1772271605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SRt4pEujAjZL7YcRKGKgR1k7mcODZZuIAG7QjvJr7M=;
        b=PuCvvZoy/caE4lDDbQgG/6EqTu23boHe6m+Vv2R+OTqA60Le4kuhEOT9MdKTQscchR
         qA3BxBuZ+oYleYU7ZbmcWJV6/BGCehSFP0Rg8VfMF7sHX8XkmDh88UUw1m0GVcIYieAb
         OTiLPJrrB57uljelwkLlibpAL9E2k7cnQmmf0tQppy7vEwpDPYFAHNirEUbVsXNabKNQ
         y5PVmNBSGZUYbof6BiOkLnU8FFCPUPZ4/ueIRT/oxrpmUFd4HGSZ9GREM5yFrSOBzWsQ
         iQAFZgXBzlblXsKFxeHkqjOnKeIBIkQZpQmVzC3FAaGNZao8ZcKPhiJjMi7ShA7BRn8a
         WEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666805; x=1772271605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SRt4pEujAjZL7YcRKGKgR1k7mcODZZuIAG7QjvJr7M=;
        b=kJ1aOAUN3f0yKxugFGwtAz+tvPJofTypUd5Sdj7IkSsUaFzwn3+And1Y8aqHx1Ea23
         Nx6nB3akyfzJey98TY+RyNhTvArldxa6LRIO+HHyvbn6NW+HL2KdJyiWxWcMDO253jhu
         v8GiNbXRjd/BkUyNhdnT5aK61vpshtU2j34nYMm73fY48Ys/mG2CxMGd/X/+MZmzIKoX
         6MCQQyEmNa2bhv4/pJKP23+ABYmuDULcv4dkLWWw8znzpRoWKpd8JLTDcYwszPZKT4TF
         sX/yaEt7QQ950921PgEBb84vPL1yJi0WKVyJL3lxAWsh1LpGEwUqc3tHVlmywyif8/Iq
         fzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQrkFECbAdoy5CS7HqndTVVWEMzAte/0e13JR2MOJhpDZnAetLhqHVuUGuSYIiYiSpa5Rsw4cEzas=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwW/ABFJk151CK1fhDiILLq4nZ8k1fYxjBIZR1xmyjyoqXCxj
	sa9a7zw6/34rFwkHLFFjhPjTgbuUdqiPqjUsfqMHqaoKl5zp5E1rDFtI
X-Gm-Gg: AZuq6aL1lGMW1azKsMxjc9wKt0fYzQ3NtSVgi1am3bGAN4hrQ+aWL+w2Ir2OjyThTXh
	HLZpt/4xU2B2Rt++lV2v338GGfsPAMgJNINz92JniB+2+GZS1M4tkaH/up63QzBypbhK8VwsYtO
	1fV41AX1wR5+uJVDe9n4T13mbG2Feb4ZrHPj7AU2bdzRs+bCdrJ1J9EjHxAoQSLrm/Ym3DiKUY9
	kNBZCQL8Sj7iuC8K56yBKtKnHJMeTZRRbRdKXMo+ZEJpZLorKNctveQg2pHurBQxghKC1yhmNua
	z3fRBIOZ/YvCpTok1LtmS0+J3UMRzQ7bP2FMk6HcAHOmtWZFit0kLP0G8LB9yQyWPxCMqGLZiYX
	rtn/tuuOWcHaLIZnr2/r/mCToR/c3spvxnDHNxxlvhqzdtnwZGbxndwAzhgUhhaexSYugcNJxU8
	9Q1546+1s4NNhZ5yImqF6Ah4Q9bh0xs9UCXv4oiuCzq3jzwTRcwur/y2OwdcALMVMBWvUboMvzu
	ZS7XqF9eUAUHb0WeyE=
X-Received: by 2002:a05:600c:608f:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-483a95bd7e8mr38778385e9.5.1771666805222;
        Sat, 21 Feb 2026 01:40:05 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadd4sm41900045e9.11.2026.02.21.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:04 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 4/6] mtd: rawnand: sunxi: replace hard coded value by a define -
 take2
Date: Sat, 21 Feb 2026 10:23:33 +0100
Message-ID: <13952574.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20260220161011.999642-5-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-5-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014007_346242_29B89F9F 
X-CRM114-Status: GOOD (  17.25  )
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

RG5lIHBldGVrLCAyMC4gZmVicnVhciAyMDI2IG9iIDE3OjEwOjA5IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgdXNlciBk
YXRhIGxlbmd0aCAoNCkgaGFzIGJlZW4gcmVwbGFjZWQgYWxtb3N0IGFsbCBvdmVyIHRoZSBmaWxl
LCBidXQKPiAyIHBsYWNlcyB3ZXJlIGZvcmdvdHRlbi4KPiAKPiBUaGUgdXNlciBkYXRhIGlzIHBs
YWNlZCBiZWZvcmUgdGhlIEVDQywgZm9yIGVhY2ggc3RlcC4KPiBTbywgaW4gc3VueGlfbmZjX2h3
X2VjY19yZWFkX2V4dHJhX29vYigpLCB0aGUgb2Zmc2V0IG9mIHRoZSB1c2VyIGRhdGEgaW4KPiBP
T0IgaXMgaW5kZWVkICgoZWNjLT5ieXRlcyArIFVTRVJfREFUQV9TWikgKiBlY2MtPnN0ZXBzKTsK
PiAKPiBBbmQgaW4gc3VueGlfbmFuZF9vb2JsYXlvdXRfZWNjKCksIHRoZSBvZmZzZXQgb2YgdGhl
IEVDQyBjaHVuayBpbiBPT0IgaXMKPiB0aGUgc2FtZSBvZmZzZXQgcGx1cyB0aGUgY3VycmVudCB1
c2VyIGRhdGEgc2l6ZToKPiBzZWN0aW9uICogKGVjYy0+Ynl0ZXMgKyBVU0VSX0RBVEFfU1opICsg
VVNFUl9EQVRBX1NaOwo+IAo+IEZpeGVzOiAxYmU3YWM3OGI3MmYgKCJtdGQ6IHJhd25hbmQ6IHN1
bnhpOiBSZXBsYWNlIGhhcmQgY29kZWQgdmFsdWUgYnkgYSBkZWZpbmUiKQo+IFNpZ25lZC1vZmYt
Ynk6IFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KClRoaXMgZG9l
c24ndCByZWFsbHkgbmVlZCBGaXhlcyB0YWcgc2luY2UgaXQncyBvbmx5IHJlZmFjdG9yaW5nLgoK
V2l0aCB0aGF0IHNhaWQ6ClJldmlld2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFi
ZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMK
PiBpbmRleCA5OWQzMDViYmRhNTMuLjVkOTI1YjU5YjYxOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dW54aV9uYW5kLmMKPiBAQCAtMTA1MSw3ICsxMDUxLDcgQEAgc3RhdGljIHZvaWQgc3VueGlfbmZj
X2h3X2VjY19yZWFkX2V4dHJhX29vYihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLAo+ICB7Cj4gIAlz
dHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKG5hbmQpOwo+ICAJc3RydWN0IG5hbmRf
ZWNjX2N0cmwgKmVjYyA9ICZuYW5kLT5lY2M7Cj4gLQlpbnQgb2Zmc2V0ID0gKChlY2MtPmJ5dGVz
ICsgNCkgKiBlY2MtPnN0ZXBzKTsKPiArCWludCBvZmZzZXQgPSAoKGVjYy0+Ynl0ZXMgKyBVU0VS
X0RBVEFfU1opICogZWNjLT5zdGVwcyk7Cj4gIAlpbnQgbGVuID0gbXRkLT5vb2JzaXplIC0gb2Zm
c2V0Owo+ICAKPiAgCWlmIChsZW4gPD0gMCkKPiBAQCAtMTc0Nyw3ICsxNzQ3LDcgQEAgc3RhdGlj
IGludCBzdW54aV9uYW5kX29vYmxheW91dF9lY2Moc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBz
ZWN0aW9uLAo+ICAJaWYgKHNlY3Rpb24gPj0gZWNjLT5zdGVwcykKPiAgCQlyZXR1cm4gLUVSQU5H
RTsKPiAgCj4gLQlvb2JyZWdpb24tPm9mZnNldCA9IHNlY3Rpb24gKiAoZWNjLT5ieXRlcyArIFVT
RVJfREFUQV9TWikgKyA0Owo+ICsJb29icmVnaW9uLT5vZmZzZXQgPSBzZWN0aW9uICogKGVjYy0+
Ynl0ZXMgKyBVU0VSX0RBVEFfU1opICsgVVNFUl9EQVRBX1NaOwo+ICAJb29icmVnaW9uLT5sZW5n
dGggPSBlY2MtPmJ5dGVzOwo+ICAKPiAgCXJldHVybiAwOwo+IAoKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
