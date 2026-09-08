Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF44C79F82
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNf77UU8ZlCf9tUagBoLR/E9qAseoezf1M936+84pJA=; b=cgEs+sA5JP3/he
	C9rgzFlAAfv/9IrwD1lOd0jeqXA09G/gbv/z0ZOehjAgR0xTyrpAtDuYhMR8kCP3oNntfDF4X3p0r
	4mWJNkmPtGXGyoN2Sir5uJDDFM1tChpT0kZHsJZy1O8/sBGsyO9EqLNLRCA4iojlogLWXEv34dP6a
	95OzUQrAWHr2vGZtudcNv2loN05H8b0QMMaQNmA+VFSTBcfBFY21zVifAY3toDPqjSbZmIOdhYX5O
	yjzAAi1gT5Wpjln0tTxZt0I6/0/l2MLxvR3ujqeP7GfQOEIjTQBixk0LC/YiPoVNbSU36X12vK7Oe
	8jfCbc7rDIZq2c9Yqsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sg9-00000008inB-0Ze3;
	Tue, 08 Sep 2026 10:03:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sg5-00000008ilM-2Sma;
	Tue, 08 Sep 2026 10:03:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A1D9A1A1A56;
	Tue,  8 Sep 2026 10:03:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73C25603C4;
	Tue,  8 Sep 2026 10:03:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C87711C7AF5C;
	Tue,  8 Sep 2026 12:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5vAQX4mLQwg3bgyjWIDegZmml35dIae71Cu53YVyKVc=;
	b=HJxw7a5n7JiOtutr1aQa1jZOAcwYz7vUl4NtBmXInV72w47M2bbpX/gqsgpboIQx2ttkkD
	uJhck1Odhe6MP98SkTQKScFMRfE+5rZvf2rZimWdm5MoC+P3Vt1g8SUjbHeVIGdvRCwoO3
	ZbuzkTmBrjV6OMhxCdmzmvHQ/A6D8ohLa4PtjAqD7VLGrwY+PRcX7UZ2YBzXC3FGJ0HrxZ
	wLeFInhRpblg7OiYJyNlVTfsWzs8Qv1eFkR+N9jQ8iDBUhTHmI+JplH6lx4pGdlSV5BA60
	hhUYLGMmQCeKzYfHZ5VZTkgd4in2hMlAyW681J1LPsot4e024AN+k71R7E96Ew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page
 size
In-Reply-To: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
	(James Hilliard's message of "Fri, 04 Sep 2026 16:39:27 -0600")
References: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 12:03:33 +0200
Message-ID: <87zexst5ze.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_030345_763979_C7C0B046 
X-CRM114-Status: GOOD (  10.21  )
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

SGVsbG8gSmFtZXMsCgpPbiAwNC8wOS8yMDI2IGF0IDE2OjM5OjI3IC0wNiwgSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBXaGVuIG5hbmQtZWNjLW1h
eGltaXplIGlzIHNldCwgdGhlIGRyaXZlciB1bmNvbmRpdGlvbmFsbHkgc2VsZWN0cyBhCj4gMTAy
NC1ieXRlIEVDQyBzdGVwLiBBIE5BTkQgd2l0aCBhIDUxMi1ieXRlIHBhZ2UgY29uc2VxdWVudGx5
IHByb2R1Y2VzCj4gemVybyBFQ0Mgc3RlcHMgYmVmb3JlIHRoZSBhdmFpbGFibGUgT09CIGJ5dGVz
IGFyZSBkaXZpZGVkIGJ5IHRoZSBzdGVwCj4gY291bnQuCj4KPiBUaGUgb2xkZXIgc3VueGkgTkFO
RCBjb250cm9sbGVycyBzdXBwb3J0IDUxMi1ieXRlIEVDQyBibG9ja3MuIFNlbGVjdCB0aGUKPiBz
bWFsbGVyIG9mIHRoZSBwYWdlIHNpemUgYW5kIHRoZSBwcmVmZXJyZWQgMTAyNC1ieXRlIHN0ZXAs
IHVzaW5nIGEKPiA1MTItYnl0ZSBzdGVwIGZvciBhIDUxMi1ieXRlIHBhZ2Ugd2hpbGUgcmV0YWlu
aW5nIDEwMjQtYnl0ZSBzdGVwcyBmb3IKPiBsYXJnZXIgcGFnZXMuIFVuc3VwcG9ydGVkIHNtYWxs
ZXIgc3RlcHMgYW5kIGNvbnRyb2xsZXJzIHdpdGhvdXQKPiA1MTItYnl0ZSBzdXBwb3J0IGNvbnRp
bnVlIHRvIGJlIHJlamVjdGVkIGJ5IHRoZSBleGlzdGluZyBjaGVja3MuCj4KPiBGaXhlczogNDc5
NmQ4NjU1OTE1ICgibXRkOiBuYW5kOiBzdW54aTogU3VwcG9ydCBFQ0MgbWF4aW1pemF0aW9uIikK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxp
YXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKQXMgcmVwb3J0ZWQgYnkgU2FzaGlrbywg
dGhlcmUgaXMgYW5vdGhlciB1c2Ugb2YgMTAyNCBkb3duIHRoZSByb2FkIHdoaWNoCm11c3QgYmUg
bW9kaWZpZWQgYWNjb3JkaW5nbHkuIEFsdGhvdWdoLCBpbiBwcmFjdGljZSwgNTEyLWJ5dGUgcGFn
ZSBOQU5EcwpoYXZlIGRpc2FwcGVhcmVkIGZvciBxdWl0ZSBzb21lIHRpbWUsIHNvIHRoaXMgaXMg
YSB0aGVvcmV0aWNhbCBmaXggbW9yZQp0aGFuIGEgcmVhbCBwcm9ibGVtLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
