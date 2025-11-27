Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AED7D111A8
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Nov 2025 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pp2Kplokf1wqM+0gXi8X3jeya9NyFxyeQ5/G0dJQgh0=; b=INdPO/lUb5fbaC
	hurb5YslK9VEK7j2LoEy3SeCKa33mAdqp8HXDlpVRV2Ft5pdElwSiXAPYeJrbc07c24Ru6Sgu1AYf
	95Tx8AsMNkRkuM2sts0YRecepXwF0ekxdr94VqJTFN9xY/1HUMWYt33dVSbhzmRdkRMIoSP2thlK8
	zoC8dFVjgWVUGuA5wm8yHI8QghrjobMlDT0hjLinPcYU+51CIn1nWnPZvmtvocydxD/3paJThW6BV
	WmZoHH/A/OLScSDE4ES2ricZonWCq2uDJXD1G9ex6VjOQrJnLvKh2QQCIO7Hnez28xoThaiXu2Pau
	iPZScAMruogxwAYGVI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOflI-0000000H0Sh-2XKC;
	Thu, 27 Nov 2025 17:26:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOflF-0000000H0SG-1arU
	for linux-mtd@lists.infradead.org;
	Thu, 27 Nov 2025 17:26:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 064331A1DCC;
	Thu, 27 Nov 2025 17:26:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1E2360722;
	Thu, 27 Nov 2025 17:26:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36BBF102F2846;
	Thu, 27 Nov 2025 18:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764264385; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9C+2X78p//KaYwwwytZWIAN7xKMb4NWbaQfuV5QOn5c=;
	b=eY9MlU5XcoX2jeDMzGEKpCvgZ2FgIvp3yDPBN7n9h7wWXU83yHGlf5zUYzpF1M5VyDJo8m
	rIfXORqqjxj5HcsYuUiqPs0/sLdOxJEIcRT6eb1eOo8H6+M1EZUml+NPtHMq6dP/5w+NB/
	J665pXQtImRguYoDpHv7O37+UQvjSn1zJ0nTvGAO2UZ0mgFSl8Mq4CbFOCHvBHZNeZb4MN
	udPqlvx4Uw0UC+4qLICqbP2SQL12tvWV5NuO4vWe6c5nWlm4qmERUiSweFKL/qXYBUU0TL
	sbt4gaNekgmpZ7ZlEqcaZISj1QDmu4r4byPO7/kC3xyhFF9hLZ8VbecDD2jHqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Mark Brown
 <broonie@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: add support for FudanMicro FM25S01BI3
In-Reply-To: <130e0f3f-93e4-47cf-82f0-93ba58a3a670@gmail.com> (Mikhail
	Zhilkin's message of "Sat, 22 Nov 2025 17:30:38 +0300")
References: <130e0f3f-93e4-47cf-82f0-93ba58a3a670@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 27 Nov 2025 18:26:22 +0100
Message-ID: <87v7ivs7y9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_092629_553197_45B8BEE8 
X-CRM114-Status: UNSURE (   6.75  )
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

SGVsbG8gTWlraGFpbCwKCk9uIDIyLzExLzIwMjUgYXQgMTc6MzA6MzggKzAzLCBNaWtoYWlsIFpo
aWxraW4gPGNzaGFycGVyMjAwNUBnbWFpbC5jb20+IHdyb3RlOgoKPiBBZGQgc3VwcG9ydCBmb3Ig
RnVkYW5NaWNybyBGTTI1UzAxQkkzIFNQSSBOQU5ELgo+Cj4gTGluazogaHR0cHM6Ly93d3cuZm1z
aC5jb20vbnZtL0ZNMjVTMDFCSTNfZHNfZW5nLnBkZgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlraGFp
bCBaaGlsa2luIDxjc2hhcnBlcjIwMDVAZ21haWwuY29tPgoKSXQgbm8gbG9uZ2VyIGFwcGxpZXMg
b24gbmFuZC9uZXh0LCBjYW4geW91IHBsZWFzZSByZWJhc2UgYW5kIHJlc2VuZD8KRWl0aGVyIHRv
bW9ycm93IG9yIG90aGVyd2lzZSBhdCAtcmMxLgoKVGhhbmtzIQpNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
