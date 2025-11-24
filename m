Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFBBCFD31C
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQYBNr9Ft7mYqsw/mP0Y17rVXr6MI7roG7E7QV6WgyA=; b=bvydx9wlCXYu+v
	8NWkhEgEFk4bMMbojmY7neAjMJ5skdHSNHudsn4pkDrzGxWO1mDcTe7c0kVfARHXnQLK5ki/BwAyt
	ifwTST2OvJKbKQ9TtTQ/pJ79tDhYZZw05Cn4iMO6XvNOdRykKby/gBdXoTe+Ud5ZUeD04Jw4Pgy7N
	eqgWjR51vwkmN59SKIuNEYi4ialg34hPb3L9enHnrzDpwTfdFRoMZ9Iu3yCkjZzTk6+XHUzAllTZF
	tHJvwQqYmDHcjrokWcM/Srg2U2AMwO3KdTBCPmrezcm6ffT8C1X+v3qCT4+Z3B4kJbSXwcLPwJQhR
	3wUzHchxhI0jtwToDaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRV3-0000000BFu9-1RKw;
	Mon, 24 Nov 2025 08:00:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRV0-0000000BFtc-0JlQ
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 08:00:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A98B01A1D08;
	Mon, 24 Nov 2025 08:00:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D8F3606FC;
	Mon, 24 Nov 2025 08:00:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 166A010370004;
	Mon, 24 Nov 2025 09:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763971231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nAYucZ//0PJKUxBFzIXxcaSNRPWJLukjBLAGomp2KiY=;
	b=dflCg6JWqiq6r+0sn/UcxrmbmlFXNuSqzjz6AS8+1tY+na6I7Z+8fJdbjMl4o9Jy9lpBiS
	cMJ6CAZmtgrDh4wh119IxyoZeGY8en+eO9OUmk78Bs++K4O34qb3jEvWVi0MaZnq1iT625
	4AGoXLR7hpb8OUtkbxnXzJiLu1nwvBNIcZyXXjWY4pAViRxCGvasoxFS4dPumUXIAi8jYQ
	l0Em+g2xipKEG+sP55MasTq8Zhj2jvnaYG0j2z/g8qA0A3t9g97wvywRDB7aMVHwG9yFlc
	ZLOxaOj0IpCElf4NWg5z5XdqJOJNnTJF5dhyzW8bBYuimDoM3f0Q51jh1imlqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marc Olberding <molberding@nvidia.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Fix w25q01jv flags
