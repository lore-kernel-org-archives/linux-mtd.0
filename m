Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B50C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 08:17:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AA92073F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 08:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mhafWphg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43AA92073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FGaI31rfODpJHfW30lxo4mvt8tz5Rgxun+xMfy/x1s=; b=mhafWphgWpdbJm
	IYSGExdH2hQjm1f0v6IKTtf64BMtb+/yooGEH9LdhY3kbzKu84kkFRiQjwjwD15VsBj+T8s99xhIS
	68y1wl4COtwroTGC8/1fIRRGBgWu68pMWl3F+9AQKSDbDyYh/SL2D56olLElYU74Vi6QvQEvHKBpf
	KCkraIe1eQ7JSc/R9uN52Qyz55TgupGLjx+sv0dL3asd71K7YZQh9YEp3N41P27wJCjkekfUGERPu
	cZLjeQqc0MiawQ6pn3ejkfhq/rmhRf0jVlqnZmB6D3eSP4gTLVWHRcovqht7L/TvCCmi25Pol8T/5
	EYi1W5SrqMmqaND1irmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGfka-000853-0G; Wed, 17 Apr 2019 08:17:00 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGfkW-00084g-NL
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 08:16:58 +0000
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id AFC46200018;
 Wed, 17 Apr 2019 08:16:50 +0000 (UTC)
Date: Wed, 17 Apr 2019 10:16:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 10/14] dma: mxs: Drop unnecessary flag
Message-ID: <20190417101649.1e01ac0a@xps13>
In-Reply-To: <20190409113421.3037-11-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-11-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_011656_904961_9435640C 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmlub2QsCgpTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+IHdyb3RlIG9u
IFR1ZSwgIDkgQXByIDIwMTkKMTM6MzQ6MTcgKzAyMDA6Cgo+IFRoZSBteHMgZG1hIGRyaXZlciBp
bnNpc3RzIG9uIGhhdmluZyB0aGUgRE1BX1BSRVBfSU5URVJSVVBUIGZsYWcgc2V0Cj4gb24gYWxs
IGJ1dCB0aGUgZmlyc3QgdHJhbnNmZXIuIFRoZXJlJ3Mgbm8gbmVlZCB0byBsZXQgdGhlIHVzZXIg
c2V0IHRoaXMKPiBmbGFnLCB0aGUgZHJpdmVyIGNhbiBkbyBpdCBpbnRlcm5hbGx5IHdoZW5ldmVy
IGl0IG5lZWRzIGl0LiBEcm9wCj4gaGFuZGxpbmcgb2YgdGhpcyBmbGFnIGZyb20gdGhlIGRyaXZl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU+Cj4gLS0tCgpQYXRjaGVzIDEwLCAxMiwgMTMgb2YgdGhpcyBzZXJpZXMgaGF2ZSByZXBlcmN1
c3Npb25zIG9uIHRoZQpvdGhlciBwYXRjaGVzLCBJIHdvdWxkIGxpa2UgdG8gYXBwbHkgdGhlIHdo
b2xlIHNlcmllcyB0aHJvdWdoIHRoZSBNVEQKdHJlZTsgaXMgdGhpcyBva2F5IGZvciB5b3U/CgpB
Y2tlZC1ieSdzIHdlbGNvbWUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
