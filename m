Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D2EC9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gp2uupiHikOwe+4yDZPZaseLUVmPtaO/RNwDZkd3vyY=; b=B6R8u0KtjiolzR
	CaqLyJTQtXaPFVLDjXm5qBvlltoCJQiHgJkMO4IDiADAHHJ1jmzKYETYTin1PJaXYT2ULjBq1nAgY
	wFbbyLyQSYmQPEbJfNvOUOSnEeB8u5P2A4Ak5Zy+B8a6VRMjNHu6iu9j56Jy7EfMe/JLtYF1wIpgi
	SXrDPGAkepUoXEAOsl8QBaEA6HVTRbXePopLXltmxClrZxrXDL/mDQsOcW/N5jf0B2MPIutKK3V4Y
	5ny5Zu1iam+f28WGAMymxiH2LCCvqaoU7VGvZ0k1RGhMaNBqARuF48yAtKmTrSQDg/FzkQfgnuUVk
	vYhiUZSZ9F9CoLNKEwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65d-0000000DSCV-3VcQ;
	Fri, 25 Sep 2026 13:35:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65W-0000000DS9R-3RqY
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 13:35:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 116F1C653F2;
	Fri, 25 Sep 2026 13:36:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 277EC6073B;
	Fri, 25 Sep 2026 13:35:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACC08103293B8;
	Fri, 25 Sep 2026 15:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G1Wm7AVF8UyDQXfeTyu7vO3i2xBbH7wOzsVO6JlTT+Q=;
	b=w4X4ZTsSd85qx4uNBVTYxCqQ8+RCkOXnbt2hWgNW5UVkEF+Rbj1UXwmEXJJl1Bv3E2bNcc
	nrWD1etOndyRiphurQB6Yxr6XnM0XKmSuN9KWgfLOijIt79+KMHETc1I4zRZF3xI4SKisW
	2QMywd3EwqpBTE9tpVOexoySwZeT3mIZQPiM4nj+JX8zrt/BSaeEms9anh//+03wFXVl+p
	QLfkppqtkr/MeuWkif4Dhh8zPqs6R4Top8JFUIbuWc/9tU9w6TGT6vv/znDa56grtx3zlC
	+JeVz3WhPyN/ws8nWQL8AvfjJDz/bj1hfbVcZ/9RsKU12xX0Lpqlpk9V7YOMFQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260909223521.67572-1-rosenp@gmail.com>
References: <20260909223521.67572-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ndfc: use devm_kasprintf for mtd name
Message-Id: <179034333329.1124555.11164578898027570715.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:33 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063543_025706_0DE9BD0B 
X-CRM114-Status: UNSURE (   6.67  )
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

T24gV2VkLCAwOSBTZXAgMjAyNiAxNTozNToyMSAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
Q29udmVydCB0aGUgbXRkLT5uYW1lIGFsbG9jYXRpb24gZnJvbSBrYXNwcmludGYoKSBwbHVzIGEg
bWFudWFsIGtmcmVlKCkKPiBpbiB0aGUgZXJyb3IgcGF0aCBhbmQgaW4gbmRmY19yZW1vdmUoKSB0
byB0aGUgbWFuYWdlZAo+IGRldm1fa2FzcHJpbnRmKCkgaGVscGVyLiBUaGUgbmFtZSBpcyBub3cg
cmVsZWFzZWQgYXV0b21hdGljYWxseSB3aXRoCj4gdGhlIGRldmljZSwgcmVtb3ZpbmcgdGhlIG5l
ZWQgZm9yIGV4cGxpY2l0IGNsZWFudXAuCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhh
bmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBuZGZjOiB1c2UgZGV2bV9rYXNwcmludGYgZm9yIG10
ZCBuYW1lCiAgICAgIGNvbW1pdDogNWU3MzcyOGE4NzVhOTFmYjJjN2RjNTI3ZjczOTFkYTAyMDVm
ODViMQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
