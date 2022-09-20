Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05D4C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuqv7lclXAbY3Av3nU2c5TT+y6Do2uMabOm9t0VSEIQ=; b=YK6fRghvMzfGRT
	O+mLI+yu+25ctHYtZPyQGfcRLhcMX5dfuo9xI/+5obGjbOGvO5gsCBvvKsylh1HI4CcnqZ6Kc/e56
	eVYXzh7rXQdc114r7UJd0PvtC0P8Hxu2oNwFd7KOuoqlcPbuSAKwENnO6k/yvXbrw2+LXpwodoTVG
	4CudPA6Wd/r4PNTWbrFODj7kbfw8WcO8myS3t4V9Dc+IMqAkiH0wCYxt45N/qUAPnw7EjnDV3WMGv
	nPqglVpCRR7Gl76Hi7Tsew6u5UFbPZgryPjM6k6uxKIbj9hqveDTmEhGQPUdV8pRTQzEilIBVtN2u
	LHTzqFXf+CmMHqQ8v13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQF-001grn-KQ; Tue, 20 Sep 2022 08:16:03 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQ3-001gn3-UM
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:15:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 62124200010;
	Tue, 20 Sep 2022 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVLy22muNBEbzcIbHIu1IOkDAC7wNvhUFUf+W0Hkpoo=;
	b=ZP9Xgwf9F1ZvG8cr4gEN9kc8KMHfsjkM6tHa3vZb0ElkPAlFFJ3Z7PofV6bz6KxvveYbkH
	dRaixZL++53s5IMFW/9aCWmP90lndia4xK3BRFXG79qiVKxBw1XyWyUkrrvnw5wahHshRO
	O0ssuFyYguQD8pFkpg9DKCmRx/mdogzDkmnWaFP6ecpPHoPQ4gX7tDwoCzq1MSaV71J4+E
	wE8OyUjCubzW0RIPrliSCRZYeUmyX9WEajciMC31GDjmq0lAwT6s34QSnWTVpm/icLqAy4
	vyWgtQw9hsOfklIEoTDQi8eehLvXV8GOY8WJt5O0AuMizrb45gh1Lvc88yYfaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsl_elbc: Fix none ECC mode
Date: Tue, 20 Sep 2022 10:15:46 +0200
Message-Id: <20220920081547.597617-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707184328.3845-1-pali@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'049e43b9fd8fd2966940485da163d67e96ee3fea'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011552_144224_D1DDA2A4 
X-CRM114-Status: GOOD (  10.81  )
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

T24gVGh1LCAyMDIyLTA3LTA3IGF0IDE4OjQzOjI4IFVUQywgPT91dGYtOD9xP1BhbGlfUm9oPUMz
PUExcj89IHdyb3RlOgo+IENvbW1pdCBmNjQyNGMyMmFhMzYgKCJtdGQ6IHJhd25hbmQ6IGZzbF9l
bGJjOiBNYWtlIFNXIEVDQyB3b3JrIikgYWRkZWQKPiBzdXBwb3J0IGZvciBzcGVjaWZ5aW5nIEVD
QyBtb2RlIHZpYSBEVFMgYW5kIHNraXBwaW5nIGF1dG9kZXRlY3Rpb24uCj4gCj4gQnV0IGl0IGJy
b2tlIGV4cGxpY2l0IHNwZWNpZmljYXRpb24gb2YgSFcgRUNDIG1vZGUgaW4gRFRTIGFzIGNvcnJl
Y3QKPiBzZXR0aW5ncyBmb3IgSFcgRUNDIG1vZGUgYXJlIGFwcGxpZWQgb25seSB3aGVuIE5PTkUg
bW9kZSBvciBub3RoaW5nIHdhcwo+IHNwZWNpZmllZCBpbiBEVFMgZmlsZS4KPiAKPiBBbHNvIGl0
IHN0YXJ0ZWQgYWxpYXNpbmcgTk9ORSBtb2RlIHRvIGJlIHNhbWUgYXMgd2hlbiBFQ0MgbW9kZSB3
YXMgbm90Cj4gc3BlY2lmaWVkIGFuZCBkaXNhbGxvd2VkIHVzYWdlIG9mIE9OX0RJRSBtb2RlLgo+
IAo+IEZpeCBhbGwgdGhlc2UgaXNzdWVzLiBVc2UgYXV0b2RldGVjdGlvbiBvZiBFQ0MgbW9kZSBv
bmx5IGluIGNhc2Ugd2hlbiBtb2RlCj4gd2FzIHJlYWxseSBub3Qgc3BlY2lmaWVkIGluIERUUyBm
aWxlIGJ5IGNoZWNraW5nIHRoYXQgZWNjIHZhbHVlIGlzIGludmFsaWQuCj4gU2V0IEhXIEVDQyBz
ZXR0aW5ncyBlaXRoZXIgd2hlbiBIVyBFQ0Mgd2FzIHNwZWNpZmllZCBpbiBEVFMgb3IgaXQgd2Fz
Cj4gYXV0b2RldGVjdGVkLiBBbmQgZG8gbm90IGZhaWwgd2hlbiBPTl9ESUUgbW9kZSBpcyBzZXQu
Cj4gCj4gRml4ZXM6IGY2NDI0YzIyYWEzNiAoIm10ZDogcmF3bmFuZDogZnNsX2VsYmM6IE1ha2Ug
U1cgRUNDIHdvcmsiKQo+IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5v
cmc+Cj4gUmV2aWV3ZWQtYnk6IE1hcmVrIEJlaMO6biA8a2FiZWxAa2VybmVsLm9yZz4KPiBSZXZp
ZXdlZC1ieTogTWFyZWsgQmVow7puIDxrYWJlbEBrZXJuZWwub3JnPgoKQXBwbGllZCB0byBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0
IG5hbmQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
