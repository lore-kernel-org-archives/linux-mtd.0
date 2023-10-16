Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3491CDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZLUP3HLyWd5LMP6UdKEG5LCGk1VHRkHMhpA/dhXA9w=; b=tFShbjpA95xa1I
	dS6ArA1EtZuPw+PXfth0kYdO03ID6lEUabhUHWGBug66jdgm7lNs1ChH8ciLxJemkMylQTlyzJcZp
	eVs+MpoTgFszQnk2VJIwilrRq61iDPkqoYu8C61LgXumjVGK4thxMNgjTvQIcCqM2wVxK3IIoWM/9
	mBC0QBk37YnAEHTFDxafXmhvUNouVtW8aTO6UXQJkQE3HJtrCnQZjgRfl+6QsLrbaQctogWDfpM5K
	Y5ZHFYhJdwA5gVVaQ3fBrHjQ3argZQLgJ2KmKU6DzzWLXpJ6HHLAYcntwmJAzDbWcFa1mu+eyEKMX
	s74BHnC1YFs8mjs+uFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKrZ-009JFC-26;
	Mon, 16 Oct 2023 10:30:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuF-0090R9-0r
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Oct 2023 09:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/tNe9A7kEEeHiefx/ZkP85Wtga02myNDPuFbmDMvcBc=; b=Zs5+Zuy5bmK5h4zTWFbbun6Dxq
	t6tHcLcBltAWLUx5Cn0rKgpL6cwe0jf1GPwPqyGSKlFphRDTngpxWBSOVD3CMs+3V3Iv1IrNKrR2X
	wmTwV7sQI6dp3dNj+Xw3yXA++YgrAAiokiXedRidjw6B4boouESuzjlv98FQZn6MnqnE9AF858fjn
	MpvOMmKsKETpyld1IZSvmNL1QssFDbTFq2MCVOvP53akpvKoFpakK+u34yQcbtrKzoOolbfAbhidH
	SiEMdcGU2ERI1rBYp6GiK8JCBwsRJxl7vu3GJvjt7h4bBDOnk0tGRcNE/hxteibhsj/fxXq1E1ZoJ
	C7BYHJyA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtw-005rhL-21
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:28:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 964281BF209;
	Mon, 16 Oct 2023 09:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/tNe9A7kEEeHiefx/ZkP85Wtga02myNDPuFbmDMvcBc=;
	b=RJhIlLWL4y6MuVQzo/0tRgi73TH4Jfio6nXrFZ0M+WZyIteTzszURFZeekEzFI/VWpO6it
	TnTf88Dxy/s5D9haARqCKkw2VVAng2QbC4fD4dz8Vp/2m3D2xGS0tKr+OZ4p0Eg+dfp3aJ
	7DqyeQPJO0bdsI0wzumShBxBXretvT5eiVvsM8fgEDmDoUAGnHSUEUm7/WN+32Bec/yBMG
	Wq2IZYtjtqeFdIjHEs/hHkNtXrEqbxRJacJgwdelbO+l2jlIMN57W/HCskZ1xfa11Yfoh3
	FJX2AwB+7HTzObfJeHXDYPcpfSOnpzw5qd9pvuf+jYcDAyrLqIKBr+qoIXTMLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 03/20] mtd: bcm47xxsflash: Convert to platform remove callback returning void
Date: Mon, 16 Oct 2023 11:28:27 +0200
Message-Id: <20231016092828.288820-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008200143.196369-4-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0e0672a5b83a7d53182733a604d67214d93256f9'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_102842_706004_8B3707E0 
X-CRM114-Status: GOOD (  11.17  )
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

T24gU3VuLCAyMDIzLTEwLTA4IGF0IDIwOjAxOjI2IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZv
cm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBkcml2ZXIgYXV0aG9y
cyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5Cj4g
cmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGln
bm9yZWQgKGFwYXJ0Cj4gZnJvbSBlbWl0dGluZyBhIHdhcm5pbmcpIGFuZCB0aGlzIHR5cGljYWxs
eSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLgo+IAo+IFRvIGltcHJvdmUgaGVyZSB0aGVyZSBp
cyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4KPiB2b2lkLiBJbiB0
aGUgZmlyc3Qgc3RlcCBvZiB0aGlzIHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8K
PiAucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBh
ZnRlciBhbGwgZHJpdmVycwo+IGFyZSBjb252ZXJ0ZWQsIC5yZW1vdmVfbmV3KCkgd2lsbCBiZSBy
ZW5hbWVkIHRvIC5yZW1vdmUoKS4KPiAKPiBUcml2aWFsbHkgY29udmVydCB0aGlzIGRyaXZlciBm
cm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2FsbGJhY2sgdG8gdGhl
IHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBt
dGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
