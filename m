Return-Path: <SRS0=Gd7z=SS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500E0C10F13
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 21:23:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142522075B
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 21:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aD8jvuvg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142522075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7ooZxJUgKBIvrdrFM8dhQ8KGTMG58mDnDP9/p34YpE=; b=aD8jvuvgUlTe+j
	7vmBTlu9LSWJwW9V9+ZxnUm0V8mqrABfmh7X2O8rwmIpzhlqXb9rUI1sc0d6IhZStr9mLJKa06d8j
	Xb49Khekfu3fJYZPUArZdUCg8yTq+vhnkCzM1XINCnLwO1zmk3kGH7viwSRpp5UFO6hyut6cPGzju
	IiomVQxsREExvGuVbcAIPl1eBn+es4SgIkXdjQjhxtN5ttm+aFmvuL5dci4Zh/+KuCOrJh7TdODZ5
	CxiclrfA6Pdgqton6qRqMAE8nKB6oGCfN87FbJEY6YcEw8nDNRrilJ5Y6ERxEb1NaHUE3ePqW1dmw
	g6lVQP7UwrtnFtw9tpcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGVXk-0004Um-9L; Tue, 16 Apr 2019 21:23:04 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGVXh-0004Tw-7U
 for linux-mtd@lists.infradead.org; Tue, 16 Apr 2019 21:23:02 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 487C260004;
 Tue, 16 Apr 2019 21:22:52 +0000 (UTC)
Date: Tue, 16 Apr 2019 23:22:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: nand_op_parser_exec_op should use longest pattern
Message-ID: <20190416232251.2397b4db@xps13>
In-Reply-To: <270be087c7dda47f208d194c0671f902@agner.ch>
References: <20190329133513.bj55sb373q4vo6yv@pengutronix.de>
 <bc75ec7a12c681a618ee641736141100@agner.ch>
 <20190330102134.4e85e130@collabora.com>
 <270be087c7dda47f208d194c0671f902@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_142301_417065_EB2A32F5 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU3RlZmFuLAoKPiA+PiA+IEkgaGF2ZSBubyBmaXggZm9yIHRoaXMsIGp1c3Qgd2FudGVkIHRv
IGxldCB5b3Uga25vdy4gSXQgdHVybmVkIG91dCB0aGF0Cj4gPj4gPiBpbiBteSBjYXNlIGZvciB0
aGUgR1BNSSBuYW5kIGRyaXZlciBJIHByb2JhYmx5IHdvbid0IG5lZWQgYW55IHBhdHRlcm4KPiA+
PiA+IHRhYmxlLiAgCj4gPj4KPiA+PiBUaGFua3MgZm9yIGJyaW5naW5nIGl0IHVwISBXaWxsIHRy
eSBpdCBvdXQgd2hlbiBJIGNvbWUgYXJvdW5kLiAgCj4gPiAKPiA+IEhlcmUgaXMgYSBuZXcgdmVy
c2lvbiBvZiB0aGUgcHJvcG9zZWQgZml4IHRoYXQgY29tcGlsZXMsIGF0Cj4gPiBsZWFzdCA6LSku
IFN0aWxsIG5vdCB0ZXN0ZWQgdGVzdGVkIG9uIGEgcmVhbCBIVyB0aG91Z2guICAKPiAKPiBUZXN0
ZWQgaXQgaGVyZSwgc2VlbXMgdG8gYm9vdCBhIHJvb3RmcyBmcm9tIGZsYXNoIGp1c3QgZmluZSEK
PiAKPiBUaGUgT09CIHJlYWRzIGxvb2sgbGlrZSB0aGlzIG5vdzoKPiBbICAgNzQuNDc4NDY5XSBu
YW5kOiBleGVjdXRpbmcgc3Vib3A6Cj4gWyAgIDc0LjQ3ODUwMF0gbmFuZDogICAgIC0+Q01EICAg
ICAgWzB4MDBdCj4gWyAgIDc0LjQ3ODUyOV0gbmFuZDogICAgIC0+QUREUiAgICAgWzUgY3ljOiAw
MCAwOCBjMCAxZCAwMF0KPiBbICAgNzQuNDc4NTU1XSBuYW5kOiAgICAgLT5DTUQgICAgICBbMHgz
MF0KPiBbICAgNzQuNDc4NTgwXSBuYW5kOiAgICAgLT5XQUlUUkRZICBbbWF4IDIwMDAwMCBtc10K
PiBbICAgNzQuNDc4NjA2XSBuYW5kOiAgICAgLT5EQVRBX0lOICBbNjQgQl0KPiAKPiBTbyB0aGUg
cGF0Y2ggYmVsb3cgc2VlbXMgdG8gZG8gd2hhdCB3ZSBpbnRlbmQuCgpXb3VsZCB5b3UgbWluZCBz
ZW5kaW5nIGEgcHJvcGVyIHBhdGNoIHdpdGggdGhlIGJlbG93IGNoYW5nZT8gWW91IGNhbgpjcmVk
aXQgQm9yaXMgd2l0aCBhIHN1Z2dlc3RlZC1ieS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
