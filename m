Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F29C47DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rT5Q8oUWBG+bhtBY/e+MrQCIpqPr5nwD7UXFSEDPyw8=; b=xiWK4wUK60Vgjn
	CPrl5AlrD9o+7gwuIaHHDgfvpQinA/AeeT718ttoQwa6saKbOVM77aMi4nndXNNmx0dOjbcOf1I4i
	07AljB6zgMM3j/NlTx1474djwG3QDE0+mcafwoatLexg38AHC/JAZUNn9VNfpeX2xOwtIUlQfrqL/
	+zFjRiMSO1tkcJsMhoE68ox42EVyIxr/78gzRPtp7KI+vLHm2ZZvxa1iE9EsRJIZZMESHwMlE7eRC
	fOidZez6+dYNFfxi8TO9wt4XCoUq8+AieymrvwTVqR+EUkTB+t/whwR3s1AHxeWKxH3yVXc92WRaJ
	d0oMvL2h+IbWuiKdlRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyty-00DV9g-2q;
	Mon, 22 Jan 2024 18:20:06 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRytv-00DV7P-1I
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 18:20:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60DD4C0008;
	Mon, 22 Jan 2024 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705947599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8W7nuPtHrC/Hj56hA90mhHUdLtjrN9XFg/luUGKxfNs=;
	b=Ro4C+lyC8DiYanjVguhp0jyVAhJRO3/nU2DF3V6l2G05sVRSDem+FwD8i/jNbYm6dOZKVQ
	I53bR8QwRykQwviL/3BbGimvK44PLL79jrJqyYehK93nErBoMNSkIFp9YRT93Spq4Exfmf
	JHhNjlGR+OWnLvN0P7JXmWML9Zb8461P3HefBu9/K3KR7Fa72C/xfloGtPZw+XommQ56eb
	dRexUiUhhc90KZdotFbwsNRIoy1wv9hQbyOGOJjmNvpWbRrEHakErzeSYz54oZJkQyJL1q
	kWclhMjHSIhiq6SlhgAX2LqNXe7fg9DPkO1uIFndWqWcUAcFjS79Irron+UmZA==
Date: Mon, 22 Jan 2024 19:19:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, kernel@pengutronix.de, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Pali
 =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 13/33] mtd: rawnand: fsl_elbc: Let .probe retry if
 local bus is missing
Message-ID: <20240122191931.17807644@xps-13>
In-Reply-To: <41a042207ef791c4c5bcb46f09f63c40c6aa321b.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
	<41a042207ef791c4c5bcb46f09f63c40c6aa321b.1705944943.git.u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_102003_621411_DF91245B 
X-CRM114-Status: GOOD (  10.53  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIE1vbiwgMjIg
SmFuIDIwMjQgMTk6MDc6MDggKzAxMDA6Cgo+IElmIGR1cmluZyBwcm9iZSBmc2xfbGJjX2N0cmxf
ZGV2IGlzIE5VTEwgdGhhdCBtaWdodCBqdXN0IGJlIGJlY2F1c2UgdGhlCj4gZnNsX2xiYyBkcml2
ZXIgZGlkbid0IGJpbmQgeWV0LiBTbyByZXR1cm4gLUVQUk9CRV9ERUZFUiBpbiB0aGlzIGNhc2Ug
dG8KPiBtYWtlIHRoZSBkcml2ZXIgY29yZSByZXRyeSBwcm9iaW5nIGxhdGVyLgoKRGVzcGl0ZSB0
aGUgcHJvYmFibGUgdXNlZnVsbmVzcyBvZiB0aGlzIGNoYW5nZSwgSSBkb24ndCBzZWUgYW55CnJl
bGF0aW9uc2hpcCB3aXRoIHRoZSBjdXJyZW50IHNlcmllcy4gU28gdW5sZXNzIHRoZXJlIGlzIGEg
Z29vZCByZWFzb24KSSBtaWdodCB0YWtlIHRoaXMgb25lIHRocm91Z2ggdGhlIG5hbmQgdHJlZS4K
CkFsc28sIHdoYXQgYWJvdXQgYSBGaXhlcy9DYzogc3RhYmxlIHRhZyBoZXJlPwoKPiBTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
PgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
