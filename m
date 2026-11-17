Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D086F606A32C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VPBRD309;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=np0ax1GY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qOG+ZC3ASVXi7swYSv75RJUXQFmAhevom33Q8UVIMaA=; b=VPBRD309+1O0QcbWGtYr6XyjpK
	/s/ahNOejhFiL9arBl41prJuS2hZISNjUfZL+KFYqRXWn6qpWzftG2LYpGdpFJ2OrnXk8jFsovwpr
	tFAP6ulDic57/rxFNGiENBjAX3jL+RSnLECXESYRMcYyUOm4cfi9kcvEkCBy//HR/2DICxJMn3C1h
	Me7PG3ELt5rBpjjx/Wz07SmkZ09WbTqBM3r1u6EM82Znqj7n8T988ab5jjO6nC0ew0rKzubyCGdPd
	u64Lkj0L2B3UYedErC08MhpaGg/yztUskHvEPa5IGVKoBZDRoGAFxgfBVaVrpaRhZgM3CnnB+jqW4
	i2sRhRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJrI-000000064Cc-0ArS;
	Tue, 17 Nov 2026 14:08:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJrF-000000064BL-2Evs
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:08:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8728C1A162D;
	Tue, 17 Nov 2026 14:08:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A88A5FC81;
	Tue, 17 Nov 2026 14:08:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A87611BC0024;
	Tue, 17 Nov 2026 15:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794924500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NC6ZdVr8PNnbXOJqM4/9u9Fx5qy89lUhN3gY95QsORE=;
	b=np0ax1GYh8y8hX/axL4c6tX2KdsQYngA5vekITEeamJXrmg5sltJaPe9OWZkkhSkftPAXY
	VtQFeF6swqfLZqxWNM+Um1JQfbVJkKfFRXE/ufXEel2BgG/BajJX6tYxs4pbKCMIZRKAkS
	FdJ7tkG1tisvq2hfLpRNzJoOA6GBWwpjWkg1SryPcAKIKiZYgV5gRlW1jS9l3U5430sTvN
	R5cH+0+dbJ43DMk+lJHGWxk+k3e0lmMF3JhPz12q+FFy0Vm1vyenAKYQeggt4VZGojRn5D
	+c9Kseq0X3nA2m7F5EBf9DSQ+SSSBv4v+ei6j/bva7J92BEx7fGiBpHXb2uubA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Samarth Narang" <samarth.colleges@gmail.com>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  "Han Xu" <han.xu@nxp.com>,  "Manivannan Sadhasivam"
 <mani@kernel.org>,  "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
  "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
  sashiko-reviews@lists.linux.dev,  "Richard Weinberger" <richard@nod.at>,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev,
  linux-stm32@st-md-mailman.stormreply.com,  Frank.Li@kernel.org
Subject: Re: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping
 on timeout
In-Reply-To: <sashiko-outbox-191272@kernel.org> (sashiko-bot@kernel.org's
	message of "Fri, 30 Oct 2026 16:38:42 +0000")
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
	<20261030162041.2998170-6-samarth.colleges@gmail.com>
	<sashiko-outbox-191272@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 15:08:15 +0100
Message-ID: <87h5hflfe8.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_060825_716771_1CC4C301 
X-CRM114-Status: UNSURE (   5.52  )
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

T24gMzAvMTAvMjAyNiBhdCAxNjozODo0MiBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW01lZGl1bV0gbXRk
OiByYXduYW5kOiBtYXJ2ZWxsOiBzbGVlcCBpbiBhdG9taWMgY29udGV4dCBpbgo+IG1hcnZlbGxf
bmZjX3hmZXJfZGF0YV9kbWEoKQoKSSdsbCBiZSB0YWtpbmcgdGhlIG90aGVyIHBhdGNoZXMsIHBs
ZWFzZSBmaXggdGhpcyBvbmUhCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
