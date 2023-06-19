Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46478EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dg/py+YKYIgzB0ZcsUdEygo8QiWVPpquS8Sn/KAZI4=; b=4EPjWCHBFSIGiw
	YVMSezQqyct+HC/YG5OF0x/wVfaQ2KtfZlW0Qr9Gy1tN5xIWFNXE/w0Suab4Jkidjc3nb3rBbyGGM
	aJffAQRWBRreZpnNr2oWfYmOkIsJvTCLhdHXpZAw8AxXfQTkgqynWFUc9zEJjo9H58JXBi2rE9hK9
	eHc+V4OTRLmQuMCRjnEMNum7KxQwxW5/ymnpKu74XDwDMQ2MHkO1X7Q27m4+8nU0p/u+KCK9TCFOS
	vN5gjnJf79myXiiQEl2I1VpygQDtgHiH4p5jKyX2GRw1KxsVx7LTOkVHJ8ZP/GVRUkdLFg9adNHYZ
	COCNftocgpYKbMpQcOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQQ-007qxV-1B;
	Mon, 19 Jun 2023 08:39:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQN-007qve-2D
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 08:39:49 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687163983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eki9K1awjScLp62r3lkW12D6bwv8+iLCihjLLA/oNZk=;
	b=OZP+ei+BBzqZfCVR9DeY1nBa9U2AQSx15O78AgykLbrJ1pVrqTrxihRap832hQ4m+uHJyn
	jqBuMs9GIVcHOIEitkrXkdS7UAyxChSTyLW7v0eJA1KSVH6DB2BxsTSp+VR01hNYj/nDbc
	Ia7bI2OqewZsWB58PXVJ8tf3hAAgBd0xfyt0PeswuIrZlD0vu13nLQcfsKJUrfssEuSB7g
	bMjzCeLSCCTmFyRw+6Xv0oGA+GoT03cJhhF9ylVV+N/yU+FN00HTmxa/AtcI+mmfpP+yC3
	vW8ZOJ3jg+XGfmAiUGj1ZGNjAXuTCpcDnwRN15gTgDPjFPk3mkWqaoRNmB3rfg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 588A824000D;
	Mon, 19 Jun 2023 08:39:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] mtd: maps: pismo: Switch back to use i2c_driver's .probe()
Date: Mon, 19 Jun 2023 10:39:41 +0200
Message-Id: <20230619083941.2940456-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611204327.828122-1-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'812a20df6048ba2945b1bda74c45143bbc3e4cda'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_013947_868296_D820BFA1 
X-CRM114-Status: UNSURE (   7.44  )
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

T24gU3VuLCAyMDIzLTA2LTExIGF0IDIwOjQzOjI3IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IEFmdGVyIGNvbW1pdCBiOGExYTRjZDVhOTggKCJpMmM6IFBy
b3ZpZGUgYSB0ZW1wb3JhcnkgLnByb2JlX25ldygpCj4gY2FsbC1iYWNrIHR5cGUiKSwgYWxsIGRy
aXZlcnMgYmVpbmcgY29udmVydGVkIHRvIC5wcm9iZV9uZXcoKSBhbmQgdGhlbgo+IGNvbW1pdCAw
M2M4MzVmNDk4YjUgKCJpMmM6IFN3aXRjaCAucHJvYmUoKSB0byBub3QgdGFrZSBhbiBpZCBwYXJh
bWV0ZXIiKQo+IGNvbnZlcnQgYmFjayB0byAodGhlIG5ldykgLnByb2JlKCkgdG8gYmUgYWJsZSB0
byBldmVudHVhbGx5IGRyb3AKPiAucHJvYmVfbmV3KCkgZnJvbSBzdHJ1Y3QgaTJjX2RyaXZlci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
