Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF578C25B75
	for <linux-mtd@archiver.kernel.org>; Fri, 31 May 2024 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syVr8PftpGfnTL4wBVoheFuJFdNxh034tWyY0+1LDII=; b=ygGQJyYioQcAbP
	LwtBD6Ii9yeyytnuquCayoZFVy8Yy+dNz9r4i0ZOv96Aop0lrAT9nPot0oFHCOOkmR5gmy/sWaFWM
	akT4ITG381Fh0PVp7QIuMhjYAu4J2fdGdWwpY5r0aFBvcFMdifqQ5nIFl4sx/j9vhv7250Ljc5uR6
	+XiHDenApwjm8V+jwZColUe4o2S2OYCQ0YFWEgPT0J8qfYuSmH2xe+2r24u2lFKHEDTT2Up+41H/z
	So1LK2IIxqNZRr0ZZP2MSAzwwac5A3/r5d3pI2OgMKDCTwEIjha0r5d8p55gERELjCmyAe+1UmYCs
	RwfoK2P4czyqFVaKnewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4nD-0000000Am0T-0g4o;
	Fri, 31 May 2024 16:07:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4n8-0000000AlyF-0DtG;
	Fri, 31 May 2024 16:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50BA062D2D;
	Fri, 31 May 2024 16:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD16C2BD10;
	Fri, 31 May 2024 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171661;
	bh=mE0OUhJiQMMzHxfgx0IOqHje5tQRxYiF+OB7kIk7BQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmIiCxm0t+WW0oDLFbzpb97vsloCQOGygqInun3z/KqgTGXTl0X8sb6iu/GPspD+F
	 NPEMmQfMP5NPkWPOQfPn+ZR01fhntn9dZ4xZJyreUlb5Jt3XqhrOCAgx2X6+3Qar+1
	 sJl0/nS6GLx6bYMl5Q3Nq8TsaS4qvADsYam0QoK25lv4+38tki18s91Ryxs5eCPMLt
	 08S6l5f4C1YPnmOk20oswNPJxj3VLzNXpY8FiHClDIxWUsDgs51ThFWVSM4JmnzSow
	 5xhTgwGIfx6iTjLHyFhjj5oJWbEIomg04B1e5uyTuV9M8mBApgf8D8PsEm0x8SadNf
	 bNMxEUZUv5Mxg==
Date: Fri, 31 May 2024 17:07:32 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
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
Message-ID: <20240531160732.GT1005600@google.com>
References: <20240510123018.3902184-1-robh@kernel.org>
 <20240531134536.GK1005600@google.com>
 <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_090742_261937_4F1171B5 
X-CRM114-Status: GOOD (  16.07  )
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

