Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27B1D0E6D5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEbIpYyelq1c92VMvqeqZg4KzytlKvMdz4/bItr3yGI=; b=fTrOXqjY2Az4DG
	IYeaWu9SUF2aVZXKvtXLS9ysS9LALX0kSS7J9NqDloOPuW5EbsTFLPrIDsmyeQ8GbJAcr9ZiGlq+H
	R5a8XR4vKa/HcmcQA1HKS2E5AKTd/UUfE7D5RGZO8/q53aJ1xOF1ml6RI7x8ua9Hqgeq8sKSnomx0
	VStpGYc7PINrqy+uL2ktJcLrEEMB2ZnOymW7nwLD3NGSIQqOsv70vjqNl7KOOcKdf4O310sYDWq7/
	K60SGxtw3m3d59WPeH4iDzb/bU+6Xqxdz04j6T2+ug7Ci3ztWH/rCIkkPVZKod5uO9ts4b1kVXzBp
	EdWdVjY855IRdOrHgSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oVm-00000006fZR-1liY;
	Mon, 21 Oct 2024 09:15:38 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oVj-00000006fYz-06ek
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 09:15:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87DD7E000C;
	Mon, 21 Oct 2024 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729502131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ck9jpFmh256Mz2huEvw1ixmMblWibXE/EzedxLUF7+U=;
	b=Z7oIb6hG+Pgktuts/BIzu41Jz+TLerTZtNMfP5MWQea5M9A9yY5xZZ95/2J/d1yrfSiAwP
	pQItV7OhjPqyY2pW8BiOwuGdAYCMdGivNgD5qbkd7fY2Xx/bBx9jj39pAYAlvX1gufzcwT
	jpm3m8eMUKoxPeZTJdvyD42WxSOpA058dPiusZBpswMa3QurE3cdHuoE9ulVT/pJxPMuVr
	xlsuXCVIHYyxYTpxB+ZJuJAtoknvmHIIALFt2IzGfIGJajsKyCDBBinxj3cJykyd/IjedE
	UmARRNb+ZPWMlWOt4CyuuNh3ctIVSD0toFIP6EdUg4S3j/ILK3VpCz+GvJlYIA==
Date: Mon, 21 Oct 2024 11:15:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sergei Shtylyov
 <sergei.shtylyov@cogentembedded.com>, linux-mtd@lists.infradead.org, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
Message-ID: <20241021111526.1882d9e4@xps-13>
In-Reply-To: <20240823173143.366150-1-miquel.raynal@bootlin.com>
References: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
	<20240823173143.366150-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_021535_377104_5B217DB0 
X-CRM114-Status: UNSURE (   8.88  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCAyMyBBdWcgMjAyNCAxOToz
MTo0MyArMDIwMDoKCj4gT24gV2VkLCAyMDI0LTA3LTMxIGF0IDA4OjA4OjQwIFVUQywgQmlqdSBE
YXMgd3JvdGU6Cj4gPiBUaGUgcnBjLWlmLWh5cGVyZmxhc2ggZHJpdmVyIGNhbiBiZSBjb21waWxl
ZCBhcyBhIG1vZHVsZSwgYnV0IGxhY2tzCj4gPiBNT0RVTEVfREVWSUNFX1RBQkxFKCkgYW5kIHdp
bGwgdGhlcmVmb3JlIG5vdCBiZSBsb2FkZWQgYXV0b21hdGljYWxseS4KPiA+IEZpeCB0aGlzLgo+
ID4gCj4gPiBGaXhlczogNWRlMTViNjEwZjc4ICgibXRkOiBoeXBlcmJ1czogYWRkIFJlbmVzYXMg
UlBDLUlGIGRyaXZlciIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KPiA+IFJldmlld2VkLWJ5OiBWaWduZXNoIFJhZ2hhdmVuZHJh
IDx2aWduZXNockB0aS5jb20+ICAKPiAKPiBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL2ZpeGVzLCB0aGFu
a3MuCgpJIGp1c3QgcmVhbGl6ZSBub3cgdGhpcyBwYXRjaCBnb3QgYXBwbGllZCBidXQgbm90IGlu
Y2x1ZGVkIGluIGFueSBmaW5hbApQUiwgc29ycnkgYWJvdXQgdGhhdCwgSSdsbCBoYW5kbGUgaXQu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
