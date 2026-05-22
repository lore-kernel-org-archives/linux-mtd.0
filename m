Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D363CD5BB3
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 16:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUZeVVqAkYi1n5wMA3lSMqiQjU4l/eFZuRObCIvodGU=; b=at3HtaNmT8bl2O
	ou9GH0QniuExpXZaSk2RER3qCqBjG3Zw97HHLiyagHhpkz9HEZNWxtFylpVyGNiRl75qWmqYw8g6m
	5ElFyzB86NzyNb6emtpLRaPjmjYrMeM7ue9d7gZ8X0J6hCzqDcxENOMiXOx/3pfZigFUkp+VPSdKA
	kKpg0FnBQYZU8nvFBpCoQ1ZdVnswotY11Gh1u+yMmGkjaeBNc7qngC59mjuC36vUtHhOc1OCY7ZxG
	0mzPM6WEu7b3w9YD/5pzoK2LgcdLS31Yk5BpdGWZuUtjrjxCJgZExVtxWqV9V+0qs+q2jwGZSLR1N
	sh/YMIiJNHCUknwO3F+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSup-0000000BRx6-15sz;
	Fri, 22 May 2026 16:40:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSum-0000000BRw5-0Zdq
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 16:40:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E39EE4E42D21;
	Fri, 22 May 2026 16:39:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 977756003C;
	Fri, 22 May 2026 16:39:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D437A1081162F;
	Fri, 22 May 2026 18:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779467994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Z3pH1U+yOD8zh30CE+DCdzyq1ZMpaHbgFEs1Oecjss=;
	b=dPvA3g98wV2u7+CgavHPeGmJ4MnDYlqe8UHyr32YpC5WEPoAMZj0M1TFLbmf3wl+ZSrfJb
	QhzNnPg76i/sUD012bP8UKoNLLqUx2M1NVzvXHuhoWIEjTVmM81K6lRUcirIJ72tK/NSoW
	uJ9zxfzupYNDVuuD+omEWD9VaqDzly0kylm4Lmq5s+tnjVAvJ9aWpYUXnlobfak7eirZcR
	6Crge4ZtqfcAoJea3LLow9GSQGm0xxn7DfB8a93dyk8JOQQ7vF5YIvj1WIoxf7Tjj/erWV
	AqKVq4LE65VrvYN2by4rRymXZ1W/pSavIQX8YvGHcMbtX2DTvZYqvAHLsLf+Bw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 May 2026 19:07:53 +0300")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 18:39:52 +0200
Message-ID: <87o6i7o0tj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_094000_309846_0761877B 
X-CRM114-Status: GOOD (  11.18  )
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

Pj4gVGVjaG5pY2FsbHkgc3BlYWtpbmcgYWxsIGZvdXIgZmlyc3QgcGF0Y2hlcyBhcmUgZml4ZXMs
IGV4Y2VwdCBJIGRvbid0Cj4+IGFzayB0aGUgZmlyc3Qgb25lIHRvIGJlIGJhY2twb3J0ZWQuIFRo
ZSByZWFzb24gd2h5IHdlIGFzayBmaXhlcyB0byBiZQo+PiBmaXJzdCBpbiB0aGUgc2VyaWVzIGlz
IGJlY2F1c2Ugd2Ugd2FudCB0aGVtIHRvIGJlIGFzIGluZGVwZW5kZW50IGFzCj4+IHBvc3NpYmxl
IGZyb20gcHJldmlvdXMgY2xlYW51cHMvY2hhbmdlcy4gSGVyZSBlYWNoIGZvdXIgZmlyc3QgcGF0
Y2ggYXJlCj4+IHRhcmdldGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudCBwbGFjZXMgYW5kIHNob3Vs
ZCBub3QgaW50ZXJhY3Qgd2l0aCBlYWNoCj4+IG90aGVyLiBBbnl3YXksIEkgd2lsbCByZS1zaHVm
ZmxlIHRoZSBwYXRjaGVzLgo+Cj4geW91IGRvbid0IG5lZWQgdG8gcmVzZW5kIGp1c3QgZm9yIHRo
YXQgSSB0aGluay4gUHJhdHl1c2ggb3IgTWljaGFlbCBjYW4KPiByZS1zaHVmZmxlIHdoZW4gYXBw
bHlpbmcuCgpJdCdzIGEgYml0IHBhaW5mdWwgdG8gZG8gd2hpbGUgYXBwbHlpbmcsIEkgd2lsbCBz
ZW5kIGEgdjYuCgo+PiBBcyBmb3IgU2FzaGlrbydzIGZlZWRiYWNrLCB0aGUgQUkgcmFpc2VzIHRo
ZSBzYW1lIHBvaW50IGFzIG91ciBwcmV2aW91cwo+PiBkaXNjdXNzaW9uOiB0aGUgUUUgYml0IGhh
bmRsaW5nIGlzIHJlYWxseSBiYWQsIGFuZCBJIGFtIHdvcmtpbmcgb24KPgo+IEkgZm9yZ290IHdo
YXQgd2UgdGFsa2VkIGFib3V0LCBzb3JyeS4KClRoZSBmYWN0IHRoYXQgdGhlcmUgaXMgYSBoZWxw
ZXIgaW4gdGhlIGNvcmUgdGhhdCBibGluZGx5IHNldHMgYQpwYXJ0aWN1bGFyIFFFIGJpdCwgYnV0
IHRoaXMgaGVscGVyIG1pZ2h0ICh0aGVvcmV0aWNhbGx5KSBiZSB1c2VkIGJ5CmNoaXBzIHdoaWNo
IGhhdmUgdGhlIFFFIGJpdCBzb21ld2hlcmUgZWxzZS4KCkkgcGxhbiBvbiByZXdvcmtpbmcgdGhp
cyBieSBzdG9yaW5nIHRoZSBsb2NhdGlvbiBvZiB0aGUgUUUgYml0IGR1cmluZwpTRkRQIHBhcnNp
bmcuIFRoZW4gSSB3aWxsIHVzZSB0aGF0IGxvY2F0aW9uIGluIGEgaGVscGVyIHRvIHNldCBvciBj
bGVhcgppdCwgd2hpY2ggd2lsbCBhbHNvIGJlIGRlcGVuZGVudCBvbiB0aGUgUUVSIGJpdGZpZWxk
LiBCdXQgdGhhdCBmaWVsZCBpcwphIHJlYWwgbWVzcywgc28gSSdtIG5vdCBzdXJlIGl0J3MgZ29u
bmEgd29yayA6LSkKCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
