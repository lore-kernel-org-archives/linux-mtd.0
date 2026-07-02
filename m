Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B368C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUPeb0o48SQ+Vvoos/9KZg6N1iHhegh9Z8TMMWfUtCs=; b=v58eSpcuzlFGVt
	1SuiGb+gg70H3xtztWKbCspKwsbDl6hpvd0ZeM7/aqJa3QqfAF0iDC5JGcqIfqU0tnxKNkuJPyD7W
	7vnEYKyWu3PQo5COSj4pRvsC0RgfO833RLSTlfGM3VPgDFihmvgxEQa7kUdOVnt6dLHH6sq7fc5Ia
	kxlRJUPrOAnueW9z+AVvvpUUVpZiX0El6x5p9YHspA3+b5nuuYOB249SypW8DEXbvkH7iLWsKZnOc
	9/GO6ymTP+JOZmZ0xTQ3Kwgz4oHRsseo/yQyoyYaNnhrkHNXV32hIWvineHoIecLCrGpsvpwcocgt
	hsfulP9BbfyO4NiCOAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHa2-00000004XHE-0ifj;
	Thu, 02 Jul 2026 13:35:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZz-00000004XFu-2ejK
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 13:35:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6994C4E40C32;
	Thu,  2 Jul 2026 13:35:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3610F5FF03;
	Thu,  2 Jul 2026 13:35:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 191A5104C956E;
	Thu,  2 Jul 2026 15:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782999343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CBdRz6iknUEQ47UfMkZ0PQpUwrts4qpKzRp1pEV7AME=;
	b=zdN+vbMM5MPZgJ+2UNvTPZ0nQf0Y1tOm9dt6c/LG228i69OQuglY4DQzck9+oFL6LWGu2p
	cmBD5tQnTR26dWpfmYVmBa5gXC+4Oy/jDqbn95jmWZNDOCwL3ipXX+zn+A1JB/KGp5qZJ9
	+wW+Unv/8QTNtLMp8NuqbP8DEDB1k6NV+QHxUkjjW2N4tko0fbYBMMRrfLG2B+43ro6zMt
	iSrRiWfbRfJzAbtZMYV20AgmCgm0IfIYsEQ/Q9oQ9ttlwgO0JHJRfv8DNIjvf/8lnIF6gh
	iKXSD0B2Hj1kHz+M2Er7NWFg9N2aYXmt2J59oiY2o1JfPRzLjcSMv8yhog8mXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v4 09/16] spi: cadence-quadspi: skip DDR PHY tuning for
 2-byte-address ops (i2383)
In-Reply-To: <20260618073725.84733-10-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Thu, 18 Jun 2026 13:07:18 +0530")
References: <20260618073725.84733-1-s-k6@ti.com>
	<20260618073725.84733-10-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 02 Jul 2026 15:35:40 +0200
Message-ID: <871pdlqztf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063547_812707_F30FBA37 
X-CRM114-Status: GOOD (  11.16  )
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

T24gMTgvMDYvMjAyNiBhdCAxMzowNzoxOCArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBFcnJhdHVtIGkyMzgzIG9uIEFNNjU0IGxvY2tzIHRoZSBhZGRyZXNz
IHBoYXNlIGluIFBIWSBERFIgbW9kZSB3aGVuIGEKPiAyLWJ5dGUgY29sdW1uIGFkZHJlc3MgaXMg
dXNlZC4gRERSIFBIWSB0dW5pbmcgbXVzdCBub3QgYmUgYXR0ZW1wdGVkIGZvcgo+IHN1Y2ggb3Bl
cmF0aW9uczsgbm9uLVBIWSBERFIgdXNhZ2UgaXMgdW5hZmZlY3RlZC4gWzBdCj4KPiBBZGQgQ1FT
UElfTk9fMkJZVEVfQUREUl9QSFlfRERSIHF1aXJrIGFuZCBjaGVjayBpdCBpbgo+IGNxc3BpX2Ft
NjU0X29zcGlfZXhlY3V0ZV90dW5pbmcoKS4gV2hlbiB0aGUgZXJyYXR1bSBhcHBsaWVzLCByZXR1
cm4gMAo+IHdpdGggcmVhZF9vcC0+bWF4X2ZyZXEgY2xlYXJlZC4KPgo+IFswXSBodHRwczovL3d3
dy50aS5jb20vbGl0L2VyL3Nwcno1NDRjL3Nwcno1NDRjLnBkZgo+Cj4gU2lnbmVkLW9mZi1ieTog
U2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1j
YWRlbmNlLXF1YWRzcGkuYyB8IDE3ICsrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVh
ZHNwaS5jCj4gaW5kZXggNzI3NjgyOTJhMzJiLi4yMmRmNWYzYmRiOTYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3Bp
LWNhZGVuY2UtcXVhZHNwaS5jCj4gQEAgLTQ5LDYgKzQ5LDcgQEAgc3RhdGljX2Fzc2VydChDUVNQ
SV9NQVhfQ0hJUFNFTEVDVCA8PSBTUElfREVWSUNFX0NTX0NOVF9NQVgpOwo+ICAjZGVmaW5lIENR
U1BJX0RJU0FCTEVfUlVOVElNRV9QTQlCSVQoMTApCj4gICNkZWZpbmUgQ1FTUElfTk9fSU5ESVJF
Q1RfTU9ERQkJQklUKDExKQo+ICAjZGVmaW5lIENRU1BJX0hBU19XUl9QUk9URUNUCQlCSVQoMTIp
Cj4gKyNkZWZpbmUgQ1FTUElfTk9fMkJZVEVfQUREUl9QSFlfRERSCUJJVCgxMykKCkNhbiB3ZSBy
ZW5hbWUgdGhlIGZsYWcgdG8gbWFrZSBpdCBtb3JlIHJlYWRhYmxlPyBJIHdvdWxkIHByb3Bvc2U6
CgojZGVmaW5lIENRU1BJX05PX1BIWV9UVU5JTkdfV0lUSF9PRERSXzJCX0FERFIJQklUKDEzKQoK
TG9uZywgYnV0IG1vcmUgc2VsZiBleHBsYW5hdG9yeS4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
