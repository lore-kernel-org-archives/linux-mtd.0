Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4574C25B75
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHwRVs5kBZFC9w6X6sIUr5uqxuSd8Xkl8z1746knlzU=; b=B+x0p1OCaF06qg
	ulsGV43lu7esEFWQTjeBfMY/Cj7q9H+doEqbLwj4CDaQXHLpZm9nVWUsQ9RG5Y3UyuVJThUj+4ugy
	ld+PiNgMSASJ4WlNlNzNBkCxT3kk4MmgatGPUL7hdXYbNN4GZycgNcyI12Yd0b6JL/WgqtDhiopr9
	LMlzsqBDF1TOw9NyAtPA2/h4Hk+36rt8aTXcWoIiEkQFGYSg5jsZ7goDhDilGH6N5kugsFaUhO/Y/
	kqIqglO2j2mmLomRGrJxgM3Qmi9HduMFytxw8DwvyZwK5DjHoLkANyrtnB2ZUfaKKzHb5iY9mwYiU
	HMMVHRfNBWqF6LvAahPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pCg-0000000FXfw-2dIJ;
	Tue, 14 May 2024 10:16:14 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pCc-0000000FXe5-0jMN
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 10:16:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDDEBC0002;
	Tue, 14 May 2024 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715681764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwCC6DgkYOnVAxgMfGgxDNcG6VVfSmS67z1fSU/thog=;
	b=NFTEov9iI5E64TeidBAdI2psIbgOEwyX5cRn4SJ9+5jKxszuZq/KTeBDioN+4kD5T6U1PJ
	xQKIzCNP/jYrLsLwk87WFrSI8JYwwEVkHRxrjkEoVu/riiPUWt0GQArqqhIj7gm0WLPzSW
	ZF0nRax0V84TMBbcHo1YDWbXgiaUzswHF7QU597f0BUCIqW1OCyDdOzg++5X9kg5IJfmgy
	I2b4fLhQluCYiLEt3hh/s0NdBy26ST2YkzAOdLG1JLH6I45C/IWVjjp2ZcEMPWDRxQehiq
	N4GRDvbZY10IuJ433U5mShBNHYppN8WQovPbGgDGAXPQ4z7C8aOExf6CCnodeg==
Date: Tue, 14 May 2024 12:16:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <20240514121602.273f788e@xps-13>
In-Reply-To: <ZkMsS1jj-ZTpZyE1@pengutronix.de>
References: <20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de>
	<20240508-mtd-nand-mxc-nand-exec-op-v2-2-6b7366b7831f@pengutronix.de>
	<20240513091902.2c00d30a@xps-13>
	<20240513093256.363861d1@xps-13>
	<ZkMsS1jj-ZTpZyE1@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_031610_516493_58C4F19A 
X-CRM114-Status: GOOD (  20.04  )
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

