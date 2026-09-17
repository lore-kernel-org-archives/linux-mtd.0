Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC6BC982D7
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ur6iAVNXSJzRjql2AqFz3PrxQyWR6kOXOiFCP/AeSUQ=; b=NQbnnsSuVxMQ8T
	YRd5lGikdOR6l0EsQcT9bWnIDd8b077yIGOsYx3PYpYPnC219rsbybq/nIiG2yHaQ2UZfNUOIGc74
	H96a4uy0lENbR2sd8X0h7VxKrLno+9QyV8nyL4JtgxmUkr9nTtQwDj5dW/KPcVrFO69Mj9OpqeeLQ
	bMVD32Z7uyDclVX1pPhnDMQiwA0E0NLaakitX/SDnykxe5VCJzqAKpwrjGnlj+RZ1k1awsAp+aK0m
	YQObHpV7XvP5K4aQfHh7/IFJclBi09DTC5iXubQXkVBi8z/fdeSOZ7RFoIBsAnX4o3hld4UHzrbwa
	l5MCd6Aaufh8t3IV9pPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DrM-0000000Belq-2W0U;
	Thu, 17 Sep 2026 15:17:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DrK-0000000BelR-2QSx
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 15:17:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 431B443F3D
	for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2026 15:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF171F00893
	for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2026 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789658230;
	bh=yokcjFoYaQjb2AXJXwiS2CgA9icNw4hd0m3OmDjYLh0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=baYHiQhLKHIXv5JcbsYM8h8jWAIdy60s6NhCh0ZGU54W95BOiAuC94Ol2AcpHo47g
	 xOJkjhXStRdOshTWhG385se+mN0mwxSalEgzP9JG2PQIOLJ/oHEIVw0zHQeJ6cCyxv
	 qfvHypAZ4Aa+PBTDs1xGLwk8gxllOPs9TBclUTaLcaptPXVE/nH6o6dNw9fmKr/Ga+
	 euX0r0XKcn50B8jtWh1/A5rkcHzzpSCbjKD97mWUlLgkoyhoofyCpgqfsFLMmV7xqx
	 ARc5Jnmu7agtqFNmn3zlh9R+1V4XybdteMzm34GCd9fCbp5oeKdHFvfY4O6Spsy5NH
	 56pQ+Rtftr60g==
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so1567957a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2026 08:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSxYvYFblvB5+BcnzZm9PN7kFH1z0Ih7pijpfbpc1XVYObEc5EnOOY7rrD6b8mQ4J1ogPhAJJvVFU=@lists.infradead.org
X-Gm-Message-State: AFuF++ksPPoiVNmFBEJ+SgSLPDn+lbTHvilG1h8X1a3vzInPUkJTlf9f
	x2xCPDvSYscJtHH2cIDsS/vFZt32BCFfp2jgprXPQyC1pUXD7DnoxEMsrFS06AqlSRCOAisndVs
	L7wz+I3ZD8v50IznNlxS9mEAl/GCMmg==
X-Received: by 2002:a05:6402:460c:b0:6a6:8dd:c76b with SMTP id
 4fb4d7f45d1cf-6aa22247992mr11552271a12.1.1789658228391; Thu, 17 Sep 2026
 08:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260917144134.459819-1-matyasdaniel006@gmail.com>
In-Reply-To: <20260917144134.459819-1-matyasdaniel006@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 17 Sep 2026 10:16:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLyPK2rJVAyzCtGtrBSTwOKRZ_EAmE1Xd++9DFaxrrmDw@mail.gmail.com>
X-Gm-Features: AcwNN1WrkKsI-hJClnXnbb72poP7rLqVHTc23ccK3T-HSnvYyjsVzuH4L2tWH2Y
Message-ID: <CAL_JsqLyPK2rJVAyzCtGtrBSTwOKRZ_EAmE1Xd++9DFaxrrmDw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Expand flow lists to block lists
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Dharma Balasubiramani <dharma.b@microchip.com>, 
	Jeff LaBundy <jeff@labundy.com>, Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Atish Patra <atishp@rivosinc.com>, 
	Shawn Guo <shawn.guo@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Okan Sahin <Okan.Sahin@analog.com>, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Ricard Wanderlof <ricardw@axis.com>, patches@opensource.cirrus.com, 
	Lukas Wunner <lukas@wunner.de>, Eugen Hristev <ehristev@kernel.org>, mfd@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgOTo0MeKAr0FNIERhbmllbCBNYXR5YXMgPG1hdHlhc2Rh
bmllbDAwNkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUnVubmluZyBkdF9iaW5kaW5nc19jaGVjayBy
ZXR1cm5lZDoKPiBbZXJyb3JdIHN0cmluZyB2YWx1ZSBpcyByZWR1bmRhbnRseSBxdW90ZWQgd2l0
aCBhbnkgcXVvdGVzIChxdW90ZWQtc3RyaW5ncykKPgoKVGhhdCBmYWxzZSBwb3NpdGl2ZSBpcyBm
aXhlZCBpbiBuZXdlciB2ZXJzaW9ucyBvZiB5YW1sbGludCBzaW5jZSBhdApsZWFzdCBhIHllYXIg
YW5kIGEgaGFsZiBhZ28uIFRoZXJlJ3MgYWxzbyBzb21lIG90aGVyIHF1b3RpbmcgY2hlY2tzCkkn
ZCBsaWtlIHRvIHR1cm4gb24sIGJ1dCB0aGF0IGJ1bXBzIHRoZSBtaW5pbXVtIHZlcnNpb24gc2lu
Y2UgdW5rbm93bgpjaGVja3MgYXJlIGFuIGVycm9yIGluIHlhbWxsaW50LgoKPiBUaGUgZmlsZXMg
dXNlZCBxdW90YXRpb24gbWFya3MgaW4gZmxvdyBsaXN0cyBiZWNhdXNlIHRoZSBzdHJpbmdzIGhh
ZAo+IGNvbW1hcyBhbmQgdGhlc2UgY29tbWFzIHdlcmUgaW50ZXJwcmV0ZWQgYXMgc2VwYXJhdG9y
cy4gQ29udmVydCBmbG93Cj4gc3R5bGUgbGlzdHMgdG8gYmxvY2sgc3R5bGUgbGlzdHMsIHNvIHRo
YXQgdGhlcmUgaXMgbm8gcHJvYmxlbXMgd2l0aCB0aGUKPiBjb21tYXMuCgpJZiB3ZSB3YW50ZWQg
dG8gZml4IGxpa2UgdGhpcywgd2Ugc2hvdWxkIHByb2JhYmx5IGp1c3QgcmVxdWlyZSBibG9jawpz
dHlsZSBldmVyeXdoZXJlLCBidXQgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgZG8gdGhhdC4KClJv
YgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
