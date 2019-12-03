Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7AAC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 08:42:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D4BE20640
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 08:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iji5KTXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D4BE20640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1EMwJf4WBzXRxIN4/Irqk8fa0r1QIDxO/79jkN7PaY=; b=Iji5KTXKBVEWQd
	jKAPJu5Os3v3uU5/hnBmZQOJyS1IrGr7IFe6NWTbbK9keobLrIwOiBFhDILSVOZlJ2TMIhSaOFHQb
	jlNx10mZLXkQnZIH+JNI3dFQ7yJnYWhIy7thDLROo01YRHgtw9drmX58VlesH/Tb7ZMP+BV02uZkp
	8mwY6prk2kqlIY4ytO8q46euD6ZT4IfqhP75xwZAX+9rzgIptTxW3bbHRiYyy/m3Kgx4b5DaDrqVr
	YvgB0tWtIbk7DozGCBdfNKtrn9X/2dlVia6GVwRJLRx2YoprVUKbas9IUIOZ/FpYX0T6risOhvldk
	HxWthN2UL8rJ412e2G6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic3kc-000556-G8; Tue, 03 Dec 2019 08:41:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic3kY-00054B-MU
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 08:41:40 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ic3kV-0004nh-KB; Tue, 03 Dec 2019 09:41:35 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1ic3kU-000288-NI; Tue, 03 Dec 2019 09:41:34 +0100
Date: Tue, 3 Dec 2019 09:41:34 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: ubifs mount failure
Message-ID: <20191203084134.tgzir4mtekpm5xbs@pengutronix.de>
References: <MN2PR02MB5727000CBE70BAF31F60FEE4AF420@MN2PR02MB5727.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR02MB5727000CBE70BAF31F60FEE4AF420@MN2PR02MB5727.namprd02.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:38:04 up 148 days, 14:48, 142 users,  load average: 0.14, 0.18,
 0.18
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_004138_731029_B20A44D7 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michal Simek <michals@xilinx.com>,
 "siva.durga.paladugu@xililnx.com" <siva.durga.paladugu@xililnx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwNDo1MjozMkFNICswMDAwLCBOYWdhIFN1cmVz
aGt1bWFyIFJlbGxpIHdyb3RlOgo+ICAgIEhpLAo+IAo+ICAgIMKgCj4gCj4gICAgV2UgaGF2ZSB1
cGdyYWRlZCBvdXIgTGludXgga2VybmVsIHRvIDUuNCBmcm9tIDQuMTkuCj4gCj4gICAgQW5kIEkg
dHJpZWQgbW91bnRpbmcgdWJpZnMgdXNpbmcgdGhpcyBrZXJuZWwgb24gTkFORCBwYXJ0aXRpb24g
d2l0aCBiZWxvdwo+ICAgIGNvbW1hbmQgYW5kIHNhdyB0aGF0Cj4gCj4gICAgVGhlcmUgaXMgYW4g
aXNzdWUgd2l0aCBtZW1vcnkgYWxsb2NhdGlvbi4KPiAKPiAgICAjbW91bnQgLXQgdWJpZnMgdWJp
MDpkYXRhIC9tbnQvCj4gCj4gICAgbW91bnQ6IG1vdW50aW5nIHViaTA6ZGF0YSBvbiAvbW50LyBm
YWlsZWQ6IENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkKPiAKPiAgICDCoAo+IAo+ICAgIEkgc2F3IHRo
YXQgdGhlcmUgaXMgYSBjb21taXQgb24gZnMvdWJpZnMvc2IuYywgd2hlcmUgaXQgaXMgYWxsb2Nh
dGluZyBhbGwKPiAgICB0aGUgcmVxdWlyZWQgbWVtb3JpZXMgYXQgb25lIHNob3QuCj4gCj4gICAg
WzFdaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvOS83LzcyNAo+IAo+ICAgIEJ5IHJldmVydGlu
ZyB0aGUgYWJvdmUgcGF0Y2gsIEkgYW0gYWJsZSB0byBtb3VudCBzdWNjZXNzZnVsbHkgdGhlIHVi
aWZzLgo+IAo+ICAgIEJ5IHJldmVydGluZyB0aGlzIHBhdGNoLCB3ZSBhcmUgYWxsb2NhdGluZywg
d3JpdGluZyBhbmQgZnJlZWluZyBpbiBhCj4gICAgbWFubmVyIHN1Y2ggdGhhdCwgd2UgZG9u4oCZ
dCBzZWUgbWVtb3J5IGFsbG9jYXRpb24gaXNzdWVzLgoKU29ycnksIEkgY2FuJ3Qgc2VlIGhvdyB0
aGlzIHBhdGNoIGNhdXNlcyBmYWlsaW5nIG1lbW9yeSBhbGxvY2F0aW9ucy4gQW5kCm5vLCB0aGlz
IGlzIG5vdCBleHBlY3RlZC4gQ291bGQgeW91IHNwcmlua2xlIHNvbWUgcHJpbnRrcyBhbmQgdHJh
Y2sgZG93bgp3aGVyZSBpdCBmYWlscz8gSXMgaXQgdGhlIG9idmlvdXMgcGxhY2UgaGVyZToKCglp
ZiAoIXN1cCB8fCAhbXN0IHx8ICFpZHggfHwgIWlubyB8fCAhY3MpIHsKCQllcnIgPSAtRU5PTUVN
OwoJCWdvdG8gb3V0OwoJfQoKSWYgeWVzLCB3aGljaCBhbGxvY2F0aW9uIGZhaWxzIGFuZCBob3cg
bXVjaCBtZW1vcnkgZGlkIHdlIHRyeSB0byBhbGxvY2F0ZT8KSWYgbm8sIHdoZXJlIGRvZXMgaXQg
ZmFpbD8gQWxzbywgd2hlcmUgYXJlIHlvdSB1c2luZyBVQklGUy4gSXMgaXQgTkFORCBmbGFzaApv
ciBOT1IgZmxhc2g/CgpTYXNjaGEKCi0tIApQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfApTdGV1ZXJ3YWxkZXIg
U3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRl
LyAgfAozMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZTog
KzQ5LTUxMjEtMjA2OTE3LTAgICAgfApBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAg
ICAgICAgICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
