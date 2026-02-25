Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD79FD3770
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6YSSxQx3KOGGu9hqVWTDy0e/1XdZ2Nt8KVm8wVqsgNE=; b=PMLBG2Y+3ehgWA
	s5swt4COHB0YAXaYn6Woh6XXJ4b7e6lfTKVh9z773fLWpALIZHosHFI2CfQC5/t11BaZEGLYNNeKw
	ve5pEscuwQkj8Kjk5EjUx7Gzo5V6hs8infyiY+ncTv3SjgszhwdV5QB8pU5w6tn7F4lOFF7CDYXnA
	xxnXwx6rf5uBSd40qxqTc2s7sfK/PI5qP/f0KSHP9UICVf5Jvk0o7sJOtfnAQ3+WtC6D2QnEynIJ8
	QnK3JCpfTydxAwdcKH3IrVo1yaOAlPbfULDO4q/zpCdvce+Nx6wpufrTVIkqW8DLkMFrI7nsaV/BK
	aL64DBDgjTQQC80Z7k8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHh1-00000004Vg2-2dG6;
	Wed, 25 Feb 2026 16:24:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHgy-00000004Ven-1F9s
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:24:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 07F4CC143FD;
	Wed, 25 Feb 2026 16:25:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF7995FDE6;
	Wed, 25 Feb 2026 16:24:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3F66103692E7;
	Wed, 25 Feb 2026 17:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772036689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nmi+wI2zS4OBlvKBnKMWQ6PiY7pIPLYZ5c4//l5BMWM=;
	b=jaqIBn8nFy5Oj0lMBwmAsnfpt+alt2uMFq8FQt6Yg5rjMN/xQORdftyfG44U+deFoEQ4jv
	5wp3g8Ef1R2GfRRtPLIJCRytchlE3xuJM/PT/eT8ZHCJ1cR1IA92JQwFXPbBj/Uc57BnGR
	G2AYKnNWciKSdHKDuqdN9zn4cgTawEC5llAVqO2DMFlgX2tns/A2HgNeQW/eKl57pVpi9I
	KrbJkDUsFwOv3hOgYv7ykJ5p97919Vpk6q4s2pvA00GhZB9QFDT4Aw37Et/j+Y66q7gNIw
	nqo2mq3b3ZFgc8M6L9LxHaREN/60DXVibV/wjdB/nYsH5lp7G7XB0XRJ9R8BpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] Fix spear600-smi YAML conversion
Date: Wed, 25 Feb 2026 17:24:42 +0100
Message-Id: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3M0QqDMAxA0V+RPC+QFlasvzL2UDVuAW1LAkMR/
 33FxwOXe4KxChsM3QnKPzEpucE9Opi+KX8YZW4GTz6Q90+srFZwkR2tctJAhLYJHmlbsScXXc8
 phjFCO1TlFt731/u6/smgcQ1tAAAA
X-Change-ID: 20260225-perso-fix-spear600-smi-yaml-801918ea96b9
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhila YS <akhilayalmati@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_082452_473981_DDAAD304 
X-CRM114-Status: UNSURE (   4.50  )
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

UmVjZW50IGNvbnZlcnNpb24gZnJvbSB0eHQgdG8geWFtbCBvZiB0aGUgU3BlYXI2MDAgU01JIGJp
bmRpbmcgYnkgQWtoaWxhCmxlYWQgdG8gd2FybmluZ3MuIFRoZXNlIGFyZSBteSAyY3RzIGluIGdl
dHRpbmcgdGhlIHlhbWwgY29udmVyc2lvbiBkb25lCjotKQoKQ2hlZXJzLApNaXF1w6hsCgpTaWdu
ZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0K
TWlxdWVsIFJheW5hbCAoMyk6CiAgICAgIGR0LWJpbmRpbmdzOiBtdGQ6IHN0LHNwZWFyNjAwLXNt
aTogRml4IGRlc2NyaXB0aW9uCiAgICAgIGR0LWJpbmRpbmdzOiBtdGQ6IHN0LHNwZWFyNjAwLXNt
aTogI2FkZHJlc3Mvc2l6ZS1jZWxscyBpcyBtYW5kYXRvcnkKICAgICAgZHQtYmluZGluZ3M6IG10
ZDogc3Qsc3BlYXI2MDAtc21pOiBGaXggZXhhbXBsZQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9zdCxzcGVhcjYwMC1zbWkueWFtbCAgIHwgMjYgKysrKysrKysrKysrKysrKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCi0tLQpiYXNl
LWNvbW1pdDogN2RmZjk5YjM1NDYwMWRkMDE4MjllMTUxMTcxMTg0NmUwNDM0MGE2OQpjaGFuZ2Ut
aWQ6IDIwMjYwMjI1LXBlcnNvLWZpeC1zcGVhcjYwMC1zbWkteWFtbC04MDE5MThlYTk2YjkKCkJl
c3QgcmVnYXJkcywKLS0gCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
