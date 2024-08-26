Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A62C5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 12:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOqJH/NWy1FJosuRvwqHITZXlOFEcSmYZYs9fAjqXa0=; b=B9PoYNykmLZvwd
	xvp83UPtSpzSNVQekxjUFEM4W8go4bcOjnqCnzwCfTU3JXZ4PugOepFVzdGmzLnGdByROzWh6u3bm
	0YOOTQZV5yOYzMqp/yw17NZptXrDoM6oXW2huZ/MZVDciX+vrwMVmjVjDTm+QjgqgndoOtJ72avCf
	VcMB7FlvbIsWoU0y63GdYNVkmkvA+cNfdLmmtKWT/T9LemqmeEff02Er0axIuDNeTv52yyF9Z8nMG
	Xu1OoWRPt6y9EOeWJZY5NgJjcoivXQI+AnBd6ZtwyjRnQIKnCChl0OeuzL2H1yfgCeiWdg6gTxHsg
	dJnOOP58ce+YmMUBTwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZAP-00000007O3r-3y9E;
	Mon, 26 Aug 2024 12:49:53 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZA0-00000007NqT-1yfY;
	Mon, 26 Aug 2024 12:49:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5285CE000B;
	Mon, 26 Aug 2024 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724676565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObBjnqqW6wtbIZlueHVko8oEAEz7Tf+NNKHshQIvXFY=;
	b=TuaABYt9EaUhaVwvZITINhU5UiQfZ2Z9oVYPSxs7XRMU/+5Qf8lbMHGiCyxipeHJTx4nbz
	iP3xsCyCt+cFj94Nyhfnotj5mf2CM636QOs6kuy+Z9Hzwf6QaxRh6yjl9CejQhCH791++q
	TOrCicK0NHVf5/WiXth2qSIEKbJg86sK0R9wrTeu1jLIBxNhbX90++nbT/yvQZezJ+74b2
	MiM9oyZqJED6HqZ9tpvrVSNgTn/vSfMNYyNDATv3xq7OxZe39QpNawJO9+emxRJICcwL6M
	di90LueqY4p4LbFpYuo+aKl/PoZBGqtQrr3yvMruosHTsamtEY0jrJNIcK2MfQ==
Date: Mon, 26 Aug 2024 14:49:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, michal.simek@amd.com,
 richard@nod.at, vigneshr@ti.com, liang.yang@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, kees@kernel.org,
 gustavoars@kernel.org, linux@treblig.org, robh@kernel.org,
 u.kleine-koenig@pengutronix.de, erick.archer@gmx.com,
 christophe.jaillet@wanadoo.fr, val@packett.cool,
 christophe.kerello@foss.st.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Message-ID: <20240826144917.2c4e202d@xps-13>
In-Reply-To: <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
	<20240826115213.389acaef@xps-13>
	<f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_054929_317662_01FC43DF 
X-CRM114-Status: UNSURE (   9.94  )
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

SGkgS3J6eXN6dG9mLAoKa3J6a0BrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMjYgQXVnIDIwMjQg
MTI6MTk6MDcgKzAyMDA6Cgo+IE9uIDI2LzA4LzIwMjQgMTE6NTIsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4gPiBIaSBKaW5qaWUsCj4gPiAKPiA+IHJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBv
biBNb24sIDI2IEF1ZyAyMDI0IDE3OjQzOjE4ICswODAwOgo+ID4gICAKPiA+PiBVc2Ugc2NvcGVk
IGZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlX3Njb3BlZCgpIHdoZW4gaXRlcmF0aW5n
IG92ZXIKPiA+PiBkZXZpY2Ugbm9kZXMgdG8gbWFrZSBjb2RlIGEgYml0IHNpbXBsZXIuICAKPiA+
IAo+ID4gV2h5IGlzIHRoaXMgYSByZXNlbmQgPyBEaWQgSSBtaXNzIGEgcHJldmlvdXMgaXRlcmF0
aW9uPyAgCj4gCj4gWW91IHdlcmUgbm90IGNjLWVkIG9uIHByZXZpb3VzIGl0ZXJhdGlvbi4gSSBh
c2tlZCBmb3IgcHJvcGVyIHNwbGl0Cj4gYmV0d2VlbiBzdWJzeXN0ZW1zIGFuZCBzZW5kaW5nIHRv
IG1haW50YWluZXJzLCB0aHVzIHRoaXMgcmVzZW5kLgoKT2suIE1ha2VzIHNlbnNlLCBhbmQgdGhl
IHBhdGNoc2V0IGxvb2tzIGZpbmUuCgpKaW5qaWUsIHBsZWFzZSBhbHdheXMgaW5jbHVkZSBhIGNo
YW5nZWxvZyB3aGVuIHlvdSBzZW5kIG5ldyB2ZXJzaW9ucywKYW5kIGV4cGxhbmF0aW9ucyBmb3Ig
YSBSRVNFTkQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
