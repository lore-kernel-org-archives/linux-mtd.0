Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BC1FD3774
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ocpfNfLG1/0VKDDnXkTL0uiFaYgLoapU48sA4XYUYQ=; b=3PVesucEZkwrh+
	OQ6OrtdztkJELyoqgeZ/eT/xXHllbjarWd7dXxlRhAoJXv3ZBGCcs2rj98lAQ1f63AHkr9IZafTfZ
	pwW/kPkgxVSK7qSVnsTk3juDNkCI4OHdYDsrSYqSdLznDJhWKKmu1B25FqAevfkP3xNQ+26pwLuHG
	jJHd10I+RPOzYWP7AAVQ4cYO4bZqG/hOh9mz80Iu6m4uK0cn209uux6T8QEJmlak24xMmMzvi2zBb
	fT9VqSkFyd9nT2K89KulVQbD1+txvubFnE0c0Hn0gGIJ15bNoJKB1/SfCyfcieb4nr2QiUBgEZanA
	oAN5jXGmR1igxUuccBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI5G-00000004ZAx-0Olk;
	Wed, 25 Feb 2026 16:49:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI5E-00000004ZA6-0xR9
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:49:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D51831A1315;
	Wed, 25 Feb 2026 16:49:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA34C5FDE6;
	Wed, 25 Feb 2026 16:49:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E069110369259;
	Wed, 25 Feb 2026 17:49:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PrQRVQ7xswHGrp85kP3KNjQWkYKEgb2xbd+748pu/sw=;
	b=KBJLRyayXedyhn72y+Bm5wQX804fb7gZbEhtxdvG7YEpMu+IynmxTQ0TvOmq1tm1ucOm5A
	AKa+C2nBYTC4Nrl1KdFQtx73Tqfv/SKj8brWfSwP55tqk3VIehppJKDnzEgLMNKN/1+VSX
	JSPP98gyAUp+dIQ6kC52ojE2iQKuBnSC/r0Z1Ggw9lQE0Z8ZWmGyiqyUBNlq5PjDEaA6pK
	O4CZ+uRlJI7PTi/DGRFrNx8MrEid2AHGC+imewJvwcQIXTFU42CEeV274liYFketr0Hys/
	n4bk9tKSgDt+SemSAw3Z7OIZma7//W/DwwdJm1p0uAGcfpWAZNIUV8hoTdRZOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, niravkumarlaxmidas.rabara@altera.com, 
 alok.a.tiwari@oracle.com, piotrs@cadence.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260209075618.1683125-1-nichen@iscas.ac.cn>
References: <20260209075618.1683125-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: cadence: Fix error check for
 dma_alloc_coherent() in cadence_nand_init()
Message-Id: <177203818985.1988281.8381199108571701460.b4-ty@bootlin.com>
Date: Wed, 25 Feb 2026 17:49:49 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_084956_400304_352796F0 
X-CRM114-Status: UNSURE (   5.98  )
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

T24gTW9uLCAwOSBGZWIgMjAyNiAxNTo1NjoxOCArMDgwMCwgQ2hlbiBOaSB3cm90ZToKPiBGaXgg
d3JvbmcgdmFyaWFibGUgdXNlZCBmb3IgZXJyb3IgY2hlY2tpbmcgYWZ0ZXIgZG1hX2FsbG9jX2Nv
aGVyZW50KCkKPiBjYWxsLiBUaGUgZnVuY3Rpb24gY2hlY2tzIGNkbnNfY3RybC0+ZG1hX2NkbWFf
ZGVzYyBpbnN0ZWFkIG9mCj4gY2Ruc19jdHJsLT5jZG1hX2Rlc2MsIHdoaWNoIGNvdWxkIGxlYWQg
dG8gaW5jb3JyZWN0IGVycm9yIGhhbmRsaW5nLgo+IAo+IAoKQXBwbGllZCB0byBtdGQvZml4ZXMs
IHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogY2FkZW5jZTogRml4IGVycm9yIGNoZWNrIGZv
ciBkbWFfYWxsb2NfY29oZXJlbnQoKSBpbiBjYWRlbmNlX25hbmRfaW5pdCgpCiAgICAgIGNvbW1p
dDogMDQxMGUxYTRjNTQ1Yzc2OWM1OWM2ZWRhODk3YWQ1ZDU3NGQwYzg2NQoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
