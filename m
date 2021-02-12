Return-Path: <SRS0=iZ7+=HO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9AFC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 21:35:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A1764E31
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 21:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A1764E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eOyMUWAd204Bb/hIxbdfXrM8TLdsCdJHxWUfaG+DQg0=; b=H0H3DSEkZdpHyUseCNUNH3Efg
	HG+Zox6yXNGPWvmzrm1f5G47clQKS5ujCvVMwWL2+GE1bwv6vawzlwkDOnLxzvfB+Lp3RVbeA1CZS
	PjhrS0qWueJp+//C/nS+OeWXm798H5vi9Y1krbGbuXvNsXtlKRin9RpwVZZj17qPJzYaDdGLXwbLW
	k/b675zGMHWZEpzTgjBSLNVPyQHD9GCLnH1/6bpl355DqM5NT/DqPsZZ/0g6sGnCxILywvCrMH/SI
	E6HCyGwQE0W36orcxDUEmI4a7wvpB5wcsy08OkSjUyz8v7OEpTkNha1A74H6ppK7aEnwfy47pfLLj
	DXHPyXCig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAg4z-0004p1-UX; Fri, 12 Feb 2021 21:34:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAg4x-0004od-GN
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2021 21:34:20 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 06EBA6074007;
 Fri, 12 Feb 2021 22:34:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JxTK92jQMiKS; Fri, 12 Feb 2021 22:34:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B61FF6074009;
 Fri, 12 Feb 2021 22:34:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PiaCTGFa5zf1; Fri, 12 Feb 2021 22:34:15 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 96E216074007;
 Fri, 12 Feb 2021 22:34:15 +0100 (CET)
Date: Fri, 12 Feb 2021 22:34:15 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <2022320545.389724.1613165655531.JavaMail.zimbra@nod.at>
In-Reply-To: <CAHp75VfwD25Vfb_81eoZDG=GktSdiROtg7=2tPMDMV8k2iqdag@mail.gmail.com>
References: <20210202124838.30805-1-jbe@pengutronix.de>
 <CAHp75VfwD25Vfb_81eoZDG=GktSdiROtg7=2tPMDMV8k2iqdag@mail.gmail.com>
Subject: Re: [PATCH] fs: ubifs: set s_uuid in super block to support ima/evm
 uuid options
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: set s_uuid in super block to support ima/evm uuid options
Thread-Index: UM/rSZ/B5fIVI3kknwppOQ4RboI4wA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_163419_654326_8DF1FC08 
X-CRM114-Status: UNSURE (   5.01  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Juergen Borleis <jbe@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>, kernel <kernel@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW5keSwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gKyBtZW1jcHkoJnNiLT5z
X3V1aWQsICZjLT51dWlkLCBzaXplb2YoYy0+Cj4gU2hvdWxkbuKAmXQgaXQgYmUgYGltcG9ydF91
dWlkKClgPwoKSG1tLCBJIGRpZG4ndCBrbm93IHRoYXQgaGVscGVyLgpUaGUgb25seSB1c2VyIGlu
IGZzLyBzZWVtcyB0byBiZSB6b25lZnMsIGFsbCBvdGhlciBmaWxlc3lzdGVtcyBkbyBhIHBsYWlu
IG1lbWNweSgpLgoKRG8geW91IHdhbnQgbWUgZG8gYSBwYXRjaCB0aGF0IGNvbnZlcnRzIGFsbCB1
c2VycyBpbiBmcy8gdG8gaW1wb3J0X3V1aWQoKT8KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
