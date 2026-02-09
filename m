Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523C3EE6B6F
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jSuIhpCHkpI7kloSILSLhJy0SjeRMfjSe22eJNbY6g=; b=SNWMlHydCRrEpR
	qZS6Bl6L3P3IJgBEEBBSxdWOa/d/slFX4l7w7OHmZbjM5C9UFm6bQJgCbfO8APiKA0zgSqfMJNmC3
	7HG2Xx0ggy1IpAMlkx3l9lMXm2V9n/I7owwsILbL3oI5VDONj7cU3HOnEwku5qeemvLvRjIXdt7xt
	KeCQEm510FvCfqAhHPrNWUclMDupDA/NEefAa5TLo0kkobhTtnVTKL1A0smvz4IX6Hq7qAi+qQAxF
	+3H+J8RaTkk31JxnRY9mOtcF4+3sePTddeqqP8QaWhRjh6C27ST/mPbZ4trREDsmgtDo7HqANoh30
	IqBvm1djNXYzvqtU5fHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMaF-0000000F12G-3iDB;
	Mon, 09 Feb 2026 08:25:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMZz-0000000F0s1-0ViG
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 08:25:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1BA7D4E42493;
	Mon,  9 Feb 2026 08:25:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E31A06074B;
	Mon,  9 Feb 2026 08:25:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45AE5119D00BB;
	Mon,  9 Feb 2026 09:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770625505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZRIYr8Gz6fHxWleg9w4+KnspMetzJC/e3Ef2irnfvEk=;
	b=SRFWlNdg5urDBaGc5XEc9Tx4bXXg76o0elx+xfsUsV/WdgcrIJ2Bi1V6rLYetee6/a11Hf
	R9Z24qyumc7dcX46djpo6ZU2TZ+X/X/PHZrXuKxXVep72g5nVThCUXm++ZWqJrZe34RIs0
	GNlozW/K2ccisPLVlW7FnLLUR/wmev92b7UfsmWgGcr0L9knq8+yjBONkZiQihJ/Xs4lBf
	/ra9RVXguyabKK9mOsO7sU6HJqZpBlgslZDyE3tiGfrITM7syEbZleHrLMaZBauPWTd5d8
	gvv70u4fMdaqvu4uszzmsYw9hXVQ1UwsSdHBXYo8oYgd7QgsevTv2tOSqTipLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: SPI-NAND crash on linux-next
In-Reply-To: <CAOMZO5BQs8Ny_i3gNr3C_LJHOZ6i7+SogYAjaf5xuxqBJAHXQA@mail.gmail.com>
	(Fabio Estevam's message of "Sat, 7 Feb 2026 00:31:28 -0300")
References: <CAOMZO5Bdxv2ifJ8XUq-dcE=NZ=DJdDfw+du-CQ_BTUigxcKV6A@mail.gmail.com>
	<CAOMZO5BQs8Ny_i3gNr3C_LJHOZ6i7+SogYAjaf5xuxqBJAHXQA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Feb 2026 09:25:01 +0100
Message-ID: <877bsme336.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_002511_382014_F14E5FAA 
X-CRM114-Status: UNSURE (   8.73  )
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

SGkgRmFiaW8sCgpPbiAwNy8wMi8yMDI2IGF0IDAwOjMxOjI4IC0wMywgRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKCj4gT24gRnJpLCBGZWIgNiwgMjAyNiBhdCAyOjU1
4oCvUE0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPgo+PiBXaGVu
IEkgdHJ5IGxpbnV4LW5leHQgMjAyNjAyMDUsIGl0IGNyYXNoZXM6Cj4+Cj4+IFsgICAgMS45NjM3
NjNdIDg8LS0tIGN1dCBoZXJlIC0tLQo+PiBbICAgIDEuOTY3MjA0XSBVbmFibGUgdG8gaGFuZGxl
IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQKPgo+IFRoaXMgaGFzIGJlZW4gZml4
ZWQgYnk6Cj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMTc3MDM4NTEwMjM4
LjExODIzMzYuMTA4MTgzMTQxMjM1NTg4NjQ5OTMuYjQtdHlAYm9vdGxpbi5jb20vVC8jdAoKU29y
cnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlLCBJIHRyaWVkIHRvIGJlIGFzIGZhc3QgYXMgSSBjb3Vs
ZCB3aGVuIHRoZQpidWcgZ290IHJlcG9ydGVkL2ZpeGVkIGJ1dCBibGVlZGluZyBlZGdlIHRlc3Rl
cnMgbGlrZSB5b3UgbWFuYWdlZCB0bwpyZXByb2R1Y2UgaXQhCgpDaGVlcnMsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
