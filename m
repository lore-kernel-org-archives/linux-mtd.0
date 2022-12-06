Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D8CC3A5A7
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2PaYq37QdIdhHpNYVdwoUSTRVP8CLnDyLCGWloKryc=; b=ICQprKxpqL6RUP
	RO1j9NYuNgUAly+T3JtTdc/6Ns2y7DWZIBVgZb4Jfw4MFmCtaqlYcCueVqWhDJKFrsa2xBNVBL1Zc
	+OlKH5wSqZVAhpuA0XJv+d+huan9ePwIiy7avK2fy7GEbvVc9ELHfZgXzYgE+amH2k1antPh/2hIL
	euI0eLZM3Ljl2iPjqg7vt20y9ESn2S+nAzYde6rQZCpCTjEDercUQXD31SfBMb8VM+X9dSIpzQYJf
	z62UBQZ/8QkZ6vF9tq5fqmIPAKfhTKU4ImtROiBV9/eGcTCahNRjWMnF85V7/yVCgRkVzCSCAfeOv
	zEZVc9+leC23Ogxi6OjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TZi-0057cc-U9; Tue, 06 Dec 2022 08:45:14 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TZg-0057Nn-2F
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2022 08:45:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 03866C000F;
	Tue,  6 Dec 2022 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670316304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6cl1rnR3xranXCRqFQ12KKT4gDfqUOI6n42Vu7Vwzs=;
	b=cIX1sS3YAek55j7cj+1xmwnnV+vAU3/SwWh8NEi7Y3XpdNV3pwW6HjiekX8LWO411xIszN
	62xvEsApMcIsAedb0tZtKfsrDKtxDURrnHbyaV2ZhvnAu69sd2VaeiLdMaO9pDiwHxMgDM
	Uq8oEGYrHuKdP4hmC0IyWwK0sGqeNYhVwJ+PfAD/zcJVVzTgwpL2iBvG4rKnjSfu8x9r0C
	sh2j1/YXXgSdlj5DV7aRgwhiJeXKqYNHuzB3GhMMR2vn5/3cWNwdT1GXJy62VWXnvL9ZpE
	3iFE52dofzk1IVgNhxeyRA7uyiwf84DFgC5LagfggR3xfisg3w2x/aENFxdlxQ==
Date: Tue, 6 Dec 2022 09:44:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vlim <vlim@gigadevice.com>
Cc: Michael Walle <michael@walle.cc>, Victor Lim <victorswlim@gmail.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "vikhyat.goyal@amd.com"
 <vikhyat.goyal@amd.com>, "amit.kumar-mahapatra@amd.com"
 <amit.kumar-mahapatra@amd.com>, "alejandro.carmona@amd.com"
 <alejandro.carmona@amd.com>
Subject: Re: [PATCH] Linux: SPI: add Gigadevice part #
Message-ID: <20221206094459.6c581ebb@xps-13>
In-Reply-To: <TY0PR06MB5658CAF1B83FF3CF92846AA0BB1B9@TY0PR06MB5658.apcprd06.prod.outlook.com>
References: <20221204080000.4100-1-vlim@gigadevice.com>
	<dee37d18f8de5af7d07388031fc08571@walle.cc>
	<TY0PR06MB5658B73E2F22472D0AF48BDBBB1B9@TY0PR06MB5658.apcprd06.prod.outlook.com>
	<20221206091846.02f6396f@xps-13>
	<TY0PR06MB5658CAF1B83FF3CF92846AA0BB1B9@TY0PR06MB5658.apcprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_004512_434156_C68D1E3C 
X-CRM114-Status: UNSURE (   7.15  )
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

SGkgVmxpbSwKCnZsaW1AZ2lnYWRldmljZS5jb20gd3JvdGUgb24gVHVlLCA2IERlYyAyMDIyIDA4
OjI3OjAyICswMDAwOgoKPiBIaSwgTWljaGFlbCwgTWlndWVsLAo+IAo+IFRoaXMgaXMgdG8gYWRk
IG1hbnkgcGFydCBudW1iZXJzIHRvIHRoZSBnaWdhZGV2aWNlLmMgc28gdGhhdCBMaW51eCB3b3Vs
ZCByZWNvZ25pemUgdGhlc2UgcGFydCBudW1iZXJzIGR1cmluZyBib290aW5nIHVwLgo+IAo+IENh
biBJIG1ha2Ugb25lIHBhdGNoIGZvciBhbGwgdGhlc2UgcGFydCBudW1iZXJzPyBPbmx5IG9uZSBm
aWxlIGlzIGFmZmVjdGVkLgoKSGF2ZSBhIGxvb2sgYXQgdGhlIGRpZmYsIGlmIGl0IGlzIG5vdCBv
YnZpb3VzIHRoYXQgeW91IGFyZSB0cnlpbmcgdG8KYWRkIGEgY291cGxlIG9mIHBhcnQgbnVtYmVy
cywgdGhlbiBpdCBtYWtlcyB5b3VyIHBhdGNoIHdyb25nbHkgd3JpdHRlbi4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
