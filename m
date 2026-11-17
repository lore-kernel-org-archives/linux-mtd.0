Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B6606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PuftaVFN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oy8qLtKP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nqnIfhM5k7tVBnsj8DObg8YOtBfUHpqB+FUAW8E4YpE=; b=PuftaVFNygTqdghqKrhCfCDGES
	wguy/2MpXU1/9dxfGWE3IC6xgNYwdjLetYNtXmZZgFV0U2xG1lNGF3otsenfagZmavWGxJprLBw3b
	9+CB+aX+oPbB1aGwdrAZQhh6SH76BF13vvJ/PWKR06hV2x3QZYu8Y9PWrWJRiOzBNlbI9L2RF7ibB
	mH9XNWGq2xJx6nOS12QWr6CGLWsQ0QqdIhdszezyYA4Qh90euppUUAIHHuZj+vn+5FKEPCWT7sGfm
	z3TBIpQF2s5J7u0z8n790GX70FAN2NubqNUHnBvKRdgf4IbDsaS0Mw6EtaXejq1dwic/Mb4z7pqGn
	bD3y7Hyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLC4-00000006J5D-3EPs;
	Tue, 17 Nov 2026 15:34:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLC1-00000006J4t-3eH1
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 15:33:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3680D4E4157D;
	Tue, 17 Nov 2026 15:33:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BB775FDAD;
	Tue, 17 Nov 2026 15:33:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1352611BC0039;
	Tue, 17 Nov 2026 16:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794929630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ONkwR8RJvjAow7onxJtGa9LsxCz5oDZ9vzWweJzmNHs=;
	b=Oy8qLtKPCvC71ub5Yj5zcGazS729StMFWBDRczYUonxTQmWBuoo++3Xzbe3GKl4aVM4rKi
	I5HDHsy8dMxVsXYdZjqe3K64FLJlQ/SYPzTe4nGyZMjf23Wlsq5WbTxu+9M5x73rWPoJ/L
	Dei9EbPwuTniT2oQ/EpFmy5IdvClo3deZqs1xpbeSnYKlBbFMveHOWRvpzV8w0o+Er5lXn
	n+8x2OmvPo14NAUAWt5ysSFymABJ8DCP1m7lRRqkXnbUJkxQCvEWN/xZFMZ4lJPL6iPC4U
	uqTLoorcBPwKktrzmEDrWrGm8IAnh3eq4XSYYNKuL2i2Iy6Vzzob5rpR5zMmjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Daisuke Mizobuchi <mizo@atmark-techno.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] mtd: spinand: winbond: Generalize the KV OOB layout
In-Reply-To: <auT9takcaT1TWj0W@atmark-techno.com> (Dominique Martinet's
	message of "Sat, 31 Oct 2026 05:27:33 +0900")
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
	<20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
	<auT9takcaT1TWj0W@atmark-techno.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 16:33:46 +0100
Message-ID: <875wxvlbfp.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_073358_069217_A4E707C7 
X-CRM114-Status: UNSURE (   7.93  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cj4+ICsJdW5zaWduZWQgaW50IG9mZnNldCA9IG10ZC0+b29ic2l6ZSAvIDI7Cj4+ICsJdW5zaWdu
ZWQgaW50IG51bV9zZWN0aW9ucyA9IG10ZC0+d3JpdGVzaXplIC8gNTEyOwo+Cj4gQWgsIEkgY291
bGRuJ3QgdXNlIG9vYnNpemUgZm9yIG51bV9zZWN0aW9ucyBiZWNhdXNlIG9mIFcyNU4wMUtWIGJ1
dAo+IHVzaW5nIHdyaXRlc2l6ZSBtYWtlcyBzZW5zZSBhcyB3ZWxsIGFzIHRoZXJlJ3Mgb25lIHNl
Y3Rpb24gcGVyIDUxMiBieXRlcwo+IGNodW5rLCBhbmQgdGhpcyB3b3JrcyBmb3IgYWxsIGRldmlj
ZXMuCj4KPiBHb29kIGNsZWFudXAhCj4KPiBSZXZpZXdlZC1ieTogRG9taW5pcXVlIE1hcnRpbmV0
IDxkb21pbmlxdWUubWFydGluZXRAYXRtYXJrLXRlY2huby5jb20+CgpUaGFua3MgYSBsb3QgZm9y
IHRoZSBmZWVkYmFjayEKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
