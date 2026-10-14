Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40626CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQ9AiZBKVnLKxjqVBmxxaVkaBt93iPFQHkIaFJDTQlk=; b=FdKAEbpN1E3ObB
	zVZu+w81BfKHdarqahyF3dST2qP1KBEylu0gWDD28MGz3xEiyg5UzbAvp0vw/awFpHSN13qYRvpTE
	uv3Tuek9S/D7fgnmoZ+/tQlXbsFqJ070Ww+5yjM2RD/ELMCxalESFSi5ZSusaRgfy4G8CAKeFuFSz
	PZmfurcFO0wkpRHTERrdy3PrnEQCm7RW1ct+Qc+pzRDDcqsJYd3Tf1IuS0YU5bw1USYA6QKPOS6qf
	ejQOHDLF79oVhSLLP8chs0zcO/wTvg9TH6gfJ1yxqxSddCxtud8v/3J8CupZYYI9nd8NRooT/0tOe
	ETuVt44n8hwarWZfedfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGunP-0000000ExKP-230J;
	Wed, 14 Oct 2026 08:57:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGunC-0000000ExJo-3eBo
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 08:57:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33DBA4E4120B;
	Wed, 14 Oct 2026 08:56:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 086C860368;
	Wed, 14 Oct 2026 08:56:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7F98103286A7;
	Wed, 14 Oct 2026 10:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791968216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QXEXhFBvt4F4QT67cXrgn/2jcAONBRGyvL007IxDRsY=;
	b=rCFDiC6Pd5sxTy0QeydLhT83XQRzmar+QdOIA+cYjU0cWFzoJ2nj6GP/iHgJPDdwUTPtvT
	ssy9Ep2wplciyZH5IX3PyBTJPImiGgSiHNBu9/wYRD/wZXb2PhxOyv6NvCJddVRjYY+7uk
	oI0SkqgVa/2ZVzb1arcpbzw1lICkL1/mNK5JThABjdYeH0KVfdDih5LkUIcG/JqJBJsWFr
	ykGSo7vjFQ0KT3WvT6fYThkaxnRmXQurdGQCMOEKOpSNJOCXJPtA4gMh/LFq4Oaj4/iC8b
	sb5+X0FBtAtaJoCfXVOOJp9e6T8s7mMJzwZ9+DF78yj81HAQxEhvXyFmzW32sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Michael Walle"
 <mwalle@kernel.org>,  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 08/17] mtd: spi-nor: Fix WRSR with ODTR chips
In-Reply-To: <sashiko-outbox-170165@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 13 Oct 2026 16:51:49 +0000")
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
	<20261013-winbond-master-spi-nor-w35t-v3-8-6dde1d513df8@bootlin.com>
	<sashiko-outbox-170165@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:56:53 +0200
Message-ID: <87a4ogzmlm.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_015708_352500_C37ADDE7 
X-CRM114-Status: UNSURE (   4.42  )
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

T24gMTMvMTAvMjAyNiBhdCAxNjo1MTo0OSBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hdIHNwaS1u
b3I6IFVuY29uZGl0aW9uYWwgLUVJTlZBTCBmb3IgMi1ieXRlIHdyaXRlcyBpbiBEVFIgbW9kZQo+
IGJyZWFrcyBmbGFzaCB1bmxvY2tpbmcKClllcywgSSBoYXZlIG5ldmVyIGVuY291bnRlcmVkIE9E
VFIgY2hpcCB3aXRoIHRoYXQgY2FwYWJpbGl0eSwgc28gaXQgaXMKZnV0dXJlIHByb29mIHRvIHNp
bXBseSBwcmV2ZW50IGFueSBPRFRSIGNoaXAgZnJvbSB1c2luZyB0aGF0IGluIHRoZQpnZW5lcmFs
IHBhdGguIFRoaXMgaXMgaW50ZW50aW9uYWwgYW5kIHNob3VsZCByZW1haW4uCgpXb24ndCBmaXgs
IHVudGlsIHdlIGdldCBhIG5ldyBjaGlwIHRoYXQgaGFzIGFuIGFjdHVhbCBwcm9ibGVtIHdpdGgg
aXQuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
