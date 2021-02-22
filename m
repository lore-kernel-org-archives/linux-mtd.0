Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F9EC433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 22:39:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F068864F2A
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 22:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F068864F2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pGA2hOVRIDtY08veaU2NSTkjvF4NeGh/Z0vFpHHWdSk=; b=s2gkRvmCYwZDpFAshHskkK3No
	QPu8l5WuMKTDWPWUI3MDZOa5Hd1Rj1WeVKACd4ZmeXaq3uZ7PGkHv9eZ506qzQtURsSiEm5+wNK+A
	xR8Wr+rPNY3ea+eOCLsZoegmBSfs1Uu5cVDiOyqHK/fi6LNnaApDNhQcOsGstEpmDqv/N2+bfJ1x4
	NgE/6URhpL0ESHZGqDZ0p4k3S0YZomrg001abnNJCeMwQmjVB8yqdBGgSzdkXMsTsWbDpiK9cTwCw
	2ENtJUlrrEGtP5XNFB3B04zcaLCRZTEhqQ7V5rKaoY5VgqjHka2nM1gJr2kgRUjq9vNLTapu8YIyh
	qHTThUt7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEJqf-0007Xc-KS; Mon, 22 Feb 2021 22:38:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEJqd-0007X2-9L
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 22:38:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 05B5F627AFEE;
 Mon, 22 Feb 2021 23:38:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id VGjpXYRRgJAl; Mon, 22 Feb 2021 23:38:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id ABC1C608F45F;
 Mon, 22 Feb 2021 23:38:24 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U6dRHxIxmTpW; Mon, 22 Feb 2021 23:38:24 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 82E04627AFEE;
 Mon, 22 Feb 2021 23:38:24 +0100 (CET)
Date: Mon, 22 Feb 2021 23:38:24 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Tomas Winkler <tomas.winkler@intel.com>
Message-ID: <1279191970.19051.1614033504390.JavaMail.zimbra@nod.at>
In-Reply-To: <7601e7f0024c41fb9b454a3c50b02173@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <CAFLxGvwP5-O5DHQ07Fs_GnG12dsK24mer8LJfhz2z2UqW9e5cQ@mail.gmail.com>
 <cb20e706d494458a8957252eeacfb1da@intel.com>
 <7601e7f0024c41fb9b454a3c50b02173@intel.com>
Subject: Re: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: drm/i915/spi: discrete graphics internal spi
Thread-Index: AQHXBJBTlGMG4b5GwU+w3NO1EU5QQapbRLqAgAC+HMCABjNiUB7bF+50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_173835_443112_1FE16FD0 
X-CRM114-Status: UNSURE (   7.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiA+IEknbSBub3Qgc3VyZSB3aGV0aGVy
IHdlIHdhbnQgdG8gdGFrZSB0aGF0IHBhdGguCj4gCj4gSGkgUmljaGFyZCBpcyB0aGVyZSBhbnkg
d2F5IHdlIGNhbiB0cnkgdG8gdW5jbHV0dGVyIHRoaXMgPwoKT2YgY291cnNlIHRoZXJlIGlzIGEg
d2F5LiA6LSkKWW91ciB1c2UtY2FzZSByZWFsbHkgc2VlbXMgdG8gYmUgc3BlY2lhbCBhbmQgTVRE
IG5lZWRzIGFuIGltcHJvdmVtZW50LgpNaXF1ZWwsIFZpZ25lc2ggYW5kIEkganVzdCBuZWVkIHRv
IGNoZWNrIG1vcmUgaW50ZXJuYWxzIGFuZCBjb3JuZXIgY2FzZXMgaW4gTVRELgpXaXRoIHNvbWUg
bHVjayB5b3VyIHBhdGNoIGNhbiBiZSB1c2VkIGFzLWlzIHdpdGggc29tZSBtaW5vciBhZGp1c3Rt
ZW50cyBvbiB0b3AuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
