Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1020C25B7E
	for <linux-mtd@archiver.kernel.org>; Fri, 31 May 2024 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/MBXh7bgRrSlPHt71SZeGCQLbAUkjLgGd2e9K7oJfA=; b=b3isIKjMoFdVzL
	jBkeHVnCNQYKGwldlW0/JNZs3yq7bftxrsqeRWenti4meXv8hq2FDlh9AqC+/rHaIHQCpYEJgJejI
	KhraKN7M3QueCB+4lYg/rm2PD+dH0UwGQ4gDha0wPG1IrJNe0XpX5zBYs3wpdAmO2AVbpGu423pqS
	tVY1XQiS/ZUqADquXTCiAq2Db/JmeNJJSdfvAod352BThnL48L5r5MEs7qK2NDVbdLtCjzEh7F8b2
	zja+7QwNKMF+ny00jV9saqIbQvSRmMy0ggqCWXkUi8yMLKMXBl8aiOlZM45NijACBchFSiILkRX3+
	ha5Jeq9Pi4lMDvK078WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4gv-0000000Aku3-0kv4;
	Fri, 31 May 2024 16:01:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4go-0000000Akq8-2Hw1;
	Fri, 31 May 2024 16:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51C1D62D1A;
	Fri, 31 May 2024 16:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF83C4AF13;
	Fri, 31 May 2024 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171261;
	bh=c+d4lcGPb/U+FefoCxW7HsKJKVrrlM9uztIB003s6WM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KmY/o7PBK6+b7v0yeKL94FXrqypcQdlFqjIk1YD3bprmcNrkiWA/lkrGGUg+Yckt6
	 F5YiQH+HN0fU7IdeAnPaHGUMed9j9D31MAVdOqtPa1PBWlzE7on6uStPhaAmmVsvni
	 DMiS2bMTL2rHJGWrMzTOOTff6SHXvYvQ47na80/m32re8sJrYQwvMlNv29rvYMk7Zy
	 uuyvKesDfCMpz2c48Py9Uw55FomuDS3tqkGi2ASFqUBhC8xYOE7Xo/wq53xk+eOuxA
	 NJcbcevLQDEzGI1uGgGm62hlEIjCipDY1hdpzchSVWJHT4O0eAUnxboW3jX49bL2kC
	 +aq/irrOp90uA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ae38957e8so2587527e87.1;
        Fri, 31 May 2024 09:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGNZx8r/xtNbHnvpsEZlOd0gX2jV9YOlBtdzaE2BJv1dK95oNUNQFEZpDBOu9BUz0ui/1h3wyLNmGp605JIw52rFGkae69qS5DpoEOyPwnc74Jb6Rj2Hix15xnd+xoqADIHGJFkQblP2U0UUr1q5uNpziAvxnffMEQzTNxk0WxmtVQGKMAWZ5QjfSGh4zyw/N42LdYN0jM
X-Gm-Message-State: AOJu0Ywe8BcmiUmj+M23YwHacr+S7QIdJn3xoX7wW136lZC2TheWbhXw
	y5MlY36nQfe5tfVwgWQdDlqFy+Qk+tci8z+mlte41CWkylQjj1BX/iRFq9YbpaePG4J139KmFXb
	4geyhE5t3SmfkTeLArlBlXoeQ3A==
X-Google-Smtp-Source: AGHT+IH4oy5XfEeI6M9ivxBCoSxDCjBCAk+o5jUpEGutuJaJMQxDlvaDmEbQUTIillqvz9TNUGFpdA36DhO70v2pCRU=
X-Received: by 2002:a05:6512:3145:b0:51e:f68b:d266 with SMTP id
 2adb3069b0e04-52b896c49cemr1375881e87.50.1717171259738; Fri, 31 May 2024
 09:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240510123018.3902184-1-robh@kernel.org> <20240531134536.GK1005600@google.com>
