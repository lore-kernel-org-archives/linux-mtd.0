Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F3FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZEvh9JBzUB2reEkAqhT+7efq4HhuSYlMiqaygZ5mvw=; b=jlggYB9hc3fomw
	+Mmv3YG/+x8WNXj+5zbvLUcVxKmVTHqCD2eo17G7vYft3WxhRU+76Rth06bXlS+9+tWDAKR51dJ4w
	D3h8Lhnld5fnR0wu/U9pImh3Kq+AGWRuBhgQlYLimy2n1quSZHtEEgT1078IZGvgQPFTBMEVnnDeG
	5ztIvlOVws1FIhkgI3HRT0eC/JfmRBPXDGwFS4C1hu5JljVoqfuKvf101iP772641/zib3jmTvoKi
	RkhCkd1Vb3wdy2jgmhuoU7KjBolZY0dMFiSdS6KSTRGs18NHJff+oYimaO49srpCqUVfCcuVu6utt
	2MIZ4YRcO8l/ekSXzB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogpC1-009S1h-P4; Fri, 07 Oct 2022 15:23:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogpBy-009S0F-MF
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 15:23:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7012EFF806;
	Fri,  7 Oct 2022 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665156189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmcNqaOaGBizoEVhu+VWHQwRfGZF2Bf0f8vNrAhlXPA=;
	b=U6jZVx3vNMms9TcGnLDuXI2CaBwhydW3NgifUpkpq6Af0On6vs2PcZ3AFLceN7qjNIe48l
	V2K1w/lLJ8mynbAA1A41L2MSzlOsOrrcyyZFql3M7owDxPkYDrO6wroZAZ/6dOfGHTu8Y6
	b7b77Uq33adwgoxt+oLuTSryoUyNAcHGwpA93Zmj5Pg1CUuSfXE+SGyBPl88KlCXZ4d4y2
	Vd2X5uCo+sDpIhMQvkXFpsOplSfmLw7opyI8vlqbdjw9VZGmL4Xb3smj6/OuSMR9pjYQpF
	hWc56zSQfcspa/F5lMCURiF02dH+nP+UtOPH+D7yGabFJkCrG0o/ck1qdhCkcw==
Date: Fri, 7 Oct 2022 17:23:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.1
Message-ID: <20221007172306.3d553ca1@xps-13>
In-Reply-To: <20221007164528.0cb403e3@xps-13>
References: <20221007164528.0cb403e3@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_082314_882648_4678EABE 
X-CRM114-Status: UNSURE (   7.34  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgNyBPY3QgMjAy
MiAxNjo0NToyOCArMDIwMDoKCj4gSGVsbG8sCj4gCj4gVGhpcyBpcyB0aGUgTkFORCBQUiBmb3Ig
Ni4xLgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCA1NjgwMzViMDFjZmIxMDdhZjhkMmU0YmQyZmI5YWVhMjJjZjViODY4Ogo+IAo+
ICAgTGludXggNi4wLXJjMSAoMjAyMi0wOC0xNCAxNTo1MDoxOCAtMDcwMCkKPiAKPiBhcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbmFuZC9mb3It
Ni4xCgpQdWxsZWQgaW50byBtdGQvbmV4dC4KCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIGJhNDdhNmFjNDY1OGY4ZmRjY2IyZTM0MDA5MjdkYjUwODFlYjdmYjI6Cj4gCj4gICBt
dGQ6IHJhd25hbmQ6IG1lc29uOiBzdG9wIHN1cHBvcnRpbmcgbGVnYWN5IGNsb2NrcyAoMjAyMi0w
OS0yMSAxMDozODo0NyArMDIwMCkKPiAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
