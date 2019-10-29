Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EC3CA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:27:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0396020663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZiO6g5gX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0396020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJPGY8/xV9TcktSxvBkRxkIRrjKvaH0VkUVY1KUES/Q=; b=ZiO6g5gXJ5Wme+
	nMe00bNRkVrTFNJuWaK67Z+YvNRqsQINzQo4bkipSb4y9QQvXrCll6ZOj+ASgETNguV+xff7l9RSg
	sih83aMqNRSV6xfqr4pytF+kIT287IZLB7YiIl95NZWAGTgXzsk2w6NkYhjrKY7tPHt0rvGW5lcwU
	d/iSq5GSpECpcmG8Ji0yS7E3W80OQLkrnLeX1nj04ZCmEO+MFWvmzbZ5Q9bxeVtEoMNTVvwj6lGeO
	fWtKbCW4Qv4ndUo/Bepu8G726bbcwfUD6qzzHtYuxJR/QkbM+f8ys8VdfgqusMjDCbs3NASfR18Sv
	pOpVzx7A7gRpbzeWZkfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPeY-0005fX-Dy; Tue, 29 Oct 2019 11:27:10 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPaO-0000j6-8o
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:22:54 +0000
X-Originating-IP: 91.217.168.176
Received: from xps13 (unknown [91.217.168.176])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 943B840008;
 Tue, 29 Oct 2019 11:22:46 +0000 (UTC)
Date: Tue, 29 Oct 2019 12:22:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Subject: Re: [PATCH] mtd: devices: phram.c: Fix multiple kfree statement
 from phram_setup
Message-ID: <20191029122247.73e1c573@xps13>
In-Reply-To: <20191028181300.GA26250@saurav>
References: <20191028181300.GA26250@saurav>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_042252_600181_27EBD44F 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: vigneshr@ti.com, richard@nod.at, joern@lazybastard.org,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, saurav.girepunje@hotmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2F1cmF2LAoKU2F1cmF2IEdpcmVwdW5qZSA8c2F1cmF2LmdpcmVwdW5qZUBnbWFpbC5jb20+
IHdyb3RlIG9uIE1vbiwgMjggT2N0IDIwMTkKMjM6NDM6MDEgKzA1MzA6Cgo+IFJlbW92ZSBtdWx0
aXBsZSBrZnJlZSBzdGF0ZW1lbnQgZnJvbSBwaHJhbV9zZXR1cCgpIGluIHBocmFtLmMKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBTYXVyYXYgR2lyZXB1bmplIDxzYXVyYXYuZ2lyZXB1bmplQGdtYWlsLmNv
bT4KPiAtLS0KCkhlcmUgeW91IHNob3VsZCBhZGQgYSBjaGFuZ2Vsb2cgd2l0aCB0aGUgY2hhbmdl
cyB5b3UgaGF2ZSBkb25lIHNpbmNlCnRoZSBsYXN0IHZlcnNpb24uCgpBbHNvIHdoZW4gZm9ybWF0
dGluZyB0aGUgcGF0Y2ggdXNlIC12IDx4PiB0byBhZGQgYSB2ZXJzaW9uIHByZWZpeAppbnRvIHRo
ZSB0aXRsZSwgbGlrZSBbUEFUQ0ggdjx4Pl0uCgo+ICBkcml2ZXJzL210ZC9kZXZpY2VzL3BocmFt
LmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYyBi
L2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwo+IGluZGV4IGM0NjcyODZjYTAwNy4uMzhmOTVh
MTUxN2FjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwo+IEBAIC0yNDMsMjIgKzI0MywyMiBAQCBzdGF0
aWMgaW50IHBocmFtX3NldHVwKGNvbnN0IGNoYXIgKnZhbCkKPiAgCj4gIAlyZXQgPSBwYXJzZV9u
dW02NCgmc3RhcnQsIHRva2VuWzFdKTsKPiAgCWlmIChyZXQpIHsKPiAtCQlrZnJlZShuYW1lKTsK
PiAgCQlwYXJzZV9lcnIoImlsbGVnYWwgc3RhcnQgYWRkcmVzc1xuIik7Cj4gKwkJZ290byBmcmVl
X25hbTsKCnMvbmFtL25hbWUKCj4gIAl9Cj4gIAo+ICAJcmV0ID0gcGFyc2VfbnVtNjQoJmxlbiwg
dG9rZW5bMl0pOwo+ICAJaWYgKHJldCkgewo+IC0JCWtmcmVlKG5hbWUpOwo+ICAJCXBhcnNlX2Vy
cigiaWxsZWdhbCBkZXZpY2UgbGVuZ3RoXG4iKTsKPiArCQlnb3RvIGZyZWVfbmFtOwo+ICAJfQo+
ICAKPiAgCXJldCA9IHJlZ2lzdGVyX2RldmljZShuYW1lLCBzdGFydCwgbGVuKTsKPiAgCWlmICgh
cmV0KQo+ICAJCXByX2luZm8oIiVzIGRldmljZTogJSNsbHggYXQgJSNsbHhcbiIsIG5hbWUsIGxl
biwgc3RhcnQpOwo+IC0JZWxzZQo+IC0JCWtmcmVlKG5hbWUpOwo+ICAKPiArZnJlZV9uYW06Cj4g
KwlrZnJlZShuYW1lKTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
