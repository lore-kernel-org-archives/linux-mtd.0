Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89C5C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 10:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANodP1oO865yYX5kO1gar8n9I+/XG2IEVF/D8aDr4QM=; b=4J+b4w2dsnjw/J
	GJP+Z3roQ/basEfArmz/pKM2AyHbhZTjeYnZ4Uo1CO4Dt8BkrgYVqFXByVtMr7zgpT6cbOkHf2rFi
	SiSwX4MCIf34D3d7UuPWVpDyO4amHwDQCDouLEXctMKg9es1eGStCZ9njuL9PSojt/vbeUYud4I9O
	zQX7HJsaltaF457v9/ALcf7V6CClBouK+CopBcDXiEXji5A5pQfrAV752aaEErUeyzf2DI3cqwo/r
	gMFiw5/lSHYpF0xCrfyD50vcKuqtt6c4U/03plznjAanK4UE4VFEy1AiOdPMRFLrjkxRaN3gByx9z
	D5HfmtfBX1bOPB8vUGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nETVP-008lE6-La; Mon, 31 Jan 2022 10:01:51 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nETTn-008kXv-GE
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 10:00:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B50BA100019;
 Mon, 31 Jan 2022 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643623209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLypfuu9eD5lR+8vH9zCTJQ0pI816bRIJgTbUz2EOiE=;
 b=aWusl90GN7DxXseo2tb+6gdjHdQYkcud17Zi41tYtKt2Ia2A20U6tDxHhW9eZfkDUpg+2r
 0z/3B8LnDPUfAGuq0OTNQ2SZuBt5YUldajdg9KTzuzeNqdq/7PZsmLmzRScpLuv23lQi2+
 ex31USaA/RJhn9acO8Uos6bj+2/wRmoDSFbzyrRGyrW7r0C2dEqoJyzwZQPKP1ymZYATBl
 VjiWSY3xoOd/Qzk3TfZZbVqW3C6HAYvhMLPGNVdMQLAy6FxnBeV7pw0yhJ0nMynEdFjr0w
 XtgUF3SYArSW7u9WdMs/UdPaCgs/FhqfTYVELnqxsMiMSixFUJg8EFZMRxQB9g==
Date: Mon, 31 Jan 2022 11:00:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix the size of the header read buffer.
Message-ID: <20220131110003.7aacad70@xps13>
In-Reply-To: <20220128220156.4057446-1-jmeurin@google.com>
References: <20220128220156.4057446-1-jmeurin@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_020011_750992_A7E26AA2 
X-CRM114-Status: GOOD (  15.87  )
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

SGkgSmVhbi1NYXJjLAoKam1ldXJpbkBnb29nbGUuY29tIHdyb3RlIG9uIEZyaSwgMjggSmFuIDIw
MjIgMTQ6MDE6NTYgLTA4MDA6Cgo+IFRoZSByZWFkIGJ1ZmZlciBzaXplIGRlcGVuZHMgb24gdGhl
IE1URE9PUFNfSEVBREVSX1NJWkUuCj4gCj4gVGVzdGVkOiBDaGFuZ2VkIHRoZSBoZWFkZXIgc2l6
ZSwgaXQgZG9lc24ndCBwYW5pYywgaGVhZGVyIGlzIHN0aWxsCj4gcmVhZC93cml0dGVuIGNvcnJl
Y3RseS4KCk9uIHdoYXQgTGludXgga2VybmVsIHZlcnNpb24gYXJlIHlvdT8gSXQgbG9va3MgbGlr
ZSB3ZSBkb24ndCBzaGFyZSB0aGUKc2FtZSBjb2RlIGJhc2UsIGFyZSB3ZT8KCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmVhbi1NYXJjIEV1cmluIDxqbWV1cmluQGdvb2dsZS5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL210ZG9vcHMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZG9vcHMu
YyBiL2RyaXZlcnMvbXRkL210ZG9vcHMuYwo+IGluZGV4IDIyN2RmMjQzODdkZi4uMDlhMjY3NDdm
NDkwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZG9vcHMuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL210ZG9vcHMuYwo+IEBAIC0yMjMsNyArMjIzLDcgQEAgc3RhdGljIHZvaWQgZmluZF9uZXh0
X3Bvc2l0aW9uKHN0cnVjdCBtdGRvb3BzX2NvbnRleHQgKmN4dCkKPiAgewo+ICAJc3RydWN0IG10
ZF9pbmZvICptdGQgPSBjeHQtPm10ZDsKPiAgCWludCByZXQsIHBhZ2UsIG1heHBvcyA9IDA7Cj4g
LQl1MzIgY291bnRbMl0sIG1heGNvdW50ID0gMHhmZmZmZmZmZjsKPiArCXUzMiBjb3VudFtNVERP
T1BTX0hFQURFUl9TSVpFL3NpemVvZih1MzIpXSwgbWF4Y291bnQgPSAweGZmZmZmZmZmOwo+ICAJ
c2l6ZV90IHJldGxlbjsKPiAgCj4gIAlmb3IgKHBhZ2UgPSAwOyBwYWdlIDwgY3h0LT5vb3BzX3Bh
Z2VzOyBwYWdlKyspIHsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
