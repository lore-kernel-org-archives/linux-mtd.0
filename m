Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33331CCA468
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8QOzJy/AMnFvXnxj2GouZmGhQH22CJxyH0DTBnM9ZE=; b=gLCfA+PmsjjQKO
	ddQi7lLHH4a9/N7zRJT9RNAFBMtcQkDI7JRVp+xlSvJdCuAhSU37m8wLvV2wJVKa2gHBfbcKZBi6h
	i9bNJ88SvB7hYeyANwdleekBYTBcDPnS9/cJFURblU2sneVUfkYrb80ReddQZDdei6f51Pcaz30x3
	NnKLPviyeZhr/VVy/cBGpOF/ZsTZsVE248Gw91uqvi/OCm47sU0zWB5dJ2pUfcFmtej0l7DVDs3NV
	c8/BXGboPKSDxKr+kdlzNML0/w4Aqkw1j/N2jhbeC1BuikBIUB553lP6cul40VVbrlBp+iHkaZEWy
	eHCo8Tj9NUUXPaPgbV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZKR-00000005EwV-0S6w;
	Tue, 30 Sep 2025 12:19:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZKP-00000005EwJ-3BGD
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 12:19:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34B2160296;
	Tue, 30 Sep 2025 12:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0011C4CEF0;
	Tue, 30 Sep 2025 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759234772;
	bh=K/02sF+wmK8zVvZYoYSnvHtVxTq3OlWrSzPnKA270yo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DgfOdVsZlwSmJA7IW7k1lnvV4jlq5FSwwBDuzMpIZGBtUdDVSJgTquIthFlGa5Q8U
	 98BLtzqFOohEkkPbc8+FNu7gjY9gDH91lZ3yY37wiMqeZfQ1FunDIqwYk9aVycgpCQ
	 dXxcDiggi1UD9be3PF1r8wXAh7sugOD+P308J7IUiCylTcWtP1fagJFIAoAuTBVEiU
	 DjsygnIC5ZyklUWrMKJ+lbJToLW3Vi4CVgR6YK7x5n6zedQdHtCfnR97n3qgBYQMFF
	 1/JRi/+JyjcMRDQmpoKNYfnAxvKTmdlfBPrraklKJNyL2IozHxYiSgCJw1xVbYn8LX
	 py8sii1AYhYAQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Guenter Roeck <linux@roeck-us.net>,  Pratyush
 Yadav <pratyush@kernel.org>,  Cheng Ming Lin <chengminglin@mxic.com.tw>,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Maarten Zanders
 <maarten@zanders.be>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
