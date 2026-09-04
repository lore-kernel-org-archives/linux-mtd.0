Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1889EC79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cG3H+xk0xeg0cXo4x8mi8dIunPa+j9eFCQY3CBoEoIw=; b=yhSZHoUOFBLqir
	WvR98sgL/zkfEZePIhRM85THbMH+lZ3VT1QccFl5xPR4wkYFmGiVvEnz/T63XHK5+3U1+5g4Lwkg/
	7bpOhI3VHFUXiRqAh9WaaI/AnL76O5ZW9FMxuk8fbGuh3LT1rC0zLBGVR9V7ljfV+rViVYORlnnyN
	15trf7dCFJRs/pf0Kv4aAosmTP+LmFLe+oRMuXan+wK8DhXwVTau36VsjOaOeck8loC0BC4LUSPf/
	rVhD6EAX7RFRFD7mmHRPc14Xs6wEcnUZVx9ozuQ47Kbq9W7QM/cQtT0Uk7Oi4QgZzPLGoHA+rnlvB
	Y4Y00fBCIyST0CDhT+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xrn-00000002tzK-3QdF;
	Fri, 04 Sep 2026 17:38:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xrk-00000002tvb-0dIJ
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 96F6D4E41519;
	Fri,  4 Sep 2026 17:38:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AFD66057F;
	Fri,  4 Sep 2026 17:38:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF24711C78767;
	Fri,  4 Sep 2026 19:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CDyJM3GgcirGUlvc2OehHFFuIjQ3S1Q0Gvy7Y0TkA+Y=;
	b=UNBT5PBEvWETxL6CwcZIRR0jB4GTM8CcK1TOkeuLan0DYVE5dKYAZ0tdzAtMh6wSZzovPT
	VQQteFeyxONphELBCu2Xr5C1Z0Ws2/EAQRogp008niyV5UeL/gMY2DD99AmnXrzcScjEf3
	9HeE3I81Xxd0Ynec+JbD+fuiIR7sMfAsiaOIPKEesoTmnBJsHCGrISFRsuLz6GINAKaioq
	QyXYu4f1mMUHNcYG5E3JOlZhenjOH9t5EOZoaRwg8Gk3AOhi5Nd+/gFCX0gGYAyg28n7DN
	7nBY6Ut5nn/9IGBMJgvm+KXMWt5GyOxIM3Kp5tUh2r6TcOndXt+UflOnjdhmZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 David Laight <david.laight.linux@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260824014703.56502-1-kmehltretter@gmail.com>
References: <20260824014703.56502-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: shrink do_write_buffer() stack
 frame
Message-Id: <178854348831.1467647.15564851148664734231.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103816_325862_2FF1CB43 
X-CRM114-Status: UNSURE (   6.19  )
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

T24gTW9uLCAyNCBBdWcgMjAyNiAwMzo0NzowMyArMDIwMCwgS2FybCBNZWhsdHJldHRlciB3cm90
ZToKPiBhcm0zMiBhbGxtb2Rjb25maWcgZmFpbHMgdG8gYnVpbGQgd2l0aCBnY2M6Cj4gCj4gICBk
cml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYzoxODgzOjE6IGVycm9yOiB0aGUgZnJh
bWUgc2l6ZSBvZiAxMjk2Cj4gICBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMjgwIGJ5dGVzIFstV2Vy
cm9yPWZyYW1lLWxhcmdlci10aGFuPV0KPiAKPiBXaXRoIE1URF9NQVBfQkFOS19XSURUSF8zMiBh
IG1hcF93b3JkIGlzIDMyIGJ5dGVzLCBhbmQgd2l0aCBLQVNBTl9TVEFDSwo+IGV2ZXJ5IHRlbXBv
cmFyeSBnZXRzIGl0cyBvd24gcmVkem9uZWQgc2xvdC4gIGRvX3dyaXRlX2J1ZmZlcigpIGJ1aWxk
cyBhCj4gbWFwX3dvcmQgZm9yIGVhY2ggb2YgdGhlIHR3ZWx2ZSBjb21tYW5kcyBpdCBpc3N1ZXMs
IGFuZCB0aG9zZSB0ZW1wb3Jhcmllcwo+IGRvbWluYXRlIGl0cyBmcmFtZS4KPiAKPiBbLi4uXQoK
QXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogY2ZpX2NtZHNldF8wMDAx
OiBzaHJpbmsgZG9fd3JpdGVfYnVmZmVyKCkgc3RhY2sgZnJhbWUKICAgICAgY29tbWl0OiAzOWI5
NzVmZjIwODYxMDMwMWJjNDAwNDYwZWMyNDVjYWVmZmE0ZWUwCgpQYXRjaGUocykgc2hvdWxkIGJl
IGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQg
UFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdh
cmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
