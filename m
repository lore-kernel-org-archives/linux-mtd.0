Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,URIBL_RHS_DOB
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FC3C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:19:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 384FF206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h4G4ZYsf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 384FF206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hEs8W2/9gNrrS7CdR7DWn/r4JtrB17DRwksWsg4+2M=; b=h4G4ZYsfus7snc
	qpyshz8QWEZZSnqWbz5fXFGTzdETe9ex8z4uVwrawIl5crafvRrP+rGmA/1IA9ys7MiG17v1/CYjX
	XYDGVhkn7csW19fGeNZQ3d92U/b8aY+ixP42sdcrtr/FN3c0mdn97nxZL5afZjHjDNdivzgeymtJl
	CAosgArHgr/fo9Kh3EanicU8BKcD9e+4od0K0qehyX4/53DLv86TNxzS3p0xCpJemTQ7aHyklv3V4
	JydjaCYHNwbpv4E5ilz5AjBn8tdEkAUIgxCwEHBkZEiOzIK4Ra7paP5yFKtCit2LeXlFpJJJsKz9n
	gP0SN4HXk48xO/b8QxOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9ki-00077O-0S; Thu, 18 Apr 2019 16:19:08 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9k5-0006Mk-9p; Thu, 18 Apr 2019 16:18:36 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C773E240009;
 Thu, 18 Apr 2019 16:18:18 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:18:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: Add YAML schemas for the
 generic NAND options
Message-ID: <20190418181817.07969ae0@xps13>
In-Reply-To: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
References: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_091829_819024_58FFC9D6 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lLAoKTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4gd3Jv
dGUgb24gV2VkLCAgMyBBcHIgMjAxOQowOTo0ODowNCArMDIwMDoKCj4gVGhlIE5BTkQgY2hpcHMg
aW4gTVREIGhhdmUgYSBidW5jaCBvZiBnZW5lcmljIG9wdGlvbnMgdGhhdCBhcmUgbmVlZGVkIGlu
IGEKPiBkZXZpY2UgdHJlZS4gQWRkIGEgWUFNTCBzY2hlbWFzIGZvciB0aG9zZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IAo+
IC0tLQo+IAoKU2VyaWVzIGFwcGxpZWQgdG8gCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgCmJyYW5jaCBuYW5kL25leHQuCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
