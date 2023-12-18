Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B70FC35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 22:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zRpaYw7YQAYOTJRJabGX/cbpOk8TGUpsiCDmh0ZxcbY=; b=s9MLYekqR/64w2JUPgJownpptK
	KhR37ztTKzl7stI0coujSuFHCZ95VMof5twNQFXP06d//p7b8q5D0CBtfL3LE+H9BzONJQm0wRKla
	+Gfjh+zSamRyKF8LzzzmFIbYqfdsge/j5swUl4eEiqZd2rmMfgCnisPsozhqDsNWysfll1An5phif
	4a6bisM5KbN+aBJqstNvwETanpJOZaGhB1KKowPBDIz0ErLw0wMWTqURDH0m8dztRq/3+yoTQI/w4
	gV808LPXKayfPhyHJP+3PY2iFkR5dxrqZDVcIEY/PuxKCXUrebFdHUWwmpT9XBno7fu1XZl/emUHx
	9yj1PzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLou-00CCqC-01;
	Mon, 18 Dec 2023 22:10:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLop-00CClo-0t;
	Mon, 18 Dec 2023 22:10:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E1BDC6343B3B;
	Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9keEN92ZV6OF; Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6AB616343B3C;
	Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nR8uZpRh0SkQ; Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2459D6343B3B;
	Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Date: Mon, 18 Dec 2023 23:10:20 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	pratyush <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	sbinding@opensource.cirrus.com, Lee Jones <lee@kernel.org>, 
	james schulman <james.schulman@cirrus.com>, 
	david rhodes <david.rhodes@cirrus.com>, rf@opensource.cirrus.com, 
	Jaroslav Kysela <perex@perex.cz>, tiwai@suse.com, 
	linux-spi <linux-spi@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Michael Walle <michael@walle.cc>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	michal simek <michal.simek@amd.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	alsa-devel <alsa-devel@alsa-project.org>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	git@amd.com, amitrkcian2002@gmail.com
Message-ID: <1953466568.133535.1702937420979.JavaMail.zimbra@nod.at>
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v11 00/10] spi: Add support for stacked/parallel
 memories
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Add support for stacked/parallel memories
Thread-Index: Gp+EE7t5zvexUhLdnkyaadGyCIq7oQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_141035_484626_3E0B0DC1 
X-CRM114-Status: UNSURE (   4.90  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkFtaXQgS3VtYXIgTWFoYXBh
dHJhIiA8YW1pdC5rdW1hci1tYWhhcGF0cmFAYW1kLmNvbT4KCj4gVGhpcyBwYXRjaCBzZXJpZXMg
dXBkYXRlZCB0aGUgc3BpLW5vciwgc3BpIGNvcmUgYW5kIHRoZSBBTUQtWGlsaW54IEdRU1BJCj4g
ZHJpdmVyIHRvIGFkZCBzdGFja2VkIGFuZCBwYXJhbGxlbCBtZW1vcmllcyBzdXBwb3J0LgoKSSB3
aXNoIHRoZSBzZXJpZXMgaGFkIGEgcmVhbCBjb3ZlciBsZXR0ZXIgd2hpY2ggZXhwbGFpbnMgdGhl
IGJpZyBwaWN0dXJlCmluIG1vcmUgZGV0YWlsLgoKV2hhdCBJIGRpZG4ndCByZWFsbHkgZ2V0IHNv
IGZhciwgaXMgaXQgcmVhbGx5IG5lY2Vzc2FyeSB0byBzdXBwb3J0IG11bHRpcGxlCmNoaXAgc2Vs
ZWN0cyB3aXRoaW4gYSBzaW5nbGUgbXRkPwpZb3UgY2hhbmdlcyBpbnRyb2R1Y2UgaGFyZCB0byBt
YWludGFpbiBjaGFuZ2VzIGludG8gdGhlIHNwaS1ub3IvbXRkIGNvcmUgY29kZQp3aGljaCBhbGVy
dCBtZS4KV2h5IGNhbid0IHdlIGhhdmUgb25lIG10ZCBmb3IgZWFjaCBjcyBhbmQsIGlmIG5lZWRl
ZCwgY29tYmluZSB0aGVtIGxhdGVyPwpXZSBoYXZlIGRyaXZlcnMgc3VjaCBhcyBtdGRjb25jYXQg
Zm9yIHJlYXNvbnMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
