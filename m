Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9E4C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CC120656
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTUZInAL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fySj0ohU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21CC120656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjviauYEk15CWxggizyWQwSIZ9f7K8yZZpLupCaSMNY=; b=PTUZInALsXdq96
	uwqZJgMYjUL9IpLXlMZglihC2yylrx/c7C4Cor8iL66kteObzygpYZIM1YurKpMF/dps4ztPIZ3ZO
	KiVK4TZOHj/PWcUPQc/2Azz6wisIIQfCEsfy78+Hbdq1vTwRKuOxmkV5T+h38nCFDCoxay7vZoD3+
	efVp5qiI830Yo//ZYOqP/xPi+fvUiwdJ+aih1a9eGQaTYN3IDFyUkOOzrfeTk+yK1diR4uNfEu8/m
	ehodGrDK/RV09YQFBCrP1vkMiMGG93Z+8qOVqBaGzcEDXDQ2pPoFJWK6Vu+4w741oAJdegVr1fCzJ
	DoXngxIdL1aK+vn6taSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2A1-000386-Kr; Mon, 29 Apr 2019 09:01:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL29r-0002tg-R3
 for linux-mtd@bombadil.infradead.org; Mon, 29 Apr 2019 09:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NiJNgBHXOHb8uu9aN++LivIiTircq3jKo1gK9RZ3M9Y=; b=fySj0ohUV+nRodOyYP3tb/Ls2G
 jKpALIn5QD0tFtL2Ogs+ybfhuKTaPPFXn5H5zL8yeLS1vkVurRTj2W15p7sb32M+ANJfR5cuRT+kA
 qAIQvno3cTLgwkCjFoRPDHXtsOKOqLpNVDQiPuKgbfqJFgv2SJ2BitEiO+b0ECadMouQhIT8SHAqI
 LWLQSSkVjwuCr9NKGo9/aXIlUTZUA5W8GQeNrVlxwK40VP0Csyiyis8LsVcMhIzh8t/S14N/YOVrb
 NXhSbRkjoQcb4aAihDc1v6xdIWn7NL71BjQQOzd/My6DhorVlwGziqWaYrnfmEl8o9qQBD1zEBlio
 Pz7kFz0A==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL29e-0007mR-DG
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 09:01:05 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0C63560012;
 Mon, 29 Apr 2019 09:00:13 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:00:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: Clean the controller state
 before each operation
Message-ID: <20190429110013.68984b7f@xps13>
In-Reply-To: <2565820.SR17ECleB1@blindfold>
References: <20190408083145.13178-1-miquel.raynal@bootlin.com>
 <20190414105019.5bac65d3@collabora.com>
 <9a8a3963-1b8a-9f9b-8e54-200945518f99@zonque.org>
 <2565820.SR17ECleB1@blindfold>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_100103_531125_8CF32495 
X-CRM114-Status: GOOD (  19.69  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlIG9u
IFN1biwgMjggQXByIDIwMTkgMTU6MDc6NDAKKzAyMDA6Cgo+IERhbmllbCwKPiAKPiBBbSBTb25u
dGFnLCAyOC4gQXByaWwgMjAxOSwgMTQ6MjA6NDkgQ0VTVCBzY2hyaWViIERhbmllbCBNYWNrOgo+
ID4gT24gMTQvNC8yMDE5IDEwOjUwIEFNLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6ICAKPiA+ID4g
T24gTW9uLCAgOCBBcHIgMjAxOSAxMDozMTo0NSArMDIwMAo+ID4gPiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4gICAKPiA+ID4+IFNpbmNlIHRo
ZSBtaWdyYXRpb24gb2YgdGhlIGRyaXZlciB0byBzdG9wIHVzaW5nIHRoZSBsZWdhY3kgIAo+ID4g
Pj4gLT5zZWxlY3RfY2hpcCgpIGhvb2ssIHRoZXJlIGlzIG5vdGhpbmcgZGVzZWxlY3RpbmcgdGhl
IHRhcmdldCBhbnltb3JlLCAgICAKPiA+ID4+IHRodXMgdGhlIHNlbGVjdGlvbiBpcyBub3QgZm9y
Y2VkIGF0IHRoZSBuZXh0IGFjY2Vzcy4gRW5zdXJlIHRoZSBORF9SVU4KPiA+ID4+IGJpdCBhbmQg
dGhlIGludGVycnVwdHMgYXJlIGFsd2F5cyBpbiBhIGNsZWFuIHN0YXRlLgo+ID4gPj4KPiA+ID4+
IENjOiBEYW5pZWwgTWFjayA8ZGFuaWVsQHpvbnF1ZS5vcmc+Cj4gPiA+PiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+ID4gPj4gRml4ZXM6IGIyNTI1MTQxNGY2ZTAwICgibXRkOiByYXduYW5k
OiBtYXJ2ZWxsOiBTdG9wIGltcGxlbWVudGluZyAtPnNlbGVjdF9jaGlwKCkiKQo+ID4gPj4gU3Vn
Z2VzdGVkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
Pgo+ID4gPj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4gIAo+ID4gPiAKPiA+ID4gUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9y
aXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ICAKPiA+IAo+ID4gSGFzIHRoaXMgb25lIGJlZW4g
cXVldWVkIGluIGFueSB0cmVlIHlldD8gIAo+IAo+IElzbid0IGl0IHZpc2libGUgaW4gbGludXgt
bmV4dD8KPiBJIHdhcyBhYm91dCB0byBzZW5kIGEgZmluYWwgUFIgdG8gTGludXMgbGF0ZXIgdG9k
YXkuCj4gCgpJbmRlZWQgdGhlIHBhdGNoIGlzIG1pc3NpbmcgaW4gMjAxOTA0MjYgLW5leHQuIAoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
