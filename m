Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ED3CD98CF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2026 07:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yO52wvlEocATCF9pgtY428QEm75a7SZ36AQK1hn1ug=; b=Y+GHNtiT3gfKwl
	rLwuAK6rKLcCeuYR98EukBuo0/umLOXWgwYncRfVnE88hOnV/GX5WMXAq2eH6UixzvqiTBkX6m0gd
	ut8yA5IXPGAu2ny1sR7JRv8v3d78uklo9VPQkLU5ohB6a1IVQ0o/lO4orcM0U8jWLO7vZTaOyNjqV
	NdBd8kMPTODMcSUwLx60lzlmrFciKX7q1Q9QNI1dNMNdBcXyvo/utTrZcjaVKuiMnVV4vXaD6eiAe
	r6K1iuEcCAm8q9EFiIYHH6W04Xo4fgPlZbaix5U1lkLU/ncnxpy/vXDbtvBdX32oYgAcnYAwLJYwE
	Gti+fdUVSJPFBQBWgYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZj3-00000008s2x-3PZi;
	Thu, 11 Jun 2026 07:21:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZj1-00000008s1w-3RaJ
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jun 2026 07:21:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 602484E4180D;
	Thu, 11 Jun 2026 07:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 352DE5FF03;
	Thu, 11 Jun 2026 07:21:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A755106B9E31;
	Thu, 11 Jun 2026 09:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781162473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sx2Lw2VBfVAh5bZFaQYxdt+bBNldzZyEUbKgaWFmh4Y=;
	b=Yg2mNszaQYtR6t73fwlwIAi5MN/X/qea8mGzSZoO4CIn0VdD0BYFOKodl828+oQqvfl0Hf
	do4r3S8Sh6nLJZrb27JTuDZdCwezhLk6sX8eJJp0wie/z3EECGj21/8u4KeZwef8SJLARn
	7t1tXi7rh8E0p89sYOOdxgljsgpl5K2OVTh/kXk669bXnuNkJ959qEmvhqKjKjTKX2f3wq
	zE3m947uyTlFDVI/D8tna7jLG0XBtD8zq0cAKFFS2lzBVaRvweX+TUcbvVjrJqXv640Ctn
	8Ny/dq+RQOwh+ZNeV+GiNUP91xqwYLkQGsfuv4BUN1km5GASvs75EvKdvCZz5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
In-Reply-To: <e3b98bb6-62e3-4370-9050-de48250a0398@web.de>
References: <e3b98bb6-62e3-4370-9050-de48250a0398@web.de>
Subject: Re: [PATCH] mtd: cfi: Use common error handling code in two
 functions
Message-Id: <178116247248.423856.8903595196251166869.b4-ty@bootlin.com>
Date: Thu, 11 Jun 2026 09:21:12 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_002115_992999_6921339F 
X-CRM114-Status: UNSURE (   6.15  )
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

T24gV2VkLCAxMCBKdW4gMjAyNiAwOToyMTo0NiArMDIwMCwgTWFya3VzIEVsZnJpbmcgd3JvdGU6
Cj4gVXNlIGFkZGl0aW9uYWwgbGFiZWxzIHNvIHRoYXQgYSBiaXQgb2YgZXhjZXB0aW9uIGhhbmRs
aW5nIGNhbiBiZSBiZXR0ZXIKPiByZXVzZWQgYXQgdGhlIGVuZCBvZiB0d28gZnVuY3Rpb24gaW1w
bGVtZW50YXRpb25zLgo+IAo+IFRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBD
b2NjaW5lbGxlIHNvZnR3YXJlLgo+IAo+IAoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoK
WzEvMV0gbXRkOiBjZmk6IFVzZSBjb21tb24gZXJyb3IgaGFuZGxpbmcgY29kZSBpbiB0d28gZnVu
Y3Rpb25zCiAgICAgIGNvbW1pdDogY2Y0ZmY3MTdhZjY5Y2ZlMmRmZjhkZGI4NDNkY2UzNjIwNWNi
M2M0MAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
