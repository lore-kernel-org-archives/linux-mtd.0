Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED955C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByZIK/pgtqzxvnrkjBRunsK9LUBpU33arzhhH7az/O8=; b=ee3fsLvT78/uid
	4aXi0BdRzmE5LfB2OtF6UK0AwfuXEk9ZaSjqImTIY52EUiesMYSP8mORXtRVqgVMwY7D+ephbq1CX
	0RyMwzQYoEC/3+9tGXKeOnxIxadEIZXCUZw+rvLkpc4u0whR1ABEOJ+TO0BRNKizwIqa3IkKZ0sGs
	FpLbPsQwDxO057FLvPFAOONqqUXnO54arhy9Atbz+SmjGwSXV7oiuT3Z1bEb20yw/nPWyeMpzyZeR
	OxgssY2JzVTEd7WYV1vO1Hkib+a4huOy3YLm19ICMzDFhLL/uIi10NrC72aY+YgMjbn8d8ru35X53
	XTtfw5X1ARO5nAtSh0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOx7j-00FMY5-S3; Tue, 01 Mar 2022 07:40:44 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOx7G-00FMHk-9k; Tue, 01 Mar 2022 07:40:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B2C310000D;
 Tue,  1 Mar 2022 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646120409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EOlbUxAApC61mQjvw+lG70+JM2jHWLUjBcqvnLcepA=;
 b=EWUY1TKvGS6Yg129zF29NgHJHMwcv48rJCLCe7SF45JHcNNriVOQo+vcGiYixEAaHnyulB
 nJQBl068EP/pSVzbkdxbgXCJZTn/Woy6xox0qwrhuWnLDJmO7Aw8fafuMklMsuzENOIIXz
 c+TC7F7dcVRu1QNFnUnAFY2l+9/i9oBUcQ4iFhctYdJL7TClStx6/rANhA1Sbvyn0M96zz
 DN43uNBfzPSoxhjSP8ns2qwAGgi1xkMICNqykUP4WLVTs0I1l9IOPWWY8T3PooNnoadHUN
 InLV/E29BXUcvgd0jZP/wxq0rm/fa2yidd9Or23IERKtnX+02I184mza7r59qQ==
Date: Tue, 1 Mar 2022 08:40:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee
 Jones <lee.jones@linaro.org>, Guenter Roeck <groeck@chromium.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "David
 S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kishon
 Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Sebastian
 Reichel <sre@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Mark Brown
 <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <20220301084001.3771855e@xps13>
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
References: <20220228213802.1639658-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_234015_013704_F05013F2 
X-CRM114-Status: GOOD (  15.49  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMjggRmViIDIwMjIgMTU6Mzg6
MDIgLTA2MDA6Cgo+IEFub3RoZXIgcGFzcyBhdCByZW1vdmluZyB1bm5lY2Vzc2FyeSB1c2Ugb2Yg
J2FsbE9mJyB3aXRoIGEgJyRyZWYnLgo+IAo+IGpzb24tc2NoZW1hIHZlcnNpb25zIGRyYWZ0NyBh
bmQgZWFybGllciBoYXZlIGEgd2VpcmQgYmVoYXZpb3IgaW4gdGhhdAo+IGFueSBrZXl3b3JkcyBj
b21iaW5lZCB3aXRoIGEgJyRyZWYnIGFyZSBpZ25vcmVkIChzaWxlbnRseSkuIFRoZSBjb3JyZWN0
Cj4gZm9ybSB3YXMgdG8gcHV0IGEgJyRyZWYnIHVuZGVyIGFuICdhbGxPZicuIFRoaXMgYmVoYXZp
b3IgaXMgbm93IGNoYW5nZWQKPiBpbiB0aGUgMjAxOS0wOSBqc29uLXNjaGVtYSBzcGVjIGFuZCAn
JHJlZicgY2FuIGJlIG1peGVkIHdpdGggb3RoZXIKPiBrZXl3b3Jkcy4KPiAKPiBDYzogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPgo+IENjOiBU
aGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IENjOiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9r
aG92QGdtYWlsLmNvbT4KPiBDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gQ2M6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gQ2M6IEd1ZW50ZXIgUm9lY2sgPGdyb2Vj
a0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZp
Z25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogIkRhdmlkIFMuIE1pbGxl
ciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gQ2M6IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5l
bC5vcmc+Cj4gQ2M6IEtpc2hvbiBWaWpheSBBYnJhaGFtIEkgPGtpc2hvbkB0aS5jb20+Cj4gQ2M6
IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+Cj4gQ2M6IFNlYmFzdGlhbiBSZWljaGVsIDxz
cmVAa2VybmVsLm9yZz4KPiBDYzogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGlu
YXJvLm9yZz4KPiBDYzogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9y
Zz4KPiBDYzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+IENjOiBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1sZWRz
QHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXBoeUBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gQ2M6IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1yZW1vdGVwcm9j
QHZnZXIua2VybmVsLm9yZwo+IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBDYzog
bGludXgtc3BpQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAg
Li4uL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwgICAgICAgICB8ICAzICst
LQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmNtLGJjbTI3MTEtaGRtaS55YW1sICAgICAgIHwg
IDMgKy0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hZGksYWR2NzUxMS55YW1sICAg
ICAgfCAgNSArKy0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc3lub3BzeXMsZHct
aGRtaS55YW1sIHwgIDUgKystLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZGlzcGxh
eS10aW1pbmdzLnlhbWwgICB8ICAzICstLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3N0ZSxtY2RlLnlhbWwgICAgIHwgIDQgKystLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnB1dC9hZGMtam95c3RpY2sueWFtbCAgIHwgIDkgKysrKy0tLS0tCj4gIC4uLi9iaW5kaW5n
cy9sZWRzL2N6bmljLHR1cnJpcy1vbW5pYS1sZWRzLnlhbWwgICAgfCAgMyArLS0KPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLWxwNTB4eC55YW1sICAgICB8ICAzICstLQo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvZ29vZ2xlLGNyb3MtZWMueWFtbCAgIHwgMTIgKysr
Ky0tLS0tLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIu
eWFtbCAgfCAgOCArKystLS0tLQo+ICAuLi4vYmluZGluZ3MvbXRkL3JvY2tjaGlwLG5hbmQtY29u
dHJvbGxlci55YW1sICAgIHwgIDMgKy0tCgpGb3IgTVREIGJpbmRpbmdzOgoKQWNrZWQtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
