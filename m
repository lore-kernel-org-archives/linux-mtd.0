Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DEEC4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 08:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJu822Z0ceEO3/TY+uh2QMcZkFPcdiROZxGilWX70d4=; b=iIeKyrEajjOI3g
	zwVXOdLLWX38YlwXUIMv1WD2DuvrPyMX+YscwQxMy1OHbCd2MT72vi7qRPKQmNHgabTpfV3uKW8xF
	qb9aubvr8FX2S5tPa7J4J8zwJUhU+LPPbebKK9X2y80eqHdeQQfFQoe+k3TyiA/iudr5V+uh2Gb2Q
	GY4/GV9Demci1o/ycvFrAJzvofxNT8NGAov5z55ER0+jyqLGXXQTMf0XFM9B5vEUat11+jW59yucJ
	MR+hH/RQ63dAk+eCh2jPntx5ds5nsRpIwNrrq8v4PrFxj7ldwmYMPWLYxviFwuCBvWUOxYYYu4oC5
	EYpV/MhKbdpnq/7X9aNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8G7f-007VER-1l;
	Wed, 29 Nov 2023 08:40:43 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8G7d-007VBa-01
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 08:40:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 707364000B;
	Wed, 29 Nov 2023 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701247231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4WHEu2UhaCM6cUWSOjsX+5/aR0VdKdzzHzZ2V8osTk=;
	b=mFQLKk5sZBWrCJqIdxGBpDdZukBQ9RPNMxydeLHeMGtsOj6GxRQ6s6Yv42M5B9yiATn2eD
	nAfzCSN/4dZgSM1jznBDMwyWf6CNZRLf1pPnuCechP4ocpmTeHrTkppsWzeng/Pdg0rcBX
	TOhfy++gFRC5Nx1QQRqQVm1xrA9yJAn+mRkUjOjBd9uMaoN5NCze5jR5+UkFJwbp7iTm6N
	QagP+l6Nw5O6ec7CoyHGmuUQoz3wPmtfgJ1WW6HLymibXrhA+i7zThdml212j1ef2p+7fj
	G31N0HM3zeULewamC5GzuCMoVP56x57IGbxeVpfK4iwCqwASpJ0lCsihCACIUw==
Date: Wed, 29 Nov 2023 09:40:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Dhruva Gole <d-gole@ti.com>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>, Kamal Dasu
 <kamal.dasu@broadcom.com>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?=
 <j.neuschaefer@gmx.net>, Mario Kicherer <dev@kicherer.org>, Chuanhong Guo
 <gch981213@gmail.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] mtd: spi-nor: Stop reporting warning message
 when soft reset is not suported
Message-ID: <20231129094026.4dee1cb1@xps-13>
In-Reply-To: <20231129064311.272422-2-acelan.kao@canonical.com>
References: <20231129064311.272422-1-acelan.kao@canonical.com>
	<20231129064311.272422-2-acelan.kao@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_004041_175329_2B586B77 
X-CRM114-Status: UNSURE (   7.88  )
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

SGkgQWNlTGFuLAoKYWNlbGFuLmthb0BjYW5vbmljYWwuY29tIHdyb3RlIG9uIFdlZCwgMjkgTm92
IDIwMjMgMTQ6NDM6MTEgKzA4MDA6Cgo+IEZyb206ICJDaGlhLUxpbiBLYW8gKEFjZUxhbikiIDxh
Y2VsYW4ua2FvQGNhbm9uaWNhbC5jb20+Cj4gCj4gV2hlbiB0aGUgc29mdHdhcmUgcmVzZXQgY29t
bWFuZCBpc24ndCBzdXBwb3J0ZWQsIHdlIG5vdyBzdG9wIHJlcG9ydGluZwo+IHRoZSB3YXJuaW5n
IG1lc3NhZ2UgdG8gYXZvaWQgdW5uZWNlc3Nhcnkgd2FybmluZ3MgYW5kIHBvdGVudGlhbCBjb25m
dXNpb24uCj4gCj4gUmV2aWV3ZWQtYnk6IERocnV2YSBHb2xlIDxkLWdvbGVAdGkuY29tPgo+IFJl
dmlld2VkLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+IFJldmlld2VkLWJ5
OiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+Cj4gQWNr
ZWQtYnk6IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IENoaWEtTGluIEthbyAoQWNlTGFuKSA8YWNlbGFuLmthb0BjYW5vbmljYWwuY29tPgoKUmV2
aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
