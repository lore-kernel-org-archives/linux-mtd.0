Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E94DE87846
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4tolvnwuyzH97ILsNISfZuKkGWXtLz6aaxbfDDlV/I=; b=h/GoplHFPvmksP
	1byfZThsfjbNVmVUXAyox0eEHt3yMdKjD7cPphjtOWIyIUAZTqh93yM7k4y0r/VL+6rkZnpCKNBSu
	ajROtMvA9YbyID4MuZiFl/I2lZSPxOJ/7Vqk5EpTQMS2Sygfl9SYVv8ivOq+asFQCaBY7dGFNOWHG
	A2fNfQXweDLtn0iUHnfLEtVtWWlct5Y1ogZOMz5ELVlP5Zp2YpWYRcvZSycVnjF/ZQonV5UcjCiHP
	WBC1/oavMSAKHWJblbpexzq7MbKSgZzY6B7yfvQvPBPbVDnMisSVn1VDlbaQ6TAs8XgK/LrzPrODy
	lcjmamt4FyMB5PisQN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ3x-00000006th9-2PBx;
	Tue, 03 Feb 2026 16:15:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ3v-00000006tg0-0DXq
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 16:15:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 893ADC24380;
	Tue,  3 Feb 2026 16:15:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43B5A60728;
	Tue,  3 Feb 2026 16:15:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25C18119A8888;
	Tue,  3 Feb 2026 17:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770135331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fAkS3GxQfJqZuPP7dN4iUwkmjygmtk85Lf0bY7xtzqQ=;
	b=A344zpNzpqIyzWfVrsMggNuNEE/KlVKNVHDV5xB7EaO15Q4C2SV/RXtV/aL6WdTLMYMiYy
	eau8//pTv2Hdmj/Q+cDNoNyWqUCg5/HruSGX5E5zh7kthMVJgTLZsdgKzGN1oh0eabpI/I
	MF5gKlOZ9M7j+H62uXIAkg+O8cDpArBQY3QlDFJt0xGUHTKiwNxITYAA2fLBcP/yGh21XL
	7VkUaP8E5EUcSm4ccXL43XX8DgHVf1i9cVpi0jooWP1hmUeTqvdP57k/BqNKMh1zijKkM5
	z7sQ4M/XZaNnb5lmFqyGJawal9R+4DGZmgBqMpc4JNOr68DG257LngkRVLxToA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, s-k6@ti.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260202013633.3696155-1-nichen@iscas.ac.cn>
References: <20260202013633.3696155-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] mtd: spinand: winbond: Remove unneeded semicolon
Message-Id: <177013532964.558888.5659212564126309775.b4-ty@bootlin.com>
Date: Tue, 03 Feb 2026 17:15:29 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_081535_236539_A0B78979 
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

T24gTW9uLCAwMiBGZWIgMjAyNiAwOTozNjozMyArMDgwMCwgQ2hlbiBOaSB3cm90ZToKPiBSZW1v
dmUgdW5uZWNlc3Nhcnkgc2VtaWNvbG9ucyByZXBvcnRlZCBieSBDb2NjaW5lbGxlL2NvY2NpY2hl
Y2sgYW5kIHRoZQo+IHNlbWFudGljIHBhdGNoIGF0IHNjcmlwdHMvY29jY2luZWxsZS9taXNjL3Nl
bWljb2xvbi5jb2NjaS4KPiAKPiAKCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8x
XSBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IFJlbW92ZSB1bm5lZWRlZCBzZW1pY29sb24KICAgICAg
Y29tbWl0OiAwZjhhMjE3NjcwYjZlM2MyOGFmZmY1Y2RmNTk4NTE5MDYzM2Y2MmUxCgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
