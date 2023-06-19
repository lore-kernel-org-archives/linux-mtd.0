Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748AEEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaWEs1NVurXInCW7u6wAbedogg6OAJ/tIfL7uhyipqE=; b=AlDPfNrJDBuYJv
	BoZ9/ywl/RjbZ7wGG+tDuAXKbDdMt6METu5eOTKXDal0kUdlG+TsxLAu9DzoYwbzeXLpZd7iFOEj/
	8ytamdxsATSKILif1HsTIZZivkm1SmxhHfw9IEFQITRcEJhQv3PGrUrgVKvSONH1Bp6oSCpOTxA8w
	CBUSIkRi3//JuvTl7mjWe7zrVSXtLlqyWKE0LUdL+VDjbHOWbmsv3Oyq7MVBJKnRRMoRXIJZ3Ed7c
	oe8Sca+RkqlQZMEG9W2tKZGnbAMSQ18/ZOnS3dGKLG22UJ6OlJJaywvEa3lRzLZBLOM4Ds6KGNr45
	E5IK9cZTcYED96ofWf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB9Yn-007jOO-2l;
	Mon, 19 Jun 2023 07:44:25 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB9Yl-007jNW-1P
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 07:44:24 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687160659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=065Lc0W4U4D1G6yyHQ3WUJcRA+rXOYGLcjZ9oeW9aM8=;
	b=eAq+RLP78fiEJ582E/dmqGocriHj3+UQoOhSw8owtG7chaMaSCMFtE8T8JfNO778YJQdVh
	hmq8aGfrr40kajIDKl+KLZx5T57HIAUaevsov8XZLKlusQ44T4M3BYLUWBLM0wgAyyu8Ud
	PK+hBJpQ6xmcAZ8Rl+cCYfw/Ne4cGDW14UqHbUPDHmQDeX9wrn7dLltA28XklnDOyu0owj
	DDBCI5L7ANQQ6uwWW1Jxi6tVCgJlGhS8dRbUnsIDPMWWRDflOq8spqNv7iNVPD7TAGycTp
	TtzbdZwcbY2i0LYE/hgvxdU2F/FO0d6tp2aQsM9t8Ls6s7Ie/ra345an1R+Bjg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E5C92000D;
	Mon, 19 Jun 2023 07:44:18 +0000 (UTC)
Date: Mon, 19 Jun 2023 09:44:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: No SPI NOR PR for 6.5
Message-ID: <20230619094417.4a7b25bf@xps-13>
In-Reply-To: <cf3855e7-260e-52cf-7e76-8b02b707911f@linaro.org>
References: <cf3855e7-260e-52cf-7e76-8b02b707911f@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_004423_605294_0DA01A7A 
X-CRM114-Status: UNSURE (   6.89  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAxOSBKdW4g
MjAyMyAwODoyOToxMiArMDEwMDoKCj4gSGksCj4gCj4gV2UncmUgYXQgdjYuNC1yYzcgYW5kIEkg
ZG9uJ3QgaGF2ZSBhbnkgU1BJIE5PUiBwYXRjaGVzIGFwcGxpZWQuCj4gRG9uJ3Qgd2FpdCBmb3Ig
YSBQUiBmcm9tIG15IHNpZGUuCgpPaywgdGhhbmtzIGZvciB0aGUgaGVhZHMtdXAhCgpDaGVlcnMs
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
