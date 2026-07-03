Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DB6C44500
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tuDk2SZ7AGcZGWMBJcf6zlGv6hz3JMileF2LyK0CTg=; b=QeI0qHN80/qPMQ
	Atoj7w2F5qsEEREOavcDkXVssr9R8UqQJTR7orwGhqsy87+HOh9KUFSqqJZYN82gqR1QFtN2zcsnb
	fgvf+mdf4i+3Y4T1AgplbzO1Qa//3pDEte+BEdmDxXGBAfebDUqT7yiNRA3fGlbWIxh9Oh2OdXSB1
	RH8sUuDg8691rAyS8APFoWz+Lzy8go3H+j1M+z+x0BlUEMY7r0M2USWTFDkBTN6eb+hiQM6i8iN84
	X7O1aoVL19LXAQL3fPtyB2S3WWUVhHJZKDvWD2UjcrLP70v/eyI3zwg+7RuBVU3xuD2z4iE1926Rj
	sV+p2B6vH7qTNPxqbpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGU-000000079g5-3Yor;
	Fri, 03 Jul 2026 13:49:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGQ-000000079c8-3mLC;
	Fri, 03 Jul 2026 13:49:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D516A1A0E1C;
	Fri,  3 Jul 2026 13:49:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1AB560300;
	Fri,  3 Jul 2026 13:49:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE763104C9464;
	Fri,  3 Jul 2026 15:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783086540; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=esFP34U5TYPLKe5S80BzE1rdYYJEPOvrVqywVP6uVMo=;
	b=0VsvUm0QepK4wxG9+feba0HqKQnh3G3RLlAhnvrHYPc6D9a6obqbt0JS9bYig86jajsk36
	0SJ1PK49NRjoy7ZjpcpReTwRVqhA2OlWOacIi3V36AGVtVDneQonsr9E2cfcGSbdSanR86
	E5v1GdD1H3i4J6nG1PFAI4BBGhpNiINr26XJ5SZ9koHbtL3Ed3y0aLuOWE3GMYLqgy/7gK
	u0KmNUbA3SpbhyItcqs+ssN318f4sNC1mWQfn0fyUjFor322RxxPRISRM/CrNxf2UoPkP8
	qp6IO1Nxc+m4D+BE9RHmZbTRR9Y0hf5wu6lScJZjcO5BNL3FaO0OjbHFtBtilQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630012332.1471829-1-rosenp@gmail.com>
References: <20260630012332.1471829-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: use struct_size
Message-Id: <178308653758.836059.3322930880325591440.b4-ty@bootlin.com>
Date: Fri, 03 Jul 2026 15:48:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064907_090018_F1423ECF 
X-CRM114-Status: UNSURE (   5.18  )
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

T24gTW9uLCAyOSBKdW4gMjAyNiAxODoyMzozMiAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
VGhlIGNvbW1lbnQgYWJvdmUgbWFrZXMgaXQgY2xlYXIgdGhhdCB0aGlzIGlzIGEgc2luZ2xlIGVs
ZW1lbnQgZm9yCj4gbGVnYWN5IGhhbmRsaW5nLiBDbGFyaWZ5IHRoYXQgd2l0aCBzdHJ1Y3Rfc2l6
ZSBhbmQgYXZvaWQgbWFudWFsIHBvaW50ZXIKPiBtYXRoLgo+IAo+IAoKQXBwbGllZCB0byBuYW5k
L25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogYXRtZWw6IHVzZSBzdHJ1Y3Rfc2l6
ZQogICAgICBjb21taXQ6IDU5MWI1YWMxNzMwMWFjZmJjODIwNGRmYTM3NzM1M2YyYjIwZWZjNWIK
ClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwg
YmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMg
YnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
