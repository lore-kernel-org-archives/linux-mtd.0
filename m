Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D682F459FC
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWe8TaVo8nHFDJTQHR1Amp5E79yf/2/OvrkpdOeKGR8=; b=V04sNVbJEqW22n
	3Lb7U5/lNOTohduCT3chboHDJiWeq4gtJ8r04vPbDnwVE9sjQFHn61JR23SUMMRX04C3Yj9XEAGF/
	09LIAfy0mitUjTIP5TeV/h4aznKcp2XNznze4L4dY7zkdt1TLlwLqhhVocql73rqW0pdkOhe0oWre
	xnKZs66ADMgAiKUPi7nRI8U56XRb0z39DUJlyIQEIaTgKft1NVZUAdmdoIO6aRzc3LNIzot/7QQxz
	QRJeReGpGIO2rJyCh/db/RH/94zVt+jGXlyhUWnTSA+M7dWi1goQJke33rr58huXFoHz6GHsu4u0c
	GwM2l1O0IX+zb/AXUSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFPw-0000000CarB-3EZu;
	Fri, 10 Apr 2026 17:13:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFPt-0000000Caqd-0ioI
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 17:13:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA6A01A3266;
	Fri, 10 Apr 2026 17:13:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F8A8603F0;
	Fri, 10 Apr 2026 17:13:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20DD210450081;
	Fri, 10 Apr 2026 19:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775841186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zDFS+saDI2MMDl7CZmYSKhT4lg/rWw8LZU0LtITesdY=;
	b=jaEMXPB3DWGVVX8Z9H7A+/0V7PMKsbB6hzRc3BN/tAN6kSFLtvFnOxKIKTvbiNh46cGG3i
	EJMX+iSWMEN9pilimOtVMLlH415SWqFovxGUABamF6ts1nlkBd/ZgdxtnCiZKePDazQ6so
	euCekRzf/KdWsuEjr4bi7onhHOVthkehF6zNRexzhg70aPC3FdHD+rpiJ7r4IVPdcAOcBi
	uhq/ibBe+KHj97G+SD7WaFxibSQPY8e+kI9DWdQFtQPGpsut1UfOruu9hAsgv7dqylN0Su
	D7wwr1zByuxlPCe3ByVdaiRda766h4M0JeVqIfTgGSY9eosBCnw93YpRF/CwRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Steam Lin <stlin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
In-Reply-To: <20260325170450.1118324-1-miquel.raynal@bootlin.com>
References: <20260325170450.1118324-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spinand: winbond: Declare the QE bit on W25NxxJW
Message-Id: <177584118236.3008797.12886304380823058130.b4-ty@bootlin.com>
Date: Fri, 10 Apr 2026 19:13:02 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_101313_347163_CD6D0E41 
X-CRM114-Status: UNSURE (   6.03  )
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

T24gV2VkLCAyNSBNYXIgMjAyNiAxODowNDo1MCArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBGYWN0b3J5IGRlZmF1bHQgZm9yIHRoaXMgYml0IGlzICJzZXQiIChhdCBsZWFzdCBvbiB0aGUg
Y2hpcHMgSSBoYXZlKSwKPiBidXQgd2UgbXVzdCBtYWtlIHN1cmUgaXQgaXMgYWN0dWFsbHkgc2V0
IGJ5IExpbnV4IGV4cGxpY2l0bHksIGFzIHRoZQo+IGJpdCBpcyB3cml0YWJsZSBieSBhbiBlYXJs
aWVyIHN0YWdlLgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10
ZDogc3BpbmFuZDogd2luYm9uZDogRGVjbGFyZSB0aGUgUUUgYml0IG9uIFcyNU54eEpXCiAgICAg
IGNvbW1pdDogNzg2NmNlOTkyY2YwZDNjM2I1MGZlOGJmNGFjYjFkYmIxNzNhMjMwNAoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
