Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48C2C5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrW+Z1cC0ML7pdOAX4Qza0O9LIktp6/xpT9i/6ENvPo=; b=U02fnRGyWnJRHG
	AuN9jIFZ3S4Y7UJXboxxDL0K2h15tMBIBNOWOj7s6wQPe4gbgH0o833D7jX9ekf3F6GOiZsRlEuMo
	Au7eef1Y12Hb0rKJDeQayZtr844uh+R6NJ/oXEata0XDj5/gSP2V/kJKIRH9Y2ih9d31CEPTvZTFR
	J8U3bjL1Tl/+oqPlEPRvDBMR/Nu2nw2YqW5jDoGpQxUT388981RU9wdcmZRYHoQnwa+73S04M8d5/
	xQ1Ctwd5Nn9k8Y3lg3xHFNsYDuXVk4yl8s+8aw/e7y//39LAMgeRilrOAj5P1vehzQcmRLtR66Obi
	Gbw/m1OLTQosYkHtnWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL8b-00000008DlC-1cjt;
	Fri, 07 Aug 2026 14:01:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL8Y-00000008Dkn-0dFD
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:01:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A081E4E4113C;
	Fri,  7 Aug 2026 14:01:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7596D603F0;
	Fri,  7 Aug 2026 14:01:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E49A911C3795D;
	Fri,  7 Aug 2026 16:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8RffSfqXyqSVxqzscXTkTjqd76AQPP3M+wo2+zNYwfo=;
	b=byG7ApHXk4jnf4WYK3tg1LylDfclX/KCeVEJJ9QumgdmrxMonwP7doNFwZiVJM0V+jZk9q
	S4/q+a/sbGQypLZyn7uP/9zHeXzpoTmY31yPXS7Ghb3AHWPKw9i62pylxhx5QT/AHPj/0x
	vmKZPh7oD2EruiBylijKdnylSIeibQ835DM/6A7jcdKx4XaUcNyWt5FiDeW6Qu3qX3TRtk
	f2fcflSmcEA3FJrTtOW+tmKrqtFISbFoSteXYEyh1fqp9aC+XXB61e+9B9LokE7ERO3OCt
	INnQApxc9+TDvnfJtQegWvOg5bwI1apQn9sb1TLyr8r2NcKxh/mhYzlDTZYYIw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Michal Simek <michal.simek@amd.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH 0/4] rawnand: pl35x: Implement mixed ECC
In-Reply-To: <20260723-mix-ecc-v1-0-7361c3baeb07@bootlin.com> (Bastien
	Curutchet's message of "Thu, 23 Jul 2026 15:41:00 +0200")
References: <20260723-mix-ecc-v1-0-7361c3baeb07@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 16:01:17 +0200
Message-ID: <87cxvuav2q.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_070126_350112_C4859CA9 
X-CRM114-Status: GOOD (  12.63  )
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

SGVsbG8gQmFzdGllbiwKCk9uIDIzLzA3LzIwMjYgYXQgMTU6NDE6MDAgKzAyLCBCYXN0aWVuIEN1
cnV0Y2hldCA8YmFzdGllbi5jdXJ1dGNoZXRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBhbGws
Cj4KPiBUaGlzIHNlcmllcyBhZGRyZXNzZXMgdGhlIFBMMzUzIGVycmF0YSAiU0xDIEVDQyBtaXNz
ZXMgc2luZ2xlIGVycm9yIHRvCj4gYml0MCBieXRlMCBhbmQgZmFpbHMgdG8gZGV0ZWN0IHNvbWUg
ZG91YmxlIGVycm9yIGNhc2VzIiAoc2VlIDcyMTA1OSBpbgo+IFsxXSkuCj4KPiBUaGUgRUNDIEhX
IGVuZ2luZSBpcyBrbm93biB0byBiZSBicm9rZW4gb24gdGhpcyBjaGlwLCBpdCBmYWlscyB0byBk
ZXRlY3QKPiBzb21lIGJpdGZsaXBzIG9uIHJlYWRzLgo+Cj4gVGhpcyBzZXJpZXMgaW1wbGVtZW50
cyBhIG1peGVkLUVDQyB3aGVyZSB0aGUgSFcgZW5naW5lIGlzIHVzZWQgb24gd3JpdGVzCj4gYW5k
IHJlYWRzIGFyZSBkb25lIGJ5IHNvZnR3YXJlLiBUbyBtYWtlIGl0IHdvcmssIHRoZSBzb2Z0d2Fy
ZSBFQ0MgaGFzIHRvCj4gdXNlIHRoZSBzYW1lIGxheW91dCBmb3IgdGhlIEVDQyBiaXRzIHRoYW4g
dGhlIEhXIGVuZ2luZS4gUGF0Y2hlcyAxICYgMgo+IGFkZCB0aGUgUEwzNXggb3JkZXJpbmcgdG8g
dGhlIGF2YWlsYWJsZSBvcmRlcmluZ3MgZm9yIHNvZnQgRUNDLiBQYXRjaGVzCj4gMyAmIDQgbWFr
ZSB1c2Ugb2YgdGhpcyBvcmRlcmluZyB0byBpbXBsZW1lbnQgdGhlIG1peGVkLUVDQyBmb3IgdGhl
IFBMMzUzCj4gY29udHJvbGxlci4KPgo+IE5vdGUgdGhhdCB0aGlzIHNlcmllcyBpcyBiYXNlZCBv
biB0b3Agb2YgbmFuZC9uZXh0Lgo+Cj4gWzFdOiBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2Rv
Y3VtZW50YXRpb24vcmxuYzAwMDIyNy9hCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXN0aWVuIEN1cnV0
Y2hldCA8YmFzdGllbi5jdXJ1dGNoZXRAYm9vdGxpbi5jb20+Cj4gLS0tCgpUaGVyZSBhcmUgc2V2
ZXJhbCBpbnRlcmVzdGluZyBTYXNoaWtvIGZpbmRpbmdzIGZvciB0aGlzIHNlcmllcywgY2FuIHlv
dQpwbGVhc2UgaGF2ZSBhIGxvb2s/CgpUaGFua3MhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
