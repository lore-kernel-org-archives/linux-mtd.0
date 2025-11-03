Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D39ACCFA05
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Nov 2025 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqqeNkZGZwJAemIgVsA5Ja+jyoevIHV1wg5uEXJDi5A=; b=VnfE4B2NGkgDCL
	Jssh5quxvnveo6iXc16TTd9djwugxid4OagRfVG6iYYc/9IidFTDp5i7lPVRz+OCXmguHxGU61CeF
	egqfk+cPte3rY61hjzgeX5lEyjVkR4oPNz7y9RwyuWeTedZoXKUL+noZ9b5alIYgrPddfg08KhUCt
	dYqx5Xw7R4TRHmjwckB5m3OmDw8T9O4CNi6RTz8GpOT14MhR4Fh/G3Hkc3WWusrdtJFwcWXaI5w/Q
	i5w2HgS5pJrrR00ce8hmJmBDZP+6xVar/a22nN+qH71l8XUYDmrSJVVtwXp0RpstinO0waynQyc6q
	mHt4ZbD90rNmyaKJ6+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFry7-00000009e0M-01gJ;
	Mon, 03 Nov 2025 10:39:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFry3-00000009dzK-0jOk
	for linux-mtd@lists.infradead.org;
	Mon, 03 Nov 2025 10:39:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D39B51A183A
	for <linux-mtd@lists.infradead.org>; Mon,  3 Nov 2025 10:39:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A18AF60628;
	Mon,  3 Nov 2025 10:39:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F07B610B5000E;
	Mon,  3 Nov 2025 11:39:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762166353; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+YdwOQIVG/gdlY9V7pUGKmGPH02+CcIrYSL3JTyrz5s=;
	b=zzc8F1lWMP97FvKi59Tymh5cnN7wgqzwX663gDKTIoqR49yHV8LXa2/Is6AEZfKiGSkxy4
	KhwSx3hxeLjZQLhD/Qd0n5tKS9o0cU22zwaI9DoVR5csi+ivm/Pob4MyDCvu721HJ6R9dz
	GNfHLWa0LM9cgQUZjXaFIoz+fK7KTE4V0FBLdUhL1IT2XcJRvyvnP0JcdSBJMkU7K9zPxA
	ws7xgX/sClGkZttstvZ8MrUcdWf4uyvop1q5FpbJYk+f1B1oHORFzzA3UQGJynjiqYyiwa
	0PKcoo43hMZXD8KMwSP8SFPTsOiX7yDg0DhNtSHAqQgF+oZYiImUCsM3+bondQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tianling Shen <cnsztl@gmail.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20251103010148.3855648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251103010148.3855648-1-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH] mtd: spinand: fmsh: remove QE bit for FM25S01A flash
Message-Id: <176216634975.908445.2776312239779833518.b4-ty@bootlin.com>
Date: Mon, 03 Nov 2025 11:39:09 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_023919_347676_F24C242A 
X-CRM114-Status: UNSURE (   6.44  )
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

T24gTW9uLCAwMyBOb3YgMjAyNSAwNDowMTo0OCArMDMwMCwgTWlraGFpbCBLc2hldmV0c2tpeSB3
cm90ZToKPiBBY2NvcmRpbmcgdG8gZGF0YXNoZWV0IChodHRwOi8vZW5nLmZtc2guY29tL252bS9G
TTI1UzAxQV9kc19lbmcucGRmKQo+IHRoZXJlIGlzIG5vIFFFIChRdWFkIEVuYWJsZSkgYml0IGZv
ciBGTTI1UzAxQSBmbGFzaCwgc28gcmVtb3ZlIGl0Lgo+IAo+IAoKQXBwbGllZCB0byBtdGQvZml4
ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogc3BpbmFuZDogZm1zaDogcmVtb3ZlIFFFIGJpdCBmb3Ig
Rk0yNVMwMUEgZmxhc2gKICAgICAgY29tbWl0OiBhMWQzYmM2MDZiZjVjM2IzZWE4MTFjYzIwMTlk
ZjYyODVkNzViMDBmCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXgu
Z2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9i
b3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
