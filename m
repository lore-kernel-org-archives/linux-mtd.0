Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E525AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7crWMlE1LlviujO36uU2YoQeHdSCbI3946RhZ5jyHw=; b=2Fr+yhWA6mhGp/
	UmyvHTnQT52tKfoj0ztSwkaX/fp9VhIPYt/jJ8UFMY8mmWCB33WlwRTTMFnTEBGvYywG5FQlGG0ou
	/PjaJjxUKMh0qJBhPCv51lAFprxTWjtKwLfD+c2oiDIM1YJGDxe5PahMBw9D1zqbujjM/501/zPS3
	n5V/P7ZLnqr12ct8K6Pm04fd1jil3M/63+CxDcfdQJ8vK9p4lEcwfNpPDT/gf0erntt4o4oWSAnAI
	y55YHWiguot0i1RJIZW3pRO+tVho0wp4JRTdI353N7E8bdp5N/5n3wdb83xH0dp6JphI62xMa+V8o
	6q8wBxv6OgHmk/GwiJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTUz-00CVIp-GP; Thu, 07 Apr 2022 14:52:37 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTUn-00CVCo-5D; Thu, 07 Apr 2022 14:52:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A1D3240013;
 Thu,  7 Apr 2022 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649343138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kE93EQdeX/78I13r54jYxB9RFr1bELvDiK/AcybMWg=;
 b=BnbNHHSvwabukydz7YNOnjhZfd/kJNVkIjlJIRJ8ByrO1ycXW+J/XnHNoHmR8jw5pmBpu4
 ZJWgbKzA/xi9MX39Bvp9kjAcygeD/SN9F2P7yl4aPVWFmllVIK3JFw2tqo6xL1ipPC6mig
 4y2wGFLT6rBfRDuYmHp1lSVd9gCxUK3/7LQytvWXhEpJrbFylOCE5dyAsS2X/oNliFn0es
 fKi5yn6gyOIVy86LZLNCOEcleY1m/egZINhDV2hCuYWhABIBOGDz/kTVhls/Lp2B3k9CM5
 YobGQGh9SEG2JbW4Eou3D31LSLARZnfmyr/+tK448Obl2kcV93oaVvvXV29n+w==
Date: Thu, 7 Apr 2022 16:52:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: align SPI NOR node name with dtschema
Message-ID: <20220407165214.725ae8f0@xps13>
In-Reply-To: <20220407143405.295907-1-krzysztof.kozlowski@linaro.org>
References: <20220407143405.295907-1-krzysztof.kozlowski@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_075225_412604_5174A4E1 
X-CRM114-Status: UNSURE (   6.89  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFRo
dSwgIDcgQXByIDIwMjIgMTY6MzQ6MDUgKzAyMDA6Cgo+IFRoZSBub2RlIG5hbWVzIHNob3VsZCBi
ZSBnZW5lcmljIGFuZCBTUEkgTk9SIGR0c2NoZW1hIGV4cGVjdHMgImZsYXNoIi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
