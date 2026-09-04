Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C31AC79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFN6cSwn+azA5PZ2cgk/XGB0T2S6J4O0/l/fdRJOYig=; b=ff8yPCadj7T9+R
	j08Pdqi2B6iLj+y4BqvZe9P7fxfTXVm05kirDZ8G2e14gm1KpuUZMFagaIrDlrG8YWt77mkujGQyL
	67eTgBxlk6tJmD8b4IWuPv1177P02j0EpJ5mp/4ok5iG053OEAN/NRbYRe0hi/vbHYWwpfAu4yh3c
	lrtnD+zIUmVuK8EPY+K75Vc22/gN7PS00DpUnii3NkrV/fSsReOP40SgWSBQhJw3QrxQu7AufBe1f
	FO2fLup/VRQwNdvvycP2ADFjymeC4GfwVHW43qdvzEVzqiGvNK3ZDaoiy29n7In5y8416d3jJBqDy
	2XvyxiyBvYG2CO5M68rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xrv-00000002u4I-3qne;
	Fri, 04 Sep 2026 17:38:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xrs-00000002u1j-2rHw
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3440D4E4151A;
	Fri,  4 Sep 2026 17:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 008546057F;
	Fri,  4 Sep 2026 17:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA85811C78158;
	Fri,  4 Sep 2026 19:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543497; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3E8dPhUGulwBvC2FDqxVtlrQlaozuEVc311pKm8kPdo=;
	b=s2ciaPVL4AVMnm0zd8VU8Qr1pHFD9nt3vipOUcU+L98ZxCJnvEoRGEPmGRW1xMlVzi5JcT
	jRpMACiO6fgvx+QfXLzhDjn1g5iR7EPK9oKeCiid6B222uR96eFOWedQs7Rk+ka6FmDwFF
	YTXoQu/YEZOI7t2MzmDpNdl0ABqO1i2A3opzzFZSMA8AXiH4qFU5/qPXfFlzrYJE2l1945
	cjnjHawKk8uJq9F68SoKFH/7d0lHXkZLmNiiJOQJmBqWsrBJSbjfznEwCjUveAn/xjChVw
	wmfXJOuVosiKc2ZkbzQWqwSVlrUDnmGNdgTO4DhYMlnfJ+BriaIb0jz3iA2S5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: broonie@kernel.org, md.alam@oss.qualcomm.com, 
 Johan Alvarado <contact@c127.dev>
Cc: konradybcio@kernel.org, pengpeng@iscas.ac.cn, j4g8y7@gmail.com, 
 quic_varada@quicinc.com, quic_srichara@quicinc.com, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260825013848.1056946-1-contact@c127.dev>
References: <20260825013848.1056946-1-contact@c127.dev>
Subject: Re: [PATCH] spi: spi-qpic-snand: publish the ECC context to
 snandc->qspi
Message-Id: <178854349408.1467647.16557341714581809344.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103824_991574_6F89372C 
X-CRM114-Status: UNSURE (   6.56  )
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

T24gTW9uLCAyNCBBdWcgMjAyNiAyMDozODo0OCAtMDUwMCwgSm9oYW4gQWx2YXJhZG8gd3JvdGU6
Cj4gcWNvbV9zcGlfb29ibGF5b3V0X2VjYygpIGFuZCBxY29tX3NwaV9vb2JsYXlvdXRfZnJlZSgp
IHJlYWQgdGhlIEVDQwo+IGNvbmZpZ3VyYXRpb24gdGhyb3VnaCBzbmFuZGMtPnFzcGktPmVjYy4g
cWNvbV9zcGlfcHJvYmUoKSBwb2ludHMgaXQgYXQgYQo+IHplcm9lZCBzY3JhdGNoIHN0cnVjdCBh
bmQgb25seSBxY29tX3NwaV9lY2NfcHJlcGFyZV9pb19yZXFfcGlwZWxpbmVkKCksCj4gd2hpY2gg
cnVucyBvbiBwYWdlIEkvTywgZXZlciB1cGRhdGVzIGl0LiBxY29tX3NwaV9lY2NfaW5pdF9jdHhf
cGlwZWxpbmVkKCkKPiBpbnN0YWxscyB0aGUgb29ibGF5b3V0IGJ1dCBkb2VzIG5vdCBwdWJsaXNo
IHRoZSBjb250ZXh0IGl0IGp1c3QKPiBhbGxvY2F0ZWQsIGFuZCBxY29tX3NwaV9lY2NfY2xlYW51
cF9jdHhfcGlwZWxpbmVkKCkgZnJlZXMgdGhhdCBjb250ZXh0Cj4gd2l0aG91dCBjbGVhcmluZyB0
aGUgcG9pbnRlci4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsx
LzFdIHNwaTogc3BpLXFwaWMtc25hbmQ6IHB1Ymxpc2ggdGhlIEVDQyBjb250ZXh0IHRvIHNuYW5k
Yy0+cXNwaQogICAgICBjb21taXQ6IDkzYmM3YzRkMmY0MTk4NTg2YTZkYmQ3Nzk3YzNiYmYxY2E4
NDU3NjEKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5k
IHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21w
bGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
