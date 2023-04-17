Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC37EC77B72
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Apr 2023 21:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rTcWztVBBtWKpT8WUja/hQL+qVHux/2Uvf5856T9pQ8=; b=LJTvYNCwM3LaHYPFdvhB04NCHg
	LMeNEuwnKM0rkZ5d0v2fvbhkSYDLqhHrM02xAx2WPKiygtFoBWW9coIgwuxHWA70uU5YU/8DyfCbU
	r2LlE2+N9QuiI/WyS6G6esf0yBJFjszuP+Z2gS0TATBBvNBv/Xl0NpCQ99x2TkHC0Vq+qPIxwi1HF
	mU4OYnkUXnLo6mS6I2Kp1ok/S7XffNs46jlfKmDWwD95j5osO2dLPdzZcJ/UlLpA6ANNtkSGqHWrj
	A2taGYOhp1zfXLAZ64Eygie0BjQ8BK3ba21uiICeO5tkLcgWwLp3X1IC0xNBqNSdrme1zfmEsrEcq
	Q+AOFY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poWHc-0004iv-0O;
	Mon, 17 Apr 2023 21:21:08 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poWHY-0004gF-2r
	for linux-mtd@lists.infradead.org;
	Mon, 17 Apr 2023 21:21:06 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 165506382F0C;
	Mon, 17 Apr 2023 23:21:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zP6gpvDkZfuZ; Mon, 17 Apr 2023 23:20:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9F0B563CC166;
	Mon, 17 Apr 2023 23:20:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id brjCZ1XPEVNV; Mon, 17 Apr 2023 23:20:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7C2806382F0C;
	Mon, 17 Apr 2023 23:20:59 +0200 (CEST)
Date: Mon, 17 Apr 2023 23:20:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	=?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, 
	Arnd Bergmann <arnd@arndb.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <645805930.114012.1681766459273.JavaMail.zimbra@nod.at>
In-Reply-To: <20230417205654.1982368-1-arnd@kernel.org>
References: <20230417205654.1982368-1-arnd@kernel.org>
Subject: Re: [PATCH] mtdchar: mark bits of ioctl handler noinline
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdchar: mark bits of ioctl handler noinline
Thread-Index: nwC/Hc1rDi+z5tkPO5cWLU+7DfHq+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_142105_074885_F843F6D0 
X-CRM114-Status: UNSURE (   7.26  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkFybmQgQmVyZ21hbm4iIDxh
cm5kQGtlcm5lbC5vcmc+Cj4gVGhlIGFkZGl0aW9uIG9mIHRoZSBtdGRjaGFyX3JlYWRfaW9jdGwo
KSBmdW5jdGlvbiBjYXVzZWQgdGhlIHN0YWNrIHVzYWdlCj4gb2YgbXRkY2hhcl9pb2N0bCgpIHRv
IGdyb3cgYmV5b25kIHRoZSB3YXJuaW5nIGxpbWl0IG9uIDMyLWJpdCBhcmNoaXRlY3R1cmVzCj4g
d2l0aCBnY2MtMTM6Cj4gCj4gZHJpdmVycy9tdGQvbXRkY2hhci5jOiBJbiBmdW5jdGlvbiAnbXRk
Y2hhcl9pb2N0bCc6Cj4gZHJpdmVycy9tdGQvbXRkY2hhci5jOjEyMjk6MTogZXJyb3I6IHRoZSBm
cmFtZSBzaXplIG9mIDE0ODggYnl0ZXMgaXMgbGFyZ2VyIHRoYW4KPiAxMDI0IGJ5dGVzIFstV2Vy
cm9yPWZyYW1lLWxhcmdlci10aGFuPV0KPiAKPiBNYXJrIGJvdGggdGhlIHJlYWQgYW5kIHdyaXRl
IHBvcnRpb25zIGFzIG5vaW5saW5lX2Zvcl9zdGFjayB0byBlbnN1cmUKPiB0aGV5IGRvbid0IGdl
dCBpbmxpbmVkIGFuZCB1c2Ugc2VwYXJhdGUgc3RhY2sgc2xvdHMgdG8gcmVkdWNlIHRoZQo+IG1h
eGltdW0gdXNhZ2UsIGJvdGggaW4gdGhlIG10ZGNoYXJfaW9jdGwoKSBhbmQgY29tYmluZWQgd2l0
aCBhbnkKPiBvZiBpdHMgY2FsbGVlcy4KPiAKPiBGaXhlczogMDk1YmI2ZTQ0ZWIxICgibXRkY2hh
cjogYWRkIE1FTVJFQUQgaW9jdGwiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+CgpSZXZpZXdlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5v
ZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