T24gRnJpLCAzMSBNYXkgMjAyNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IE9uIEZyaSwgTWF5IDMx
LCAyMDI0IGF0IDg6NDXigK9BTSBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPiB3cm90ZToKPiA+
Cj4gPiBPbiBGcmksIDEwIE1heSAyMDI0LCBSb2IgSGVycmluZyAoQXJtKSB3cm90ZToKPiA+Cj4g
PiA+IEFkZCBhbm90aGVyIGJhdGNoIG9mIHZhcmlvdXMgInNpbXBsZSIgc3lzY29uIGNvbXBhdGli
bGVzIHdoaWNoIHdlcmUKPiA+ID4gdW5kb2N1bWVudGVkIG9yIHN0aWxsIGRvY3VtZW50ZWQgd2l0
aCBvbGQgdGV4dCBiaW5kaW5ncy4gUmVtb3ZlIHRoZSBvbGQKPiA+ID4gdGV4dCBiaW5kaW5nIGRv
Y3MgZm9yIHRoZSBvbmVzIHdoaWNoIHdlcmUgZG9jdW1lbnRlZC4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiA+ID4gLS0tCj4g
PiA+IFRoaXMgYmF0Y2ggaXMgbW9zdGx5IGZyb20gYXJtMzIgcGxhdGZvcm1zLgo+ID4gPiAtLS0K
PiA+ID4gIC4uLi9iaW5kaW5ncy9hcm0vYW1sb2dpYy9hbmFsb2ctdG9wLnR4dCAgICAgICB8IDIw
IC0tLS0tLS0tLS0tLS0KPiA+ID4gIC4uLi9iaW5kaW5ncy9hcm0vYW1sb2dpYy9hc3Npc3QudHh0
ICAgICAgICAgICB8IDE3IC0tLS0tLS0tLS0tCj4gPiA+ICAuLi4vYmluZGluZ3MvYXJtL2FtbG9n
aWMvYm9vdHJvbS50eHQgICAgICAgICAgfCAxNyAtLS0tLS0tLS0tLQo+ID4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMvcG11LnR4dCAgIHwgMTggLS0tLS0tLS0tLS0tCj4g
PiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXRtZWwtc3lzcmVncy50eHQgfCAyOSAt
LS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXhp
cy50eHQgICAgICAgICAgfCAxNiAtLS0tLS0tLS0tCj4gPiA+ICAuLi4vYXJtL2NwdS1lbmFibGUt
bWV0aG9kL2FsLGFscGluZS1zbXAgICAgICAgfCAxMCAtLS0tLS0tCj4gPiA+ICAuLi4vYXJtL2Zy
ZWVzY2FsZS9mc2wsdmY2MTAtbXNjbS1jcHVjZmcudHh0ICAgfCAxNCAtLS0tLS0tLS0KPiA+ID4g
IC4uLi9iaW5kaW5ncy9hcm0vbWFydmVsbC9tYXJ2ZWxsLGRvdmUudHh0ICAgICB8IDE1IC0tLS0t
LS0tLS0KPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zcGVhci1taXNjLnR4dCAg
ICB8ICA5IC0tLS0tLQo+ID4gPiAgLi4uL2JpbmRpbmdzL2Nsb2NrL3RpLWtleXN0b25lLXBsbGN0
cmwudHh0ICAgIHwgMjAgLS0tLS0tLS0tLS0tLQo+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3N5c2Nvbi55YW1sICAgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKwo+ID4gPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbWlwcy9tc2NjLnR4dCAgICAgICAgIHwgMTcgLS0tLS0t
LS0tLS0KPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hdG1lbC1uYW5kLnR4dCAg
ICB8ICA5IC0tLS0tLQo+ID4gPiAgLi4uL2JpbmRpbmdzL25ldC9oaXNpbGljb24taGlwMDQtbmV0
LnR4dCAgICAgIHwgMTAgLS0tLS0tLQo+ID4gPiAgMTUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0
aW9ucygrKSwgMjIxIGRlbGV0aW9ucygtKQo+ID4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy9hbmFsb2ctdG9wLnR4dAo+
ID4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vYW1sb2dpYy9hc3Npc3QudHh0Cj4gPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljL2Jvb3Ryb20udHh0Cj4gPiA+
ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9hbWxvZ2ljL3BtdS50eHQKPiA+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsdmY2MTAtbXNjbS1jcHVjZmcu
dHh0Cj4gPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9zcGVhci1taXNjLnR4dAo+ID4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay90aS1rZXlzdG9uZS1wbGxjdHJsLnR4
dAo+ID4KPiA+IE5vIGxvbmdlciBhcHBsaWVzLiAgUGxlYXNlIHJlYmFzZSBhbmQgSSdsbCBwcm9t
cHRseSBob292ZXIgdGhpcyB1cC4KPiAKPiBJIGNhbid0IGZpbmQgd2hlcmUgaXQgZG9lc24ndC4g
RmluZSBvbiBuZXh0LCB2Ni4xMC1yYzEsIHlvdXIgY3VycmVudAo+IGJyYW5jaC4gTWF5YmUgc29t
ZXRoaW5nIHlvdSBhcHBsaWVkIHRvZGF5IGFuZCBoYXZlbid0IHB1c2hlZCBvdXQ/CgpUaGF0IGNv
dWxkIHdlbGwgYmUgdGhlIGNhc2UuCgpJIGp1c3QgcHVzaGVkIGZvci1tZmQtbmV4dCBmb3IgeW91
LgoKVGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
