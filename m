Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A198DC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 08:48:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E7E120678
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 08:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FDebFeOR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E7E120678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=emrCnNWV5xla5YmOIEJzeP22yaGQ7uYlCS62RprBw1M=; b=FDebFeORVZcHAjgaEA0+t3Awe
	LkLwqWnAnrNpCtnkt9vDHFkCpAcr4C2NMHKLlkgsMywIOyrd8mKKMlkPNKx+1L7Z0r9YxiXQnEE/o
	iaCfaU/Th0vZK4FqgKIbPi8zGlPBNzXANGd89KenIl0i70uVvM0O8/vAf89k23EWZymsvjE8shFyM
	+1yHs8inFeuftpi1rw8zQ8wvQVD0kYgJbfcP5NxoXKeL5ZNVNVHn45ufhnZInHasSL1npLag4oyci
	GlDaLv/DDoMVPHgpTpRYKguCpGcn7lgOynpR5UDcVYp39XqjLKKVfciTg34xRzOoxzf2StYP+yL1x
	wuQrC0otQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2W86-0002gC-Km; Mon, 03 Aug 2020 08:47:34 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2W83-0002fZ-TX
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 08:47:32 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 343A620009;
 Mon,  3 Aug 2020 08:47:28 +0000 (UTC)
Date: Mon, 3 Aug 2020 10:47:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: Invalid ONFI PARAM PAGE
Message-ID: <20200803104727.1edf834e@xps13>
In-Reply-To: <20200730121425.rjeo6qh4fxisargl@pengutronix.de>
References: <20200730121425.rjeo6qh4fxisargl@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_044732_061360_D9D8318A 
X-CRM114-Status: GOOD (  16.28  )
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
Cc: bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
 peterpandong@micron.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyY28sCgpNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUaHUsIDMwIEp1bCAyMDIwCjE0OjE0OjI1ICswMjAwOgoKPiBIaSwKPiAKPiBhIGN1c3RvbWVy
