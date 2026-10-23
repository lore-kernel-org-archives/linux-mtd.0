Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17A606A334
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wxpvPdDl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DW8YfnRJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ErJEfUUQ9KESMe+aq/MRyhN7rMTBiQNyuniB3cUYTVM=; b=wxpvPdDlcdbd4khEONWHINtPyV
	vzKfTPV/mssKxAb9vV5jaywZ3ndVzd8T0WHgh1JZPbitgzr/wZQmLvN2BYugrtXUmkjErpycv0zk+
	NVMBeYMGJNLom1sNY/FCy9K/YXHsoITeuOGFLqthmdcFrMy7/a7CxFe+p8gl5IpsnVfRBe+OvSGCt
	EzHdI7zA0Kul6rVkrefNL7JlMjpnD5fJvLEmnnO92VNoWZR/Kr44Zuk/SGIdTv6L+4OOd8WUeCAVe
	RhmvxP7Jxjeu0ULXB8oj9JNRtFT0nCULD7YImeJQibNfkm72W2Wla37LrMnXiJxwBl3rnAzVBbEtd
	fNkMTT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBwZ-0000000G5c9-3c0P;
	Fri, 23 Oct 2026 09:52:11 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBwW-0000000G5bG-1res
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 09:52:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93E97C6344F;
	Fri, 23 Oct 2026 09:53:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CCE860398;
	Fri, 23 Oct 2026 09:52:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 426EB10328BF4;
	Fri, 23 Oct 2026 11:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792749124; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hGktRpAovBNP2O/hbEpgY8U5f/oq3Xu2oDGMSALMQuM=;
	b=DW8YfnRJV9XAKi/jv8v6qHBDZJqJ+626gsZ4gcIQRZnswwef9yBaCgHKequgDHpGIWmcVd
	uyHh/UlBRIM8CmqkHC8iRJs7bcLcei4bf+xD0XWyUcYC+kFx9OnF/OCIdCuofu3SpD8o/3
	fhQhRRwHpZ5my1R9rKmSZW2OyenqBggHnYNicZUUQF2PVG48NYRU9UzOgM+9pjMg9ACLyG
	7ErYUw9qvvmDwHPoxzYHgwS/PdFjHx0RzGL2UjE4j3oiKXgOutmo49asaLNsI60gVuT9dS
	QvBDz4ds4xvIOFgiyvwXFsZfEeMqRw1TURbcP9z6Q4mmPggB5H8KXrd2D6ncxw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1 1/4] spi: dw: Add DDR (Dual Data-Rate) support for
 enhanced SPI mode
In-Reply-To: <ZQ4PR01MB1202C6B2531173B2D395C619F2642@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
	(Changhuang Liang's message of "Fri, 23 Oct 2026 09:42:56 +0000")
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
	<20261022102614.75696-2-changhuang.liang@starfivetech.com>
	<87bj8mqaof.fsf@bootlin.com>
	<ZQ4PR01MB1202C6B2531173B2D395C619F2642@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 23 Oct 2026 11:52:00 +0200
Message-ID: <877bj8pwvz.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_025208_653061_B356FA1D 
X-CRM114-Status: GOOD (  12.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cj4+ID4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLWR3LWNvcmUuYwo+PiA+ICsrKyBiL2RyaXZlcnMv
c3BpL3NwaS1kdy1jb3JlLmMKPj4gPiBAQCAtNDYsNiArNDYsOCBAQCBzdHJ1Y3QgZHdfc3BpX2Vu
aF9jZmcgewo+PiA+ICAJdTggaW5zdF9sOwo+PiA+ICAJdTggYWRkcl9sOwo+PiA+ICAJdTggdHJh
bnNfdDsKPj4gPiArCWJvb2wgaW5zdF9kZHI7Cj4+ID4gKwlib29sIHNwaV9kZHI7Cj4+IAo+PiBJ
ZiBJIHVuZGVyc3RhbmQgdGhpcyBjb3JyZWN0bHksIHNwaV9kZHIgaXMgcXVpdGUgYSBiYWQgbmFt
ZSBiZWNhdXNlIGl0IG1lYW5zCj4+IGFkZHJlc3MgYW5kIGR1bW15IGFuZCBkYXRhIGRkciAoYnV0
IG5vdCBpbnN0cikuIENhbiB5b3UgdHJ5IHRvIGNvbWUgdXAgd2l0aAo+PiBhIGJldHRlciBuYW1l
IGZvciB0aGlzIHZhcmlhYmxlPwo+Cj4gc3BpX2RkciBpcyBuYW1lZCBleGFjdGx5IHRoYXQgd2F5
IG9uIHRoZSByZWdpc3RlciBmaWVsZC4gUGVyaGFwcyBJIHdvbid0IGNoYW5nZSAKPiB0aGlzIHZh
cmlhYmxlIG5hbWUsIGFuZCBqdXN0IGFkZCBzb21lIGNvbW1lbnRzIHRvIHRoaXMgdmFyaWFibGXi
gJR3aGF0Cj4gZG8geW91IHRoaW5rPwoKVGhpcyBpcyBhIGJvb2xlYW4sIG5vdCBhIHJlZ2lzdGVy
IGJpdCBmaWVsZC4gUGxlYXNlIHVzZSBhIG5hbWUgdGhhdAptYWtlcyBzZW5zZSBoZXJlLiBUaGlz
IGlzIHRoZSBwYXJ0IG9mIHRoZSBzb2Z0d2FyZSB0aGF0IHBlb3BsZSBtdXN0CnVuZGVyc3RhbmRp
bmcgd2l0aG91dCBkZWVwIGhhcmR3YXJlIGtub3dsZWdlLiBZb3UgY2FuIGtlZXAgdGhlIGhhcmR3
YXJlCm5hbWUgZm9yIG5hbWluZyB0aGUgYml0ZmllbGQgb3BlcmF0aW9uIGlmIHRoYXQncyByZWxl
dmFudCB0aG91Z2guCgo+PiBBbHNvLCBpZiBteSBhYm92ZSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJl
Y3QsIHlvdSBtdXN0IHByb3ZpZGUgYQo+PiBzdXBwb3J0c19vcCgpIGNhbGxiYWNrIHdoaWNoIHdv
dWxkIHJlZnVzZSBhbnkgeFMteFMteEQgYnV0IGFsbG93IHhELXhELXhECj4+IGFuZCB4Uy14RC1E
IG1vZGVzLgo+Cj4gT0ssIEknbGwgYWRkIHNvbWUgZmlsdGVyIGNvbmRpdGlvbnMuCj4KPiBCZXN0
IFJlZ2FyZHMsCj4gQ2hhbmdodWFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
