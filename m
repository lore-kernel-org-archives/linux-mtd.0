Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CB0C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rugThnQyXlChZdTiE1K+tAN/egfJxKBUpsN7mgVX7cw=; b=l0oo9digFjZw3l
	MFdtHPanwpLz1iblBi7l0D3vHe/CWIF3QFXHykb3VaXcNfql9Ksze9v+qFb8eIB6+Wz2My0A9Tu40
	BzMqdBDTbu70lb52a030jwHajKP0GEVPc5WEDdFFGIeZ1KqP2Y6WoWqifRdCWgLWyKiRDu1ktjTLB
	4btuVZENI2h/1eTbnBESXlo52CHKxg5feIBXYrtv+lk8syOvZnGdkXkU3l/1nTTrGFsjGzobj1X5c
	CQVXNP7KPk1yUrC7S+i1PWp/FiLnC6YAAf9ck0ZB4LFL+faxVAdowio2GeNF/8YvWzVOuIOWMNwJX
	nFuDApgq+6z29zLcpQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nts2J-00BQaL-F5; Wed, 25 May 2022 14:30:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nts24-00BQYB-B4; Wed, 25 May 2022 14:30:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2FE75B81DE9;
	Wed, 25 May 2022 14:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1DAC3411A;
	Wed, 25 May 2022 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653489036;
	bh=8HyHVyybo/0tZkV/fgwThFXRZPUG5Hduds4Oad/Ax4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Seststo4IX6giDvmM3hP0SuPLNctoXJml402CKuZ1HVbxLTBQ1cLdWMJDV290f0/k
	 adtTg915kQ+NfThzVKkEC5tuH7O/1bD5UN0TcxMRfSOE455CCDYdKmIv30G3XR2bN9
	 sJWKO6NCjeik/v2ULR5a4AXJtUwXSn+YU/hNhc+gun1FZO4pPrJJgEw3P5A0hC3lTb
	 ey2nOO6/wgaQvaKb1Fj6Vdg1o8cbyu6TjCL174F7VruyjRT9IvwVyF8A9MKdJCZbSJ
	 PiSlXCPs26JARvoSNWRi+2E6BY32JXmMq0vYc/GxuKsti7sxbBZDV2maxADOEZrgpA
	 aDu7mGKBDKjXg==
Received: by mail-ej1-f49.google.com with SMTP id m20so42051098ejj.10;
        Wed, 25 May 2022 07:30:36 -0700 (PDT)
X-Gm-Message-State: AOAM5316FnVZRjxdokYoM5MWMQLaHI9LbV3HPnywU6N34Z6+kEYczGnA
	APSWPfmOfiJ9YmLyMajGmUHkzBWLnvAap7GhoQ==
X-Google-Smtp-Source: ABdhPJxJjLiunW5d2So/1U+3/Kl7ANSlIu+TXdQXon7zGOmAxDWIwpH2r+gIYlFBI5+GwQd36/nrkgYpz7pHo6jUMC4=
X-Received: by 2002:a17:907:2daa:b0:6fe:b449:6a8f with SMTP id
 gt42-20020a1709072daa00b006feb4496a8fmr22130827ejc.318.1653489034973; Wed, 25
 May 2022 07:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <b36280be-9993-9a78-0960-4094efeed1aa@linaro.org>
 <CAMuHMdWL93+r0cofwHKj1k-gUo9nk3OzUf6gtY68sK4JNibyNg@mail.gmail.com> <eb5ab9553c419b8259f5494664865597b6c5d4db.camel@infradead.org>
In-Reply-To: <eb5ab9553c419b8259f5494664865597b6c5d4db.camel@infradead.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 May 2022 09:30:22 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ49bnBe84PXYY6caN0rxEEgL=mcWqKktzbK94McgYNfw@mail.gmail.com>
Message-ID: <CAL_JsqJ49bnBe84PXYY6caN0rxEEgL=mcWqKktzbK94McgYNfw@mail.gmail.com>
Subject: Re: Getting rid of infradead.org - corrupted subjects
To: David Woodhouse <dwmw2@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mark@msapiro.net, 
	workflows@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_073040_706751_02777EE1 
X-CRM114-Status: GOOD (  27.84  )
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

