Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE5BE91294
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPvruZPTBaNqMXuInrC6otSe/a5eNFxjsy2Xnuiilwg=; b=bTvX/9OdZviq7u
	6CRafrLSK4nUa0a2PDb5XpApE9Q4dgj7A6YkGZ9cJAD87aPu4JIb6Z0LFGcm5RxzyaKKr9bFIU0ka
	mwbsH0F1G0aaY9uuvtqeZqs825CkpioybsAvUh/ayftM0LgWOGxd5+zRLcXDn9N/sbzRwVojQWjJ+
	zQGaDwboJb25R5kqQVgwtbvISa4GTCIncc42QuMGs3qSYEfK+aD489mBIDh0UrXdaMqHZcRLP2FrL
	nQ7gTJhNDFDRQ+ez2NgQRKbZ7NLnZ9sR7RsJGeDMgunMHbf02WwRUFe1exprJ+GOWlEF2qXFjmJuy
	FDTOhIggUWrtVnnMP9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnv5o-00000009dDH-3oBa;
	Thu, 05 Feb 2026 08:52:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnv5m-00000009dCS-0z3j
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 08:52:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 54CE3C243A8
	for <linux-mtd@lists.infradead.org>; Thu,  5 Feb 2026 08:52:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AE2F606FD;
	Thu,  5 Feb 2026 08:52:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4366119A865B;
	Thu,  5 Feb 2026 09:51:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770281519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uegmMgwK6YxerG6iMFSVVMyjG09NzjU6hD8x2MGcP7w=;
	b=fjWTtUrSyRnUs3sMYgrTiKRy6kukwlzpe4KTICNekoXSWHGHGfc9kYoiQOzyFnEs4oeY9u
	IxKF/3/BER9uQzZXVYShDdS2qOjTvJaekc2kklbSP4v3Q98TNSz/aUiN94oPTejS+Zs+WV
	SA/RU0wyyD5nals6ZPHYXr0RqU1Dj3AQ0el5zOUJ1TGRzNE05tv6VQulsL6VOYGcJB/Rp9
	DeChfDxb4jJem5YiVrx1iTA8ZoqLUkbmfa0/TqnODJYfDZMDMh7cw3fHvzIgasTpok4CGU
	CQcYctMLwi47gUTvz9Zomtg2p8Iu2nrhHO9q4Fnk/eH+Cjv96K00ldekDCXfrQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
In-Reply-To: <aYO2IPsoxmDtTsec@smile.fi.intel.com> (Andy Shevchenko's message
	of "Wed, 4 Feb 2026 23:12:00 +0200")
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
	<aYO2IPsoxmDtTsec@smile.fi.intel.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 09:51:56 +0100
Message-ID: <87a4xnfu8j.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_005202_414680_14A7ED97 
X-CRM114-Status: GOOD (  11.42  )
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

SGkgQW5keSwKCk9uIDA0LzAyLzIwMjYgYXQgMjM6MTI6MDAgKzAyLCBBbmR5IFNoZXZjaGVua28g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgRmVi
IDA0LCAyMDI2IGF0IDAyOjI1OjI3QU0gKzAxMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPj4g
Q29tcGlsZXIgaXMgbm90IGhhcHB5IGFib3V0IHVzZWQgc3RhY2sgZnJhbWU6Cj4+IAo+PiBkcml2
ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYzogSW4gZnVuY3Rpb24gJ2RvX3dyaXRlX2J1
ZmZlcic6Cj4+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jOjE4ODc6MTogZXJy
b3I6IHRoZSBmcmFtZSBzaXplIG9mIDEyOTYgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTI4MCBieXRl
cyBbLVdlcnJvcj1mcmFtZS1sYXJnZXItdGhhbj1dCj4+IAo+PiBGaXggdGhpcyBieSBmYWN0b3Jp
bmcgb3V0IGRvX3dyaXRlX2J1ZmZlcl9sb2NrZWQoKS4KPgo+IE15IGdvc2gsIEkgYWxyZWFkeSBz
ZW50IGEgdjIgZWFybGllciBhbmQgdGhlcmUgd2VyZSBzb21lIHJlcGxpZXMsCj4gSSBuZWVkIHRv
IGNoZWNrLi4uCgpJJ20gbm90IHN1cmUgSSBnZXQgd2hhdCB5b3UgbWVhbiBoZXJlPyBJIGdvdCBu
byByZXBseSAoaW4gbXkgaW5ib3gpIHRvCnlvdXIgdjIuIEkgYW0gbGV0dGluZyBhIGJpdCBvZiB0
aW1lIGZvciBWaWduZXNoIHRvIHRha2UgYSBsb29rLCBidXQgSQprbm93IGhlJ3MgYnVzeSBzbyBJ
IG1pZ2h0IHRha2UgaXQgbmV2ZXJ0aGVsZXNzIGJ5IHRoZSBlbmQgb2YgdGhlIHdlZWsgYXMKd2Ug
YXJlIGFwcHJvYWNoaW5nIHRoZSBtZXJnZSB3aW5kb3cuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
