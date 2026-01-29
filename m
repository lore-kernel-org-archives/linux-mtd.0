Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883E3D73E86
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJ1bm+n6QAE2L4bydceIH5Tvzd+WAuzDsoyseQXrUIU=; b=bpb9EK6g9rfjdz
	EgwV4V53/6GIN0YgP2KASzqzs2ZKLFfL1RxrIxRAj3er2m8Z8NuWUqSM2o3OtTnHCX/z2+HxDTA7P
	dqJbCC9pKThOX40/+xb/32OjAE22Pq7P+TCvYTeYeE19Kojxk/a8UuDwLn3972R0arpwrU3LaCCTr
	IxEuSHQ8GRebEHkV5YJF3ojA4cBl2a6+m8jjA0eiWc+yHGq9OXH/9F+ijxg/oOOZmIC3x8jeogYrY
	V6gtoMyVu7g/+91dpFbhJRXClYwp+1yGDNxGqlg/q8hS8ffF3DoohWNKGv2ZQm0npeQ5jMu1fpYOO
	wVtV+z1EFQtlGFLrQ4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXRO-00000000Xw5-2CzV;
	Thu, 29 Jan 2026 19:12:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXRK-00000000Xv9-1NX6
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:12:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EC86A4E42325;
	Thu, 29 Jan 2026 19:12:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA36D60746;
	Thu, 29 Jan 2026 19:12:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FEF8119A880F;
	Thu, 29 Jan 2026 20:12:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769713943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3mpQKBFRFLzNacmfMrYHGjkHw2gm2/qzE8sNqQd2e1I=;
	b=JSAw79XFO5e74UeEi+y7bZirRgDGMcE6qXfzElHMR5ViIFQB1wfI9K0tPJHD2pe5LfeT4U
	SKWeHhCOBPVMDXbHf0BKiCJYon8vMBn5zHPFGgkNbOSamsHJIsIIPTWXmIjVaJSKHTAx7K
	oSPnO8fiE24deZyaVMGq//Jfx7FeUyqkr/H7d0GdtnyGvYLj/qw0gPCikq8XliMq/8G4oU
	ch0SgelZOU01hykwwugudT9AVMWlGvSKCl63kzyaYIwGy0xt62nzS/oPRt6MNNFXAsB2+J
	7eZob7XgZcEy9oGhAM6C8HKcrCJo5YdJMriZxN+Vsrbp3WRPJuQGP3zntWEiQA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhila YS <akhilayalmati@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
References: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: st,spear600-smi: convert to DT
 schema
Message-Id: <176971393997.256159.1399345504326383205.b4-ty@bootlin.com>
Date: Thu, 29 Jan 2026 20:12:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_111226_804230_DA2158B5 
X-CRM114-Status: UNSURE (   5.43  )
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

T24gVGh1LCAyMiBKYW4gMjAyNiAxNjoyMzowNCArMDAwMCwgQWtoaWxhIFlTIHdyb3RlOgo+IENv
bnZlcnQgU1RNaWNyb2VsZWN0cm9uaWNzIFNQRUFyNjAwIFNlcmlhbCBNZW1vcnkgSW50ZXJmYWNl
IChTTUkpCj4gQ29udHJvbGxlciBiaW5kaW5nIHRvIFlBTUwgZm9ybWF0Lgo+IAo+IAoKQXBwbGll
ZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gZHQtYmluZGluZ3M6IG10ZDogc3Qsc3BlYXI2
MDAtc21pOiBjb252ZXJ0IHRvIERUIHNjaGVtYQogICAgICBjb21taXQ6IDY4Y2Q4ZWY0ODQ1MjFh
MDE4MjY3MzU1MThmMTczYzRhZTM5MDBlZmYKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxl
IG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlk
ZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXD
qGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
