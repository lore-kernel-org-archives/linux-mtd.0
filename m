Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD478C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 06:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdcmaKhXKyjbJn72I4HFbl2g2HI1KcZ9plK9taOcRNk=; b=dOzBd8qMIrgU44
	zSf2YHWIf4O929ZaEBpJdnH1k5dD71D15G08KX3FfMDk5aM/gRvj+q1QudtI5F4aSGRx01OtL5JqC
	oDedUHi2HUJ2Dr3L3ErjGsDKGUY/KrI+rsbXqQfLne1JoTbj3ZpXM4TR/J8ABuxYatJjI8OZec0co
	kRz3OJ/AIp09kcXpIxqfe3CPKog59v8aHRJxWcvuUgR05VI/RqppvLdV3AYFFBIvcNQFA0E73ncFF
	BXvmRvwVvq3bS7Pag1lBtuB7KbVFWaO/WorDYjM4k/MTXXmU89M+LWhSQZ5YsllBSKbxNdZ7rg2KV
	gXiRbiuAZ/xYwbZUfwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOZBk-00AqbV-Jr; Mon, 28 Feb 2022 06:07:16 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOZBh-00Aqaj-Ut; Mon, 28 Feb 2022 06:07:15 +0000
Received: by mail-qt1-x832.google.com with SMTP id c4so8096188qtx.1;
 Sun, 27 Feb 2022 22:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dX1IYuv+pKoE5RWQMebZf9zpCqSCm/Io5TiFn1oToxU=;
 b=UJLrcu+KI8inQtMLqAneJSCusa/UZBrkhLT4UfuM574uAB9MAt84mJh8YJmOeo1pH2
 fkeZvXwH8jtTmOzk/IQITotZ0akAy9IiDX/cFqmSi8zlPw8AdfG7hVTJAZG0cGaVnJ0Z
 fDcaGovRGGCqNQcL3V8LQZjLAsWfeOL1Bs6XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dX1IYuv+pKoE5RWQMebZf9zpCqSCm/Io5TiFn1oToxU=;
 b=uBl3rP+VknU50BD6ZJTJQ1+zG8gjLNnffzSKkB0s3d4NVu0Q7p/x3nlr9G4XbXrDdH
 7V5Zi6GI3cHI5UjJkN+Vu90FK2Etyasf54ushsN01UjgcKnSphMCQPby57GsmK9autLi
 G70Ghko6yjGVVQZVqcwqp/G95ZrxRI/bnqQ0vN3FnDD5qMUz6OcHu8kApV0qT4ZP1uQ1
 M8zuPDm5Q2bSxZuXg9TMf3PeOmWj+FXluSmo+nEioK5O4J8OwOfyWas5mncaKj1NWrAz
 oWWWM+k/41zoyDMWweZpO6gGDdNAA7px2xAK+dqKKdn/u60/0qkVh7QgZHGXLQaPAR35
 cxlA==
X-Gm-Message-State: AOAM531mwKi13CIBIXh+P7Tcf4Mj3zKF5Gjo5ixxFyhrst3BX8zCc2Pr
 sUBJ9dDLuZTk/dBrbDMsMxH0QKbxEa4Y5M9Qm1M=
X-Google-Smtp-Source: ABdhPJwx6e/7afLlxfw9imZxLs7kaRmaUVuH7jsAW+iB4UW00tnsvFIFNSUOuVEkA/Ke6pPE4HgOwn0IBfi1momwe5k=
X-Received: by 2002:a05:622a:283:b0:2de:b3a2:b52d with SMTP id
 z3-20020a05622a028300b002deb3a2b52dmr11796494qtw.625.1646028432862; Sun, 27
 Feb 2022 22:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-2-clg@kaod.org>
 <20220225073155.f2cxfhm7surf34d4@ti.com>
 <688b7a65-d4b6-682b-494a-1d4178699dba@kaod.org>
In-Reply-To: <688b7a65-d4b6-682b-494a-1d4178699dba@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 06:07:01 +0000
Message-ID: <CACPK8XeCfLmEJSLV6q5BLpCVztzG3dZehCgqrjgrNr7LaOiReQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Pratyush Yadav <p.yadav@ti.com>, linux-spi@vger.kernel.org, 
 linux-mtd <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_220714_018076_46E8DD2A 
