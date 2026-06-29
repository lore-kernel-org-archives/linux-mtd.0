Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01981C43638
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K//lGslIPvAUvrLC2XD3k4fBeKj5n23WBh1Q7OLVfRY=; b=bqk4pMU7LIbdyk
	2ca5azjD5o/GWzNpU7g3iWO1Qj8UsjufRPyeDIC/gP6y9lW7G1swVQ2j6EA6H4JWeQPMMDhsHmecQ
	RvLNwr7xsVOi5kbRxkOxXUVA0eafAmNr98jR/jzZd3/HWPdPGzEgsftj1GHkc9YtWfyRHkk0NIxgf
	Fm/aEynWHmYQlOmkTbSzJ9I7HqEMYpfR2ZYJXbcdvUJcJMArzIRbyRxagijUTSXTTu2Yw8FzngN9Y
	R+M5sxE+aQoR74FYqszbjZeaFFDF/zqY28iCBHSyDid2N4JpT30zQj6mqu1EIPJxfvQpFwRA3j7VG
	A5bCeVJ8XQLG/LapzWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDRK-0000000Eyz5-3tHx;
	Mon, 29 Jun 2026 14:58:26 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDRH-0000000Eyvx-1kuP
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:58:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3E59CC6B3A9;
	Mon, 29 Jun 2026 14:58:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCFCF5FF96;
	Mon, 29 Jun 2026 14:58:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEB6E106F18D9;
	Mon, 29 Jun 2026 16:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782745100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zjwNjSjuFLLd7thPba6eClgxi605CFu777BUSwQJIyA=;
	b=nQWmNEnqZsEt+SWCq67S173r8urV87I8yJ6sFjkiqh9A0rFL8tngnwjg0ZtKvbmU8+1urF
	ZRDDYYDoezI19OnAjqMbB2qep7W4t3/3JPmMAclMKz6OBiGKMbstjzWHrbNYlXz6gXBElX
	WDHPyxMTls8PwGMPEixhHNY1dixbVYgVRH5ETvI53/+rBZuHiTsKz3O6ilAwLr7v8e37s6
	Yifg6P0kV7K4c3WvpFx/R9kx8FjjFpE/meUEa/sJJ3fEXAW3jT1zL9VlUnqmfxjUjM8MlC
	I1OhMYSrxvtibaSgCw8BYP55RnxoO7J+bI03v2vKhEC7iHPmQIfHegSP3nyKDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260623135729.52304-1-pengpeng@iscas.ac.cn>
References: <20260623135729.52304-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: mtk-ecc: stop on ECC idle timeouts
Message-Id: <178274509552.278117.10618794784702603382.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:58:15 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075823_622198_562437F9 
X-CRM114-Status: UNSURE (   6.61  )
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

T24gVHVlLCAyMyBKdW4gMjAyNiAyMTo1NzoyOSArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IG10a19lY2Nfd2FpdF9pZGxlKCkgbG9ncyB3aGVuIHRoZSBlbmNvZGVyIG9yIGRlY29kZXIgZG9l
cyBub3QgYmVjb21lCj4gaWRsZSwgYnV0IHJldHVybnMgdm9pZC4gQ2FsbGVycyBjYW4gdGhlcmVm
b3JlIGNvbmZpZ3VyZSBhIG5vbi1pZGxlIEVDQwo+IGVuZ2luZSBvciByZWFkIHBhcml0eSBieXRl
cyBhZnRlciBhbiB1bmNvbmZpcm1lZCBlbmNvZGVyIGlkbGUgc3RhdGUuCj4gCj4gUmV0dXJuIHRo
ZSBpZGxlIHBvbGwgcmVzdWx0IGFuZCBwcm9wYWdhdGUgaXQgZnJvbSB0aGUgZW5hYmxlIGFuZCBl
bmNvZGUKPiBwYXRocyB0aGF0IHJlcXVpcmUgdGhlIGVuZ2luZSB0byBiZSBpZGxlIGJlZm9yZSBj
b250aW51aW5nLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEv
MV0gbXRkOiBuYW5kOiBtdGstZWNjOiBzdG9wIG9uIEVDQyBpZGxlIHRpbWVvdXRzCiAgICAgIGNv
bW1pdDogMTZmN2VjOGQ1ZGMxMDBlYWZkMmM4ZTA2Y2QzMDM0MGEzMGIxMDRhMQoKUGF0Y2hlKHMp
IHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9m
IHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4K
CktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
