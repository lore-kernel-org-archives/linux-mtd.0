Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3447C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTkwesX3dkgr53zeVDWhVpZMw/Olrd3OfxYDENjLa04=; b=lestsyIN6eAJJE
	jhmOOL9odlzPfdMw8O9VgiEshxaVN3LN4i3zDzn/5CiJYeWFNuaSdOh/bPE3cz/J0+BP8IJrv0jR9
	7vSyieVDqBULaVnOiy9ZQmg5zHZ2dgcCsuQX6f7sTGyFvPf3H+aPYcuG15YBdYMA4oN+F48bLIBw2
	Y96Sd3T86lnBuMhyF/c3THFXPNiMSB/zGgF73XgN00kRUmXgVPfXLKcCAGnCmwnSQCq0A5YwPAuIK
	IOpSFNPSf5JB/54KWZd7e5i+qraJZA+DS4ShcSBWEqyVCTRTuEDQRSAd5jzYteksYkPQ4Hr48ZRGL
	zkfUvxy9Xs+ay6b1XPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EVJ-00DDHV-W1; Thu, 08 Dec 2022 10:51:50 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EV3-00DBzt-Qb; Thu, 08 Dec 2022 10:51:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 67C6FC0004;
	Thu,  8 Dec 2022 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670496687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jX4qpJhOZfq0Tc57pU2iw5g5rc8m7DS0d+5g0687Ft0=;
	b=F7JNzgIt3I6hYU/+MJtFg6ivPmkYClN5wsy3v7G1m9kQzXfuztQaq1LgcvBGV8sSBBnhYU
	bJdglueOmfSxR8ZR1WD0HWV41CHorRhPSqEdvGr0ZjOodhI1IlWvf91DoaVHILLYgy9kSM
	HPk17yM46JhEGztJVFQ10ZjoYRo6gOipTTp6GcK8El04ZCG3TfMjo9DN22UIfr1NJiRbCq
	M4zaed9uWAFIncMswV91KO1Tu7ehBppIAMeJwnSTWoL/edWIChknIC2M/HlpH3d2QHAZsT
	qYY7ktnnHLj46WRausFpBJPcgSHJHmeHj2edNgwwt3nmOpfT2KZI4foEXxxl+w==
Date: Thu, 8 Dec 2022 11:51:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Francesco
 Dolcini <francesco.dolcini@toradex.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <20221208115124.6cc7a8bf@xps-13>
In-Reply-To: <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
References: <20221205152327.26881-1-francesco@dolcini.it>
	<0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_025134_029436_8C3391B5 
X-CRM114-Status: GOOD (  12.63  )
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

SGkgU2hhd24sCgorIFRob3JzdGVuCgptYXJleEBkZW54LmRlIHdyb3RlIG9uIE1vbiwgNSBEZWMg
MjAyMiAxNzoyNjo1MyArMDEwMDoKCj4gT24gMTIvNS8yMiAxNjoyMywgRnJhbmNlc2NvIERvbGNp
bmkgd3JvdGU6Cj4gPiBGcm9tOiBGcmFuY2VzY28gRG9sY2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlA
dG9yYWRleC5jb20+Cj4gPiAKPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNzUzMzk1ZWExZTQ1Yzcy
NDE1MDA3MGI1Nzg1OTAwYjZhNDRiZDVmYi4KPiA+IAo+ID4gSXQgaW50cm9kdWNlZCBhIGJvb3Qg
cmVncmVzc2lvbiBvbiBjb2xpYnJpLWlteDcsIGFuZCBwb3RlbnRpYWxseSBhbnkKPiA+IG90aGVy
IGkuTVg3IGJvYXJkcyB3aXRoIE1URCBwYXJ0aXRpb24gbGlzdCBnZW5lcmF0ZWQgaW50byB0aGUg
ZmR0IGJ5Cj4gPiBVLUJvb3QuCj4gPiAKPiA+IFdoaWxlIHRoZSBjb21taXQgd2UgYXJlIHJldmVy
dGluZyBoZXJlIGlzIG5vdCBvYnZpb3VzbHkgd3JvbmcsIGl0IGZpeGVzCj4gPiBvbmx5IGEgZHQg
YmluZGluZyBjaGVja2VyIHdhcm5pbmcgdGhhdCBpcyBub24tZnVuY3Rpb25hbCwgd2hpbGUgaXQK
PiA+IGludHJvZHVjZXMgYSBib290IHJlZ3Jlc3Npb24gYW5kIHRoZXJlIGlzIG5vIG9idmlvdXMg
Zml4IHJlYWR5Lgo+ID4gCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gRml4ZXM6
IDc1MzM5NWVhMWU0NSAoIkFSTTogZHRzOiBpbXg3OiBGaXggTkFORCBjb250cm9sbGVyIHNpemUt
Y2VsbHMiKQo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1k0ZGdCVEdOV3BN
NlNRWElAZnJhbmNlc2NvLW5iLmludC50b3JhZGV4LmNvbS8KPiA+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDIyMTIwNTE0NDkxNy42NTE0MTY4YUB4cHMtMTMvCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBGcmFuY2VzY28gRG9sY2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5j
b20+ClsuLi5dCj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+ClsuLi5dCj4gQWNrZWQtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgpb
Li4uXQoKQXMgZGlzY3Vzc2VkIGluIHRoZSBhYm92ZSBsaW5rcywgYm9vdCBpcyBicm9rZW4gb24g
aW14NyBDb2xpYnJpIGJvYXJkcywKdGhpcyByZXZlcnQgd2FzIHRoZSBtb3N0IHF1aWNrIGFuZCBz
dHJhaWdodGZvcndhcmQgZml4IHdlIGFncmVlZCB1cG9uCndpdGggdGhlIGhvcGUgKH4gZHV0eT8p
IGl0IHdvdWxkIG1ha2UgaXQgaW4gdjYuMS4gQW55IGNoYW5jZSB5b3UgY291bGQKcGljayB0aGlz
IHVwIHJhcGlkbHkgYW5kIGZvcndhcmQgaXQgdG8gTGludXM/IE9yIHNob3VsZCB3ZSBpbnZvbHZl
CmhpbSBkaXJlY3RseSAoVGhvcnN0ZW4/KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
