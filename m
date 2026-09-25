Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341F8C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9cG8j/cc1h8JUfA0savP7HsM3M+DEAnIgVPURStZ58=; b=eVHAFztULX503w
	ZaJswzf4rCnx+fBpD2Dtj9uBR255WoyjRkn9EInzSfLpsrCJJOvXZGKd2D5Kn5jZVnzBkR9r9aVpP
	uL6ncUqKM1GnJcR5k7AtLtAKZiZvn5MYoSImNaiHtFcEFzfsJMjaxEJi1Z8bBltbYAQaJayUX/X6A
	ZkZ2+Tv8u+hWftAuJNVIu4UPd9ArqvNuo5nONykfyRNZ2gdav5Mynj6tykljvyRlmiQFTInFeJxJw
	z31G3n97lCM2cJY7stiwMmIj8YFj37oN67owZrztJe2MASOL58gloH8gLnwMNUpysIb2tRwpGUmly
	C1FSXmVtSM+p6PqYdpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vJ-0000000Da9p-1HRO;
	Fri, 25 Sep 2026 14:29:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vG-0000000Da6c-2lOr;
	Fri, 25 Sep 2026 14:29:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81CA4C653F9;
	Fri, 25 Sep 2026 14:29:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F3196073B;
	Fri, 25 Sep 2026 14:29:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55F52102F08C8;
	Fri, 25 Sep 2026 16:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B9SAdsKIM9po5e3COkJx3/f5eCr9H91R3DRSye2x0s0=;
	b=ijk3lvV5Ytolj7ONBao+6E1jKrnPnfqy9PllVh0sQCIKiPAby37e8RfcmECcCv+xY5uLnP
	4JvEKceRY00bMEL3lG2XtcvoIuwGkJbZaS3yZV+5WifBxC67dfZ3v9AwpGbE99XT75VJto
	q7Tak5DIT/J8DVIyRCsa/db6qkwEwG/Mae2miTe95upekFvjLycmzNk2ERWRoHGxA+gRg0
	9w6BtmJ+qGCeIm0mKS50LpaDZVzGFdRx/AYZV9Kh8nSShWs+CGTqXxyQVc9pdtgZW6DcOJ
	vsy96kev8o5HMZpeYOx/l14ApShn4aI5DXIWAe3q8tpuxM8k4H0KA69523GogQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Richard Weinberger <richard@nod.at>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Chen Ni <nichen@iscas.ac.cn>, 
 Runyu Xiao <runyu.xiao@seu.edu.cn>, Frank Li <Frank.Li@nxp.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Haotian Zhang <vulab@iscas.ac.cn>, 
 Johan Hovold <johan@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20260917204724.1289912-1-Frank.Li@oss.nxp.com>
References: <20260917204724.1289912-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-Id: <179034653501.1166139.9018677426507757712.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:55 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072910_899776_EC78E03D 
X-CRM114-Status: UNSURE (   6.92  )
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

T24gVGh1LCAxNyBTZXAgMjAyNiAxNjo0NzowNiAtMDQwMCwgRnJhbmsuTGlAb3NzLm54cC5jb20g
d3JvdGU6Cj4gUmVwbGFjZSBkaXJlY3QgZG1hX2NoYW46OmRldmljZTo6ZGV2IGFjY2VzcyB3aXRo
IHRoZSBwcm9wZXIKPiBkbWFlbmdpbmVfZ2V0X2RtYV9kZXZpY2UoKSBmb3IgY29uc3VtZXIgQVBJ
Lgo+IAo+IGNoYW4tPmRldmljZS0+ZGV2IGlzIG5vdCBhbHdheXMgdGhlIGRldmljZSB1c2VkIGZv
ciBETUEgbWFwcGluZy4KPiBTb21lIERNQSBlbmdpbmVzIHN1cHBvcnQgcGVyLWNoYW5uZWwgSU9N
TVUgbWFwcGluZ3MsIHNvIGRpZmZlcmVudAo+IGNoYW5uZWxzIG1heSB1c2UgZGlmZmVyZW50IERN
QSBkZXZpY2VzLiAgZG1hZW5naW5lX2dldF9kbWFfZGV2aWNlKCkKPiByZXR1cm5zIHRoZSBjb3Jy
ZWN0IGRldmljZSBmb3IgZWFjaCBjaGFubmVsLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9u
ZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHVzZSBkbWFlbmdpbmVfZ2V0X2RtYV9kZXZpY2UoKSBp
bnN0ZWFkIG9mIGNoYW4tPmRldmljZS0+ZGV2CiAgICAgIGNvbW1pdDogYTAxODUyNGEyZWM5NmRh
NWJiMTk2NTA1Mzk2N2EyMGUwMDY5ZWQ5ZQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUg
b24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRl
ZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOo
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
