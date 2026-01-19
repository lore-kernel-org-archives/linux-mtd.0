Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5297FCCF2DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO5QsNk6GNNgJeDTBKa6bUfYwbBPf1n37nEtEL+M3fQ=; b=iQnseHOUWcg9X8
	gAS7wPyZVNU6b4j7nocTaYG7lL1tjeDWQ+y3vPpZQddGJxlhzc+tglBcdTYfXAUk0NdIaUU0aSDV7
	JncVut7eZHW1ee0kETOipxU+Pv90S2sxM4bcOAVopnwMTHMpdz/TAQ8JtG2nLZ2MrDNyi7QLHJsde
	v9hgzUeFIRS/EnA6+LHjGZhFcHSPHnnuK1PesPNSmGALovO7w0V/4/BC5ZJKwez5Yq4tyPgQUApvc
	iRih1sCXjCWVQHCkOvhnsoU20S8ziNZCnDWKmnZBiG7TePJuCsCkCwYOmZFOPsTF/5i8wXTC+f48i
	ndMxW+pbGxo14pwOdNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHm-00000001jXA-2qHw;
	Mon, 19 Jan 2026 10:15:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHQ-00000001jUQ-3Wl1
	for linux-mtd@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yxaQrmThBFcPgQGwYOBHnw7wdygml2b0FhCn3rQcK4c=; b=LQErJtzLzJrPFgjSqobkvW1l1Y
	lpthDHbINP2hsgZKtNQIG5l7Km7CZvjyUFUsIzLZ/RJFrjqEnezq9pGiPiJFs5a1jrVR/Rodt7Rgl
	ZSgt20WPatnaKPllfUnwUoZQfK/J+fcpANXI4DpSBCJ8SnszIM2pZRtM8jfA2I+Ft8mVJGE1mR0E4
	TorJyFBoDUSy4ws1b7mxNiMeBZkby8En2EeUiqrLOCIBr+1nMGse8YWlB659mPSvUpdZwJRGZTsZ+
	88LImNh08cR40fUyuP0/0QWEMIFF67niUJ4uIw8xp2bkuDNyKtdlprbcoVzE0e4Du+q92iUlshSDl
	+EXHfCIg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHN-0000000Bpb3-3hYM
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:14:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2EE104E41BE4;
	Mon, 19 Jan 2026 10:14:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9EF560731;
	Mon, 19 Jan 2026 10:14:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E420F10B6AE12;
	Mon, 19 Jan 2026 11:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768817667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yxaQrmThBFcPgQGwYOBHnw7wdygml2b0FhCn3rQcK4c=;
	b=hdzNOLqNQ7deSQWHMVtLBujOFno7a/bua+vIBUBUDr2mgJfDZ4RDCVJxwpoBAz7gPcWu33
	NRgTRcD46RyPZ1SEZZfvkm/H/dZ8t5d26pR/nn232CKH3pJlh4MbqsReqRVy8DI5ZgTWxY
	l3F2TRB5tln3DEeJ69h6AAL3nm1KmI0g8RrnXISOrYOcuVKKMYfP4ublAplFjp1n4V9bgI
	f+J5KRkNbkAZyg0SPuqDc+n0j5f2c0U3i56x0DAN8F7GDaLw/Hc++BBKcYLOEA34jnsECQ
	3VLLLo3qaVxbRAtZJic8K48wj50IVkxV1e30KoWqiFA00cDQ/p6CDKgdXWQMxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20251219110935.2430225-1-alok.a.tiwari@oracle.com>
References: <20251219110935.2430225-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] mtd: rawnand: cadence: Fix return type of CDMA
 send-and-wait helper
Message-Id: <176881766479.2432692.9166986607501373436.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:14:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_101437_975685_FDB48CDB 
X-CRM114-Status: UNSURE (   7.18  )
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

T24gRnJpLCAxOSBEZWMgMjAyNSAwMzowOTozMCAtMDgwMCwgQWxvayBUaXdhcmkgd3JvdGU6Cj4g
Y2FkZW5jZV9uYW5kX2NkbWFfc2VuZF9hbmRfd2FpdCgpIHByb3BhZ2F0ZXMgbmVnYXRpdmUgZXJy
bm8gdmFsdWVzCj4gZnJvbSBjYWRlbmNlX25hbmRfY2RtYV9zZW5kKCksIHJldHVybnMgLUVUSU1F
RE9VVCBvbiBmYWlsdXJlIGFuZCAtRUlPCj4gd2hlbiB0aGUgQ0RNQSBlbmdpbmUgcmVwb3J0cyBh
IGNvbW1hbmQgZmFpbHVyZS4KPiAKPiBIb3dldmVyLCBpdCBpcyBkZWNsYXJlZCBhcyB1MzIsIGNh
dXNpbmcgZXJyb3IgY29kZXMgdG8gd3JhcC4KPiBDaGFuZ2UgdGhlIHJldHVybiB0eXBlIHRvIGlu
dCB0byBjb3JyZWN0bHkgcHJvcGFnYXRlIGVycm9ycy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBu
YW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogY2FkZW5jZTogRml4IHJldHVy
biB0eXBlIG9mIENETUEgc2VuZC1hbmQtd2FpdCBoZWxwZXIKICAgICAgY29tbWl0OiA2ZDgyMjZj
YmJmMTI0YmI1NjEzYjUzMjIxNmI3NGM4ODZhNDM2MWI3CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2
YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIg
KHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRz
LApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
