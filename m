Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1ACC43638
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AN9WkYLQE1p0EyaYLSrU6QPh47XHVa2WPX+bVmf7Sk=; b=wAybkO7khtwt8u
	2qO3GYjd4E+LMPJCAEBrp/Sdxlw7HWWh3WWiw4ns7+Jz2GSH4rkfccwBqEnM3nvcGu+JkPd77Q8bi
	pmEmP2PL7gvFpNGGYHPsiOcl/DoaocQ9XRYhn2snn9bnlSeusn6kBZ5rbdg44+WKhtvMb3nJ51pCW
	YpRHpxpiQF6zgLgr2DW2Ai7iei/vsmhjr0NTT0PbHtTZ45zk5sL3s8AaHQ/TyWh+FddHmVy1w+PND
	4FPJRKSX75FipHzglHg37LJqBvbXjBULPaIx22pcxt4fAnH03SYs7rOOtaExQBcw28QJIueluaX0H
	nAn7pitNS3y3Dpa289og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9S-0000000Eu8N-2dIT;
	Mon, 29 Jun 2026 14:39:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9R-0000000Eu7G-2eqp
	for linux-mtd@bombadil.infradead.org;
	Mon, 29 Jun 2026 14:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=TYFgpODSCVX2C5CNzgVOEDY1ictoCpmsvxoF8q8OHKo=; b=fTJXEkCAP/kcm06YjMtTdvobup
	w3YguxqBGBjKIDyyAmE2z/0bPiRVjm6UMOAfz3UJAi8faEGxbUf/uHe7cHH3wAXA3v+HQhxkeBoXl
	7Bw3GzZAWTEfkMgtNSxFyU333081F8zkBPb/TluZKlHbjafMXtZkV0rct3c7C+jWkaelKcihW+aMR
	p2qE0s/ffffe8yEzk6fHyb1PyWUYADV75vk37NbrMWz8+jNIkZiH3rj+PiHqnHlnVXSinMtm9W1Iy
	0UQ0N+uLiaKO0/BS08FVmkkx8g+teP2mlgOGmoOmHwyyWHCS89sKHV+Zvza4wteF3AuhdDZdpWHqx
	FM3baEHA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weD9N-000000017iz-1t4n
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:39:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 110761A0CF1;
	Mon, 29 Jun 2026 14:39:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D86715FF96;
	Mon, 29 Jun 2026 14:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B956A106F189D;
	Mon, 29 Jun 2026 16:39:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743984; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TYFgpODSCVX2C5CNzgVOEDY1ictoCpmsvxoF8q8OHKo=;
	b=aCINo6MownjuVkcTFqrBr6oSrm3KiWHhDbzIYYJ/yhUTr3GRLSU5pNQBR3xUhiWKC5lRAl
	zKe52tasxQ7pMqqgMxsDYO05TRJUMwagkFZ0v4+NTv8gGVKvA8tznu1Tz4vfhKHeIDN4mM
	gZPg6uMlPb4kb+cl7JI6OMHegkXbnn/2CeKQ/sbXDd6lxM9jSSndONVpxCF+Kfg0Xqf6V9
	Xs4gZjXiYC4JxCCzTVMUlCo4GMmJhXiO/ppDooUwI08QuSvtKKYIPF0+zsv0nia5qnlpn/
	2p1CgPs/Unv4XUBFxkU06v+4IAyS3dmeAyjqRqzickQZpPppazvjaRub7+36EA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615063232.44383-1-pengpeng@iscas.ac.cn>
References: <20260615063232.44383-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: ecc-mtk: handle ECC clock enable failures
Message-Id: <178274398069.256048.11835186154105614379.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:39:40 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_153953_953377_A7AEE3AE 
X-CRM114-Status: UNSURE (   7.95  )
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

T24gTW9uLCAxNSBKdW4gMjAyNiAxNDozMjozMiArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IG10a19lY2NfZ2V0KCkgZ2V0cyBhIHJlZmVyZW5jZSB0byB0aGUgRUNDIHBsYXRmb3JtIGRldmlj
ZSwgb2J0YWlucyB0aGUKPiBwcm92aWRlciBzdGF0ZSBhbmQgdGhlbiBlbmFibGVzIHRoZSBFQ0Mg
Y2xvY2sgYmVmb3JlIGluaXRpYWxpemluZyB0aGUKPiBoYXJkd2FyZS4KPiAKPiBUaGUgY2xrX3By
ZXBhcmVfZW5hYmxlKCkgcmV0dXJuIHZhbHVlIGlzIGN1cnJlbnRseSBpZ25vcmVkLiAgSWYgZW5h
YmxpbmcKPiB0aGUgY2xvY2sgZmFpbHMsIHRoZSBjb2RlIHN0aWxsIHRvdWNoZXMgdGhlIEVDQyBy
ZWdpc3RlcnMgYW5kIHJldHVybnMgYQo+IGxpdmUgRUNDIGhhbmRsZSB0byB0aGUgY2FsbGVyLiAg
VGhlIHByb3ZpZGVyIGRldmljZSByZWZlcmVuY2UgYWNxdWlyZWQKPiBieSBvZl9maW5kX2Rldmlj
ZV9ieV9ub2RlKCkgaXMgYWxzbyBrZXB0IGV2ZW4gdGhvdWdoIHRoZSBoYW5kbGUgc2V0dXAKPiBm
YWlsZWQuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBt
dGQ6IG5hbmQ6IGVjYy1tdGs6IGhhbmRsZSBFQ0MgY2xvY2sgZW5hYmxlIGZhaWx1cmVzCiAgICAg
IGNvbW1pdDogODJkOWEyYjQ1YjE3MGYwYzUyYWM2MWUwZTNlMjNmMjEyY2QwNjVmMAoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
