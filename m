Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D51CCDB470
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2026 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHI+PiVA16fmJSJDlShsN09v86WWTzlIjgjeA9qVjeI=; b=CzId1rQOuvMsRh
	RYQ864hqRf9GOuaEP6kng4OYumrTRixQTWpUP25Zz2ytObSbv6BzDqgwKqvi/zdu8aB8CSX5Ny2LU
	Z47QX8phCbSoFkY6lbjIdrYK7aIBLkEcQ7mn+O9jMcBtttdK4K0Uhc9KdqXGrHnEI8duvoWTXIgFq
	2tsAbBu8XwqhIjfEvlhRz21CnloF50BmlyWbHP1UcHLsOVfH3ms2CJjwcht6eEpybUrfLfiFMzvIi
	zmk2TC7pI6gnRdlzs6uG/y/bsn7L+/y51IZR7NUTBV4hqsMY5maB2iNQbrcDA/Uq5tYOlpHXOn9uL
	iHmzRNmBUuZ8O3Dk113A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHwp-00000007JBC-1ZA4;
	Wed, 24 Jun 2026 07:22:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHwm-00000007JAR-1X14
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jun 2026 07:22:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C9394E407AF
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jun 2026 07:22:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A1F7601C5;
	Wed, 24 Jun 2026 07:22:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7454A106C8380;
	Wed, 24 Jun 2026 09:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782285771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MSTKA8QhUnLzrzuy0HoPujwmsjjvzen8gZ+hKpejf2E=;
	b=1bw3cWUJOZ7HYlyUw5cPZYbSDxlTdKx5yBzTmYQnkB+qaRWbZCSi5PLyD0aO8ZP893u3W9
	5IqNE6YCLwx5HRV2hPoAilHrpqsTlDeYLEiBa/+AoJEDIoTsgGR5/s9O4aYgnwrwzDHW1D
	txdZTLhZnWfz2zULRdhmb/6ks+2Dw4X2U/6l+66mx54/N0dkLaai2N+eoH8wjuIKzWlam5
	BY83kVPTxGcXtaJbYKG67BKfHXG36+iKeIhLgQkxJav5iHFo1J6s/JRsr4cjgScTZxRXZv
	LVdbTD6PvP/Dw3S9AxudtSQ63l/bgADZI17IZGcSm8PgK0Gbv14Lp86RLz4BVg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mchp23k256: Use SPI match data for chip caps
In-Reply-To: <20260624055440.35226-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Wed, 24 Jun 2026 13:54:40 +0800")
References: <20260624055440.35226-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 24 Jun 2026 09:22:47 +0200
Message-ID: <87bjd0mmgo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_002256_538578_016827B3 
X-CRM114-Status: UNSURE (   8.55  )
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

T24gMjQvMDYvMjAyNiBhdCAxMzo1NDo0MCArMDgsIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNj
YXMuYWMuY24+IHdyb3RlOgoKPiBUaGUgZHJpdmVyIHN0b3JlcyBjaGlwIGNhcGFjaXR5IGluZm9y
bWF0aW9uIGluIGJvdGggdGhlIE9GIG1hdGNoIHRhYmxlCj4gYW5kIHRoZSBTUEkgaWQgdGFibGUu
ICBQcm9iZSBjdXJyZW50bHkgdXNlcyBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSwKPiBzbyBh
IG5vbi1PRiBTUEkgbW9kYWxpYXMgbWF0Y2ggZmFsbHMgYmFjayB0byBtY2hwMjNrMjU2X2NhcHMg
ZXZlbiB3aGVuCj4gdGhlIFNQSSBpZCB0YWJsZSBzZWxlY3RlZCBhIGRpZmZlcmVudCBwYXJ0Lgo+
Cj4gVXNlIHNwaV9nZXRfZGV2aWNlX21hdGNoX2RhdGEoKSBzbyBTUEkgaWQtdGFibGUgZHJpdmVy
X2RhdGEgaXMgY29uc3VtZWQKPiB3aGVuIE9GIG1hdGNoIGRhdGEgaXMgYWJzZW50LiAgVGhpcyBr
ZWVwcyB0aGUgZXhpc3RpbmcgZGVmYXVsdCBmYWxsYmFjawo+IHdoaWxlIGF2b2lkaW5nIHRoZSB3
cm9uZyBNVEQgZ2VvbWV0cnkgZm9yIGlkLXRhYmxlLW9ubHkgbWF0Y2hlcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNjYXMuYWMuY24+Cj4gLS0tCgpJIGFtIG5v
dCBzdXJlIHRoZSBkZWZhdWx0IG1ha2VzIGEgbG90IG9mIHNlbnNlIGFzIHRoZXJlIGFyZSBvbmx5
IHR3bwpwb3NzaWJsZSBoaXRzIGFuZCBib3RoIGhhdmUgcHJpdmF0ZSBkYXRhIGF0dGFjaGVkLiBO
ZXZlcnRoZWxlc3MsIHRoZSBmaXgKbG9va3MgY29ycmVjdC4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
