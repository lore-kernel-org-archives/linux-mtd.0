Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB20C169C4
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 08:35:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 347F32075B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 08:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G3DE0nG8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 347F32075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOd7BZHNwYqtA/t96LHyO826FQVC51glLxKHwyBASh0=; b=G3DE0nG8MgFKah
	RaVLFOq8oEz2wRsDS2CUjQAMPAYpfQ3opypvINATm+qqiI5SWig4ksv/XEbDPod/dUpcfLle5hyy3
	xrG7cmkx71U36RPA9Jgg0mgy1lg6aMGQ0u31s6rvPYw+K3SgNgGlv0PzaPOe9W8zOJqHuQVzSY9bv
	ZeZSjgx14/w9HKmYYLZic+XjJxO0+3jSi0xCXUf9++aQOwW5MruDC1qVZs3GW2vj3vX30kGBluIUk
	pnfWiDAuWz9Vl85e9QhvdPssdjlmq7cFj9uVNj/gm4UzemtqZzDW2r6/F8fBiHibzWwf+5t0tObt8
	k55/NU6rGV3rgrI18mvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grIgU-0001yE-IR; Wed, 06 Feb 2019 08:35:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grIgK-0001xW-RS
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2019 08:35:46 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 53BD827D9D7;
 Wed,  6 Feb 2019 08:35:42 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Martin Kepplinger <martin.kepplinger@ginzinger.com>, han.xu@nxp.com,
 bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Subject: Re: [v2] mtd: rawnand: gpmi: fix MX28 bus master lockup problem
Date: Wed,  6 Feb 2019 09:35:33 +0100
Message-Id: <20190206083533.14104-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205155251.18733-1-martin.kepplinger@ginzinger.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 803f4316fb74bf46a268d53bd1d95e7bf20e7350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_003545_013786_CB924D84 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
 Fabio Estevam <festevam@gmail.com>,
 Your Name <patch-notifications@your-domain.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogWW91ciBOYW1lIDxwYXRjaC1ub3RpZmljYXRpb25zQHlvdXItZG9tYWluLmNvbT4KCk9u
IFR1ZSwgMjAxOS0wMi0wNSBhdCAxNTo1Mjo1MSBVVEMsIE1hcnRpbiBLZXBwbGluZ2VyIHdyb3Rl
Ogo+IERpc2FibGUgQkNIIHNvZnQgcmVzZXQgYWNjb3JkaW5nIHRvIE1YMjMgZXJyYXR1bSAjMjg0
NyAoIkJDSCBzb2Z0Cj4gcmVzZXQgbWF5IGNhdXNlIGJ1cyBtYXN0ZXIgbG9jayB1cCIpIGZvciBN
WDI4IHRvby4gSXQgaGFzIHRoZSBzYW1lCj4gcHJvYmxlbS4KPiAKPiBPYnNlcnZlZCBwcm9ibGVt
OiBvbmNlIHBlciAxMDAsMDAwKyBNWDI4IHJlYm9vdHMgTkFORCByZWFkIGZhaWxlZCBvbgo+IERN
QSB0aW1lb3V0IGVycm9yczoKPiBbICAgIDEuNzcwODIzXSBVQkk6IGF0dGFjaGluZyBtdGQzIHRv
IHViaTAKPiBbICAgIDIuNzY4MDg4XSBncG1pX25hbmQ6IERNQSB0aW1lb3V0LCBsYXN0IERNQSA6
MQo+IFsgICAgMy45NTgwODddIGdwbWlfbmFuZDogQkNIIHRpbWVvdXQsIGxhc3QgRE1BIDoxCj4g
WyAgICA0LjE1NjAzM10gZ3BtaV9uYW5kOiBFcnJvciBpbiBFQ0MtYmFzZWQgcmVhZDogLTExMAo+
IFsgICAgNC4xNjExMzZdIFVCSSB3YXJuaW5nOiB1YmlfaW9fcmVhZDogZXJyb3IgLTExMCB3aGls
ZSByZWFkaW5nIDY0Cj4gYnl0ZXMgZnJvbSBQRUIgMDowLCByZWFkIG9ubHkgMCBieXRlcywgcmV0
cnkKPiBbICAgIDQuMTcxMjgzXSBzdGVwIDEgZXJyb3IKPiBbICAgIDQuMTczODQ2XSBncG1pX25h
bmQ6IENoaXA6IDAsIEVycm9yIC0xCj4gCj4gV2l0aG91dCBCQ0ggc29mdCByZXNldCB3ZSBzdWNj
ZXNzZnVsbHkgZXhlY3V0ZWQgMSwwMDAsMDAwIE1YMjggcmVib290cy4KPiAKPiBJIGhhdmUgYSBx
dW90ZSBmcm9tIE5YUCByZWdhcmRpbmcgdGhpcyBwcm9ibGVtLCBmcm9tIEp1bHkgMTh0aCAyMDE2
Ogo+IAo+ICJBcyB0aGUgaS5NWDIzIGFuZCBpLk1YMjggYXJlIG9mIHRoZSBzYW1lIGdlbmVyYXRp
b24sIHRoZXkgc2hhcmUgbWFueQo+IGNoYXJhY3RlcmlzdGljcy4gVW5mb3J0dW5hdGVseSwgYWxz
byB0aGUgZXJyYXRhcyBtYXkgYmUgc2hhcmVkLgo+IEluIGNhc2Ugb2YgdGhlIGRvY3VtZW50ZWQg
ZXJyYXRhcyBhbmQgdGhlIHdvcmthcm91bmRzLCB5b3UgY2FuIGFsc28KPiBhcHBseSB0aGUgd29y
a2Fyb3VuZCBzb2x1dGlvbiBvZiBvbmUgZGV2aWNlIG9uIHRoZSBvdGhlciBvbmUuIFRoaXMgaGF2
ZQo+IGJlZW4gcmVwb3J0ZWQsIGJ1dCBJ4oCZbSBhZnJhaWQgdGhhdCB0aGVyZSBhcmUgbm90IGFu
IGVzdGltYXRlZCBkYXRlIGZvcgo+IHVwZGF0aW5nIHRoZSBFcnJhdGEgZG9jdW1lbnRzLgo+IFBs
ZWFzZSBhY2NlcHQgb3VyIGFwb2xvZ2llcyBmb3IgYW55IGluY29udmVuaWVuY2VzIHRoaXMgbWF5
IGNhdXNlLiIKPiAKPiBGaXhlczogNmYyYTZhNTI1NjBhICgibXRkOiBuYW5kOiBncG1pOiByZXNl
dCBCQ0ggZWFybGllciwgdG9vLCB0byBhdm9pZAo+IE5BTkQgc3RhcnR1cCBwcm9ibGVtcyIpCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBNYW5mcmVkIFNjaGxh
ZWdsIDxtYW5mcmVkLnNjaGxhZWdsQGdpbnppbmdlci5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWFy
dGluIEtlcHBsaW5nZXIgPG1hcnRpbi5rZXBwbGluZ2VyQGdpbnppbmdlci5jb20+Cj4gUmV2aWV3
ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gUmV2aWV3
ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiBBY2tlZC1ieTogSGFu
IFh1IDxoYW4ueHVAbnhwLmNvbT4KCkFwcGxpZWQgdG8gaHR0cDovL2dpdC5pbmZyYWRlYWQub3Jn
L2xpbnV4LW10ZC5naXQgbXRkL2ZpeGVzLCB0aGFua3MuCgp5J2FsbCBjb21lIGJhY2sgbm93IQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
