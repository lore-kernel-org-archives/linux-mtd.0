Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB01E784AF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l//ip+ZDLotgwI475Jn+2EUIskn77XEPOPuarUEtamw=; b=3sfyRETSAoDpTP
	kPYjfAu3Eb5Q176hfetvNoX15do68bVPuPn3cDHQ6nLz1JvM+b0M0zNhhZoED43ZjN/uAjlGHK/Um
	1tkE0cFyibe90232iRLw7+c7UQBkZCHjDDeFzz7CRZDpv3B+y1iKz+rR214GMP8/skK8S6snIe9Qe
	zKW0K4SIf8cLHEeg7zrJnTxZRkb9wnAS9yCURI5i9qNVBZNKBAoWI5mAPfnu7ELvn7KIZ6a+JgVxx
	goiK5+OdMAUQjuaGFuUiPtBH26H3+nXcHR0MMCBLNjz4WJFPkcaB2uvthRcpRhk3j6/wmJ2UbChY0
	+wyL27dju4RIC3Axbc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnFOo-00CFDa-2f;
	Mon, 02 Oct 2023 09:39:34 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnFOk-00CFCf-32;
	Mon, 02 Oct 2023 09:39:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F49BFF80A;
	Mon,  2 Oct 2023 09:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696239565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXizb9gGd7vJ+bHW/cxJRzpuCYpWwyioDAXH0qfuvtk=;
	b=bEhjfkT+X0IqLZRPfwYa0v73V18GcN5X6Bpb+/p1hV//YXZeuITd5nIjeYPecbadt467fc
	UQDlKMBicXXSdQsMB2taV7+R33Sc/f/wEYPk7zchuLLNZZqSLy2VG6xwkkOf6sKUYmpBGr
	2YKP3uTv3Je+ZFs6k/UGqM9J2Ss5LVpfrN6nHlOAQN+p3jQpj30cL0WorQlsBmrCVZsP4G
	FWq1VlLGK0ZyunKux0YcIPT7CLdpF4KZF/SFelIFpZe3mrJy9Lpo0leELuBaRx6sodmocR
	3Euo8HetgP9pFRBaFE4ME2bsfaRtuskvmHm8myywH1ydKZVw3O4PW65wRtUlfQ==
Date: Mon, 2 Oct 2023 11:39:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/6] mtd: parsers: ar7: remove support
Message-ID: <20231002113911.6bf2b73e@xps-13>
In-Reply-To: <ZRUm4DS3qvRfcPox@ninjato>
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
	<20230922061530.3121-3-wsa+renesas@sang-engineering.com>
	<20230922163903.3f49ea2a@xps-13>
	<ZRUm4DS3qvRfcPox@ninjato>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_023931_128246_4E1AE37A 
X-CRM114-Status: GOOD (  12.44  )
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

SGkgV29sZnJhbSwKCndzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tIHdyb3RlIG9uIFRo
dSwgMjggU2VwIDIwMjMgMDk6MTA6MjQKKzAyMDA6Cgo+ID4gSSdtIG5vdCBzdXJlIGl0IGlzIHdp
c2UgdG8gbWVyZ2UgZGVmY29uZmlnIGNoYW5nZXMgdGhyb3VnaCBtdGQuIFdvdWxkCj4gPiB5b3Ug
bWluZCBzZW5kaW5nIHRoaXMgY2hhbmdlIGFzaWRlIHRvIGF2b2lkIHBvdGVudGlhbCBjb25mbGlj
dHM/IEVhY2gKPiA+IHBhdGNoIGNhbiBsaXZlIG9uIHRoZWlyIG93biBhbnl3YXkuICAKPiAKPiBJ
IGNoZWNrZWQgcHhhX2RlZmNvbmZpZyBoaXN0b3J5LiBNb3N0IGNvbW1pdHMgaW4gdGhlIGxhc3Qg
NyB5ZWFycyB3ZXJlCj4ganVzdCByZW1vdmluZyBvdXRkYXRlZCBLY29uZmlnIHN5bWJvbHMgZnJv
bSBhbGwga2luZCBvZiBzdWJzeXN0ZW1zLiBMaWtlCj4gd2hhdCB3ZSB3YW50IHRvIGRvIGhlcmUu
IEkgdGhpbmsgaXQgaXMgb2theSB0byBrZWVwIGl0Lgo+IAoKT2ssIEkndmUgYWNrZWQgdGhlIHBh
dGNoIGFueXdheSwgc28gbm93IEkgZXhwZWN0IGl0IHRvIGJlIHRha2VuIHRocm91Z2gKdGhlIG1p
cHMgdHJlZSBhcyBzdWdnZXN0ZWQgZWFybGllci4gTGV0IG1lIGtub3cgaWYgaXQncyBoYXBwZW5p
bmcKZGlmZmVyZW50bHkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
