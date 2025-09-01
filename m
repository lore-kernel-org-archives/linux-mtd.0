Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944EACA100A
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNaDnT2lzID+2hebymsn9gDCYHyH1gIduW5+DIxmB6s=; b=m700QJRXVMy1fI
	z1gG9+cEA9UcjiPJux46zb2nBeqIb2Bw0rUHTyDU8lFf89APfgtJprJ69wW/l8+iSJPQm39ixlt1o
	ozKlnYFV/Qhkrhc3uuzIXK0Iryx1GQq5c8e8p+mD62xMdjNlxySITepwt8xSRAgJJ/AGMFyiuzMLo
	Yk7W3K0Si8xEq/n4OO1TzI2QcBTGskANtuNijoMV6oobMSlkMPyfyxbOs5L008AbZRficZYNrzDze
	n14evZGVjpmj8C47baH/jfrhO5PVFlIOm0pKuDQyrKDIOfyC1jC9mCEymc6nr36kcTwci1e6OlIq/
	3nsgMUO0a7kzD7eAy4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6AY-0000000CzIW-2zi7;
	Mon, 01 Sep 2025 15:10:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3e0-0000000CS3i-1BNF
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:28:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27BC41A0D65;
	Mon,  1 Sep 2025 12:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0066C60699;
	Mon,  1 Sep 2025 12:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89A1C1C22D920;
	Mon,  1 Sep 2025 14:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U+SK2AVsSCug5ZsR90vfSD8eIzRNACmLyPgSVFEpsHQ=;
	b=Iq7ocEMg6qMkfq/ptkMDQ6tN3xj9mQSYc2CoNH+QClpeqzZ6T8LdOWqcBPiJzV9AelFhCs
	pJ5hBTp2NKb1jP+WkQddpUyOkJYBwjBqwJV9RAWQEDUZX2Dzh2MgJUUs0v6atrl7I9TGtg
	SKUSQ4qOrxNSeqNnIVGiWFtvoNnAgRWWUeFq/oxrX9B23dCM3MioDGWPH3qdRabgSzFei8
	OZGawBuvhPO3cpawZfA1ZcSRO/9gkk3fcXp4XNBJ6syRDLhM2GlHaoKdMWNz63+n/DCrrY
	hCNjWNB0KV05rOfYSc2XJOk9a5CuastfO6ejk0LXhS8ZoAQxm+McHj9ALlNtTw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, 
 Tianling Shen <cnsztl@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20250824170013.3328777-1-cnsztl@gmail.com>
References: <20250824170013.3328777-1-cnsztl@gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for FudanMicro FM25S01A
Message-Id: <175672969741.48694.14164729625728644164.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:28:17 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052820_471659_E4162F7A 
X-CRM114-Status: UNSURE (   5.61  )
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

T24gTW9uLCAyNSBBdWcgMjAyNSAwMTowMDoxMyArMDgwMCwgVGlhbmxpbmcgU2hlbiB3cm90ZToK
PiBBZGQgc3VwcG9ydCBmb3IgRnVkYW5NaWNybyBGTTI1UzAxQSBTUEkgTkFORC4KPiBEYXRhc2hl
ZXQ6IGh0dHA6Ly9lbmcuZm1zaC5jb20vbnZtL0ZNMjVTMDFBX2RzX2VuZy5wZGYKPiAKPiAKCkFw
cGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IGFkZCBzdXBw
b3J0IGZvciBGdWRhbk1pY3JvIEZNMjVTMDFBCiAgICAgIGNvbW1pdDogNWYyODRkYzE1Y2E4Njk1
ZDAzOTQ0MTQwNDVhYzY0NjE2YTNiMGU2OQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUg
b24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRl
ZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOo
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
