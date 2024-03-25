Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D159C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 09:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1QD1JhELKUjC1yJWj7XSvZKtWNlmOS9xLZiul6IQNU=; b=hyKzAKrnosyQ1K
	DLXnnV8y5Wg3H4A0Q6bou9JjkDZG6MSGLotntKCNjNXewGnla+5XSj3biCwTjl1Gazrl//je4wY/m
	D829DOuRG0gmbtbqEWL9/Ogfsa6Rezk+InZkHHCQBIgkIV9QBfdN9B5RrJ+Wuy8/e3zF1ae3IaPlD
	D2l2rLDGf1FIylOAn3IDTZ7H7tH5gjqbaX/oDP3GtDLsrC6BHg5dlXVZcAiLR1jiofhELfbPP7kk/
	1DUHGuQw828L7R0fdYrQqJu74D05y9kM9QOoOrDtbne+dZhLBMJSdcNiTHKlSmLTydciTbOwsWsFs
	ZkgHjaBnbzCWA69D8MzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rogUb-0000000GPgb-14zd;
	Mon, 25 Mar 2024 09:19:45 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rogUT-0000000GPdH-0wXC
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 09:19:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2A8FC000E;
	Mon, 25 Mar 2024 09:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711358372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qU3idiONxQ8MOsIGn2G3Z38vry1Zi7EOzhSXkBaZx3c=;
	b=oQULipp7fpuoLENxFEYSzusTa1N+3RT+c29MLC61RSlUAX89wB4XuGe2h/91Is/HVsnDLe
	1JB5u38X7Yt6TEYS3+2WbV7uIBIBTYaaRoNGULhdRvDjj/qUh3KqiS1WjXWYJAJlnPuQba
	DvXrnZ1Ms9dX/jhDnqfFcCv8xtTg0ElkoUZEVRcittP8umfxjanofuuFPxuV3TyRlL8ANJ
	ASwAvZRvzp53EHJkUTgng/7li2TTo46X+0nj41A3KvDP3ppm9qda7+0QExcXYoy8AJLKhy
	2jj747yfAYmAv1ivg/v5IWzu2EsyLXRCXaQzGzOz9Q4BeZrEhKBQH6UIlHLPNA==
Date: Mon, 25 Mar 2024 10:19:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Sricharan
 Ramabadhran <quic_srichara@quicinc.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix broken misc_cmd_type in exec_op
Message-ID: <20240325101930.13ed914d@xps-13>
In-Reply-To: <20240322150510.GC3774@thinkpad>
References: <20240320001141.16560-1-ansuelsmth@gmail.com>
	<20240322150510.GC3774@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_021937_677426_A414B82C 
X-CRM114-Status: GOOD (  16.67  )
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

SGksCgptYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZyB3cm90ZSBvbiBGcmksIDIyIE1h
ciAyMDI0IDIwOjM1OjEwCiswNTMwOgoKPiBPbiBXZWQsIE1hciAyMCwgMjAyNCBhdCAwMToxMToz
OUFNICswMTAwLCBDaHJpc3RpYW4gTWFyYW5naSB3cm90ZToKPiA+IG1pc2NfY21kX3R5cGUgaW4g
ZXhlY19vcCBoYXZlIG11bHRpcGxlIHByb2JsZW1zLiBXaXRoIGNvbW1pdCBhODI5OTBjOGE0MDkK
PiA+ICgibXRkOiByYXduYW5kOiBxY29tOiBBZGQgcmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVj
X29wIHBhdGgiKSBpdCB3YXMKPiA+IHJld29ya2VkIGFuZCBnZW5lcmFsaXplZCBidXQgYWN0dWFs
bHkgZHJvcHBlZCB0aGUgaGFuZGxpbmcgb2YgdGhlCj4gPiBSRVNFVF9ERVZJQ0UgY29tbWFuZC4K
PiA+IAo+ID4gVGhlIHJld29yayBpdHNlbGYgd2FzIGNvcnJlY3Qgd2l0aCBzdXBwb3J0aW5nIGNh
c2Ugd2hlcmUgYSBzaW5nbGUgbWlzYwo+ID4gY29tbWFuZCBpcyBoYW5kbGVkLCBidXQgYmVjYW1l
IHByb2JsZW1hdGljIGJ5IHRoZSBhZGRpdGlvbiBvZiBleGl0aW5nCj4gPiBlYXJseSBpZiB3ZSBk
aWRuJ3QgaGFkIGFuIEVSQVNFIG9yIGFuIE9QX1BST0dSQU1fUEFHRSBvcGVyYXRpb24uCj4gPiAK
PiA+IEFsc28gYWRkaXRpb25hbCBsb2dpYyB3YXMgYWRkZWQgd2l0aG91dCBjbGVhciBleHBsYWlu
YXRpb24gY2F1c2luZyB0aGUKPiA+IGVyYXNlIGNvbW1hbmQgdG8gYmUgYnJva2VuIG9uIHRlc3Rp
bmcgaXQgb24gYSBpcHE4MDZ4IG5hbmRjLgo+ID4gICAKPiAKPiBJbnRlcmVzdGluZy4gSSBiZWxp
ZXZlIEFsYW0gdGVzdGVkIHRoZSByZXdvcmsgb24gSVBRIHBsYXRmb3JtcyBhbmQgbm90IHN1cmUg
aG93Cj4gaXQgZ290IG1pc3NlZC4KPiAKPiA+IEFkZCBzb21lIGFkZGl0aW9uYWwgbG9naWMgdG8g
cmVzdG9yZSBSRVNFVF9ERVZJQ0UgY29tbWFuZCBoYW5kbGluZyBhbmQKPiA+IGZpeCBlcmFzZSBj
b21tYW5kLgo+ID4gICAKPiAKPiBUaGlzIHNvdW5kcyBsaWtlIHR3byBpbmRlcGVuZGVudCBmaXhl
cywgbm8/IFBsZWFzZSBzcGxpdCB0aGVtIGludG8gc2VwYXJhdGUKPiBwYXRjaGVzLgoKTWlnaHQg
YmUgc3BsaXQgaW5kZWVkLiBAQ2hyaXN0aWFuLCBkbyB5b3UgcGxhbiBvbiBzZW5kaW5nIGEgdjI/
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
