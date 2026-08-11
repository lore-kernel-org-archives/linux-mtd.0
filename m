Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12FBC5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEPHoSod+63wT7I+wBllGnTfh2szeBsrcqihbn9IZyg=; b=mBRHoPA6G9FcOj
	CfzuveEa1OGPW0KFhz+wTnUKu6KhREuDCxxDqxymPV/PbH+PxGvHhc1Q9tXpDvrnukYoqR3rM15ou
	BYIRotLmSbjQ/i1P4kGAJH5wMypL7AbSQfNAJoAOj3tx5ZoqjxXm0SvIT3OFPrph1R+hMYWKYJT/B
	+tGMnB6qZuZcKa7yxjy5Ht8uH60TQluH7G6MMBGM4KuFogIgTna679GEQ+zr8/uE7Szh2UuqCbaFN
	dFsNOED9ro8cRsrjSMu99TjQfxbyaM508mzz09nFBqwJAjfaOas9xrrto2zAo+VgKCJyZELRQsgUB
	+dbx+ghEa2t1FbFo8LEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpGY-0000000EU3M-3s7F;
	Tue, 11 Aug 2026 16:23:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpGW-0000000EU2n-1SnG
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 16:23:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 51CC54E411BC;
	Tue, 11 Aug 2026 16:23:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17E7C6033C;
	Tue, 11 Aug 2026 16:23:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6242A11C48FEB;
	Tue, 11 Aug 2026 18:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786465420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qa4t5IE4Xx3/BJY0CdbVYY/v7tG5SbryWMMHw3QjT28=;
	b=LPMGfxdaIU9CAefowriYT5sG8jnsx+5qhvKXO9lcP/Hv5pKbg4htUDec211rz07QpHx/Ud
	/7UTsHDlrrNaT1qZ5sYnuhZPa4JTT/D2y6YJI2K0ateIJzZz7E4rXWA7tSgnlM6jvQH1Pc
	8VWTzTqkxS5Ri6NWxqw92xCdU3E62Um4TeC/ebl+krKA1S9ORcly5FRr3/zd+70NWlPF5X
	9v4cnJq7+FgY+iGOYisdLnLIw+NlUF3Y9PskqCYXQrO/d4X5j2hUb7OjVtcUiDLuKCyily
	DAz1aw84smeHKrrnOD2SZF7yfL51VSevpWy3HUQsCZY6JvwSEmRpKfiiQFXsXw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Frieder Schrempf <frieder.schrempf@kontron.de>,  stable@vger.kernel.org,
  Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,  David LaPorte
 <dalaport@amazon.com>,  Gabor Juhos <j4g8y7@gmail.com>,  Mark Brown
 <broonie@kernel.org>,  Pratyush Yadav <pratyush@kernel.org>,  Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH 6.12.y 0/3] Backport fixes for SPI NAND on i.MX6UL
In-Reply-To: <20260811161342.533280-1-frieder@fris.de> (Frieder Schrempf's
	message of "Tue, 11 Aug 2026 18:13:35 +0200")
References: <20260811161342.533280-1-frieder@fris.de>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 11 Aug 2026 18:23:36 +0200
Message-ID: <87zeysmxrr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_092348_552088_43755308 
X-CRM114-Status: UNSURE (   6.81  )
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

Cj4gVGhpcyBzZXJpZXMgY29udGFpbnMgdGhlc2UgZml4ZXMgcGlja2VkIGZyb20gbWFpbmxpbmUs
IGFwcGx5aW5nIHRvIHN0YWJsZSA2LjEyCj4gY2xlYW5seS4KPgo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IE1pa2hhaWwgS3NoZXZldHNraXkgPG1pa2hhaWwua3NoZXZldHNraXlA
aW9wc3lzLmV1Pgo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Cj4gTWlraGFpbCBLc2hldmV0
c2tpeSAoMyk6Cj4gICBtdGQ6IHNwaW5hbmQ6IGZpeCBkaXJlY3QgbWFwcGluZyBjcmVhdGlvbiBz
aXplcwo+ICAgbXRkOiBzcGluYW5kOiB0cnkgYSByZWd1bGFyIGRpcm1hcCBpZiBjcmVhdGluZyBh
IGRpcm1hcCBmb3IgY29udGludW91cwo+ICAgICByZWFkaW5nIGZhaWxzCj4gICBtdGQ6IHNwaW5h
bmQ6IHJlcGVhdCByZWFkaW5nIGluIHJlZ3VsYXIgbW9kZSBpZiBjb250aW51b3VzIHJlYWRpbmcK
PiAgICAgZmFpbHMKPgo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCA3NCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzIGZvciB0aGUgYmFja3BvcnRzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
