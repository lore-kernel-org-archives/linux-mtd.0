Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B93CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pj8RzbIcXNQTphAgGhA+DVHLIlDOA9JuLqJZlsCi7Y=; b=4H2uicNh3Gr5YT
	ssc1SAmqLqZCxd1TZh/XQhUYMZSCuePZJECSp5OFFNExhPnsPKcV14YZqjlUj9NOvNyMA2wGgQoI2
	ZOhBuZXoFhPNx0KB2k+k2bJDP4TB8vWDCMxJy6hSy5+V5C+fzHXErCQXnq0H6J5o+gUIn9UJ/nZR6
	S7cRm82lvUdObt3jk8uPygUQuPC05ZwAdLbV4OaIi7pUDQ659PfLYHdnZW2n3YwHDcqW/Iwpj9Z2P
	/ULeTIYkU+km2+OhK+Xydz4piUPgosdkgtDSRb7dBpTQVlNc8gNqYJ1bzzaVLG6cEQVO78wgXcJAl
	jkyb53r+R7ez+k8VtXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFsY-0000000CnmV-2tf2;
	Wed, 10 Sep 2025 08:08:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFsW-0000000Cnjj-1mCF
	for linux-mtd@bombadil.infradead.org;
	Wed, 10 Sep 2025 08:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DFuMg5iWYPLms98ctieeK6in5Im02OMPaCPSyPba7ZA=; b=H1P7UTYoYySxjNKG5LUy4akxsm
	U9Z4xZW6pdS+jwT9aaOYwQcbAogP8I95akJ2E/8xA/aaRkX8H7Xk0/FPuighR0jm4qWVlXWQ59Yqw
	fdWXmJsYWWfiR11iJAR1tAjY68pKD6CzFdRxFYyzOhsxXvH3kTRxPic49H4aieo7gPhWD3zbgY9I7
	jPgI69JBqWQ22D6qTyjOaka1Rl6qqdxL6+azRNfX+2ev1gZIRWA1EPFGz1G7Gkf2fgom0dd0qtpeB
	prfJuj69f1F/SX2gf1gmm2BtEnYSYBY0UMFWn6z1opDgSwp/EEfPLz5UQutjgMuUN5GO0LJPI7Kkd
	EhOQX4tA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFsT-00000005ngM-0jVH
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 08:08:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 245CE4E40C1A;
	Wed, 10 Sep 2025 08:08:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA1F8606D4;
	Wed, 10 Sep 2025 08:08:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C13D102F28F5;
	Wed, 10 Sep 2025 10:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757491699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DFuMg5iWYPLms98ctieeK6in5Im02OMPaCPSyPba7ZA=;
	b=GvA8Plv/Bm3qf4rmSFr6vepw/my5SAJ/b5OZcdpTNyQ5WtxbZGfpVqYc4r8CSJxWfL8k5f
	RKGyE+I8KnfqHvD8fkRjM+mtMmYKAIDZrcfAKae1cK6YUfIILV5Oj9+OoRE+HFJAdRZIJy
	LQ3MUvhqqbjcEYBtIEZSdG9CSvWOEa2o4rtQWRofenQr2CtCiq7O28ZBHDIJzrvh68EgUo
	DHzX+IMxfqsC+IbdjjHRcZhTqOCDaRTWx1oe0cTIa/09q+knQFqcuW6XjE3+T5r4Si0ixA
	yt4neKDUnm7bOlriSUQvUZDjSV+ex9znq3S+tGSCwLOiO4ES4LBj7Z+mGrVbTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  richard@nod.at,  vigneshr@ti.com,
  tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  p-mantena@ti.com,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  a-dutta@ti.com,  u-kumar1@ti.com,  praneeth@ti.com
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <2f051eae-61c7-4bff-9f85-cf37b02a7ea3@sirena.org.uk> (Mark
	Brown's message of "Thu, 14 Aug 2025 13:34:38 +0100")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com>
	<6c35baad-a332-4b0a-96ca-1cdb3840ad94@sirena.org.uk>
	<20487e7f-33dd-4b65-b1a8-5bb8a06ef859@ti.com>
	<2f051eae-61c7-4bff-9f85-cf37b02a7ea3@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 10:07:50 +0200
Message-ID: <87y0qmenmx.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_090829_396853_C674F806 
X-CRM114-Status: GOOD (  15.10  )
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

T24gMTQvMDgvMjAyNSBhdCAxMzozNDozOCArMDEsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgQXVnIDE0LCAyMDI1IGF0IDA1OjA0OjMzUE0gKzA1MzAs
IFNhbnRob3NoIEt1bWFyIEsgd3JvdGU6Cj4+IE9uIDE0LzA4LzI1IDAxOjU2LCBNYXJrIEJyb3du
IHdyb3RlOgo+Cj4+ID4gU2hvdWxkIHdlIGhhdmUgc29tZXRoaW5nIHRoYXQgYmxvY2tzIHRoZXNl
IHR1bmluZyByZXF1aXJlZCBtb2RlcyB3aXRob3V0Cj4+ID4gdGhlIGFwcHJvcHJpYXRlIHR1bmlu
ZywgYW5kL29yIGFsbG93cyBkaXNjb3Zlcnkgb2Ygd2hpY2ggbW9kZXMgcmVxdWlyZQo+PiA+IHRo
aXMgdHVuaW5nPyAgVGhpcyBhbGwgZmVlbHMgdmVyeSBsYW5kbWluZWlzaCAtIGNsaWVudCBkcml2
ZXJzIGp1c3QgaGF2ZQo+PiA+IHRvIGtub3cgd2hlbiB0dW5pbmcgaXMgcmVxdWlyZWQuCj4KPj4g
VGhlIGZsYXNoJ3MgbWF4aW11bSBvcGVyYXRpbmcgZnJlcXVlbmN5IGRldGVybWluZXMgd2hldGhl
ciBQSFkgdHVuaW5nIGlzCj4+IHJlcXVpcmVkLCBhcyB3ZSBuZWVkIHR1bmluZyBpbiBjYXNlIG9m
IENhZGVuY2UgY29udHJvbGxlciBmb3IgZnJlcXVlbmNpZXMKPj4gb3ZlciA1MCBNSHouCj4KPiBU
aGF0J3MgZW50aXJlbHkgc3BlY2lmaWMgdG8gdGhlIENhbmRlbmNlIGNvbnRyb2xsZXIgZnJvbSB0
aGUgc291bmRzIG9mCj4gaXQsIHRoYXQgbWFrZXMgaXQgaGFyZCB0byB3cml0ZSBhIGNsaWVudCBk
cml2ZXIgaWYgeW91IG5lZWQgdG8ga25vdwo+IGV4YWN0bHkgd2hhdCB0aGUgY29udHJvbGxlciB5
b3UncmUgZGVhbGluZyB3aXRoIGlzIGFuZCB3aGF0IGl0J3MKPiByZXF1aXJlbWVudHMgYXJlLgo+
Cj4+IEFuZCB3ZSBkbyBjaGVjayBmb3IgdGhpcyBjb25kaXRpb24gLSBzZWUgUGF0Y2ggMDcvMTAs
Cj4+IGNxc3BpX3BoeV9vcF9lbGlnaWJsZV9zZHIoKSwgd2hpY2ggY3VycmVudGx5IHZlcmlmaWVz
IHRoZSBmbGFzaCBmcmVxdWVuY3kKPj4gYWdhaW5zdCAxNjYgTUh6LiBUaGlzIGxvZ2ljIGNhbiBi
ZSBpbXByb3ZlZCBieSBpbXBsZW1lbnRpbmcgYm90aCBtaW4gYW5kIG1heAo+PiBmcmVxdWVuY3kg
Y2hlY2tzLCB3aWxsIHVwZGF0ZSBpbiB0aGUgZm9sbG93aW5nIHZlcnNpb24uCj4KPiBJIGNhbid0
IGFjdHVhbGx5IHRlbGwgaG93IHRoYXQgdmVyaWZpZXMgaWYgdGhlIHR1bmluZyBoYXMgYmVlbiBk
b25lCj4gYXBwcm9wcmlhdGVseSBUQkgsIGF0IGxlYXN0IG5vdCB3aXRob3V0IG1vcmUgZWZmb3J0
IHRoYW4gSSdkIGNhcmUgdG8KPiAoYW5kIHRoZSB0dW5pbmcgb25seSBnZXRzIGFkZGVkIGluIHBh
dGNoIDEwPykuCgpTYW50aG9zaCwgZG8geW91IG5lZWQgbW9yZSBpbnB1dHM/IE9yIGNhbiB5b3Ug
c2VuZCBhbiB1cGRhdGVkIHZlcnNpb24/CgpJIGFtIHN0aWxsIHRoaW5raW5nIGFib3V0IHRoZSBp
bnRlcmZhY2Ugb24gdGhlIHNwaS1tZW0vc3BpLW5hbmQgc2lkZSwKYnV0IHBsZWFzZSBpdGVyYXRl
IHNvIHdlIGNhbiBtb3ZlIGZvcndhcmQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
