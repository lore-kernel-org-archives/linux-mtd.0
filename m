Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F2C27C6E
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2024 14:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QuKMeDNDiVf7g0WVu8quBToqmj7VH3rWXQdvAkCMXs=; b=JaT8ugVYHP+aJP
	12wRlve/f/kvM1mTBnhlQKy+CwmM70i0I9Zop83UKJ8onkYsz6mZLpHUqYj90Y6ATwpjfuqqE7T/U
	yjTmzQyutZhTTdUR6yHo3pZ9LxF0E+EtaStxkOokYeJFQlTkK0IS48Xofv8A9RyhGuZO1Ctf5qsqA
	G+OXvbIb+YclfttHGJ/IrcGU8shZzZkLDIW5clzm+D2z3nUUsR7QeY3aPHq32yfdEgmNCbOQeyaVk
	Xr9dqA3he9TqVj8Ug9sOIxNwQ9h4mkjuEC3fqqt9KEllH22rUrbAe8H0QqFKWV2b6TJ4mhzEwh9Ca
	aG2LwaUv0XYy39j6fXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlcW-0000000Gytt-0SU2;
	Thu, 13 Jun 2024 14:40:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlcL-0000000Gymb-1ciq;
	Thu, 13 Jun 2024 14:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 944B561B66;
	Thu, 13 Jun 2024 14:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEF3C4AF4D;
	Thu, 13 Jun 2024 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289596;
	bh=E524rcct08hz6YUrxdb412RbfB6vmLjWaw3BPmGgUfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gjtuT8Xcz/yiy2MnxocB2sxoQHKjoPmW/zo//t0zNiZ+atwsq4a2odwxj4K7QUeQb
	 vdpYwo14D0+Ce4fUCqAcZvmhVEfH9PydKjeIUCEF7Q5GKw9OtQksS0ws/NFGcbHphy
	 PVyJy+/GPCawa9QHsAbfigFDO3HHS+svFzcF3jun5/nF9e5kGjF4W1Fl+iNXrUeyng
	 ceMx3dcAlRNqOfHpnC1/xPlXUVoLj1Lu0ID0iWuxhy2dhlYY3Upi7kfr8BJHLwKVkr
	 D/fNVBbQBi20BKi5EstWse2QH0jQ6TXFLl+bM5Tp5OEQHXr0ip9mq98L3Y3QqId/Xz
	 KoIFCWN5jlnJA==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Yisen Zhuang <yisen.zhuang@huawei.com>, 
 Salil Mehta <salil.mehta@huawei.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240603131230.136196-2-robh@kernel.org>
References: <20240603131230.136196-2-robh@kernel.org>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: syscon: Add more simple
 compatibles
Message-Id: <171828959006.2643902.8308227314531523435.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 15:39:50 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_073957_531857_85C5F3C5 
X-CRM114-Status: UNSURE (   5.71  )
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

T24gTW9uLCAwMyBKdW4gMjAyNCAwODoxMjoyNyAtMDUwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3Jv
dGU6Cj4gQWRkIGFub3RoZXIgYmF0Y2ggb2YgdmFyaW91cyAic2ltcGxlIiBzeXNjb24gY29tcGF0
aWJsZXMgd2hpY2ggd2VyZQo+IHVuZG9jdW1lbnRlZCBvciBzdGlsbCBkb2N1bWVudGVkIHdpdGgg
b2xkIHRleHQgYmluZGluZ3MuIFJlbW92ZSB0aGUgb2xkCj4gdGV4dCBiaW5kaW5nIGRvY3MgZm9y
IHRoZSBvbmVzIHdoaWNoIHdlcmUgZG9jdW1lbnRlZC4KPiAKPiAKCkFwcGxpZWQsIHRoYW5rcyEK
ClsxLzFdIGR0LWJpbmRpbmdzOiBtZmQ6IHN5c2NvbjogQWRkIG1vcmUgc2ltcGxlIGNvbXBhdGli
bGVzCiAgICAgIGNvbW1pdDogMjM0ZGIyNzc1YjllZmY3N2I4ZWMyMjE2Y2M4YTI4NmQxZGQyY2Q2
NQoKLS0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
