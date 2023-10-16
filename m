Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001B2CDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SE3XiczHEDvwETM0gBDF8OlVXMFbc6N4cS0/PTKXB/8=; b=tqQwhLJOsTI9Zp
	rUwl44rB91bPzPgqlAMERSu9vgecHlRRmO3OOUsA7kPRBgVpJS63EjEoyqVtAOsU3zkoXpOCtfi+1
	oh85Ud9ejz1nwwZ7wxk75uvaZBt/BWm9XTYOw/PK40l+4dCOsD94g2i+AopFGKOsbvNGyeqtvJJFC
	/6H3YbjXXpZilpI4ow25dmXf1DiaK3zXVo9d3tHqxY5MB0Yn8l2eigZTxGHqDdHMfObz6kX17gRTk
	dsmM/5VVn6C33nT3ckGZapZ/rbqomVM/HWOVZosIIfHVQXL9TazeP0EnsB3078GnDsxQ6TZK6Gpts
	JcyQS2jzFgGKz/ek1HeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtn-00907M-1s;
	Mon, 16 Oct 2023 09:28:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtm-009065-0S
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Oct 2023 09:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X2vTXS9z/qGFxHJeZoZ7o4gX8+e15zVoYHUEVOsd3YM=; b=iLnX6Bc+U6yHiulht+zQ0nGYh2
	LU4FgVdElzvuYM/D3vfCbcyUf5TWRl+t5hK/M6gHhfICK24R3+wHxg5HAiWo1Fd7Y6DorOTbFpts1
	NpZJjGvaaqtr1BGOBInU4qCCeHL1y77e0o1rzxlxR36c1lr28ropWzpA+mXn8ATi75oZHzSBnaoGo
	JS24jxCQ0CvpHBwjgx6Jii5cTOybyXbKHGUMjbhRi6thXiZOUy8jhM26vDBD7gKYhGDOuF94tICuk
	vJHWpU10EjF6MHYicY48cD/jZ8cus1aqLoSmt7t4jH0qB3++5RD9yNt3bYgC5y/msuq0i4AMWJXZr
	7dDUMDKg==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtV-005rbE-2K
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:28:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A2DFFF815;
	Mon, 16 Oct 2023 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2vTXS9z/qGFxHJeZoZ7o4gX8+e15zVoYHUEVOsd3YM=;
	b=VwLjZW8W+xCvUJbjl0mYtroJALq0cFvN0Jlo1pFJryyxRCy6SXfxVqE905mpGhANuTkVba
	ccSDm8WHxRSoP5RI1eK3jd1D6GH2NmgWeqpBGRATgsYIxwfJsS+F3A1gxxZl/8QasNoh9p
	PAI+kiQp8RfC4+nXaRTzG+Zt3d3uyTr2A+3XhTs7WOsn5f2qRb0LU8gGQtqKcNYdKzUM0Z
	8lFTzTOenF06Zb1G1OIbIwBN9F4dZS+CA3L0cnh2Ew7WPRAIXWafjBmGSH9tSogcvgr3RR
	RJ6orMigjKeP8/pd66X2rucrfPwqWo2igHdopOxTiO4NRDjdRVVl1hXuBrp8AA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 07/20] mtd: spear_smi: Convert to platform remove callback returning void
Date: Mon, 16 Oct 2023 11:28:08 +0200
Message-Id: <20231016092808.288708-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008200143.196369-8-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3401446fa40d621d067e3bbf9c8805325c9a21a6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_102815_599013_2FD84F5B 
X-CRM114-Status: GOOD (  11.06  )
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

T24gU3VuLCAyMDIzLTEwLTA4IGF0IDIwOjAxOjMwIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
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