In-Reply-To: <20240531134536.GK1005600@google.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 May 2024 11:00:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
Message-ID: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_090110_782065_A93770BC 
X-CRM114-Status: GOOD (  13.94  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgODo0NeKAr0FNIExlZSBKb25lcyA8bGVlQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gRnJpLCAxMCBNYXkgMjAyNCwgUm9iIEhlcnJpbmcgKEFybSkgd3Jv
dGU6Cj4KPiA+IEFkZCBhbm90aGVyIGJhdGNoIG9mIHZhcmlvdXMgInNpbXBsZSIgc3lzY29uIGNv
bXBhdGlibGVzIHdoaWNoIHdlcmUKPiA+IHVuZG9jdW1lbnRlZCBvciBzdGlsbCBkb2N1bWVudGVk
IHdpdGggb2xkIHRleHQgYmluZGluZ3MuIFJlbW92ZSB0aGUgb2xkCj4gPiB0ZXh0IGJpbmRpbmcg
ZG9jcyBmb3IgdGhlIG9uZXMgd2hpY2ggd2VyZSBkb2N1bWVudGVkLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+IFRo
aXMgYmF0Y2ggaXMgbW9zdGx5IGZyb20gYXJtMzIgcGxhdGZvcm1zLgo+ID4gLS0tCj4gPiAgLi4u
L2JpbmRpbmdzL2FybS9hbWxvZ2ljL2FuYWxvZy10b3AudHh0ICAgICAgIHwgMjAgLS0tLS0tLS0t
LS0tLQo+ID4gIC4uLi9iaW5kaW5ncy9hcm0vYW1sb2dpYy9hc3Npc3QudHh0ICAgICAgICAgICB8
IDE3IC0tLS0tLS0tLS0tCj4gPiAgLi4uL2JpbmRpbmdzL2FybS9hbWxvZ2ljL2Jvb3Ryb20udHh0
ICAgICAgICAgIHwgMTcgLS0tLS0tLS0tLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vYW1sb2dpYy9wbXUudHh0ICAgfCAxOCAtLS0tLS0tLS0tLS0KPiA+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vYXRtZWwtc3lzcmVncy50eHQgfCAyOSAtLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2F4aXMudHh0ICAgICAgICAgIHwgMTYg
LS0tLS0tLS0tLQo+ID4gIC4uLi9hcm0vY3B1LWVuYWJsZS1tZXRob2QvYWwsYWxwaW5lLXNtcCAg
ICAgICB8IDEwIC0tLS0tLS0KPiA+ICAuLi4vYXJtL2ZyZWVzY2FsZS9mc2wsdmY2MTAtbXNjbS1j
cHVjZmcudHh0ICAgfCAxNCAtLS0tLS0tLS0KPiA+ICAuLi4vYmluZGluZ3MvYXJtL21hcnZlbGwv
bWFydmVsbCxkb3ZlLnR4dCAgICAgfCAxNSAtLS0tLS0tLS0tCj4gPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL3NwZWFyLW1pc2MudHh0ICAgIHwgIDkgLS0tLS0tCj4gPiAgLi4uL2JpbmRp
bmdzL2Nsb2NrL3RpLWtleXN0b25lLXBsbGN0cmwudHh0ICAgIHwgMjAgLS0tLS0tLS0tLS0tLQo+
ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24ueWFtbCAgICAgICB8IDI5ICsr
KysrKysrKysrKysrKysrKysKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9taXBzL21zY2Mu
dHh0ICAgICAgICAgfCAxNyAtLS0tLS0tLS0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9hdG1lbC1uYW5kLnR4dCAgICB8ICA5IC0tLS0tLQo+ID4gIC4uLi9iaW5kaW5ncy9uZXQv
aGlzaWxpY29uLWhpcDA0LW5ldC50eHQgICAgICB8IDEwIC0tLS0tLS0KPiA+ICAxNSBmaWxlcyBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyMjEgZGVsZXRpb25zKC0pCj4gPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy9h
bmFsb2ctdG9wLnR4dAo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMvYXNzaXN0LnR4dAo+ID4gIGRlbGV0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMvYm9vdHJv
bS50eHQKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9hbWxvZ2ljL3BtdS50eHQKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHZmNjEwLW1zY20t
Y3B1Y2ZnLnR4dAo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL3NwZWFyLW1pc2MudHh0Cj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay90aS1rZXlzdG9uZS1wbGxjdHJs
LnR4dAo+Cj4gTm8gbG9uZ2VyIGFwcGxpZXMuICBQbGVhc2UgcmViYXNlIGFuZCBJJ2xsIHByb21w
dGx5IGhvb3ZlciB0aGlzIHVwLgoKSSBjYW4ndCBmaW5kIHdoZXJlIGl0IGRvZXNuJ3QuIEZpbmUg
b24gbmV4dCwgdjYuMTAtcmMxLCB5b3VyIGN1cnJlbnQKYnJhbmNoLiBNYXliZSBzb21ldGhpbmcg
eW91IGFwcGxpZWQgdG9kYXkgYW5kIGhhdmVuJ3QgcHVzaGVkIG91dD8KClJvYgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
