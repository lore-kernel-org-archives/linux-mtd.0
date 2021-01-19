Return-Path: <SRS0=wdd2=GW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F256C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 14:38:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 064B9206E5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 14:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 064B9206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y75nYFVWElCGLarMKhPXTpWLDbEeGT0+Ku1WpseP884=; b=wSxbM2xtkGCMzRrHLIusPuB69
	1pESZ+Iz7bwdSXMFy8FKdLtMyWscqEo7SCF8Zeuh7TNlpschxR4sFDr1BX0w0zP7+S0y/wMyxNQns
	4XVtd4Y9eWOk4pU3LdKjZkhTFfRsUSq8j2BkiFBM7QoUgfL8wbe2fHtTdt1LlIxMCttWmK5A8nvf5
	BVDrnKde2qIVxq6kNPkzkoQTZYzgIxlDY2GPYww0B7W7/JgF170mlWwICfWBx8b7cyhVwUbt3wrwG
	N1vXLFGZC3X78BnpKWkTmdt4uPLaxpYr5sNLuPedmDda52p7KFs6lBTa2OvmGenAAUhxkWj6RLs6H
	uD2VdyEnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1s7c-0004d5-Ov; Tue, 19 Jan 2021 14:36:40 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1s7a-0004cH-1h
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2021 14:36:39 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2D6A1C000B;
 Tue, 19 Jan 2021 14:36:32 +0000 (UTC)
Date: Tue, 19 Jan 2021 15:36:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
Message-ID: <20210119153521.7d5de79d@xps13>
In-Reply-To: <CAHCN7xJUCsOvmtkYgWU7+_H4jMDJe7fNnpJuuRov+Qu7qh+xGg@mail.gmail.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
 <20210114164224.5d21c170@xps13>
 <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
 <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com>
 <20210115171736.1c837c29@xps13>
 <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
 <20210119125634.6d4c5c1e@xps13>
 <CAHCN7xJUCsOvmtkYgWU7+_H4jMDJe7fNnpJuuRov+Qu7qh+xGg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_093638_184804_CC61C3D0 
X-CRM114-Status: GOOD (  14.14  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWRhbSwKCj4gPiAtLS04PC0tLQo+ID4KPiA+IEF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IERhdGU6ICAgVHVlIEphbiAxOSAxMjoyNzowNyAy
MDIxICswMTAwCj4gPgo+ID4gICAgIHdpcDogZml4IG9tYXAKPiA+Cj4gPiAgICAgU2lnbmVkLW9m
Zi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ICAKPiBU
aGFua3MgZm9yIGZpeGluZyB0aGlzLgo+IAo+IEkgdGVzdGVkIHlvdXIgcGF0Y2gsIGFuZCBJIG5v
IGxvbmdlciBnZXQgYSBQYW5pYyBhbmQgdGhlIE1URCBkZXZpY2UKPiBhcHBlYXJzIHRvIGFwcGVh
ciBjb3JyZWN0bHk6Cj4gCj4gbXRkb29wczogbXRkIGRldmljZSAobXRkZGV2PW5hbWUvbnVtYmVy
KSBtdXN0IGJlIHN1cHBsaWVkCj4gb21hcDItbmFuZCAzMDAwMDAwMC5uYW5kOiBHUElPIGxvb2t1
cCBmb3IgY29uc3VtZXIgcmIKPiBvbWFwMi1uYW5kIDMwMDAwMDAwLm5hbmQ6IHVzaW5nIGRldmlj
ZSB0cmVlIGZvciBHUElPIGxvb2t1cAo+IG9mX2dldF9uYW1lZF9ncGlvZF9mbGFnczogcGFyc2Vk
ICdyYi1ncGlvcycgcHJvcGVydHkgb2Ygbm9kZQo+ICcvb2NwQDY4MDAwMDAwL2dwbWNANmUwMDAw
MDAvbmFuZEAwLDBbMF0nIC0gc3RhdHVzICgwKQo+IGdwaW8gZ3Bpb2NoaXA2OiBQZXJzaXN0ZW5j
ZSBub3Qgc3VwcG9ydGVkIGZvciBHUElPIDAKPiBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0
dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhiYwo+IG5hbmQ6IE1pY3JvbiBNVDI5RjRHMTZBQkJE
QTNXCj4gbmFuZDogNTEyIE1pQiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBwYWdlIHNpemU6
IDIwNDgsIE9PQiBzaXplOiA2NAo+IG5hbmQ6IHVzaW5nIE9NQVBfRUNDX0JDSDhfQ09ERV9IV19E
RVRFQ1RJT05fU1cKPiA2IGNtZGxpbmVwYXJ0IHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmlj
ZSBvbWFwMi1uYW5kLjAKPiBDcmVhdGluZyA2IE1URCBwYXJ0aXRpb25zIG9uICJvbWFwMi1uYW5k
LjAiOgo+IC4uLgoKR29vZCB0byBrbm93LiBDYW4geW91IGp1c3QgdGVsbCBtZSBpZiB0aGUgdmFs
dWVzIG9mCi0gY2hpcC0+ZWNjLmJ5dGVzIHZzLiBlbmdpbmVfY29uZi0+Y29kZV9zaXplCi0gY2hp
cC0+ZWNjLnN0ZXBzIHZzLiBlbmdpbmVfY29uZi0+bnN0ZXBzCmFyZSB0aGUgc2FtZSBpbiBib3Ro
IGNhc2VzICh5b3VyIHBhdGNoIGFuZCBtaW5lKT8gT3RoZXJ3aXNlIHlvdXIgZGF0YQptaWdodCBh
cHBlYXIgY29ycnVwdGVkIHNvbWVob3cuCgo+IAo+IFdoZW4geW91IHN1Ym1pdCBhIGZvcm1hbCBw
YXRjaCwgQ0MgbWUgb24gdGhlIHBhdGNoLCBhbmQgSSdsbCByZXNwb25kCj4gd2l0aCBhICd0ZXN0
ZWQtYnknCgpPZiBjb3Vyc2UsIEknbGwgYWxzbyBhZGQgYSBSZXBvcnRlZC1ieS4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
