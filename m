Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5AFC54EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 11:09:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78702072E
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 11:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EVF9Wp/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78702072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fLTmvbacfzu9H8MhabeyzJFut+OFGHMByD0BMFF5G4=; b=EVF9Wp/HVm6H7q
	zw8ZFObLzOqKg2bIVAZe4Ws6tRdu2jmjk+FlA3Ga61XWGfRDTm67PVabIhQP/xJ+9NUkC/W6ljsTp
	ooDr734djdoepXf0b3PzPWXp7zTCs/UmvidLlSwDwhrNMgd8Gcf1LmCkvC3shx2hIdsOUxF1T54tU
	WnhwVqGYQDL/y0rOfI4EfdeYp1y3120zzaRFFCKeVA9BadEvW5iTIoQTgKSLluJmjjTCL2iUEfwaw
	7yEPfOREO/X+9fJfCxRH8WM9WSy4SDmBPtuwxpok6v6oAhiZfqSOPtJQtYuUGapAg/JogJrSH9VwH
	/VfB1qG2cPFCflEffozw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyTr-00019g-Ou; Sun, 22 Mar 2020 11:09:23 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFyTp-000194-DX
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 11:09:22 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1ABF2240009;
 Sun, 22 Mar 2020 11:09:12 +0000 (UTC)
Date: Sun, 22 Mar 2020 12:09:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [PATCH 1/1] mtd: add | as a separator after mtd-id
Message-ID: <20200322120911.70af403c@xps13>
In-Reply-To: <CAP6exY+m7SGgkg1Ng7tzDU8m--vb4bg=Re_C3OX8jdPAZGn17w@mail.gmail.com>
References: <CAP6exYL889zuXgDhLE3SdwzC4idZ6tbe2oqXQRpZT2M6SrRbFg@mail.gmail.com>
 <CAP6exY+m7SGgkg1Ng7tzDU8m--vb4bg=Re_C3OX8jdPAZGn17w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_040921_594870_FA01A9B8 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9uYWxkLAoKcm9uIG1pbm5pY2ggPHJtaW5uaWNoQGdtYWlsLmNvbT4gd3JvdGUgb24gU2F0
LCAyMSBNYXIgMjAyMCAwODo0NDowNwotMDcwMDoKCj4gQW55b25lPyBUaGlzIHdpbGwgYmUgZ29p
bmcgaW50byB1c2UgYXQgR29vZ2xlIGludGVybmFsbHkgYW5kIEknZCBsaWtlCj4gdG8gZ2V0IGl0
IHVwc3RyZWFtLgo+IAo+IFRoZSBvbmx5IG90aGVyIG9wdGlvbiB0aGF0IHdvdWxkIHdvcmsgaXMg
dG8gdGFrZSB0aGUgcGNpLWZvcm1hdCBuYW1lcwo+IGNyZWF0ZWQgYnkgaW50ZWwtc3BpLXBjaSB0
aGF0IGhhdmUgOiBpbiB0aGVtIGFuZCBjaGFuZ2UgdGhlIDogdG8gJy4nLgo+IElzIHRoYXQgbW9y
ZSBhY2NlcHRhYmxlPwoKT25lIGltcG9ydGFudCB0aGluZyB0byBub3RlOiBCb290bG9hZGVycyBz
aGFyZSB0aGUgc2FtZSBtdGRwYXJ0cwpkZWZpbml0aW9uIGFuZCBzaG91bGQgYmUgdXBkYXRlZCBp
ZiB3ZSBkZWNpZGUgdG8gc3VwcG9ydCBhIG5ldwpzZXBhcmF0b3IuIFUtYm9vdCBhbmQgQmFyZWJv
eCBhdCBsZWFzdC4KCkkgdGhpbmsgY2hhbmdpbmcganVzdCBJbnRlbCdzIFBDSSBkcml2ZXIgbmFt
ZSB3b3VsZCBiZSBtdWNoIG1vcmUKcHJhY3RpY2FsIGZvciB1cyBiZWNhdXNlIEkgZG9uJ3QgZmlu
ZCB0aGUgJ3wnIHNlcGFyYXRvciBiZWluZwpkZXNjcmlwdGl2ZSBhdCBhbGwuCgpIb3dldmVyLCBJ
IGRvbid0IGhhdmUgYSBzdHJvbmcgcG9zaXRpb24gYW5kIEkgd291bGQgd2VsY29tZQpSaWNoYXJk
LCBWaWduZXNoLCBUdWRvciBhbmQgQm9yaXMnIHBvaW50IG9mIHZpZXcuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
