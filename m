Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D69CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 10:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iqfh29ZcSnPRzCUG2NO29FnhfrzY833tIvAVpKrpwYM=; b=vRYp+NZat3T4Sy
	qqkx/loHcZEZFkJthfMwD48c/4n80X8csQlz5wHD4SYg12ZI2LGIWIV/HeU6eT1AGpPPEaV9vRgQt
	qF6u6U+jOMPeP3stJMn0KBNe/bKUSKbP2tLyQl9k6+KB4SR3w5LK7NUBXW5My5Pl2w9cQhJpRIDQV
	8rc1otLXMA9vPwFJTMfqrLk+5nZElsFxMWibT/3+X6CWkVDZNq6FjwXT8xwT376BSAfRouo7O5HkP
	mV6DwmsPqkZD6UErHQqXPy9jLgZH9k872tlowf1sPvaM/8YOM+9nhL33oEVxTxk242mW9Cx9C93a9
	WFJ+ffJHU/djgGlRSzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwt7-0000000Fv7V-3FhT;
	Mon, 17 Nov 2025 10:55:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwt4-0000000Fv5g-0iUf
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 10:55:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ADC284E41735;
	Mon, 17 Nov 2025 10:55:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A93D606B9;
	Mon, 17 Nov 2025 10:55:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C10AA10371D22;
	Mon, 17 Nov 2025 11:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763376907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8QyzR7iq+ODR7vgeIZqYkU/02HH1m1IiL2UuTrM19qI=;
	b=Mh+MM3Iat+uR+piX6fvbceQx19CgVzpOt5DEMOsf8diGqwvaXamIQdVTCrqYvmP7JnLgob
	DWKm2k/Kg+4GTEB2SLVXi4+ad2uuIdYnOK1zKlt6gGp/O6nXUdeaIHD5OqAIRYEpkalOgg
	Hbi/Xzhp8IMv5dMmWw6lKvAkiyLg5z8EzqYcThcAD6Jpqjm30ty+ZWJf8+Iev0rCboE9WF
	8S1AC0O1zjM/UNuFy10tG/NuwgU+r+b+eTdkTDcHo4NyRWqwrVCLeRI7bHmXXE6jrmE66D
	urjo31tZoscn+ktguAz3cmmDgcGySo+O629mIGBX33eURSIrDYCB4QBriyaKyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251104100842.369-1-vulab@iscas.ac.cn>
References: <20251104100842.369-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: Convert to use
 devm_gpiod_get_optional()
Message-Id: <176337690443.1740915.2027310433419117418.b4-ty@bootlin.com>
Date: Mon, 17 Nov 2025 11:55:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_025510_343979_EB3D793E 
X-CRM114-Status: UNSURE (   7.97  )
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

T24gVHVlLCAwNCBOb3YgMjAyNSAxODowODo0MSArMDgwMCwgSGFvdGlhbiBaaGFuZyB3cm90ZToK
PiBUaGUgaW5pdGlhbCBmaXggZm9yIGEgR1BJTyBkZXNjcmlwdG9yIGxlYWsgYWRkZWQgbWFudWFs
IGdwaW9kX3B1dCgpCj4gY2FsbHMgaW4gdGhlIGVycm9yIHBhdGggYW5kIHJlbW92ZSBmdW5jdGlv
bi4KPiAKPiBUaGlzIGZvbGxvdy11cCBwYXRjaCBpbXByb3ZlcyB1cG9uIHRoZSBmaXggYnkgc3dp
dGNoaW5nIHRvIHRoZQo+IHJlc291cmNlLW1hbmFnZWQgZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwo
KSBBUEkuCj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8x
XSBtdGQ6IHJhd25hbmQ6IGxwYzMyeHhfc2xjOiBDb252ZXJ0IHRvIHVzZSBkZXZtX2dwaW9kX2dl
dF9vcHRpb25hbCgpCiAgICAgIGNvbW1pdDogMWYzZGNmZTVmY2Y1NzczOWI0YTgyODExYzEyZTU1
YzQ4ZDc5NGY4NgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4Lmdp
dCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90
IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
