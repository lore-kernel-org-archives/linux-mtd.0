Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65216D44D7F
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLY4su3SpN1uxPwsRo3wZpWZF6tJkcuLLfL/Hu1M6sE=; b=ya8pPtV8AbiwjY
	2d3BNGCzDVcxgSlkMfrSm+sTpyFbu51/NCLfXKcSiiZ5uJozOBHYVc2Lgh+t4MXHYB0F4Ko7VFdFk
	zAtHfrSc/i5UoeFIMbjr9CWw/eZm3HYoQ9mlfc9YQaHmYJ9t+wE1Ii8k+C39rriWbKAD1y0TpveBX
	e76tz5Zz9aZWTcXIlS6J5zjFGjJWXS8R7nT/eExX8bQ7wUHi/5I7L7y3Asn4Cbok6JKVn5hZuFbg9
	XcrxusG5MvOkpnMeaCoDn2g9I0tEF0vffbKJ53OSmDdKRatPMtjlhCv1xdUiYGgIDbCDQR4choudN
	Tt0p5NmOkQYMNsGB+xqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hr5-00000003n2i-1Oas;
	Wed, 06 Nov 2024 15:21:59 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hpL-00000003mj8-0Z5z;
	Wed, 06 Nov 2024 15:20:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FA5040007;
	Wed,  6 Nov 2024 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730906404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JTfVzE7ndYuEakwvhQQZl5z6a3t9taLOo0NBJcHY7E=;
	b=p0boApFJ2BQaNnPJoTPYhTIQcDUiL0yp0cf/5Mfg/Lg8eAGgJWouOQxt08pXVChraVKmVE
	yMdCzM4IzDXjH5FTAx4kg6RUbZoHAvWU+RDShCaHkGUs4xFNeR+mP4+jciQnjwUqjdon7c
	zLtPuwOaFgI4bCNn/WV3M+58QoLgoZsIqo8lTMSxKiZtrnuM8r+7Au6TkxSCCS3Fzuz4pB
	dh1d7351wPofXtKRRCjbHFou6KiLG/LIrmMRZg4EIL8ckN2jm/UL1ef/7+aNDRACni7C/x
	dUtT1M+3EIo7zsh0CNeUsCni0XdTx3P2KBEV0ruyonUKRNRap6khEp7xPfzD8g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: SkyLake Huang (=?utf-8?B?6buD5ZWf5r6k?=) <SkyLake.Huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,  "acelan.kao@canonical.com"
 <acelan.kao@canonical.com>,  "chengminglin@mxic.com.tw"
 <chengminglin@mxic.com.tw>,  "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,  "daniel@makrotopia.org"
 <daniel@makrotopia.org>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  "richard@nod.at" <richard@nod.at>
Subject: Re: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
In-Reply-To: <e8c1ea093943141b431d8eb3ed3831c50601dfb1.camel@mediatek.com>
	("SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCkiJ3M=?= message of "Mon, 28 Oct
 2024 15:25:59
	+0000")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	<e8c1ea093943141b431d8eb3ed3831c50601dfb1.camel@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 06 Nov 2024 16:20:02 +0100
Message-ID: <87ses4jsnx.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_072011_344776_BD4B3196 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

CkhlbGxvLAoKT24gMjgvMTAvMjAyNCBhdCAxNToyNTo1OSBHTVQsIFNreUxha2UgSHVhbmcgKOm7
g+WVn+a+pCkgPFNreUxha2UuSHVhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToKCj4gT24gU3VuLCAy
MDI0LTEwLTIwIGF0IDIxOjI3ICswODAwLCBTa3kgSHVhbmcgd3JvdGU6Cj4+IEZyb206ICJTa3kg
SHVhbmciIDxza3lsYWtlLmh1YW5nQG1lZGlhdGVrLmNvbT4KPj4gCj4+IEhpLCB0aGlzIGlzIFFp
LVplIEh1YW5nKFNreSBIdWFuZykgZnJvbSBNZWRpYVRlay4gT24gb3VyIHJvdXRlcgo+PiBwbGF0
Zm9ybXMKPj4gY2hpcHMsIHdlIGhhdmUgdG8gcXVhbGl0eSBsb3RzIG9mIFNQSS1OQU5EIGRldmlj
ZXMgYW5kIGFyZSBlYWdlciBmb3IKPj4gYSBzdGFuZGFyZCBzbyB0aGF0IHdlIGRvbid0IG5lZWQg
dG8gbWFpbnRhaW4gdHJpdmlhbCBmbGFzaCBJRCB0YWJsZQo+PiBhbnltb3JlLiBJIGFsc28gbm90
aWNlZCBhIHRhbGsgaW4gMjAxOSBFbWJlZGRlZCBMaW51eCBDb25mZXJlbmNlLAo+PiBNZW1vcnkg
VGVjaG5vbG9neSBEZXZpY2VzOiB3aGF0J3MgbmV3LCB3aGljaCBtZW50aW9uZWQgIk9ORkkgZm9y
Cj4+IFNQSS1OQU5Ecz8gTWF5YmUsIG1heWJlIG5vdCIuCj4+IAo+PiBTbyBlYXJsaWVyIHRoaXMg
eWVhciwgSSBwcm9wb3NlZCBhIGJvbGQgaWRlYSwgQ0FTTiBwYWdlIChDb21tb24KPj4gQXR0cmli
dXRlcwo+PiBmb3IgU1BJLU5BTkQpLiBJIHdvcmtlZCB0b2dldGhlciB3aXRoIHRvcCAzIFNQSS1O
QU5EIG1hcmtldCBzaGFyZQo+PiBmbGFzaAo+PiB2ZW5kb3JzIGFuZCBvdGhlciB2ZW5kb3JzIHRv
IGludGVncmF0ZSBDQVNOIHBhZ2Ugb24gdGhlaXIgU1BJLU5BTkQKPj4gZGV2aWNlcwo+PiBpbmNs
dWRpbmcgYnV0IG5vdCBsaW1pdGVkIHRvOgo+PiAKPiBnZW50bGUgcGluZwoKSSBoYWQgYSBsb29r
IGF0IGl0LCBpdCBpcyBpbnRlcmVzdGluZyBidXQgSSBoYXZlIHNvbWUgcXVlc3Rpb25zIGFuZCBu
ZWVkCnRvIGNvbWUgYmFjayB0byBpdC4gVW5mb3J0dW5hdGVseSBJIHdhcyBhIGJpdCBidXN5IHRo
ZXNlIGRheXMuIFNvcnJ5IGZvcgp0aGUgZGVsYXkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
