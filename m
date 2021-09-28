Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4FAC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:55:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E3A7611CC
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E3A7611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJ5M0Y8QXmTt6Pzbq8EfAkWEqb8RhY4pGfUkkQzXTxQ=; b=GkGslMj/O6kzY+
	QT+dZsGb+uRjVsDwcBu32n81ZhRY4oYB8UkuPaZULFERKVzFE6Je0iAmjvKDiZFGrNeaGQlIgSSod
	I2+Y0zY0ZqmcMxjEbkYcnCrTtYQntN5mf7fQMMkw+1fc/+ia5a8XgiNvlsjc91SJdIZCFk4L8t2Oh
	hAGT7CO21kZTeH4XJQFlTqKQg6YIbYNT2MB2RGL/yGaFU6Y21y9pFqIk9MWyzHfzaqt2yCtuIcvWt
	0T2tTN3f3Vsl6dkpNFfHc9q7ufqvXAn52ZDzG1BJautLyVV7GSqCy4GjPv0E5opMnz6Iw74S94gPy
	q6fjmaSdqw+u11GcBtBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVCdF-007FNn-94; Tue, 28 Sep 2021 12:54:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVCdB-007FLh-LO
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 12:54:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0356F20002;
 Tue, 28 Sep 2021 12:54:41 +0000 (UTC)
Date: Tue, 28 Sep 2021 14:54:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 3/3] mtd: rawnand: qcom: Add support for page scope read
Message-ID: <20210928145440.758ead6b@xps13>
In-Reply-To: <8765976685ca3a04af1c102a69c9ca63@codeaurora.org>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
 <1631699851-12172-4-git-send-email-mdalam@codeaurora.org>
 <8765976685ca3a04af1c102a69c9ca63@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_055445_878425_6864B388 
X-CRM114-Status: GOOD (  16.21  )
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

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gVHVlLCAyOCBTZXAgMjAyMSAx
Nzo1MTowMCArMDUzMDoKCj4gT24gMjAyMS0wOS0xNSAxNToyNywgTWQgU2FkcmUgQWxhbSB3cm90
ZToKPiA+IFFQSUMgVjIuMCBvbndhcmRzIFFQSUMgY29udHJvbGxlciBzdXBwb3J0IGVuaGFuY2Vk
IHJlYWQgbW9kZQo+ID4gbGlrZSBwYWdlIHNjb3BlIHJlYWQgYW5kIG11bHRpIHBhZ2UgcmVhZC4K
PiA+IAo+ID4gSW4gUVBJQyBWMSwgU1cgaXMgbmVlZGVkIHRvIHdyaXRlIEVYRUNfQ01EIHJlZ2lz
dGVyIGZvciBlYWNoCgogICAgICAgICAgICAgICAgdGhlIGRyaXZlciBuZWVkcyB0byAoc2FtZSBi
ZWxvdykKCj4gPiBDb2RlIHdvcmQgYW5kIGNvbGxlY3QgYW55IFN0YXR1cyByZWxhdGVkIHRvIHRo
YXQgQ1cgYmVmb3JlCj4gPiBpc3N1ZWluZyBFWEVDX0NNRCBmb3IgbmV4dCBDVy4KPiA+IAo+ID4g
UGFnZSBzY29wZSBjb21tYW5kIGlzIHRydWx5IGEgcGFnZSBtb2RlIGNvbW1hbmQgd2hlcmUgU1cg
aXMKPiA+IHJlcXVpcmVkIHRvIGlzc3VlIEVYRUNfQ01EIG9ubHkgb25jZSBmb3IgYSBwYWdlLiBD
b250cm9sbGVyCj4gPiBIVyB0YWtlcyBjYXJlIG9mIENvZGV3b3JkIHNwZWNpZmljIGRldGFpbHMg
YW5kIGF1dG9tYXRpY2FsbHkKPiA+IHJldHVybnMgc3RhdHVzIGFzc29jaWF0ZWQgd2l0aCBlYWNo
IENXIHRvIEJBTSBwaXBlLCBkZWRpY2F0ZWQKPiA+IGZvciBzdGF0dXMgZGVwb3NpdGlvbi4KPiA+
IAo+ID4gV2l0aCB0aGlzIGNvbW1hbmQsIFNXIG5vdyBjYW4gaXNzdWUgb25lIHJlYWQgY29tbWFu
ZCBmb3IgYSBwYWdlCj4gPiBhbmQgdXBvbiByZWNlaXZpbmcgY29tcGxldGlvbiBpbnRlcnJ1cHQs
IGNhbiBwcm9jZXNzIHN0YXR1cywKPiA+IHRoYXQgaGF2ZSBhbHJlYWR5IGJlZW4gZGVwb3NpdGVk
IGluIG1lbW9yeSB0aHJvdWdoIHN0YXR1cyBCQU0gcGlwZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgNzcgPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPiA+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
