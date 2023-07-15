Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F56C001B0
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAWPZDEG3t/QjGaaePbUoe8ydQTabNplTWM3+CbNzXI=; b=VIqD7JpTbmmLWg
	lHCoJA7G4jgcSjyOEJK8PqHXnmGY3t3wTqQa5FgN4OYjCFIQWg5YaQRN85fmk09maI5v0v63Lf0P8
	szKmgL05F9UVYbeNCZYN8RaAudG2AefBiGPEAu7fNiS67T7FJh2dj+vwpULf9FsVnyqmTQt6SXMEU
	N4BoOLRU2qmZe8WfXyhD7G8Mc7C+INskkrRad54HHE3YYoYGG1MOYANoBBfFz3twSni/ejkDtubbe
	8SAtyrysVsMi2IYyxBptOX22PX9Y+VqadQWjRRwDv0zqy28V0MChZhRkvaaNbPwaQrXBtEJUOI8yj
	FUS4RtQuOVN98aiBQpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhnL-0095Oh-1h;
	Sat, 15 Jul 2023 16:06:55 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhnI-0095O9-2O
	for linux-mtd@lists.infradead.org;
	Sat, 15 Jul 2023 16:06:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9423EFF802;
	Sat, 15 Jul 2023 16:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689437208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odzVbkDgtiA71LEDlKd4dEBNkmtu+z7kQ+SHhZfMdfM=;
	b=mMhGy9AayDUYSGnvXU5pn5X25YoNIvbMFPOjjI6U9aO1AWS27vXg85lxgr5NAAe6LKSPAJ
	4m9yxi1tTtzfDUOEVjPsaXomWQkL8iJ9JFxNpY1amz/IXAg0LkjSSNaklRzl7hczUmulWx
	GPu9BDj65AWihZl9wV3m+qn7tuEVOMLzPW6wVoY2wXQS75N2jYmZMw1dlxBCgUlsmY8LVS
	nsoqLxK6T4LWn6DanI+O+zj3GiuHwZ0OjFE6jpwdUjn/oedpAmNA6EBo9uiHp4FwWDgkOY
	dfMFM6i/a1/+Hkt8c9Wk13k5J+ivQr8KdF/WjDt1gpm83nntVYLb0W7DTdbu9w==
Date: Sat, 15 Jul 2023 18:06:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yangtao Li <frank.li@vivo.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 12/18] mtd: nand: omap: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230715180646.32a764d7@xps-13>
In-Reply-To: <20230714152701.GA1300718@dev-arch.thelio-3990X>
References: <20230707040622.78174-12-frank.li@vivo.com>
	<20230713075751.486075-1-miquel.raynal@bootlin.com>
	<20230714152701.GA1300718@dev-arch.thelio-3990X>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_090653_084500_952A9B9F 
X-CRM114-Status: GOOD (  15.15  )
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

SGkgTmF0aGFuLAoKbmF0aGFuQGtlcm5lbC5vcmcgd3JvdGUgb24gRnJpLCAxNCBKdWwgMjAyMyAw
ODoyNzowMSAtMDcwMDoKCj4gT24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMDk6NTc6NTFBTSArMDIw
MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IE9uIEZyaSwgMjAyMy0wNy0wNyBhdCAwNDowNjox
NiBVVEMsIFlhbmd0YW8gTGkgd3JvdGU6ICAKPiA+ID4gQ29udmVydCBwbGF0Zm9ybV9nZXRfcmVz
b3VyY2UoKSwgZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgdG8gYSBzaW5nbGUKPiA+ID4gY2FsbCB0
byBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgpLCBhcyB0aGlzIGlzIGV4
YWN0bHkKPiA+ID4gd2hhdCB0aGlzIGZ1bmN0aW9uIGRvZXMuCj4gPiA+IAo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4gIAo+ID4gCj4gPiBBcHBsaWVk
IHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9s
aW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuICAKPiAKPiBQbGVhc2UgYXBwbHkgdGhlIHVwZGF0
ZWQgdmVyc2lvbiBhdCBbMV0sIHRoZSBjdXJyZW50IHZlcnNpb24gaXMKPiBvYnZpb3VzbHkgbm90
IGNvcnJlY3QsIGFzIGNsYW5nIHBvaW50cyBvdXQgaW4gbmV4dC0yMDIzMDcxNDoKCkkgd2lsbCBy
ZXBsYWNlIHRoZSBmaXJzdCB2ZXJzaW9uIGJ5IHRoZSBjb3JyZWN0ZWQgb25lLgoKPiAKPiAgIGRy
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX29tYXAyLmM6NDcwOjI6IHdhcm5pbmc6IHZh
cmlhYmxlICdjJyBpcyB1bmluaXRpYWxpemVkIHdoZW4gdXNlZCBoZXJlIFstV3VuaW5pdGlhbGl6
ZWRdCj4gICAgIDQ3MCB8ICAgICAgICAgYy0+b25lbmFuZC5iYXNlID0gZGV2bV9wbGF0Zm9ybV9n
ZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCwgJnJlcyk7Cj4gICAgICAgICB8ICAgICAg
ICAgXgo+ICAgZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfb21hcDIuYzo0NjU6MjU6
IG5vdGU6IGluaXRpYWxpemUgdGhlIHZhcmlhYmxlICdjJyB0byBzaWxlbmNlIHRoaXMgd2Fybmlu
Zwo+ICAgICA0NjUgfCAgICAgICAgIHN0cnVjdCBvbWFwMl9vbmVuYW5kICpjOwo+ICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgID0gTlVMTAo+ICAgMSB3YXJuaW5nIGdlbmVyYXRlZC4KPiAK
PiBLZXJuZWxDSSBhbHNvIHJlcG9ydGVkIHRoaXMgYXQgWzJdLiBJIGFwb2xvZ2l6ZSBpZiB0aGlz
IGhhcyBhbHJlYWR5IGJlZW4KPiByZXBvcnRlZCBvciBmaXhlZCBsb2NhbGx5LCBJIGRpZCBub3Qg
c2VlIHlvdXIgYnJhbmNoIHVwZGF0ZWQuCj4gCj4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy8yMDIzMDcxMzEwNDQyMi4yOTIyMi0xLWZyYW5rLmxpQHZpdm8uY29tLwo+IFsyXTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvNjRiMTM3ZGMuMTcwYTAyMjAuYjhhMTMuZmVlZUBteC5nb29nbGUu
Y29tLwo+IAo+IENoZWVycywKPiBOYXRoYW4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
