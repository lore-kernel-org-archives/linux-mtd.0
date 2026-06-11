Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8DECD98CC
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2026 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KYZOoULvfTc5xONKJBzrV6du33Olj1W+wLmXG8pSAA=; b=SNT24+GQM9Y8q2
	tqtdBH7IO8PgxF1/qAbKxLFLCIE2f0AltZr5sjhPEnBK6xxVB6hdNjawmyG5I7nrTpklHLsbr09v1
	tqziy7UrnIggDZAKI/Lpb94d+GR9oJMIyCj4U37RQfwWXDBWoOc9u2V5iaJ1UOiwcVlimUA717AZD
	tVnNEGG9XFj/v0Xtfn1msE5NY8mFzS30U/uso+8InLPSwa0ddqRsrg+I04m6m5X1OiPYbAWkzBrUj
	ECOAhoCUKYh+plSHv7tsrONhHkmYGmry+Rcn3IF2lEAVzRNgWChfB+UH4C0vrUDfSeWbkdzz72+xT
	KqMUQ+tyXMSiLEBZ1GRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZhL-00000008rj6-1X76;
	Thu, 11 Jun 2026 07:19:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZhG-00000008riZ-302x
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jun 2026 07:19:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 94A484E4180D;
	Thu, 11 Jun 2026 07:19:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 641035FF03;
	Thu, 11 Jun 2026 07:19:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D445106B9E35;
	Thu, 11 Jun 2026 09:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781162362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5hrNyNiEPCLNkKqqcb2nvELSD+42/ZNvPgIuPIWmZ74=;
	b=pZ82RWrGLv4CgihSiEgm/to0xR34WKRFM3myRWY/93u7KHlClcHzQS9toEPJUp3txzgSM1
	l/rChJKKqm/BwttlKemDcSgrDU6b7ZnV7bo1ySeG2aEKSjSvmm4As6FTWrVSyBpIKQozJw
	rNBknRO+dZ+kz6o+lul/LgARcPkF6vFbeRaUJmbVo3AmSMmofBEFoztKOQlDk+2KUhhGgm
	YAPxcvSgEPcL97wEEzN4PzKW9eUH6T+Ubg+S5Kaf60mdwxowazw7b2X55kwXF/xjYkRluU
	rsuFWnRUNumblncYYqi7GXILD4wO7VuhgUcJqtkl0PALIZqdgy9K8LN3+sS/Tw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: richard@nod.at,  vigneshr@ti.com,  cnsztl@gmail.com,
  csharper2005@gmail.com,  mikhail.kshevetskiy@iopsys.eu,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spinand: fmsh: add support for FM25G{01,02}B
In-Reply-To: <SEYPR01MB58821E380C5DD8F7B3FFDA23C9142@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
	(Ziyang Huang's message of "Sun, 31 May 2026 21:05:17 +0800")
References: <SEYPR01MB58821E380C5DD8F7B3FFDA23C9142@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 11 Jun 2026 09:19:20 +0200
Message-ID: <87fr2t8ryf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_001926_885331_7FD46B70 
X-CRM114-Status: UNSURE (   4.45  )
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

SGkgWml5YW5nLAoKT24gMzEvMDUvMjAyNiBhdCAyMTowNToxNyArMDgsIFppeWFuZyBIdWFuZyA8
aHp5aXRjQG91dGxvb2suY29tPiB3cm90ZToKCj4gQWRkIHN1cHBvcnQgZm9yIEZ1ZGFuTWljcm8g
Rk0yNVMwMUIgU1BJIE5BTkQgYW5kIEZ1ZGFuTWljcm8gRk0yNVMwMkIgU1BJCj4gTkFORC4KPgo+
IEZNMjVHMDFCIGRhdGFzaGVldDogaHR0cHM6Ly93d3cuZm1zaC5jb20vbnZtL0ZNMjVHMDFCX2Rz
X2VuZy5wZGYKPiBGTTI1RzAyQiBkYXRhc2hlZXQ6IGh0dHBzOi8vd3d3LmZtc2guY29tL252bS9G
TTI1RzAyQl9kc19lbmcucGRmCj4KPiBTaWduZWQtb2ZmLWJ5OiBaaXlhbmcgSHVhbmcgPGh6eWl0
Y0BvdXRsb29rLmNvbT4KClBsZWFzZSBydW4gY2hlY2twYXRjaCwgdGhlcmUgaXMgYXQgbGVhc3Qg
YSBkb3VibGUgbGluZSB0aGF0IGdldHMgaW5zZXJ0ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
