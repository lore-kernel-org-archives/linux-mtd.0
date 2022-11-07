Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BC0C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQwfJ2CGfVhfACJU4OZcOpWSxm7Vz31he79JZ8J1ZWo=; b=jT1+eyu+hWTKpC
	6wHUPmqp9g13+AHmCPEKSL8LLm38kbRjSJMzObWf1eNx1VpFpNgS9BlQN3pjqrGd/WJb6EhJMdFDF
	BLBxj/sHvvnO1ADgXhAOveSmhbHF1t3r+FhJtH1VsPIjXjQNni5eLnMV+ZDaybcLMCkyI6CA09aa2
	6+6vsCjoCrYBlMae5XfUwGV3cN/6EGlpnIbp2qJ00pjj2OjuwlPSvKmPWdGVBFXRsNOse6SI38Pd+
	jBQTasRP18o4+lcSZLDoCAme+0Jk3xp4XZ4HUp6np5l4iMqzq1uB1JFCDdQ8AulxfHZ+1Dp7EfzRO
	jPRuHUZXrHX3VzrBPy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5B4-00GHiz-3o; Mon, 07 Nov 2022 16:40:50 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4xc-00GAot-5j
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:26:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1DF2F1C0003;
	Mon,  7 Nov 2022 16:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LbBvYgPag/aDwy9fxEOFeDG/k2Ec6w15gu89rLDkU0c=;
	b=G6EjkKgfeTc6+TEDTeUHj/TkBFC37kPc61rbFrKQ1F96X5TPrix66dUfBYlhRajpgfY9uM
	GBsWXp15z/aMaPNq/liYzXin5bETN3hFzCqX6VQJX/5XpHo1F+fOhxpeByhNEDZ0iwlzqn
	QyHF0GbvhUHzclLsz3I4n75rA2YLsJvTHNN3LeoQ/ixXl/XFhtbmBIbCAHZZcF9OirHZXh
	+Jma/A+/OrB8FdkeIV63mhB6INwIwHXO1hvBpvXnZu1zbDj8t8A6EDMyslgJtCzlOo/+Co
	9ifqVe5YeU6zypFb72FeE0I1g8pqoT4mFdrHpkmbhpO8scMdygyZ13bj5WMJhA==
Date: Mon, 7 Nov 2022 17:26:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Florian Fainelli
 <f.fainelli@gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: brcm,brcmnand: update interrupts
 description
Message-ID: <20221107172652.654c972c@xps-13>
In-Reply-To: <20221107162253.54110-1-miquel.raynal@bootlin.com>
References: <20221104085316.24499-1-zajec5@gmail.com>
	<20221107162253.54110-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082656_405463_22BC8F58 
X-CRM114-Status: GOOD (  12.30  )
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

SGksCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgIDcgTm92IDIwMjIg
MTc6MjI6NTMgKzAxMDA6Cgo+IE9uIEZyaSwgMjAyMi0xMS0wNCBhdCAwODo1MzoxNiBVVEMsID0/
dXRmLTg/Yj9VbUZtWWNXQ0lFMXB4WUpsWTJ0cD89IHdyb3RlOgo+ID4gRnJvbTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4gCj4gPiAxLiBETUEgYW5kIEVEVSBhcmUgbXV0
dWFsbHkgZXhjbHVzaXZlOiBkb24ndCBhbGxvdyBib3RoIGF0IHRoZSBzYW1lIHRpbWUKPiA+IDIu
IFJlcXVpcmUgaW50ZXJydXB0LW5hbWVzIGZvciAyKyBpbnRlcnJ1cHRzIHRvIGF2b2lkIC9ndWVz
c2luZy8KPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlA
Z21haWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPiAgCj4gCj4gQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgoKVGhpcyBw
YXRjaCBoYXMgbm90IHlldCBiZWVuIGFja2VkIGJ5IFJvYiBvciBLcnp5c3p0b2YsIEkganVzdCBk
cm9wcGVkIGl0CmFuZCB3aWxsIChyZSlhcHBseSBpdCBsYXRlciBpZiBpdCBnZXRzIHRocm91Z2gg
dGhlIG5lY2Vzc2FyeSByZXZpZXdzLgoKU29ycnkgZm9yIHRoZSBub2lzZS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
