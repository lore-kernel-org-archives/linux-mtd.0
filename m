Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1E6C77B7A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyWx5kzk/RlbNDtv27GQbJefkXYZuZePzj9ygUHMxr4=; b=KTNyoQSdo3WFb6
	iY5rUuA8PdlWKzEVkqwKsonyrEi53g7c4i7daAVlid2JSj4i68jo2f5Lef6qpGHlLndHV9RCILr6I
	ATqtq2vv65bru/0y4JuT5PA0doCY/ShETLnysctTFCPsv+guD/7eiOnFn+dRzhu3Nqr177NceShBX
	TkD29ulQ9mEOdL2xhDfl/SodU3Z7HqYqFI5JtDx7fYp7uOtdgyzmx69qJzJ7CmyYmN9muIIpFhDIz
	JqJb5yLTZAPwH+/hQNUaZFxo6KwPl2/v2VRisfgaH/qr3b3350XOmaJXF6Yv3OGDAEskAxa3tzmuo
	PwtrrRAHA+WaJD1YXiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDq-0000000E0sJ-0Q51;
	Thu, 19 Jun 2025 18:42:50 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJuo-0000000Ds2i-2iYs
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 18:23:11 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3138e64fc73so157181a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Jun 2025 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750357389; x=1750962189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wn2R/tcCHSpRThGeyczBO7p55CHFgEwb59xkAN4huA=;
        b=LQX+x8iwKeuHmhspkewHe4AZt+xOgUCMai1uUtDDu+wcJ0Pc8VKMDQyID0VNNYVknG
         vEbo8vf9kwfMD70UYFhJ8KkQ/Wo1O/yOIwVsV+cppySTn7t1SWvlPYOuybESmJVTSrh9
         GgODrMIqmTfPpwT4VSiN9KBJ9TwiPoedc1m4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750357389; x=1750962189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wn2R/tcCHSpRThGeyczBO7p55CHFgEwb59xkAN4huA=;
        b=bKH/Zm6118r8K47IOrPTG+EuFjmy24FvgNVCqHQeOoMWTG25YtIU3mPfNaWtlOEpgd
         xcKzLfXgfnot/O2OAqJwmTMR47FJU45wYAafQrxbtJ2S//VKksv3gOI74cLdxje+dE34
         rGRCDbt35lhk57egKgbgi4v2WAXHmqX7Mt7u5bqY9gkYL2LtqKwCKf/MOeXO/+8Kn6t2
         lkfAdGRsQmfCsXk4A8/MSzQDuki/NLZct+6ZWcjqjeQ05YJ4JTRy/jfZyzF7VgS+ggnF
         SngqdeRG2i6pJVO3ouzOqs01lG70gL+s+8z1HOCqRfAyVpzv67wGGgLHcCQqernneE7c
         UgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW81oTbo39a39TC1GhOxyWHD5u0iI6rE7aLSBatceISssaddZgUIa2WAzOJDiuTOXlgL7+1BBNV+RU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwK/24fn1n4TjKcH4JwtInkgAqsrcjSY3+YP9rzQSwMWqvGFuyv
	LvuikwnJB/R8SICm3p7vRrLFz3wmWPSs2PciFjDlbeg13VexXtc9TL8fjhiM4RSEIuQFkoHGkER
	YJZK/ZT8PJ/oJ1DIRXgYN9KgLy6htIldU092S0v2S
X-Gm-Gg: ASbGnctBQmQoAk0wozxtnxNh/93BjR2vKYN3UxtfgY4AyTQmEeqHKzGz8CKZwAtPZXP
	0+VTtvgrXQ2Vh4LLJtIiGtw70vlvRnjPXr77+vv2S33xI75NRK7awd0STRZh1e6y7El7XDx0+4V
	VnM8vtfDpixBvu4D2lQEMD++YReTFhx7Vd/AztBAZXxyFdbirtlVvxNA==
X-Google-Smtp-Source: AGHT+IFSj1i5cMc91WlmDpNumVdtdb8Ld/9OiYqe+qTePMX50c4RyMW+w6PNGPiUCp7f20XynJdqwZhRDrpoEUBp4ag=
X-Received: by 2002:a17:90b:57ee:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-3159d8c6488mr131664a91.3.1750357389545; Thu, 19 Jun 2025
 11:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250606165756.1531164-1-dregan@broadcom.com> <8734c9z2ye.fsf@bootlin.com>
 <CAA_RMS7EB2v_h44Ysdoe0=WjC+T4G_5_4O-9DbCBE5OyRNArkg@mail.gmail.com> <87h60dmn86.fsf@bootlin.com>
