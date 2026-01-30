Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB9AE6BF13
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrOb1v68iIAYl7rV/PE9yzH8XPkShUELDz+SDcI0JpA=; b=uCbor4sR4F1SKo
	doYOTrmnEdf/xWlGxFNRtQDb6UKBUGOikm20Ibcmd1rhANH2s7jLND6P/0FnBrIsaMOb7tNRSGZEs
	htA7oyvBRU0/McZWXA/sOm/XPJQUnY3E453YJc7JOq3h033wKD/OTgjlhO/WbYy8vYbTheGlyEKIa
	A+LwBTy0UV09V/jDlBHvH+HTV4QjLoa7jBvpwvD1s1WlWiuSsZD9JPVnFWfpa7e5OBcQmXG8hDRXh
	V1dtSsXigm6iDLsY5JP8nfpGRU8FOM4U+G0QRHEDKdVv9islGYm+/mo4fuuS/uRODHj3djr9s4q42
	k8ArvZYkj77oUcwlGjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpMG-00000001a7h-3M7i;
	Fri, 30 Jan 2026 14:20:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpMD-00000001a7M-1fS6
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 14:20:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A3A14E4233D;
	Fri, 30 Jan 2026 14:20:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF03E6075A;
	Fri, 30 Jan 2026 14:20:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93EB4119A885C;
	Fri, 30 Jan 2026 15:20:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769782818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oRQAtNIzxoPksFTT2fjEqH1J3ePFfDAyOrl0jB+G0Gw=;
	b=ow7O9tasVDkU9nX7DlLoHRuKffIm7yj3tKSbievy01qCEatNojOVyePA7Mj3HzI14P7hCe
	fdooG/J3fQzOYkxt6PRArwur+vLQSw2hyewIz5FvZRERmvG6NjaT9WypYX2ryBsu7I2N0O
	sEOilWBwPOOTGLFXedCGYi0VxQEJTyN+UYrg5fNFBCSNZWE03SIS7pIlaEaAFv09bH2b+a
	AcE7hmUBTM5qxEsMdZOpBhK1x9rrcUW5Lyb4M1GPoyRYkG0f7eJTccEvu0cHBD0Ltw98i9
	UfTT7oQB2RLupzPepXCnyLA090slaC5WBEf/MeeN54XgnkJ5tuSYOiIWgbMipA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, 
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David LaPorte <dalaport@amazon.com>
Cc: Gunnar Kudrjavets <gunnarku@amazon.com>
In-Reply-To: <20260130013334.72135-1-dalaport@amazon.com>
References: <20260130013334.72135-1-dalaport@amazon.com>
Subject: Re: [PATCH v2] mtd: spinand: Disable continuous read during probe
Message-Id: <176978280934.304421.7518416316302221266.b4-ty@bootlin.com>
Date: Fri, 30 Jan 2026 15:20:09 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_062021_590752_EF384079 
X-CRM114-Status: GOOD (  12.15  )
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

T24gVGh1LCAyOSBKYW4gMjAyNiAxNzozMzoyMiAtMDgwMCwgRGF2aWQgTGFQb3J0ZSB3cm90ZToK
PiBNYWNyb25peCBzZXJpYWwgTkFORCBkZXZpY2VzIHdpdGggY29udGludW91cyByZWFkIHN1cHBv
cnQgZG8gbm90Cj4gY2xlYXIgdGhlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgb24gc29mdCByZXNl
dCBhbmQgbGFjayBhIGhhcmR3YXJlCj4gcmVzZXQgcGluLiBXaGVuIGNvbnRpbnVvdXMgcmVhZCBp
cyBpbnRlcnJ1cHRlZCAoZS5nLiwgZHVyaW5nIHJlYm9vdCksCj4gdGhlIGZlYXR1cmUgcmVtYWlu
cyBlbmFibGVkIGF0IHRoZSBkZXZpY2UgbGV2ZWwuCj4gCj4gV2l0aCBjb250aW51b3VzIHJlYWQg
ZW5hYmxlZCwgdGhlIE9PQiBhcmVhIGJlY29tZXMgaW5hY2Nlc3NpYmxlIGFuZAo+IGFsbCByZWFk
cyBhcmUgaW5zdGVhZCBkaXJlY3RlZCB0byB0aGUgbWFpbiBhcmVhLiBBcyBhIHJlc3VsdCwgZHVy
aW5nCj4gcGFydGl0aW9uIGFsbG9jYXRpb24gYXMgcGFydCBvZiBNVEQgZGV2aWNlIHJlZ2lzdHJh
dGlvbiwgdGhlIGZpcnN0IHR3bwo+IGJ5dGVzIG9mIHRoZSBtYWluIGFyZWEgZm9yIHRoZSBtYXN0
ZXIgYmxvY2sgYXJlIHJlYWQgYW5kIGluZGljYXRlIHRoYXQKPiB0aGUgYmxvY2sgaXMgYmFkLiBU
aGlzIHByb2Nlc3MgcmVwZWF0cyBmb3IgZXZlcnkgc3Vic2VxdWVudCBibG9jayBmb3IKPiB0aGUg
cGFydGl0aW9uLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEv
MV0gbXRkOiBzcGluYW5kOiBEaXNhYmxlIGNvbnRpbnVvdXMgcmVhZCBkdXJpbmcgcHJvYmUKICAg
ICAgY29tbWl0OiBkNDcwMzRjODQwYzM5NjVjYzUxNTcyZDY5ZWNmNjM0YzkwOGU4ZmFjCgpQYXRj
aGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBh
cnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRo
ZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
