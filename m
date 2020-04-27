Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F88EC54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AC9020728
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJCuq8pb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AC9020728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChKUPODD1O73j17S+mM4wj8jdRfQjvlejMp2ZszamBc=; b=DJCuq8pb3taKmB
	NUaTWhMTrhxFxiM++Y+5zn5Rx4/bKaUwjexfe4jW+NhFqVPr5G8iAqxQK0fkCVQhUGFXRcS/tZUsc
	2Y0OtG3wCuUmto1aDMxKz9EdHQcbNUj+0VxXo6NZ3t7HhJDtk1Zia/Z/PUVjbI4rbTtd6D2G+uMFh
	MwuYdA6ZNKwLid/BfWCBCemF2IAwEucj8vuyzK+DyT4yuU3U+e1NJ0eBp+szmuR0/XZbJtAIFd6xs
	2QtGjf6PFu6r16VMbz38Z5IYxj3RfCAKxSbj9gfBdl0WEI7SaDEbOprbk+PgllMddA64t1NG9HqSE
	Emxo5veNQPov3e9KNfXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT7Qg-0001QN-QZ; Mon, 27 Apr 2020 17:20:26 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT7Qe-0001Pf-65
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 17:20:25 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 29B3DFF805;
 Mon, 27 Apr 2020 17:20:19 +0000 (UTC)
Date: Mon, 27 Apr 2020 19:20:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 7/9] mtd: rawnand: bcm47xx: Simplify the init() function
Message-ID: <20200427192017.661d2a3d@xps13>
In-Reply-To: <20200419125140.1307309-8-boris.brezillon@collabora.com>
References: <20200419125140.1307309-1-boris.brezillon@collabora.com>
 <20200419125140.1307309-8-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_102024_357252_6728C8F8 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTdW4sIDE5IEFwcgoyMDIwIDE0OjUxOjM4ICswMjAwOgoKPiBUaGUgcm93IGFu
ZCBjb2x1bW4gc2l6ZXMgYXJlIG5vdyBzZXQgYXMgcGFydCBvZiB0aGUgZXhlY19vcCgpIHByb2Nl
ZHVyZQo+IGFuZCBhZGp1c3RlZCB0byBtYXRjaCB0aGUgcmVxdWVzdGVkIG51bWJlciBvZiBhZGRy
ZXNzIGN5Y2xlcy4gTm8gbmVlZAo+IHRvIHNldCB0aGVtIGluIHRoZSBpbml0KCkgZnVuY3Rpb24g
c2luY2UgdGhvc2UgdmFsdWVzIHdpbGwgYmUKPiBvdmVyd3JpdHRlbiBhbnl3YXkuIEFzIGZvciB0
aGUgb3RoZXIgc2FuaXR5IGNoZWNrIHRoYXQgd2FzIGRvbmUgb24gdGhlCj4gY2hpcCBzaXplLCBJ
IGRvbid0IHRoaW5rIGl0J3MgcmVhbGx5IG5lZWRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IC0tLQoKUmV2aWV3
ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
