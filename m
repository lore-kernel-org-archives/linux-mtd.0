Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D205CA0FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+EQTLW4KTKyaHcZ6C3Wu8kOqPt0m7EamAPe8ckp8rE=; b=T9/syDyjTEVx+d
	EyNuFiYeH17Hvv6eRa2EEop1O2l3N8p7zaNeojfLNe5fc4KPZLB2OUJ499x810bzsRpALyXN/miBA
	Mg7Qc7BFysadQeWEJQ3m4wNGWIwOptScwT0Ug+U7BmsCdWLd7kXrSt5pCRbiC5gNmi0lizepRqZCG
	El+h9yr9aw9FkZ0A41PXNS7YI08c2X1vvtJlnVDs+A5nA+gmSkG0F3CoG7VERE44XVKSKRIpU5guP
	R2ligz2B1OqKwVlEC94wfhxGePSuxPNQ6EPVKAU2Q/opwqgdy9FzDQyoW8w/juCTT7Q3Nb4ODtJ5Z
	z9Y/SW+gSSc1PezS0PuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5rQ-0000000CuwJ-2JHQ;
	Mon, 01 Sep 2025 14:50:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3c2-0000000CQLP-0of9
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 073834E40C65;
	Mon,  1 Sep 2025 12:26:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD7A060699;
	Mon,  1 Sep 2025 12:26:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63DFD1C22D4DC;
	Mon,  1 Sep 2025 14:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jfBjyfo26o556nYIaOxd76pUYR9GB6/0sA+87NT+4x8=;
	b=rt1Rbw3zcTPUue49SXLIRf8FXerPpqAtXDyHoC58kowt+IPGCOJ+OZT6GwaYpKB3VcBESO
	O7+GzFBF5/XLeDvNylSecqCeOT2ErTYO1HIDMfZ80tL6fVmgg8PGhcJfFpRY/lRZjO9Fa8
	DpPv1GehPdVDoKFYXNMOzrofvqyv3wAbAQirDvZJSfh7GJBYCqsF/7cH7AGO8eCOETDQn3
	YIK0YzbPnLqb5cMv328PCfDFiQXQXpIHX6pnkSqekDVkaQLa/Zlqi2YesVNDWuXNC24tiN
	xd4ELJxe3crX/UqryFGTPxfN2WeZ6tLSaEUs8wrhWR7qXrILNpykFWmVQ5SaTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250812-fix-dma-overlapping-v1-1-c3bf81d79de7@foss.st.com>
References: <20250812-fix-dma-overlapping-v1-1-c3bf81d79de7@foss.st.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: avoid overlapping mappings
 on ECC buffer
Message-Id: <175672956825.48300.17672070424508952641.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052618_368617_9DF07E75 
X-CRM114-Status: UNSURE (   5.92  )
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

