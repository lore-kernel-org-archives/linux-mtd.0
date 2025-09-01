Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB6CA0FFF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/jDXhy/CP3SdCRIb1YOz0B6l/r7E95qvQ7cG00TQFo=; b=XOCTgM+pgSSW35
	7PzTsvsZTK1a/Xlv9DGZtkABbcKW1rcl9r92mlpRmWJJ4jwTsOCsMkfds/pMiX3jlZvyRmfbMbQmZ
	8IDHnJ0MmDfFzjiSNoBppJ5FfxcE4zFK0Rj5dlZzyCyOJIZO8VmqWOrH6UxqKg9Gmfp+N3eOeykAc
	D7AKmEiFQTzSJ5UgjspntMEs6BSbZv27ShiH0LLRO2IBIGQb4ePp1u8jrGQvXEYoOFGMuxhLFPym+
	7RE1tPG4m7jJlf8B3A+pcgmUY0KxlcaVv3GG7EShXAEwJ9OHM81ElttnmZ1YWq+TIKdMGlpozjB4N
	bNpgjXRkmaDDFDbPOqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5rR-0000000Cuwa-09bJ;
	Mon, 01 Sep 2025 14:50:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3c2-0000000CQNG-2YCL
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 66CC24E40C66;
	Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E86060699;
	Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 533BE1C22D935;
	Mon,  1 Sep 2025 14:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SFNATNLdkkhOB5Wp70sKdHDjY39hB6qXWiRzlnD4aTQ=;
	b=bFhzcgjyq8a1r+ZKtRxUtY4dg0rai4FuY7GOmJcUuWg6W3UMSRflyHOmvhZi4nyF9sV40q
	CHwCU7T5UCZAtb3g0f1aeq+gNSERRaebP/u2QlruxkarvrEt+ZMX4ciwccjhsAlBt0XtIO
	valKroBjETgrkxYAuOqZeipXma1Fww4vmArdEwJUx+SPh/o3LPd9qHyaPFv/pzGlHxt/SI
	6ZDBWED6Sm73oezo8vcc7U+2gOFmLESBSpyFbafu4ab1f4sFoWV2i9JOlO+AP5DYBWFSym
	tuBQm967OYg0BNnmTRuX8wIIm+pcp67E7KpWUCaknN2n4C3Kiowqxa9WH8tF9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@foss.st.com>
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250812-fix-ecc-overwrite-v1-1-6585c55c88b0@foss.st.com>
References: <20250812-fix-ecc-overwrite-v1-1-6585c55c88b0@foss.st.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: fix ECC overwrite
Message-Id: <175672957522.48300.12612690456292698217.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:15 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052618_807362_9009F08F 
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

T24gVHVlLCAxMiBBdWcgMjAyNSAwOTozMDowOCArMDIwMCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdy
b3RlOgo+IEluIGNhc2UgT09CIHdyaXRlIGlzIHJlcXVlc3RlZCBkdXJpbmcgYSBkYXRhIHdyaXRl
LCBFQ0MgaXMgY3VycmVudGx5Cj4gbG9zdC4gQXZvaWQgdGhpcyBpc3N1ZSBieSBvbmx5IHdyaXRp
bmcgaW4gdGhlIGZyZWUgc3BhcmUgYXJlYS4KPiBUaGlzIGlzc3VlIGhhcyBiZWVuIHNlZW4gd2l0
aCBhIFlBRkZTMiBmaWxlIHN5c3RlbS4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGZpeCBFQ0Mgb3ZlcndyaXRlCiAg
ICAgIGNvbW1pdDogODExYzBkYTQ1NDJkZjNjMDY1ZjZjYjg0M2NlZDY4NzgwZTI3YmI0NAoKUGF0
Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpw
YXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0
aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
