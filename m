Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47078E7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3y0HbTarAEC7PpyfvrSWgLFF6DXKkDZLrPT7ig8eyu4=; b=zUsD5iiGtPR0k2
	E24bst7prQReQ7THGELjR0v7GpXNELNbySro47i5NpWE4lEjcIr/p+wo9HUyXd4KHRHsWMiR+DiGv
	I4ZTSQwbrENUls9Rcb14YdV909OI7sJ2iSKl3Q7+IFMrdoNxlbVfbqLyQHQ64aSqaBrdzUG15BZim
	zYIxKoazC27u1QKnUVlu+IdQc21GnB8dGuRTtfHMYKBDFSV02Pve75imfxLBnPeivuVwdqZZ7eeKC
	Uu8voHOeXfaEFQfGVhPJ+rPQdwbXuADnG1EbXeJHUghNVRZju6ib11M2vaSetVZlc90THakOvqS0w
	0JuLZubV6QMjgCjSvWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4Hk-00000003dgz-3d5n;
	Fri, 13 Dec 2024 11:56:44 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4Hi-00000003dgN-3WkG
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 11:56:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F204C0002;
	Fri, 13 Dec 2024 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734090999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1N5Dij8c2GyjzKGRltjjEZbDJ8FA2c7LvDs7UtoWAp8=;
	b=jkMXvB2otgUgTbT+cPpsZhN2aWSVafG7uXrKvWiP8pmRrM4H+CZ7R65Na6eGkf2D6/H8YS
	Syj2D+IbbKSGf1+PnU61bSDVAPRZR6eR+kSWsB7Gtb5tnsEckVvbhNusSlxdRqKaJsplDf
	rURgMShVsLtOjwutYzPOqNbs/LKauq9HOcwQThjRitkgWXzI206E1eBcthhBMeaw3zhy41
	tIeDJBo4ExqP/oFrJAgRz0s5ugT5GY7rvXxV2ysStIDuBAdT4Gug2ymr8ULMY7rvoKIf1r
	mEThihFGsuY/1Uz0+JfAkR2J85bWtEtVsCj5m2Uy9EMpFyk8z1dYO3fwiRVSLQ==
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
Subject: Re: [PATCH 18/24] mtd: spinand: Add an optional frequency to read
 from cache macros
In-Reply-To: <6e037ce3-1755-4cb5-9124-4b32773fbba4@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 14:17:36 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-19-miquel.raynal@bootlin.com>
	<6e037ce3-1755-4cb5-9124-4b32773fbba4@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 13 Dec 2024 12:56:37 +0100
Message-ID: <877c83n6dm.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_035643_010696_091C00F0 
X-CRM114-Status: UNSURE (   9.02  )
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

T24gMTEvMTEvMjAyNCBhdCAxNDoxNzozNiBHTVQsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDEwLzI1LzI0IDU6MTQgUE0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4+IFdoaWxlIHRoZSBTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX0ZBU1Rf
T1AgbWFjcm8gaXMgc3VwcG9zZWQgdG8gYmUKPj4gYWJsZSB0byBydW4gYXQgdGhlIGhpZ2hlc3Qg
c3VwcG9ydGVkIGZyZXF1ZW5jeSwgaXQgaXMgbm90IHRoZSBjYXNlIG9mCj4KPiB3aGF0IGRvIHlv
dSBtZWFuIGJ5IGhpZ2hlc3Qgc3VwcG9ydGVkIGZyZXF1ZW5jeT8gSXMgaXQgdGhlIG1heCBmcmVx
Cj4gYmV0d2VlbiB0aGUgb25lcyBzdXBwb3J0ZWQgYnkgdGhlIGNvbnRyb2xsZXIsIHBjYiBhbmQg
Zmxhc2g/CgpJIGFtIHJlYWxseSB0YWxraW5nIGFib3V0IGZsYXNoIGxpbWl0YXRpb25zIGhlcmUs
IEkgd2lsbCBjbGFyaWZ5LgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
