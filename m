Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C414EC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Nov 2023 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQWbqaPG1KG19GE/et1Rs6YDcF7MrhLcHuUNIv9/7r0=; b=ecWehLQH64BPVB
	AHU5WMIUSD/0WnJhVpNhfUwzw5cgzVWzobn/L6reuNnw6senJ5jVimzeHUKjlgZGkXVH0kufr7qYD
	spEKCB7iQfrIGNXXnlThLyM5pWPthESOXImAaupq/4tjrNaLPbsqOH1L71ApyoR/lFvWinHcMZP0t
	nj5QUjxzMzvk8Ncr5Zj8LfB8QiJ6MzO+zkyiHddkVPkGI593r1aEyMwsUzYASqeajiyJckETzDQPp
	PRKurbqmFprkqyA4EUWz0qtTyB7swW6uZnBO/wu7X1o6/AuYQi2zBYnG/FyMEBajo02SdUSqtoxtf
	32FqkdPPdeXxx6MS/+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2oXr-00FMoM-2T;
	Tue, 14 Nov 2023 08:13:15 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2oXo-00FMnc-2V
	for linux-mtd@lists.infradead.org;
	Tue, 14 Nov 2023 08:13:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E137A1BF209;
	Tue, 14 Nov 2023 08:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699949586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdNblzkd8F7iiAV5Qi3t38lgqoePxjurhUeqg9MBO/k=;
	b=hc7uwVIXgWs6Z3zi3h5HjploxX2lsNJSxN+seHqwKtsJJ+uUgZAiBnStvTNjr6hQOobTNS
	Y2E90a4lclhzFlY3fwd1Y6YoiHd54zvxCc5xhbdPI1ZmSkMgTlnFqxeN4KN98a5o9UB48x
	1gbCMwCbvvXo7iqZHvCCLlvjlEnvN1zQ5CynNfR7s1r5wUDTaZomf69xN8B+KdmumQjNvC
	KtPTxcCR3LHsmpQ3I4zD5TOK9v6oIe4yLICTJ/fw+f82gw0PXya2gv6GyFsJ325G8J6Daq
	axlCn4s9XsI0CvoXZngsVpavEGmS5Nz4J6c3nqSHvEUHICHaXdp9Fse11yan/A==
Date: Tue, 14 Nov 2023 09:13:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ronald Monthero <debug.penguin32@gmail.com>
Cc: andriy.shevchenko@linux.intel.com, richard@nod.at, vigneshr@ti.com,
 heiko@sntech.de, martin.blumenstingl@googlemail.com, paul@crapouillou.net,
 robh@kernel.org, u.kleine-koenig@pengutronix.de, AVKrasnov@sberdevices.ru,
 r.czerwinski@pengutronix.de, jaimeliao.tw@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, Thierry Reding
 <treding@nvidia.com>
Subject: Re: [PATCH v3] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand
 controller response
Message-ID: <20231114091302.1f865d66@xps-13>
In-Reply-To: <20231113173251.623268-1-debug.penguin32@gmail.com>
References: <ZVJJAReXiEVc35HZ@smile.fi.intel.com>
	<20231113173251.623268-1-debug.penguin32@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_001313_126239_CFDC5FE7 
X-CRM114-Status: GOOD (  16.47  )
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

SGkgUm9uYWxkLAoKZGVidWcucGVuZ3VpbjMyQGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE0IE5v
diAyMDIzIDAzOjMyOjQ5ICsxMDAwOgoKPiBVbmRlciBoZWF2eSBsb2FkIGl0IGlzIGxpa2VseSB0
aGF0IHRoZSBjb250cm9sbGVyIGlzIGRvbmUKPiB3aXRoIGl0cyBvd24gdGFzayBidXQgdGhlIHRo
cmVhZCB1bmxvY2tpbmcgdGhlIHdhaXQgaXMgbm90Cj4gc2NoZWR1bGVkIGluIHRpbWUuIEluY3Jl
YXNpbmcgSUZDX1RJTUVPVVRfTVNFQ1MgYWxsb3dzIHRoZQo+IGNvbnRyb2xsZXIgdG8gcmVzcG9u
ZCB3aXRoaW4gYWxsb3dhYmxlIHRpbWVzbGljZSBvZiAxIHNlYy4KPiAKPiBmc2wsaWZjLW5hbmQg
N2U4MDAwMDAubmFuZDogQ29udHJvbGxlciBpcyBub3QgcmVzcG9uZGluZwo+IAo+IFs8ODA0YjIw
NDc+XSAobmFuZF9nZXRfZGV2aWNlKSBmcm9tIFs8ODA0YjUzMzU+XSAobmFuZF93cml0ZV9vb2Ir
MHgxYi8weDRhKQo+IFs8ODA0YjUzMzU+XSAobmFuZF93cml0ZV9vb2IpIGZyb20gWzw4MDRhMzU4
NT5dIChtdGRfd3JpdGUrMHg0MS8weDVjKQo+IFs8ODA0YTM1ODU+XSAobXRkX3dyaXRlKSBmcm9t
IFs8ODA0YzFkNDc+XSAodWJpX2lvX3dyaXRlKzB4MTdmLzB4MjJjKQo+IFs8ODA0YzFkNDc+XSAo
dWJpX2lvX3dyaXRlKSBmcm9tIFs8ODA0YzA0N2I+XSAodWJpX2ViYV93cml0ZV9sZWIrMHg1Yi8w
eDFkMCkKPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwoKSSBiZWxpZXZlIHRoZSBGaXhl
cyB0YWcgaXMgdGhlIGxhdGVzdCBtaXNzaW5nIHBpZWNlPwoKPiBTaWduZWQtb2ZmLWJ5OiBSb25h
bGQgTW9udGhlcm8gPGRlYnVnLnBlbmd1aW4zMkBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2ZzbF9pZmNfbmFuZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvZnNsX2lmY19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfaWZjX25h
bmQuYwo+IGluZGV4IDIwYmIxZTBjYjVlYi4uZjBlMjMxOGNlMDg4IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9pZmNfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvZnNsX2lmY19uYW5kLmMKPiBAQCAtMjEsNyArMjEsNyBAQAo+ICAKPiAgI2RlZmluZSBF
UlJfQllURQkJMHhGRiAvKiBWYWx1ZSByZXR1cm5lZCBmb3IgcmVhZAo+ICAJCQkJCWJ5dGVzIHdo
ZW4gcmVhZCBmYWlsZWQJKi8KPiAtI2RlZmluZSBJRkNfVElNRU9VVF9NU0VDUwk1MDAgIC8qIE1h
eGltdW0gbnVtYmVyIG9mIG1TZWNzIHRvIHdhaXQKPiArI2RlZmluZSBJRkNfVElNRU9VVF9NU0VD
UwkxMDAwIC8qIE1heGltdW0gdGltZW91dCB0byB3YWl0Cj4gIAkJCQkJZm9yIElGQyBOQU5EIE1h
Y2hpbmUJKi8KPiAgCj4gIHN0cnVjdCBmc2xfaWZjX2N0cmw7CgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
