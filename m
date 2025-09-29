Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36E2CAC5B0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bqz7fQ5lKIqwVbtiRswvqtP002QhGEmlMiclMOZE0bc=; b=jsXO+1IMi9HHnU
	sKkfoDm83dBNgQA5Xho2sr1LVkRmW4XqrPipj2wOWN5f2ZkXmdximoLzhD5z0R5OvuyYKi07MrGva
	B1ytn7Mg0n0Sc3daKbFxp8xml+M81lKhA4/ckQBugSz4gBpENspSVpG8+rBGdeUy+bTRHrO7OKHbZ
	c9KWWNBeMDCeQB/mTC/XsHhpWjLSgnA3vgvWqp998lJJQFpFDORMeqEyjrCxOiUtTxv4DK5MvuJtq
	nm4l4M/WAriH7NyastGgcJzvNAcqD2tJTVV1gX1p1h+CausVzooAfgvL+ae5l9wy7eCuQX5MwUbF7
	L35vtYstOHDMRaVgwyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GHO-00000002sFV-2kPU;
	Mon, 29 Sep 2025 15:59:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GHL-00000002sCs-2cTq
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 15:59:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 330E74E40DC1
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2025 15:59:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 002E9606AE;
	Mon, 29 Sep 2025 15:59:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23CE1102F198F;
	Mon, 29 Sep 2025 17:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q8LxUw+cVLeQ5xywYnpNFanq/5LXypulW6pCsXQ2bqk=;
	b=jq60p4QSEe6b1BZJhlLFia+CaZ+sQHuYjT0oBPgRcNTwJ7Aot4LSO4L+EP0l2wRVZK0HSu
	lz1FS9xwaTOI+5rThI6+Is6h1aMsLMtzfhdDeLTJJzaWyKEujoeLPhYDaKztVo8MNtfVAR
	BjXpqdXQhNYgJ6S0bHsFtikBgbqi4IfbxnoN5GriGatTXPziGUiVeaZeI1popACEPF4r2Q
	MEsCWSx0NOtfHdZRBb/mAFPVSgtrYI7fs3SND6X8szNtzw3OEu8nJxMGoph/CYjH/iE2lH
	2plmtHJGwyU5CfQXH0yyxvlhmzGdpSJEowLK9gweygd/jRMcpsZi2V4hwKwH0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Maarten Zanders <maarten@zanders.be>
Cc: stable@vger.kernel.org, imx@lists.linux.dev, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250922153938.743640-2-maarten@zanders.be>
References: <20250922153938.743640-2-maarten@zanders.be>
Subject: Re: [PATCH] mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N
Message-Id: <175916154390.50974.9196112568745134014.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 17:59:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085907_797210_6D2F5EDF 
X-CRM114-Status: UNSURE (   6.66  )
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

T24gTW9uLCAyMiBTZXAgMjAyNSAxNzozOTozOCArMDIwMCwgTWFhcnRlbiBaYW5kZXJzIHdyb3Rl
Ogo+IENvbW1pdCBmMDRjZWQ2ZDU0NWUgKCJtdGQ6IG5hbmQ6IHJhdzogZ3BtaTogaW1wcm92ZSBw
b3dlciBtYW5hZ2VtZW50Cj4gaGFuZGxpbmciKSBtb3ZlZCBhbGwgY2xvY2sgaGFuZGxpbmcgaW50
byBQTSBjYWxsYmFja3MuIFdpdGggQ09ORklHX1BNCj4gZGlzYWJsZWQsIHRob3NlIGNhbGxiYWNr
cyBhcmUgbWlzc2luZywgbGVhdmluZyB0aGUgZHJpdmVyIHVudXNhYmxlLgo+IAo+IEFkZCBjbG9j
ayBpbml0L3RlYXJkb3duIGZvciAhQ09ORklHX1BNIGJ1aWxkcyB0byByZXN0b3JlIGJhc2ljIG9w
ZXJhdGlvbi4KPiBLZWVwaW5nIHRoZSBkcml2ZXIgd29ya2luZyB3aXRob3V0IHJlcXVpcmluZyBD
T05GSUdfUE0gaXMgcHJlZmVycmVkIG92ZXIKPiBhZGRpbmcgYSBLY29uZmlnIGRlcGVuZGVuY3ku
Cj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IG5h
bmQ6IHJhdzogZ3BtaTogZml4IGNsb2NrcyB3aGVuIENPTkZJR19QTT1OCiAgICAgIGNvbW1pdDog
MTAwMWNjMTE3MTI0OGViYjIxZDM3MWZiZTA4NmI1ZDNmMTFiNDEwYgoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
