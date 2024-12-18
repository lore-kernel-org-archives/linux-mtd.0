Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109B4E7718B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2FZ/9B4AwshlLYf9HBPAZCSgaVa23626/vefBi++6o=; b=oqu+A6NJTMO65o
	VN5FKqls31jXwAHQ14z0OSGch3da/4B2wUIjgRX8vQJ6OWebsmRbhAjPagAsSE4SyrBrXbUX4aBvp
	F7w8NojOuYHn6G7lSHlx/IOZK1hzpHtDwMyk0ew7XP7/zAVTQ+4mz6wpX9O6t/+Eo0+5ywlG6oJm4
	6a5LYYdrin/lfdgAiv89HT44GSIepxqNtvpqhMpyNq8Uy1Z3Whbq4ElWRalP4jY0K2oXrfgjiA/Pc
	tI/3LeEvRMxh2KCZ4AFu4ebqdgJotMhrcgTkkJpZlpY/6W3w5QgeZt8Y7NuCaC7mIhC0dowA8Wls5
	tLzV1XIJsWxTLCemsqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrhv-0000000GLYX-39O1;
	Wed, 18 Dec 2024 10:55:11 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqSF-0000000G7zV-3ZOK
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 09:34:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE0B11BF203;
	Wed, 18 Dec 2024 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734514492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqUzbg8s4+XWHk5VuCr/5VoE4KujCN/tkGTpGffbPfg=;
	b=AcF5NXQAGTctaVBHTkB6xFZxYx6WiQ23zorUD8MPTF2J6M82rURv/XRXPiFszlem0XsAQS
	FMjAxJKTUBUts3ZGxMo0AELDNpXb5nDybM2zB4AnxP18PAmc11leMzuzsaEP+ZsG6qQiUt
	nnSqLDuQrSyjesLJBsUyJ4tr0w18/r5M+KpZIeIcl4x+bWI/THfU4k92vM79Y0Gq2xMQam
	9GTa8nv4LK4CCHhJYrBc10nP5QXhIy0KIW5UhkYkS2W0ss0KNPkEP7fB6aIUN20dUNWMK6
	04OSNmUQDzJL5Vkkgeya0gTpTj6dwkEhRwCw9+/AVWYCAbpkLdq5EBw1R7/yyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 19/24] mtd: spinand: winbond: Fix the *JW chip definitions
In-Reply-To: <4f523ed6-f896-4c0d-8ccb-66083cd2a3bf@linaro.org> (Tudor
	Ambarus's message of "Wed, 18 Dec 2024 08:16:39 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-20-miquel.raynal@bootlin.com>
	<bad3572e-34b4-492f-8e60-96b14e3424bd@linaro.org>
	<4f523ed6-f896-4c0d-8ccb-66083cd2a3bf@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 10:34:48 +0100
Message-ID: <87h671e3lz.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_013456_028867_C39EDD14 
X-CRM114-Status: GOOD (  10.32  )
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

T24gMTgvMTIvMjAyNCBhdCAwODoxNjozOSBHTVQsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDExLzExLzI0IDI6MjcgUE0sIFR1ZG9yIEFtYmFy
dXMgd3JvdGU6Cj4+IGRvIHlvdSB3YW50IHRoZSBsaW51eCBzdGFibGUgdGVhbXMgc2NyaXB0cyB0
byBxdWV1ZSB0aGlzIHBhdGNoIHRvIHN0YWJsZT8KPj4gCj4+IGlmIG5vdCwgbWF5YmUgdXBkYXRl
IHRoZSBjb21taXQgc3ViamVjdCB3aXRoIHMvRml4L3VwZGF0ZT8gT3IgdXNlCj4+IENjOiA8c3Rh
YmxlK25vYXV0b3NlbEBrZXJuZWwub3JnPiAjIHJlYXNvbiBnb2VzIGhlcmUsIGFuZCBtdXN0IGJl
IHByZXNlbnQKPgo+IElmIHRoaXMgaXMgYSBmaXgsIHdvdWxkIGJlIGdvb2QgdG8gc2VwYXJhdGUg
aXQgZnJvbSB0aGUgc2VyaWVzIGFuZCBzZW5kCj4gaXQgYXMgYW4gaW5kaXZpZHVhbCBwYXRjaCB3
aXRoIHN0YWJsZSB0YWcuCgpJIGFjdHVhbGx5IGlnbm9yZWQgdGhlICJub2F1dG9zZWwiIHRoaW5n
IDopIEl0IGxvb2tzIGxpa2UgSSBkaWRuJ3QKYW5zd2VyLCBidXQgSSBkZWNpZGVkIGl0IHdhcyBu
b3Qgd29ydGggYmFja3BvcnRpbmcgaXQgYW5kIHVzZWQgeW91cgp0cmljay4KClRoYW5rcyEKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