In-Reply-To: <CAAyq3SYyqi-oR8T039Zd0uaF6UieX3SdF9UF2kxOG6+yJqAEUg@mail.gmail.com>
	(Cheng Ming Lin's message of "Tue, 30 Sep 2025 15:36:40 +0800")
References: <20250407075400.1113177-1-linchengming884@gmail.com>
	<20250407075400.1113177-2-linchengming884@gmail.com>
	<d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
	<mafs05xh6pf7s.fsf@kernel.org>
	<da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
	<a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
	<aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
	<CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
	<DD10QMSJVZ2K.26U45JAXV5EY7@kernel.org>
	<CAAyq3SYyqi-oR8T039Zd0uaF6UieX3SdF9UF2kxOG6+yJqAEUg@mail.gmail.com>
Date: Tue, 30 Sep 2025 14:19:29 +0200
Message-ID: <mafs01pnoceum.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

T24gVHVlLCBTZXAgMzAgMjAyNSwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cgo+IEhpIE1pY2hhZWws
Cj4KPiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4g5pa8IDIwMjXlubQ55pyIMjTm
l6Ug6YCx5LiJIOS4i+WNiDg6MTHlr6vpgZPvvJoKPj4KPj4gPiBUaGUgcm9vdCBjYXVzZSBvZiB0
aGlzIHByb2JsZW0gbGllcyBpbiB0aGUgZmFpbHVyZSBvZiBwYXJzaW5nIHRoZSBTRkRQCj4+ID4g
ZGF0YSBmb3IgdGhlIGZsYXNoLCByYXRoZXIgdGhhbiBhbiBpc3N1ZSB3aXRoIHRoZSBwYXRjaCBp
dHNlbGYuIEkgYmVsaWV2ZQo+PiA+IHdlIHNob3VsZCBub3QgcmV2ZXJ0IHRoaXMgcGF0Y2guCj4+
Cj4+IEkgZGlzYWdyZWUuIFRoZXJlIGFyZSBNYWNyb25peCBmbGFzaGVzIHdpdGggdGhhdCBJRCB3
aGljaCBkb2Vzbid0Cj4+IGhhdmUgU0ZEUC4gIEFuZCB0aGlzIHBhdGNoIGlzIGRyb3BwaW5nIHN1
cHBvcnQgZm9yIHRoZW0uIFNlZSBhbHNvCj4+IFsxXS4gTm93IEknbSBub3Qgc3VyZSBpdCBpcyB3
b3J0aCByZXZlcnRpbmcgdGhpcyBjb21taXQuIE5vYm9keSwKPj4gZXhjZXB0IEd1ZW50ZXIgY29t
cGxhaW5lZCwgYnV0IG9ubHkgKnNvIGZhciogKGFuZCB0aGF0IHBhdGNoIGlzIGluCj4+IHNpbmNl
IDYuMTYpLiBBbnkgb3BpbmlvbnM/CgpXaGVuIEkgcmVhZCB0aGlzIEkgd2FzIGp1c3QgaG9waW5n
IG5vIG9uZSBjb21wbGFpbnMgYW5kIHdlIGVuZCB1cCBqdXN0CmRyb3BwaW5nIHN1cHBvcnQgZm9y
IHRoZXNlIGZsYXNoZXMgdGhhdCBubyBvbmUgc2VlbXMgdG8gdXNlLi4uCgo+Cj4gSSBhZ3JlZSB3
aXRoIHJldmVydGluZyB0aGlzIHBhdGNoLiBXaGVuIEkgaW5pdGlhbGx5IHZlcmlmaWVkIGl0LCB0
aGUKPiBkZXZpY2VzIEkgaGFkIG9uIGhhbmQgYWxsIHN1cHBvcnRlZCBTRkRQLCBzbyBJIGRpZCBu
b3QgY2F0Y2ggdGhpcyBpc3N1ZS4KPiBBZnRlciBjaGVja2luZyBhZ2FpbiwgSSBjb25maXJtIHRo
YXQgc29tZSBvbGRlciBmbGFzaGVzIHdpdGhvdXQgU0ZEUCBhcmUKPiBpbmRlZWQgYWZmZWN0ZWQu
CgpEbyB5b3Uga25vdyBpZiB0aGVzZSBmbGFzaGVzIGFyZSB1c2VkIGluIGFueSBkZXZpY2VzIHRo
YXQgYXJlIGFjdGl2ZWx5CnVzZWQgYW5kIG1haW50YWluZWQ/IElmIHNvLCB3ZSBzaG91bGQgcmV2
ZXJ0LiBJZiBpdCBpcyBsaWtlbHkgdGhleQphcmVuJ3QgYWN0aXZlbHkgdXNlZCwgdGhlbiBtYXli
ZSB3ZSBqdXN0IGtlZXAgdGhpbmdzIGFzIHRoZXkgYXJlPwpEdW5uby4uLgoKPgo+IFdvdWxkIGl0
IG1ha2Ugc2Vuc2UgdG8gb25seSBjaGFuZ2UgdGhlIGAubmFtZWAgZmllbGQgdG8gdXNlIGEgY29t
bWVudCwKPiB3aGlsZSBrZWVwaW5nIHRoZSByZXN0IGFzIGlzPyBUaGF0IHdheSB3ZSBjYW4gc3Rp
bGwgc3VwcG9ydCBmbGFzaGVzIHRoYXQKPiBtYXkgbm90IHByb3ZpZGUgU0ZEUC4KClN1cmUsIHRo
YXQgd291bGQgYmUgYSBnb29kIGltcHJvdmVtZW50IG92ZXIgYSBwbGFpbiByZXZlcnQuIE1heWJl
IGFzIGEKZm9sbG93IHVwIHBhdGNoIHRvIHRoZSByZXZlcnQ/CgotLSAKUmVnYXJkcywKUHJhdHl1
c2ggWWFkYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
