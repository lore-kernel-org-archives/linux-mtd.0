Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B47CA9EC0
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 08:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09BA12083E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 08:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sT+tH8OT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09BA12083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acrcMQIzU17X4EOxaVgCnTZglxgt6ojN4eorGauKmWM=; b=sT+tH8OTmYHvs9
	OdaYAJZ5Xia+5cktWqO1aXIeGn2QFAHI3nzqrA0XYKlexk83izzRvVjvHjc/NPOYiRUA26HViWA+z
	6d4cWQB7kt43km8TqgnRocoMpLCRuOuZkxDBFyrAaiYbHo19mvPPX+YtGkzDr2WL2Bg8Gq11tUroE
	pNH6TnXHm5kNU0Ipe1ZNFlkBTxT7VE/h/SMq5T7Saj7212TZAsncOQpgyfyfNxZ9wPW1lx84H+hEX
	f8yIBlKMfO+AUfsUXwXHEyKv4AVV1nV33emhWVQZGG5Lxlcfwtz6gi/U1iPfcz0L6mI1P1F8BtKhN
	uYPO9vFy7s9Lz8V9ULBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPjJV-0005r1-Vy; Wed, 30 Oct 2019 08:26:45 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPjIh-0004yn-4W
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 08:25:57 +0000
X-Originating-IP: 81.185.173.67
Received: from localhost.localdomain (67.173.185.81.rev.sfr.net
 [81.185.173.67]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3E8D320006;
 Wed, 30 Oct 2019 08:25:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: mtd/ubi/ubifs: Remove inactive maintainers
Date: Wed, 30 Oct 2019 09:25:50 +0100
Message-Id: <20191030082550.13022-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017142229.3853-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 5c1719a2b978f9a292d4fb3efa6d6525f36b7489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_012555_338942_DEB3AABA 
X-CRM114-Status: GOOD (  11.44  )
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
 Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDE5LTEwLTE3IGF0IDE0OjIyOjI5IFVUQywgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBEZXNwaXRlIHRoZWlyIHN1YnN0YW50aWFsIHBlcnNvbmFsIGludmVzdG1lbnQgaW4gdGhlIE1U
RC9VQkkvVUJJRlMgYQo+IGZldyB5ZWFycyBiYWNrLCBEYXZpZCwgQnJpYW4sIEFydGVtIGFuZCBB
ZHJpYW4gYXJlIG5vdCBhY3RpdmVseQo+IG1haW50YWluaW5nIHRoZSBzdWJzeXN0ZW0gYW55bW9y
ZS4gV2Ugd2FybWx5IHNhbHV0ZSB0aGVtIGZvciBhbGwgdGhlCj4gd29yayB0aGV5IGhhdmUgYWNo
aWV2ZWQgYW5kIHdpbGwgb2YgY291cnNlIHN0aWxsIHdlbGNvbWUgdGhlaXIKPiBwYXJ0aWNpcGF0
aW9uIGFuZCByZXZpZXdzLgo+IAo+IFRoYXQgc2FpZCwgTWFyZWsgcmV0aXJlZCBoaW1zZWxmIGEg
ZmV3IHdlZWtzIGFnbyBxdW90aW5nIEhhcmFsZCBbMV06Cj4gCj4gICAgICAgICBJdCBtYXR0ZXJz
IHdobyBoYXMgd2hpY2ggdGl0bGUgYW5kIHdoZW4uIFNob3VsZCBzb21lYm9keSBub3QKPiAgICAg
ICAgIGJlIGFuIGFjdGl2ZSBtYWludGFpbmVyLCBtYWtlIHN1cmUgaGUncyBub3QgbGlzdGVkIGFz
IHN1Y2guCj4gCj4gRm9yIHRoaXMgc2FtZSByZWFzb24sIGxldOKAmXMgdHJpbSB0aGUgbWFpbnRh
aW5lcnMgbGlzdCB3aXRoIHRoZQo+IGFjdHVhbGx5IGFjdGl2ZSBvbmVzIG92ZXIgdGhlIHBhc3Qg
dHdvIHllYXJzLgo+IAo+IFsxXSBodHRwOi8vbGFmb3JnZS5nbnVtb25rcy5vcmcvYmxvZy8yMDE4
MDMwNy1tY2hhcmR5LWdwbC8KPiAKPiBDYzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRl
YWQub3JnPgo+IENjOiBCcmlhbiBOb3JyaXMgPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT4K
PiBDYzogQXJ0ZW0gQml0eXV0c2tpeSA8ZGVkZWtpbmQxQGdtYWlsLmNvbT4KPiBDYzogQWRyaWFu
IEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJl
ay52YXN1dEBnbWFpbC5jb20+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6
IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQWNrZWQtYnk6IEFkcmlhbiBIdW50
ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBCcmlhbiBOb3JyaXMgPGNv
bXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT4KPiBBY2tlZC1ieTogQXJ0ZW0gQml0eXV0c2tpeSA8
ZGVkZWtpbmQxQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dC4KCk1pcXVlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
