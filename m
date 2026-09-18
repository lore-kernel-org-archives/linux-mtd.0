Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D040C982DA
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNHEecWuIGC4xEDW797Z1G+s6iMM+aIwq2wtnFJDZpc=; b=0om8iFq/0bjdub
	Eb0ETBBRR6AD3ictl3l7Y18bIH6sstiXKQVMtwblBuEA0zrL1oT0IKmmvjfuckSr2njURZ+lbe10A
	27lZsYCmgPFLzEO26GkhjYFSxQ2pAaFgSiCiJTFmrfITDoLdeIPkROU2RsUjot1Y0+D0UDQV9aCuk
	GkwBkWSQfLRgReyUnNAjzmsNNtTJEYf868CZEOuxhOd2+9FphoFZeWfu7ON1kDVrWEQbYapGJ1VAZ
	KRIH/7gQ4eyWfM/YvPvZGFmh+WKnBYmw9OtFu2HRMjn5lfGNq8lwIn/3zEWRR/9A2lANOCXBFdXjH
	5sChI+vciknrsleXQB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YiK-0000000EYE4-0IH7;
	Fri, 18 Sep 2026 13:33:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yhl-0000000EXmk-19fD
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 13:32:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12FFB1A098F;
	Fri, 18 Sep 2026 13:32:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D298B60649;
	Fri, 18 Sep 2026 13:32:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 426E510328D6E;
	Fri, 18 Sep 2026 15:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789738357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WSJ+bdK4/BdLAHMYQcg5Te9L8iE/pJ/8C78C74TJtj8=;
	b=mMPLTtO8rEL7c6EAzlTlZPHY1e3E24/TzUiIzZtqAfFNpoxEgSvuwnpL15nIesJaF/5Bct
	0gW4r3HuCdSFe3qDQd4e/d4Z1wlhOWrr6l3YHgaMM9b9i8SUt76UG9+tFQB9RFwoLOaBjC
	jQ7BkZ5BMWLE7Ol5lAi3oOykUGm5hNfWKs8ENHNfo9Xuwp990L2lMwhknBfry7nPIx1Ena
	b12/cCsSkaKWpLk5VdnZlYemrPl9RA08q2hPlFHGKvO0tf6muRBy362DkJ2K5ad8ya/hwg
	DU+pTRjTvyjMvA0IVh0aIYQYgl0uPnHb9dydJNMIfnTTxWN5KVDVys+aycSsIw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
In-Reply-To: <DLIEOELQERRM.21J9WHMJHGYEB@kernel.org> (Michael Walle's message
	of "Fri, 18 Sep 2026 13:29:24 +0200")
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
	<DLIEOELQERRM.21J9WHMJHGYEB@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 18 Sep 2026 15:32:33 +0200
Message-ID: <87wlsifzwu.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_063241_478721_4D7EF8CB 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

Cj4gSSd2ZSBqdXN0IG5vdGljZWQsIHRoYXQgbmVpdGhlciBsb3JlIG5vciBteSBtYWlsIHNlcnZl
ciByZWNlaXZlZCBhbGwKPiB5b3VyIG1haWxzIGFuZCB0aGVyZSBhcmUgbWlzc2luZyBwYXRjaGVz
Lgo+Cj4gQ291bGQgeW91IHBsZWFzZSBzZW5kIGEgbmV3IHYyPwo+Cj4gVGhhdCBhbHNvIG1lYW5z
LCBJJ3ZlIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIHJldmlldyBwYXRjaGVzIDIsIDUsIDE0LAo+IDE1
LCAxNywgMjIsIDIzLgoKQWgsIHllcywgd2UndmUgaGFkIHF1b3RhIGlzc3VlcyByZWNlbnRseS4g
VGhlc2UgaGF2ZSBiZWVuIChub3JtYWxseSkKZml4ZWQgbm93LiBDZXJ0YWluIHJlY2lwaWVudHMg
aGF2ZSByZWNlaXZlZCBldmVyeXRoaW5nLCBidXQgbm90IGFsbC4gSQp3aWxsIHJlc3BpbiBhIHYy
IHdpdGggdGhlIGNvbW1lbnQgZml4ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
