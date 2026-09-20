Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46398C982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXjbDTiJ8miuJPb4czSSL3hrXWzKUFFhzJGZIqyacYI=; b=YYNmYcfrY8vPjD
	5GS4dhxs6ff8xolq/HKJw7Tymeqo/7pG3D9l/QPJd48foQL38xdmmcnK4/iV6dLb5TI14+NUvWFTp
	CiO819IIlDBMNzJOFK75HL3mXOBw7imJg0KYQNLFEGE29NBXIxciuvsUNY72HM3sbAnkuhbaRwzyR
	dmQO++jcEdswPAv0SKMjZY1oOB6tXNqXDpFUh+YbjSe8i28AAVcMKzH9qR0DGWQlzCFD2xmAcWqMg
	B/oBfonFe/TaIXS2MHlYkaOWkOTfUsFN6QmUZWTWbvF5ACoDtIsWV7vMFda/zap93ZeUvixiCrSEz
	Z0vBfgTZTKsbCKSb41+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HVe-0000000HV8j-12Wp;
	Sun, 20 Sep 2026 13:23:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HVb-0000000HV8M-28Jw
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 13:23:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B1A91A08D2;
	Sun, 20 Sep 2026 13:23:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF098604C9;
	Sun, 20 Sep 2026 13:23:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50E70103286A4;
	Sun, 20 Sep 2026 15:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789910584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8vV8cCJ+6eZcKQ1SFAzh2G4y77glvAtKW3F5PJIB5AU=;
	b=zxZceTrC/U/Wh0gJBakYE+QKIcMtXDWM4PXY2A5W8WG852SPa3tSfh89TsZ+WOVCV7Cusm
	8YnPkgMztHcd+Usl4qPDF7COB36UTCRqM6f3J1oHARGPlUPoYh7ap4VBv5GH8fQpxUEiR0
	ldG0LZGyf00N9rL7Pue59ej2LlEwbkdg0/fufUVB/gayw+yeGtblbsqbs+4rLCkLGVFkfS
	iaO9PHGImE35MsmCXo8t6bZ8CfI/08rSqotdPfuMQeWWLWZBcYSAaT9NWU/vJ1DjpF4oQp
	rneiOQEli7B283b9MUn3V7slY2sE3EC013+wJHkQmn2ZeRqD7S1jz/dzH5Fayg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: intel: fix OF node reference leak
In-Reply-To: <20260915163407.2487869-1-lgs201920130244@gmail.com> (Guangshuo
	Li's message of "Wed, 16 Sep 2026 00:34:07 +0800")
References: <20260915163407.2487869-1-lgs201920130244@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 15:22:57 +0200
Message-ID: <878q4w9hvy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_062307_690063_E413C038 
X-CRM114-Status: GOOD (  10.59  )
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

T24gMTYvMDkvMjAyNiBhdCAwMDozNDowNyArMDgsIEd1YW5nc2h1byBMaSA8bGdzMjAxOTIwMTMw
MjQ0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IGVidV9uYW5kX3Byb2JlKCkgZ2V0cyBhIHJlZmVyZW5j
ZSB0byB0aGUgTkFORCBjaGlwIG5vZGUgd2l0aAo+IG9mX2dldF9uZXh0X2NoaWxkKCkuIFRoZSBw
cm9iZSBmYWlsdXJlIHBhdGhzIHJlbGVhc2UgdGhlIHJlZmVyZW5jZSB3aXRoCj4gb2Zfbm9kZV9w
dXQoKSwgYnV0IHRoZSBzdWNjZXNzZnVsIHByb2JlIHBhdGgga2VlcHMgaXQgZm9yIHRoZSBsaWZl
dGltZQo+IG9mIHRoZSBkZXZpY2UgYW5kIGVidV9uYW5kX3JlbW92ZSgpIG5ldmVyIGRyb3BzIGl0
Lgo+Cj4gQXMgYSByZXN1bHQsIGVhY2ggYmluZC91bmJpbmQgY3ljbGUgbGVha3MgYSByZWZlcmVu
Y2UgdG8gdGhlIE5BTkQgY2hpcAo+IGRldmljZSBub2RlLgo+Cj4gRHJvcCB0aGUgcmVmZXJlbmNl
IGluIGVidV9uYW5kX3JlbW92ZSgpIGFmdGVyIHRoZSBOQU5EIHRlYXJkb3duIHVzaW5nCj4gdGhl
IGZsYXNoIG5vZGUgc3RvcmVkIGluIHRoZSBOQU5EIGNoaXAuCj4KPiBUaGlzIGlzc3VlIHdhcyBm
b3VuZCBieSBtYW51YWwgY29kZSBpbnNwZWN0aW9uLgoKRmVlbHMgbGlrZSB3aGF0IHlvdSBzYXkg
aXMgbm90IHdoYXQgeW91IGRvLiBQbGVhc2UgYWxpZ24gdGhlIGNvZGUgb3IgdGhlCmNvbW1pdCBs
b2cgd2l0aCB5b3VyIHJlYWwgaW50ZW50aW9uLgoKPiBGaXhlczogYmZjNjE4ZmNjM2YxICgibXRk
OiByYXduYW5kOiBpbnRlbDogUmVhZCB0aGUgY2hpcC1zZWxlY3QgbGluZSBmcm9tIHRoZSBjb3Jy
ZWN0IE9GIG5vZGUiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1i
eTogR3VhbmdzaHVvIExpIDxsZ3MyMDE5MjAxMzAyNDRAZ21haWwuY29tPgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
