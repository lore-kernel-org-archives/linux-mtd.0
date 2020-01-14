Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1B5C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:26:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A5C2075B
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BaiGvWEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A5C2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJzfLPhHH1zXjJ8HHAW+M7WRsTJBovUvdtXDJuGvLzM=; b=BaiGvWEi5SkW41
	R/HxlULYp8ZKNYaKot/M+l/t36egsIdgW3J7WqOPuDh2RCqqkr0xMteXqlpcYaam/43A39YC+lVrm
	ipuNgT+FBoGJPcjcHQxqWJYDX9VBQli0qj+86IB7HI+jLSON4KexSorsrexvyHinohFWT1UweGa/u
	3b25Z97PbJuclaa+Ma7AvIlJXcmqf4CP7AZEfjBTPkYqssgwqSEWIVe5GL7Bd8ho0civN3DdVCA88
	z/VSl0rmOJzFWsI7+1Aap00ht/kUEMS/NxcbDw3IwLdzbBJO4+7asEopZdjXL/smLriurhfFXtsKm
	8/dJk/gcj81O33s63qQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irPxA-0003bE-Hw; Tue, 14 Jan 2020 17:26:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irPx4-0003ai-LV
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:26:06 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B2BA1C0014;
 Tue, 14 Jan 2020 17:25:58 +0000 (UTC)
Date: Tue, 14 Jan 2020 18:25:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
Message-ID: <20200114182557.00b0c6ac@xps13>
In-Reply-To: <CAOMZO5BvO+rSqc8pPkzC=dEa1SkokeDNtgK=W87amWsOUODBgg@mail.gmail.com>
References: <20200102130826.170647-1-esben@geanix.com>
 <20200114170354.918-1-miquel.raynal@bootlin.com>
 <CAOMZO5BvO+rSqc8pPkzC=dEa1SkokeDNtgK=W87amWsOUODBgg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_092602_842063_7C561F86 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Esben Haabendal <esben@geanix.com>, sean@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 martin@geanix.com, Han Xu <han.xu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFR1
ZSwgMTQgSmFuIDIwMjAgMTQ6MDk6MjEKLTAzMDA6Cgo+IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0
IDI6MDQgUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gVGh1LCAyMDIwLTAxLTAyIGF0IDEzOjA4OjI1IFVUQywgRXNiZW4gSGFhYmVu
ZGFsIHdyb3RlOiAgCj4gPiA+IE9uIHN5c3RlbSByZXN1bWUsIHRoZSBncG1pIGNsb2NrIG11c3Qg
YmUgZW5hYmxlZCBiZWZvcmUgYWNjZXNzaW5nIGdwbWkKPiA+ID4gYmxvY2suICBXaXRob3V0IHRo
aXMsIHJlc3VtZSBjYXVzZXMgc29tZXRoaW5nIGxpa2UKPiA+ID4KPiA+ID4gWyAgNjYxLjM0ODc5
MF0gZ3BtaV9yZXNldF9ibG9jayg1Y2JiMGY3ZSk6IG1vZHVsZSByZXNldCB0aW1lb3V0Cj4gPiA+
IFsgIDY2MS4zNDg4ODldIGdwbWktbmFuZCAxODA2MDAwLmdwbWktbmFuZDogRXJyb3Igc2V0dGlu
ZyBHUE1JIDogLTExMAo+ID4gPiBbICA2NjEuMzQ4OTI4XSBQTTogZHBtX3J1bl9jYWxsYmFjaygp
OiBwbGF0Zm9ybV9wbV9yZXN1bWUrMHgwLzB4NDQgcmV0dXJucyAtMTEwCj4gPiA+IFsgIDY2MS4z
NDg5NjFdIFBNOiBEZXZpY2UgMTgwNjAwMC5ncG1pLW5hbmQgZmFpbGVkIHRvIHJlc3VtZTogZXJy
b3IgLTExMAo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFc2JlbiBIYWFiZW5kYWwgPGVzYmVu
QGdlYW5peC5jb20+Cj4gPiA+IEFja2VkLWJ5OiBIYW4gWHUgPGhhbi54dUBueHAuY29tPiAgCj4g
Cj4gU2hvdWxkbid0IHRoaXMgb25lIGNvbnRhaW4gYSBGaXhlcyB0YWcgYW5kIGJlIGJhY2twb3J0
ZWQgdG8gc3RhYmxlPwoKRG9lcyB0aGlzIGhhcyBldmVyIHdvcmtlZCBpbiB0aGUgcGFzdD8gSWYg
eWVzIGNhbiBzb21lb25lIC1Fc2JlbiwgSGFuLQpwcm92aWRlIGEgRml4ZXMgdGFnPyBJJ2xsIGVk
aXQgdGhlIHBhdGNoIGJ5IGhhbmQuIEkgcGxhbiB0byBzZW5kIHRoZSBQUgphdCB0aGUgZW5kIG9m
IHRoZSB3ZWVrLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