SGkgU2FzY2hhLAoKPiA+ID4gPiArCQljYXNlIE5BTkRfT1BfV0FJVFJEWV9JTlNUUjoKPiA+ID4g
PiArCQkJLyoKPiA+ID4gPiArCQkJICogTkZDIGhhbmRsZXMgUi9CIGludGVybmFsbHkuIFRoZXJl
Zm9yZSwgdGhpcyBmdW5jdGlvbgo+ID4gPiA+ICsJCQkgKiBhbHdheXMgcmV0dXJucyBzdGF0dXMg
YXMgcmVhZHkuICAgIAo+ID4gPiAKPiA+ID4gVGhpcyBpcyBubyBsb25nZXIgYSBzdGFuZGFsb25l
IGZ1bmN0aW9uLCBtYXliZToKPiA+ID4gCj4gPiA+ICJUaGUgY29udHJvbGxlciBoYW5kbGVzIHRo
ZSBSL0IgcGluIGludGVybmFsbHksIHRoZXJlZm9yZSB0aGVyZSBpcwo+ID4gPiBub3RoaW5nIHRv
IGRvIGhlcmUuIiAgCj4gCj4gT2suCj4gCj4gPiAKPiA+IEFuZCB0aGlzIGlzIGFjdHVhbGx5IHZl
cnkgd3JvbmcuCj4gPiAKPiA+IFlvdSBzaG91bGQgY2FsbCB3YWl0X29wX2RvbmUoKSBpbnN0ZWFk
LiAgCj4gCj4gTm8sIEkgZG9uJ3QgdGhpbmsgc28uIHdhaXRfb3BfZG9uZSgpIGlzIGNhbGxlZCB0
byB3YWl0IGZvciB0aGUgaW50ZXJydXB0Cj4gb2YgdGhlIGNvbnRyb2xsZXIgaW5kaWNhdGluZyBh
IGJhc2ljIG9wZXJhdGlvbiBpcyBkb25lLiBBIGJhc2ljIG9wZXJhdGlvbgo+IGNhbiBiZSB0aGF0
IGEgY29tbWFuZCBpcyBiZWluZyBzZW50IG9yIGFuIGFkZHJlc3MgYnl0ZSBoYXMgYmVlbiBzZW50
IHRvCj4gdGhlIGNoaXAgZHVyaW5nIGFuIGFkZHJlc3MgY3ljbGUuCj4gCj4gV2l0aCB0aGlzIGFy
Yml0cmFyeSBleGFtcGxlOgo+IAo+IAlzdHJ1Y3QgbmFuZF9vcF9pbnN0ciBpbnN0cnNbXSA9IHsK
PiAJCU5BTkRfT1BfQ01EKE5BTkRfQ01EX1JFQUQwLCAwKSwKPiAJCU5BTkRfT1BfQUREUig0LCBh
ZGRycywgMCksCj4gCQlOQU5EX09QX0NNRChOQU5EX0NNRF9SRUFEU1RBUlQsIE5BTkRfQ09NTU9O
X1RJTUlOR19OUyhjb25mLCB0V0JfbWF4KSksCj4gCQlOQU5EX09QX1dBSVRfUkRZKE5BTkRfQ09N
TU9OX1RJTUlOR19NUyhjb25mLCB0Ul9tYXgpLAo+IAkJCQkgTkFORF9DT01NT05fVElNSU5HX05T
KGNvbmYsIHRSUl9taW4pKSwKPiAJCU5BTkRfT1BfREFUQV9JTihsZW4sIGJ1ZiwgMCksCj4gCX07
Cj4gCj4gSSdsbCBjYWxsIHdhaXRfb3BfZG9uZSgpIG9uY2UgZm9yIE5BTkRfQ01EX1JFQUQwLCBm
b3VyIHRpbWVzIGZvciB0aGUgTkFORF9PUF9BRERSLAo+IHRoZW4gb25jZSBhZ2FpbiBmb3IgdGhl
IE5BTkRfQ01EX1JFQURTVEFSVCBjb21tYW5kIGFuZCBmb3VyIHRpbWVzIChvbiBpLk1YMjcsIG9u
Y2UKPiBwZXIgc3VicGFnZSkgZm9yIHRoZSBOQU5EX09QX0RBVEFfSU4gb3BlcmF0aW9uLiBDYWxs
aW5nIHdhaXRfb3BfZG9uZSgpIGZvciB0aGUKPiBOQU5EX09QX1dBSVRfUkRZIG9wZXJhdGlvbiB3
b3VsIG9ubHkgdGltZW91dCBiZWNhdXNlIHRoZXJlIGlzIG5vIG9wZXJhdGlvbiBpbiBmbGlnaHQK
PiBjdXJyZW50bHkuCgpBaCwgb2ssIG1ha2VzIHNlbnNlIGFzIHdlbGwuIElmIHlvdSB3YW50ICh0
aGlzIGlzIG5vdCBtYW5kYXRvcnkpIHlvdQptYXkgd2FudCB0byByZW5hbWUgdGhlIGZ1bmN0aW9u
IHdhaXRfaW5zdHJfZG9uZSgpIHRvIGZpdCB0aGUgY29yZSdzCm5hbWluZzogYW4gb3BlcmF0aW9u
IGJlaW5nIGFuIGFnZ3JlZ2F0ZSBvZiBpbnN0cnVjdGlvbnMvY3ljbGVzLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
