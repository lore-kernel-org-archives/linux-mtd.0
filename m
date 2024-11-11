Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A54BD3ABF0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 18:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kky5M+MfZDGRh3YarRQ52Jy1hkelltCTdqpXErhkpQU=; b=Yez7AztipjrJ7q
	d2/mw61biUqfguc24VdBic5uESHXZVHZkWaGDOokT0qQcBzjCUgq/qK1S7X7rTqwOF8LCDpz29VC7
	ooxznI75f5iN+At5OCcZ9koJueqRU8Ov8Le0dW5Tvi7kK6bJtAeCqF0AKvyLEwi9ddhVGwdlZbRfU
	xEtH1NVK/oIaOOn8BMacsjUya9JMxNVfbED8Z3+5G9ooe6iawVDwKx2QCIM/YbIYBANcosz4HYQDQ
	ukUEDjmh/Q9SyR0iLZ6Juan5kLa7Fior17PVRSVaVByB1x0+Hq+64LF9GAFgsrsH0KdYMa0YIwv/z
	b5z425ZKSnWLhZqciMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZYv-00000000yJy-2QTc;
	Mon, 11 Nov 2024 18:54:57 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZYs-00000000yI5-0GyD
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 18:54:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6052B60003;
	Mon, 11 Nov 2024 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731351291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIJCVHt9pMJe7or1KDdCKZdkmikACXhj0z4eRxt+ijM=;
	b=TyzdJaFH6FWSgFxQ0vgD8hU5N6Sd5av0RRzx7vcARX3ncrXI6/3QqDHAxIgrRY/W8nGnjP
	B7brwWzXSFAGyQegXsJboFewlY0VBRMCIO+mpbf+bupjk6ZKGNKXyPXVDLruCxV9EONr1L
	j6y2ZL4KrWdiK6ok7WnrczMOi015hvkIHYrpixZxgQvAv3q8d2TXo2W1q00piWNpMqsgPR
	b3Ioa/qx5uhpRidrg/Q8kDmE9/dEQ0JTva6H1okfqWStluel0LfHtaRa60CH9Ue8FTdhAt
	GrArI/RYfsPHjNzUjIZis4UYGVtvjdfmp9gomvsLM7wGfOQjZTlVa371hMK7EQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  richard@nod.at,  vigneshr@ti.com,
  tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  kr.kim@skyhighmemory.com,  zhi.feng@skyhighmemory.com,
  Bacem.Daassi@infineon.com,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spinand: Introduce a way to avoid raw access
In-Reply-To: <81c9caf04c94cba1a5ae4ba79dd09e0789583fcd.1730340421.git.Takahiro.Kuwano@infineon.com>
	(tkuw's message of "Thu, 31 Oct 2024 11:21:54 +0900")
References: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
	<81c9caf04c94cba1a5ae4ba79dd09e0789583fcd.1730340421.git.Takahiro.Kuwano@infineon.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 19:54:47 +0100
Message-ID: <87bjylsirs.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_105454_258704_DCDC30D7 
X-CRM114-Status: GOOD (  10.17  )
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

SGksCgpPbiAzMS8xMC8yMDI0IGF0IDExOjIxOjU0ICswOSwgdGt1dzU4NDkyNEBnbWFpbC5jb20g
d3JvdGU6Cgo+IEZyb206IFRha2FoaXJvIEt1d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9u
LmNvbT4KPgo+IFNreUhpZ2ggc3BpbmFuZCBkZXZpY2UgaGFzIEVDQyBlbmFibGUgYml0IGluIGNv
bmZpZ3VyYXRpb24gcmVnaXN0ZXIgYnV0Cj4gaXQgbXVzdCBiZSBhbHdheXMgZW5hYmxlZC4gSWYg
RUNDIGlzIGRpc2FibGVkLCByZWFkIGFuZCB3cml0ZSBvcHMKPiByZXN1bHRzIGluIHVuZGV0ZXJt
aW5lZCBzdGF0ZS4gRm9yIHN1Y2ggZGV2aWNlcywgYSB3YXkgdG8gYXZvaWQgcmF3Cj4gYWNjZXNz
IGlzIG5lZWRlZC4KPgo+IEludHJvZHVjZSBTUElOQU5EX05PX1JBV19BQ0NFU1MgZmxhZyB0byBh
ZHZlcnRpc2UgdGhlIGRldmljZSBkb2VzIG5vdAo+IHN1cHBvcnQgcmF3IGFjY2Vzcy4gUmVhZCBh
bmQgd3JpdGUgcGFnZSBpbiByYXcgbW9kZSBmb3IgdGhlIGRldmljZQo+IHJldHVybnMgZXJyb3Iu
Cj4KPiBDaGVja2luZyBhbmQgbWFya2luZyBCQk0gbmVlZCB0byBiZSBwZXJmb3JtZWQgd2l0aCBF
Q0MgZW5hYmxlZCB0byByZWFkCj4gYW5kIHdyaXRlIHRoZSBCQk0gY29ycmVjdGx5LgoKSSBzZWUg
eW91ciBwb2ludCBidXQgSSdtIGEgYml0IHB1enpsZWQgYnkgaG93IGl0J3MgYmVpbmcgZG9uZS4K
CkZpcnN0LCB5b3UgZGlzcmVnYXJkIGNvbXBsZXRlbHkgdGhlIGlzYmFkKCkgYW5kIG1hcmtiYWQo
KQpzaXR1YXRpb25zLiBQbGVhc2UgaGF2ZSBsb29rIGludG8gdGhhdCBiZWNhdXNlIHRoZXNlIGZ1
bmN0aW9ucyBhcmUKYnJva2VuIHdpdGggeW91ciBkZXZpY2VzLgoKU2Vjb25kLCB3aGF0IGFib3V0
IGFkZGluZyB0aGlzIGRldGFpbCB0byB0aGUgb25kaWUgRUNDIGVuZ2luZT8gWW91IGNvdWxkCnNp
bXBseSByZXR1cm4gYW4gZXJyb3IgZnJvbSB0aGVyZSwgc28gYmFzaWNhbGx5IGEgc2luZ2xlIChv
ciBtYXliZSB0d28pCmNoYW5nZXMgb3ZlcmFsbC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
