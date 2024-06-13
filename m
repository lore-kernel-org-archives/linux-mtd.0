Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB06C27C78
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2024 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXCS6hcvqwHJYgkR7ruyswC0Zaf9naf8PyOkYoH74do=; b=0Bhsb3saXBvbxs
	AM3WoCSyJNq4BbEjc0/NRoRX4kVqhN92T31nxnRZAbQ/m+uoSn1tvZqGDcgg7c0jwZEaf8Awwkrt6
	awbVlsmfPuuwMT8fEhmc8thys7raKF23Jws+ti5wq0NlYmlWRH7N0LiTyYGDFgnKZFO+05FDouVt2
	/ngsNi0mT8OyZbnIcC/hiYspHLcJ8ywy+CVYhJhmDTkj3ZZn4PBrrVFsxSFZk90I9VPePomT+JRKY
	MBMsELMmQr0LWYQetUy+A25RYbBJsa0ZyMGyt6wnhp3idSJNjjdWF2xRnbZ5EA+Sbt5RswKB91V3q
	2rd5I/MHYe5byIPTequA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlcM-0000000Gynf-3Tn3;
	Thu, 13 Jun 2024 14:39:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlcI-0000000Gyl9-2qZy;
	Thu, 13 Jun 2024 14:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88FDBCE2689;
	Thu, 13 Jun 2024 14:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30526C2BBFC;
	Thu, 13 Jun 2024 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289589;
	bh=/XgdqH12I7+QANuYrNXhbfWjpqVJ36pUPomHgM8NI/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mtlF/p6jeOnYKoKhbUMaQENnBa/4WKzKcjcJQudfMoBUXV889PwL7eBvFiSai4v0W
	 51LaucZ5fawWqt2PdlHyOdvr/joRZUhdso8+MbKUu+Vc8MNnVwJ3FGTxDgxzEF3KL7
	 KGrlc8zPM1dXF2ZS3wKm9oVkHv428TR9CADht92YvVEyYV5wwVuttqvzoRG3x/ATp5
	 4YNfNNAZ8q4RfzEk7EnVPR966xsKyBU4WBY+RUEkE11qJAoEewYlIPUyNyY8XasFLp
	 gwh6OHCJgAMCr/Lnb73Cg7H6cEnqZmjCajZX8Vd/+tBmffSZAZayPQZlUTkL/ks9xp
	 G+olz39SMKj4Q==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
References: <20240510123018.3902184-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: syscon: Add more simple
 compatibles
Message-Id: <171828958394.2643902.14840727452318999117.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 15:39:43 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_073954_926907_21BF8F67 
X-CRM114-Status: UNSURE (   5.81  )
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

T24gRnJpLCAxMCBNYXkgMjAyNCAwNzozMDoxNCAtMDUwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3Jv
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
