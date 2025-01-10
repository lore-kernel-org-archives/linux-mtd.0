Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B69EE77188
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me8bVL7W3TLJI9JggNhQj1BF2EnD8iT2oWWqsxUAf28=; b=F/t+bLZjIeTVG5
	yzBeI0kJb1hpLKdfrVz19hXJ8HTe49LobnsqFIzso70+kvAlYV3B2q6ocQqSro7G+BwuNyRdnsy8S
	oBLm+uwu/xmh8fnWayVpjt52i7yMQPV36skn97xNfm/o9CwXlq2uZOgC3+hEqXKgIDLXXNAUOmZ6Z
	TneqS9af1enMWBJVZkpfEoFhoTgKp4xrGnxpg8C1fV92ceNmsv9Ts7GNIuTkO8y8PziNn63cNJoaB
	lujQlRv72tJuEC5RnfOp2KHaiQVva3zA81IC5hu8cnao5wGu/pkMgCwGHiInWgI2Pn8S3Kwewnqtu
	UlAKWw13OXcQr72aDimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGAS-0000000Ff7F-0yS1;
	Fri, 10 Jan 2025 14:39:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWG9D-0000000FeuJ-1Npt;
	Fri, 10 Jan 2025 14:38:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 980E5C0007;
	Fri, 10 Jan 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736519880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AqHOTtKrS2nK6owEMQCN+3bics3pst072/Bpdc2sk1Q=;
	b=m/PU3jSVOUgUfNeqSsjZfGTt+SAIExnswQ4nJ1ydWLAlAqDyJgvFnyk8HKoBD9BUxG16hy
	Kxy9n0Cwf1Hc7YihZi5k5w9nwTsGIYKn4FnnKxNF0C/9/xC2AA8aQ8o73ouUrLBlKrfiyx
	AyjzfEzOaOEu/KSVKY/wAa4K7WUjTk5cuP80r3I36oJZfq/WPge2eyw/Q2gARWb7KL+upy
	Ls5pf4WYuuJ+rGBVEyY/yx0BMp8H7ueg0TrVzxvdSUOcEZM3LoiSsfBxWSFXKt701XzzPJ
	/SMNBlfNJ7hqRZFrr0ROsFwE2/gIY4flK+fkxxJW4GO12ujEoN3r4OMJKmWnZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,  Serge Semin
 <fancer.lancer@gmail.com>,  Han Xu <han.xu@nxp.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung <schung@nuvoton.com>,
  Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Raju Rangoju <Raju.Rangoju@amd.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <stlin2@winbond.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,
  linux-riscv@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  linux-rockchip@lists.infradead.org,
  linux-mtd@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
  openbmc@lists.ozlabs.org,  linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 20/27] spi: spi-mem: Estimate the time taken by
 operations
In-Reply-To: <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk> (Mark
	Brown's message of "Fri, 10 Jan 2025 12:42:47 +0000")
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
	<20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
	<ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 15:37:52 +0100
Message-ID: <87tta6ag5b.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_063803_779417_D6971DAF 
X-CRM114-Status: GOOD (  10.08  )
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

SGkgTWFyaywKCk9uIDEwLzAxLzIwMjUgYXQgMTI6NDI6NDcgR01ULCBNYXJrIEJyb3duIDxicm9v
bmllQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUdWUsIERlYyAyNCwgMjAyNCBhdCAwNjowNjow
NVBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBJbiB0aGUgU1BJLU5BTkQgbGF5ZXIs
IHdlIGN1cnJlbnRseSBtYWtlIGxpc3Qgb2Ygb3BlcmF0aW9uIHZhcmlhbnRzIGZyb20KPj4gdGhl
IGZhc3Rlc3Qgb25lIHRvIHRoZSBzbG93ZXN0IGFuZCB0aGVyZSBpcyBhIGJpdCBvZiBsb2dpYyBp
biB0aGUgY29yZQo+PiB0byBnbyBvdmVyIHRoZW0gYW5kIHBpY2sgdGhlIGZpcnN0IG9uZSB0aGF0
IGlzIHN1cHBvcnRlZCBieSB0aGUKPj4gY29udHJvbGxlciwgaWUuIHRoZSBmYXN0ZXN0IG9uZSBh
bW9uZyB0aGUgc3VwcG9ydGVkIG9wcy4KPgo+IFRoaXMgYnJlYWtzIHRoZSBidWlsZDoKPgo+IC9i
dWlsZC9zdGFnZS9saW51eC9kcml2ZXJzL3NwaS9zcGktbWVtLmM6NTgwOjU6IGVycm9yOiBjb25m
bGljdGluZyB0eXBlcyBmb3Ig4oCYc3BpX21lbV9jYWxjX29wX2R1cmF0aW9u4oCZOyBoYXZlIOKA
mHU2NChzdHJ1Y3Qgc3BpX21lbV9vcCAqKeKAmSB7YWthIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBp
bnQoc3RydWN0IHNwaV9tZW1fb3AgKinigJl9Cj4gICA1ODAgfCB1NjQgc3BpX21lbV9jYWxjX29w
X2R1cmF0aW9uKHN0cnVjdCBzcGlfbWVtX29wICpvcCkKCkNyYXAsIHRoYXQncyBhIGZpeHVwIHRo
YXQgbGFuZGVkIGluIHRoZSB3cm9uZyBjb21taXQgKG10ZDogc3BpbmFuZDoKRW5oYW5jZSB0aGUg
bG9naWMgd2hlbiBwaWNraW5nIGEgdmFyaWFudCkuIEknbGwgZml4IGl0LgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
