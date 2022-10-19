Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0904C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L32jPqccFzbpg/ozOgGlTV4cGCM3exXhDSUHEVoCddQ=; b=u95Auisc2TiDpk
	94iA0OVvdFZbJNEGVgd3Ldx5BKn4xIMSKDxfpMOQa+KLrEjx4QHY/bO+VcI3Scbj+YcsQxb3hl7WO
	PRmfF1RzFP4dHGoRkmBUoByI7c7m8mN/nk7SXAmRdMxsCAQP9lkFEUiWvEqT2dulkgX1OuDqw0sTv
	yhnPUTktPT8l5RGLeODs66VZJNNJcI9aenJQyMmo8xPimfWJiIHm9Vl/jBtUOdjiLaUVQTJ300cPL
	s81qG/u32R4Mz4mjuDLL0+YJEjZrGm7Bha23lwP3KwKC3OKmLjAQV8yoarg2atosasNIqMed1wAmq
	l1pMOsD5LwGSpUMqBCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olEqI-004sPl-Q5; Wed, 19 Oct 2022 19:35:06 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olEqD-004sNM-Qp
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 19:35:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0F6CC1BF209;
	Wed, 19 Oct 2022 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666208097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mmf9CPdiclhIqMk6wheZIjWzJZtx7O+oRbJTWrn1Yu0=;
	b=iFHpd8DAVGjUmdfEig2L/bGp/ZyJl1nwNne6LdHMLxEhcu34cprUT40KoVB2tr5djye6En
	YHTR1UGpi32NGycLF0RJVaHkDcLGOyqBQI8JyGwnYKRp4jO/5dYSy86MlvOj7GMU3fBx1n
	yRtBHvmCkSyhGc5ng4eFW1q2XSjM4chevFDCEj5sRijkbMe936ZaBDprsfnzxrKUXPRsHx
	Qh9fRvhqlli7rIJdL48mF4YyhMJ7WCLU4oQSp0M41mFh4cveIKlZS+zR8NFXhhlzH9gZyA
	HHgU+QsGqYwkh0StsEpUbEqAy0WL82jrCPo/xFYqT8Y3nC6SOFNTiHlc0FeWYw==
Date: Wed, 19 Oct 2022 21:34:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andreas Oetken <ennoerlangen@gmail.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Richard Weinberger
 <richard@nod.at>, Tokunori Ikegami <ikegami.t@gmail.com>, Andreas Oetken
 <andreas.oetken@siemens-energy.com>
Subject: Re: [PATCH] mtd: cfi: add fixups to support MT28FW02GBBA1HPC
Message-ID: <20221019213452.18fc681e@xps-13>
In-Reply-To: <Y1Aeq5Jzj7+RdCSd@kroah.com>
References: <20221019154924.15088-1-ennoerlangen@gmail.com>
	<Y1Aeq5Jzj7+RdCSd@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_123502_046438_26089FEA 
X-CRM114-Status: GOOD (  12.36  )
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

SGkgQW5kcmVhcywKCmdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlIG9uIFdlZCwgMTkg
T2N0IDIwMjIgMTc6NTg6MzUgKzAyMDA6Cgo+IE9uIFdlZCwgT2N0IDE5LCAyMDIyIGF0IDA1OjQ5
OjI0UE0gKzAyMDAsIEFuZHJlYXMgT2V0a2VuIHdyb3RlOgo+ID4gQXBwbHkgZXhpc3RpbmcgZml4
dXBzIHRvIE1UMjhGVzAyR0JCQTFIUEMgZnJvbToKPiA+IENvbW1pdCAwYThlOTgzMDVmNjNkZWFm
MGE3OTlkNWNmNTUzMmNjODNhZjAzNWQxICgibXRkOiBjZmlfY21kc2V0XzAwMDI6Cj4gPiBVc2Ug
Y2hpcF9yZWFkeSgpIGZvciB3cml0ZSBvbiBTMjlHTDA2NE4iKQo+ID4gQ29tbWl0IDBmZTNlZGU3
OTQxZGZjZDZmZDU0MGZjMmIwODY0NTNkM2VlOGYyMzYgKCJtdGQ6IGNmaTogQWRkIGVhcmx5Cj4g
PiBmaXh1cCBmb3IgUzcwR0wwMkdTIikgIAo+IAo+IFRoYXQncyBub3QgdGhlIHByb3BlciB3YXkg
dG8gcmVmZXJlbmNlIGNvbW1pdHMgaW4gY2hhbmdlbG9nIHRleHRzLiAgTm8KPiBuZWVkIHRvIHVz
ZSB0aGUgZnVsbCBzaGExLiAgU2VlIHRoZSBkb2N1bWVudGF0aW9uIGZvciBtb3JlIGRldGFpbHMu
Cj4gCj4gQWxzbywgdGhpcyB0ZXh0IG1lYW5zIG5vdGhpbmcuICBQbGVhc2Ugc3BlbGwgb3V0IHdo
YXQgeW91IGFyZSBkb2luZyBhbmQKPiB3aHkgeW91IGFyZSBkb2luZyBpdC4gIGFzLWlzIGl0IGRv
ZXNuJ3QgcmVhbGx5IG1ha2UgYW55IHNlbnNlLgoKSW5kZWVkLiBBbmQgdGhlIHRpdGxlIHByZWZp
eCBpcyBzdGlsbCB3cm9uZyA6KQpnaXQgbG9nIC0tb25lbGluZSAtLSBkcml2ZXJzL210ZC9jaGlw
cy9jZmlfY21kc2V0KiBzaG91bGQgaGVscC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
