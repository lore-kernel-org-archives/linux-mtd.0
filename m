Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699EFC77B73
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Apr 2023 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f/RoEEeKIgtwofLvKALONJSrpXm7aa7KBJNcggucIac=; b=BHiaH8Ln8Ivup4iVXdkMqZj7Qc
	JzBNG4pL4o8x7Jh38oS4YwMogFgjsmBxmZRyrsQfaGTcwWJDBKGdQtcS05Ushq3/TlFHnrn7c9wsw
	vb9LV84tNMnyRiCmZI84eV69L6PU98gh+2em9wmbgkkwo86iLYHfBbCEzF+7j6aJGkwGYA4fZnc8y
	y5XsieCi79gVtrUI6S/YHp+kLqcagPYrMA9Cwx5m5DhIRumgMi4uNl5OiFstt50+/Hw7uPFSDKOmW
	27jSrABtN27oJDNqET37rVezDoZ6T1wFsoCmv+7YILg1QDwfl5Ln+AkFt2ZyylUyOCkMUhGqBHzRG
	9y0emfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYA8-008eLU-1U;
	Thu, 20 Apr 2023 17:33:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYA4-008eKI-1q
	for linux-mtd@lists.infradead.org;
	Thu, 20 Apr 2023 17:33:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 12C8664551D0;
	Thu, 20 Apr 2023 19:33:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id jA3v9_EJX3hK; Thu, 20 Apr 2023 19:33:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A6C3C63CC166;
	Thu, 20 Apr 2023 19:33:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ILxeHMeUlP07; Thu, 20 Apr 2023 19:33:19 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 88AEB64551D0;
	Thu, 20 Apr 2023 19:33:19 +0200 (CEST)
Date: Thu, 20 Apr 2023 19:33:19 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Yu Hao <yhao016@ucr.edu>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <977347543.226888.1682011999468.JavaMail.zimbra@nod.at>
In-Reply-To: <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com> <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com> <687864524.118195.1681799447034.JavaMail.zimbra@nod.at> <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com> <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: divide error in ubi_attach_mtd_dev
Thread-Index: HhyYkKa9UL/icxFryd8ZleAEcsQTSA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_103336_787006_ACEA6466 
X-CRM114-Status: UNSURE (   4.41  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFRoZSBrZXJuZWwgaXMgaW4gcWVtdS4g
V2UgZmluZCB0aGF0IHRoZSBgbXRkYCBpcyBmcm9tCj4gYG10ZCA9IGdldF9tdGRfZGV2aWNlKE5V
TEwsIHJlcS5tdGRfbnVtKTtgIGluIGZ1bmN0aW9uIGBjdHJsX2NkZXZfaW9jdGxgLgo+IEFuZCB3
ZSBhcmUgc3RpbGwgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCBNVEQgaXMuCgpDYW4geW91IHBs
ZWFzZSBzaGFyZSB0aGUgcWVtdSBjb21tYW5kIGxpbmU/CgpXaXRoaW4gTGludXggeW91IGNhbiBx
dWVyeSAvcHJvYy9tdGQgb3IgL3N5cy9jbGFzcy9tdGQvCnRvIGdldCBpbmZvcyBhYm91dCB0aGUg
TVREIGluIHF1ZXN0aW9uLgoKVGhhbmtzLAovL3JpY2hhcmQKIAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
