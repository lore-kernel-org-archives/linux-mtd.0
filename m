Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4112C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g46BsXSs4J6fWWTBC9/rydioRYNMl5lnfNU8udD2AxQ=; b=4uuHahzh4/J9D9
	wl5moqR8PchfpJ87Tv++OZJ59sjO3YsNgzfV8OamEgbN14/6EtQSphvf0Pf7lDKnh12uAgA98kAjp
	sIUoOBeMB/1UqTlYae/37XIzlso2aGtB4o4BrUiANfaY3u9RfWzzaVbuS7WhWoNACtjepaBUBk8JR
	lpuSsEUEdtHJQ43D43MgLzfo3OIcmPUBLJ7ogGK03o0rkmUQoqwukcW2xSk+WYLaV6Pymb0ENY/N+
	kCTcndfzWItHW5RXzPbqROVOsPC9ZXYtU1WqcZ4e4kkkFDFAR/IfUDrQ+3HEdef+o6AZ9pQUL1btX
	YTWDS1LbgYjjpeCKdswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNFV-001A0W-2d; Thu, 06 Oct 2022 09:33:01 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNEj-0019YN-Po
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 09:32:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A2A80C000F;
	Thu,  6 Oct 2022 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665048729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjHVL/38CXAeYxrAeQ9axWybfLmZxCn1wRHKQgSsmsk=;
	b=nByDzAF7vFUEJOyiTSNV4fyHY8MRgDpGnmYUwpsKCMxpcQza7EuAE7OSZ5qTskkdl6gwJC
	Ku5ljEg1RbOHaPIZUuiKd2FMYe29TBXh1WEH9cgmRTQ8i8HjPGIjSPk+tZXXcYiwCuptWF
	Vk/ndBRgAVJBbKIfOd2wzeXtOYL6dNi/WeOMPtSgcw+NdIC9ZOhwDcVkJazCH9835dFOgx
	ffCycH+eGS76IlI12KAuPkZqNDm8Wga5Vjqhd5KsDerBY1C04hWW9BUfhc6vgyRKY4YCh7
	XlCvG4Vb2WS/ZaAOhjaDixnsxl/pv5zUq0tEL+8pik/YkqmeLIRuQEXUQ2fBeQ==
Date: Thu, 6 Oct 2022 11:32:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: mikhail.kshevetskiy@iopsys.eu, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] spi-nand: add Winbond W25N02KV flash support, fix
 Winbond flashes identifications
Message-ID: <20221006113207.7b81d45b@xps-13>
In-Reply-To: <d55465ac-fe0b-130c-31ae-0ce62af3eb5f@kontron.de>
References: <20221006033256.111664-1-mikhail.kshevetskiy@iopsys.eu>
	<d55465ac-fe0b-130c-31ae-0ce62af3eb5f@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_023214_050997_7FAB2CB1 
X-CRM114-Status: GOOD (  15.81  )
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

SGkgRnJpZWRlciwKCmZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZSB3cm90ZSBvbiBUaHUsIDYg
T2N0IDIwMjIgMTE6MjY6NDUgKzAyMDA6Cgo+IEFtIDA2LjEwLjIyIHVtIDA1OjMyIHNjaHJpZWIg
bWlraGFpbC5rc2hldmV0c2tpeUBpb3BzeXMuZXU6Cj4gPiAKPiA+IEZyb206IE1pa2hhaWwgS3No
ZXZldHNraXkgPG1pa2hhaWwua3NoZXZldHNraXlAaW9wc3lzLmV1Pgo+ID4gCj4gPiBXaW5ib25k
IHVzZXMgMyBieXRlcyB0byBpZGVudGlmeSBmbGFzaDogdmVuZG9yX2lkLCBkZXZfaWRfMCwgZGV2
X2lkXzEsCj4gPiBidXQgY3VycmVudCBkcml2ZXIgdXNlcyBvbmx5IGZpcnN0IDIgYnl0ZXMgb2Yg
aXQgZm9yIGRldmljZXMKPiA+IGlkZW5maWZpY2F0aW9uLiBBcyByZXN1bHQgV2luYm9uZCBXMjVO
MDJLViBmbGFzaCAoaWRfYnl0ZXM6IEVGLCBBQSwgMjIpCj4gPiBpcyBpZGVudGlmaWVkIGFzIFcy
NU4wMUdWIChpZF9ieXRlczogRUYsIEFBLCAyMSkuCj4gPiAKPiA+IEZpeCB0aGlzIGFuZCBhZGQg
VzI1TjAyS1YgZmxhc2ggc3VwcG9ydC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlraGFpbCBL
c2hldmV0c2tpeSA8bWlraGFpbC5rc2hldmV0c2tpeUBpb3BzeXMuZXU+ICAKPiAKPiBUaGFua3Mg
Zm9yIHRoZSBwYXRjaC4gV2UgaGF2ZSBhIHNpbWlsYXIgY2hhbmdlIGluIG91ciBkb3duc3RyZWFt
IGtlcm5lbCwKPiB0aGF0IEkgZmFpbGVkIHRvIHB1c2ggdXBzdHJlYW0gc28gZmFyLiBCdXQgeW91
ciB2ZXJzaW9uIGxvb2tzIGV2ZW4gYmV0dGVyLgo+IAo+IENhbiB5b3UgY2hhbmdlIHRoZSBzdWJq
ZWN0IHByZWZpeCB0byAibXRkOiBzcGluYW5kOiB3aW5ib25kOiIsIHBsZWFzZT8KPiAKPiBBbmQg
SSBhbHNvIHdvdWxkIGxpa2UgdG8gYXNrIHlvdSB0byBzcGxpdCB0aGlzIGludG8gdHdvIHBhdGNo
ZXMuIFRoZQo+IGZpcnN0IG9uZSB0byBhZGQgdGhlIHRoaXJkIGJ5dGUgaW4gdGhlIGlkcyBvZiB0
aGUgZXhpc3RpbmcgZGV2aWNlcyBhbmQKPiB0aGUgc2Vjb25kIG9uZSB0byBhZGQgc3VwcG9ydCBm
b3IgdGhlIG5ldyBkZXZpY2UuCgpBZ3JlZWQgb24gYm90aCBjb21tZW50cywgdGhhbmtzIEZyaWVk
ZXIhCgo+IFdpdGggdGhlc2UgdHdvIGNoYW5nZXMgeW91IGNhbiBhZGQ6Cj4gCj4gUmV2aWV3ZWQt
Ynk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4KCkNoZWVy
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
