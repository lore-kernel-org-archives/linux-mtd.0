Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60E4606A885
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fu7y+qGz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=p22FMlTG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6hIXyV5W++WgAGjl6fskh4uOGsoUyO3RUrT8fEZU5Pw=; b=Fu7y+qGz0xUEq0KO+0PVRNeQFg
	Xq2wi3YFjgRMPIhvzyWCJC/QHPKZcveQ7yAfQjZiZb23br4nAaxH9J8pV8qWlgCTNWPXKmh/xq3fu
	zAKMx27C5PNyTy7fYVpoRkMyF0Ow27xm/5W6lGObG/QGLfTRgrcavtFl/bgXIlJ8T1pmnCPqcngwW
	6mlvPqM1t6r14nJ43X5i7xNkfb882xCe73u8SUDEw3QdIPce7IwQTLNA+/tvLqp/ITnIJ17Lu1JSJ
	nPGjR9mGECGw6y5hNLr3gTO3H7RGGSXxtKtkB9oIqSQm+ruPr632c5I86+IOZCV2utfMdawpnOdye
	8EppmMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx8j-00000002iBd-0O6m;
	Mon, 16 Nov 2026 13:52:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx8d-00000002i7Z-2zLB
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 13:52:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9FFA01A168D;
	Mon, 16 Nov 2026 13:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DD936023F;
	Mon, 16 Nov 2026 13:52:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A21C11BC051A;
	Mon, 16 Nov 2026 14:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kItaQQWrnsLmpfYQZnmo5ZKiXXzLU/di5P/nGlEMeeU=;
	b=p22FMlTGS83GiD4ReWdtyZdg8MKbu7uh94nYkuVts6IkcBtP2fWLcHhnSCwAXjAxfltMB+
	DJN/G2iok11zFHQ0icO+riMgR0dtWZMMZTjCco5ac/7fB+3KfRR1WAhv1spJauE3/RSFip
	y/p8h0El8GcLHOurQFRaw8QZwk03lZlI5DX0lQYXvylYbmZmdoIm8WNO1JrXPElG3Ovog7
	vx2QCUOLuexHBng2MTzRVTzMZFFNH1chgnwtAvHVdNiCZoefi33/iS0sgHvJJpxRXdCTxw
	HnO1JPIfYNBt3md2EqSf5CKZ0ZqnThr+xCy2b9bJbeuxa9gct7Mo3wlzD9VQ4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Samarth Narang" <samarth.colleges@gmail.com>,  "Han Xu"
 <han.xu@nxp.com>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  sashiko-reviews@lists.linux.dev,  "Richard Weinberger" <richard@nod.at>,
  imx@lists.linux.dev,  linux-mtd@lists.infradead.org,  Frank.Li@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
In-Reply-To: <sashiko-outbox-191156@kernel.org> (sashiko-bot@kernel.org's
	message of "Fri, 30 Oct 2026 15:20:32 +0000")
References: <20261030150929.2944717-1-samarth.colleges@gmail.com>
	<sashiko-outbox-191156@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 14:52:44 +0100
Message-ID: <87pkw4sx1v.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055251_919376_E52CA7B5 
X-CRM114-Status: UNSURE (   5.74  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMzAvMTAvMjAyNiBhdCAxNToyMDozMiBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW01lZGl1bV0gbXRk
OiByYXduYW5kOiBncG1pOiB1bnN5bmNocm9uaXplZCBETUEgdGVybWluYXRpb24gaW4KPiBncG1p
X25mY19leGVjX29wKCkKClNhc2hpa28gY29tcGxhaW50IGxvb2tzIGxlZ2l0aW1hdGUsIHNpbmNl
IHlvdSBoYXZlbid0IGFjdHVhbGx5IHJ1biBpbnRvCnRoYXQgcHJvYmxlbSwgSSBiZWxpZXZlIHRo
ZSBmaXggaXMgaW5jb3JyZWN0IG9uIHRoaXMgcGxhdGZvcm0gYW5kCnRoZXJlZm9yZSBhIERNQSBw
YXRjaCBtdXN0IGJlIHNlbnQgZmlyc3QuIEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2gsIHBsZWFzZQpy
ZXNlbmQgb25jZSB0aGUgRE1BIHBhcnQgZml4ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
