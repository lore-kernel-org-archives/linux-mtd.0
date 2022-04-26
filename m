Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02FCC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZRAQMjLxOyAoIek9hXAwcI3qqnZSdPzEleA0AQetp8=; b=uTloz5bdDAcS4c
	LecYGJ/LPVsz7pkjh2kWCZLmQwhk657oAcJc6gKdZa/Y3wa84vK9CFbUJgXSeS+MD/8qsb8DuHmF9
	39ad45j6mwBvOYVXl7gf3vBHgUhl6F8M6nMCQAVY4D19hh/FIEIG/BFQMUR5rGcztXiizxMibYzT8
	EW1OIz/batFNuXiIsF8LVDH7SwqsNleJQux9953RoDUl2jUIPUVYanRq4wvy1zJxTFBb79iyhk44B
	A9TF6DiQuwKcHW+zRMqDjTge4LvM1ko9sdDHtVVgsJdec/k9PQRlBQG99lQMH/tO0Xd1U95rCwmEw
	3upeIe7mLVDI6L3gDA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFlF-00D0d4-R0; Tue, 26 Apr 2022 07:37:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFl6-00D0XH-Vy
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 07:37:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A2B15240005;
 Tue, 26 Apr 2022 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650958633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0qBOgNyh8voQ1Cq8xvcGs0VWNzEpgJVmBmlg1kmNXM=;
 b=fjWUZ6VGHzQIycm0+2Q6HwF2JSXWP2MnpyxPKkWCQmNAmDmms8EDOMQYKLD+o3j8hB+qj3
 viy24v8Q49I3/yOkYS5VvP5VTy3Zi/t1eJNc2hCqJWjpyCTHoaqfBz7iYl4MHF2M/HBUIx
 bnyTs3j8GKcW/fLYnvWvNl35tkTnIH/+xF+D3AXL3QQl/4oW1V65Zs+gvlpGn9uraLQ+OQ
 UDaMqAYchPF3NQfK//ot9KlwVvS2mYsJmCF364GYC7bSta7ctfaY9KK3yZ8HJbHNPOEEJs
 ZVUuOc+vaTnfXgkcQ238FhAExM09m3aJAPJm20t2D+ofJrVUpeVIMBPUtA/HCg==
Date: Tue, 26 Apr 2022 09:37:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tom Rini
 <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso
 <dave@stgolabs.net>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 4/5] mtd_blkdevs: scan partitions on mtdblock if
 FIT_PARTITION is set
Message-ID: <20220426093710.6ec48b5e@xps13>
In-Reply-To: <Yma3ck/hygQ0badz@makrotopia.org>
References: <Yma3ck/hygQ0badz@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_003717_245615_013412E7 
X-CRM114-Status: GOOD (  13.81  )
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

SGkgRGFuaWVsLAoKZGFuaWVsQG1ha3JvdG9waWEub3JnIHdyb3RlIG9uIE1vbiwgMjUgQXByIDIw
MjIgMTY6MDA6MDIgKzAxMDA6Cgo+IEVuYWJsZSBwYXJ0aXRpb24gcGFyc2VycyBvbiBwbGFpbiBt
dGRibG9jayBkZXZpY2VzIGluIGNhc2Ugb2YKPiBDT05GSUdfRklUX1BBUlRJVElPTiBiZWluZyBz
ZWxlY3RlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3Rv
cGlhLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyB8IDIgKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9tdGRfYmxrZGV2cy5jIGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+IGluZGV4IGY3MzE3
MjExMTQ2NTUwLi5lOTc1OWM0MTgyZjhkNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRf
YmxrZGV2cy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+IEBAIC0zNTksNyAr
MzU5LDkgQEAgaW50IGFkZF9tdGRfYmxrdHJhbnNfZGV2KHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2
ICpuZXcpCj4gIAl9IGVsc2Ugewo+ICAJCXNucHJpbnRmKGdkLT5kaXNrX25hbWUsIHNpemVvZihn
ZC0+ZGlza19uYW1lKSwKPiAgCQkJICIlcyVkIiwgdHItPm5hbWUsIG5ldy0+ZGV2bnVtKTsKPiAr
I2lmbmRlZiBDT05GSUdfRklUX1BBUlRJVElPTgoKQ2FuIHdlIHVzZSBhIHJlZ3VsYXIgJ2lmJyBo
ZXJlPwoKPiAgCQlnZC0+ZmxhZ3MgfD0gR0VOSERfRkxfTk9fUEFSVDsKPiArI2VuZGlmCj4gIAl9
Cj4gIAo+ICAJc2V0X2NhcGFjaXR5KGdkLCAoKHU2NCluZXctPnNpemUgKiB0ci0+Ymxrc2l6ZSkg
Pj4gOSk7CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
