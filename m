Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD89EC282C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:15:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C9CB218D9
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKJAEbPU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C9CB218D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zm5DF7TfPmjdOPIZjGiIhKhoss9j6QfeC17SQpr87tU=; b=UKJAEbPUprAE5N
	tTCL760kppHnwJXwelCmXiFj/YPGxALGnavlvdqe4xmyv38YWTP9TlgfwDFGV0BbYlQiePas1KZyq
	ui3EcrsXC1UmFJ1+mB34ltUeJfXCSQSRZjQEvwUaAy9Ya1vNY2Tm5CrAULEN11j53JXHYZo3z2BLE
	lf6bVgSAW25UksIFXjijWNq85vvXgQ3iXjgr32V0sasicadBmIQiaJKWzJvCX2f/uF7lxGcVLLogq
	iwHMzpTJg9nxOoV2OeLOF9xmNoIP2tTdFuezxVM8o7V7dQ7yXF6cxPFlaJEiCCtKLo8pPscBqGGtH
	D2biWOVkaZy0yXDsulEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn1KN-0007E6-0h; Fri, 25 Jan 2019 13:15:23 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1K7-00066h-Rt
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 13:15:11 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 6D858209BE; Fri, 25 Jan 2019 14:15:06 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 2A22D20397;
 Fri, 25 Jan 2019 14:14:56 +0100 (CET)
Date: Fri, 25 Jan 2019 14:14:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: denali: remove unused dma_addr field from
 denali_nand_info
Message-ID: <20190125141456.14222432@xps13>
In-Reply-To: <1548311337-16851-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548311337-16851-1-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_051508_493014_18ACCFCE 
X-CRM114-Status: GOOD (  13.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUaHUsIDI0IEphbgoyMDE5IDE1OjI4OjU3ICswOTAwOgoKPiBUaGlzIGlz
IGEgbGVmdG92ZXIgb2YgY29tbWl0IDk5N2NkZTJhMjIyMCAoIm10ZDogbmFuZDogZGVuYWxpOiBz
a2lwCj4gZHJpdmVyIGludGVybmFsIGJvdW5jZSBidWZmZXIgd2hlbiBwb3NzaWJsZSIpLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4
dC5jb20+Cj4gLS0tCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5oIHwgMSAtCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2RlbmFsaS5oIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmgKPiBp
bmRleCAyNWMwMDYwLi5jOGMyNjIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2RlbmFsaS5oCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmgKPiBAQCAtMzA0
LDcgKzMwNCw2IEBAIHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvIHsKPiAgCXUzMiBpcnFfc3RhdHVz
OwkJCS8qIGludGVycnVwdHMgdGhhdCBoYXZlIGhhcHBlbmVkICovCj4gIAlpbnQgaXJxOwo+ICAJ
dm9pZCAqYnVmOwkJCS8qIGZvciBzeW5kcm9tZSBsYXlvdXQgY29udmVyc2lvbiAqLwo+IC0JZG1h
X2FkZHJfdCBkbWFfYWRkcjsKPiAgCWludCBkbWFfYXZhaWw7CQkJLyogY2FuIHN1cHBvcnQgRE1B
PyAqLwo+ICAJaW50IGRldnNfcGVyX2NzOwkJLyogZGV2aWNlcyBjb25uZWN0ZWQgaW4gcGFyYWxs
ZWwgKi8KPiAgCWludCBvb2Jfc2tpcF9ieXRlczsJCS8qIG51bWJlciBvZiBieXRlcyByZXNlcnZl
ZCBmb3IgQkJNICovCgpBcHBsaWVkIHRvIG5hbmQvbmV4dC4KCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
