Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C0CC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUjOcwMoAqn57iPysE9MqqDzNhJayRIynfW70Kax0Xc=; b=jcjR9gLm5GyT5H
	cwbkTcHL+SG0zCnOGtvY8XprKtdAmM7Hpagy6Qu6OIuEZB/62rptOBVnLJPdLgJwCNES18Nn5PWZL
	C4liB8iGuVoWmEu2QaZbspY37NEbqPh++++whOk7Xpb1ra5oo09tVBjN1XoMNj14K2eLhYCGYse3O
	wRV0CO3Dq9IyRvZyXA189LKn5Y8uPuQeWbZia+taD+CodNuSwzeQJyflS6tvCGvJ6VTRrSJNqgBCk
	h84GMIbpslQbYI2GW8zb69jPSpfjKr1YCnPmmAPr5daIFRwEuHBetQzLxN3Ki1E0iXKybE9uqHZlS
	iAhvrLAS3WnFV/uYrKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHz2-00238i-Fj; Thu, 09 Jun 2022 13:13:56 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvH-0020ik-VA
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:10:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EEB99E0002;
	Thu,  9 Jun 2022 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqN5znb+dlqAWvFeLAcPi/B/Ngq+tNLs0kkLchBQOtg=;
	b=kkMTlr6w7LXD6p2O4dJ52u4sFl3IqqesI2Y953XefKaCvHAqObUm393ANCD58itnRaDuNK
	gKzn1AojwFRS8ozXlEdghrha6e9J7nZIPxEsAIKan6Ct3zQ27uBvC3o/0DZx0kd+HZcIvI
	lBzvawajiP8EsDErlLGqF3jbc2efro/VbHIwfd0R3POGcYXUcVprdC0XaxxEEJ0JDRuw55
	2SIZtO/gX0fIAqGOv7YSrXTUgZtD3f37Pc/kqtBTufvIzCGV1SzU7/uY71ZY367zetu7vx
	CKBJJuCWOPERuuxehMcn9FGgtimM3omXe7OLP8gvKGEpRbwFMMXmrn+J5VQy6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: kernel@pengutronix.de,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/14] mtd: powernv_flash: Warn about failure to unregister mtd device
Date: Thu,  9 Jun 2022 15:09:59 +0200
Message-Id: <20220609130959.293421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-4-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'90914b4e8e2fb630d21d430f8844f7de583a1ac3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_061004_190620_941B57A9 
X-CRM114-Status: UNSURE (   8.37  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjQ3IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpIHNob3VsZG4ndCBm
YWlsLiBXYWlsIGxvdWRseSBpZiBpdCBkb2VzIGFueWhvdy4KPiAKPiBUaGlzIG1hdGNoZXMgaG93
IG90aGVyIGRyaXZlcnMgKGUuZy4gbmFuZC9yYXcvbmFuZHNpbS5jKSB1c2UKPiBtdGRfZGV2aWNl
X3VucmVnaXN0ZXIoKS4KPiAKPiBCeSByZXR1cm5pbmcgMCBpbiB0aGUgcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIGEgZ2VuZXJpYyBlcnJvciBtZXNzYWdlCj4gYnkgdGhlIGRldmljZSBjb3JlIGlz
IHN1cHByZXNzZWQsIG5vdGhpbmcgZWxzZSBjaGFuZ2VzLgo+IAo+IFRoaXMgaXMgYSBwcmVwYXJh
dGlvbiBmb3IgbWFraW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3MgcmV0dXJuIHZvaWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
