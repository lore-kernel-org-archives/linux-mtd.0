Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29085C35274
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1vUYsY7rG/Dy8bWXOjaJkGsXxZbCdUWu50uobC4we0=; b=3QnURenG+nGpbt
	W9tJ0zSgslMU/4WgQ4zrp/EOhvGfu9W1SHArZCV8p2Sm2ud0ymGDKCTiNeHIyt51Ea/pBiNwtMSWl
	J+xchSFvW2jjD0JICzEqCzq2MkIV0zkY2lIK9r+4R0TAiH9HaVWE2NwTVGP9xhx9kTDIiQOR/uo6N
	88N7u3Qra2UDKYf6iYGe9hbrq4Rc0eGOm7GN0aP5HZwasYy+sGbd/slVez3g46oH4lBbZC7G55EU9
	U92GA0Pj+cvHSXkc1cMHkC4EZk8EI7ogVD3RKjmFRTIFHW9BEXzFPW6Ey6g7hHcopkOg7kXvwuS1B
	k2/tzIhGntF882U5qUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7He-003DfN-38;
	Fri, 15 Dec 2023 12:27:14 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7Hb-003DdJ-2F
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 12:27:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3A1FFF813;
	Fri, 15 Dec 2023 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702643227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1IZYbaAaZtghBRBPHJKTFh+2UDzsyuLF2d2HRcrhVq0=;
	b=G4Zx3Zi9MtdsgR/304rHUaSdcB+XDN/Gt6C/mMuZD5JZHzYh4ACnzr0HihJUfiiI7ZKpcj
	Tfln8V4Z2Xg25dzAR1N1iopjQpVpLobNmGvxIryh7COGptEyxN2J+hBJtZkxYWhCSvSyVu
	T7tVX2IYI9NiAqgstZc0GF4FE5L/LH/KW1MDZFf4rpmfX1CwR17haufvmAk3Zu5Anpf8WV
	EGBvvZx+7gBcitykuDKMv9JpoLyhhkwj0cRTekSjt4Tnkg+tnJjyglFHhIEmXizP7XPUrb
	7EBz9BCsfYy5ieQiJdY2nK52m6Kw5IcFkWYbvNTJYAzcpUECfqTUQxlk5oGA9A==
Date: Fri, 15 Dec 2023 13:27:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Nikita Shubin via B4 Relay 
 <devnull+nikita.shubin.maquefel.me@kernel.org>,
 u.kleine-koenig@pengutronix.de, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, Linus
 Walleij <linus.walleij@linaro.org>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 20/40] mtd: rawnand: add support for ts72xx
Message-ID: <20231215132652.0be1a92d@xps-13>
In-Reply-To: <4a47fe75a4df63e732d0d4bacef279cc91288d1f.camel@maquefel.me>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
	<20231212-ep93xx-v6-20-c307b8ac9aa8@maquefel.me>
	<20231215111648.196c0c46@xps-13>
	<4a47fe75a4df63e732d0d4bacef279cc91288d1f.camel@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_042712_004920_06A9CD10 
X-CRM114-Status: GOOD (  16.47  )
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

SGkgTmlraXRhLAoKbmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZSB3cm90ZSBvbiBGcmksIDE1IERl
YyAyMDIzIDE1OjExOjAyICswMzAwOgoKPiBIZWxsbyBNaXF1ZWwgYW5kIFV3ZS4KPiAKPiBPbiBG
cmksIDIwMjMtMTItMTUgYXQgMTE6MTYgKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBI
aSBOaWtpdGEsCj4gPiAKPiA+IGRldm51bGwrbmlraXRhLnNodWJpbi5tYXF1ZWZlbC5tZUBrZXJu
ZWwub3JnwqB3cm90ZSBvbiBUdWUsIDEyIERlYwo+ID4gMjAyMwo+ID4gMTE6MjA6MzcgKzAzMDA6
Cj4gPiAgIAo+ID4gPiBGcm9tOiBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVlZmVs
Lm1lPgo+ID4gPiAKPiA+ID4gVGVjaG5vbG9naWMgU3lzdGVtcyBoYXMgaXQncyBvd24gbmFuZCBj
b250cm9sbGVyIGltcGxlbWVudGF0aW9uIGluCj4gPiA+IENQTEQuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lPiAgCj4g
PiAKPiA+IEknbSBmaW5lIHdpdGggdGhpcyB2ZXJzaW9uLCBJIGNvdWxkIGNvbGxlY3QgcGF0Y2hl
cyAxOSBhbmQgMjAgdGhyb3VnaAo+ID4gbXRkIGJ1dCBJIHNhdyBubyBjbGVhciBhbnN3ZXIgdG8g
dGhlIGNvdmVyIGxldHRlciwgcmVnYXJkaW5nIHdobwo+ID4gc2hvdWxkCj4gPiBwaWNrdXAgdGhl
IHBhdGNoZXMuIExldCBtZSBrbm93IHdoYXQgeW91IHByZWZlci4gIAo+IAo+IFRoaXMgaXMgc3Rp
bGwgcGxhbm5lZCBnb2luZyB2aWEgYXJtLXNvYyBicmFuY2gsIGFzIHRoZXNlIHBhdGNoZXMgYXJl
Cj4gcHJldHR5IHVzZWxlc3Mgd2l0aG91dCBlcDkzeHggdG90YWxseSBjb252ZXJ0ZWQgdG8gZGV2
aWNlIHRyZWUuCgpBbHJpZ2h0LCBzbyBJIHdpbGwgbm90IHRha2UgdGhlc2UgcGF0Y2hlcyBmb3Ig
dGhlIG5leHQgbWVyZ2Ugd2luZG93LgoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
