Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9EDC5475B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2024 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3iDutdBgaztRPx8SPJZIf+sFN60AplLnmAi3xKzIUQ=; b=O8eIbxzWM+OPEg
	ESHzgSwvFvNLwSJAk+nEdmNkFOS2P4l6ME9cqQrosXurjeu0eUBNGymJUErloRFLsQsRcjTWcDfbn
	KtQ8rUQuRq8qqcd82oqxBI6fUQNn8K/QSB0zxFipDzGSV6whsGF6HVPi/0krYbuCPh1k7xgEZDONI
	iWNQ+yK8m4BSpajn/fH4xkkY76ogC3aAurrDOWUFtaOCZoFx/irrIpiAKuvgPdV87EZOr0OJDVNxv
	t+H5EDcvwFojHPmKEpQ/xbnVWCFurDDlzEQ6fFkp015rkmx4s/AFLZAQmCyHOsnqFD/abujeMThZd
	85UtyNVMYUhEzSRqvp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyjV-0000000H1Zi-33b3;
	Fri, 01 Mar 2024 08:59:09 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyjQ-0000000H1XP-3zkd;
	Fri, 01 Mar 2024 08:59:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 742EA20008;
	Fri,  1 Mar 2024 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709283541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ivWe11xVMZD7cifOWCwgzrkIId3o3sQxiTUNBViJXcc=;
	b=TC/WXjfzxTcBKQrvj0PURJBpCKay3xEnZnGI2WIeG3w3hDT9Ni9plkHHg0k0tYFs3COYHX
	1mwv6E8k4BAOW3RvYNjOS9uSN3IBQ/4OUzxKXOdlyXrFRkuGqg+zlBUL9MmbK5/VoDeyji
	x22jPwW88P73s3STQfw60FNHE7TkWom/zBE5TqyfJQUjE3rR2Ohb0bWKylCPqW3e4sdctO
	cmRCHDWGwWlSWmrJruz9SbzIwcPNX/6GT3JupZCoFXW7VfK4IO4DBIdMT/esvshiGRtH7y
	MKuYg0ZjdKW51l9pRN5kTEQnq2b19Qme9mOemLS1EvNaJ0l2J97ulP+UKSE3mw==
Date: Fri, 1 Mar 2024 09:58:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH v7] mtd: rawnand: brcmnand: Add support for getting ecc
 setting from strap
Message-ID: <20240301095855.7dc30cd5@xps-13>
In-Reply-To: <67a69fa6-bbff-4b9a-8253-c9b20093dee1@broadcom.com>
References: <20240227201253.31978-1-william.zhang@broadcom.com>
	<20240229112818.2e54d0f6@xps-13>
	<67a69fa6-bbff-4b9a-8253-c9b20093dee1@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_005905_294798_8A1CE68E 
X-CRM114-Status: GOOD (  19.91  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFRodSwgMjkg
RmViIDIwMjQgMTU6Mzk6MjUgLTA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAyLzI5LzI0IDAy
OjI4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgV2lsbGlhbSwKPiA+IAo+ID4gd2lsbGlh
bS56aGFuZ0Bicm9hZGNvbS5jb20gd3JvdGUgb24gVHVlLCAyNyBGZWIgMjAyNCAxMjoxMjo1MiAt
MDgwMDoKPiA+ICAgCj4gPj4gVGhpcyBpcyB0aGUgdXBkYXRlIHRvIHRoZSBwYXRjaCAxMiBpbiB0
aGUgb3JpZ2luYWwgc2VyaWVzIFsxXSB0aGF0IHdhcwo+ID4+IGFwcGxpZWQgdG8gbmFuZC1uZXh0
IGV4Y2VwdCB0aGlzIHBhdGNoLiAgCj4gPiAKPiA+IFRoaXMgaXMgY29udGV4dC4gV2hpbGUgaW50
ZXJlc3RpbmcsIGl0IHNob3VsZCBub3QgYmUgcGFydCBvZiB0aGUgY29tbWl0Cj4gPiBsb2cgYnV0
IGluc3RlYWQgbG9jYXRlZC4uLgo+ID4gICAKPiA+Pgo+ID4+IEJDTUJDQSBicm9hZGJhbmQgU29D
IGJhc2VkIGJvYXJkIGRlc2lnbiBkb2VzIG5vdCBzcGVjaWZ5IGVjYyBzZXR0aW5nIGluCj4gPj4g
ZHRzIGJ1dCByYXRoZXIgdXNlIHRoZSBTb0MgTkFORCBzdHJhcCBpbmZvIHRvIG9idGFpbiB0aGUg
ZWNjIHN0cmVuZ3RoCj4gPj4gYW5kIHNwYXJlIGFyZWEgc2l6ZSBzZXR0aW5nLiBBZGQgYnJjbSxu
YW5kLWVjYy11c2Utc3RyYXAgZHRzIHByb3BldHkgZm9yCj4gPj4gdGhpcyBwdXJwb3NlIGFuZCB1
cGRhdGUgZHJpdmVyIHRvIHN1cHBvcnQgdGhpcyBvcHRpb24uIEhvd2V2ZXIgdGhlc2UgdHdvCj4g
Pj4gb3B0aW9ucyBjYW4gbm90IGJlIHVzZWQgYXQgdGhlIHNhbWUgdGltZS4KPiA+Pgo+ID4+IFNp
Z25lZC1vZmYtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgo+
ID4+IFJldmlld2VkLWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiA+Pgo+
ID4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMjIzMDM0NzU4LjEzNzUz
LTEtd2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20vICAKPiA+IAo+ID4gVGhpcyBhcyB3ZWxsIHNo
b3VsZCBiZSBiZWxvdy4gIAo+ID4+Cj4gPj4gLS0tICAKPiA+IAo+ID4gLi4uaGVyZS4KPiA+ICAg
Cj4gU29ycnkgYWNjaWRlbnRhbGx5IHB1dCB0aGVzZSBpbmZvIGluIHRoZSBjb21taXQgbG9nLiAg
U2hvdWxkIGJlIGluIHRoZSByZXZpc2lvbiBoaXN0b3J5LiAgTGV0IG1lIGtub3cgaWYgeW91IHdh
bnQgdG8gc2VuZCBhIG5ldyB2ZXJzaW9uLgoKWWVzIHBsZWFzZSwgaXQncyBlYXNpZXIgZm9yIG1l
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
