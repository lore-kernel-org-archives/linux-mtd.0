Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2255D116F1
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSrF//mu2UA5nTLZuEfb/XtKdq1Oy0Y884Tm6tlv7mE=; b=yM3hIxYwksVGx+
	nybSLvPXO7uXGpLh65MPSF651YgH8SVZnbV49mYX/KUC2APs5gtkAzd5SCbFY6q4br9hkN4ypfNIH
	x9X5jlyEl8jO3T//Am/jXFumKU63qZ6a6Mh7TamQfab9Y+q4lMyHI8mzLW9cPopjV5qIcnWDw7fdn
	vIJsrvu1djih0AT/UqcjtkFIQpKyXPogRU5FMn+sYv6f6GaIPmjimsp6f/8nh04dAeZ30qvnkvGjC
	sqOl7Hxk3H4BLyL2I417aAO0jkpOGrxD4DUjtEEe/9tYmz3deGJ6a/yAUgIrlH2zJKNoHDp7Qt24K
	5Gu/zx+iK7bRUmcNB5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQm-00000001XjL-34Bx;
	Sat, 29 Nov 2025 12:52:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQa-00000001Xdi-45jF
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 12:52:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 892941A1E30;
	Sat, 29 Nov 2025 12:51:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C35160706;
	Sat, 29 Nov 2025 12:51:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77E0E11910699;
	Sat, 29 Nov 2025 13:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DKUvt8meCcZQTtU5GQhNVZGr6FC6b/fIgVwKU/8j5eU=;
	b=ZDWg2/4KK6hI4yv8w4VVqqvsH3Klz6u5ARbaL1KYIpuzLRAS5NbU5at40ZN4TRHo2qyk1I
	ZTil1x2fksgIbVYf+y/JRCsfx/1Aqq/nct8Ttm+W/zW5LTvMpuonh5dOgCqZySaW5NfUEV
	9ieTsWEvUkE7LXQydNHNKOHuQI1vPti7BeTh137vrzjo3BEe2J5pNvC0h06C1RC9hvu/LE
	5GNGHp3c4lPFxNzQzacHcz+sAw5ypo5GnemvOg3EfoChiusflJtNw2hUWEP2vnkB4ODnN2
	d9njH9+2ARwrOaN+N68b9vY+sJJIZzlzK4iBs5kTggygUji50dy/XqoYtvIGKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, 
 Mikhail Zhilkin <csharper2005@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20251127195900.2562-1-csharper2005@gmail.com>
References: <20251127195900.2562-1-csharper2005@gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for FudanMicro FM25S01BI3
Message-Id: <176442070936.78958.2084437205099752697.b4-ty@bootlin.com>
Date: Sat, 29 Nov 2025 13:51:49 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_045153_159772_584E2DAF 
X-CRM114-Status: UNSURE (   6.14  )
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

T24gVGh1LCAyNyBOb3YgMjAyNSAyMjo1OTowMCArMDMwMCwgTWlraGFpbCBaaGlsa2luIHdyb3Rl
Ogo+IEFkZCBzdXBwb3J0IGZvciBGdWRhbk1pY3JvIEZNMjVTMDFCSTMgU1BJIE5BTkQuCj4gCj4g
TGluazogaHR0cHM6Ly93d3cuZm1zaC5jb20vbnZtL0ZNMjVTMDFCSTNfZHNfZW5nLnBkZgo+IAo+
IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogc3BpbmFuZDogYWRk
IHN1cHBvcnQgZm9yIEZ1ZGFuTWljcm8gRk0yNVMwMUJJMwogICAgICBjb21taXQ6IGY2ZGZmZTJh
OWVkMWJkY2VlMTg3OWUyNzI4MzEwZmIxZTA4NjAyY2YKClBhdGNoZShzKSBzaG91bGQgYmUgYXZh
aWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAo
cHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMs
Ck1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
