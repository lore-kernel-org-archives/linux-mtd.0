Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63E1CA5FA0
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NBKAQrZgEWGVAgaBZwAn/QlvjfgSRkbqh1OANyrAAU=; b=FkKIZ/7JXhGvDR
	DOr/bzS7ggoI2SMdWV41OM4EBg18UraRCd4M7MZ+2a50drFb6/PDbKSEBAlI2aGMFfCw9h9gYt7Yh
	ZxNE4uZIpsXE78eWJFMOZEFFNsdX0YCGXDfEedQlnY6HLiVWe6fiODH3VU2EIPyta1taUTpfbqPud
	Uz91ob5pkkTUWrvdpnhFbDCqdeC7vpsNMWEDp/fI19AnIAVCZnlgOAtCXuYRAhGhm3QmyaxGdm9XE
	JlzhIu6yAltpiKRuaoeQe8pWmww+PS/OskpgF1S2qPaSU0HCV+kfrQ60QJ/N5RT6Q6aRuApN3reoN
	ixbH1lcus4T2fnBVdj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viELd-000000048dc-2qAE;
	Tue, 20 Jan 2026 16:12:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viELc-000000048d3-0BDN
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 16:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EF86442CB
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 16:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEE7C2BCAF
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925571;
	bh=UcHmwn1TYbgAgdsr2pglxCwUR0tcKPNVHmODeLgjiHY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ErlGRcgBk1cmfwN0J9rwzMURpmIWBwb5ghXbPS+sr8NndVAEuqSZaHWm+z4XP1ofw
	 Zt8L3MjqWg5U66adMWEtTE66ySwHP/g9gpfvGCEeM9nAFkS3kL+HGpgRSDqAJWpsdM
	 sc5tHFr1i/H7H5IM5MOaaX2JgBuxbOAXKsDEtTYgo0o+VKg7yONxigfT8GLr+d7isi
	 1Yp57trDLzcGqDY1z4beLCa5UuKBvETzMSQXSZR8IbyzH1iY+5q5Lm9eSci5fUVwH0
	 2zg5YIR/Y3sRJIsN5hx+FvJqOIS1jA580BPTG+oGaBpIewwVvyZ2Uk28z24zifRm7y
	 l6WKgc9PhuXFA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so810191a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 08:12:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdsxeMVcBGYmsTIWMwpSPaotLkKuX0tohV+kwpnZ2radnIHLumBw05Ib6yEutW9dxrYTDYdfaULpE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Ou4gSDfwsPbPsWfxvCCojbGdfr3DcdA/MAStNWL/B6hCActf
	j2cacGSZte77vjCxqL4DPGlgGNIGlYW7gqNYcJmGn2zr5fCqF+9a7sQxQuv/8PRV2oOG7OzvBbt
	+d1Iyg9b9YgPcBgmUCKvWYdy3TuAsIg==
X-Received: by 2002:a17:907:9495:b0:b87:d664:860f with SMTP id
 a640c23a62f3a-b8800364e56mr203884366b.51.1768925569451; Tue, 20 Jan 2026
 08:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <87tswhswsp.fsf@bootlin.com> <CAL_JsqJ7_yKRTCOrxcq0QDy_MRMCRMQqhH=TKiBs=nubqNN9HA@mail.gmail.com>
 <87ikcws57d.fsf@bootlin.com>
In-Reply-To: <87ikcws57d.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jan 2026 10:12:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKQO1XjPELmfd2xStto1xFbnno5GLr7KheNcn6hZM9L5Q@mail.gmail.com>
X-Gm-Features: AZwV_Qiq51kWXEGrScowLw75flgyDCvIcgtUbbfsaaGBjWwlXhd42mhTMjoSRsk
Message-ID: <CAL_JsqKQO1XjPELmfd2xStto1xFbnno5GLr7KheNcn6hZM9L5Q@mail.gmail.com>
Subject: Re: [PATCH 00/10] dt-bindings: mtd: Partition binding fixes and restructuring
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_081252_117022_9F3B841D 
X-CRM114-Status: GOOD (  18.43  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgODo1NuKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiA+PiBUaGUgc2VyaWVzIGRv
ZXMgbm90IGFwcGx5IGNsZWFubHksIEkgdHJpZWQgbXRkL25leHQgYW5kIHRoZW4KPiA+PiB2Ni4x
OS1yYzEuIENhbiB5b3UgcGxlYXNlIHJlYmFzZSBpdCBhbmQgZml4IHRoZSBjb25mbGljdHMgKGF0
IGxlYXN0IDIKPiA+PiBwYXRjaGVzIGZhaWwsIGFuZCB0aGVuIEkgc3RvcHBlZCk/Cj4gPgo+ID4g
SSByZWJhc2VkIG9uIG10ZC9uZXh0IGFuZCBzZW50IHYyLiBJIG9ubHkgc2F3IG9uZSBjb25mbGlj
dCB0aG91Z2gsIGFuZAo+ID4gdGhhdCB3YXMgd2l0aCBzZWFtYS55YW1sLiBUaGF0J3MgZ29pbmcg
dG8gY29uZmxpY3Qgd2l0aCBMaW51cycgdHJlZSwKPiA+IGJ1dCB0aGUgcmVzb2x1dGlvbiBpcyB0
YWtlIHRoZSBkZWxldGVkIGZpbGUuCj4KPiBJIGRpZG4ndCBzZWUgd2hlcmUgdGhpcyBzZWFtYSBm
aWxlIHdhcyBtb2RpZmllZCwgZXhjZXB0IGZvciBMaW51cyBXLidzCj4gYWRkcmVzcyBjaGFuZ2Uu
IElzIHRoZXJlIGFuIC1yYyBJIG5lZWQgdG8gcHVsbD8gT3IgYW4gaW1tdXRhYmxlIHRhZz8KClRo
YXQncyB0aGUgb25seSBtb2RpZmljYXRpb24gYW5kIGl0IGlzIGluIDYuMTktcmMyLgoKPiBNYXli
ZSB0aGlzIHNlcmllcyBhcHBsaWVzIG9uIHRvcCBvZiB5b3VyIG5leHQgYnJhbmNoPyBJIGNhbiBn
aXZlIGFuIGFjawo+IGZvciB0aGUgZnVsbCBzZXJpZXMgaWYgdGhhdCdzIHRoZSBjYXNlIGFuZCB5
b3UgY2FuIHRha2UgaXQuCj4KPiBJIGdlbmVyYWxseSB0cnkgbXkgYmVzdCB0byBhdm9pZCBjb25m
bGljdHMgYXQgbWVyZ2UuCgpUaGF0J3Mgbm90IHJlYWxseSBuZWNlc3NhcnkgZm9yIHRyaXZpYWwg
bWVyZ2UgcmVzb2x1dGlvbnMgbGlrZSB0aGlzIG9uZS4KClJvYgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
