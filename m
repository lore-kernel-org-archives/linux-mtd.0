Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B50C48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 17:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CD4205F4
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 17:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IccTeOGW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84CD4205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/i0N2cfw+mnyPyheupG5FGSZMwXUmduPflVCOqmx9Y=; b=IccTeOGWrYdvKl
	36mgSO2fUJfTa/aM0hsjYPeIO6/D+N52ds/NCNX253nQAzZ6tU4E+Byno1YM0B8epqT26gM56YWCZ
	BZ72CcJ5yU6G5KUwDWB0I2IJ1kutK8hOZKKL/X7r5F4Ehala97kCk14MlqMW0+idT0djDZ6e/bVeB
	FdKL3rFAobbFbP8T5mEq7/KqfIdWhXkrUJRyY4yk5gdo0wDL7rDmcztnIQjohT17xlhvN0TQssrPf
	+SWgz16jcZz20EX9L9IMECLeFEAXzn2rWOFwsMuXfOIsQbwDJwF1f3/Niv7cFJrnbg3+AYOUOVB0Z
	YYtGDiB21d5lxFel3p8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgXrY-0006hW-5g; Thu, 27 Jun 2019 17:07:08 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgXrT-0006eM-Av
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 17:07:05 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8FDC2240003;
 Thu, 27 Jun 2019 17:06:46 +0000 (UTC)
Date: Thu, 27 Jun 2019 19:06:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [RESEND PATCH v2] mtd: spinand: read return badly if the last
 page has bitflips
Message-ID: <20190627190644.25aaaf31@xps13>
In-Reply-To: <97adf58f-4771-90f1-bdaf-5a9d00eef768@kontron.de>
References: <1561424549-784-1-git-send-email-liaoweixiong@allwinnertech.com>
 <20190625030807.GA11074@kroah.com>
 <97adf58f-4771-90f1-bdaf-5a9d00eef768@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_100703_679098_3B80188D 
X-CRM114-Status: GOOD (  14.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpTY2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+IHdy
b3RlIG9uIFR1ZSwgMjUgSnVuCjIwMTkgMDc6MDQ6MDYgKzAwMDA6Cgo+IEhpIGxpYW93ZWl4aW9u
ZywKPiAKPiBPbiAyNS4wNi4xOSAwNTowOCwgR3JlZyBLSCB3cm90ZToKPiA+IE9uIFR1ZSwgSnVu
IDI1LCAyMDE5IGF0IDA5OjAyOjI5QU0gKzA4MDAsIGxpYW93ZWl4aW9uZyB3cm90ZTogIAo+ID4+
IEluIGNhc2Ugb2YgdGhlIGxhc3QgcGFnZSBjb250YWluaW5nIGJpdGZsaXBzIChyZXQgPiAwKSwK
PiA+PiBzcGluYW5kX210ZF9yZWFkKCkgd2lsbCByZXR1cm4gdGhhdCBudW1iZXIgb2YgYml0Zmxp
cHMgZm9yIHRoZSBsYXN0Cj4gPj4gcGFnZS4gQnV0IHRvIG1lIGl0IGxvb2tzIGxpa2UgaXQgc2hv
dWxkIGluc3RlYWQgcmV0dXJuIG1heF9iaXRmbGlwcyBsaWtlCj4gPj4gaXQgZG9lcyB3aGVuIHRo
ZSBsYXN0IHBhZ2UgcmVhZCByZXR1cm5zIHdpdGggMC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6
IGxpYW93ZWl4aW9uZyA8bGlhb3dlaXhpb25nQGFsbHdpbm5lcnRlY2guY29tPgoKUGxlYXNlIHdy
aXRlIHlvdXIgZW50aXJlIG9mZmljaWFsIGZpcnN0L2xhc3QgbmFtZShzKQoKPiA+PiBSZXZpZXdl
ZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+
PiBSZXZpZXdlZC1ieTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9u
LmRlPgoKSSBhbSB3YWl0aW5nIHlvdXIgbmV4dCB2ZXJzaW9uIHdpdGggQWNrZWQtYnkgaW5zdGVh
ZCBvZiBSZXdpZXZlZC1ieQp0YWdzIGFuZCBHcmVnJ3MgY29tbWVudCBhZGRyZXNzZWQuCj4gPj4g
Rml4ZXM6IDc1MjlkZjQ2NTI0OCAoIm10ZDogbmFuZDogQWRkIGNvcmUgaW5mcmFzdHJ1Y3R1cmUg
dG8gc3VwcG9ydCBTUEkgTkFORHMiKQoKRmluYWxseSwgd2hlbiB3ZSBhc2sgeW91IHRvIHJlc2Vu
ZCBhIHBhdGNoLCBpdCBtZWFucyBzZW5kaW5nIGEgbmV3CnZlcnNpb24gb2YgdGhlIHBhdGNoLiBT
byBpbiB0aGUgc3ViamVjdCwgeW91IHNob3VsZCBub3QgdXNlIHRoZQpbUkVTRU5EXSBrZXl3b3Jk
ICh3aGljaCBtZWFucyB5b3UgYXJlIHNlbmRpbmcgc29tZXRoaW5nIGFnYWluIGV4YWN0bHkKYXMg
aXQgd2FzIGJlZm9yZSwgeW91IGp1c3QgZ290IGlnbm9yZWQsIGZvciBleGFtcGxlKSBidXQgaW5z
dGVhZCB5b3UKc2hvdWxkIGluY3JlbWVudCB0aGUgdmVyc2lvbiBudW1iZXIgKHYzKSBhbmQgYWxz
byB3cml0ZSBhIG5pY2UKY2hhbmdlbG9nIGFmdGVyIHRoZSB0aHJlZSBkYXNoZXMgJy0tLScgKHdp
bGwgYmUgaWdub3JlZCBieSBHaXQgd2hlbgphcHBseWluZykuCgpJIHdvdWxkIGxpa2UgdG8gcXVl
dWUgdGhpcyBmb3IgdGhlIG5leHQgcmVsZWFzZSBzbyBpZiB5b3UgY2FuIGRvIGl0CkFTQVAsIHRo
YXQgd291bGQgYmUgZ3JlYXQuCgpUaGFuayB5b3UsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