IG9mIHVzIHVzZXMgbWljcm9uIG5hbmQgZmxhc2ggZGV2aWNlcyBmb3IgdGhlaXIgbG9jYWwgc3Rv
cmFnZS4KPiBUaGV5IGFyZSBub3cgaGF2aW5nIHNvbWUgdHJvdWJsZXMgd2l0aCBhIGZldyBkZXZp
Y2VzLiBMZXQgbWUgc3RhcnQgd2l0aAo+IHRoZSBmb2xsb3dpbmc6Cj4gICAxKSBXZSBjYW4gc3Vj
Y2Vzc2Z1bGx5IHJlYWQgdGhlIG5hbmQgaWQgZmllbGQgYnk6Cj4gICAgICAtPiBzZWxlY3RfY2hp
cAo+ICAgICAgLT4gY21kZnVuYyhtdGQsIE5BTkRfQ01EX1JFU0VUKQo+ICAgICAgLT4gY21kZnVu
YyhtdGQsIE5BTkRfQ01EX1JFQURJRCkgQWRkcj0weDAwCj4gICAgICAtPiA4dGltZXM6IHJlYWRf
Ynl0ZShtdGQpICAKPiAKPiAgICAgIFRoZSBOQU5EIGRldmljZSByZXNwb25zZSB3aXRoIHRoZSBm
b2xsb3dpbmc6Cj4gICAgICBuYW5kOiBpZF9kYXRhWzBdOiAweDJjCj4gICAgICBuYW5kOiBpZF9k
YXRhWzFdOiAweGRjCj4gICAgICBuYW5kOiBpZF9kYXRhWzJdOiAweDkwCj4gICAgICBuYW5kOiBp
ZF9kYXRhWzNdOiAweDk1Cj4gICAgICBuYW5kOiBpZF9kYXRhWzRdOiAweDU2Cj4gICAgICBuYW5k
OiBpZF9kYXRhWzVdOiAweDAKPiAgICAgIG5hbmQ6IGlkX2RhdGFbNl06IDB4MAo+ICAgICAgbmFu
ZDogaWRfZGF0YVs3XTogMHgwCj4gCj4gICAgICBBY2Nyb2RpbmcgdGhlIHNjaGVtYXRpYyBhbmQg
dGhlIGRhdGFzaGVldCB0aGlzIGlzIHJpZ2h0Lgo+IAo+ICAgMikgVG8gZGV0ZWN0IHRoZSBPTkZJ
IGNvbXBhdGliaWxpdHkgd2Ugbm93IGlzc3VlOgo+ICAgICAgLT4gY21kZnVuYyhtdGQsIE5BTkRf
Q01EX1JFQURJRCkgQWRkcj0weDIwICAKPiAKPiAgICAgIGFuZCBnZXR0aW5nIHRoZSBleHBlY3Rl
ZCAnTycsJ04nLCdGJywnSScgc2lnbmF0dXJlLgo+IAo+ICAgIDMpIE5vdyB3ZSBhcmUgdHJ5aW5n
IHRvIFJlYWQgdGhlIFBBUkFNIFBhZ2UgYnk6Cj4gICAgICAgLT4gY21kZnVuYyhtdGQsIE5BTkRf
Q01EX1BBUkFNKQo+ICAgICAgIC0+IHRyeSB0byByZWFkIHRoZSB0aGUgcGFyYW0gcGFnZSBhbmQg
aWYgbm90IHN1Y2Nlc3NmdWwgdHJ5IHRvICAKPiAgICAgICAgICByZWFkIHRoZSBjb3BpZXMuCj4g
Cj4gICAgICAgSGVyZSB0aGluZ3MgZ2V0dGluZyBjcmF6eSBzaW5jZSB3ZSBhcmUgcmVhZGluZyBh
bGwgdGhlIHRpbWUgJzB4ZmYnLgo+IAo+ICAgIDQpIFNpbmNlIEJhcmVib3ggKEJvb3Rsb2FkZXIp
IGNhbid0IHJlYWQgdGhlIE9ORkkgcGFyYW0gcGFnZSB3ZQo+ICAgICAgIGNhbGN1bGF0ZSB0aGUg
dmFsdWVzIGFzIGV4cGVjdGVkIGZyb20gdGhlIHBhcmFtIHBhZ2UuIEJ1dCBub3cgd2UKPiAgICAg
ICBjYW4ndCBhY2Nlc3MgQkJUIChub3QgZm91bmQpIG5vciB3ZSBhcmUgbm90IGFibGUgdG8gd3Jp
dGUgdG8gdGhlCj4gICAgICAgT09CIEFyZWEgKHRoZSBjaGlwIGlzIG5vdCB3cml0ZSBwcm90ZWN0
ZWQpLgo+IAo+IFRoZSBlbGVjdHJpY2FsIHNpZ25hbHMgYXJlIGxvb2tpbmcgZ29vZCBhbmQgc2lu
Y2Ugd2UgY2FuIHJldHJpZXZlIHRoZQo+IGlkLWRhdGEgaXQgc2hvdWxkIGJlIG5vIFBDQiBidWcu
IERpZCBhbnlvbmUgc3RydWdnbGVkIHdpdGggc3VjaCBwcm9ibGVtcwo+IHRvbz8KPiAKPiBCVFc6
Cj4gSSBhbHNvIGdldCAnMHhmZicgaWYgSSBzZW5kIGEgUkVBRF9VTklRVUVfSUQgY29tbWFuZCBh
bmQgdHJ5aW5nIHRvIHJlYWQKPiB0aGUgMTYgY29waWVzIG9mIHRoZSAzMmJ5dGUgdW5pcXVlLWlk
Lgo+IAo+IEFueSBhbnN3ZXJzIGFyZSB3ZWxjb21lIDopCgpDb3VsZCB5b3Ugc2hhcmUgbW9yZSBk
ZXRhaWxzIGFib3V0IHRoZSBzaXR1YXRpb24geW91ciBjdXN0b21lciBpcwpmYWNpbmc/IERpZCB0
aGlzIHdvcmsgYmVmb3JlPyBJcyB0aGlzIGFuIHVwZGF0ZT8gSWYgeWVzIGZyb20gd2hhdAp2ZXJz
aW9uIHRvIHdoYXQgdmVyc2lvbj8gQWxzbywgaXMgdGhpcyBhIExpbnV4IG9yIEJhcmVib3ggaXNz
dWU/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
