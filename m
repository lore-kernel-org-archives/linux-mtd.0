Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DED4C4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukWMkO8m529m+e1mXVQBevQTwRobGqul38vrG1f9HxY=; b=LV4U/tdPaabPnb
	O/NAhK85vBa9zWG/a/Y6OWOjSUgx3MRNOGMdIwJIdnItz80xLBEeaMxZceBDPNmE8Gg94l5wHcEz4
	p4/FRD9NWi7z8RjQ89fAoLUCzoPimAPBZVPWgrAKVGF+ofm0DmLTZNX++7skOxqOTrLBzXunCn2BB
	Tdi+bTniyXNKRkMuevEqwkhIxXDnNdTHk3IJQ3IVprUuf9JRjifJYwC2Ngqjqk8u3ikIJkBkNLHpa
	kqnh5N3p7iaoxSBOY9A5i3hWhAdSE3xOEWloH8LcNeTX4rzTyyltw7Wd6rpYxOuWic2S2u/s7jtOE
	4bZpoELB+tgxZINvAQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8eRV-00ATqB-19;
	Thu, 30 Nov 2023 10:38:49 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8eRR-00AToP-2R
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 10:38:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE4E624000E;
	Thu, 30 Nov 2023 10:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701340723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2o9uX9vrkj04eaNyRdXWxcYczS837OGJ7gj6iTGmilY=;
	b=UoGp5lg0OnE/2Fb0P5Hx25RKvace8C6B9exYB7N4nziLoQ7Ucq44kJ88LK9uJ0qlJ9spAF
	zMCxZAR4GF4LlQorNKWlCaTTgH4AKsMClLNXv6bSea8HPtY9ppo1w7vIRanN/d1BDUCLDk
	6yI6yNif4cJBGOAMLLfAk9kuyDYPhBqnQlwfYArgaJdoXA0sPGHg/XgOVyAxIs3q9fdKDP
	CjlbkcqVOE2QeuyS43x97mkdZKSdija5O/TbMoPO/R8KqwLQ8WFsox3n+UwUXAopfqjEU8
	BtAC/wA0szVIU6K6VthmwSjHjSWngaR0BytVZiaIJ7bcQPxfeaPHC9KlaPaFFQ==
Date: Thu, 30 Nov 2023 11:38:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@broadcom.com, miquel.raynal@bootlin.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v5 4/4] mtd: rawnand: brcmnand: exec_op implementation
Message-ID: <20231130113840.10500927@xps-13>
In-Reply-To: <20231130103624.715263-1-miquel.raynal@bootlin.com>
References: <20231125012438.15191-4-dregan@broadcom.com>
	<20231130103624.715263-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_023845_929889_AED96794 
X-CRM114-Status: GOOD (  10.10  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFRodSwgMzAgTm92IDIw
MjMgMTE6MzY6MjQgKzAxMDA6Cgo+IE9uIFNhdCwgMjAyMy0xMS0yNSBhdCAwMToyNDozOCBVVEMs
IGRyZWdhbkBicm9hZGNvbS5jb20gd3JvdGU6Cj4gPiBGcm9tOiBEYXZpZCBSZWdhbiA8ZHJlZ2Fu
QGJyb2FkY29tLmNvbT4KPiA+IAo+ID4gZXhlY19vcCBpbXBsZW1lbnRhdGlvbiBmb3IgQnJvYWRj
b20gU1RCLCBCcm9hZGJhbmQgYW5kIGlQcm9jIFNvQwo+ID4gVGhpcyBhZGRzIGV4ZWNfb3AgYW5k
IHJlbW92ZXMgdGhlIGxlZ2FjeSBpbnRlcmZhY2UuIEJhc2VkIG9uIGNoYW5nZXMKPiA+IHByb3Bv
c2VkIGJ5IEJvcmlzIEJyZXppbGxvbi4KPiA+IAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2JicmV6
aWxsb24vbGludXgvY29tbWl0LzRlYzZmOGQ4ZDgzZjVhYWNhNWQxODc3ZjAyZDQ4ZGE5NmQ0MWZj
YmEKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9iYnJlemlsbG9uL2xpbnV4L2NvbW1pdC8xMWI0YWNm
ZmQ3NjFjNDkyODY1MmQ3MDI4ZDE5ZmNkNmY0NWU0Njk2Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPiAgCj4gCj4gQXBwbGllZCB0byBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0
IG5hbmQvbmV4dCwgdGhhbmtzLgoKRllJLCBJJ3ZlIGFwcGxpZWQgbWlzYyBzdHlsZSBmaXhlcyBv
biB0b3Agb2YgdGhpcyBwYXRjaC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
