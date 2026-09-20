Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1674C982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXnngQMVy9rtzo8SHoX0NParcxaqwyzlmzOpS2aIeho=; b=pHfipew/+hnepr
	8+MZH4rkO9HdbeYSLmNzoldO2Y7NgX/dOPK/vyP9oiGNvilCHuAzbIts1Ab0mlEFe9b8imNmtG10K
	D8cpW0ublILXw33bMXVD+Pl8RvRfNvpRBQdp2QYQnOqBUkpMnDTH4Ya3YnOWEk4EkTruytYeHyJKK
	rH3WYEww4A1yx6WX9QDLPXBQ/Jf6w1zOjxHupfUR+vA1mMj3w2Ox1kjmrgV5Y+dJDFateXS4X6aRc
	LpiZK6pb18JYkuhsflTk4lmKTPrzgnSZf1DIgMAAMmJw7RUWFzKF3KwzbAxl4yQjgICo8m1bYAmPP
	/cx4X6MKT1lMtR6qwYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IK7-0000000HZQU-3o9d;
	Sun, 20 Sep 2026 14:15:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IK6-0000000HZQL-2gw3
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:15:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08C95601DB;
	Sun, 20 Sep 2026 14:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0AD1F00893;
	Sun, 20 Sep 2026 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789913717;
	bh=ReGGZzAYsZltabeSMuN4ZGudrxIWtzp842ALLhTAZPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exHKC9CvcY0ze0A9bjUCK5R3j1ln4DTMDPHz7+yIzuj+VADq9iw0MMjF0bDdXCJcW
	 dQa19jmiUQFGT+lxfcGqbI7KoaEYydqOcFQZyzVK+Nr9yFY+LY5yiHtaoBIeEmokkg
	 eRJ/Xt8enpORxbynJmIgj06NC/o+wMUgZ17s8mZscUrNUAy5aFfakWfz9ihYsb37yG
	 AKwklQWa3gZFsyVPd2iBZiasX9PkFCxnhz8n1tvqOsy+IuknZJieMTzvaE3oh/VvgR
	 yl3QlZEkx2Mo+zSULuZQmEDZuLxJO3ZNmiex9m71vxZpDLCbaivJ0zS6Y7GkQpPmxg
	 QqtcrHwrcI5jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/25] mtd: spi-nor: winbond: Add support for
 W25Q33PW-M
To: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
Cc: "Steam Lin" <STLin2@winbond.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-22-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
 <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-22-ab9c9688d071@bootlin.com>
