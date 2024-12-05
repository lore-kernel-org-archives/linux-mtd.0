Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40EEE77170
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQI4zLEPYxWwvc1qdeVPuNnHccpB8lJIrtRBDiMDJ2w=; b=AWWp9fdTP+qAQ/
	UqV9jFhuuLo3yGEDpyiCAVZTM9nKz6m6PdOJA7eOrS/9i/L8+/WSSQKCZ+XXlNzB5uL55S58RauZX
	a8xKnqoDO8aehD53QDFywDsEeQQ0g8fSGuj7pzUXQTIPVKCjb4YqLlDgPv4G+1IHVImUuOQBmtDW1
	yDhtJOXYynBe8HsIjdrH8NaI2L75+QdnPtvZRJbLyaYJz9UkfVI26b8jYNt6BhQqU5Tuz+ilqRJNw
	3OUQSNGxJkg8PyjW7n3zHY7EZ1PvzIdcV9wedUPiP6HE8RUdME1vPY4nCQI+pY/bIIvW+JhoiL17T
	zIGn5sHOaGM5Nh+E6dWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Qv-0000000FcZF-3si7;
	Thu, 05 Dec 2024 10:50:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9N0-0000000FbyP-3AZ4
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Dec 2024 10:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=43b7I4kQsknjD4ld4O30WPxbQGPMHVX8puNe04UAIWo=; b=CuUhi2fwhulqqvbJ1x9COhACdg
	XRHsy0cBcHXQfVwC3nWc6eYQ4tiV8dwICNmHWDbbtrA9VwcN61lxKSiCQlgU3NnHL6eRKOItFDyrQ
	17ciXsPFUsMlnAm5CUIvfCpkoYpQ7T6x2I0RT2u9h6dmyD0T2umwpcoZcPvFO1UuAfQaf945NRpTK
	9XT5OYl+PmNdeuVoBdTPQw/BD7Sow706yDJr5B2lwxre9akat1FvbAjHMUihVjPqzxWDEnGu7/tXq
	EFFAAEVso5uuNl+jYZS4QzWX4YUggvZBjscKH8QUoruNaCC6jZN6F6XaijMJWtp2osoY6EGb7JlGy
	b8s1uzjg==;
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Mx-00000002p0S-3COf
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:46:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2829B1C0003;
	Thu,  5 Dec 2024 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43b7I4kQsknjD4ld4O30WPxbQGPMHVX8puNe04UAIWo=;
	b=musTL+Ec2if8OtaFPKkJH2oemx0s1FPABUayqxGICgAa1n5rj+bxig3+ckUVmlv2aDVyC+
	hlpTM3zNMMAGXkgG3AKCQVTTdowh30zbjW9Gv7M6ndR4b0yq0U2z1sXU0Y2N0esZWZcNxj
	zT7veplfV6PFoeARhM7LBhtQ3sbIjZQj09Xbo2iwEOTjeYllXCQiWyuVn4JMhNHfwL61vW
	R4HxFsm1VYpoy/P9xX9MRbmh8+fBCdXuKD91aqUQ+UyILcCVqYJO99V4MhUjSTMCYAlL4P
	DpOOie8T9g3Bcvq2O2zk2wHsE+FCxmXZS9UvlIHKMONFG8dZdIep3/qFcLcXZw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  kernel-janitors@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: phram: only call platform_driver_unregister
 if phram_setup fails
In-Reply-To: <20241030172149.3101873-1-colin.i.king@gmail.com> (Colin Ian
	King's message of "Wed, 30 Oct 2024 17:21:49 +0000")
References: <20241030172149.3101873-1-colin.i.king@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 11:46:00 +0100
Message-ID: <87frn2v253.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_104603_913215_69A9F1AD 
X-CRM114-Status: UNSURE (   6.46  )
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

SGksCgpPbiAzMC8xMC8yMDI0IGF0IDE3OjIxOjQ5IEdNVCwgQ29saW4gSWFuIEtpbmcgPGNvbGlu
Lmkua2luZ0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgY2hlY2sgb24gcmV0IGFuZCBjYWxsIHRv
IHBsYXRmb3JtX2RyaXZlcl91bnJlZ2lzdGVyIGlzIG9ubHkgcmVxdWlyZWQKPiBpbiB0aGUgY29k
ZSBwYXRoIHdoZXJlIE1PRFVMRSBpcyBub3QgZGVmaW5lZC4gRml4IHRoaXMgYnkgbW92aW5nIHRo
aXMKPiBjb2RlIGludG8gdGhlIHJlbGV2YW50IHBsYWNlIGFmdGVyIHRoZSBjYWxsIHRvIHBocmFt
X3NldHVwLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmkua2luZ0Bn
bWFpbC5jb20+CgpBcHBsaWVkIHRvIG10ZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
