Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61916C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPxv9Hu5OqoaSBVt7/S4b2V0XkiS404jo1AqEO+K70Y=; b=MFqPpnIHn/NOGT
	jmSF1mkr/huyF4KyBZbUEdAhttDUTH86MyHmOZnCkMe/qdrfa38OCSXf3ok3NYN65R5m/ADCLZmsT
	N0GT8SVOwX34HkRbY6zfoioaSwca9YhB4YChBv43/jATZMk1sfkPfNqm7jXLwBuebH80q0TzlF2NL
	dXMXGFbjjtfwkYsvLrqtK933FufRla/6+kaVTU8gLifuP3T742I1jNShefT+XtIbncI7ZmBtYoTgN
	1ucMwEzFpb7YzpjFSys6Wc6YRFjuQYXARbjpnSuylFxlYr0uJS7hQ9rfdNNcGvepIpbr39lO02O+Y
	fPXCkKDrTTBVqh0Vu2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzbnk-006HJG-0q; Tue, 21 Dec 2021 09:51:20 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzbnY-006HH6-V2
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 09:51:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 471A9240006;
 Tue, 21 Dec 2021 09:51:00 +0000 (UTC)
Date: Tue, 21 Dec 2021 10:50:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 01/14] spi: spi-mem: Fix a DTR related check in
 spi_mem_dtr_supports_op()
Message-ID: <20211221105058.69822ac5@xps13>
In-Reply-To: <20211220183917.m3mywavgxsgq7yar@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-2-miquel.raynal@bootlin.com>
 <20211220183917.m3mywavgxsgq7yar@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_015109_168884_B47200F8 
X-CRM114-Status: GOOD (  19.98  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBUdWUsIDIxIERlYyAyMDIxIDAw
OjA5OjE5ICswNTMwOgoKPiBPbiAxNy8xMi8yMSAwNToxNlBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gSXQgc2VlbXMgdGhhdCB0aGUgbnVtYmVyIG9mIGNvbW1hbmQgYnl0ZXMgbXVzdCBiZSAi
MiIgb25seSB3aGVuIHRoZQo+ID4gY29tbWFuZCBpdHNlbGYgaXMgc2VudCBpbiBEVFIgbW9kZS4g
VGhlIGN1cnJlbnQgbG9naWMgY2hlY2tzIGlmIHRoZQo+ID4gbnVtYmVyIG9mIGNvbW1hbmQgYnl0
ZXMgaXMgIjIiIHdoZW4gYW55IG9mIHRoZSBjeWNsZXMgaXMgYSBEVFIgY3ljbGUuIEl0Cj4gPiBp
cyBsaWtlbHkgdGhhdCBzbyBmYXIgbm8gZGV2aWNlIHdhcyBhY3R1YWxseSBtaXhpbmcgRFRSL25v
bi1EVFIgY3ljbGVzCj4gPiBpbiB0aGUgc2FtZSBvcGVyYXRpb24sIGV4cGxhaW5pbmcgd2h5IHRo
aXMgd2FzIGxlZnQgdW5kZXRlY3RlZCB1bnRpbAo+ID4gbm93LiAgCj4gCj4gVGhpcyB3YXMgaW50
ZW50aW9uYWwuIHNwaV9tZW1fZHRyX3N1cHBvcnRzX29wKCkgbXVzdCBvbmx5IGJlIGNhbGxlZCB3
aGVuIAo+IHRoZSBvcGVyYXRpb24gaXMgRFRSIGluIGFsbCBwaGFzZXMgc28gSSBkaWQgbm90IGFk
ZCBhbnkgc2FuaXR5IGNoZWNrcyBpZiAKPiBzb21lb25lIHdhcyB1c2luZyBpdCBmb3Igbm9uLURU
UiBvcHMuCgpNYXliZSB0aGF0IHdhcyB0aGUgb3JpZ2luYWwgaW50ZW50aW9uIGJ1dCBzaW5jZSB0
aGVuIHRoZSBNYWNyb25peApkcml2ZXIgaGFzIGJlZW4gbWVyZ2VkIGFuZCBzdXBwb3J0cyAoYXQg
bGVzdCBkb2VzIG5vdCByZWplY3QpIHRoZXNlCm1vZGVzLgoKPiBJbiBmYWN0LCBJIGFkZGVkIG9u
IHRvIHRoaXMgCj4gZnVuY3Rpb24gaW4gWzBdIHRvIGNoZWNrIG5ieXRlcyBmb3Igb3RoZXIgcGhh
c2VzIGFzIHdlbGwuIFRoZSBwYXRjaCBmZWxsIAo+IG9mZiBteSByYWRhciB1bmZvcnR1bmF0ZWx5
LCBhbmQgaXQgZGlkbid0IGdldCBtZXJnZWQuCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhp
cyBhcyBpdCBpcyBzaW5jZSB3ZSBoYXZlIG5vIHVzZXIgb2YgbWl4ZWQgCj4gRFRSL25vbi1EVFIg
bW9kZXMgeWV0LgoKSSBkb24ndCBrbm93IGlmIHRoZSBNYWNyb25peCBkcml2ZXIgcmVhbGx5IHN1
cHBvcnRzIGl0IG9yIGlmIGl0IGlzIHRoZQpkcml2ZXIgdGhhdCBpcyBkb2luZyB0aGUgd3Jvbmcg
Y2hlY2tzIGJ1dCBpbiBhcHBlYXJhbmNlIHN1Y2ggbWl4ZWQgbW9kZQpjb3VsZCBiZSB1c2VkLgoK
PiBCdXQgaWYgeW91IHJlYWxseSB3YW50IHRvIHN1cHBvcnQgaXQsIHBsZWFzZSAKPiBhcHBseSBt
eSBwYXRjaCBmaXJzdCB0byBtYWtlIHN1cmUgd2UgY2hlY2sgZm9yIGV2ZXJ5IHBoYXNlLCBub3Qg
anVzdCAKPiBjb21tYW5kLgo+IAo+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MTA1MzExODE3NTcuMTk0NTgtNS1wLnlhZGF2QHRpLmNvbS8KCk5pY2UsIEkgbWlnaHQgdGFrZSB0
aGF0IGFzIHdlbGwgaW5kZWVkIGluIG9yZGVyIHRvIG1ha2UgdGhlIGNoZWNrcyBhCmxpdHRsZSBi
aXQgbW9yZSByb2J1c3QuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
