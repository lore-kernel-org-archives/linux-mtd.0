Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26795CD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9WxwpFpZnw8JqqcUDGmMfzvn00rACGA8cxMrqfuadY=; b=C08b/GMJyr2daT
	4DOyroxvtN3H5pO7x34gGWZMT/W4dr5KTYUEuKit2P8KKnOL97HtNqUXBdODI6V0u/dwjAHLVokpw
	eR3P69Wvumy14ppS8RT2Vetym5e/K//1gbfgQ06+mn6XWw7gRl98aAlV0ivs8l6xp/iwWiEG5xJT5
	zfDYVESY0HLzv1vmZzlBlI6avnrtFTfyZlg6z29sW98UwXEfy45NlRx6s/6KCVcNrTRVVswEC9c1H
	XT9WVDsnaHlu/ISkhwCbMXO3Pr46sYUlz1h23U1VYHtO24lnJvHa3KoYztXC2rpHxPw4xWYQNedMO
	QD8NzG0I/q3zfwtvwhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWMA-00000005QK9-1nvy;
	Thu, 28 May 2026 08:44:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWM8-00000005QJB-1kcA
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 08:44:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E3E674E42D77;
	Thu, 28 May 2026 08:44:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4BAD60495;
	Thu, 28 May 2026 08:44:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B7CF1088877F;
	Thu, 28 May 2026 10:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779957880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gB60yIvdllqSTxzVmv+2Jkcre5pBJLowX9gbXUxQDJU=;
	b=kdm6bCSHoHGgTlHbCd1B3Ar9CfUWv7ncS+50PMakeybZFMBuWQJ0RU3rcfPuQbEJKoUAq4
	bznED1MDr2LJ3l8x0zFlI0jG3wtsoSN5BesVH6za7YI3ZJDoWszE+d39mw/StJx/jWn8ox
	Py9LwHqcdPUpVsz22rfsqrC3A4f2jEJRpZxzsNq/+Tzn2Y2ZSPhPlPyMLrg+d1r6DxDGRF
	J8CDLq7p+sHq4x+oH78TG2UJj3KITgXdXcN4In7qYxlcCUJV2CVywlPwef6Rwssih3nVOU
	SB7QqqpobhdEDsmBxe6ApRQTchQV1k8SCLN98DW+65p+FUmlCmoM9jX0RYAvIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 05/13] spi: spi-mem: add execute_tuning callback and
 spi_mem_execute_tuning()
In-Reply-To: <20260527175527.2247679-6-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 27 May 2026 23:25:19 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-6-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 10:44:37 +0200
Message-ID: <87a4tjhqiy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_014444_591423_C621FDF6 
X-CRM114-Status: UNSURE (   7.13  )
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

T24gMjcvMDUvMjAyNiBhdCAyMzoyNToxOSArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBTUEkgbWVtb3J5IGNvbnRyb2xsZXJzIHRoYXQgc3VwcG9ydCBoaWdo
LXNwZWVkIG9wZXJhdGluZyBtb2RlcyBvZnRlbgo+IHJlcXVpcmUgYSB0dW5pbmcgcHJvY2VkdXJl
IHRvIGNhbGlicmF0ZSBpbnRlcm5hbCB0aW1pbmcgYmVmb3JlIG9wZXJhdGluZwo+IGF0IG1heGlt
dW0gZnJlcXVlbmN5LiBUaGVyZSBpcyBjdXJyZW50bHkgbm8gc3RhbmRhcmQgc3BpLW1lbSBpbnRl
cmZhY2UKPiBmb3IgZHJpdmVycyB0byB0cmlnZ2VyIHRoaXMgcHJvY2VkdXJlLgo+Cj4gQWRkIGFu
IGV4ZWN1dGVfdHVuaW5nIGNhbGxiYWNrIHRvIHN0cnVjdCBzcGlfY29udHJvbGxlcl9tZW1fb3Bz
LiBUaGUKPiBjYWxsYmFjayByZWNlaXZlcyBhIG1hbmRhdG9yeSByZWFkIG9wIHRlbXBsYXRlIGFu
ZCBhbiBvcHRpb25hbCB3cml0ZSBvcAo+IHRlbXBsYXRlLiBPbiBzdWNjZXNzIHRoZSBjb250cm9s
bGVyIHNldHMgb3AtPm1heF9mcmVxIGluIGVhY2ggcHJvdmlkZWQKPiB0ZW1wbGF0ZSB0byB0aGUg
dmFsaWRhdGVkIGNsb2NrIHJhdGUuCj4KPiBBZGQgdGhlIGNvcnJlc3BvbmRpbmcgc3BpX21lbV9l
eGVjdXRlX3R1bmluZygpIHdyYXBwZXIgdGhhdCB2YWxpZGF0ZXMKPiBpbnB1dHMgYW5kIHJldHVy
bnMgLUVPUE5PVFNVUFAgd2hlbiB0aGUgY29udHJvbGxlciBoYXMgbm90IGltcGxlbWVudGVkCj4g
dGhlIGNhbGxiYWNrLCBhbGxvd2luZyBjYWxsZXJzIHRvIGhhbmRsZSBjb250cm9sbGVycyB0aGF0
IGRvIG5vdCBzdXBwb3J0Cj4gdHVuaW5nIGdyYWNlZnVsbHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBT
YW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4KClRoaXMgYXBwcm9hY2ggbG9va3Mgc28gbXVj
aCBiZXR0ZXIuCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
