Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BD8CA0EEB
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m78PwHO5nPmpbDLIks+nHsew56+LriZgwNimsUhGI3s=; b=dQYTahJFv+j+3K
	SDh042TB2T+17O4QrQOJ60Zjqta62S6RD/IT2neyubgow84ENVTVQqXunllr/rCqhCLo3iZssrN6B
	gx1oO/VG/70EG6pF6O6kiUiNPI9uON1vC6gQH3I/jDr1HZyEHQKUMqwWS4S0ifpgsvcVRBBoOEU/R
	AS9yYog2dDTlcef7qhItSSBMg5v/jktNA+oHIHnTObVX6HTyUGl8iKRu6RHfYfrJUqcHRdU2eXWDl
	53RMaFWKsbazca2KplKBfzhuLSAQSlbIoYO4k0jMau0L1NrnDjOATOfUuw/m6FrI0s5c5MZsb475S
	L7bMSOkfNgkBy6Z0vk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwLR-00000005BUq-24tk;
	Fri, 30 Aug 2024 07:46:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwKa-00000005BOv-3o50;
	Fri, 30 Aug 2024 07:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VpebzrTQoNRUKh5ynrlO5Iu8naFvX7FtDOTwf/qOm4A=; b=bf3eKyGK22jHVS6jNQYnKZ7rhR
	HDcjYW1JHER0Aov65bgRm9HdZBCbt4XT5h9QR58S5dONaJdjsn99iLwB62KiUYm4HJmlVSkLs5s5L
	S5ewXaM7Bzn5DWGQQyCkFr8faRkV2Adi/Vw9wGGUN4+vNBoxoV3SynsGPqqzBHnTJR8QjnkPzlAAj
	9CRL7yGOS7lZ/S2NemmQVq0kMvHjrn40f0r6+K0HeK6jGFgmcl42qIWK4gnWsLa1ob83ivdxOw7JU
	tqYdx9CTuJnREabjKfe4E5NN8Wpw+R7GfdW9rmGkUw0NZhXdh8jFbMbGbeLrQ4qftU8eiBfrrrvPa
	0hzUGOow==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwKV-0000000Bb70-3Vdn;
	Fri, 30 Aug 2024 07:46:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36B771BF209;
	Fri, 30 Aug 2024 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725003953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpebzrTQoNRUKh5ynrlO5Iu8naFvX7FtDOTwf/qOm4A=;
	b=KkNtioU+WkZU8XZauR1n22NpmH71HFly2u9LmqlUqpZSjxsw4D3GNaQ5b8RXOdRP1vIblG
	1BuAc/S3FaJlaTnMaxMPR0UE6gbAg476eLE/QamnjS9z+uIOF2mwRoIfCgwHv835j1RtvW
	m0zsNyod3wMcqq8cnPB1jN2H1P6rmLDO9HHI5S1UQ/laGZiXm+EjSjV2R6wuv2noboi4nH
	3Pq8Msc6rC+4ul0Zncwyhvt9s65q90WrR6JI+3/LBW8ChufwLbugaEO9c6DU+S+OwMiqoi
	p4PFJKlUzZmlxJsYYFb4y8Su6oy3DiguDX/0m3yFr7XoBLtTPvwInK9gm+PLaw==
Date: Fri, 30 Aug 2024 09:45:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, <michal.simek@amd.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <liang.yang@amlogic.com>,
 <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <heiko@sntech.de>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
 <gustavoars@kernel.org>, <linux@treblig.org>, <robh@kernel.org>,
 <u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
 <christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
 <christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <jic23@kernel.org>
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Message-ID: <20240830094549.1c513ba2@xps-13>
In-Reply-To: <c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
	<20240826115213.389acaef@xps-13>
	<f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
	<20240826144917.2c4e202d@xps-13>
	<c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_084600_072243_85AC31E0 
X-CRM114-Status: GOOD (  13.80  )
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

