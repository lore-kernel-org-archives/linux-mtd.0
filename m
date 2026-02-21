Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86158C61DDE
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siz8Wsu5FVq8ybEjKLTdsJcR+l9Gt6VlPv2jvgzC2JI=; b=VqL3EXOFW+wk9/
	Wp2t/BDRP/GZTie6lk+AdgghioNr3x66e76RhLSxXNFFFcCwEJYv8uJra3J59lb4lfyX/ZAxRQyIc
	ZwOW/rdPL4KJMK9/Z+IZVnzM4/7e+HvnMWAPe9sy9U30fkeWgBQIIvcfbqEirhWzDfOrYo+LzKZ9i
	OxuMGfNNOnn6+Zdi6JkLrOtzi/Sf34lz5pgalcS/5SomRdI8uWX5jYQ0gZbDTBuWksclX9tDpFOhi
	vBrMq4Sc1y+I6jPJmq2YbLPN9TYajHUfTxgHugt8y4WNUgp2QI0ErKqawoQKaM+8pHVhieOe4WcwX
	LIjfKILWD52EmDc1o+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjTJ-0000000Fwnz-1Fvr;
	Sat, 21 Feb 2026 09:40:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjTA-0000000FwgV-3q84
	for linux-mtd@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-483703e4b08so22484395e9.1
        for <linux-mtd@lists.infradead.org>; Sat, 21 Feb 2026 01:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666811; x=1772271611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuF5x3a6e11GI4kifXt3xbSibryG5QrOhbEp/FvY8E0=;
        b=XJyJaWpJa77N3Zv9NxqRIGseL1KSsI5+bf6393CEUhwbL0m4ROFpz6utxtVj46dsby
         SDyepPvFuQ/EqGRTRRKbOYCkbCI3G/MYAdxZ+HfBrFF8rrDyB4d7w9CSU13qU5G2K2XS
         zbr9bsf6VLzGuhVai01zm/FDqSbZv1cKiCc3KySobevz5ZBmhTKiauyo4frUcikFQbLd
         K/LDK6Kt3ibyjrjFg/CSjGl3u+01rwwFUJHptghlFTiyCB8Wvm4ET3+Mr1Y4CYXXRSFp
         qPeGE9Y9ZXJsQUmHS5eWa2eCyIOJAlLHFeFKiI4kNrvor38r6VtPYtBc3M+AN0Qnfk/y
         c1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666811; x=1772271611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuF5x3a6e11GI4kifXt3xbSibryG5QrOhbEp/FvY8E0=;
        b=kroscnqJI1/SYrIBlH6nQ7Xm9RAu3oIxS7ceRXinAAx/D771A7ecTO597QtCLfTR6f
         LB3PS/dEtVQMSiuYqooVWaL5k/7FkV3W31e5h/+3Z6mXiOlq9qkBCbo1zhAM+ODDWL4e
         GWkiTDuRt9WyZobGAadN+kPizC4HKubivD/E+Q9rX2digQ7gjSjxXsV8TKDJ/2JcAOir
         8wc8UVmK+T+g6TfCmSo/9Kftl6zfZbTNxTydqqZIRI6lRlt3TSMIXK68/1sONzi/pHi5
         opR1PbJkoBPuIA5AdvDFKXdKQsQzYNIlsE6PavQB80E3XV1ilgy3r1cDiLKfHaQucDxP
         10ig==
X-Forwarded-Encrypted: i=1; AJvYcCXaom7Y7712bQtEUUX1g5XzTyz8Uo/CtFb0Vy3lEcLbzV2ehG792NGHDsbSNr4cKaK+59EWWVIFr+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKh9FGnLupKOnYz0B4ardXTV8KICXidkWEhV9px//23f31bUw2
	2P8Bnka1nclfU9gW045RLQM0q/cYqOFY/x/VxJV+vjETE5cVOmtQEd7c
