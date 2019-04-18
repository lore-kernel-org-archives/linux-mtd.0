Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,URIBL_RHS_DOB
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518ADC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:19:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230B1206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N2rk6r3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230B1206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voUjgjo/FC1lzkBoR5B2mSezytnSuuTq/bHyMOy6yfU=; b=N2rk6r3aEQbq+b
	NLxlUVFSnjtLrCmSqaDY+H3GUuen+fjTJak1BU4ce24qQzZLmjGYkyN8QQAbSl+AEF7jQlFqPAGnh
	gzRZHKz1SHBRT6EmDWPMRBlpH1/WlHpi5mN4YDAc5Zp460FTci6g9Py4ov4NT3QWt2TpeIBfTNE3e
	LA+4RNESRLWO6ni6RgdsyMPgWGRpDzhdJ14qsL1FSG4b/UUeSvMc2Q6x8XnbXSffWumkE13p2KLwr
	JeEzZhWzyjvfodDzzqh0F2NlA2/YUxJa9Ny3WiEQJa/liXJ/b+9CF96mUq6bvuLHX44z7Awq5igW0
	caponDO3yp0zrTdrxD4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9l5-0007S8-QX; Thu, 18 Apr 2019 16:19:31 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9kh-000756-Tf; Thu, 18 Apr 2019 16:19:18 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 59946100003;
 Thu, 18 Apr 2019 16:18:52 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:18:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: mtd: sunxi: Add new compatible
Message-ID: <20190418181850.76c867d5@xps13>
In-Reply-To: <20190408074147.26797-1-miquel.raynal@bootlin.com>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_091908_546984_07E1F994 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8KCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9u
IE1vbiwgIDggQXByIDIwMTkKMDk6NDE6NDQgKzAyMDA6Cgo+IFRoZSBBMzMgTkFORCBjb250cm9s
bGVyIGlzIHNsaWdodGx5IGRpZmZlcmVudCB0aGFuIHRoZSBBMTArIG9uZXMsCj4gZWcuIERNQSBo
YW5kbGluZyBpcyBhIGJpdCBkaWZmZXJlbnQgYW5kIGEgZmV3IHJlZ2lzdGVyIG9mZnNldHMKPiBj
aGFuZ2VkLgo+IAo+IEludHJvZHVjZSBhIG5ldyBjb21wYXRpYmxlIHRvIHJlcHJlc2VudCB0aGlz
IHZlcnNpb24gb2YgdGhlIElQLgo+IAo+IEFsc28gYXBwZW5kICctY29udHJvbGxlcicgdG8gdGhl
IG5ldyBjb21wYXRpYmxlICh3aGljaCBpcyByZXF1aXJlZCBmb3IKPiBuZXcgY29tcGF0aWJsZXMp
IGFzIHRoaXMgaXMgZGVzY3JpYmluZyBhIE5BTkQgY29udHJvbGxlciBhbmQgbm90IGEKPiBOQU5E
IGNoaXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPiAtLS0KPiAKClNlcmllcyBhcHBsaWVkIHdpdGggdGhlIGNvbXBhdGlibGUg
YmVpbmcgQTIzIGluc3RlYWQgb2YgQTMzCmFuZCB0aGUgY29tcGF0aWJsZSBlbnVtZXJhdGlvbiBh
ZGFwdGVkIHRvIGZpdCB0aGUgeWFtbCBzeW50YXgKKGNoYW5nZSBmcm9tIGFub3RoZXIgc2VyaWVz
KSB0bzogCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210
ZC9saW51eC5naXQgCmJyYW5jaCBuYW5kL25leHQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
