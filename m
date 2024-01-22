Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0DCC47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 18:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0V/f0LwxVqFbBv8SjumAbOgjQpc4VA6SA0IzZznXjIk=; b=fqjXoj+scZMWZA
	zBV1iLRCZUxYXY8DIk7VdjfSJhwzchBmijfs/2JDXRQVdHelDnYcmaBmzoQqhOMayk8slS8m4WFcV
	IIzSq29uFe6HbBASj7q84JFCOx76o5wfjW8iY1III8CnJEnShp2ATctjyUoCSCAnrtybt9pZMjkVq
	Li3ng7o4NT3n6LVw2g1btObZHLfCBU30cXlWmEdEQYzz+XUC2roRNTgS1aavlZIgruBWJNMkk4ZxT
	HKPrPZIkwwi868cIsdEq3QNC1kcq5qL4mjRpy2g80jXhQpmO7VXXlA3xTTvUeTbZ3GAY7NUJO1435
	fIYx03wzXRWXYTp6nX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRynn-00DScT-1P;
	Mon, 22 Jan 2024 18:13:43 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRynj-00DSa9-2x
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 18:13:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E911020003;
	Mon, 22 Jan 2024 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705947213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUzlzYhwpqdukSU52axAImuuJwvD9YUD7+kH8ySYwR4=;
	b=TS4VJcDTXuYNmsNX7murn8lJ6pwDcgMonq+lmQaAc2c2W4Hq3hN28GfkE6Z+Zh8mWzqNib
	+EipYHY1L8+yIdcbNtHUFkG89WnWDL/+9aUmgHXBIGJAIMBww5NEqL8ZKumGOvFJ/vr2y4
	bvbISQD0R993JrEmz1i4ZCnoLrJT+nb/MKLpLj+XwgooA+r+Se/9EFmSftfaolNrtDIxDx
	Wt4xv/AIy2DJ3Bxs/FMylclS2yYvm0FVM8WjEwnXET/7Xr6CqJcbthHhZ+oU2fWEiPDKRT
	VFz8sSb4telxCcJgVOcemJYlwyrn0vGcn8Ke6uM0P1Vguv5A7UUAumMn1DT3Yw==
Date: Mon, 22 Jan 2024 19:13:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, kernel@pengutronix.de, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michal Simek
 <michal.simek@amd.com>, Amit Kumar Mahapatra via Alsa-devel
 <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 12/33] mtd: dataflash: Follow renaming of SPI
 "master" to "controller"
Message-ID: <20240122191317.5924f087@xps-13>
In-Reply-To: <63d7d1f1e6fe564daf034c66eb3073aa265b7969.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
	<63d7d1f1e6fe564daf034c66eb3073aa265b7969.1705944943.git.u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_101340_306865_E61DAACE 
X-CRM114-Status: GOOD (  11.13  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIE1vbiwgMjIg
SmFuIDIwMjQgMTk6MDc6MDcgKzAxMDA6Cgo+IEluIGNvbW1pdCA4Y2FhYjc1ZmQyYzIgKCJzcGk6
IEdlbmVyYWxpemUgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIiIpCj4gc29tZSBmdW5jdGlv
bnMgYW5kIHN0cnVjdCBtZW1iZXJzIHdlcmUgcmVuYW1lZC4gVG8gbm90IGJyZWFrIGFsbCBkcml2
ZXJzCj4gY29tcGF0aWJpbGl0eSBtYWNyb3Mgd2VyZSBwcm92aWRlZC4KPiAKPiBUbyBiZSBhYmxl
IHRvIHJlbW92ZSB0aGVzZSBjb21wYXRpYmlsaXR5IG1hY3JvcyBwdXNoIHRoZSByZW5hbWluZyBp
bnRvCj4gdGhpcyBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkkgdGhpbmsgSSByZWFkIGluIHRoZSBw
cmV2aW91cyB0aHJlYWQgdGhhdCBNYXJrIHdvdWxkIGFwcGx5IHRoZW0gYWxsCnRocm91Z2ggaGlz
IHRyZWUsIEkgYW0gZmluZSB3aXRoIHRoYXQgc28gaGVyZSBpcyBteSBBY2tlZC1ieS4gSW4gY2Fz
ZSBJCm1pc3VuZGVyc3Rvb2QgdGhlIHRocmVhZCBvciBhdCB0aGUgZW5kIHlvdS9NYXJrIHByZWZl
ciB0byBsZXQgdGhlCnBhdGNoZXMgZ28gdGhyb3VnaCB0aGUgdHJlZXMgdGhleSBub3JtYWxseSBi
ZWxvbmcgdG8sIGp1c3QgbGV0IG1lIGtub3cuCgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