In-Reply-To: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com> (Marc
	Olberding's message of "Fri, 21 Nov 2025 14:35:34 -0800")
References: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 24 Nov 2025 09:00:27 +0100
Message-ID: <87jyzfzwpw.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_000038_252779_57AB29C9 
X-CRM114-Status: GOOD (  27.09  )
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

SGkgTWFyYywKCk9uIDIxLzExLzIwMjUgYXQgMTQ6MzU6MzQgLTA4LCBNYXJjIE9sYmVyZGluZyA8
bW9sYmVyZGluZ0BudmlkaWEuY29tPiB3cm90ZToKCj4gVGhlIHByZXZpb3VzIHN1cHBvcnQgZm9y
IHcyNXEwMWp2IHdhcyBjYXVzaW5nIHJlYWQvd3JpdGUKPiBtaXNjb21wYXJlcyBvbiBmbGFzaGlu
ZyB3aXRoIHRoZSBhc3BlZWQgYXN0MjYwMC4gQWRkIGluCj4gZXh0cmEgZmxhZ3MgdG8gYWxsb3cg
dGhlIGNoaXAgdG8gaWRlbnRpZnkgYXMgaGF2aW5nIDRLCj4gc2VjdG9ycyBpZiB0aGUgc2ZkcCB0
YWJsZXMgYXJlbid0IHByZXNlbnQsIGFzIHdlbGwKCkFyZSB3ZSBzdXJlIGFib3V0IHRoZSByZWFz
b24/IE5vcm1hbGx5IHRoaXMgaXMgYSBub24tc2ZkcCBmbGFnLCB3aGljaAptZWFucyBldmVuIGlm
IHlvdSBoYXZlIHNmZHAgdGFibGVzLCB5b3UgbXVzdCBtYXJrIHRoaXMgZmxhZwptYW51YWxseS4g
VGhlc2UgY2hpcHMgc2hvdWxkIGFsd2F5cyBoYXZlIHRoZSBzZmRwIHRhYmxlcy4gRGlkIHlvdSBm
YWNlCmNhc2VzIHdoZXJlIHRoZXkgYXJlIG5vdCBwb3B1bGF0ZWQ/Cgo+IGFzIHJlcG9ydGluZyB0
aGUgbmFtZSBhbmQgYWRkaW5nIHRoZSBMT0NLIGFuZCBUQiBmbGFnLgo+Cj4gQWZ0ZXIgdGhpcyBj
aGFuZ2UsIG5vIG1pc2NvbXBhcmVzIHdlcmUgc2Vlbi4KPgo+IEZpeGVzOiA5YjRkYjAzMmZiMmIg
KCJtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFkZCBzdXBwb3J0IGZvciB3MjVxMDFqdiIpCj4gU2ln
bmVkLW9mZi1ieTogTWFyYyBPbGJlcmRpbmcgPG1vbGJlcmRpbmdAbnZpZGlhLmNvbT4KPiAtLS0K
PiBUaGUgaW5pdGlhbCBjb21taXRbMV0gdGhhdCBjYW1lIGluIGZvciB3MjVxMDFqdiBbMl0gc3Vw
cG9ydAo+IGxhY2tzIHRoZSA0SyBzZWN0b3IgZmxhZ3MgaW4gdGhlIGNhc2UgdGhhdCB0aGUgc2Zk
cCBmbGFncyBkb24ndAo+IGV4aXN0IG9uIHRoZSBjaGlwLiBUaGlzIGNhdXNlZCBmaWxlc3lzdGVt
IGNvcnJ1cHRpb24gdXBvbiB3cml0ZXMuCj4gQWRkIGluIHRoZSBmbGFncyBhcyB3ZWxsIGFzIHRo
ZSBjaGlwcyBzaXplIGFuZCBuYW1lLgo+Cj4gVGVzdGluZzoKPiBBZnRlciB0aGlzIHBhdGNoLCBC
TUMncyBiYWNrZWQgYnkgdGhlIHcyNXEwMWp2IHN1Y2NlZWQgb24gYm9vdAo+IGFzIHdlbGwgYXMg
c2VsZi1mbGFzaAo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAxNDA1
MDEwOC42NjUzMzgtMS1jaG91LmNvc21vQGdtYWlsLmNvbS8KPiBbMl0gaHR0cHM6Ly93d3cud2lu
Ym9uZC5jb20vcmVzb3VyY2UtZmlsZXMvVzI1UTAxSlYlMjBTUEklMjBSZXZFJTIwMDMwNDIwMjQl
MjBQbHVzLnBkZgo+IC0tLQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYyB8IDUgKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jIGIvZHJpdmVycy9tdGQv
c3BpLW5vci93aW5ib25kLmMKPiBpbmRleCA2M2E5M2M5ZWI5MTc0YjA3M2UxOWM0MWVlYWRhMzNi
MjNhOTliMTg0Li43ZDQxMTlhZmM4YzZiNDEzNWI1YTA1NWI1MmIxYWRlN2UzZWY5MjZjIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4gKysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci93aW5ib25kLmMKPiBAQCAtMjI3LDggKzIyNywxMSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGZsYXNoX2luZm8gd2luYm9uZF9ub3JfcGFydHNbXSA9IHsKPiAgCQkuc2l6ZSA9IFNa
XzY0TSwKPiAgCQkubm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8
IFNQSV9OT1JfUVVBRF9SRUFELAo+ICAJfSwgewo+IC0JCS8qIFcyNVEwMUpWICovCj4gIAkJLmlk
ID0gU05PUl9JRCgweGVmLCAweDQwLCAweDIxKSwKPiArCQkubmFtZSA9ICJ3MjVxMDFqdiIsCgpD
aGFuZ2luZyB0aGUgY29tbWVudCBpbnRvIGEgbmFtZSBpcyBub3QgcmVsZXZhbnQgaGVyZSBmb3Ig
dHdvIHJlYXNvbnM6Ci0gdGhpcyBpcyBkZXByZWNhdGVkCi0gdGhpcyBwYXRjaCBpcyBhIGZpeCwg
YW55IGZ1cnRoZXIgYWRkaXRpb25zIHNob3VsZCBiZSBpbiBhIGRlZGljYXRlZCBwYXRjaC4KCj4g
KwkJLnNpemUgPSBTWl8xMjhNLAoKRG8geW91IHJlYWxseSBuZWVkIHRoaXMgZmllbGQ/IEhvdyBk
aWQgdGhlIGZsYXNoIGV2ZW4gd29ya2VkIGJlZm9yZSBpZgp5b3UgbmVlZCB0aGlzPwoKPiArCQku
ZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIsCgpJIGhhdmUgbm90IHVz
ZWQgbm9yIHRlc3RlZCBibG9jayBwcm90ZWN0aW9uIG9uIHRoYXQgY2hpcC4gSWYgaXQncyBhbgph
ZGRpdGlvbiB5b3UgbXVzdCBwdXQgdGhhdCBpbiBhIHNlcGFyYXRlZCBwYXRjaC4gRml4ZXMgd2ls
bCBiZSBxdWV1ZWQKZmFzdGVyIHRoYW4gZmVhdHVyZSBhZGRpdGlvbnMsIHlvdSBjYW5ub3QgbWl4
IGJvdGguCgo+ICsJCS5ub19zZmRwX2ZsYWdzID0gU0VDVF80SywKClRoaXMgb25lIGlzIHRoZSBy
aWdodCBmaXggYW5kIHNob3VsZCBzdGFuZCBhbG9uZSBpbiBpdHMgb3duIHBhdGNoIChmaXJzdApp
biB0aGUgc2VyaWVzIGlmIHlvdSBhZGQgc3VwcG9ydCBmb3IgdGhlIGJsb2NrIHByb3RlY3Rpb24p
LgoKPiAgCQkuZml4dXBzID0gJndpbmJvbmRfbm9yX211bHRpX2RpZV9maXh1cHMsCj4gIAl9LCB7
Cj4gIAkJLmlkID0gU05PUl9JRCgweGVmLCAweDUwLCAweDEyKSwKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
