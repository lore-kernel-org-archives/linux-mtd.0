Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E26C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MU5kDINfIlCPp6OPtJgzvNIxaHla1FN+gEqRBUv3TA=; b=RIA7ODaymd30mk
	bClUu2o/wDe5k28ZJatuOw9MOlUWnbfeV0ZKgq2Bw0M3E8frHCGtzFMS49GJ4R0Ew27ZnA8y9XqW+
	Z5LfrWItWF/AQ8sokrxIJJBZ2aUK5iZqcQWTT+BHm0ul9QostEa6u8ilq5YPwL4cNIdndqE6JwBIb
	JIHHuKMCBQ0ufDrhO/HoyLFFW0O17bZKqUumHEEBN0gzitTzE3A3aSXFdLNCFu11eQZbbPzg32KaC
	AcSEdXkuX7c3++ZHj8vgihMIfvwWO23Pt/9DY3y6yCLeU7FQ7Lym5UNv1gMkuRYE4OLz9xqpKaGQM
	cOXJ0Y0oy6vLaGJjOscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkA9-0000000CjQo-16Kn;
	Mon, 06 Jul 2026 14:19:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkA6-0000000CjQC-07m0
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:19:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 496CD4E40CB6;
	Mon,  6 Jul 2026 14:19:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DA68601A2;
	Mon,  6 Jul 2026 14:19:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A60E11BB988A;
	Mon,  6 Jul 2026 16:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783347543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vPaIdWhiKB+in0s3zD3ywJLDi+FkxnIdiGmCxYXW6Qg=;
	b=u00VJuxn4duj93NS4DLASw/a7JzOYh7yFJRViirKWVCgap6LnTbTYcrMiLAuqz+PaIvL0n
	RLEuVNtd7eRFJSk5u5BQvueA3G+kBPTPfXANvn+PrIjvxAyrbkAj7S1bOcRF8aK/Qe4yuO
	+7mEtXqEV8QL46j3/CfycoEKizGkBwQ9XFDWzn6eBQ26FdaDlJRh+YARSCLx/D6gg58+9Q
	2eLPtvk4EizQB8jcHT6TM/F+nJx5wTNq6e4djPLjJR8dsKziU4NZzthEJxmRMKC+ahDKKi
	HG5JaJ7Z70KXwKH1idzAiHbXkg53VLwea/hwygOQ8rv/5cA8d4VaGMa9exH0+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  linux-mtd@lists.infradead.org,  Cheng Ming
 Lin <chengminglin@mxic.com.tw>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/8] mtd: spi-nor: move spi_nor_post_bfpt_fixups()
 into sfdp
In-Reply-To: <20260703143003.1809579-6-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 3 Jul 2026 16:29:16 +0200")
References: <20260703143003.1809579-1-mwalle@kernel.org>
	<20260703143003.1809579-6-mwalle@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 16:18:59 +0200
Message-ID: <87a4s4kxpo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_071906_207492_012EEC4D 
X-CRM114-Status: UNSURE (   5.22  )
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

T24gMDMvMDcvMjAyNiBhdCAxNjoyOToxNiArMDIsIE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gTW92ZSBzcGlfbm9yX3Bvc3RfYmZwdF9maXh1cHMoKSBpbnRvIHRo
ZSBzZmRwIG1vZHVsZSBiZWNhdXNlIGl0J3MKPiByZWFsbHkgb25seSBuZWVkZWQgdGhlcmUuIFdo
aWxlIGF0IGl0LCBhZGQgc29tZSBkb2N1bWVudGF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+CgpJIGZlZWwgbGlrZSBpdCB3YXMgZmluZSB0
byBrZWVwIHRoaXMgaW4gdGhlIGNvcmUsIGJ1dCB0aGF0J3Mgb2theSB0bwptb3ZlIHNpbmNlIHRo
aXMgd2F5IHdlIGF2b2lkIHRoZSBleHBvcnQuCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
