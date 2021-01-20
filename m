Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D11BC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:29:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F61E23358
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F61E23358
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o4ZNTVZouOo0LzAZmZ4TzduxsJZCBv5Hq0VerAgKKTA=; b=UWnj3pj+/0PIriYkHvgJlReF/
	/pnZ1diMhDVpZMfdIrO1Wya5tIybVzGaqdkMSvBy3J/8ud3wE+prfdX/XxU+wbA3SjK5STR6padNp
	JKE+yjJH/7k7+4CSWdxcAt/52Z0uxUT3jEdLrndx9HzLpVw5lI9y0AhXnB2U1zgOQoMIix7/g5SNx
	WvpS0dN4NjxgL1z4Xtzl8UaL7Fkq6AtYRQ1aeLd4yNytl4mbnT7jFXSNhWdfZnVStKwPgQGSrXuOi
	3//JecCrkMtPoop0JXSQIyr1tHbPf+IxEM8sIYnkmNgSF/hnhdeW5PNflYJqJpomezOoHPCv7c5z8
	I5nXku4bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2FQ5-0005iV-7X; Wed, 20 Jan 2021 15:29:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2FPz-0005h6-QJ; Wed, 20 Jan 2021 15:29:13 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 936A0FF80B;
 Wed, 20 Jan 2021 15:29:05 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:29:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] nand: raw: remove tango driver
Message-ID: <20210120162904.1a1588bf@xps13>
In-Reply-To: <20210120150555.1610132-1-arnd@kernel.org>
References: <20210120150555.1610132-1-arnd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_102911_949706_93380B35 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Mans Rullgard <mans@mansr.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCkFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGUgb24gV2VkLCAy
MCBKYW4gMjAyMSAxNjowNToyNgorMDEwMDoKCj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBh
cm5kYi5kZT4KPiAKPiBUaGUgdGFuZ28gcGxhdGZvcm0gaXMgZ2V0dGluZyByZW1vdmVkLCBzbyB0
aGUgZHJpdmVyIGlzIG5vCj4gbG9uZ2VyIG5lZWRlZC4KPiAKPiBDYzogTWFyYyBHb256YWxleiA8
bWFyYy53LmdvbnphbGV6QGZyZWUuZnI+Cj4gQ2M6IE1hbnMgUnVsbGdhcmQgPG1hbnNAbWFuc3Iu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpJIGRp
ZG4ndCBrbm93LiBJJ2xsIGp1c3QgZml4IHRoZSB0aXRsZSB3aGVuIGFwcGx5aW5nIHRvIHNvbWV0
aGluZyBsaWtlCgoJbXRkOiByYXduYW5kOiB0YW5nbzogUmVtb3ZlIHRoZSBkcml2ZXIKCklmIHlv
dSBkb24ndCBtaW5kLgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
