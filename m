Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670EBC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 12:17:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F847206BE
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 12:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wnog/I8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F847206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFOW8GOTlsQCor8A1xnbndTlBywMYuk9GhnpTq3DfpU=; b=Wnog/I8mYyreYe
	uH9Yijx5gHEsl9W5abGz6kx0CVv4g0Q2yibg/wG+bvAap4YlA8ukrAY1Fkuic3on8LgWgMer1qYIL
	Zeg8VjQWBzF2X/DJ4p34g1i65P6N9O6534ys8PHOG2HfDiuC+5V9JaaYaXpATqLSGV1oO0ypLy2Ph
	sJumEIdhWWPkE4e9ZCJpZJ3xOn5DTZDJ4BJtrDBBhfQzxwx9aUCZpNVbIzsZ/B2anGquk7U7xcPW3
	UE+UJOJ3p99uwvXOApHrvLX5bsbVWsE1oVGe6XJzX9dSKSGH1a9t2EryrjwW8uEG229l7Mb5pHylC
	i+Y5SVRK0W1q7fBZgh8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb1BS-00068N-Iv; Tue, 19 May 2020 12:17:22 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1BP-000684-L8
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 12:17:21 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2820DC0011;
 Tue, 19 May 2020 12:17:15 +0000 (UTC)
Date: Tue, 19 May 2020 14:17:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: rawnand: micron: Adapt the PAGE READ flow to
 constraint controllers
Message-ID: <20200519141713.32299b5d@xps13>
In-Reply-To: <20200519103919.50f4417e@collabora.com>
References: <20200519074639.23777-1-miquel.raynal@bootlin.com>
 <20200519103919.50f4417e@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_051719_824012_A8A44C53 
X-CRM114-Status: GOOD (  15.61  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBUdWUsIDE5IE1heQoyMDIwIDEwOjM5OjE5ICswMjAwOgoKPiBPbiBUdWUsIDE5
IE1heSAyMDIwIDA5OjQ2OjM5ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGVyZSBhcmUgY29udHJvbGxlcnMgbm90IGFibGUg
dG8ganVzdCByZWFkIGRhdGEgY3ljbGVzIG9uIHRoZQo+ID4gYnVzLiBUaGVyZSBhcmUgY29udHJv
bGxlcnMgbm90IGFibGUgdG8gZG8gYSBjaGFuZ2UgY29sdW1uLgo+ID4gCj4gPiBJZiB3ZSB3YW50
IHRvIHN1cHBvcnQgYm90aCwgd2UgbmVlZCB0byBjaGVjayB3aGljaCBvcGVyYXRpb24gaXMKPiA+
IHN1cHBvcnRlZCBmaXJzdC4gVGhpcyBpcyB0aGUgZXhhY3Qgc2FtZSBtZWNoYW5pc20gdGhhdCBp
cyBpbiB1c2UgZm9yCj4gPiBwYXJhbWV0ZXIgcGFnZSByZWFkcyAoT05GSS9KRURFQykgYXMgdGhl
IHNhbWUgcHJvYmxlbSBvY2N1cnMuCj4gPiAKPiA+IFNwZWVkIHRlc3RpbmcgZG9lcyBub3Qgc2hv
dyBhbnkgdGhyb3VnaHB1dCBwZW5hbHR5IHNvIHdlIGRvIG5vdAo+ID4gb3B0aW1pemUgbW9yZSB0
aGFuIHRoYXQuIEhvd2V2ZXIgaXQgaXMgbGlrZWx5IHRoYXQsIGluIHRoZSBmdXR1cmUsIGEKPiA+
IG1vcmUgcm9idXN0IGFuZCBleGhhdXN0aXZlIHRlc3Qgd2lsbCBydW4gYXQgYm9vdCB0aW1lIHRv
IGF2b2lkCj4gPiByZS1jaGVja2luZyB3aGF0IGlzIHN1cHBvcnRlZCBhbmQgd2hhdCBpcyBub3Qg
YXQgZXZlcnkgY2FsbC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+IAo+IFRoaXMgbG9va3MgZ29vZCB0byBtZSwganVz
dCBvbmUgdGhpbmcgdG8gYWRkcmVzcyBiZWxvdyBhbmQgeW91IGNhbiBhZGQKPiAKPiBSZXZpZXdl
ZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KClll
cyBzdXJlLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