SmluamllLAoKcnVhbmppbmppZUBodWF3ZWkuY29tIHdyb3RlIG9uIEZyaSwgMzAgQXVnIDIwMjQg
MTQ6MzQ6MzggKzA4MDA6Cgo+IE9uIDIwMjQvOC8yNiAyMDo0OSwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhpIEtyenlzenRvZiwKPiA+IAo+ID4ga3J6a0BrZXJuZWwub3JnIHdyb3RlIG9uIE1v
biwgMjYgQXVnIDIwMjQgMTI6MTk6MDcgKzAyMDA6Cj4gPiAgIAo+ID4+IE9uIDI2LzA4LzIwMjQg
MTE6NTIsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+Pj4gSGkgSmluamllLAo+ID4+Pgo+ID4+
PiBydWFuamluamllQGh1YXdlaS5jb20gd3JvdGUgb24gTW9uLCAyNiBBdWcgMjAyNCAxNzo0Mzox
OCArMDgwMDoKPiA+Pj4gICAgIAo+ID4+Pj4gVXNlIHNjb3BlZCBmb3JfZWFjaF9hdmFpbGFibGVf
Y2hpbGRfb2Zfbm9kZV9zY29wZWQoKSB3aGVuIGl0ZXJhdGluZyBvdmVyCj4gPj4+PiBkZXZpY2Ug
bm9kZXMgdG8gbWFrZSBjb2RlIGEgYml0IHNpbXBsZXIuICAgIAo+ID4+Pgo+ID4+PiBXaHkgaXMg
dGhpcyBhIHJlc2VuZCA/IERpZCBJIG1pc3MgYSBwcmV2aW91cyBpdGVyYXRpb24/ICAgIAo+ID4+
Cj4gPj4gWW91IHdlcmUgbm90IGNjLWVkIG9uIHByZXZpb3VzIGl0ZXJhdGlvbi4gSSBhc2tlZCBm
b3IgcHJvcGVyIHNwbGl0Cj4gPj4gYmV0d2VlbiBzdWJzeXN0ZW1zIGFuZCBzZW5kaW5nIHRvIG1h
aW50YWluZXJzLCB0aHVzIHRoaXMgcmVzZW5kLiAgCj4gPiAKPiA+IE9rLiBNYWtlcyBzZW5zZSwg
YW5kIHRoZSBwYXRjaHNldCBsb29rcyBmaW5lLiAgCj4gCj4gSGksIE1pcXVlbCwKPiAKPiBDb3Vs
ZCB0aGlzIHNlcmllcyBiZSBtZXJnZWQsIHRoYW5rIHlvdSEKCllvdSd2ZSBzZW50IHRoaXMgc2Vy
aWVzIG9uIE1vbmRheSwgd2UgYXJlIEZyaWRheS4gSSBhbnN3ZXJlZCBhIGZpcnN0CnRpbWUgd2l0
aGluIDVoIGFuZCByZXZpZXdlZCBpdCB3aXRoaW4gOGguIFNvIHRoYXQgbWVhbnMgSSB3aWxsIHRh
a2UgdGhlCnBhdGNoc2V0OgotIHdoZW4gSSBoYXZlIHRoZSB0aW1lIHRvIGRvIHNvCi0gYWZ0ZXIg
c2V2ZXJhbCBkYXlzIHRvIGdpdmUgYSBjaGFuY2UgdG8gb3RoZXIgdG8gcmV2aWV3IGl0IGFzIHdl
bGwKLSB1bmxlc3Mgc29tZW9uZSBzcGVha3MgdXAgYWdhaW5zdCBpdCBpbiBhICJyZWFzb25hYmxl
IHRpbWUgZnJhbWUiCi0gdW5sZXNzIGEgcm9ib3QgdGhhdCBwYXJzZXMgdGhlIHBhdGNoZXMgb24g
dGhlIG1haWxpbmcgbGlzdHMgY29tcGxhaW5zCiAgYWJvdXQgaXQgKHVzdWFsbHkgd2l0aGluIGZl
dyBkYXlzLCB1cCB0byBhIHdlZWspLgoKSW4gZ2VuZXJhbCwgYSBnb29kIHJ1bGUgb2YgdGh1bWIg
aXMgdG8gcmVmcmFpbiB5b3Vyc2VsZiBmcm9tIHBpbmdpbmcKd2l0aGluIDIgd2Vla3MgZm9yIG5v
bi11cmdlbnQgbWF0dGVycyBsaWtlIHRoaXMgc2VyaWVzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
