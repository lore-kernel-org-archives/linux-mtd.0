Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5274C79F89
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QgNQr3t72XTPQk9bIl7sTz031zkwp0oSWOJZLndRSA=; b=x6dL2yS4jicHJ/
	MvtqGlHlobYF7nybJTVht2HGXVGvqES/X7iZuFGZ7fJdWNH+aapqh4wSLw6VGqcu1jZY2n6y55PcY
	MxlDtfKzchUJVMY/b38ZdIsSZL7zEnCaswnsMNFzcaluB6pI2OpVZ1xRPZS2ADNkhf92amFjUaHC/
	bvjhP25WHZxlcePXb6Z0SlYhqFniHWAfe73fw5kiXBfWaEESMdld1g/4VyL3mE93/zcW0qyi5ZtRg
	Ur7/h8fiWPdaUyYM8OYM7UF9CXfU66VbdSWNVjvmhRxpUQ/HH4XEPWR6S5Bg0qBM6muVck2vDqjd/
	pUotQ6AFGbofQUOxGGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLj-00000002yw3-1HjN;
	Fri, 04 Sep 2026 18:09:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLh-00000002yrL-0ZVd
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B15A4E41522;
	Fri,  4 Sep 2026 18:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 680026057F;
	Fri,  4 Sep 2026 18:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB29011C78158;
	Fri,  4 Sep 2026 20:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545350; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b9P1SmkyHsBAp9kZVcmo7gZHQc9uLFb8O7j7foVbYtY=;
	b=vyWjpJHSvje2L00RsNQBQje5WhAfEXmE5q/T2wTJw/bDi7YdRTD50/9YPPDfYCrVi7Tru9
	CEr6tHvxPCjhefuxGJfsWnzpo6zPQZXZc/QGQ3FVlxlEBBpMk+wETqsO3utpxCDzU7YArk
	bwr4ZZfniSMtLvAbUE+22VvfXguwewvbpyey6z8d7403uUhFOp8/N74LDbSKqkn7N5tMCk
	Fz62MGy+2RV9C0goBUhn44JGiagikOkvTeFolk2Ep2c/b5KH1k3NPWgEQK3d5qlZimXjO1
	0rToESXOMDmS25Z9CjMs81JUBV98wIJfUONkVZc5GKfXkWs8kmzEqBIzyUeF2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, han.xu@oss.nxp.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 imx@lists.linux.dev, Bill Lee <blee@issi.com>, Jeff Kim <jekim@issi.com>, 
 Han Xu <han.xu@nxp.com>
In-Reply-To: <20260827-spinand_issi-v2-1-88e04b19f4fa@nxp.com>
References: <20260827-spinand_issi-v2-1-88e04b19f4fa@nxp.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for ISSI SPI NAND flash
Message-Id: <178854534888.1533016.11676487212538727490.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110913_314056_CB580872 
X-CRM114-Status: UNSURE (   5.88  )
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

T24gVGh1LCAyNyBBdWcgMjAyNiAxNTozOToxMiAtMDUwMCwgaGFuLnh1QG9zcy5ueHAuY29tIHdy
b3RlOgo+IEFkZCBhIG5ldyBtYW51ZmFjdHVyZXIgZHJpdmVyIGZvciBJU1NJIFNQSSBOQU5EIGRl
dmljZXMgKG1hbnVmYWN0dXJlcgo+IElEIDB4OWQpLiBUaGUgZm9sbG93aW5nIGRldmljZXMgYXJl
IHN1cHBvcnRlZDoKPiAKPiAgIC0gSVMzNy9JUzM4U01XMDFHOEI6IDFHYiwgMS44Vgo+ICAgLSBJ
UzM3L0lTMzhTTVcwMkc4QjogMkdiLCAxLjhWCj4gICAtIElTMzcvSVMzOFNNTDA0RzhCOiA0R2Is
IDMuM1YsIDItZGllIHN0YWNrZWQKPiAgIC0gSVMzNy9JUzM4U01XMDRHOEI6IDRHYiwgMS44Viwg
Mi1kaWUgc3RhY2tlZAo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoK
WzEvMV0gbXRkOiBzcGluYW5kOiBhZGQgc3VwcG9ydCBmb3IgSVNTSSBTUEkgTkFORCBmbGFzaAog
ICAgICBjb21taXQ6IGY0ZjJhNTRjZmVmN2NkMjNhNTRiODQyN2EwMGMyZGFlODNmZmFmMmUKClBh
dGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUK
cGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkg
dGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
