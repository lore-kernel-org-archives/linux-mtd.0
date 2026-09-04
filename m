Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81847C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOlw6FinJs1K8aL3Rn/To3ztUTbSddVRUo8s30RaH0Y=; b=b4+dOcN2Ar1qcI
	Hgb46J57dcpw6HFBb16sgiAmt45WxlYkBSBGf4rwP3tGbXM1D9HWvWotEW0akVsd2tIHgVy+BJrO/
	Bz0d9qTfSE5UjDtQvrQF7Qjx+Xmh3qMR0/+wRsJaAbtBKIBoLIw4sebG7TFrxnZDr6fg/cbIGzXs5
	iyfJVucWAG7xnrYGxjKprqkfVMVtNaNk7hXmOBrr3HVtHlTylxL05NmwxfxZS1/czpXeWjAGcRz1t
	CIwGjqHa9R441KIs9aFYgWYsIMuNmp8oqniyfFwKOo0zr5NBdGmdn/rDOffRjQseqoZMtku3y0B6J
	5HUsu9bRz0M3+r4mnCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xs5-00000002uBJ-0ug5;
	Fri, 04 Sep 2026 17:38:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xs1-00000002u7F-0z47
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A43604E4151C;
	Fri,  4 Sep 2026 17:38:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 798A66057F;
	Fri,  4 Sep 2026 17:38:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72B5B11C78158;
	Fri,  4 Sep 2026 19:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wl7EtZ/xRSHxa2NefH9pWoJDSQvxgnL59nCZrjBuwzo=;
	b=jQ/pqsFh0aMETdA3THOo1MKS517bOJqynboLSv7CVCFJuH89ScruP0oUROXJeB0rzNb5Bs
	RdbubpyeA3Wo0NxzFBqkWEuabKfrtyVAXiI8u2EXqy/nXOjKgilFq6dGDIBgkLjOpst4EI
	h1VjVIgwchEvksFrBgNjB47iKFClW4CIYp7oNNxPW11xSn7eWzBOvN7fNpWJH7EA2DIryi
	hE4rHcbNSEkou4FiBCkU9IXl7vhv1W3uwzcQW/oA5Gkn0JWoDekB/WWML1zd9WVYbDqDWu
	0jSiL2UYwUJob4VQG7Fb66LrHujQz3awXIR+QhGvjO/MpbV8HoiOF5OV/GbmSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, stable@vger.kernel.org
In-Reply-To: <20260831-mtd-nand-no-ecc-fixes-v1-0-c2ec46641b90@analog.com>
References: <20260831-mtd-nand-no-ecc-fixes-v1-0-c2ec46641b90@analog.com>
Subject: Re: [PATCH 0/2] mtd: spinand: fix nand-no-ecc-engine support
Message-Id: <178854350834.1467647.6353766361428985013.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:28 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103833_443159_D5CFDC8E 
X-CRM114-Status: UNSURE (   7.70  )
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

T24gTW9uLCAzMSBBdWcgMjAyNiAxNjowNzoxNiArMDEwMCwgTnVubyBTw6Egd3JvdGU6Cj4gU2V0
dGluZyAibmFuZC1uby1lY2MtZW5naW5lIiBpbiBEVCBjdXJyZW50bHkgb29wc2VzIGF0IHByb2Jl
OiBTUEktTkFORAo+IGRlcmVmZXJlbmNlcyBuYW5kLT5lY2MuZW5naW5lIHVuY29uZGl0aW9uYWxs
eSB0byB0ZXN0IGZvciBhIHBpcGVsaW5lZAo+IGVuZ2luZSwgYnV0IG5hbmRkZXZfZ2V0X2VjY19l
bmdpbmUoKSBsZWF2ZXMgdGhhdCBwb2ludGVyIE5VTEwgd2hlbiBubwo+IGVuZ2luZSBpcyByZXF1
ZXN0ZWQuIFBhdGNoIDEgYWRkcyBhIG5hbmRfZWNjX2lzX3BpcGVsaW5lZCgpIGhlbHBlciB0bwo+
IHRoZSBOQU5EIGNvcmUgdGhhdCBmb2xkcyBpbiB0aGUgTlVMTCBjaGVjaywgYW5kIHVzZXMgaXQg
YXQgdGhlIHRocmVlCj4gYWZmZWN0ZWQgc2l0ZXMuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRk
L2ZpeGVzLCB0aGFua3MhCgpbMS8yXSBtdGQ6IHNwaW5hbmQ6IGZpeCBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2Ugd2l0aCBubyBFQ0MgZW5naW5lCiAgICAgIGNvbW1pdDogZWE3NjVhZTFlZmIyNjY1
ZGE4OTgxZWJhODJiOGE3MmUzMTRhZjg1NApbMi8yXSBtdGQ6IHNwaW5hbmQ6IGZpeCB6ZXJvIG9v
YmF2YWlsIHdoZW4gbm8gRUNDIGVuZ2luZSBpcyB1c2VkCiAgICAgIGNvbW1pdDogYTAzOTk1OGYy
Yjk1ZTZjYzdmMGU0NGQ0MDI5OGQxN2YxYzA4NTFjMAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFp
bGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChw
cm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywK
TWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
