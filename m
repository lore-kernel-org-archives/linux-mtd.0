Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7639C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872572173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X+4BvWY2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NbPBsvNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872572173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBMAqzUjgoe0FLB3nL3Ht27tCZOLc9BNopwBwswSzWM=; b=X+4BvWY2FtnMQA
	hZ3USxWZGyPuAqW2OknYPD4s0Yp1aOd0prqxTGenjlyquE5gFlIU5eFlEoH41m3J6fI8qgAIED4S9
	4fdrXGPg+822126AsZeeCuG+3+Qk1bDW64kLDDy+P0m1Y1WwDAhdwZrazeSOLBV3wMmF0VTIbHoK3
	KJNh96KXlZbPJc1txrCwA02taHmhGOOA4u9CiNYKT3eSKWfyHxEub4v0CgxObu2s11mZGNBr3uo8X
	se+GSCkaz+M9tNpE/gUvOIHCKAwFNq5GxlkTCIkOj3apq+de26zrMFaF8KlY+pKIxvQ8zB7muCLOq
	y4F1+omq3kekJt/qEiEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0Kl-0005RP-7K; Tue, 21 May 2019 08:41:19 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0Kj-0005RE-9B
 for linux-mtd@bombadil.infradead.org; Tue, 21 May 2019 08:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/yGaWTxMFFtQ3fSlRM/6mR8be/j5plDg7vieU95PhdM=; b=NbPBsvNWjCfzq4g/z0NEOvIZn6
 PCe8YBxpRaeEMh13cDNL6pZeTX8xPTNP3KZ75B6uxC+K+RrQSxVWWDMuChzf2lGAHbQWQ+/5Wc1T3
 SGmE2IKkXDN1mmE5XZS0KBYP0BWiVHaf3ZbU9jbycX7JyPJshTqGFyemMfO5mDm3+yrgTolqQixL/
 LICtrusBl5BVpdQ/6WG0wZQ5jIGCv5g7BMLp4Da3T51g6pPQ9vzBwCuSMKfcX+qcSyvEtkk2ibA9R
 jA3BQwomOU2kdlt3qTzYUjoCS/e2JM4hScxfBIcurLxjLXbVhFe4rPGP8xWRYW6grp+n3PaVHifQk
 VjSnHhrQ==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0Kf-0000Hx-Tx
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:41:15 +0000
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1829D100015;
 Tue, 21 May 2019 08:40:41 +0000 (UTC)
Date: Tue, 21 May 2019 10:40:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 03/14] mtd: rawnand: gpmi: move all driver code into
 single file
Message-ID: <20190521104041.481b13c1@xps13>
In-Reply-To: <20190521083421.l5gvl3xrrbwd352j@pengutronix.de>
References: <20190521070643.6244-1-s.hauer@pengutronix.de>
 <20190521070643.6244-4-s.hauer@pengutronix.de>
 <20190521083421.l5gvl3xrrbwd352j@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_044114_097293_77D091B8 
X-CRM114-Status: GOOD (  19.02  )
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
Cc: Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Richard Weinberger <richard@nod.at>,
 Han Xu <han.xu@nxp.com>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsIDIxIE1heSAyMDE5CjEwOjM0OjIxICswMjAwOgoKPiBPbiBUdWUsIE1heSAyMSwgMjAx
OSBhdCAwOTowNjozMkFNICswMjAwLCBTYXNjaGEgSGF1ZXIgd3JvdGU6Cj4gPiBUaGlzIG1vdmVz
IHRoZSB3aG9sZSBkcml2ZXIgaW50byBhIHNpbmdsZSBDIGZpbGUuIFRoZSBmaWxlbmFtZSBncG1p
LWxpYgo+ID4gaW1wbGllcyB0aGF0IGl0IGltcGxlbWVudHMgbGlicmFyeSBmdW5jdGlvbnMsIGJ1
dCBpbiBmYWN0IHRoZXJlIGFyZQo+ID4gc2V2ZXJhbCBjYXNlcyB3aGVyZSBmdW5jdGlvbnMgaW4g
Z3BtaS1saWIuYyBjYWxsIGJhY2sgaW50byBmdW5jdGlvbnMgaW4KPiA+IGdwbWktbmFuZC5jLiBX
aXRoIHRoaXMgb25lIGhhcyB0byBjb25zdGFudGx5IGp1bXAgYmV0d2VlbiB0aG9zZSB0d28KPiA+
IGZpbGVzLCBzbyBtb3ZpbmcgaXQgaW50byBhIHNpbmdsZSBmaWxlIGltcHJvdmVzIHJlYWRhYmls
aXR5LCBldmVuIHdoZW4KPiA+IHRoZSBmaWxlIGdldHMgcXVpdGUgbGFyZ2UuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiA+IFJl
dmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL01ha2VmaWxlICAgIHwgICAg
MSAtCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbGliLmMgIHwgIDky
MyAtLS0tLS0tLS0tLS0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1p
LW5hbmQuYyB8IDEyNjkgKysrKysrKysrKysrKysrKystLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmggfCAgIDM0IC0KPiA+ICA0IGZpbGVzIGNoYW5nZWQs
IDEwOTUgaW5zZXJ0aW9ucygrKSwgMTEzMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9NYWtlZmlsZSBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2dwbWktbmFuZC9NYWtlZmlsZQo+ID4gaW5kZXggM2E0NjI0ODdjMzVlLi42MGM3
YjZmODdjNTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQv
TWFrZWZpbGUKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9NYWtlZmls
ZQo+ID4gQEAgLTEsMyArMSwyIEBACj4gPiAgb2JqLSQoQ09ORklHX01URF9OQU5EX0dQTUlfTkFO
RCkgKz0gZ3BtaV9uYW5kLm8KPiA+ICBncG1pX25hbmQtb2JqcyArPSBncG1pLW5hbmQubwo+ID4g
LWdwbWlfbmFuZC1vYmpzICs9IGdwbWktbGliLm8KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1saWIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dw
bWktbmFuZC9ncG1pLWxpYi5jCj4gPiBpbmRleCBhOGIyNmQyZTc5M2MuLmJjYzkyMTg1Mzg0YSAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLWxpYi5j
Cj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1saWIuYwo+ID4g
QEAgLTksOTI2ICs5LDMgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gPiAgI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4gIAo+IAo+IE9vcHMsIGdwbWktbGliLmMgc2hvdWxkIGJlIGNvbXBs
ZXRlbHkgcmVtb3ZlZCBoZXJlLiBQbGVhc2UgdXNlIHRoZQo+IGZvbGxvd2luZyB2ZXJzaW9uIG9m
IHRoaXMgcGF0Y2guCj4gCgpEb25lLgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
