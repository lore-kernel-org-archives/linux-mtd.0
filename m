Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEC3C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:25:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433E72064A
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:25:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGCZz6yp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WjhfoWsv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 433E72064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51rX8PQVxCpjVljhe976KgiscrljpU/wEQu/YN0Gv24=; b=MGCZz6ypBlZX1U
	LZLa8w1vJsgUdJmA0yPIkFwcTaLSxHpJZKxGPiS79PwYe1bIguvUzNiB+wpoVpso2Uj+QqNa1qiFu
	vwzEsK6a3motjziMyg0GdhACA7imeoTFZqUy9o3QKSDXrx9HMlVw08VZtcfVyxSTctK6qMeaBTZdy
	4SDQA8ihGAtyqniTuXq44eS6Ml3U8fh5R2YZ/fOPUcSaMwgGwB38c4Ar3fB7CxQPyciBRkNUh0WDt
	1D6zfXZNRTw3i26zBFWTyiGNJAIfazf8TK9Ke85knDh8ZqRE7+Tin+V2zMLvatC9stkOk8X4AacGZ
	acEjULPBXesZ9pwXA9Ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhkz-0002Nz-38; Wed, 17 Apr 2019 10:25:33 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhkx-0002Nm-FK
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 10:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O9AYQigjoc90URyMGpWlwUZ2oZU/snnFvoPQtBiu154=; b=WjhfoWsvi0eA/F7Jnwz73A/MgL
 /3gx7Oy6GqItjXr7csbIxkqw6UPjHIcyFHkYPijtWZcELKE3znHCexzPwaacUqmDarZ60mjiG9BAB
 XHW7mXj5ZhNSfl28auhau1c3fDKffimMW6h2a2s/PMXAxmBEHn5tcAC3N1rgEqrf0PptLYLrJ7dhk
 cz7BL2IeXLjTkUKXebjupJM76/shv30FYMxh3+33v+ymSjDYbaDDjLCuCwqR8EAWHHroAosMp3R9N
 82C5iQ74JKs3fFOqg6sb7boOXECGfD7G/Q79mUT5FY5Gcep7rPOCMXVMWz/fjJ6rAjDhJ8yKEDn49
 JPbNL5Wg==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhkt-00084j-S9
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:25:29 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CB60BE0008;
 Wed, 17 Apr 2019 10:24:33 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:24:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 04/14] mtd: rawnand: gpmi: remove unused variable
Message-ID: <20190417122432.340cb030@xps13>
In-Reply-To: <20190409113421.3037-5-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-5-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_062528_067978_31AC3A61 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjExICswMjAwOgoKPiBTaWduZWQtb2ZmLWJ5OiBTYXNj
aGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCgpNaXNzaW5nIGNvbW1pdCBs
b2cgKGV2ZW4gaWYgdGhlIHBhdGNoIGlzIHRyaXZpYWwuLi4pCgpXaXRoIHRoZSBtaXNzaW5nIGNv
bW1pdCBtZXNzYWdlOgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cgo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5k
LmggfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5oIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5oCj4gaW5kZXggZTZiNTg4Yzc3ZjJm
Li41Y2Q1NGMzYTY1ZGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1u
YW5kL2dwbWktbmFuZC5oCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dw
bWktbmFuZC5oCj4gQEAgLTE1NCw5ICsxNTQsNiBAQCBzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgewo+
ICAjZGVmaW5lIERNQV9DSEFOUwkJOAo+ICAJc3RydWN0IGRtYV9jaGFuCQkqZG1hX2NoYW5zW0RN
QV9DSEFOU107Cj4gIAlzdHJ1Y3QgY29tcGxldGlvbglkbWFfZG9uZTsKPiAtCj4gLQkvKiBwcml2
YXRlICovCj4gLQl2b2lkCQkJKnByaXZhdGU7Cj4gIH07Cj4gIAo+ICAvKiBCQ0ggOiBTdGF0dXMg
QmxvY2sgQ29tcGxldGlvbiBDb2RlcyAqLwoKCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
