Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89CAC43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zU7VTy+S/T6pK4z1C0VCtbZTfeM1tIVu4GxolZuxSc=; b=1RONCHEvSqRFm+
	aLm07X1rpYmDRsbhuXvz/I1jV7XHmNmdBRwnrC5Tt/xVOBSgSbBUrbrN9D88Eewowawdi4ZRxu+p3
	9JjryJQnEVJedpRms7kMTdKc8X/LXBJEqnLDYMtNEJAYI8TnNL6dxFCDiFmax12CDga1JgMkFzN+v
	0xsVg4kp5N+RntUMg9sL6CNIhQigyfrfLF9WDIBfPHoGeYJ+hc4gi7DoA1S4ThZGbJ8olNtKLI2/R
	HhhlYmvfHjhj6OFI1BRfSoxJJsrbjpThC2Jp9qfIPZLFKWnImjn2S85Zw598mAvYIj96d7kSIypfa
	tzpBEqa7Bwd1RdxeuYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckl-0000000BbqK-3bv5;
	Mon, 06 Jul 2026 06:24:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckh-0000000Bbno-15bx
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C36364E40CA4
	for <linux-mtd@lists.infradead.org>; Mon,  6 Jul 2026 06:24:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98CB1601A2;
	Mon,  6 Jul 2026 06:24:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95BEF11BB9890;
	Mon,  6 Jul 2026 08:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tEijErEcDYR2Y47tUSZM8bkBgoJAXM77WhYqY/Ueud8=;
	b=CukFvFhZphimsQnpqBeBgLba84qeB6QRnj0HJzAP89DaWGmyUqBM+UtoI1tKOyF3tnqWj4
	npMGlh6XfcHXOsW5icm9j1NTonucolBnT1tkaCUzV5AOyXdeyq/9gro3T3TeZxnar27i39
	nQow++evmiH/OgHdjUNH5BcTvhKD0IIw10bp7pdwAIxKpsAvAZHjd/Yj5HIcOjZRUJSwq2
	jVD+xO9KBF/XNBYJthgULJmg5LvH7W8lENdlhQgnZrqaHDub8lMzSH7VakBYPlGQw9IWBg
	9pJcNAlNqDW13D/OoD9oQL2qqFUTgUWl4XNIdeaR6m3O59ABhPK67XL8Q4Truw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, alexander.usyskin@intel.com, 
 tomas.winkler@intel.com, Xue Lei <Xue.Lei@windriver.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701121042.3333247-1-Xue.Lei@windriver.com>
References: <20260701121042.3333247-1-Xue.Lei@windriver.com>
Subject: Re: [PATCH] mtd: fix double free and WARN_ON in add_mtd_device()
 error paths
Message-Id: <178331905469.868671.11248571583983897824.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232425_493898_921CB3E6 
X-CRM114-Status: UNSURE (   6.52  )
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

T24gV2VkLCAwMSBKdWwgMjAyNiAyMDoxMDo0MiArMDgwMCwgWHVlIExlaSB3cm90ZToKPiBXaGVu
IGRldmljZV9yZWdpc3RlcigpIG9yIG10ZF9udm1lbV9hZGQoKSBmYWlscyBpbnNpZGUKPiBhZGRf
bXRkX2RldmljZSgpIGZvciBhIHBhcnRpdGlvbiwgdGhlIGVycm9yIGhhbmRsaW5nIHRyaWdnZXJz
Cj4gbXRkX3JlbGVhc2UoKSB2aWEgcHV0X2RldmljZSgpIG9yIGRldmljZV91bnJlZ2lzdGVyKCku
IG10ZF9yZWxlYXNlKCkKPiBjYWxscyByZWxlYXNlX210ZF9wYXJ0aXRpb24oKSB3aGljaCBmcmVl
cyB0aGUgbXRkX2luZm8gc3RydWN0dXJlLgo+IEhvd2V2ZXIsIGNhbGxlcnMgc3VjaCBhcyBtdGRf
YWRkX3BhcnRpdGlvbigpIGFuZCBhZGRfbXRkX3BhcnRpdGlvbnMoKQo+IGFsc28gY2FsbCBmcmVl
X3BhcnRpdGlvbigpIGluIHRoZWlyIGVycm9yIHBhdGhzLCByZXN1bHRpbmcgaW4gYSBkb3VibGUK
PiBmcmVlLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0g
bXRkOiBmaXggZG91YmxlIGZyZWUgYW5kIFdBUk5fT04gaW4gYWRkX210ZF9kZXZpY2UoKSBlcnJv
ciBwYXRocwogICAgICBjb21taXQ6IDlkNGFmNzQ2YWY4Y2UyN2VlZmMyMzM4YjJmZWFhMWUwMWYy
OGI2YzMKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5k
IHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21w
bGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
