Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDFFD5C0D0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Dec 2025 08:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wf4ZNz0hssVAV9KQGxzyjvFO7cukTc404H4ggjCX8pE=; b=pbF0Ghih+UQgQn
	/Sz82uGL+rCZcuBgE5+LjD8WPp+tVxR8PN0l5GzVgC8Xw4iDGAg2DldwAyKF9cZK0FbQjSgyaPpw0
	48b2wnfqcTJ7FSA4asVpBl7c8ck5AJVeRclHT9o8Vd/T8CPoJttc6LLnZz0X/NqW/I34tyNZoPtHc
	srMb8MGwj6m/Ieth5+76ovigG9kQ0VKqjRAPPd6t2+I/6OFmYzRKHcLPz/o7EOEa+fCuWjAWhSfT/
	CpQ/DJ4HzCdbNuJtIkckw80kCERYTpayxDoscGPeI0nwm7CfXYKSRrCqSVYmgn0P0+5lXEH35Ni9e
	IIjwsuCdhUNfd20pL/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ7N-00000004u00-2UPe;
	Tue, 16 Dec 2025 08:09:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ7K-00000004tzb-3jPR
	for linux-mtd@lists.infradead.org;
	Tue, 16 Dec 2025 08:09:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C4EFC19D2F;
	Tue, 16 Dec 2025 08:08:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D804C6071C;
	Tue, 16 Dec 2025 08:09:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0E5C11942FEC;
	Tue, 16 Dec 2025 09:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765872547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CpSWgyic5TeUmeGcTjSYB/1y2mAncR0jWMgpYsWXt/4=;
	b=N73Tzvr1BLiiXPWBUBhTtduglgTKL2Bi3pxie0lYGqeKjYx6SKr4fIkLs12jVDrqeIg5p0
	lHVsaKIDPxZaCoIaqYmFESyrJ7pBnYR32RLYZM/4wChs2y8EcC/zbVTUpw0AclRsuq23Cg
	j55OZBW9U+ji1N5Rpf1Ii6xScnVCL9crD08e9Qs/UER8zyWOlak+fz9JkISqaIeknqWmRs
	gcamDJd3HqWrQP4OXho8okTpMKxJo+x8U19nazZ1mjNuswcWqGIIhMHCLFuCB8rbmciZZx
	nFuiwSOT6UVg3QvZwQlniBVRWLRjAQx/VkIJPW+Cu3p6Bb1PU16bgFRZMcTeZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
 mmkurbanov@salutedevices.com, george.moussalem@outlook.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Subject: Re: [PATCH] Revert "mtd: spinand: esmt: fix id code for
 F50D1G41LB"
Message-Id: <176587254445.878951.5339820349848286786.b4-ty@bootlin.com>
Date: Tue, 16 Dec 2025 09:09:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_000911_101510_451D8773 
X-CRM114-Status: UNSURE (   6.19  )
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

T24gVHVlLCAwMiBEZWMgMjAyNSAyMzowNTo1NiArMDgwMCwgWml5YW5nIEh1YW5nIHdyb3RlOgo+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgZGQyNjQwMjY0MmEwODk5ZmRlNTllYTZiMDg1MmZhZDNkNzk5
YjRjYy4KPiAKPiBUaGUgaXNzdWUgR2VvcmdlIG1ldCBpcyBkdWUgdG8gdGhlIGxpbWl0IG9mIFFQ
SUMsIG5vdCB0aGUgaXNzdWUgb2YgdGhlCj4gZmxhc2ggY2hpcC4KPiAKPiBRUElDIG9ubHkgc3Vw
cG9ydHMgNCBieXRlcyBJRC4gU28gdGhlIGZpZnRoIGJ5dGUgaXMgYWx3YXlzIDAuCj4gCj4gWy4u
Ll0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBSZXZlcnQgIm10ZDogc3Bp
bmFuZDogZXNtdDogZml4IGlkIGNvZGUgZm9yIEY1MEQxRzQxTEIiCiAgICAgIGNvbW1pdDogMmY2
ZDJjOGQ5YWMwNWE3YTFjMDIzMzNmNmFkMzA4NjgyNDY4ODBkOAoKUGF0Y2hlKHMpIHNob3VsZCBi
ZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0
IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVn
YXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
