Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFA4E77170
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQhos0KBm82yFh5vnnPkfT68oesg4epB2tFK43sCQd8=; b=pOPoBIYnoZispH
	/kSdqJAg7pEBs27uE8xzsWVAz9gcsG3pdseQtO6gJ+T/aGtq0U6Ee5cxRAKU9fhg6zb6Brs1F3zFq
	+xMGw4E4/XVf9QIAT7vfR5wAT2FCC2E6GMeallVZqM2yEg+uGnmNUcAEPzxBnuXk3GCd9WuNzwg1l
	/gCHjcc1MlL3vKWD4ehbjOCv5ssCchTWL2sB1rhk51GK9k9iOYAI4X1yOUaXFBiAWqJzdDbuLXHUB
	EeqtX/JdsUrSigFmK+VvOpstP29m/jznZqXR10zz7lRGEkinoYb8lMnKgsVTm3cooLSu1ixZnzpDW
	91uwgKlgIOZsgLpeSctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ90l-0000000FUqN-0YAG;
	Thu, 05 Dec 2024 10:23:07 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8zt-0000000FUgb-2a6l
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:22:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E7822000E;
	Thu,  5 Dec 2024 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733394130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uWVQ/v+7+PpcMMQalZl/ZZIHqM8C8QG5E8x7U8XrtwM=;
	b=m5Q0Boa0AKcnlqjAkyujMXhcHPjQZKn54uFHD8d/bVh58AuEwXuESPejvIb1oNmgDd/1/p
	zBUPiTuVSuEEpI/U1XNNv4z98cLHEgkVwzWLoEnZC+UtqRvQ+j8NWBJKf2oATFxQQ5Vq5k
	UM+SFu6lfWrl3sWBjr8lPiJoR94q1VsCNzNx7hYVEj3Zt+FRBE+ywZFXakZu+UHmk6+lon
	6JKmqAUmWLcGGTDecZngNEyCb6Nwa2NcYtyvFjaRX0n2pWChAC9wDVNW1BMZjrzy7ITV2N
	bAsowrMktSem93DIVIUWK5YFGku6gWun7gsGxtu1DwaE+hm59kzblfHjcUjkRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: niravkumar.l.rabara@intel.com
Cc: devicetree@vger.kernel.org,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
In-Reply-To: <20241205053350.434370-1-niravkumar.l.rabara@intel.com>
	(niravkumar l. rabara's message of "Thu, 5 Dec 2024 13:33:50 +0800")
References: <20241205053350.434370-1-niravkumar.l.rabara@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 11:22:09 +0100
Message-ID: <87mshawhta.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_022213_792587_F933671F 
X-CRM114-Status: UNSURE (   4.75  )
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

T24gMDUvMTIvMjAyNCBhdCAxMzozMzo1MCArMDgsIG5pcmF2a3VtYXIubC5yYWJhcmFAaW50ZWwu
Y29tIHdyb3RlOgoKPiBGcm9tOiBOaXJhdmt1bWFyIEwgUmFiYXJhIDxuaXJhdmt1bWFyLmwucmFi
YXJhQGludGVsLmNvbT4KPgo+IENvbnZlcnQgY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIudHh0IHRv
IHlhbWwgZm9ybWF0Lgo+IFVwZGF0ZSBjYWRlbmNlLW5hbmQtY29udHJvbGxlci50eHQgdG8gY2Ru
cyxocC1uZmMueWFtbCBpbiBNQUlOVEFJTkVSIGZpbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaXJh
dmt1bWFyIEwgUmFiYXJhIDxuaXJhdmt1bWFyLmwucmFiYXJhQGludGVsLmNvbT4KCkxvb2tzIGdv
b2QgdG8gbWUsIGJ1dCBJJ2xsIHdhaXQgZm9yIGJpbmRpbmcgbWFpbnRhaW5lcnMgYWNrIG9mYy4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
