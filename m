Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4517CC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Idej9Nn2IXJESR5jFDf9Z4J9w2/bo9BlNV+CoqgaH9A=; b=Pu94iatqoPl/YM
	wj7ILm41tO0919kCKeyRZN5aQhpprUOIzEAdx/Pts5kDtkHL035AFqeq5W2NevIflsSfJM/D7q90/
	0VqWA4TbfWl+x6jf5d2wgt6t/WvdRPWRrce9LRUXemXubvPm1DiQA9GbnL0nj45JxRsIUMOZSarqv
	0osK3WK7WtDMmGy7HPgqmHfNJmy2sVbS44Y3mlmUgZpfxs//o7otsRHHS96VwcEFBe9fjImrwrfND
	VXC0rDc9Gwnj+sS5nfwDpjLtHpI6QM5WRSlGmvvhvWI22keGUzd/JrX3QU4oH9JzYkR+yCbOSrdLB
	TYq/RAuNTGrK95ITtZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okist-004zir-84; Tue, 18 Oct 2022 09:27:39 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okisn-004zdK-V4
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:27:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2ED45C000C;
	Tue, 18 Oct 2022 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666085250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNsK9MY8690b9GrLwiSmm+psFGOgFzuocowLwCoIV7A=;
	b=engyYdJnsNfx2Dkb3VmNEsgFYdvLFO2+rnrUnfCXtOQ9fPEn0miUDuEnxeLCNvrhkeSB3C
	Pq40xv9j2nA4Be7Df5w/mqm4K4KW67Q8CkBdPuG1s7ZdaFDNerdI0I4eXt+tqmOko/b/rl
	jMfU90PexVokp329ZF9skBvHuVQ/EsKgtEHR1PJLZcn3g/llwWL0ZfXI397sFvdL7Nd7Ix
	9uO/b4KgNow0EIgAfNJCxKmd3DarGdJCjUBbsOBebdS/431SAhf37Bu7QPqzmfNsyRq7ik
	zM7wyEXMHt8BeKgguBaparm/X/3VmLBGiUKAOi0Ke1dMgyB8rNpeZ2IUHy+DQQ==
Date: Tue, 18 Oct 2022 11:27:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Valentin Korenblit" <vkorenblit@sequans.com>,
 linux-mtd@lists.infradead.org, ye.xingchen@zte.com.cn
Subject: Re: [PATCH v4] mtd: rawnand: cadence: support 64-bit slave dma
 interface
Message-ID: <20221018112727.5dd2e1f6@xps-13>
In-Reply-To: <b222053a-9c76-4fdd-9c68-0b04eeb7168a@app.fastmail.com>
References: <20221018091631.11264-1-vkorenblit@sequans.com>
	<20221018111747.071aca83@xps-13>
	<e7a29d7c-dac5-8203-bd2d-9ab6d34c4500@sequans.com>
	<b222053a-9c76-4fdd-9c68-0b04eeb7168a@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_022734_177867_C5B4E05B 
X-CRM114-Status: GOOD (  13.27  )
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

SGkgQXJuZCwgVmFsZW50aW4sCgphcm5kQGFybmRiLmRlIHdyb3RlIG9uIFR1ZSwgMTggT2N0IDIw
MjIgMTE6MjM6MDQgKzAyMDA6Cgo+IE9uIFR1ZSwgT2N0IDE4LCAyMDIyLCBhdCAxMToyMCBBTSwg
VmFsZW50aW4gS29yZW5ibGl0IHdyb3RlOgo+ID4KPiA+IEkgY29weS9wYXN0ZWQgdGhlIGxpbmsg
dGhhdCBJIHJlY2VpdmVkIGluIEFybmQncyBlbWFpbC4KPiA+Cj4gPiBNYXliZSB0aGlzIGlzIGJl
dHRlcjoKPiA+Cj4gPiBodHRwczovL2xpc3RzLjAxLm9yZy9oeXBlcmtpdHR5L2xpc3Qva2J1aWxk
LWFsbEBsaXN0cy4wMS5vcmcvdGhyZWFkLzNOTUFDR0lNNU5EVUJQWFJUNVJUQlpPTjZMUUU1QTNC
LyAgCj4gCj4gVG8gY2xhcmlmeTogbXkgcG9pbnQgd2FzIGFib3V0IHVzaW5nIHRoZSBvZmZpY2lh
bCAnTGluazonIHRhZwo+IGluIHRoZSBjaGFuZ2Vsb2cgdGV4dCByYXRoZXIgdGhhbiBoYXZpbmcg
YSBmcmVlLWZvcm0gbGluay4KPiAKPiBXaGVuIGxpbmtpbmcgdG8gYSBtYWlsaW5nIGxpc3QgcG9z
dCwgdGhlIGJlc3Qgb3B0aW9uCj4gaXMgdXN1YWxseSBvbmUgZnJvbSBsb3JlLmtlcm5lbC5vcmcu
IHRoZSBsaXN0cy4wMS5vcmcKPiBsaW5rIGlzIHByb2JhYmx5IGZpbmUgaWYgdGhlIHRocmVhZCBp
cyBub3QgYXJjaGl2ZWQgb24gbG9yZS4KCkl0IGlzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL2I3ZTVlYmI0LTBkZTgtNDk1OC05YmM0LWZlMDZlYzRjMzYzNUB3d3cuZmFzdG1haWwuY29t
L3QvCgpWYWxlbnRpbiwgY2FuIHlvdSBldmVudHVhbGx5IHNlbmQgYSB2NSB3aXRoIHRoaXMgbGlu
ayBpZiB5b3UgYWdyZWU/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
