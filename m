Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FEFC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Nov 2021 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsUPQHJofn+FHsZLeuzl1atWxw/tQurQvT4TYx4ixJg=; b=AsACxcKlHE+Gd+
	tjDmAkhuqvAjt8u5oIXA8gaQFJrujQrmL7rPp8QG7N1rEcnKRo0QlkA4XDNT4Iwh60hdqNZmjp3ZO
	Gcoc6bA3ny3umIxFfBqG57KMe0gxpfFhKfxD8xp+M+mcgAOJGbNAZyWVJi97EanqjrXEoUZBGA/aV
	o4S6DgK5w9GlWjvLnTHtcrXU706WtDTIys6tRB/GrC35NPA6VqyHizy06IXlhBT3egRY+JBGNKqKX
	+TRuyHq7+eLeo29J5wFR/Cxte1xU0i9IKykeBR3wuqKrxYj3I8fc5qiJdLsKh3X+IyML8QslniIhN
	07h2tIgY0fwMDlQ+kmeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdIs-000Id8-G2; Mon, 29 Nov 2021 09:50:30 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdIp-000Ib9-9O
 for linux-mtd@lists.infradead.org; Mon, 29 Nov 2021 09:50:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 52A52E000D;
 Mon, 29 Nov 2021 09:50:21 +0000 (UTC)
Date: Mon, 29 Nov 2021 10:50:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, Xiangsheng Hou
 <Xiangsheng.Hou@mediatek.com>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Boris Brezillon <bbrezillon@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 00/20] External ECC engines & Macronix support
Message-ID: <20211129105020.00233264@xps13>
In-Reply-To: <YaDrjkjfK/y/n+BO@sirena.org.uk>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
 <YaDjDhOhpHMdxiqA@sirena.org.uk> <20211126151059.10c19ec7@xps13>
 <YaDrjkjfK/y/n+BO@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_015027_497480_562A71E0 
X-CRM114-Status: GOOD (  12.60  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBGcmksIDI2IE5vdiAyMDIxIDE0
OjEzOjM0ICswMDAwOgoKPiBPbiBGcmksIE5vdiAyNiwgMjAyMSBhdCAwMzoxMDo1OVBNICswMTAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+ID4gSWYgeW91IGFja25vd2xlZGdlIHRoZSBTUEkg
Yml0cyBJIGJlbGlldmUgSSBjYW4gY2FycnkgdGhlIGVudGlyZSBzZXJpZXMKPiA+IHRocm91Z2gg
dGhlIE1URCB0cmVlLiBJZiB5b3UgZmVhciBjb25mbGljdHMgYW5kIG5lZWQgYW4gaW1tdXRhYmxl
IHRhZyBJCj4gPiBjYW4gYWxzbyBkbyB0aGF0LiAgCj4gCj4gSXQnZCBiZSBnb29kIHRvIGhhdmUg
dGhlIHRhZyBqdXN0IGluIGNhc2UsIHRoZXJlJ3MgZ2VuZXJhbGx5IGEgbG90IG9mCj4gd29yayBp
biB0aGlzIGFyZWEuCgpTdXJlLgoKPiBSZXZpZXdlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBr
ZXJuZWwub3JnPgoKSSdsbCBuZWVkIHRvIHNlbmQgYSB2Mywgc2hhbGwgSSBhZGQgdGhpcyB0YWcg
dG8gYWxsIHRoZSBzcGkgYW5kIHNwaSBiaW5kaW5nIGNoYW5nZXM/CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
