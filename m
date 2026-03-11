Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BA51125847
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbmxyA5EG8b8GPvtgXQK5HIt2kc+9F/ZR89ZfyW3Dz8=; b=pvLbZ8dgL1LVlG
	Bas9j/4ilLVlhvn5W93NcSWBGEFOAS69FOlAmK9pYYu4vV/ek5NCqBpOpjfuPrY2EG+tiTkLFeHzz
	VVVYUCVdW5F4WnaU/v3V9isHk678ucdXrmeN691oQBaTlpZhs547Go4OK9cIb/XxKQkD5N+z5zWOF
	Jcuew8UFmWufIIZxnlWuRELo9XvvtXKEoyugpV0Cy1JCEu+8Hby5+KU4xhWbBZED0bAxgzLVLQD9x
	Ptp/yfSt9l19zWJj36qMi5M/9iVY4efTZOscF1Vt7xjhGGkvqjbpRWnlTs5jHcROzSKQ9XuSYqfN8
	0lz8J3kxwW2DrvoloFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRU-0000000Bog2-2xCq;
	Wed, 11 Mar 2026 15:25:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRR-0000000BofQ-2rGh
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:25:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FA0E1A2D8E;
	Wed, 11 Mar 2026 15:25:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C3B760004;
	Wed, 11 Mar 2026 15:25:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6474410369CF8;
	Wed, 11 Mar 2026 16:25:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773242741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gg9rHNvs+kF10RfiC6NY/l+MuYcFWIysQQNikiqZDyU=;
	b=JIfgR4IsJsYE8YmmB8Yur8RQZbUpxVEoTFylrHcanXfyASll5N4P06dIkP2jp1SO1Tmb0m
	3iWr5GOXKX2CQSNmKEAiKbL9wRyHJ9Yp6gurbf5+QmDn/4m5vPf6k6K6k5+uV2hDlKoF4g
	KmLoYo36jLENkHGPlsM4DRgAePZjG4Y2TKyPEZ3+ID88/Zk27PU44rUPs6berRCmonXUNW
	wl8WmjPJ/jVThIu6LCzTFGWIaxDDUOV0xMbYAzcDci31GPYhN8G3C+k0x8hY+oStFsgjHS
	Dp92Z7PR7uirm74iBR8aP9iXHC00OCg/p/3tNu6ElLMNh9l0XGWJHJOzcbIZ2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260225162406.3815267-1-andriy.shevchenko@linux.intel.com>
References: <20260225162406.3815267-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] mtd: physmap: physmap-bt1-rom: Remove
 not-going-to-be-supported code for Baikal SoC
Message-Id: <177324273331.685435.6326734190351896403.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:25:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082545_853440_F16F82E3 
X-CRM114-Status: UNSURE (   7.18  )
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

T24gV2VkLCAyNSBGZWIgMjAyNiAxNzoyMzozNCArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+IEFzIG5vdGljZWQgaW4gdGhlIGRpc2N1c3Npb24gWzFdIHRoZSBCYWlrYWwgU29DIGFuZCBw
bGF0Zm9ybXMKPiBhcmUgbm90IGdvaW5nIHRvIGJlIGZpbmFsaXplZCwgaGVuY2UgcmVtb3ZlIHN0
YWxlIGNvZGUuCj4gCj4gCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6
IHBoeXNtYXA6IHBoeXNtYXAtYnQxLXJvbTogUmVtb3ZlIG5vdC1nb2luZy10by1iZS1zdXBwb3J0
ZWQgY29kZSBmb3IgQmFpa2FsIFNvQwogICAgICBjb21taXQ6IDE2ZDY4ZDEwZjViOTM0ZGI3ZWUw
MmExZTI4Y2JjNTM5OTA1YzY0YjgKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10
ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhh
dCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
