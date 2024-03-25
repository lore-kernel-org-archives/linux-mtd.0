Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D5BC54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxDJvBeJ02heIJFXkyYvzqknd1+vq1e0ivg7MRx2DLI=; b=Nziei65sItQ+rN
	VES28uR54L3qCnfbb9cdvd+8SEY1im55GJ8O1uXSP9ZJf3qCIDh4JzQoAnsZfhtEdq+jxCiYWTTZu
	TqW0XBSf6PuVGNoQIQ8/GzJy+NvAG8EHZBvUmi2F6A2uhYBZyJVBlqPhOZQfnoDw6dYUgkDV5aEf7
	IrDwrZn2o3q99h5AIwH+8/i2JsodPiVvjwRTiYjoS3FzrYVdGGdwzYtWrUN2HDu26Tq7hhWNq/v58
	ctmnRd4hm7w2hUZ3+GdNVsVWSQZlhV8EXKyayx2Qo3SYaY2yEzdhpWUULGHZoOeDYS33tmdforo7n
	50Ev5MrxJwChsMOQgURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rogKl-0000000GM1h-47Hy;
	Mon, 25 Mar 2024 09:09:36 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rogKc-0000000GLw9-2zWR
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 09:09:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0770E6000C;
	Mon, 25 Mar 2024 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711357759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g7SMZhAf4Am0rTnm/eARUporpv8JgZVnopqWzBN3xYo=;
	b=enHZmhgK7R2eEv2n80yLDfGotfc2qlr6jstwvnMzsZFNaSDo2gaooBLPB2v/FyK+o4h0m1
	cEgWXNpRUW3UWMFUzE0GcWPhuc2m4hGwUrViLbf8l9jLlrLOUiO6SBpEBtbzPgB6z2yoZB
	7zR5b0hQQhhCZ39hqL4yLow+YFQ546UeIsdwi1vA4++SOAfGe9uesYToBfwqG0G7rL8kg5
	ZmaopkO3vG99dpOiw45LCOfJMzmB+hkb97DOi7OfwAXrMsay0OtSmi4pUk29OBOshgcA2U
	mqhZRUdvyho23ubWuD3o7WzcLT5mO5xmCrw9K5VtZO4Eky11/HA1k7XfQbgAgA==
Date: Mon, 25 Mar 2024 10:09:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: mtd: nand: raw: Possible bug in nand_onfi_detect()?
Message-ID: <20240325100917.502c75b7@xps-13>
In-Reply-To: <20240307181931.440c9c3f@xps-13>
References: <20240306-shaky-bunion-d28b65ea97d7@thorsis.com>
	<20240306164831.29eed907@xps-13>
	<20240307-pantry-deceit-78ce20f47899@thorsis.com>
	<20240307181931.440c9c3f@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_020927_005921_3D90AE49 
X-CRM114-Status: GOOD (  19.18  )
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

SGVsbG8gQWxleGFuZGVyLAoKPiA+ID4gPiBUaGUgY29uZGl0aW9uIGlzIHRydWUgYW5kIG5hbmRf
Y2hhbmdlX3JlYWRfY29sdW1uX29wKCkgcmV0dXJucyB3aXRoCj4gPiA+ID4gLUVJTlZBTCwgYmVj
YXVzZSBtdGQtPndyaXRlc2l6ZSBhbmQgbXRkLT5vb2JzaXplIGFyZSBub3Qgc2V0IHlldCBpbgo+
ID4gPiA+IHRoYXQgY29kZSBwYXRoLiAgVGhvc2UgYXJlIHByb2JhYmx5IGluaXRpYWxpemVkIGxh
dGVyLCBtYXliZSB3aXRoCj4gPiA+ID4gcGFyYW1ldGVycyByZWFkIGZyb20gdGhhdCBPTkZJIHBh
cmFtIHBhZ2U/Cj4gPiA+ID4gCj4gPiA+ID4gUmV0dXJuaW5nIHdpdGggZXJyb3IgZnJvbSBuYW5k
X2NoYW5nZV9yZWFkX2NvbHVtbl9vcCgpIGxlYWRzIHRvCj4gPiA+ID4ganVtcGluZyBvdXQgb2Yg
bmFuZF9vbmZpX2RldGVjdCgpIGVhcmx5LCBhbmQgbm8gT05GSSBwYXJhbSBwYWdlIGlzCj4gPiA+
ID4gZXZhbHVhdGVkIGF0IGFsbCwgYWx0aG91Z2ggdGhlIHNlY29uZCBvciB0aGlyZCBwYWdlIGNv
dWxkIGJlIGludGFjdC4KPiA+ID4gPiAKPiA+ID4gPiBJIGd1ZXNzIHRoaXMgd291bGQgYWxzbyBm
YWlsIHdpdGggYW55IG90aGVyIHJlYXNvbiBmb3Igbm90IG1hdGNoaW5nCj4gPiA+ID4gQ1JDcyBp
biB0aGUgZmlyc3QgcGFnZSwgYnV0IEkgaGF2ZSBub3QgZmF1bHR5IE5BTkQgZmxhc2ggY2hpcCB0
bwo+ID4gPiA+IGNvbmZpcm0gdGhhdC4gICAgCj4gPiA+IAo+ID4gPiBUaGFua3MgZm9yIHRoZSB3
aG9sZSByZXBvcnQsIGl0IGlzIGludGVyZXN0aW5nIGFuZCBzaG91bGQgbGVhZCB0byBmaXhlczoK
PiA+ID4gLSB3aHkgZG9lcyB0aGUgY29udHJvbGxlciByZWZ1c2VzIHRoZSBkYXRhaW4gb3A/ICAg
IAo+ID4gCj4gPiBTZWUgYWJvdmUuCj4gPiAgIAo+ID4gPiAtIHdoeSBuYW5kX3NvZnRfd2FpdHJk
eSBpcyBub3QgZW5vdWdoPyAgICAKPiA+IAo+ID4gSSBkb24ndCBrbm93LiAgVGhhdCdzIG9uZSBy
ZWFzb24gSSBhc2tlZCBoZXJlLgo+ID4gICAKPiA+ID4gLSBjaGFuZ2luZyB0aGUgY29uZGl0aW9u
IGluIG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCkKPiA+ID4gCj4gPiA+IENhbiB5b3UgdGFr
ZSBjYXJlIG9mIHRoZXNlPyAgICAKCk5vdyB3b3VsZCBiZSBhIHBlcmZlY3QgdGltZSB0byBzZW5k
IHRoZXNlIGZpeGVzLiBDb3VsZCB5b3Ugd29yayBvbiB0aGVtPwoKVGhhbmtzIQpNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
