Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103C5CCF2DF
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m73DqN1tRTEM/dkfw1htk8l9zsy+tpxUipEPdJDZfTw=; b=S4O/rTFh0ArkXr
	MDinz1yNfenl/KNAzTi/nEXBa3+QiYcphd2yskaxHUU+EwZEWC7F7GztIdGnO18HwzHG+0uEbmoEk
	8R20xZg2HyEa9em+I8nX1tjsRSMhkRzHP3FDbevhUXh42yIekscqZ/FoHdjk5d8zuAGWJP/+zI7qe
	44BJeCgKJ47zKXIB14XbQlH/EUMKQo9E7TnppJOSSdH/yUwCpnKwifsfxgiPYj0FdNzGikeY4UCDI
	zBtlyVPitzu0fuforaGNy54fCGDYPfFL2g01uL7gGjx5WBuKxVnNEZFaYsv7Ju/Izvc5z9tGW80s8
	gJS4UFD6JamJd/31Y3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmpg-00000001oor-1ZQR;
	Mon, 19 Jan 2026 10:50:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmpc-00000001ona-1uSV
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:50:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB5A21A293D;
	Mon, 19 Jan 2026 10:49:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 885CD60731;
	Mon, 19 Jan 2026 10:49:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7AFB10B6AE98;
	Mon, 19 Jan 2026 11:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768819782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8HkG350TcjKySrUj6co0juo2I7dugMCT1DsmkateZpo=;
	b=I5iYDzk9sI71uCw8HK21Lt21nWym0wQaVJCEUduPpdDXGmuZsvcI/hBLBQw0uwEFaDbvOh
	s2vCwtFAQUXeV/TjzJ/mDQ+EJvxeSCqcJoYyB4KbnKZ7dB8dOu+CMjeP0W6CXgSi28fV7C
	CqdiS1gu9YM8nX6NHHqZzKzkUbjDsKHs6fA417CffmU1pJJolvLBEw5SYDNVgUkD/V18wT
	B+9oayHJlkjp7yd9UcCgpIta1lLj4x7u+7ys5j015+wBosfASwZ64sIoEGfueO6qQBOloS
	4Wiz1PRiFGHgc1GzzlegRkeTgEGX0/5ERL0ZZI33efvVXkEtC6F6Ew5f6lS2QQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Raag Jadav <raag.jadav@intel.com>, Jani Partanen <jiipee@sotapeli.fi>, 
 Lucas De Marchi <demarchi@kernel.org>
In-Reply-To: <20260115052237.1149027-1-alexander.usyskin@intel.com>
References: <20260115052237.1149027-1-alexander.usyskin@intel.com>
Subject: Re: [PATCH] mtd: intel-dg: Fix accessing regions before setting
 nregions
Message-Id: <176881977899.2473586.16375546520519184809.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:49:38 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_025000_623699_79D508B1 
X-CRM114-Status: UNSURE (   7.95  )
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

T24gVGh1LCAxNSBKYW4gMjAyNiAwNzoyMjozNyArMDIwMCwgQWxleGFuZGVyIFVzeXNraW4gd3Jv
dGU6Cj4gVGhlIHJlZ2lvbnMgYXJyYXkgaXMgY291bnRlZCBieSBucmVnaW9ucywgYnV0IGl0J3Mg
c2V0IG9ubHkgYWZ0ZXIKPiBhY2Nlc3NpbmcgaXQ6Cj4gCj4gW10gVUJTQU46IGFycmF5LWluZGV4
LW91dC1vZi1ib3VuZHMgaW4gZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfaW50ZWxfZGcuYzo3NTA6
MTUKPiBbXSBpbmRleCAwIGlzIG91dCBvZiByYW5nZSBmb3IgdHlwZSAnPHVua25vd24+IFsqXScK
PiAKPiBGaXggaXQgYnkgYWxzbyBmaXhpbmcgYW4gdW5kZXNpcmVkIGJlaGF2aW9yOiB0aGUgbG9v
cCBzaWxlbnRseSBpZ25vcmVzCj4gRU5PTUVNIGFuZCBjb250aW51ZXMgc2V0dGluZyB0aGUgb3Ro
ZXIgZW50cmllcy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEv
MV0gbXRkOiBpbnRlbC1kZzogRml4IGFjY2Vzc2luZyByZWdpb25zIGJlZm9yZSBzZXR0aW5nIG5y
ZWdpb25zCiAgICAgIGNvbW1pdDogNzc5YzU5Mjc0ZDAzY2M1YzA3MjM3YTJjODQ1ZGZiNzFjZmY3
NzcwNQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
