Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B331710775E7
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQkKbkZM2LWyFPkksHPGEqpLITcti6++IRzxfpRjaTE=; b=qyMt9CbHMkDVeQ
	2Z7De/nreG/jct67hNxr4feacLbdDlez1lS7q+ro53a2fpcTh9l9HwahvzZRdNOyPOLOVv/2FEKCA
	TMdB8+Z6tPSPwA/jd1DBn9/mfhZs1Km6apt7kl2b/89PRexhSWfZmj0hJl+tlg+bmTBnLd55qP3OZ
	u4p/XnZBmh369GxdVwcUYVbLOYy4u5XwHQxR+G2+DQg+eAMil47vuyKKX9lk7gtOMr1YfyCqAFLCV
	7ZtTUHaGSq/wrQbdzTaXAj6MJKVvNFJaFOfIx/RUq+iC8LhvZpMESmdIvAid0G/JwGT6+T/wHMkJv
	u65xfSygozd9zHRO9kgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uO7-000000091w4-3Zwm;
	Wed, 18 Mar 2026 17:08:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uO6-000000091uw-0T61
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 17:08:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CB272C5506A;
	Wed, 18 Mar 2026 17:09:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D3056004F;
	Wed, 18 Mar 2026 17:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D8C110450502;
	Wed, 18 Mar 2026 18:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773853731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6feiyHbCpZ3qfsMrs13AqEFm5/6rFI3LL/ii8kwxib0=;
	b=qlTBW54CM4ik+hMftNqR4sjML+3MRgCcUEBR5SZ52fzvhbuprh2w6FAHW9M81mUGNMDrFr
	2Vz1OmDX7EDCV4Cc0VMF7acfltmykwDSnVN2XOufu6dMZckG0giPNz9iGx89nX0LBBljLv
	7/+pl+veQWzMKlB/cX26R74v0HBm+irvuM8E0JbPAC9TjfFps/CQc602/RHbv82tnyUF+o
	NiX4b1cxeSJgNX2vrSQQBLOX2locmSMcGwqJ/Hc+gaTyjYo2O8lIIUxuseJcFAYDcwD0ui
	r6ucpHeXDJRo5g3FSZPeTmy/3e6JqLg02D3EHYzBr1qgvlxjUA5AlJjrKj39bw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, stable@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
In-Reply-To: <20260317101842.319656-1-miquel.raynal@bootlin.com>
References: <20260317101842.319656-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix RDCR controller capability core
 check
Message-Id: <177385372622.729501.7256585617777481305.b4-ty@bootlin.com>
Date: Wed, 18 Mar 2026 18:08:46 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_100854_292469_8D657A3E 
X-CRM114-Status: UNSURE (   9.88  )
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

T24gVHVlLCAxNyBNYXIgMjAyNiAxMToxODo0MiArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBDb21taXQgNTAwOGMzZWMzZjg5ICgibXRkOiBzcGktbm9yOiBjb3JlOiBDaGVjayByZWFkIENS
IHN1cHBvcnQiKSBhZGRzIGEKPiBjb250cm9sbGVyIGNoZWNrIHRvIG1ha2Ugc3VyZSB0aGUgY29y
ZSB3aWxsIG5vdCB1c2UgQ1IgcmVhZHMgb24KPiBjb250cm9sbGVycyBub3Qgc3VwcG9ydGluZyB0
aGVtLiBUaGUgYXBwcm9hY2ggaXMgdmFsaWQgYnV0IHRoZSBmaXggaXMKPiBpbmNvcnJlY3QuIFVu
Zm9ydHVuYXRlbHksIHRoZSBhdXRob3IgY291bGQgbm90IGNhdGNoIGl0LCBiZWNhdXNlIHRoZQo+
IGV4cGVjdGVkIGJlaGF2aW9yIHdhcyBtZXQuIFRoZSBwYXRjaCBpbmRlZWQgZHJvcHMgdGhlIFJE
Q1IgY2FwYWJpbGl0eSwKPiBidXQgaXQgZG9lcyBpdCBmb3IgYWxsIGNvbnRyb2xsZXJzIQo+IAo+
IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBzcGktbm9y
OiBGaXggUkRDUiBjb250cm9sbGVyIGNhcGFiaWxpdHkgY29yZSBjaGVjawogICAgICBjb21taXQ6
IGFjNTEyY2QzNTFmN2U0YWI0NTY5ZjZhNTJjMTE2ZjRhYjNhMjM5Y2MKClBhdGNoZShzKSBzaG91
bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUg
bmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5k
IHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
