Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC49C43327
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+1VXVxF0X31K9Af9rMY2vjayLJuDLGwmlKKfXykVwA=; b=ZlMcMYp86+ws4Z
	cVBrvzjanfGjseMIbnI5/7PbBbNGXOR7vIE/avOj8Oal24vaYLK0Y8MuYB3+Z/ITdKh4LyxetoF0s
	G7tOqZD9439fSY2G3yQnIy3d+Z5HZLCKb1BqLwV8G0GOf8XhA+sX+p/775LE34EeEsRlsL4hnUrdL
	FqeiRFHSXS8RINzlm7hRWVYtaNj0la/p/YAvKguT8v9yJqzrMOj0RUBSKabe0MsW9nYDqrBKR1D4i
	ed9DfP+mcSXSYP8xz+Fph+WoRtCPxfX1JPi2j2aaDtXqCSflBNvaQ6Ls97agIMzRqrBDA+vwx9RdD
	X4jX21EJ0FYdfTiyzV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDTD-0000000EziL-456d;
	Mon, 29 Jun 2026 15:00:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDTB-0000000EzgL-40JV
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 15:00:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 367CB1A0D01;
	Mon, 29 Jun 2026 15:00:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 042F25FF96;
	Mon, 29 Jun 2026 15:00:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85D5A106F184F;
	Mon, 29 Jun 2026 17:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782745219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d3Xv+O5xuFOTx+Xge18Kyo2bD5dDAtS5hRizv4OYGh0=;
	b=MnojvqYovpn8BefBadsgsfgntBBWHp81xGPIcckWAYu7YeagSJOARJyHkWrqZpdVvA/RX4
	eEKzSC39JADcyiLS/7FL6pgUDrIWvMymKZzUWup0w6XOCWB1A9OKImN99euGGl4uYSdp/i
	vPC/QbjC4R/5nFzv+5JPgOvJxsfsBkihtH8ZmuGe5f7v9i95cUE63FIb7xNaa0V/3kQ+AU
	z9TJzo0Mvshk9zeNvnNqcF0ocRPpAICNv0/8EQ4F3JYN9nxjLjJSO6Vyf2G3707bUYDaJc
	n/KEBEhTwG9YrOeRbVhoIcpTis/esVQQCWlXoNSSDeyROvyeOLz+FNnx+XHdHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: onenand: samsung: report DMA completion timeouts
In-Reply-To: <20260623061233.40188-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Tue, 23 Jun 2026 14:12:33 +0800")
References: <20260623061233.40188-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Jun 2026 17:00:16 +0200
Message-ID: <871pdptmrj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080022_133301_16F61D8E 
X-CRM114-Status: UNSURE (   6.93  )
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

SGkgUGVuZ3BlbmcsCgpPbiAyMy8wNi8yMDI2IGF0IDE0OjEyOjMzICswOCwgUGVuZ3BlbmcgSG91
IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IFRoZSBTNVBDMTEwIE9uZU5BTkQgRE1B
IGhlbHBlcnMgaGF2ZSBib3VuZGVkIHdhaXRzIGZvciB0cmFuc2Zlcgo+IGNvbXBsZXRpb24uIFRo
ZSBwb2xsaW5nIGhlbHBlciBmYWxscyBvdXQgb2YgaXRzIHRpbWVvdXQgbG9vcCBhbmQgcmV0dXJu
cwo+IHN1Y2Nlc3MsIGFuZCB0aGUgSVJRIGhlbHBlciBpZ25vcmVzIHdhaXRfZm9yX2NvbXBsZXRp
b25fdGltZW91dCgpLgo+Cj4gUmV0dXJuIC1FVElNRURPVVQgd2hlbiB0aGUgRE1BIHRyYW5zZmVy
LWRvbmUgYml0IG9yIGNvbXBsZXRpb24gZG9lcyBub3QKPiBhcnJpdmUgYmVmb3JlIHRoZSB0aW1l
b3V0IHNvIGNhbGxlcnMgY2FuIHRyZWF0IHRoZSBidWZmZXIgdHJhbnNmZXIgYXMKPiBmYWlsZWQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5ncGVuZyBIb3UgPHBlbmdwZW5nQGlzY2FzLmFjLmNuPgoK
VGhlcmUgaXMgYSBsaXN0IGEgY29tbWl0cyBmb3Igd2hpY2ggeW91IGZvcmdvdCB0byBDYzogc3Rh
YmxlIGFuZCBtb3JlCmltcG9ydGFudGx5IHNldCBhIEZpeGVzIHRhZy4gUGxlYXNlIGFkZCB0aGUg
bWlzc2luZyB0YWdzIGFuZCBzZW5kIGEgdjIKZm9yIHRoZSBmb2xsb3dpbmcgY29tbWl0czoKCltQ
QVRDSF0gbXRkOiByYXduYW5kOiBscGMzMnh4X21sYzogZmFpbCBETUEgdHJhbnNmZXJzIG9uIHRp
bWVvdXQKW1BBVENIXSBtdGQ6IHJhd25hbmQ6IGxwYzMyeHhfc2xjOiBmYWlsIERNQSB0cmFuc2Zl
ciBvbiBjb21wbGV0aW9uIHRpbWVvdXQKW1BBVENIXSBtdGQ6IG1jaHAyM2syNTY6IFVzZSBTUEkg
bWF0Y2ggZGF0YSBmb3IgY2hpcCBjYXBzCltQQVRDSF0gbXRkOiByYXduYW5kOiBmc2xfaWZjOiBy
ZXR1cm4gZXJyb3JzIGZvciBmYWlsZWQgcGFnZSByZWFkcwpbUEFUQ0hdIG10ZDogb25lbmFuZDog
c2Ftc3VuZzogcmVwb3J0IERNQSBjb21wbGV0aW9uIHRpbWVvdXRzCgpUaGFuayB5b3UsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
