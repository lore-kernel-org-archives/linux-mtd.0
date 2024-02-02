Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1497EC48291
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Feb 2024 16:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfOFsw7kj5AiOT4h84tNkQwnk6Dn13rFvz1TJGOuwAE=; b=IBnQp0UQpkbJiB
	ojL89bZe2w3X06dRvht5osT1cSUQaFP4911BlE2w1c15QH9cxp2QE4znlYUuAoaT57E1UpQOK8n0i
	gJyJcSSjbEWI2+VCHQenZl77HoIi41TIVX/EDGOpgzsstdRVIVBHfVaQPjhJO359Z3YAfVdviMmGe
	dKZ7zyME5nJ0BN+da++Jp/2ipmNoTuk7fSMh3kFw7WznGTb1TVp+hM5x/BY2xaI6VHsFEhzGcyZP0
	NKZosUNAdERrKxbAaoM3YA5fusbCekI/lAVt0EccO1leuw3PDwe/OCFhK7bfHr5AWYSG07rYB5AkR
	cNR71dA8DwGHlfXG9X2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVw8q-0000000CEA2-2pHp;
	Fri, 02 Feb 2024 16:11:48 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVw8l-0000000CE5O-0yk2
	for linux-mtd@lists.infradead.org;
	Fri, 02 Feb 2024 16:11:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26EE92000B;
	Fri,  2 Feb 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706890299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBwW27WfwBLBWSzDOHY6qx2a5SDgg1oGStqqjT9uTZI=;
	b=HJcTsAexy1w4na8NNMWEafYT5g+aFOV4tJWKHnRFp1YuKmREVIgA35lnGXT98HVQZdK3lJ
	ZBtbwdZ9sd4elpVZ9EIzyHVkOtuytaPo0ONi7uKVfi7O9zmqllbkpTKop6rBlsBBVpaTk0
	iCmkcH+AaPEpsbaphW+D0WAgN+RuTvZ7zLqh3mTKVWB56WfbdjWaK4DLnNqiybfm80VyNa
	pAZu+nonjoTWJfvhChKstUdNuVM/En/Ju4N7KEZ5brqSEPUuvrgFoIZZYeQw7jWey9tct5
	lRifHTQ9czdcJ/2BWW/QRRtJwbTRB9/9t1IyV7jzSMbaPcqGD6qtuVM/KwR7hw==
Date: Fri, 2 Feb 2024 17:11:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mohamed Sardi <moh.sardi@skyhighmemory.com>
Cc: "Changsub.Shim" <changsub.shim@skyhighmemory.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>,
 Mohammad Nada <Mohammad.nada@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Message-ID: <20240202171136.41699985@xps-13>
In-Reply-To: <D726EA9A-1C18-4720-A87C-0340D675B514@skyhighmemory.com>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
	<20240108144719.3198373e@xps-13>
	<SE2P216MB2102316F0F2D8134C755C37283682@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
	<20240111083838.7f215daf@xps-13>
	<880CF70D-DC61-4E18-9A31-48A82A45CA3E@skyhighmemory.com>
	<20240124180716.71e26b8c@xps-13>
	<D726EA9A-1C18-4720-A87C-0340D675B514@skyhighmemory.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_081143_571307_6DB37C3F 
X-CRM114-Status: GOOD (  11.39  )
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

