Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ECDC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 10:33:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF5920409
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 10:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="etP2agvb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF5920409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJnGji52hH97AVBg/QGpmObogBKy/4d06fS2dqfj2zk=; b=etP2agvboy1aJ/
	yRxEhvnr7OAYJCp4OJqvAt8EqqJUC4Q1ygCvaaFhplOnTsPbHTyRWyuZGhs+wrCqFGL8ptayDztUc
	hLYQSvsjCeBmQR9eWKHqWMA04KKF8daSDLdp+VXRsXtIe3UzzfIYielERID/+h7nv/LQFYLhdRruJ
	RnwK7mbzkztGk1sSWhOrh86o7z12YrHIrIM13zLtRQFcJxCSVeEkTkZHGEOvFWlbd/I2eE0Y8KpqI
	wqqwcq0n3n6NrbV376H69sF8g7TpPbft3Gxy0cXgjEpmaZaOTFQ5TM1D55LRTm95/RDb4inbqVQRF
	TB2DAu3+UQfgB/HcPYGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBFip-0007bB-Jt; Mon, 09 Mar 2020 10:33:19 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBFim-0007XK-Hi
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 10:33:18 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 708D81C001A;
 Mon,  9 Mar 2020 10:32:57 +0000 (UTC)
Date: Mon, 9 Mar 2020 11:32:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH v5 0/6] Add new series Micron SPI NAND devices
Message-ID: <20200309113256.6c6751f8@xps13>
In-Reply-To: <20200228150311.12184-1-sshivamurthy@micron.com>
References: <20200228150311.12184-1-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_033316_718300_21A0F397 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDI4IEZl
YiAyMDIwIDE2OjAzOjA1ICswMTAwOgoKPiBGcm9tOiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hp
dmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAKPiBUaGlzIHBhdGNoc2V0IGlzIGZvciB0aGUgbmV3IHNl
cmllcyBvZiBNaWNyb24gU1BJIE5BTkQgZGV2aWNlcywgYW5kIHRoZQo+IGZvbGxvd2luZyBsaW5r
cyBhcmUgdGhlaXIgZGF0YXNoZWV0cy4KPiAKPiBNNzhBOgo+IFsxXSBodHRwczovL3d3dy5taWNy
b24uY29tL34vbWVkaWEvZG9jdW1lbnRzL3Byb2R1Y3RzL2RhdGEtc2hlZXQvbmFuZC1mbGFzaC83
MC1zZXJpZXMvbTc4YV8xZ2JfM3ZfbmFuZF9zcGkucGRmCj4gWzJdIGh0dHBzOi8vd3d3Lm1pY3Jv
bi5jb20vfi9tZWRpYS9kb2N1bWVudHMvcHJvZHVjdHMvZGF0YS1zaGVldC9uYW5kLWZsYXNoLzcw
LXNlcmllcy9tNzhhXzFnYl8xXzh2X25hbmRfc3BpLnBkZgo+IAo+IE03OUE6Cj4gWzNdIGh0dHBz
Oi8vd3d3Lm1pY3Jvbi5jb20vfi9tZWRpYS9kb2N1bWVudHMvcHJvZHVjdHMvZGF0YS1zaGVldC9u
YW5kLWZsYXNoLzcwLXNlcmllcy9tNzlhXzJnYl8xXzh2X25hbmRfc3BpLnBkZgo+IFs0XSBodHRw
czovL3d3dy5taWNyb24uY29tL34vbWVkaWEvZG9jdW1lbnRzL3Byb2R1Y3RzL2RhdGEtc2hlZXQv
bmFuZC1mbGFzaC83MC1zZXJpZXMvbTc5YV9kZHBfNGdiXzN2X25hbmRfc3BpLnBkZgo+IAo+IE03
MEE6Cj4gWzVdIGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vfi9tZWRpYS9kb2N1bWVudHMvcHJvZHVj
dHMvZGF0YS1zaGVldC9uYW5kLWZsYXNoLzcwLXNlcmllcy9tNzBhXzRnYl8zdl9uYW5kX3NwaS5w
ZGYKPiBbNl0gaHR0cHM6Ly93d3cubWljcm9uLmNvbS9+L21lZGlhL2RvY3VtZW50cy9wcm9kdWN0
cy9kYXRhLXNoZWV0L25hbmQtZmxhc2gvNzAtc2VyaWVzL203MGFfNGdiXzFfOHZfbmFuZF9zcGku
cGRmCj4gWzddIGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vfi9tZWRpYS9kb2N1bWVudHMvcHJvZHVj
dHMvZGF0YS1zaGVldC9uYW5kLWZsYXNoLzcwLXNlcmllcy9tNzBhX2RkcF84Z2JfM3ZfbmFuZF9z
cGkucGRmCj4gWzhdIGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vfi9tZWRpYS9kb2N1bWVudHMvcHJv
ZHVjdHMvZGF0YS1zaGVldC9uYW5kLWZsYXNoLzcwLXNlcmllcy9tNzBhX2RkcF84Z2JfMV84dl9u
YW5kX3NwaS5wZGYKPiAKPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+IC0tLS0tLS0tLS0tLS0tLS0tCj4g
Cj4gMS4gUGF0Y2ggMiBpcyBzZXBhcmF0ZWQgaW50byB0d28gYXMgcGVyIHRoZSBjb21tZW50IGJ5
IEJvcmlzLgo+IDIuIFJlbmFtZWQgTUlDUk9OX0NGR19DT05USV9SRUFEIGludG8gTUlDUk9OX0NG
R19DUi4KPiAzLiBSZXdvcmtlZCBkaWUgc2VsZWN0aW9uIGZ1bmN0aW9uIGFzIHBlciB0aGUgY29t
bWVudCBieSBCb3Jpcy4KCkkgd2FzIGFib3V0IHRvIGFwcGx5IHRoaXMgc2VyaWVzIGJ1dCB1bmZv
cnR1bmF0ZWx5IGl0IGlzIG5vdCBiYXNlZCBvbgp2NS42LXJjMSBzbyBubyBwYXRjaCBhcHBsaWVz
IGNvcnJlY3RseS4gQ2FuIHlvdSBwbGVhc2UgcmViYXNlIGFuZCBzZW5kCmEgdjYgc29vbj8KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
