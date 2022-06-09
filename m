Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09335C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9V/CQ/FYWmhpZ5bUEF5tHcW5WwuLkiaxuJIIX3yQmE=; b=nJ4U7Aw4turPAf
	pvg10l3ROyVG5ZTKb2KH2+YOkF4dHludr0oeaGT7lBou4EAXXSok1qkzyo1KpuqdidJTwVRl21Jqk
	XD+Mbfh95T8yOfD20zDi9JKnkTXosUA2qMPA+qchV5sRsVVH2c66oGawu7x686Slk5OYyzo3Hmo5+
	UJpWAGFVWI07EfeAstNbplCPac7qx++uyQK3rRTJrTF3wFpniQwK38ZyuIFrdT9q+T26ci/K6cf4+
	Adi1BtLr++jEpYJU70mJX3Urok80Qn08QEKlGTluf/wD6F9ArtTwvyWCrYpbMhLJc4h7o4W5eBeet
	XL4D0FG/tI0QGFSs9lkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvQ-0020oG-JP; Thu, 09 Jun 2022 13:10:12 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuY-0020FM-Bs
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:09:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 97ACD20009;
	Thu,  9 Jun 2022 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76ID1qG848oQm5UwwOhDI34TRH1xRk+pntVD79SlXiw=;
	b=LumBFhFNyp9KcDAI2N7mHKWgqL/riK3DISahT3CqJCSqWvw4G1ll1OZ+s02FQv/5+AZA/j
	Y/T/FShiXrqJJp/IWZ4TXNZP5WZHQvJGSE3P1HntP3FqtPZGMp1f43HX9d2sTYQsY8lIoz
	Vnf1ucIrVAVFsFkjiG7ZfndYYpIjpWg06SPzV4DkiXk2XZCHbEGSjGIl+iTwN4xHAFylXO
	mMPkogCqan8AoCncB09XOMGfruwIJnfdcC4rR6FMfQ4NIdC58WG50ckka94pNYHAirZZlu
	8adCR1uncuuwfndGN9+h7vjduxkaiU7MeoTNrY6Rz9joQDW5eCXTZu6WyOw2Iw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 14/14] mtd: physmap: Drop if with an always false condition
Date: Thu,  9 Jun 2022 15:09:14 +0200
Message-Id: <20220609130914.293104-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-15-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f88c97c1332d6d760d193ce3d76765f8105b1cda'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060918_584730_265F43B8 
X-CRM114-Status: UNSURE (   7.95  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjU4IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSByZW1vdmUgY2FsbGJhY2sgaXMgb25seSBjYWxsZWQg
YWZ0ZXIgcHJvYmUgY29tcGxldGVkIHN1Y2Nlc3NmdWxseS4KPiBJbiB0aGlzIGNhc2UgcGxhdGZv
cm1fc2V0X2RydmRhdGEoKSB3YXMgY2FsbGVkIHdpdGggYSBub24tTlVMTCBhcmd1bWVudAo+IGFu
ZCBzbyBpbmZvIGlzIG5ldmVyIE5VTEwuCj4gCj4gVGhpcyBpcyBhIHByZXBhcmF0aW9uIGZvciBt
YWtpbmcgcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrcyByZXR1cm4gdm9pZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
PgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
