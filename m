Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3DACD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYeOMm5JGSl/MsRzFnPg1hYtE7iDnHfhx8Jl9ppcH+U=; b=N1iQj0DI/RSsgc
	OAFHuxIrjjMMRDxLEj7/2/Nbl4bY8x8YapHzRx6VAFqQ2GWDF6qRHHEblS1fXopoE40g8sg/gPvQ+
	/94nyGGmXdD2P97I8ujhQThdtWGiuPnqQn7oIjg83LoSsyRfOGH/wdB0Q3lJHSlRoERgmaXDs2xck
	iQPlDwo4Sztis0FR5BH7+3BAlOfLexogQZQaLgImQjW9CFoOviJ3Qm21lqiFvj7FAa7hPQcjhVSwI
	Mvq7/bJ8BA/RMH8oOFKWIwgI7NisNmnYfoP8RYSGoEx/98+mBP2mkmLZHNd/e/RpZCGqX+vmVXBh8
	veZJvL320D4Y/yYGAZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSABf-00000003akq-3LZO;
	Wed, 27 May 2026 09:04:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSABc-00000003ajn-1d8E
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:04:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EDE70C2C643;
	Wed, 27 May 2026 09:04:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EF14601A1;
	Wed, 27 May 2026 09:04:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C1A710888BA2;
	Wed, 27 May 2026 11:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779872660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifOb7iMULcjYrNOS66E0s/3v80FG2yX3hNh+Zn/Vc0E=;
	b=XS5M6R+oP7ote1rDCOtgWcUq5Y44uCawE3UmGwd/tlUdk37Dt4EIxwUVfPPkpKtjngfv0y
	ZgRdD/UTF/Vtk9tnMOlWCit78b6FkbhCQvS+lrTlAP+Ee9MEoluyi6hdBVUkJfkVQ7x+0/
	cxjQu3BwPu+AfhFqeVsyWU4RxQan3so87xmPt0EFRPICjdCnB9CVQafRVWTmD2rQZcVQ6a
	9peYEcx922Gz1rhLR3B1ZG0PNUkK1N/5NHtZst0GbYyIGQBpouQO/ciDgSmVxM94l9z8Ph
	4fvcsRKBCwI5sptc5IUsD6FZ3ZqVl2RmxTk1Ks8SXwAAP7r8jLT9wWWM4BlNeg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <avkrasnov@rulkc.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rulkc@linuxtesting.org, oxffffaa@gmail.com, stable@vger.kernel.org
In-Reply-To: <20260505083030.322528-1-avkrasnov@rulkc.org>
References: <20260505083030.322528-1-avkrasnov@rulkc.org>
Subject: Re: [PATCH v2] mtd: rawnand: fix condition in
 'nand_select_target()'
Message-Id: <177987265687.3976930.563196216201085206.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:04:16 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_020424_589312_8F58B935 
X-CRM114-Status: UNSURE (   4.38  )
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

T24gVHVlLCAwNSBNYXkgMjAyNiAxMTozMDozMCArMDMwMCwgQXJzZW5peSBLcmFzbm92IHdyb3Rl
Ogo+ICdjcycgaGVyZSBtdXN0IGJlIGluIHJhbmdlIFswOm5hbmRkZXZfbnRhcmdldHNbLgo+IAo+
IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogZml4
IGNvbmRpdGlvbiBpbiAnbmFuZF9zZWxlY3RfdGFyZ2V0KCknCiAgICAgIGNvbW1pdDogODUwN2My
Y2M5ZTRmYTQwMjQwMTgxOWY0NGQxZThhNWVmNGQxMWQ4YgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
