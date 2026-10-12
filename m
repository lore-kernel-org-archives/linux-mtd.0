Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CD2CA9EDE
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+nrfMNEL7f+nViw2H2e3ftkAtohrdIPekv+nij1Wk8=; b=YHDgm2GF2QpJYw
	jqU0E1Rk21AXZ0oFPkwEkAAmPw2fJUDmJAZXmVuTYUDlHyWDe6IW+rfV0WkRBlKBdhHE7sM6ZOR1r
	MQDdzX7DoclDPom74HkpOPu6oL7jdpLfLD11YyJcos9vxFoeH1i/56MNwNAfQxppBnnkY7ljby2Kz
	hqT93Dz+XLsla6YTiatLLCQJQLm8k3FuiHdKQm3S+bfCHPHM5uQUHh/jlFg0npiER8GH3P24xji7J
	ZSObBvb92NjABgyYaH6a5TK9xyR4HMYZ1HZduSfBfPwyqd6ky5NhX/y8A5HeevnQFrX/DlVNU/FJQ
	kZ+se4vo5TVQ/STYuJqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKeF-0000000BDJO-1MHs;
	Mon, 12 Oct 2026 18:21:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKe9-0000000BDEo-1cf4
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:21:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C37934E411FE;
	Mon, 12 Oct 2026 18:21:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96FA9601A6;
	Mon, 12 Oct 2026 18:21:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7DF311D70C58;
	Mon, 12 Oct 2026 20:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y5HWKSRRQNv9jBuSNGPG575nkQgXJ5PE8wPbsk+wyPY=;
	b=vWYjixju/Xrmw8WRI8ekFc5byXp/EOf820j67ggwGnAWRWq59UWvM+KWpqtGUAEHjeSqRs
	HRji6c2wQujkoVuwoP8BWrlWZBtKqjPnD4f/BWEMrYRmMr88c8lLZB6+W1+thew3RVHbcL
	ButPThJ4XodZPtzJUyIEwjpcqoVCEdw11p6j88EsKJzaU6ccqrey3f2WE1rVPzFU4UeZId
	cU9AKyrnhpSEp4whJF9fBRYUH+B5WHmz7svmgdqpa2eub/aCzZDmemuHsSItZeo0Wf+bID
	6Y3WVEipKtbmMbzvvQtlLL8F047vJK7SPzjczexxUDr/wwFNGdML6RsBWFA2vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kyungmin Park <kyungmin.park@samsung.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Frank Li <Frank.Li@nxp.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: vkoul@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261002201614.245240-1-Frank.Li@oss.nxp.com>
References: <20261002201614.245240-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: nand: use dmaengine_submit() instead of
 ->tx_submit()
Message-Id: <179182926769.590599.14708999784232940162.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:21:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112114_705991_4A8EF833 
X-CRM114-Status: UNSURE (   3.89  )
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

T24gRnJpLCAwMiBPY3QgMjAyNiAxNjoxNjowNyAtMDQwMCwgRnJhbmsuTGlAb3NzLm54cC5jb20g
d3JvdGU6Cj4gUmVwbGFjZSBkaXJlY3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3ItPnR4X3N1Ym1p
dCgpIGNhbGxzIHdpdGggdGhlCj4gcHJvcGVyIGRtYWVuZ2luZV9zdWJtaXQoKSBBUEkgd3JhcHBl
ci4KPiAKPiAKCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IG5hbmQ6
IHVzZSBkbWFlbmdpbmVfc3VibWl0KCkgaW5zdGVhZCBvZiAtPnR4X3N1Ym1pdCgpCiAgICAgIGNv
bW1pdDogOGJlZjAxOTZhNGUyMWQ0NDE1MDkxZGUyYjZjNDk4MzIwZTAzYWRhMgoKUGF0Y2hlKHMp
IHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9m
IHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4K
CktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