T24gV2VkLCBNYXkgMjUsIDIwMjIgYXQgNDo1NSBBTSBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAyMDIyLTA1LTI1IGF0IDEwOjM0ICswMjAw
LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBDQyBkd213Mgo+Cj4gVGhhbmtzLCBHZWVy
dC4KPgo+ID4gT24gV2VkLCBNYXkgMjUsIDIwMjIgYXQgMTA6MDcgQU0gS3J6eXN6dG9mIEtvemxv
d3NraQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
PiBUaGUgYWRkcmVzcyBsaXN0IGlzIHNlbWktcmFuZG9tIGFzIEkgZG9uJ3Qga25vdyB3aG9tIHRv
IGFwcHJvYWNoLgo+ID4gPiBQcm9ibGVtOiBpbmZyYWRlYWQub3JnIGNvcnJ1cHRzIGVtYWlsIHN1
YmplY3RzIGJ5IGNoYW5naW5nOgo+ID4gPiBzLywvLCAvCj4KPiBJIGZvdW5kIGFuIG9sZCB0aHJl
YWQgb24gbWFpbG1hbi11c2VycyB3aGljaCBhcHBlYXJzIHRvIGJlIGNsYWltaW5nCj4gdGhhdCBp
dCdzIGp1c3Qgc3RhbmRhcmQgZm9sZGluZyBhcyBkZXNjcmliZWQgaW4gUkZDMjgyMiDCpzIuMi4z
Lgo+Cj4gaHR0cHM6Ly9tYWlsLnB5dGhvbi5vcmcvcGlwZXJtYWlsL21haWxtYW4tdXNlcnMvMjAw
Ny1NYXkvMDU3MTE5Lmh0bWwKPgo+IDIuMi4zLiBMb25nIEhlYWRlciBGaWVsZHMKPgo+ICAgIEVh
Y2ggaGVhZGVyIGZpZWxkIGlzIGxvZ2ljYWxseSBhIHNpbmdsZSBsaW5lIG9mIGNoYXJhY3RlcnMg
Y29tcHJpc2luZwo+ICAgIHRoZSBmaWVsZCBuYW1lLCB0aGUgY29sb24sIGFuZCB0aGUgZmllbGQg
Ym9keS4gIEZvciBjb252ZW5pZW5jZQo+ICAgIGhvd2V2ZXIsIGFuZCB0byBkZWFsIHdpdGggdGhl
IDk5OC83OCBjaGFyYWN0ZXIgbGltaXRhdGlvbnMgcGVyIGxpbmUsCj4gICAgdGhlIGZpZWxkIGJv
ZHkgcG9ydGlvbiBvZiBhIGhlYWRlciBmaWVsZCBjYW4gYmUgc3BsaXQgaW50byBhIG11bHRpcGxl
Cj4gICAgbGluZSByZXByZXNlbnRhdGlvbjsgdGhpcyBpcyBjYWxsZWQgImZvbGRpbmciLiAgVGhl
IGdlbmVyYWwgcnVsZSBpcwo+ICAgIHRoYXQgd2hlcmV2ZXIgdGhpcyBzdGFuZGFyZCBhbGxvd3Mg
Zm9yIGZvbGRpbmcgd2hpdGUgc3BhY2UgKG5vdAo+ICAgIHNpbXBseSBXU1AgY2hhcmFjdGVycyks
IGEgQ1JMRiBtYXkgYmUgaW5zZXJ0ZWQgYmVmb3JlIGFueSBXU1AuICBGb3IKPiAgICBleGFtcGxl
LCB0aGUgaGVhZGVyIGZpZWxkOgo+Cj4gICAgICAgICAgICBTdWJqZWN0OiBUaGlzIGlzIGEgdGVz
dAo+Cj4gICAgY2FuIGJlIHJlcHJlc2VudGVkIGFzOgo+Cj4gICAgICAgICAgICBTdWJqZWN0OiBU
aGlzCj4gICAgICAgICAgICAgaXMgYSB0ZXN0Cj4KPiBCdXQgdGhpcyBpcyBmb2xkaW5nIGF0IGEg
KmNvbW1hKiwgbm90IGF0IHdoaXRlc3BhY2UuIFRoZSBvcmlnaW5hbAo+IHN1YmplY3QgbGluZSB3
YXMgKGluIGEgc2luZ2xlIGxpbmUpOgo+Cj4gU3ViamVjdDogW1BBVENIIHYyXSBkdC1iaW5kaW5n
czogbXRkOiBqZWRlYyxzcGktbm9yOiByZW1vdmUgdW5uZWVkZWQgcHJvcGVydGllcwo+Cj4gLi4u
IGFuZCBNYWlsbWFuICdmb2xkZWQnIGl0IGluIHRoZSB3cm9uZyBwbGFjZSB0bzoKPgo+IFN1Ympl
Y3Q6IFtQQVRDSCB2Ml0gZHQtYmluZGluZ3M6IG10ZDogamVkZWMsCj4gIHNwaS1ub3I6IHJlbW92
ZSB1bm5lZWRlZCBwcm9wZXJ0aWVzCj4KPiBUaGF0ICppc24ndCogcHJvcGVyIGZvbGRpbmcgYmVj
YXVzZSBpdCBkaWRuJ3QgaGFwcGVuIGF0IGEgd2hpdGVzcGFjZS4KPgo+IEkgZG8gbmVlZCB0byB1
cGdyYWRlIHRvIE1haWxtYW4gMyBhdCBzb21lIHBvaW50OyBJJ3ZlIGJlZW4KPiBwcm9jcmFzdGlu
YXRpbmcgb24gdGhlIGJhc2lzIHRoYXQgaXQgImFpbid0IGJyb2tlIi4gRm9yIHRoZSB0aW1lIGJl
aW5nCj4gSSd2ZSBqdXN0IGRpc2FibGVkIGZvbGRpbmcgaW4gTU0yIHdpdGggYSB0cml2aWFsIGhh
Y2s6CgpZYXkhISEgSSBzaG91bGQgaGF2ZSBhc2tlZCB5ZWFycyBhZ28uLi4KCkFueSBjaGFuY2Ug
dGhlIGFwcGVuZGluZyBvZiBmb290ZXJzIGNhbiBiZSBzdG9wcGVkIGFzIGl0IGNhdXNlcyBsb3Jl
CnRvIHJlcG9ydCBkdXBsaWNhdGVzIGFuZCBiNCBkbWFyYyBhdHRlc3RhdGlvbiB0byBmYWlsPwoK
Um9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