SGkgTW9oYW1lZCwKCm1vaC5zYXJkaUBza3loaWdobWVtb3J5LmNvbSB3cm90ZSBvbiBUaHUsIDEg
RmViIDIwMjQgMTk6NDA6NTEgKzAwMDA6Cgo+IERlYXIgTWlxdWVsLAo+IFdlIHVuZGVyc3RhbmQg
dGhhdCB5b3VyIHBsYW4gdG8gdHVybiBvZmYgdGhlIEVDQyBmb3IgQmFkIEJsb2NrIG1hcmtpbmcg
YW5kIGNoZWNraW5nLi4uIGZvciBMaW51eCBWNi4uLgoKTm8sIGl0J3MgYWx3YXlzIGJlZW4gbGlr
ZSB0aGlzLCBJIGRvbid0IHRoaW5rIHdlIGV2ZXIgY2hhbmdlZCB0aGF0LgpUdXJuaW5nIEVDQyBv
biBpbiB0aGUgcmF3IE5BTkQgd29ybGQgd2FzIG1heWJlIGEgbWlzdGFrZSBhbmQgd2FzIHByb3Zl
bgpub3QgdXNlZnVsIHRvIFNQSS1OQU5EcyBzbywgaXQgd2FzIGRpc2FibGVkIGluIHRoZSBTUEkt
TkFORCB3b3JsZCBmcm9tCmRheSAxLCBBRkFJUi4KCj4gV2UgYWxzbyB1bmRlcnN0YW5kIHRoYXQg
aW4gTGludXg1LjQgdGhlIGRyaXZlciBkaWQgbm90IGhhdmUgRUNDIGNvbnRyb2wuLi4KCk5vdCBz
dXJlIHdoYXQgImRyaXZlciIgbWVhbnMgaGVyZS4KCj4gTXkgcXVlc3Rpb24gaXMgYXMgZm9sbG93
Ogo+IDEpIEZyb20gd2hpY2ggdmVyc2lvbiBvZiBMaW51eCAsdGhlIEVDQyBjb250cm9sIHdhcyBh
ZGRlZCBpbiB0aGUgZHJpdmVyPyBXYXMgaXQgaW1wbGVtZW50ZWQgaW4gTGludXggNS54eD8KCkFn
YWluLCB3aGF0IGlzICJkcml2ZXIiPyBFQ0MgY29ycmVjdGlvbiBpcyBtYW5kYXRvcnkgZm9yIHBh
Z2UgYWNjZXNzZXMsCml0J3MgYWx3YXlzIGJlZW4gdGhlcmUuCgo+IDIpIFdoYXQgd2FzIHRoZSBs
ZWFkaW5nIHJlYXNvbi9jdXN0b21lciBsZWFkaW5nIHRvIHR1cm4gb2ZmIHRoZSBFQ0MgZm9yIGJh
ZCBibG9jayBtYXJraW5nL2NoZWNraW5nPwo+IE5vdGU6IFdlIHNhdyB0aGF0IE1USyB3YXMgdHVy
bmluZyBvZmYgdGhlIEVDQyBmb3IgQmFkIGJsb2NrIG1hcmtpbmcgb24gTGludXggNS40Li4uCgpJ
dCdzIG5vdCBiZWVuIHR1cm5lZCBvZmYgb3Igb24sIGFzIEkgdG9sZCB5b3UgaW4gbXkgcHJldmlv
dXMgbWFpbC4KCj4gMykgV2UgdGhpbmsgdGhhdCB0aGUgRUNDIHNob3VsZCBiZSB0dXJuZWQgb2Zm
IGZvciBiYWQgYmxvY2sgbWFya2luZyBhbmQgY2hlY2tpbmcsIGlzIGl0IHBvc3NpYmxlIGZvciB1
cyB0byBwcm92aWRlIGEgcGF0Y2gvZHJpdmVyIChTSE1fY29yZS5jKSBmb3IgTGludXggdmVyc2lv
biB2ZXJzaW9uIDYuLi4gIHdoZXJlIFNITSBkZXZpY2VzIGtlZXAgdGhlIEVDQyBvbi4uLgoKSXQg
aXMgYWxyZWFkeSBvZmYgaW4gdGhlIFNQSS1OQU5EIHdvcmxkLiBTb3JyeSBpZiBJIGFtIG5vdAp1
bmRlcnN0YW5kaW5nIHdoYXQgeW91IHNheSBjb3JyZWN0bHksIGJ1dCBJJ2xsIG5lZWQgbW9yZSBw
cmVjaXNlCmluZm9ybWF0aW9uIHRvIGFuc3dlciBjb3JyZWN0bHkuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
