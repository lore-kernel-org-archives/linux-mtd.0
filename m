Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2F5FF8860
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRqjvjPBzVqQMZrYEjlr7pMq2Zk8SwTwswhcl8v5nRg=; b=SIkHnrBWfhCIs/
	JEM9nMd079KhGnGoW1xxGgwrrmpO2LVZCbEy9c0zjT7ZrBxxsAn4/8H0GTcivJRK/deBNxJoxzCIU
	0LKxhpR3zgDRfODeETsp9VfITM2jStHYdGt+SE+Z0jXyyenawcQaJo86ZMBnYWrxM82LCOWCBLs29
	bbjKGE6uqleuL1o19JS404tAapV/Y4r7jrh5lKm82zA6Sg6dgwm8Z2DqIn3F4cTzhUsUG6dyoWJwQ
	Z1ou3FOy+NQjH1fAMpw6iojfT83UM2ONBc0ugSqp4yf9n/oM4NaPSeZzxUoGU4NdRKhhUZoCdIo/c
	mHZLYpfQjSMbP+lmk0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLmV-0000000Gz55-38tF;
	Mon, 27 Apr 2026 13:13:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLmS-0000000Gz3o-30Nh
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 13:13:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 338411A3442;
	Mon, 27 Apr 2026 13:13:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 046D8600D1;
	Mon, 27 Apr 2026 13:13:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1092710728039;
	Mon, 27 Apr 2026 15:13:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777295622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MB66KX0QRnIz5fiNxh4VqVUYfeqchF39VYI7pXhDyG0=;
	b=shAlsPNimJxoCv0Ca9xHNsTeMtqbzWzQuFLKnYqXPdzZW3JpHCL1D0gvywh6cRAxjRkdgh
	5e2p0ED8kc+m2Ctd49lFJhcExL6DV2UNum0YvVnEUy7iPhuWnAOHLhm54TOvFVClQnhcmW
	Sg0qF1EdzDBgvLbDpKt9D5jS20PNVPDCb9SRd84s5iJ8MwS6QlC+KH8TffDF0SEzgehFVY
	Mmt84caiTFL1SOjaaFxy3rLwag5A6BIglZ1TfRxmWhDwfwrq+SvI4wvbqPOpZDbiAgbkmO
	A1deRoa31LUC66EX/kuUOJ+kzBXfFkxnn0aQ9e9gdItmLQ4PThCO7l1228BsHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Haoyu Lu <hechushiguitu666@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260410133739.1632-1-hechushiguitu666@gmail.com>
References: <20260410133739.1632-1-hechushiguitu666@gmail.com>
Subject: Re: [PATCH 1/2] mtd: mtdoops: replace simple_strtoul with
 kstrtouint
Message-Id: <177729562308.187174.10077059505707958353.b4-ty@bootlin.com>
Date: Mon, 27 Apr 2026 15:13:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_061344_893268_E08BFC58 
X-CRM114-Status: UNSURE (   5.55  )
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

T24gRnJpLCAxMCBBcHIgMjAyNiAyMTozNzozNCArMDgwMCwgSGFveXUgTHUgd3JvdGU6Cj4gUmVw
bGFjZSBkZXByZWNhdGVkIHNpbXBsZV9zdHJ0b3VsIHdpdGgga3N0cnRvdWludCBmb3IgYmV0dGVy
IGVycm9yCj4gaGFuZGxpbmcgYW5kIHR5cGUgc2FmZXR5LiBUaGUga3N0cnRvdWludCBmdW5jdGlv
biBwcm92aWRlcyBzdHJpY3Rlcgo+IHZhbGlkYXRpb24sIGF1dG9tYXRpY2FsbHkgcmVqZWN0aW5n
IGlucHV0cyBsaWtlICIxMjNhYmMiIHRoYXQKPiBzaW1wbGVfc3RydG91bCB3b3VsZCBwYXJ0aWFs
bHkgYWNjZXB0Lgo+IAo+IFVzaW5nIGtzdHJ0b3VpbnQgYXZvaWRzIHVuc2lnbmVkIGxvbmcgdG8g
aW50IGNvbnZlcnNpb24gYW5kIGlzIG1vcmUKPiBhcHByb3ByaWF0ZSBmb3IgTVREIGRldmljZSBp
bmRpY2VzIHdoaWNoIGFyZSBub24tbmVnYXRpdmUgaW50ZWdlcnMuCj4gCj4gWy4uLl0KCkFwcGxp
ZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzJdIG10ZDogbXRkb29wczogcmVwbGFjZSBzaW1w
bGVfc3RydG91bCB3aXRoIGtzdHJ0b3VpbnQKICAgICAgY29tbWl0OiA2YjA3Y2RmZjE3NmJjNWY4
ZmVmNDU5Yjg1YTdlMmVhMDllNjg1NDNmClsyLzJdIG10ZDogbXRkc3VwZXI6IHJlcGxhY2Ugc2lt
cGxlX3N0cnRvdWwgd2l0aCBrc3RydG91aW50CiAgICAgIGNvbW1pdDogYTkyYTlhNDkyODhkMWFh
ZDY3YmQxMjQ1N2M4MGExZTNmNDYzZDg1YgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUg
b24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRl
ZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOo
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
