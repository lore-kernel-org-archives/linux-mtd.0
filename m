Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CB9D3B7DD
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nehvEgMi1VV/vltAWQrtslWfsknVqMJHB6laWV8ZLSc=; b=DfuH4RrKTVyV+f
	Ac81sUhACRMbZeGo7eLWaILuG7jfIkzP10xM1aZcWhCf4INjEVzlwYO6KZDMJ3ZBHEwR+BM/btDI5
	xbZ1bZGcCMiSWfwchyap4AktA3TXKu5djbyPLuwfo2yWzZR001sn5pujDVp5XaMCifme5nkVdXjzi
	7uTkzAI2oC4mjSdjpet9pfo81DUH8ED+J06DPZLc5O0Zmzhot7mvqki39yFDbb+/98Nbmh0nBdsO6
	ro6BJciXoDr7DraoyjUfwu4fE74v31009OFZWsaEsIYzoa1x+AL+g4QzI/S8vM674biKN2XRn8PAS
	n2SSTNiH9Am7EB+5nxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWgi-0000000CobP-3keM;
	Mon, 08 Dec 2025 08:33:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWgf-0000000Coay-3REv
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 08:33:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 82B044E41AE3;
	Mon,  8 Dec 2025 08:33:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5757260707;
	Mon,  8 Dec 2025 08:33:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 328BD102F0D51;
	Mon,  8 Dec 2025 09:33:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765182813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RX7mxueZg8iuSmvrZ1O6GvNB5P6C4zF/+3N1wIaPWHU=;
	b=cPLHSFUTe+rrK4PEEjeQBAjYLwmw90z0RRUAq6M0ChKXiwgYC1VVxrzioF7P29GSjBTqyI
	maux5kh2NDZhuGuAEaI6JEt4w40QB5smua7wndI7TVNaAF+hzXn4HiBkA3L9QoriIpSLNR
	opIEjT3Zbp/Za1TPe1h+Bwlk0CW1YbGvEtuF9lV50yorng0mMSto+7NTrK7FtMTVcf6ijB
	ckgjx57M0238bzO8Qt57LhxQ7aGS3Y6Q1tJ5lBgl8SmlxGCxLaEVaQW0uieV2U7MhYi9+C
	J4nhFWtjs7M+SaAlIJk6dxxx6ZUo8FErrhxq4J9JoljAvcI5KjE6d6tx0TCGdQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: richard@nod.at,  vigneshr@ti.com,  tudor.ambarus@linaro.org,
  mmkurbanov@salutedevices.com,  george.moussalem@outlook.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "mtd: spinand: esmt: fix id code for F50D1G41LB"
In-Reply-To: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
	(Ziyang Huang's message of "Tue, 2 Dec 2025 23:05:56 +0800")
References: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 08 Dec 2025 09:33:28 +0100
Message-ID: <87wm2x74pz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_003342_176973_8DB16DAD 
X-CRM114-Status: UNSURE (   8.78  )
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

T24gMDIvMTIvMjAyNSBhdCAyMzowNTo1NiArMDgsIFppeWFuZyBIdWFuZyA8aHp5aXRjQG91dGxv
b2suY29tPiB3cm90ZToKCj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkZDI2NDAyNjQyYTA4OTlmZGU1
OWVhNmIwODUyZmFkM2Q3OTliNGNjLgo+Cj4gVGhlIGlzc3VlIEdlb3JnZSBtZXQgaXMgZHVlIHRv
IHRoZSBsaW1pdCBvZiBRUElDLCBub3QgdGhlIGlzc3VlIG9mIHRoZQo+IGZsYXNoIGNoaXAuCj4K
PiBRUElDIG9ubHkgc3VwcG9ydHMgNCBieXRlcyBJRC4gU28gdGhlIGZpZnRoIGJ5dGUgaXMgYWx3
YXlzIDAuCj4KPiBJZiB3ZSB1c2Ugc3BpLWdwaW8sIHRoZSBmaWZ0aCBieXRlIGNhbiBiZSByZWFk
IGNvcnJlY3RseS4KPgo+IFNpZ25lZC1vZmYtYnk6IFppeWFuZyBIdWFuZyA8aHp5aXRjQG91dGxv
b2suY29tPgo+IC0tLQoKU28gaG93IGRvIHdlIHNvbHZlIHRoYXQ/CgpJcyB0aGVyZSBhbnl0aGlu
ZyB0aGFuIGNhbiBiZSBkb25lIG9uIHRoZSBxcGljIHNpZGU/CgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
