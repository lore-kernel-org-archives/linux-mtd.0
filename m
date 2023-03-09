Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB07C64EC4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Exo2yOWDVUFbNu/lxenw8py6QG6C7ZRKuM4o4ucw9c=; b=kJewwqVi/3IGrqVWnWOLbrLunA
	Skhzpm69zGJRPSOJUQSC4gWNPIQ3+uApgBJ56NxBZdmtU/2iCtQOVa7LTq1kSpRU0g985s+/6q/AM
	Qgl9i3QuKW4o40X7kibPKjLho3sZCxVfnW/3w2W3wxSPMBg9IOCdzYAJBh4n8JMcKdEiLsb1uCx7B
	Tl+I13AxSHP7R03Ok7CZGT1UxUdVb9YUA8zCojTInbBlsXIK9NNnGKlDCZsm8D0gS3AVx3ZLl4BjG
	kFuZwRF+fUcggSBbRvX05nIFixFVFf8qj4FUOPX9gQ53DCODuzBZqhN2r5Xqko960TW1aMiTyqCXh
	TlxMx34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIes-00B5se-Cm; Thu, 09 Mar 2023 15:58:23 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIOe-00Aylc-Ek; Thu, 09 Mar 2023 15:41:38 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4B77970;
	Thu,  9 Mar 2023 16:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678376491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r60XWQKaLUS5jZxaKx7MYiskgFp+zOaGglaYs+jZpB4=;
	b=yw+qp48S48+4FOgaRHiANfTm+xvcoCzUGV9aYe37Jj3gd+iyXZkSHEY3ajTl1gOkq7oO5u
	znQsK6gjuSZJQmV9F723h6LSh+Ua5//e2bDncUPygUzT8hsi83CTGF4SyHwJFvXkV3bxwp
	CSxbPy6deUetvisKRLNhwMhMdvwvdcvcYWMFmvpQcTXWm1tYcUpnfbR5h0X1c4xBJ/n99t
	LlDhNRFLCLOUgkU31/Pfsu4T4OopSDPVFJL45qWT2crt5QCwG9zx+Pib9gs+m5W6j+K4DE
	k5NJkQtIMfNPp2V0U7zXvNaTeoF7LpJdtWjywMe7UMb6WsgT4EKOB7vyOtTqeA==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 16:41:31 +0100
From: Michael Walle <michael@walle.cc>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Serge Semin
 <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 Claudiu.Beznea@microchip.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
 joel@jms.id.au, andrew@aj.id.au, kdasu.kdev@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com,
 yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, michal.simek@xilinx.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
In-Reply-To: <CAJsYDVJ_UtGqOm_HsN4X4nAuy9svXe4XV6aeG_fg8cWDrgrHMQ@mail.gmail.com>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
 <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
 <CAJsYDVJ_UtGqOm_HsN4X4nAuy9svXe4XV6aeG_fg8cWDrgrHMQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <844d3d6807106a78767607327e2ec0d5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_074136_697133_9BB8BC87 
