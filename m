Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F0EC33CB1
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 09:33:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98484207FF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 09:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dda0r8IB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98484207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lfpmb/oCVHILgVcY/Me4dm4Jte9eKnWrPTZgnVmJ1H8=; b=Dda0r8IB9y4J+M
	sN2TUJdXZ6RI7kHjtr3fUAvmlxLMLPKpe/24g9oxTIztWqgGfo9LaI+e60zE3Dhz4fYP7uEBwJdQL
	nWAK9+nDRwegXdFNcVERSXcFMVl5w9/Yc0BMr4lDsKgxAFloLiPUE9k1VZ5h3rEeKggp0VWTzqal/
	0Ymdtaplv6KufJm7l1NXas02hs4tHnuG+gr33X7jYPNrskBdGq19yx/Jff6EmKcQLEe2L9Stx3lk/
	ZhGCh4RNqJc+pQRu+jtQxB4djybYaHjcOMsCXQVvRsev5alamuNJ0W6v9koM34JjklsW/Fq5fpvhe
	ZuXZ0yzBcxYXobLRjVEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irIZl-0002zm-TY; Tue, 14 Jan 2020 09:33:29 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irIZf-0002yr-2Z
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 09:33:27 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7FA88200013;
 Tue, 14 Jan 2020 09:33:06 +0000 (UTC)
Date: Tue, 14 Jan 2020 10:33:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: mtd: partition: Document the slc-mode
 property
Message-ID: <20200114103305.06936637@xps13>
In-Reply-To: <d5200944-e498-02ba-0f13-629e2aee1eb4@gmail.com>
References: <20191230165129.11925-1-miquel.raynal@bootlin.com>
 <20191230165129.11925-6-miquel.raynal@bootlin.com>
 <d5200944-e498-02ba-0f13-629e2aee1eb4@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_013323_256545_C097B4F2 
X-CRM114-Status: GOOD (  10.41  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmxvcmlhbiwKCkZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiB3cm90
ZSBvbiBNb24sIDMwIERlYyAyMDE5CjE5OjUzOjExIC0wODAwOgoKPiBPbiAxMi8zMC8yMDE5IDg6
NTEgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBGcm9tOiBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBib290bGluLmNvbT4KPiA+IAo+ID4gQWRkIGEgYm9vbGVhbiBwcm9wZXJ0
eSB0byBmb3JjZSBhIHNwZWNpZmljIHBhcnRpdGlvbiBhdHRhY2hlZCB0byBhbiBNTEMKPiA+IE5B
TkQgdG8gYmUgYWNjZXNzZWQgaW4gYW4gZW11bGF0ZWQgU0xDIG1vZGUgdGhpcyBtYWtpbmcgdGhp
cyBwYXJ0aXRpb24KPiA+IGltbXVuZSB0byBwYWlyZWQtcGFnZXMgY29ycnVwdGlvbnMuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGJvb3Rs
aW4uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb24udHh0ICAgICAgIHwgICAzICsrKwo+ID4gIHNjcmlwdHMvcG5tdG9sb2dvICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgQmluIDAgLT4gMjI0MTYgYnl0ZXMgIAo+IAo+IFlvdSB3
aWxsIHByb2JhYmx5IHdhbnQgdG8gcmVtb3ZlIHRoYXQgZmlsZSBmcm9tIHRoZSBmaW5hbCBjb21t
aXQgYW5kL29yCj4gYWRkIHBubXRvbG9nbyB0byAuZ2l0aWdub3JlIGFzIGEgc2VwYXJhdGUgcGF0
Y2guCgpEb25lLCB0aGFua3MgZm9yIHRoZSB3YXJuaW5nIQoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
