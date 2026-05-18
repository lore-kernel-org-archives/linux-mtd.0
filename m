Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D74FCD4F3C
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2026 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iMjLPq9BjDK1RpKGsPgDBXAU4Cs7RF0lD7yd8f1TYg=; b=luILfiu8L+QK7d
	7+YKBwNOo1WsBmkeok5oUVfeYrWDcvbq1E5I9zy81yHHCQCHaIiCeU27FT2gKVlLInEeweyyx5EWH
	q6zQma2Cdrr5PlFgqLHaD+WE6kuKGsi7YN0ON/zcTsqxW2bHNUPIL4umI4Jn17gpCq21Ueg/IniCh
	B8sFBSkLc55zoFkU8L42pkFW2XYBBmYt9SP/89NIxi/hXBHRnwu3m1hf6ksLLbupMjb57D3ttPva0
	+QtIeGIddRvTj5mgT17w560HmajyVuZEcYMI5qe6prxzzUfAthIaxmo+TQFMduoI486XxNUL/1h7N
	4rEJXyEBF945qNwBE6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwjl-0000000FZ17-0oQs;
	Mon, 18 May 2026 12:06:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwji-0000000FYzo-2Y6o
	for linux-mtd@lists.infradead.org;
	Mon, 18 May 2026 12:06:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 09A8C4E42CDB;
	Mon, 18 May 2026 12:06:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A48C95FFA3;
	Mon, 18 May 2026 12:06:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F6E211AF84A3;
	Mon, 18 May 2026 14:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779105973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ti0kMieo1Q8WJfj742mYfiKH1EDQpG4zFPCckhsBW8U=;
	b=iczjFiyENVzumC7GYJz0GANMpn8oqwIM5i47kKTaNE2KAADb0M4OV9NHxgKGRcUesiZeaR
	tY2qV2QWorlamiM1iDRU06Te+s4RMPtLWnXk5vO1cFywyy/GTwxwc2bs6xt4yTdHfQsnkE
	JTgL23eQHhnPJCfuMh/hLRVdVoydfRjGnsUJb2mL37pcUBPczSBux5Ou8zlugRumWZ5IRg
	M0XqOkT1W0pd3IIZklkZ3xZZOzjtFIdVgBl9/MjXutuHPx/Bby7KI4e/tsHW7sSBpuV4H3
	7jManfFXTvjWZt6XmvFmVtSF3edN58jl0clzOog4j0OyTXjfxVfuE0pwkfJKJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-sh@vger.kernel.org,  linux-kernel@vger.kernel.org,  Rich Felker
 <dalias@libc.org>,  John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,  Adrian McMenamin
 <adrian@newgolddream.dyndns.info>,  Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v3 0/3] mtd: maps: vmu-flash: Fix build and runtime errors
In-Reply-To: <20260518114521.81564-1-fuchsfl@gmail.com> (Florian Fuchs's
	message of "Mon, 18 May 2026 13:45:18 +0200")
References: <20260518114521.81564-1-fuchsfl@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 18 May 2026 14:06:08 +0200
Message-ID: <87fr3oudlb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_050618_779772_63914546 
X-CRM114-Status: GOOD (  12.76  )
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

SGkgRmxvcmlhbiwKCk9uIDE4LzA1LzIwMjYgYXQgMTM6NDU6MTggKzAyLCBGbG9yaWFuIEZ1Y2hz
IDxmdWNoc2ZsQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEhpIGFsbCwKPgo+IFRoaXMgc21hbGwgc2Vy
aWVzIGZpeGVzIGJ1aWxkIGFuZCBydW50aW1lIGVycm9ycyBpbiB0aGUgdm11LWZsYXNoIGRyaXZl
cgo+IChlbmFibGVkIGJ5IENPTkZJR19NVERfVk1VKSBhbmQgdGhlIHJlbGF0ZWQgbWFwbGUuaC4g
VGhlc2UgY2hhbmdlcyB3ZXJlCj4gdmVyaWZpZWQgb24gcmVhbCBEcmVhbWNhc3QgaGFyZHdhcmUg
d2l0aCBhIHBoeXNpY2FsIFZNVS4gVGhlIFZNVSBjYW4gbm93Cj4gYmUgc3VjY2Vzc2Z1bGx5IHBy
b2JlZCwgcmVhZCBhbmQgd3JpdHRlbiB3aXRoIE1URCB0b29scyBsaWtlIG10ZGluZm8gYW5kCj4g
bXRkX2RlYnVnLiBQcmV2aW91c2x5LCB0aGUgZHJpdmVyIGZhaWxlZCB0byBidWlsZCBvciBjcmFz
aGVkIGR1cmluZwo+IHByb2JpbmcuCj4KPiAgICAgICAgIGJhc2gtNS4zIyBtdGRpbmZvIC9kZXYv
bXRkMAo+ICAgICAgICAgbXRkMAo+ICAgICAgICAgTmFtZTogICAgICAgICAgICAgICAgICAgICAg
ICAgICB2bXUyLjEuMAo+ICAgICAgICAgVHlwZTogICAgICAgICAgICAgICAgICAgICAgICAgICBt
bGMtbmFuZAo+ICAgICAgICAgRXJhc2VibG9jayBzaXplOiAgICAgICAgICAgICAgICA1MTIgYnl0
ZXMKPiAgICAgICAgIEFtb3VudCBvZiBlcmFzZWJsb2NrczogICAgICAgICAgMjU2ICgxMzEwNzIg
Ynl0ZXMsIDEyOC4wIEtpQikKPiAgICAgICAgIE1pbmltdW0gaW5wdXQvb3V0cHV0IHVuaXQgc2l6
ZTogNTEyIGJ5dGVzCj4gICAgICAgICBTdWItcGFnZSBzaXplOiAgICAgICAgICAgICAgICAgIDUx
MiBieXRlcwo+ICAgICAgICAgQ2hhcmFjdGVyIGRldmljZSBtYWpvci9taW5vcjogICA5MDowCj4g
ICAgICAgICBCYWQgYmxvY2tzIGFyZSBhbGxvd2VkOiAgICAgICAgIHRydWUKPiAgICAgICAgIERl
dmljZSBpcyB3cml0YWJsZTogICAgICAgICAgICAgdHJ1ZQo+Cj4gVGhhbmtzLAo+IEZsb3JpYW4K
PiAtLS0KCkkgYmVsaWV2ZSB0aGVyZSBpcyBubyBpc3N1ZSBpbiBhcHBseWluZyBwYXRjaGVzIDIg
YW5kIDMgb24gdG9wIG9mIHRoZQptdGQgdHJlZSBhbmQgbGV0IHdob2V2ZXIgaXMgcmVzcG9uc2li
bGUgdGFrZSBwYXRjaCAxLiBJZiBJIGdldCBhbiBhY2sgSQpjYW4gYWxzbyBjYXJyeSBwYXRjaCAx
IHRocm91Z2ggdGhlIG10ZCB0cmVlLiBXaXRob3V0IG1vcmUgZmVlZGJhY2sgSQpwbGFuIG9uIGFw
cGx5aW5nIHBhdGNoZXMgMiBhbmQgMyBpbiB0aGUgY29taW5nIHdlZWtzLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