X-CRM114-Status: GOOD (  19.82  )
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

T24gU3VuLCAyNyBGZWIgMjAyMiBhdCAxODo1MCwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBPbiAyLzI1LzIyIDA4OjMxLCBQcmF0eXVzaCBZYWRhdiB3cm90ZToK
PiA+IE9uIDE0LzAyLzIyIDEwOjQyQU0sIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOgo+ID4+IFRv
IHByZXBhcmUgdHJhbnNpdGlvbiB0byB0aGUgbmV3IEFzcGVlZCBTTUMgU1BJIGNvbnRyb2xsZXIg
ZHJpdmVyIHVzaW5nCj4gPj4gdGhlIHNwaS1tZW0gaW50ZXJmYWNlLCBjaGFuZ2UgdGhlIGtlcm5l
bCBDT05GSUcgb3B0aW9uIG9mIHRoZSBjdXJyZW50Cj4gPj4gZHJpdmVyIHRvIHJlZmxlY3QgdGhh
dCB0aGUgaW1wbGVtZW50YXRpb24gdXNlcyB0aGUgTVREIFNQSS1OT1IgaW50ZXJmYWNlLgo+ID4+
IE9uY2UgdGhlIG5ldyBkcml2ZXIgaXMgc3VmZmljaWVudGx5IGV4cG9zZWQsIHdlIHNob3VsZCBy
ZW1vdmUgdGhlIG9sZCBvbmUuCj4gPgo+ID4gSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSBy
ZWFzb25pbmcgYmVoaW5kIHRoaXMuIFdoeSBrZWVwIHRoZSBvbGQKPiA+IGRyaXZlciBhcm91bmQ/
IFdoeSBub3QgZGlyZWN0bHkgcmVwbGFjZSBpdCB3aXRoIHRoZSBuZXcgb25lPyBEb2VzIHRoZQo+
ID4gbmV3IG9uZSBoYXZlIGFueSBsaW1pdGF0aW9ucyB0aGF0IHRoaXMgb25lIGRvZXNuJ3Q/Cj4K
PiBOby4gVGhlIG9sZCBvbmUgaGFzIG1vcmUgbGltaXRhdGlvbnMgdGhhbiB0aGUgbmV3IG9uZS4g
VGhlIG9sZCBvbmUgaW4KPiBtYWlubGluZSBpcyBoYWxmIGJha2VkIHNpbmNlIHdlIGNvdWxkIG5l
dmVyIG1lcmdlIHRoZSBuZWNlc3NhcnkgYml0cwo+IGZvciB0cmFpbmluZy4gV2UgaGF2ZSBiZWVu
IGtlZXBpbmcgYSBmdWxsIHZlcnNpb24gb24gdGhlIE9wZW5CTUMgdHJlZS4KPgo+IEpvZWwsIGNv
dWxkIHdlIHNpbXBseSBkcm9wIHRoZSBvbGQgZHJpdmVyIGluIG1haW5saW5lIGFuZCBrZWVwIHRo
ZSBvbGQKPiBvbmUgaW4gdGhlIE9wZW5CTUMgdHJlZSB1bnRpbCB3ZSBmZWVsIGNvbWZvcnRhYmxl
ID8gSSBndWVzcyB3ZSBuZWVkCj4gbW9yZSB0ZXN0aW5nLgoKSSB3b3VsZCBhbnN3ZXIgUHJhdHl1
c2gncyBxdWVzdGlvbiB3aXRoOiB0aGUgb2xkIG9uZSBpcyB3ZWxsIHRlc3RlZCwKYW5kIHRoZSBu
ZXcgb25lIGlzIG5vdC4gV2Ugd291bGQgaW50ZW5kIHRvIGtlZXAgdGhlIG9sZCBvbmUgYXJvdW5k
IGZvcgphIHJlbGVhc2UgY3ljbGUgb3IgdHdvLCBhbmQgb25jZSB3ZSdyZSBjb25maWRlbnQgdGhl
IG5ldyBvbmUgaXMgc3RhYmxlCndlIHdvdWxkIHJlbW92ZSB0aGUgb2xkLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