Date: Sun, 20 Sep 2026 14:15:16 +0000
Message-Id: <20260920141517.2A0AD1F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
d2luYm9uZDogVzI1UTMzUFctTSBpbmxpbmUgRUNDIGluY29ycmVjdGx5IGRpc2FibGVkIGJ5IGRl
bnNpdHkgY2hlY2sKLS0KCmNvbW1pdCBhODJkY2Q2MGFhYzhmMjRjNzljZjI0NmYyMWMwYTdhZmQ0
YWMwYWUwCkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
Cm10ZDogc3BpLW5vcjogd2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcyNVEzM1BXLU0KClRoZXJl
IGlzIGFuIElEIGNvbGxpc2lvbiB3aXRoIGNoaXBzIG9mIHNhbWUgZGVuc2l0eSBmcm9tIHRoZSBK
VyBmYW1pbHkKKHdoaWNoIGl0IHNlbGYgY29uZmxpY3RlZCB3aXRoIHlldCBhbm90aGVyIGZhbWls
eSkuIENoaXBzIGFyZSB2ZXJ5CnNpbWlsYXIgaW4gcHJhY3RpY2UsIGl0IGlzIG1vc3RseSBhIG1h
dHRlciBvZiBlbGVjdHJpY2FsIGRpZmZlcmVuY2VzCihtb3N0bHkgcG93ZXIgY29uc3VtcHRpb24g
YmVpbmcgbG93ZXIpIGFzIHdlbGwgYXMgdGhlIGFkZGl0aW9uIG9mIGlubGluZQpFQ0MgY2FwYWJp
bGl0eS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jIGIvZHJp
dmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPiBpbmRleCBjMTc5MmIxMmRiNjMwLi5jNTZiYjAx
YzE5N2IyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPiBAQCAtNDY3LDcgKzQ2Nyw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyB3aW5ib25kX25vcl9wYXJ0c1tdID0gewo+ICAJ
CS5zaXplID0gU1pfNjRNLAo+ICAJCS5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1Jf
RFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQsCj4gIAl9LCB7Cj4gLQkJLyogVzI1UTMySlct
TSAqLwo+ICsJCS8qIFcyNVEzMkpXLU0sIFcyNVEzM1BXLU0gKi8KPiAgCQkuaWQgPSBTTk9SX0lE
KDB4ZWYsIDB4ODAsIDB4MTYpLAo+ICAJCS5uYW1lID0gIncyNXEzMmp3bSIsCgpbU2V2ZXJpdHk6
IEhpZ2hdClRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhhdCB0aGUgVzI1UTMzUFctTSBjaGlw
IHN1cHBvcnRzIGlubGluZSBFQ0MsIGJ1dApkb2VzIHRoaXMgbmV3bHkgYWRkZWQgY2hpcCBhY3R1
YWxseSBnZXQgaXRzIEVDQyBjb25maWd1cmF0aW9uIGFwcGxpZWQ/CgpMb29raW5nIGF0IHdpbmJv
bmRfcHdfd2l0aF9lY2NfbWF0Y2goKSBpbiBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYzoK
CnN0YXRpYyBib29sIHdpbmJvbmRfcHdfd2l0aF9lY2NfbWF0Y2goY29uc3Qgc3RydWN0IHNwaV9u
b3IgKm5vcikKewoJLi4uCgkvKiBXMjVReHhQVyBkZW5zaXRpZXMgPD0gMzIgTWJpdCAoaWRbMl0g
PD0gMHgxNikgZG8gbm90IGhhdmUgYnVpbHQtaW4gRUNDIHN1cHBvcnQgKi8KCXJldHVybiBpZC0+
bGVuID09IDMgJiYgaWQtPmJ5dGVzWzJdID49IDB4MTc7Cn0KClNpbmNlIHRoZSBXMjVRMzNQVy1N
IGhhcyBhbiBJRCBvZiAweGVmLCAweDgwLCAweDE2LCB0aGUgZGVuc2l0eSBieXRlIGlzIDB4MTYu
ClRoaXMgY2F1c2VzIHdpbmJvbmRfcHdfd2l0aF9lY2NfbWF0Y2goKSB0byB1bmNvbmRpdGlvbmFs
bHkgZXZhbHVhdGUgdG8gZmFsc2UsCnByZXZlbnRpbmcgdGhlIHdpbmJvbmRfbm9yX2VjY19jb25m
aWd1cmF0aW9uX3Bvc3Rfc2ZkcF9maXh1cHMgZnJvbSBiZWluZwphcHBsaWVkLgoKQXMgYSByZXN1
bHQsIFNOT1JfRl9FQ0MgaXMgbmV2ZXIgc2V0IGFuZCB3cml0ZXNpemUgcmVtYWlucyAxIGluc3Rl
YWQgb2YgMTYuCldpbGwgdGhpcyBjYXVzZSB3cml0ZXMgdG8gYmUgdW5hbGlnbmVkIHRvIHRoZSBj
aGlwJ3MgMTYtYnl0ZSBjaHVua3MsIHdoaWNoCmFjY29yZGluZyB0byB0aGUgY29tbWl0IG1lc3Nh
Z2UgZGlzYWJsZXMgRUNDIGxvY2FsbHkgdW50aWwgdGhlIG5leHQgZXJhc2U/CgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIwLXdp
bmJvbmQtbWFzdGVyLXNwaS1ub3ItanctY2xlYW51cC1wdy1hZGRpdGlvbi12Mi0wLWFiOWM5Njg4
ZDA3MUBib290bGluLmNvbT9wYXJ0PTIyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
