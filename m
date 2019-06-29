Return-Path: <SRS0=pBCJ=U4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA16C4321A
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2019 09:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2083214AF
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2019 09:31:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJ7p0k8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2083214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyrhYeo57wxZi3dvs8Amw2XoSgekoR5vvgCEKSILDKI=; b=GJ7p0k8oFV+JwM
	eygCjnDRfWEnF4nFf9NKm7aMCM14Ii5kDLecbCV1iKxQxLpP7hHF+QfyxK6Q15476hwvGQsQ3xFq6
	WlGkvkes7GTRTfKXpLDyRLntp3IqzvOf+jgPpsBxXbHUK0A3sugG7Wrd4mgWI19gExWzYUWfoczwt
	VR9ru+dpFYI03m0souRSR9EO49WPRFhVJkpOTGGCH2MUbHGgVMhUnivBRnKFouOYIsnh8G4TBpJ+c
	WAwNRLXxMWHC03nIA70I/MmDL0OL/lMhKJPjDWwtd8pOW0KX8Co7VSil1xm36knst3zNqEng6xMml
	ulMQpL3fksK6gvkXT23w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hh9hF-00074g-PH; Sat, 29 Jun 2019 09:31:02 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hh9gc-0006nd-F7; Sat, 29 Jun 2019 09:30:25 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 11326240006;
 Sat, 29 Jun 2019 09:30:03 +0000 (UTC)
Date: Sat, 29 Jun 2019 11:29:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: sunxi-nand: Drop 'maxItems' from
 child 'reg' property
Message-ID: <20190629112956.0349705b@xps13>
In-Reply-To: <20190628193525.7785-1-robh@kernel.org>
References: <20190628193525.7785-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190629_023022_664302_E89AF144 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gRnJpLCAyOCBK
dW4gMjAxOSAxMzozNToyNSAtMDYwMDoKCj4gTWl4aW5nICdtYXhJdGVtcycgYW5kIHNjYWxhciBw
cm9wZXJ0aWVzIGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlLCBzbyBkcm9wCj4gJ21heEl0ZW1zJyBh
cyBhIHNpbmdsZSBpdGVtIGlzIGltcGxpZWQuCj4gCj4gQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdt
dzJAaW5mcmFkZWFkLm9yZz4KPiBDYzogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBn
bWFpbC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+Cj4gQ2M6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQg
V2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZp
Z25lc2hyQHRpLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4KPiBDYzogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+IENjOiBsaW51eC1tdGRA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0t
LQo+IEknbGwgdGFrZSB0aGlzIGluIHRoZSBEVCB0cmVlIGlmIHRoYXQncyBva2F5LgoKTm8gcHJv
YmxlbSEKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
