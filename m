Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCE6C54791
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Mar 2024 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U0jCPyxCOy66Q5XbOTMidS0qR7+UCYAWT/om6B6+pqY=; b=qLEb2FalJ0rkC+SqbX/NlRsw2B
	v0bNn1hN/6fZ6MqodPrFoL2EgruIHvKls5D5aXqjFs9Syt83sIw8oF4Qu0HA7PlTRebzq0urxHA1d
	xpQdJ0Uo8T0CUW50W0M9w5Jymyg4wfMWq20A/zbEY9H5mt2zQoUoQHItcQMP0n57OXaS/2wqK+RZ5
	E8+En8T423nspZ08PKqBFBY4+uNUjCcDb7GFpxe0EZ+XteJDAA+7GityhnaAZUcoakNiWDbPwuPt1
	mrj8ax6A+jT+d3GM90ZZHOh5pwNNi6HuoAu5YKEsEK1Ya3/3uvNK4xqEJmMqg8Qcgk9mkqfqw4AEw
	AqcHSPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjQYM-0000000GeWo-3Ji2;
	Sun, 10 Mar 2024 21:17:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjQYH-0000000GeS0-0gRx
	for linux-mtd@lists.infradead.org;
	Sun, 10 Mar 2024 21:17:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D7A79644CE9B;
	Sun, 10 Mar 2024 22:17:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id QPqD6-Gs5_lr; Sun, 10 Mar 2024 22:17:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4B97C644CE9C;
	Sun, 10 Mar 2024 22:17:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hPYilfTa8vD1; Sun, 10 Mar 2024 22:17:18 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0F7A0644CE64;
	Sun, 10 Mar 2024 22:17:18 +0100 (CET)
Date: Sun, 10 Mar 2024 22:17:17 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1754825522.38834.1710105437883.JavaMail.zimbra@nod.at>
In-Reply-To: <ZdvV1KABu_UCSL7B@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org> <82ceb13954f7e701bf47c112333e7b15a57fc360.1702952891.git.daniel@makrotopia.org> <20240219120156.383a1427@xps-13> <1209094181.98490.1708899174329.JavaMail.zimbra@nod.at> <ZdvV1KABu_UCSL7B@makrotopia.org>
Subject: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: provide NVMEM layer over UBI volumes
Thread-Index: 16y/pO9tIckbepFtGo93wkKFo34z8w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240310_141749_367100_97D3572E 
X-CRM114-Status: GOOD (  10.83  )
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

RGFuaWVsLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBH
b2xsZSIgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPj4gRmluYWxseSghKSwgSSBoYWQgZW5vdWdo
IHRpbWUgdG8gbG9vay4KPj4gVGhhbmtzIGZvciBhZGRyZXNzaW5nIGFsbCBteSBjb21tZW50cyBm
b3JtIHRoZSBwcmV2aW91cyBzZXJpZXMuCj4+IFBhdGNoZXMgYXBwbGllZC4KPiAKPiBJdCdzIGFu
IGVub3VybW91cyBjb2ljaWRlbnQgdGhhdCB5b3UgYXJlIHdyaXRpbmcganVzdCBub3cgdGhhdCBJ
IGZvdW5kCj4gYSBzaXplb2YoaW50KS1yZWxhdGVkIHByb2JsZW0gd2hpY2ggdHJpZ2dlcnMgYSBj
b21waWxlciB3YXJuaW5nIHdoZW4KPiBidWlsZGluZyB0aGUgVUJJIE5WTUVNIHByb3ZpZGVyIG9u
IDMyLWJpdCBwbGF0Zm9ybXMuIEkgd2FzIGp1c3QgYWJvdXQKPiB0byBwcmVwYXJlIGFuIHVwZGF0
ZWQgc2VyaWVzLiBMaXRlcmFsbHkgaW4gdGhpcyBtaW51dGUuCj4gU2hvdWxkIEkgc3RpbGwgc2Vu
ZCB0aGUgd2hvbGUgdXBkYXRlcyBzZXJpZXMgb3Igb25seSB0aGUgZmluYWwgcGF0Y2gKPiAoYXMg
dGhlIG5lY2Vzc2FyeSBjaGFuZ2UgaXMgdGhlcmUpIG9yIGEgZm9sbG93LXVwIHBhdGNoIGZpeGlu
ZyB0aGUKPiBvcmlnaW5hbCBwYXRjaD8KCkkgaGF2ZSBqdXN0IG1lcmdlZCB5b3VyIGZpeHVwIHBh
dGNoLiBTbyBhbGwgZ29vZC4KCj4+IAo+PiBJIGhhdmUgb25seSBvbmUgdGlueSByZXF1ZXN0LCBj
YW4geW91IHNoYXJlIHRoZSBsb2NrZGVwIHNwYWx0Cj4+IHlvdSBlbmNvdW50ZXJlZCBpbiB1Ymlf
bm90aWZ5X2FkZCgpIHJlZ2FyZGluZyBtdGRfdGFibGVfbXV0ZXgKPj4gYW5kIHViaV9kZXZpY2Vz
X211dGV4PyBUaGUgc29sdXRpb25zIGxvb2tzIG9rYXkgdG8gbWUsIGJ1dAo+PiBpZiB5b3UgaGF2
ZSBtb3JlIGRldGFpbHMgdGhhdCB3b3VsZCBiZSBncmVhdC4KPiAKPiBJIHdpbGwgc2V0dXAgYSB0
ZXN0IGJ1aWxkIHRvIHJlcHJvZHVjZSB0aGUgb3JpZ2luYWwgd2FybmluZyBhbmQKPiBsZXQgeW91
IGtub3cgc2hvcnRseS4KCkFueSBuZXdzIG9uIHRoYXQ/CgpCVFc6IElzIHRoZXJlIGEgbmljZSB3
YXkgdG8gdGVzdCB0aGlzIHdpdGggbmFuZHNpbSBpbiBxZW11PwpJJ2QgbG92ZSBiZWluZyBhYmxl
IHRvIHRlc3QgYWxsIHViaSBhdHRhY2ggY29kZSBwYXRocyBvbiBteSB0ZXN0IHNldHVwLgoKVGhh
bmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
