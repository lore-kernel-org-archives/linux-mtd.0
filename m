Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204CBC43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otm9/6sCKxdlFPVdmdMfMo8oR2Fc+ROWuJ25DcrrDYI=; b=qCoH3g4s50Iup5
	QdwKLHJHzFX46BqHAAUQ3NCg2y0oVD/1yUS7LOIeQ0e2gaBgZWVlc3HeaQPa+VKStAibDeTFjcUpW
	qa1o5XlrH6FiWOveSQok/0xnWdKQfYX5y4xEV0Qt2+ihkOHxkakNfUL6wVtHMdDHDC5nA6bOt/30c
	UqJ/y8t3V1+/Af7tRUCBad39s8d62XqvGzapgBGO4ikAy3An/X2mnG6yOfCXaoXJwok3d3uqvZULX
	zujQy/S1vWU7eGPAkv8BCE+MEDKQkNJ/U4uYO7bLTu/0GVd2NMjuH/lPhqVw/FXcI+hb/f6Ffl6gi
	4nZ1lmnvZJRPRLesKr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckr-0000000Bbx4-365Y;
	Mon, 06 Jul 2026 06:24:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckn-0000000Bbr5-1jd5
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D6CB64E40CA4;
	Mon,  6 Jul 2026 06:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A4459601A2;
	Mon,  6 Jul 2026 06:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D767911BB98B6;
	Mon,  6 Jul 2026 08:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Oq5IY+f0PZd96xg7+KB/yGuleN1P4zmQ4qPvPNwL57w=;
	b=aljpZuCZmDVT+Sq5fmb3jnoC/djpA37MygeS4Q0OV/oaV84WvfTgTcONdlU7Npl0D4lLWe
	YK51e6Zh5CtYD22AyXlNJynQC4W7Xx4uy0sKOjdvvwUlTnom3felAktY6Doto+0xHNBWFT
	VJZ4u3BO4QEpyCnpCdsTr5dJZk/bIusxr+kjX0s/m8umk8QbR0RROGqd/emodYyOe5giZJ
	3ZvvBzl7u7cFoavhNzpHExJ/qOv2vfieY5dngoVdoweR1UAUKTDdvMXEyQCgJ1zxmwXhmy
	rifIamNrKNfIIFrKfjYBh/gWtoovtUTR8RzxAlOCWr5hL/jdwe5JLuNUnOIaQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew@lunn.ch>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260703074052.49260-1-pengpeng@iscas.ac.cn>
References: <20260703074052.49260-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: mchp23k256: use SPI match data for chip caps
Message-Id: <178331906575.868671.5495065528182166347.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:25 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232429_594655_9C6463E2 
X-CRM114-Status: UNSURE (   7.01  )
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

T24gRnJpLCAwMyBKdWwgMjAyNiAxNTo0MDo1MiArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IFRoZSBkcml2ZXIgc3RvcmVzIGNoaXAgY2FwYWNpdHkgaW5mb3JtYXRpb24gaW4gYm90aCB0aGUg
T0YgbWF0Y2ggdGFibGUKPiBhbmQgdGhlIFNQSSBpZCB0YWJsZS4gUHJvYmUgY3VycmVudGx5IHVz
ZXMgb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCksCj4gc28gYSBub24tT0YgU1BJIG1vZGFsaWFz
IG1hdGNoIGZhbGxzIGJhY2sgdG8gbWNocDIzazI1Nl9jYXBzIGV2ZW4gd2hlbgo+IHRoZSBTUEkg
aWQgdGFibGUgc2VsZWN0ZWQgYSBkaWZmZXJlbnQgcGFydC4KPiAKPiBVc2Ugc3BpX2dldF9kZXZp
Y2VfbWF0Y2hfZGF0YSgpIHNvIFNQSSBpZC10YWJsZSBkcml2ZXJfZGF0YSBpcyBjb25zdW1lZAo+
IHdoZW4gT0YgbWF0Y2ggZGF0YSBpcyBhYnNlbnQuIFRoaXMga2VlcHMgdGhlIGV4aXN0aW5nIGRl
ZmF1bHQgZmFsbGJhY2sKPiB3aGlsZSBhdm9pZGluZyB0aGUgd3JvbmcgTVREIGdlb21ldHJ5IGZv
ciBpZC10YWJsZS1vbmx5IG1hdGNoZXMuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVz
LCB0aGFua3MhCgpbMS8xXSBtdGQ6IG1jaHAyM2syNTY6IHVzZSBTUEkgbWF0Y2ggZGF0YSBmb3Ig
Y2hpcCBjYXBzCiAgICAgIGNvbW1pdDogZDMyMmU0MGY0ZWRmOTJiZjBjYTMyOWU1YWE0YWUxYzAz
MTZmZWIzOAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBh
bmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNv
bXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
