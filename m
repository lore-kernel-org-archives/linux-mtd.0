Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC75606A31A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 15:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=siVkdwHj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EtZNgrCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F6nCEYgTf3Dr20+xEcqV8c+13Q3wALsJU9ZDYmEpcQQ=; b=siVkdwHjdQWcKBHaJPCQGXoWVM
	EdQt4U7Wdu4RmV2Xq5rHZ7oqslJhSfQmDFsuSURLE5hd7lAsY8bbKC6GneNhbxuTaLau7AvJv07jY
	DFGo+wZhNtr0OIgkY7QaRXcgAs8A+ZbyPcWYUsNdsqRckGP9+wJQzuiN69kqhvrfzVxuClcU/aui+
	ly8wn9++T7WJbSH9SHI7yTEgVKGxMD5bSWzsXqA0Gso+BGJ83LBBLZVnqkif0s8J2iPSp/5cnV9KL
	Kv16pn97sn1Rwaa24dgy4urhXeKL1R3MjkDksuEkY2ddyzhUCw0YM/6hLMxNTwOL1qzYSzAjKeWPm
	goUp97DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSWU-00000009i0B-45DF;
	Thu, 29 Oct 2026 15:58:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSWR-00000009hzb-2M88
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 15:58:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BA740C49F4A;
	Thu, 29 Oct 2026 15:59:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 450C86076B;
	Thu, 29 Oct 2026 15:58:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09C2D1032910A;
	Thu, 29 Oct 2026 16:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793289504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V1AcEN3/F7WCrixuUIKybsNv5HdIIcQfV8dHDzHK5Dc=;
	b=EtZNgrCNIU0luOGdzO+em8UiYQvCgbSDaFgUTCvPjSTPJwbkszVmGSg4IYnP0diUE8N229
	ans4HJ+68rYQLYLGW2trcnbOGGXuKYc2Qr9sGrZ8mU6e5pDy1PCBQFwthZWb+GAfEZqu3C
	aNpu0sxh3cdyrwX6EBGPIL03wo1db9eOcgAeiiqRdhJB5MaU7gaHrXnH85IVaeXwdhB5Cf
	cZmu1NSwv7bPc/lCcLRQsw9raSagx6XBVDyZnjdHnglOqlWPd+xTzaMXqA76Enm887oZZf
	+xxf7Roub1zJ0d2W9wGQ/IiXaVaVd2EIqUWQGhsJk/Pab5d5cqWQIBV6PwBMWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Martin
 Kurbanov <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH RESEND v5 3/3] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
In-Reply-To: <20250917215401.19132-4-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 18 Sep 2025 00:54:01 +0300")
References: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
	<20250917215401.19132-4-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 29 Oct 2026 16:58:18 +0100
Message-ID: <87mrrwebxh.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_085835_766561_A04AECF8 
X-CRM114-Status: GOOD (  10.68  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWlraGFpbCwKCk9uIDE4LzA5LzIwMjUgYXQgMDA6NTQ6MDEgKzAzLCBNaWtoYWlsIEtzaGV2
ZXRza2l5IDxtaWtoYWlsLmtzaGV2ZXRza2l5QGlvcHN5cy5ldT4gd3JvdGU6Cgo+IENvbnRpbnVv
dXMgcmVhZGluZyBtYXkgcmVzdWx0IGluIG11bHRpcGxlIGZsYXNoIHBhZ2VzIHJlYWRpbmcgaW4g
b25lCj4gb3BlcmF0aW9uLiBVbmZvcnR1bmF0ZWx5LCBub3QgYWxsIHNwaW5hbmQgY29udHJvbGxl
cnMgc3VwcG9ydCBzdWNoCj4gbGFyZ2UgcmVhZGluZy4gVGhleSB3aWxsIHJlYWQgbGVzcyBkYXRh
LiBVbmZvcnR1bmF0ZWx5LCB0aGUgb3BlcmF0aW9uCj4gY2FuJ3QgYmUgY29udGludWVkLgo+Cj4g
SW4gdGhpcyBjYXNlOgo+ICAqIGRpc2FibGUgY29udGludW91cyByZWFkaW5nIG9uIHRoaXMgKG5v
dCBnb29kIGVub3VnaCkgc3BpIGNvbnRyb2xsZXIKPiAgKiByZXBlYXQgcmVhZGluZyBpbiByZWd1
bGFyIG1vZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtoYWlsIEtzaGV2ZXRza2l5IDxtaWtoYWls
LmtzaGV2ZXRza2l5QGlvcHN5cy5ldT4KClRoaXMgcGF0Y2ggdW5mb3J0dW5hdGVseSBicmVha3Mg
Y29udGludW91cyByZWFkcyBvbiBteSBib2FyZHMgd2l0aG91dApkaXJtYXAgc3VwcG9ydC4gVGhl
IGZhY3QgdGhhdCB0aGV5IGRvIG5vdCBoYXZlIGRpcm1hcCBzdXBwb3J0IGRvZXMgbm90Cm1lYW4g
dGhleSBhcmUgbm90IGNhcGFibGUgb2Yga2VlcGluZyBDUyBhc3NlcnRlZCwgdGhlc2UgYXJlIHR3
bwpvcnRob2dvbmFsIGhhcmR3YXJlIGNhcGFiaWxpdGllcyBhbmQgaXQgc2VlbXMgdGhhdCB3ZSBj
YW5ub3QgZWFzaWx5CmRpc2NvdmVyIGl0IGF0IHJ1biB0aW1lLgoKSSByZWNlbnRseSBoYWQgYSBz
aW1pbGFyIGlzc3VlIHdpdGggYSAicG93ZXJmdWwiIGNvbnRyb2xsZXIKKGNhZGVuY2UtcXNwaSkg
d2l0aCBkaXJtYXAgc3VwcG9ydC4gVGhlIGZhY3QgdGhhdCBjb250cm9sbGVycyB3aWxsIG9yCndp
bGwgbm90IHNwdXJpb3VzbHkgYXNzZXJ0IHRoZWlyIGNoaXAgc2VsZWN0IGlzIG5vdCBkaXNjb3Zl
cmFibGUKZWl0aGVyLiBBcyBhIHJlc3VsdCBJIGNyZWF0ZWQgYSBzcGktbWVtIGNhcGFiaWxpdHkg
dG8gZmxhZyB0aGlzCmltcG9zc2liaWxpdHksIHdoaWNoIGRpc2FibGVzIGNvbnRpbnVvdXMgcmVh
ZHMuIEkgd2lsbCBzZW5kIGEgcGF0Y2ggdG8KcmV2ZXJ0IHRoaXMgY29tbWl0IChrZWVwaW5nIHRo
ZSBwcmV2aW91cyBvbmVzKSBhbmQgYW5vdGhlciBvbmUgdG8gZmxhZwp0aGUgQWlyb2hhIGNvbnRy
b2xsZXIgYXMgbm90IGhhdmluZyBmdWxsIGNvbnRyb2wgb3ZlciBpdHMgQ1MuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
