Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A10CA0FFF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGwqOzstAkj7+ZKThEyCv9zz9O7rtPlQqj8JSTnkoTo=; b=LL9pd8/6rGEVsn
	CVE56HuKT1zWlloxiS8i0WfNjZCvBqGenZegD6HW2tpA/Qqr9T+Yba3EZJcS/KiuWjs898q1mIeVG
	BFWfgG/6+RMjCfwamMON36FL3jTkuBlwGPry3qGPHiCiaVONojh3wbnUW5P6KmWB6wepccUJPs04h
	0umpZ1xz8utZHgyA39tS+5YchbBPYr1Rnyr83wU3w4SO2sSwuaSPvfTUYL9HZAmwck0uvjyE2AOCe
	zl7uSW3k0xXcbK4nSuxOMZuSOTRPVy9JdjmmwBfz4WVUovJNGbeWKVMAO9KYR9UxNszui3QSqWwVd
	94r5tSi2ScOvx8nrvP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6AX-0000000CzHS-002u;
	Mon, 01 Sep 2025 15:10:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3ds-0000000CRvc-1U3A
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:28:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73C5FC8F1CA;
	Mon,  1 Sep 2025 12:27:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3158060699;
	Mon,  1 Sep 2025 12:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14D461C22D920;
	Mon,  1 Sep 2025 14:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UXOsm8qhuucdsAyM1zdKnCT0l85k6/jaf73qtFHA0x8=;
	b=cV+Bta78fV6WZzUVXYqcLaEhUSlEA6ARnyEsZJdG2Gpqk8G8donsFfZ/NsyOnuXK5Oi6u+
	Qk5U2aWmsvTvl8KlWDKMGf+ZoEUZunpi2DNAzxeO6Enw/jQBtrpBaHGf7JxeHXYpCSS+YQ
	C32M/Ag5CkDod5V0e2QUTbeK80veRuSby12/pv/Q50RZmSoRU5PpYTav8pE0PKs7maL47y
	QqTXOMIoKTM6tRbRMAYEI9pT+2384Rs6AFRzK0OLjEK6d0hghPSI0uNcd9x5lQzLKAdO8l
	lRUnTclMVNFWsUhibsqOatapG20Wj4geKfXDMkEDjOV9O9Un83T8bOps+FLEfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250811-qpic_common-unused-defines-v2-1-cfc5aea03a93@gmail.com>
References: <20250811-qpic_common-unused-defines-v2-1-cfc5aea03a93@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: qpic-common: remove a bunch of unused
 defines
Message-Id: <175672968576.48694.1163405170152581048.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:28:05 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052812_573779_B2395A3D 
X-CRM114-Status: UNSURE (   6.54  )
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

T24gTW9uLCAxMSBBdWcgMjAyNSAwOTo0MDo0MCArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
QSBidW5jaCBvZiBkZWZpbml0aW9ucyBpbiB0aGUgJ25hbmQtcXBpYy1jb21tb24uaCcgaGVhZGVy
IGJlY2FtZQo+IHVudXNlZCBhZnRlciB0aGUgY29udmVyc2lvbiBvZiB0aGUgJ3Fjb21fbmFuZGMn
IGFuZCAnc3BpLXFwaWMtc25hbmQnCj4gZHJpdmVycyB0byB1c2UgdGhlIEZJRUxEX1BSRVAoKSBt
YWNybywgc28gcmVtb3ZlIHRob3NlLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiAK
PiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbmFuZDog
cXBpYy1jb21tb246IHJlbW92ZSBhIGJ1bmNoIG9mIHVudXNlZCBkZWZpbmVzCiAgICAgIGNvbW1p
dDogM2VhMjk5ZDNkY2NkYjg1NTQwNTdkMGE4NzU1MmU3NjczYmFlYTk1ZAoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
