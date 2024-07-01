Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE01C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 09:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPICALa0KrXBqTZYWG+vEDeh1Loi4wSiQoz4wjgU/sw=; b=inDylchKJ2Gvfq
	GKc+z2l3TNlc9NyqoiHTHc4SsX3l6cObSaj8MehIkEWekUQi+uO3sNPvxgAlb2QPwcGDM0p886D1O
	9CdcVxikL19x32awdLhJO8ApKPF1ncm+tdiK0X84oagm9kWRzRTGo+6tLQcHQzIxK44M2ji10kY/h
	dWAu5xlhKhjhW9wP9eneTDZuEhq/MTG3n6Z+p15FkTw12ebpacQNQkciNnGEALKkRlsDu7GUKjAgx
	KxpuFz5EY5er7a8Jcz7tyeeubDFBul0+pe+zjwQ4bKwiXLzLHbbilRwrnyhLFmSbtCkFMOgusuUYF
	dhBIrX0oUWPx0JJldF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODjM-00000002VgC-48mU;
	Mon, 01 Jul 2024 09:53:52 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODjJ-00000002Vew-2ek3
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 09:53:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB6041BF20A;
	Mon,  1 Jul 2024 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719827627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vM2BqcsoybpKJKE+WB6Ic7BDJbuXe+TuXSwmVKkGXbg=;
	b=A4yxTbo9rV4rBfvnnUuQptK4TfLtqGMChbEgNYd6E8BKwOjiCLfX2sgIaAMguQTzcsihBi
	KgfjdQdj5Ft+LOnxc0QLq2tF/OcBU4YkU5s0vWZ5tmzgVaCKYZsHXswt9YUl9maOMLwBNT
	v4gxgMPjYeMLmn8d0FSiohuoyKMp1G7ZUkMs9e3P1oHs0QIYNGoG4nOW4DouRixMfKdeES
	FMRKQxIuBm52i/1Kg2D3mpckzIEZijEUH80yRCfMNPUavlCRsY6wWzGZ849Alnh2miC3Sa
	nOS8N6nJW0MNfr6JKkyx90LNjpKhkrfdqB6tDxypgjAK2GeSTVt+356Oehmfkg==
Date: Mon, 1 Jul 2024 11:53:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: mxc_nand: always copy_spare() for page write
Message-ID: <20240701115345.3ca6fef7@xps-13>
In-Reply-To: <20240528203006.1479230-1-s.hauer@pengutronix.de>
References: <20240528203006.1479230-1-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_025349_837165_D3A1BE24 
X-CRM114-Status: GOOD (  11.60  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUdWUsIDI4IE1heSAy
MDI0IDIyOjMwOjA2ICswMjAwOgoKPiBXaGVuIGRvaW5nIGEgcGFnZSB3cml0ZSB3ZSBhbHdheXMg
aGF2ZSB0byBjb3B5IHRoZSBPT0IgZGF0YSBpbiBwbGFjZSwKPiBhcyB0aGUgY29udHJvbGxlciB3
aWxsIGFsd2F5cyB3cml0ZSBpdC4gTm90IGNvcHlpbmcgaXQgbWVhbnMgd2Ugd3JpdGUKPiByYW5k
b20gZGF0YSB0byB0aGUgT09CIGFyZWEuCj4gCj4gRml4ZXM6IDNkZjU0OTYwYjYzY2MgKCJtdGQ6
IG5hbmQ6IG14Y19uYW5kOiBpbXBsZW1lbnQgZXhlY19vcCIpCj4gU2lnbmVkLW9mZi1ieTogU2Fz
Y2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IE1pcXVlbCwgZmVlbCBm
cmVlIHRvIGZpeHVwIHRoZSBvcmlnaW5hbCBwYXRjaCB3aXRoIHRoaXMuCgpTb3JyeSBmb3IgdGhl
IGRlbGF5LCBJJ20gbm93IGZpeGluZyB1cCB0aGUgb3JpZ2luYWwgcGF0Y2ggd2l0aCB0aGlzIG9u
ZS4KClRoYW5rcyBmb3IgdGhlIGZvbGxvdy11cC4KCkJUVyBJJ3ZlIGNoYW5nZWQgdGhlIHRpdGxl
cyB0byAibXRkOiByYXduYW5kOiBteGM6IiB0byBtYXRjaCB0aGUgbmFtaW5nCmNoYW5nZXMgc2lu
Y2UgdGhlIGludHJvZHVjdGlvbiBvZiBzcGktbmFuZC4KCkNoZWVycywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