T24gVHVlLCAxMiBBdWcgMjAyNSAwOToyNjo1OCArMDIwMCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdy
b3RlOgo+IEF2b2lkIGJlbG93IG92ZXJsYXBwaW5nIG1hcHBpbmdzIGJ5IHVzaW5nIGEgY29udGln
dW91cwo+IG5vbi1jYWNoZWFibGUgYnVmZmVyLgo+IAo+IFsgICAgNC4wNzc3MDhdIERNQS1BUEk6
IHN0bTMyX2ZtYzJfbmZjIDQ4ODEwMDAwLm5hbmQtY29udHJvbGxlcjogY2FjaGVsaW5lIHRyYWNr
aW5nIEVFWElTVCwKPiBvdmVybGFwcGluZyBtYXBwaW5ncyBhcmVuJ3Qgc3VwcG9ydGVkCj4gWyAg
ICA0LjA4OTEwM10gV0FSTklORzogQ1BVOiAxIFBJRDogNDQgYXQga2VybmVsL2RtYS9kZWJ1Zy5j
OjU2OCBhZGRfZG1hX2VudHJ5KzB4MjNjLzB4MzAwCj4gWyAgICA0LjA5NzA3MV0gTW9kdWxlcyBs
aW5rZWQgaW46Cj4gWyAgICA0LjEwMDEwMV0gQ1BVOiAxIFBJRDogNDQgQ29tbToga3dvcmtlci91
NDoyIE5vdCB0YWludGVkIDYuMS44MiAjMQo+IFsgICAgNC4xMDYzNDZdIEhhcmR3YXJlIG5hbWU6
IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMjU3RiBWQUxJRDEgU05PUiAvIE1CMTcwNCAoTFBE
RFI0IFBvd2VyIGRpc2NyZXRlKSArIE1CMTcwMyArIE1CMTcwOCAoU05PUiBNQjE3MzApIChEVCkK
PiBbICAgIDQuMTE4ODI0XSBXb3JrcXVldWU6IGV2ZW50c191bmJvdW5kIGRlZmVycmVkX3Byb2Jl
X3dvcmtfZnVuYwo+IFsgICAgNC4xMjQ2NzRdIHBzdGF0ZTogNjAwMDAwMDUgKG5aQ3YgZGFpZiAt
UEFOIC1VQU8gLVRDTyAtRElUIC1TU0JTIEJUWVBFPS0tKQo+IFsgICAgNC4xMzE2MjRdIHBjIDog
YWRkX2RtYV9lbnRyeSsweDIzYy8weDMwMAo+IFsgICAgNC4xMzU2NThdIGxyIDogYWRkX2RtYV9l
bnRyeSsweDIzYy8weDMwMAo+IFsgICAgNC4xMzk3OTJdIHNwIDogZmZmZjgwMDAwOWRiYjQ5MAo+
IFsgICAgNC4xNDMwMTZdIHgyOTogZmZmZjgwMDAwOWRiYjRhMCB4Mjg6IDAwMDAwMDAwMDQwMDgw
MjIgeDI3OiBmZmZmODAwMDA5OGE2MDAwCj4gWyAgICA0LjE1MDE3NF0geDI2OiAwMDAwMDAwMDAw
MDAwMDAwIHgyNTogZmZmZjgwMDAwOTllNzAwMCB4MjQ6IGZmZmY4MDAwMDk5ZTdkZTgKPiBbICAg
IDQuMTU3MjMxXSB4MjM6IDAwMDAwMDAwZmZmZmZmZmYgeDIyOiAwMDAwMDAwMDAwMDAwMDAwIHgy
MTogZmZmZjgwMDAwOThhNmEyMAo+IFsgICAgNC4xNjQzODhdIHgyMDogZmZmZjAwMDA4MDk2NDE4
MCB4MTk6IGZmZmY4MDAwMDk4MTliYTAgeDE4OiAwMDAwMDAwMDAwMDAwMDA2Cj4gWyAgICA0LjE3
MTU0NV0geDE3OiA2MzYxNzI3NDIwNjU2ZTY5IHgxNjogNmM2NTY4NjM2MTYzMjAzYSB4MTU6IDcy
NjU2YzZjNmY3Mjc0NmUKPiBbICAgIDQuMTc4NjAyXSB4MTQ6IDZmNjMyZDY0NmU2MTZlMmUgeDEz
OiBmZmZmODAwMDA5ODMyZjU4IHgxMjogMDAwMDAwMDAwMDAwMDRlYwo+IFsgICAgNC4xODU3NTld
IHgxMTogMDAwMDAwMDAwMDAwMDFhNCB4MTA6IGZmZmY4MDAwMDk4OGFmNTggeDkgOiBmZmZmODAw
MDA5ODMyZjU4Cj4gWyAgICA0LjE5MjkxNl0geDggOiAwMDAwMDAwMGZmZmZlZmZmIHg3IDogZmZm
ZjgwMDAwOTg4YWY1OCB4NiA6IDgwMDAwMDAwZmZmZmYwMDAKPiBbICAgIDQuMTk5OTcyXSB4NSA6
IDAwMDAwMDAwMDAwMGJmZjQgeDQgOiAwMDAwMDAwMDAwMDAwMDAwIHgzIDogMDAwMDAwMDAwMDAw
MDAwMAo+IFsgICAgNC4yMDcxMjhdIHgyIDogMDAwMDAwMDAwMDAwMDAwMCB4MSA6IDAwMDAwMDAw
MDAwMDAwMDAgeDAgOiBmZmZmMDAwMDgxMmQyYzQwCj4gWyAgICA0LjIxNDE4NV0gQ2FsbCB0cmFj
ZToKPiBbICAgIDQuMjE2NjA1XSAgYWRkX2RtYV9lbnRyeSsweDIzYy8weDMwMAo+IFsgICAgNC4y
MjAzMzhdICBkZWJ1Z19kbWFfbWFwX3NnKzB4MTk4LzB4MzUwCj4gWyAgICA0LjIyNDM3M10gIF9f
ZG1hX21hcF9zZ19hdHRycysweGEwLzB4MTEwCj4gWyAgICA0LjIyODQxMV0gIGRtYV9tYXBfc2df
YXR0cnMrMHgxMC8weDJjCj4gWyAgICA0LjIzMjI0N10gIHN0bTMyX2ZtYzJfbmZjX3hmZXIuaXNy
YS4wKzB4MWM4LzB4M2ZjCj4gWyAgICA0LjIzNzA4OF0gIHN0bTMyX2ZtYzJfbmZjX3NlcV9yZWFk
X3BhZ2UrMHhjOC8weDE3NAo+IFsgICAgNC4yNDIxMjddICBuYW5kX3JlYWRfb29iKzB4MWQ0LzB4
OGUwCj4gWyAgICA0LjI0NTg2MV0gIG10ZF9yZWFkX29vYl9zdGQrMHg1OC8weDg0Cj4gWyAgICA0
LjI0OTU5Nl0gIG10ZF9yZWFkX29vYisweDkwLzB4MTUwCj4gWyAgICA0LjI1MzIzMV0gIG10ZF9y
ZWFkKzB4NjgvMHhhYwo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoK
WzEvMV0gbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBhdm9pZCBvdmVybGFwcGluZyBtYXBwaW5n
cyBvbiBFQ0MgYnVmZmVyCiAgICAgIGNvbW1pdDogNTEzYzQwZTU5ZDVhNDE0YWI3NjNhOWM4NDc5
NzUzNGI1ZThjMjA4ZAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4
LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJv
Ym90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