In-Reply-To: <87h60dmn86.fsf@bootlin.com>
From: David Regan <dregan@broadcom.com>
Date: Thu, 19 Jun 2025 11:23:03 -0700
X-Gm-Features: Ac12FXwY4L3iGAb6y8Z7xuuGcl1xTOk1NYTk9evRoC8IYcMVu9a22ogFJ9qGxfY
Message-ID: <CAA_RMS5a4kB0=P+XSS_-zL+KmP2YqSSQghb=c6UvvxQg16FiQw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Regan <dregan@broadcom.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, 
	Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu@gmail.com, dregan@mail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_112310_690234_F2B23134 
X-CRM114-Status: GOOD (  16.05  )
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

SGkgICBNaXF1w6hsLAoKT24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMjowN+KAr0FNIE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gRGF2aWQK
Ci4uLgoKPiBTbyBmYXIgdGhlIHJlcG9ydGluZyBsb29rcyBnb29kIChhbmQgdGhlIG5hbmRmbGlw
Yml0cyBvdXRwdXQgbG9va3MKPiBjb3JyZWN0IGFzIHdlbGwpLgo+Cj4gPiBbICA2NzYuNDA4NDQx
XSBtdGRfbmFuZGJpdGVycnM6IEluc2VydGVkIGJpdGVycm9yIEAgMi81Cj4gPiBbICA2NzYuNDEz
NDExXSBtdGRfbmFuZGJpdGVycnM6IHJld3JpdGUgcGFnZQo+ID4gWyAgNjc2LjQxODEyMl0gbXRk
X25hbmRiaXRlcnJzOiByZWFkX3BhZ2UKPiA+IFsgIDY3Ni40MjIyNjddIG10ZF9uYW5kYml0ZXJy
czogdmVyaWZ5X3BhZ2UKPiA+IFsgIDY3Ni40MjYxOTRdIG10ZF9uYW5kYml0ZXJyczogRXJyb3I6
IHBhZ2Ugb2Zmc2V0IDAsIGV4cGVjdGVkIDI1LCBnb3QgMDAKPiA+IFsgIDY3Ni40MzI3MjddIG10
ZF9uYW5kYml0ZXJyczogRXJyb3I6IHBhZ2Ugb2Zmc2V0IDEsIGV4cGVjdGVkIGE1LCBnb3QgMDAK
PiA+IFsgIDY3Ni40MzkyNjBdIG10ZF9uYW5kYml0ZXJyczogRXJyb3I6IHBhZ2Ugb2Zmc2V0IDIs
IGV4cGVjdGVkIDY1LCBnb3QgMDUKPiA+IFsgIDY3Ni40NDU4NjhdIG10ZF9uYW5kYml0ZXJyczog
RUNDIGZhaWx1cmUsIHJlYWQgZGF0YSBpcyBpbmNvcnJlY3QKPiA+IGRlc3BpdGUgcmVhZCBzdWNj
ZXNzCj4KPiBIZXJlIGhvd2V2ZXIgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nLiBXZSBkbyBleHBl
Y3QgYSByZWFkIGZhaWx1cmUsCj4gaW5zdGVhZCBvZiByZXR1cm5pbmcgd3JvbmcgZGF0YS4gVGhl
cmUgaXMgc3RpbGwgYSBwcm9ibGVtLCBJIGRvIG5vdCBrbm93Cj4gaWYgdGhpcyBwcm9ibGVtIHdh
cyB0aGVyZSBiZWZvcmUgdGhvdWdoLCBidXQgdGhpcyBtdXN0IGJlIGZpeGVkLgo+CgpUaGFuayB5
b3UgZm9yIGhpZ2hsaWdodGluZyB0aGlzIGlzc3VlLCBJIHdpbGwgaW52ZXN0aWdhdGUuCgo+Cj4g
SGVsbG8gRmxvcmlhbiwgaWYgeW91IGhhdmUgdGltZSwgSSdkIHdlbGNvbWUgeW91IG9waW5pb24g
b24gdGhpcyBwYXRjaCA6KQo+Cj4gQ2hlZXJzLAo+IE1pcXXDqGwKClRoYW5rcyEKCi1EYXZlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
