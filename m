Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FA9F43682
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKf6oVkJW2YtbPjn9YhuwnteATDY1TOVe5/6ROZkMJE=; b=uSVomvSzxWb0fO
	ZOH5Zg4ne3M5fuxxqOEB5WqHRNlbNfm0UHr4T/WN8jIZmwXXkirrb8nPrp2ztl/sDXMo6RlqTW0+r
	tzB9VFK1V1oVVs1fEbG8pRc9/fcDq7BjUk2rrT7orLUq3jP5Cfv9ryN3TsDY1LCtJx/CeVQFM5DG5
	mPhtXjNTgn3aQtamtMvn+u6OhjArg3z1NC171rVBTW7rt23A8eJ2WbqZtWydv2pGDRujuqzLlp9xX
	EaboIluZqTLSumSNxvMWtcecdHDOFv25aO1jKbIpoKx/N1y0Tdi1sgufkRlPT3wWDipLY2zfEUHD/
	6d2+ch4dNW+7DmY53Qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDetd-00000003i0r-0mu4;
	Fri, 17 Apr 2026 08:49:53 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDetZ-00000003i0Z-3w2l
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 08:49:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 69544C5C3D8;
	Fri, 17 Apr 2026 08:50:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 017E960497;
	Fri, 17 Apr 2026 08:49:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEBB21046097F;
	Fri, 17 Apr 2026 10:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776415784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sdYzpMdW6TeyWluJ9v0gzzSQwH1Y2RGPjPMFY/co9ss=;
	b=WHNGe9B1L7cjCtLZe03WYL7bSPH3qnjXUk2+3wELbu83Cj8+vnqXv2CimAIeK7TGom+41N
	IzgSTbWStnRla0cHVIuSfn4IY7mUvh8Mb9f5nG6ZsfZzy2O23KER0PqlKIsL9pn17/+S0J
	mAhlzJkeDgN/hOErM3QeDy1dDbfL30RGMrukmuE8gXn+1vbwnTNR4MyEojA6sdUVgtxNv3
	0FdKEboJs3Y+JzelM2d3a9v3EMb/+KGcxvASeuUKogosDZKqOVTHFyMWSQywCcVvs+YElO
	XZCDRUX1vsTpT7U7E37q0l+kh9NuzH/dB68RArtAbLfnlSwapF4uL/XNX0aXag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: tkuw584924@gmail.com
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
In-Reply-To: <20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com> (tkuw's
	message of "Fri, 17 Apr 2026 16:17:15 +0900")
References: <20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Apr 2026 10:49:39 +0200
Message-ID: <87cxzyc6os.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_014950_118083_E5F4C9E1 
X-CRM114-Status: UNSURE (   5.14  )
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

T24gMTcvMDQvMjAyNiBhdCAxNjoxNzoxNSArMDksIHRrdXc1ODQ5MjRAZ21haWwuY29tIHdyb3Rl
OgoKPiBGcm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+
Cj4KPiBOT19PUF9DSElQX0VSQVNFIGZsYWcgaXMgbm8gbG9uZ2VyIHVzZWQuCj4gUmVtb3ZlIGRl
ZmluaXRpb24gYW5kIHJlZmVyZW5jZXMgb2YgdGhlIGZsYWcgaW4gY29yZSBhbmQgZGVidWdmcy4K
Pgo+IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+
Cj4gU2lnbmVkLW9mZi1ieTogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5l
b24uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+CgpUaGFua3MgZm9yIHRoZSBjb21tZW50IGFib3V0IHRoZSBiaXRzIHJlbnVt
YmVyaW5nIE1pY2hhZWwsIEkgcHJlZmVyIHRoaXMKdmVyc2lvbiBpbmRlZWQuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
