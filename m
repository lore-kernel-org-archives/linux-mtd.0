Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73788C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:23:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 470892067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zt7O6ijZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 470892067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ha1BwKKx3ygpehSgyxpJalc8Aa4fRE/pLdwlWyVP6w=; b=Zt7O6ijZh+lmZ+
	/we97kYT+fGi37oQr4rcMg/MakRis8YeOwM0gC8IBGKIx1K7EuQsjPx5dNojhOkNCH7/asvzg2Er+
	zs1793vxshArWTMKlgUdnLCeYBlGSJBXw9DMJ0pONFacm4JgOe7uick+EyiNmTQaRMSnrmy9d9TnX
	Vwz6/H410I3hc+JHs1JQYCB2g6QHziL9wpijC9wqBbuKnlE1RKS8PZIKms1o/H4/2TQsmnVk1yIYw
	PL5E6tR3kg8NWFjzpr02IPZEwVfypsPZ+vLEBbcApF/U3dttDpv5jF7rIsHqQfjm8Y+Jp2nwCzHml
	V+lt7Tg1VlfWqYk8kavw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipaaE-000112-9U; Thu, 09 Jan 2020 16:22:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipaPk-0005yg-JR
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:12:06 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D3E8AC0005;
 Thu,  9 Jan 2020 16:12:01 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:12:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [EXT] [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <20200109171200.49f299e5@xps13>
In-Reply-To: <20191119092704.mz4pie37z6ngxyyn@pengutronix.de>
References: <20191108074852.18507-1-m.felsch@pengutronix.de>
 <DM6PR08MB6396AB87FEE731C7B3588358B84D0@DM6PR08MB6396.namprd08.prod.outlook.com>
 <20191118140951.dlvsozieeatnmd7d@pengutronix.de>
 <20191118183954.4091abdc@collabora.com>
 <20191119092704.mz4pie37z6ngxyyn@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_081204_799375_E8993DD5 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, "Shivamurthy Shastri
 \(sshivamurthy\)" <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyY28sCgo+ID4gPiA+IAo+ID4gPiA+IEkgdGhpbmssIHRoaXMgc2hvdWxkIGJlIE5BTkRf
RUNDUkVRKDQsIDUxMikuICAgIAo+ID4gPiAKPiA+ID4gSSBkb24ndCB0aGlua3Mgc28sIGFjY29y
ZGluZyB0aGUgZGF0YXNoZWV0IFsxXSwgc2VjdGlvbiBFQ0MgUHJvdGVjdGlvbjoKPiA+ID4gCj4g
PiA+IDg8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gRHVyaW5n
IGEgUFJPR1JBTSBvcGVyYXRpb24sIHRoZSBkZXZpY2UgY2FsY3VsYXRlcyBhbiBFQ0MgY29kZSBv
biB0aGUgMmsKPiA+ID4gcGFnZSBpbiB0aGUgY2FjaGUgcmVnaXN0ZXIsIGJlZm9yZSB0aGUgcGFn
ZSBpcyB3cml0dGVuIHRvIHRoZSBOQU5ECj4gPiA+IEZsYXNoIGFycmF5LiBUaGUgRUNDIGNvZGUg
aXMgc3RvcmVkIGluIHRoZSBzcGFyZSBhcmVhIG9mIHRoZSBwYWdlLgo+ID4gPiA4PC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAKPiA+IAo+ID4gTG9va2luZyBhdCAiVGFi
bGUgMTE6IEVDQyBQcm90ZWN0aW9uIiBpdCByZWFsbHkgc2VlbXMgdG8gYmUgNGJpdC81MTIuIEkK
PiA+IHRoaW5rIHRoZSBzZW50ZW5jZSB5b3UgcXVvdGVkIGp1c3QgbWVhbnMgdGhlIEVDQyBpcyBj
YWxjdWxhdGVkIGZvciBlYWNoCj4gPiA1MTIgYnl0ZXMgYmxvY2sgaW4gdGhlIHBhZ2UgYW5kIHdy
aXR0ZW4gYXQgb25jZSAobm8gc3VicGFnZSB3cml0ZSkuICAKPiAKPiBZZXMgdGhhdCBwYXJ0IGNv
bmZ1c2VzIG1lIGEgYml0IGFuZCB0aGFuIEkgdXNlZCB0aGUgZGVzY3JpcHRpb24gYWJvdmUuLgo+
IEkgd2lsbCBjaGFuZ2UgdGhhdCwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uCj4gCj4gPiBC
VFcsIHRoZXJlJ3MgYW4gZWFzeSB3YXkgdG8ga25vdyB3aG8ncyByaWdodCA9PiBuYW5kYml0ZXJy
cy4gIAo+IAo+IFRoYW5rcyBmb3IgdGhhdCBoaW50IDopCj4gCj4gUmVnYXJkcywKPiAgIE1hcmNv
CgpXb3VsZCB5b3UgbWluZCBzZW5kaW5nIGFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGlzIHBhdGNo
IHBsZWFzZT8KClRoYW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