X-CRM114-Status: GOOD (  19.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMy0wMy0wOSAxNToxOSwgc2NocmllYiBDaHVhbmhvbmcgR3VvOgo+IEhpIQo+IAo+IE9u
IFRodSwgTWFyIDksIDIwMjMgYXQgMTA6MDTigK9QTSBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdh
bGxlLmNjPiB3cm90ZToKPj4gCj4+IEFtIDIwMjMtMDMtMDkgMTQ6NTQsIHNjaHJpZWIgVHVkb3Ig
QW1iYXJ1czoKPj4gPiBPbiAwOS4wMy4yMDIzIDE1OjMzLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+
PiA+Pj4+PiBUaGUgY29udHJvbGxlcnMgdGhhdCBjYW4gdGFsayBpbiBkdW1teSBuY3ljbGVzIGRv
bid0IG5lZWQgdGhlCj4+ID4+Pj4+IGR1bW15LntidXN3aWR0aCwgZHRyfSBmaWVsZHMuCj4+ID4+
Pj4+Cj4+ID4+Pj4+IFRoZSBjb250cm9sbGVycyB0aGF0IGNhbid0IHRhbGsgaW4gZHVtbXkgY3lj
bGVzLCBidXQgb25seSBvbiBhCj4+ID4+Pj4+ICJieXRlIgo+PiA+Pj4+PiBib3VuZGFyeSBuZWVk
IGJvdGggYnVzd2lkdGggYW5kIGR0ciBmaWVsZHMuIEFzc3VtZSBhIGZsYXNoIG5lZWRzIDMyCj4+
ID4+Pj4+IGR1bW15IGN5Y2xlcyBmb3IgYW4gb3Agb24gOEQtOEQtOEQgbW9kZS4gSWYgdGhlIGNv
bnRyb2xsZXIgZG9lcyBub3QKPj4gPj4+Pj4gaGF2ZQo+PiA+Pj4+PiB0aGUgYnVzd2lkdGggYW5k
IGR0ciBpbmZvLCBpdCBjYW4ndCBjb252ZXJ0IHRoZSBkdW1teSBuY3ljbGVzIHRvCj4+ID4+Pj4+
IG5ieXRlcy4KPj4gPj4+Pj4gSWYgaGUga25vd3Mgb25seSB0aGF0IGJ1c3dpZHRoIGlzIDgsIGl0
IHdpbGwgY29udmVydCBuY3ljbGVzIHRvIDQKPj4gPj4+Pj4gYnl0ZXMuCj4+ID4+Pj4+IElmIGR0
ciBpcyBhbHNvIHNwZWNpZmllZCBpdCBjb252ZXJ0cyBuY3ljbGVzIHRvIDIgYnl0ZXMuCj4+ID4+
Pj4KPj4gPj4+PiBObyB0aGV5IGRvbid0IG5lZWQgaXQuIExldHMgdGFrZSB5b3VyIHNlbXBlciBm
bGFzaCBhbmQgYXNzdW1lIGl0Cj4+ID4+Pj4gbmVlZHMKPj4gPj4+PiAxMiBsYXRlbmN5IGN5Y2xl
cy4gU1BJLU5PUiB3aWxsIHNldCBuY3ljbGVzIHRvIDEyICpyZWdhcmRsZXNzIG9mIHRoZQo+PiA+
Pj4+IG1vZGUKPj4gPj4+PiBvciBkdHIgc2V0dGluZyouIFRoZSBjb250cm9sbGVyIHRoZW4ga25v
d3Mgd2UgbmVlZCAxMiBjbG9jayBjeWNsZXMuCj4+ID4+Pj4gSXQgaGFzCj4+ID4+Pj4gdGhlbiB0
byBmaWd1cmUgb3V0IGhvdyB0aGF0IGNhbiBiZSBhY2hpZXZlZC4gRS5nLiBpZiBpdCBjYW4gb25s
eSBkbwo+PiA+Pj4+IHRoZQo+PiA+Pj4+ICJvbGQiIGJ5dGUgcHJvZ3JhbW1pbmcgYW5kIGlzIGlu
IHF1YWQgbW9kZSwgZ29vZCBmb3IgaXQuIEl0IHdpbGwKPj4gPj4+PiBzZW5kIDYKPj4gPj4+PiBk
dW1teSBieXRlcywgd2hpY2ggd2lsbCByZXN1bHQgaW4gMTIgZHVtbXkgY2xvY2sgY3ljbGVzLCBi
ZWNhdXNlIDEKPj4gPj4+PiBieXRlCj4+ID4+Pj4gdGFrZXMgdHdvIGNsb2NrIGN5Y2xlcyBpbiBx
dWFkIFNEUiBtb2RlLiBJZiBpdHMgaW4gb2N0YWwgbW9kZSwgc2VuZAo+PiA+Pj4+IDEyCj4+ID4+
Pj4gYnl0ZXMuIElmIGl0cyBpbiBkdWFsIG1vZGUsIHNlbmQgMyBieXRlcy4gT2Jpb3VzbHksIGl0
IGNhbm5vdCBiZSBpbgo+PiA+Pj4+IHNpbmdsZSBiaXQgbW9kZSwgYmVjYXVzZSBpdCBjYW5ub3Qg
c2VuZCAxLjUgYnl0ZXMuLgo+PiA+Pj4+Cj4+ID4+Pgo+PiA+Pj4gWW91IG1pc3MgdGhlIGZhY3Qg
dGhhdCB5b3UgY2FuIGhhdmUgMS0xLTQuIFdoYXQgYnVzd2lkdGggZG8geW91IHVzZQo+PiA+Pj4g
Zm9yIGR1bW15LCB0aGUgYWRkcmVzcyBidXN3aWR0aCBvciB0aGUgZGF0YSBidXN3aWR0aD8KPj4g
Pj4KPj4gPj4gRG9lc24ndCBtYXR0ZXIsIGRvZXMgaXQ/IFRoZSBkcml2ZXIgaXMgZnJlZSB0byBj
aG9zZSwgMSwgNCwgb3IKPj4gPj4gYW55dGhpbmcKPj4gPj4gZWxzZS4gWW91IGRvbid0IHNhbXBs
ZSBhbnkgZGF0YSBkdXJpbmcgdGhlIGR1bW15IHBoYXNlLgo+PiA+PiBUbyBhbnN3ZXIgeW91ciBx
dWVzdGlvbjogc2luZ2xlIGZvciBpbnN0cnVjdGlvbiwgc2luZ2xlIGZvciBhZGRyZXNzLAo+PiA+
PiB3aGF0ZXZlciB5b3UgY2hvb3NlIGZvciBkdW1teSBhcyBsb25nIGFzIHRoZXJlIGFyZSBuY3lj
bGVzIHNwYWNlCj4+ID4+IGJldHdlZW4KPj4gPj4gYWRkcmVzcyBhbmQgZGF0YSwgYW5kIHF1YWQg
Zm9yIGRhdGEuCj4+ID4KPj4gPiBIdWg/IEhvdyBkb2VzIHRoZSBjb250cm9sbGVyIGNob3NlLCBi
YXNlZCBvbiB3aGF0Pwo+PiAKPj4gQmFzZWQgb24gaXRzIG93biBjYXBhYmlsaXRpZXMuIEl0IGNh
biBjaG9vc2UgZWl0aGVyIHdheS4gSW4gdGhlIGVuZAo+PiB3aGF0IG1hdHRlcnMgaXMgaG93IG1h
bnkgY2xvY2sgY3ljbGVzIHRoZXJlIGFyZSBiZXR3ZWVuIHRoZSBhZGRyZXNzCj4+IGFuZCBkYXRh
IHBoYXNlLiBBbmQgeW91IG9ubHkgbmVlZCB0byBjb252ZXkgdGhhdCBpbmZvcm1hdGlvbiB0byB0
aGUKPj4gU1BJIGNvbnRyb2xsZXIgLSB5b3VyIG5ldyBuY3ljbGVzLgo+IAo+IEl0IGRvZXMgbWF0
dGVyLiBDb250cm9sbGVyIG1heSBiZSBkZXNpZ25lZCB0byBhY3RpdmVseSBkcml2ZQo+IE1PU0kv
V1AvSE9MRCBkdXJpbmcgc2luZ2xlLXNwaSBkdW1teSBjeWNsZXMgYW5kIFdQL0hPTEQKPiBkdXJp
bmcgZHVhbC1zcGkgZHVtbXkgY3ljbGVzLiBJZiB0aGUgcGluIG1vZGVzIGJldHdlZW4gdGhlCj4g
Y29udHJvbGxlciBhbmQgZGV2aWNlIG1pc21hdGNoZWQsIHdvcnN0IGNhc2Ugc2NlbmFyaW8KPiB0
aGUgY2hpcCBtYXkgZ2V0IGZyaWVkLgoKSW50ZXJlc3RpbmcuIEJ1dCBtb3N0IG9mIHRoZSB0aW1l
IHlvdSdsbCBoYXZlIHRvIGRvIHdoYXQgdGhlCnNwaSBjb250cm9sbGVyIHN1cHBvcnRzLiBPbmx5
IGlmIGl0cyBmcmVlbHkgcHJvZ3JhbW1hYmxlLAp0aGVuIGFjY29yZGluZyB0byB5b3VyIGNvbW1l
bnQgeW91J2QgY2hvb3NlIHRoZSBidXN3aWR0aCBvZgp0aGUgZGF0YSBwaGFzZSB0byBiZSBvbiB0
aGUgc2FmZSBzaWRlLgoKQnR3LiB0aGlzIGlzIG5vdCB3aGF0IHNwaS1ub3IgaXMgZG9pbmcgcmln
aHQgbm93LgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
