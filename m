Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4523C25B75
	for <linux-mtd@archiver.kernel.org>; Fri, 31 May 2024 13:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9f8UabHpJPQqYi8MnsK9AQiA8hFmagRCLT1ObrlZIs=; b=MmAxA8muoD/36R
	6fOLeoTE2dPf9bl8py8iO8mHQgUK+5XbBJPGCdtgpeXFN51ZuWrl6koKHT297klXMY2XDVNMDl8tp
	yR76TG4hW2LS5ISZtchF843RSY2OADJ1SA+2ttfdvr0oimwh1MjNhjJytxLWOMiMjFBzqW/HMwB0V
	zQhrisBVOEpqMk4cJ73nIYd7zQamCqk579QSXn9MjUj1Z09cpFuhnQbxvVX3pO4O3ahjH+u8Wt6EE
	0SAKclvMrAbaf9Na2i22ENKdpL1EN/ML69268dDOSEgSn/7I83RUOjLkfAXO3XanTXRUG1FdYqwk4
	tMAD8IV7YCWre25it5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2Zs-0000000AONa-2uuP;
	Fri, 31 May 2024 13:45:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2Zm-0000000AOMC-2x6T;
	Fri, 31 May 2024 13:45:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE0AD62C21;
	Fri, 31 May 2024 13:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A572BC116B1;
	Fri, 31 May 2024 13:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717163145;
	bh=9bHZx7MoCQbM3wc0+T6G78EbGSWMbO1srcZcLpQFe1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdD3x3baOEE+lLJPD4j0hSwr8gdBDEPG2WDozfakC6eUwn73jRAQv66g4pSumaXxE
	 oWV1EMVpxXj011/a3sEVJL+5xVahBkX5OWLXMQfi4JBOBAqhjVWif43KBF5rQo84Ke
	 uhCtOL/HUYFN3ePGNKE9X4RKq9xPsfnFi6cGcU9m+u50koP1DtWTRls39xB9/UII0I
	 fdSTfPrd5DzgUFJktrEFJYXK3Y9SVW5d9fYRPkpx3cqoPTnj6ge+G4hDTokRCoL6pY
	 0VMFpdkJwbqnlv3qh8BqTWi5j5w+l6SDBYuUg2TaczKCRjlnFnQfVECKEzfKD8GFzm
	 itjSp5c4ci0+w==
Date: Fri, 31 May 2024 14:45:36 +0100
From: Lee Jones <lee@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240531134536.GK1005600@google.com>
References: <20240510123018.3902184-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_064546_892190_43942355 
X-CRM114-Status: GOOD (  10.79  )
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

T24gRnJpLCAxMCBNYXkgMjAyNCwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cgo+IEFkZCBhbm90
aGVyIGJhdGNoIG9mIHZhcmlvdXMgInNpbXBsZSIgc3lzY29uIGNvbXBhdGlibGVzIHdoaWNoIHdl
cmUKPiB1bmRvY3VtZW50ZWQgb3Igc3RpbGwgZG9jdW1lbnRlZCB3aXRoIG9sZCB0ZXh0IGJpbmRp
bmdzLiBSZW1vdmUgdGhlIG9sZAo+IHRleHQgYmluZGluZyBkb2NzIGZvciB0aGUgb25lcyB3aGlj
aCB3ZXJlIGRvY3VtZW50ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgKEFybSkg
PHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiBUaGlzIGJhdGNoIGlzIG1vc3RseSBmcm9tIGFybTMy
IHBsYXRmb3Jtcy4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2FybS9hbWxvZ2ljL2FuYWxvZy10b3Au
dHh0ICAgICAgIHwgMjAgLS0tLS0tLS0tLS0tLQo+ICAuLi4vYmluZGluZ3MvYXJtL2FtbG9naWMv
YXNzaXN0LnR4dCAgICAgICAgICAgfCAxNyAtLS0tLS0tLS0tLQo+ICAuLi4vYmluZGluZ3MvYXJt
L2FtbG9naWMvYm9vdHJvbS50eHQgICAgICAgICAgfCAxNyAtLS0tLS0tLS0tLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy9wbXUudHh0ICAgfCAxOCAtLS0tLS0tLS0tLS0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2F0bWVsLXN5c3JlZ3MudHh0IHwgMjkgLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXhpcy50eHQg
ICAgICAgICAgfCAxNiAtLS0tLS0tLS0tCj4gIC4uLi9hcm0vY3B1LWVuYWJsZS1tZXRob2QvYWws
YWxwaW5lLXNtcCAgICAgICB8IDEwIC0tLS0tLS0KPiAgLi4uL2FybS9mcmVlc2NhbGUvZnNsLHZm
NjEwLW1zY20tY3B1Y2ZnLnR4dCAgIHwgMTQgLS0tLS0tLS0tCj4gIC4uLi9iaW5kaW5ncy9hcm0v
bWFydmVsbC9tYXJ2ZWxsLGRvdmUudHh0ICAgICB8IDE1IC0tLS0tLS0tLS0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3NwZWFyLW1pc2MudHh0ICAgIHwgIDkgLS0tLS0tCj4gIC4uLi9i
aW5kaW5ncy9jbG9jay90aS1rZXlzdG9uZS1wbGxjdHJsLnR4dCAgICB8IDIwIC0tLS0tLS0tLS0t
LS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1sICAgICAgIHwgMjkg
KysrKysrKysrKysrKysrKysrKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9taXBzL21zY2Mu
dHh0ICAgICAgICAgfCAxNyAtLS0tLS0tLS0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvYXRtZWwtbmFuZC50eHQgICAgfCAgOSAtLS0tLS0KPiAgLi4uL2JpbmRpbmdzL25ldC9oaXNp
bGljb24taGlwMDQtbmV0LnR4dCAgICAgIHwgMTAgLS0tLS0tLQo+ICAxNSBmaWxlcyBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspLCAyMjEgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMvYW5hbG9nLXRv
cC50eHQKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYW1sb2dpYy9hc3Npc3QudHh0Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMvYm9vdHJvbS50eHQKPiAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1s
b2dpYy9wbXUudHh0Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsdmY2MTAtbXNjbS1jcHVjZmcudHh0Cj4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Nw
ZWFyLW1pc2MudHh0Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svdGkta2V5c3RvbmUtcGxsY3RybC50eHQKCk5vIGxvbmdlciBhcHBs
aWVzLiAgUGxlYXNlIHJlYmFzZSBhbmQgSSdsbCBwcm9tcHRseSBob292ZXIgdGhpcyB1cC4KCi0t
IApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
