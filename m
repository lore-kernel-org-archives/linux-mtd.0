Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02044C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUsZFS0XzIZ5wXZsQsqB8/8SaD+zTLbJUpZYf2MIIu8=; b=DF19k/+ha1JLER
	ZU0unrAoIuoGY2zsKgrEaRq9qJSXqUKHQdsxAJCZxPwgaLULU3Ep2Q4hNBp1Fp6SwlxYuUIsuji5D
	Ur9mcq9ufmNYIKaFl02b/diNkaVSIL6pEhmPr6oltXXlyIPE5pKFmqwWfeB3DDaq4CATOWeFArXL6
	z5D4tCXwTZ6EkYKHEKy1m8FHTEIgxpwe3hq41YR7dPTRA2uBPIKUEaYlfYStQj7hCrpQ+aBBlC2hf
	UEnXkAHJThveH4lc3T65ZhsYaGFFybHORFU5z8bIbIy0+4wW5A2dIKyALowOkPvCpxusFOpbLvGJI
	4DlXopbm/4vZ6iPzyt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMAYN-006NUm-At; Mon, 21 Feb 2022 15:24:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMAYE-006NQv-6Y
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 15:24:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3F1061050;
 Mon, 21 Feb 2022 15:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2486C340E9;
 Mon, 21 Feb 2022 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645457073;
 bh=Es8CyilU8tZmWWN+sDFjUFuj8k3qcZA/ED3G9yH3wUc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bsyw51rHynR4gU1dpOSE4lGIlDuHjZmX1tnH/xvOiGC01TJaNAsU6jmy/5MXYHerI
 QlyFk08czpWIHA0IeDj1Du4CYp4yBIVzWvhU7WjGCSNBpGH+hsabql38LHtD+BohZu
 4qmNOeMinFV0bHn82Q4At5DfNHCoyV/rYJQ5fRoUK4tOA7qjPVSIF8XNuOfVjYo/35
 8bdvAZcDpw/ILn8SOauf3+IwFrnYs9PA4wnhgMr3BYBKkIESBlwzg7mSl8jk9pR94W
 P8W1xKjd1gza+tOLixrX7sMS2BvD8FsoSlw9yGak4x9LlPYbqPo5sqaBLf8qURjreK
 dKOwtakDNJQUw==
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-spi@vger.kernel.org
In-Reply-To: <20220126112608.955728-1-miquel.raynal@bootlin.com>
References: <20220126112608.955728-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 0/3] Stacked/parallel memories bindings
Message-Id: <164545707048.739789.8289707487294516050.b4-ty@kernel.org>
Date: Mon, 21 Feb 2022 15:24:30 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_072434_314726_557216D3 
X-CRM114-Status: GOOD (  13.51  )
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

T24gV2VkLCAyNiBKYW4gMjAyMiAxMjoyNjowNCArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBIZXJlIGlzIGEgc2l4dGggdmVyc2lvbnMgZm9yIHRoZXNlIGJpbmRpbmdzLCB3aGljaCBhcHBs
aWVzIG9uIHRvcCBvZgo+IHRoZSB2NS4xNy1yYzEgbm93IHRoYXQgUHJhdHl1c2gncyB3b3JrIGFz
IGJlZW4gbWVyZ2VkLgo+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTExMDkxODE5
MTEuMjI1MS0xLXAueWFkYXZAdGkuY29tLykKPiAKPiBDaGVlcnMsCj4gTWlxdcOobAo+IAo+IFsu
Li5dCgpBcHBsaWVkIHRvCgogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQKClRoYW5rcyEKClsxLzNdIGR0LWJp
bmRpbmdzOiBtdGQ6IHNwaS1ub3I6IEFsbG93IHR3byBDUyBwZXIgZGV2aWNlCiAgICAgIGNvbW1p
dDogYjI1MmFkYTI5M2Q1ZDMwNTY2MTIxYzYxZmE3NTUyZTc0Mzk2ZDUzMwpbMi8zXSBzcGk6IGR0
LWJpbmRpbmdzOiBEZXNjcmliZSBzdGFja2VkL3BhcmFsbGVsIG1lbW9yaWVzIG1vZGVzCiAgICAg
IGNvbW1pdDogZTJlZGQxYjY0ZjFjNzllOGFiZGEzNjUxNDllZDYyYTJhOWE0OTRiNApbMy8zXSBz
cGk6IGR0LWJpbmRpbmdzOiBBZGQgYW4gZXhhbXBsZSB3aXRoIHR3byBzdGFja2VkIGZsYXNoZXMK
ICAgICAgY29tbWl0OiBlYmE1MzY4NTAzYjQyOTFkYjc4MTk1MTI2MDBmYTAxNGVhMTdjNWE4CgpB
bGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRlZ3JhdGVkIGludG8g
dGhlIGxpbnV4LW5leHQKdHJlZSAodXN1YWxseSBzb21ldGltZSBpbiB0aGUgbmV4dCAyNCBob3Vy
cykgYW5kIHNlbnQgdG8gTGludXMgZHVyaW5nCnRoZSBuZXh0IG1lcmdlIHdpbmRvdyAob3Igc29v
bmVyIGlmIGl0IGlzIGEgYnVnIGZpeCksIGhvd2V2ZXIgaWYKcHJvYmxlbXMgYXJlIGRpc2NvdmVy
ZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQuCgpZb3UgbWF5IGdl
dCBmdXJ0aGVyIGUtbWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0
aW5nCmFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0aCBwZW9wbGUgcmVw
b3J0aW5nIHByb2JsZW1zIGFuZApzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkg
aXNzdWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5lZWRlZC4KCklmIGFueSB1cGRhdGVzIGFyZSBy
ZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcgZnVydGhlciBjaGFuZ2VzIHRoZXkKc2hvdWxk
IGJlIHNlbnQgYXMgaW5jcmVtZW50YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJlbnQgZ2l0LCBleGlz
dGluZwpwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxhY2VkLgoKUGxlYXNlIGFkZCBhbnkgcmVsZXZh
bnQgbGlzdHMgYW5kIG1haW50YWluZXJzIHRvIHRoZSBDQ3Mgd2hlbiByZXBseWluZwp0byB0aGlz
IG1haWwuCgpUaGFua3MsCk1hcmsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
