Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FC3C5321D
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8ojV1+V/2/MiWIKe+IpqjaAG/Ixv7iFM0Cd8NM+rfE=; b=UsNo5e4oq0hp5T
	X8DqNKxPhmSN49jfUpLNYJ2hvoJ+ZL3nFhK14e0c2AH7NiC/xjbJyWBgu679NNm+6v/mHcwwOvEUv
	PZqWw1dHxNcJuqTk7WrQSQgdX4l6nhAfXPp8db9x2Mxdn0Q55p3BwAggDmKCcjcnMR6bFSBKKpz8z
	2Xzfb+mZO9HOA5mQWbYQ2lGDp+DMqigWp29UiZDZdUwFeUZuynD/m9H1+Ke2/4qTlpxGl/+pweCp+
	knRYFRfcJObQ2+zVBB2F3B3mAMRmERpacZyWXkD02xeYfpw9G/AztTIs1tNs9/+Jn9g7T9wU4kDKC
	im2EBRk6GRi+ZvcpdPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shPuP-0000000FwMB-2iWA;
	Fri, 23 Aug 2024 08:44:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shPph-0000000Fupk-1e17
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 08:39:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1451A20004;
	Fri, 23 Aug 2024 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724402380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QT8K3DazghTsHSMYf5ANJ6HHOnB18G++J6IAvYLGbdM=;
	b=lT8QL2lecsRe6uvti1+hnDsYCmL8Gh0qnxzpdZW0q8n0jQjOYgEN3RA+yVdXOgq2zhRoys
	Sb1YcrwYl3YFnPKL1FIK6+6BeTFIuQaE7n8ILoYlrxMJMRNpHcdqpJ6BUyZlw9AS0srn+9
	o39tQWKI9Iwlp0jcDVo/Og08AIfGaooYYBBKxbQY143RrXT8gQthzM44zmcG5rqSTECgq2
	/KtPaUVSvAYNZ2G4BkZBMNkfTPgHMs3TBG5qr4gt6cNgJmYPUQzflZpcn+ZL4n0GhuFDU9
	3wahTKDqoZcRcvYoIKNPjM9Y9uRhEujP8ayYHo0tgfI4G0zvw9CBXAJrHNKf/Q==
Date: Fri, 23 Aug 2024 10:39:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yan Zhen <yanzhen@vivo.com>
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] mtd:concat:Switch to use kmemdup_array()
Message-ID: <20240823103938.4fad7ca3@xps-13>
In-Reply-To: <20240823082535.3419187-1-yanzhen@vivo.com>
References: <20240823082535.3419187-1-yanzhen@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_013945_587784_584CBE56 
X-CRM114-Status: GOOD (  15.45  )
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

SGkgWWFuLAoKeWFuemhlbkB2aXZvLmNvbSB3cm90ZSBvbiBGcmksIDIzIEF1ZyAyMDI0IDE2OjI1
OjM1ICswODAwOgoKPiBXaGVuIHdlIGFyZSBhbGxvY2F0aW5nIGFuIGFycmF5LAo+IHVzaW5nIGtt
ZW1kdXBfYXJyYXkoKSBpcyBtb3JlIGFwcHJvcHJpYXRlIAo+IGFuZCBtYWtlcyBhdWRpdGluZyB0
aGUgY29kZSBlYXNpZXIuCgpXaHkgZG8geW91IGNhcCB5b3VyIGxpbmVzIGF0IHRoZSBpbnNhbmUg
bGltaXQgb2YgNDAgY2hhcnM/CgpBbHNvIHlvdSdyZSBtaXNzaW5nIHNwYWNlcyBpbiB0aGUgdGl0
bGUgYWZ0ZXIgdGhlICc6JwoKcy9Td2l0Y2ggdG8gdXNlL1N3aXRjaCB0by8/Cgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFlhbiBaaGVuIDx5YW56aGVuQHZpdm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9tdGRjb25jYXQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvbmNhdC5jIGIv
ZHJpdmVycy9tdGQvbXRkY29uY2F0LmMKPiBpbmRleCAxOTM0MjhkZTZhNGIuLmY1NmY0NGFhODYy
NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb25jYXQuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL210ZGNvbmNhdC5jCj4gQEAgLTIwNCw3ICsyMDQsNyBAQCBjb25jYXRfd3JpdGV2KHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBjb25zdCBzdHJ1Y3Qga3ZlYyAqdmVjcywKPiAgCX0KPiAgCj4gIAkv
KiBtYWtlIGEgY29weSBvZiB2ZWNzICovCj4gLQl2ZWNzX2NvcHkgPSBrbWVtZHVwKHZlY3MsIHNp
emVvZihzdHJ1Y3Qga3ZlYykgKiBjb3VudCwgR0ZQX0tFUk5FTCk7Cj4gKwl2ZWNzX2NvcHkgPSBr
bWVtZHVwX2FycmF5KHZlY3MsIGNvdW50LCBzaXplb2Yoc3RydWN0IGt2ZWMpLCBHRlBfS0VSTkVM
KTsKPiAgCWlmICghdmVjc19jb3B5KQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
