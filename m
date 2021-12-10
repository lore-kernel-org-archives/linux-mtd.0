Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAAEC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UeKcgZRFdpwdJEQcXenEcIiGI2G+KnnqfAonKYHu+0k=; b=23WxycyfRAC8ae
	atxAfxqH14r6pCCaxiJF51K12M59yijEyOs/4IDAX8pIc7vztdUH3MBNg54N9H/SgMWmp93QaeEnT
	b9pkz5r8ZJmV966VT9LYoOpNrrjXAB2V8c+454IW0ZYyYGdT1+HqPlp7FAndxHB2QZW38OuC0nwkv
	rPhF/nPF+kWKgWbUEtdU1IPB2D9BE3ZziBAAHzQtlXbw0robLX1gV5TZIhaBO9JYWGJn5TG6KqXyb
	PDwnuUS1pQANqWdvX1hpkVJpSgZx6ldqXsIzDqHIrkWkQe5HLZK2eMcYVuNYer+b/Qxz0FoHJc4ui
	xQzhPTjjpZJfWvUSXCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvmBB-003gE5-TY; Fri, 10 Dec 2021 20:07:42 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvmB7-003gB6-HX
 for linux-mtd@lists.infradead.org; Fri, 10 Dec 2021 20:07:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1B467200003;
 Fri, 10 Dec 2021 20:07:31 +0000 (UTC)
Date: Fri, 10 Dec 2021 21:07:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <20211210210730.07dc672d@xps13>
In-Reply-To: <Ya5++vUkIKXtE1ja@robh.at.kernel.org>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <20211206095921.33302-3-miquel.raynal@bootlin.com>
 <Ya5++vUkIKXtE1ja@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_120737_761567_E5825907 
X-CRM114-Status: GOOD (  13.29  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgNiBEZWMgMjAyMSAxNToyMjow
MiAtMDYwMDoKCj4gT24gTW9uLCBEZWMgMDYsIDIwMjEgYXQgMTA6NTk6MjBBTSArMDEwMCwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IERlc2NyaWJlIHR3byBuZXcgbWVtb3JpZXMgbW9kZXM6Cj4g
PiAtIEEgc3RhY2tlZCBtb2RlIHdoZW4gdGhlIGJ1cyBpcyBjb21tb24gYnV0IHRoZSBhZGRyZXNz
IHNwYWNlIGV4dGVuZGVkCj4gPiAgIHdpdGggYW4gYWRkaXRpbmFscyB3aXJlcy4KPiA+IC0gQSBw
YXJhbGxlbCBtb2RlIHdpdGggcGFyYWxsZWwgYnVzc2VzIGFjY2Vzc2luZyBwYXJhbGxlbCBmbGFz
aGVzIHdoZXJlCj4gPiAgIHRoZSBkYXRhIGlzIHNwcmVhZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4g
IC4uLi9iaW5kaW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCAgICB8IDIxICsrKysr
KysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSAgCj4g
Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpJIGFtIHNlbmRp
bmcgYSBuZXcgdmVyc2lvbiBvZiB0aGlzIHNlcmllcyBzbyB0aGF0IEkgY2FuIGdldCBmZWVkYmFj
ayBvbgpvdGhlciB3YXkgb2YgZGVzY3JpYmluZyB0aGUgZmxhc2hlcywgc28gSSdsbCBkcm9wIHlv
dXIgdGFnIGJlY2F1c2UgSSdsbApuZWVkIHlvdSB0byByZS1jaGVjayB0aGF0IEknbSBub3QgZG9p
bmcgYW55dGhpbmcgc2lsbHkgKGl0IHRvb2sgbWUgYQp3aGlsZSB0byB1bmRlcnN0YW5kIHRoZSBh
cnJheSB2cy4gbWF0cml4IGxvZ2ljKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
