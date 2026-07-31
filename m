Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787B2C55167
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jzE9DQpqV7xlYXVGhD554dz7cnHYW2c+w2OhE3mqD0=; b=fH3vJe5ojpyFDm
	D1qK9qM03RqvJ2LzxZ5dL+t2y8lj3pd7E9nBt924Na5hmRGdHwuSRZFbu9auYta1d71vZblsNW0bA
	e+qhprWVyK7sKynJgzMbRKhwgVEseJnnSnMBhJ2JkM0nzo05gRofA39n3u1jIZve0u+zx5vPJN8On
	7mYi7pPT39mjEFAZMdqb2LYoam9u78EqZDIP0FT61RjQ1Sjqw4pKUjjdUF2H7rDfKZapr+FH/LY24
	Y1dKn8jqF3Uj0+pn7HDO8Lzd9SUWPk9LBueLn1GM3sL6ZmNk6MCPFXGiAtVIPFYIi4S54HibsBfAK
	VQfZ2sXLt/dZ0DzUS1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjhM-0000000CCQ9-3M0D;
	Fri, 31 Jul 2026 09:38:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjhJ-0000000CCOh-3KiG
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 09:38:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 54BC64E41047;
	Fri, 31 Jul 2026 09:38:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27D176039A;
	Fri, 31 Jul 2026 09:38:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C43BD11C16612;
	Fri, 31 Jul 2026 11:38:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490703; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eagIojVHgWT+H7k3TNqXh8GEjAI5dJTnFxCgsrPlEHY=;
	b=W5ztKtP1gTQCzfooqVs0s0UFs36u9r9nOtOVOwUCN3cNUDbeNwRRlvxIfqf8nGQOmXdBCg
	7rT/YSIqwPxZ0OiIkoHMmz6aP93quIwkcX/0H83j9nhv5e4C0l7hltdrPEyOJ8nnyDbMsa
	1rSXZT94F9aKHodQrq0jsTMspBlkqTACMwk4xxJy8RNMnPnQGftODF03BsXJmfsM58Qypy
	Sc/B2RBRu36VVw+Ljjxu+Igp2yn67YDWOStAtMYkxSRUQ4hKY3PfOk2ozO0PwNOM3E/4qS
	MZeZ3X5vA/6RIPFGwyuQKkTj6/2TP+HWKdceS+qnRpdJESr4PqMO/gCCWbEK5A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/30] mtd: spi-nor: winbond: Make the RDCR fixup
 Winbond wide
In-Reply-To: <DJRJS82LPRIZ.2NG59E6DSDTHM@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 16:11:31 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-4-87e5d3122244@bootlin.com>
	<DJRJS82LPRIZ.2NG59E6DSDTHM@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 31 Jul 2026 11:38:19 +0200
Message-ID: <874ihfjy7o.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_023833_984677_5ED2F98F 
X-CRM114-Status: GOOD (  13.41  )
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

T24gMDYvMDcvMjAyNiBhdCAxNjoxMTozMSArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmkgTWF5IDI5LCAyMDI2IGF0IDU6MjIgUE0gQ0VTVCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4gVGhlIHRvcCBsZXZlbCBwYXJhZ3JhcGggb2YgdGhlIFFF
UiBmaWVsZCBpbiB0aGUgSkVTRDIxNkIgbWVudGlvbnM6Cj4+Cj4+ICJJbiB0aGlzIHN0YW5kYXJk
LCBbLi4uXSAgU3RhdHVzIHJlZ2lzdGVyIDIgcmVmZXJzIHRvIHRoZSBieXRlIHJlYWQKPj4gdXNp
bmcgaW5zdHJ1Y3Rpb24gMzVoLiBTdGF0dXMgcmVnaXN0ZXIgMiBpcyB0aGUgc2Vjb25kIGJ5dGUg
dHJhbnNmZXJyZWQKPj4gaW4gYSBXcml0ZSBTdGF0dXMgKDAxaCkgY29tbWFuZC4gWy4uLl0iCj4+
Cj4+IFZhbHVlIDEwMGIsIG5hbWVkIGluIExpbnV4IEJGUFRfRFdPUkQxNV9RRVJfU1IyX0JJVDFf
Tk9fUkQsIGRvZXMgbm90Cj4+IG1lbnRpb24gYW55dGhpbmcgYWJvdXQgcmVhZHMgYW5kIG9ubHkg
YnJpbmdzIGRldGFpbHMgYWJvdXQgd3JpdGVzLgo+Pgo+PiBUaGlzIGhhcyBiZWVuIGludGVycHJl
dGVkIGluIHRoZSBzcGktbm9yIGNvcmUgYnkgdGhlIGFic2VuY2Ugb2YgcmVhZAo+PiBjYXBhYmls
aXR5LCBidXQgdGhlcmUgaXMgbm8gZXhwbGljaXQgcmVhc29uIGZvciB0aGF0LCBleGNlcHQgdGhh
dCB0aGVyZQo+PiB3ZXJlIHByb2JhYmx5IHNvbWUgdmVyeSBvbGQgY2hpcHMgd2hpY2ggZGlkbid0
IHN1cHBvcnQgY29tbWFuZCAzNWguCj4KPiBJIGFncmVlLiBCdXQgbWFraW5nIGl0IGEgdmVuZG9y
IGRlZmF1bHQgd2UgYWx3YXlzIGhhdmUgdG8gaGF2ZSBhbgo+IGVudHJ5LiBTbyBpZiB0aGlzIGlz
IHJlYWxseSBmb3IgYWxsIHdpbmJvbmQgY2hpcHMsIHdlIHNoYWxsIGRvIGEKPiBjYXRjaCBhbGwg
ZW50cnkgKGxpa2UgaW4gbWFjcm9uaXguYykuCgpHb29kIGNhdGNoLCBJIGRpZG4ndCB0aGluayBh
Ym91dCB0aGF0LiBBZGRlZC4KClsuLi5dCgo+PiArCWlmIChub3ItPmluZm8tPmlkLT5ieXRlc1sw
XSA9PSAweGVmICYmCj4+ICsJICAgIG5vci0+aW5mby0+aWQtPmJ5dGVzWzFdID4gMHgzMCkKPj4g
KwkJbm9yLT5mbGFncyAmPSB+U05PUl9GX05PX1JFQURfQ1I7Cj4KPiBUaGlzIGlzIHNvbWV3aGF0
IGhhcmQgdG8gcmVhZCBhbmQgdGhlIGJ5dGVbMF0gaXMgcmVkdW5kYW50IGhlcmUuCj4gTWF5YmUg
eW91IGNhbiBjb21lIHVwIHdpdGggc29tZSBtYWNybyBtYWdpYyBzdWdhciA6KQoKSSBkcm9wcGVk
IHRoZSBmaXJzdCBjb25kaXRpb24gaW4gdGhlIGlmIHdoaWNoIGluZGVlZCBpcwpyZWR1bmRhbnQu
IEhvd2V2ZXIgSSBkb24ndCBrbm93IGhvdyB0byBtYWtlIHRoZSByZW1haW5kZXIgbW9yZQpleHBs
YW5hdG9yeSwgdGhlcmUgaXMgYWxyZWFkeSBhIGJpZyBjb21tZW50IHRlbGxpbmcgd2h5IHdlIGRv
IGl0LgoKVGhhbmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