X-Gm-Gg: AZuq6aIyjai69uxEbrtIQadnHikOSt5PvkU50vik7MI0Jv5+9uMCWr+LjBvPe48bkGS
	3MEDQqsCZ0DmuK+/YqZ9hWAfaq2vD/Hec/kqKWicL3e/ZIHiFHCrNvgwOzk9FIcC4WlHDM8cVMR
	EteFR8T6x56L2rfkP7YE1h0Z4oFgBK8v3L8RZ6b+oNLtRByoBCmRGEoc9ZymoM40L2yINpcEIWb
	ScGeV5mlSHjQdbLeoLBYmbjHss+lEFv/5RftUy53XEi1tl0BeeV0c/r+P2zXF1wPCy6SRJMaNaV
	AdfuS05UJTz34bHfm+E+3rP9Tm/O+J0Qf37Anju/278VUzNGNQfKYrjfhkXcYyWNzYHk1U2H3QX
	qt0rsMsv7417vA/whJt9tUI/0qOcNXiaQDYnkYQp3uQml/ZN6vDH97YMZ78JPg1/otbIpDDaGAh
	vMIkEGjuKQZuYLyJfFR/4N/xj7Pno9EVoWeOg7UrVaay7hT3lbHvRCGg8Y0KccapxFuYSaTZAQ7
	TCOKnt6IUEGTJFo+A==
X-Received: by 2002:a05:600c:1c29:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-483a949e5edmr41113355e9.5.1771666810853;
        Sat, 21 Feb 2026 01:40:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm133439895e9.3.2026.02.21.01.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:10 -0800 (PST)
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
Subject: Re: [PATCH 1/6] mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
Date: Sat, 21 Feb 2026 10:13:16 +0100
Message-ID: <5967652.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260220161011.999642-2-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014012_979162_223E4424 
X-CRM114-Status: GOOD (  16.53  )
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

RG5lIHBldGVrLCAyMC4gZmVicnVhciAyMDI2IG9iIDE3OjEwOjA2IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgYXZhaWxh
YmxlIGxlbmd0aCBpcyByZWFsbHkgVVNFUl9EQVRBX0xFTiAtIDIgaW5zdGVhZCBvZiBqdXN0IDIg
KHRoZQo+IHVzZXIgZGF0YSBsZW5ndGggbWludXMgdGhlIEJCTSBsZW5ndGgpCj4gVGhhdCBkb2Vz
bid0IGNoYW5nZSBhbnl0aGluZyBub3csIGJ1dCBpZiBVU0VSX0RBVEFfTEVOIGNoYW5nZXMsIGl0
IHdpbGwuCgpzL1VTRVJfREFUQV9MRU4vVVNFUl9EQVRBX1NaLwoKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+CgpJZiB0aGlzIGlz
IHJlYWxseSBhIGZpeCBhcyBzdWJqZWN0IHN1Z2dlc3QsIHRoZW4gRml4ZXMgdGFnIGlzIGluIG9y
ZGVyLiBIb3dldmVyLAp0aGlzIGxvb2tzIG1vcmUgbGlrZSBjb2RlIHJlZmFjdG9yIGFzIGVuZCBy
ZXN1bHQgaXMgdGhlIHNhbWUuIFNvIG1heWJlCnJld29yZCBzdWJqZWN0PwoKQmVzdCByZWdhcmRz
LApKZXJuZWoKCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiBpbmRleCA5ZGNkYzkzNzM0Y2IuLmM0MjA5
MDliOTQ0YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiBAQCAtMTc2MSwxMiAr
MTc2MSwxMiBAQCBzdGF0aWMgaW50IHN1bnhpX25hbmRfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10
ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAo+ICAKPiAgCS8qCj4gIAkgKiBUaGUgZmlyc3QgMiBi
eXRlcyBhcmUgdXNlZCBmb3IgQkIgbWFya2VycywgaGVuY2Ugd2UKPiAtCSAqIG9ubHkgaGF2ZSAy
IGJ5dGVzIGF2YWlsYWJsZSBpbiB0aGUgZmlyc3QgdXNlciBkYXRhCj4gKwkgKiBvbmx5IGhhdmUg
VVNFUl9EQVRBX1NaIC0gMiBieXRlcyBhdmFpbGFibGUgaW4gdGhlIGZpcnN0IHVzZXIgZGF0YQo+
ICAJICogc2VjdGlvbi4KPiAgCSAqLwo+ICAJaWYgKCFzZWN0aW9uICYmIGVjYy0+ZW5naW5lX3R5
cGUgPT0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVCkgewo+ICAJCW9vYnJlZ2lvbi0+b2Zm
c2V0ID0gMjsKPiAtCQlvb2JyZWdpb24tPmxlbmd0aCA9IDI7Cj4gKwkJb29icmVnaW9uLT5sZW5n
dGggPSBVU0VSX0RBVEFfU1ogLSAyOwo+ICAKPiAgCQlyZXR1cm4gMDsKPiAgCX0KPiAKCgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
