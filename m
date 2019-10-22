Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9659CA9EB7
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 09:17:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A012F21906
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 09:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tRghL4MI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A012F21906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Dir0zc2gAuuO3JIgiSSCDnFAiye9kXwJz1vkxl/3zI=; b=tRghL4MI2xcui1
	eb4wosNmOxW3pjkSPD7Gr189pKNwb8+u0mdA1kUbrZVfUpk6uC0kM+AwM7++6a9RuH2ZIIl1rgoY8
	Iq1SZQrY1h6xDBrqTel56C0LNF7TU83H4nOZ1DraanASo63/X7JD1b/dkjI+00X2XEY+HXykcHeRY
	0wS8crX81ULNskqfSNMAJxPeCRe4c3Yo/PJbpafr6eqzE/TyPF+KJaNXTca5yiWH/RITGF0/+4CSQ
	HMbFurpUeOMT9I6U3uKT31soBr1ZbaTLOiqmcjJqc5hLiI8CJuffLmLtcVnXxSTcsAJ6oyHiNJH8H
	k1k9YTFeUmn8bZMN/N7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMqIJ-0001N2-AK; Tue, 22 Oct 2019 09:17:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMqI0-0001C9-HA; Tue, 22 Oct 2019 09:17:18 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A20A320001B;
 Tue, 22 Oct 2019 09:17:08 +0000 (UTC)
Date: Tue, 22 Oct 2019 11:17:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] mtd: spear_smi: Fix nonalignment not handled in
 memcpy_toio
Message-ID: <20191022111707.4b117b99@xps13>
In-Reply-To: <20191022082643.GO25745@shell.armlinux.org.uk>
References: <20191018143643.29676-1-miquel.raynal@bootlin.com>
 <20191022082643.GO25745@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_021716_864531_44338164 
X-CRM114-Status: GOOD (  17.39  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUnVzc2VsbCwKClJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbiA8bGludXhAYXJtbGlu
dXgub3JnLnVrPiB3cm90ZSBvbiBUdWUsIDIyCk9jdCAyMDE5IDA5OjI2OjQzICswMTAwOgoKPiBP
biBGcmksIE9jdCAxOCwgMjAxOSBhdCAwNDozNjo0M1BNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+ID4gQW55IHdyaXRlIHdpdGggZWl0aGVyIGRkIG9yIGZsYXNoY3AgdG8gYSBkZXZpY2Ug
ZHJpdmVuIGJ5IHRoZQo+ID4gc3BlYXJfc21pLmMgZHJpdmVyIHdpbGwgcGFzcyB0aHJvdWdoIHRo
ZSBzcGVhcl9zbWlfY3B5X3RvaW8oKQo+ID4gZnVuY3Rpb24uIFRoaXMgZnVuY3Rpb24gd2lsbCBn
ZXQgY2FsbGVkIGZvciBjaHVua3Mgb2YgdXAgdG8gMjU2IGJ5dGVzLgo+ID4gSWYgdGhlIGFtb3Vu
dCBvZiBkYXRhIGlzIHNtYWxsZXIsIHdlIG1heSBoYXZlIGEgcHJvYmxlbSBpZiB0aGUgZGF0YQo+
ID4gbGVuZ3RoIGlzIG5vdCA0LWJ5dGUgYWxpZ25lZC4gSW4gdGhpcyBzaXR1YXRpb24sIHRoZSBr
ZXJuZWwgcGFuaWNzCj4gPiBkdXJpbmcgdGhlIG1lbWNweToKPiA+IAo+ID4gICAgICMgZGQgaWY9
L2Rldi91cmFuZG9tIGJzPTEwMDEgY291bnQ9MSBvZj0vZGV2L210ZDYKPiA+ICAgICBzcGVhcl9z
bWlfY3B5X3RvaW8gWzYyMF0gZGVzdCBjOTA3MDAwMCwgc3JjIGM3YmU4ODAwLCBsZW4gMjU2Cj4g
PiAgICAgc3BlYXJfc21pX2NweV90b2lvIFs2MjBdIGRlc3QgYzkwNzAxMDAsIHNyYyBjN2JlODkw
MCwgbGVuIDI1Ngo+ID4gICAgIHNwZWFyX3NtaV9jcHlfdG9pbyBbNjIwXSBkZXN0IGM5MDcwMjAw
LCBzcmMgYzdiZThhMDAsIGxlbiAyNTYKPiA+ICAgICBzcGVhcl9zbWlfY3B5X3RvaW8gWzYyMF0g
ZGVzdCBjOTA3MDMwMCwgc3JjIGM3YmU4YjAwLCBsZW4gMjMzCj4gPiAgICAgVW5oYW5kbGVkIGZh
dWx0OiBleHRlcm5hbCBhYm9ydCBvbiBub24tbGluZWZldGNoICgweDgwOCkgYXQgMHhjOTA3MDNl
OAo+ID4gICAgIFsuLi5dCj4gPiAgICAgUEMgaXMgYXQgbWVtY3B5KzB4Y2MvMHgzMzAgIAo+IAo+
IEkgbmVlZCB0aGUgZnVsbCBvb3BzIGlmIHlvdSB3YW50IG1lIHRvIGNvbW1lbnQgb24gdGhpcy4K
CkZZSSwgSSByYW4gdGhlIGRkIGNvbW1hbmQgd2l0aGluIGEgZm9yIGxvb3AsIGluY3JlbWVudGlu
ZyB0aGUgYmxvY2sgc2l6ZQooYnMpIGJ5IG9uZSBieXRlLCBpZiBmYWlsZWQgd2l0aCBicz02LgoK
RGlzYWJsaW5nIFdCX01PREUgKGJ1cnN0IG1vZGUpIGRvZXMgbm90IGNoYW5nZSBhbnl0aGluZy4K
CkFkZGluZyBhIHdtYigpIHJpZ2h0IGFmdGVyIHRoZSBtZW1jcHlfdG9pbygpIHByZXZlbnRzIHRo
ZSBmYXVsdC4KCkhlcmUgaXMgdGhlIGZ1bGwgdHJhY2Ugd2hlbiB3cml0aW5nIDEwMDEgYnl0ZXM6
CgojIGRkIGlmPS9kZXYvdXJhbmRvbSBicz0xMDAxIGNvdW50PTEgb2Y9L2Rldi9tdGQ2ClVuaGFu
ZGxlZCBmYXVsdDogZXh0ZXJuYWwgYWJvcnQgb24gbm9uLWxpbmVmZXRjaCAoMHg4MDgpIGF0IDB4
YzkwNzAzZTgKcGdkID0gYzdiZTgwMDAKW2M5MDcwM2U4XSAqcGdkPWY4MDAwNDUyKGJhZCkKSW50
ZXJuYWwgZXJyb3I6IDogODA4IFsjMV0gQVJNCk1vZHVsZXMgbGlua2VkIGluOgpDUFU6IDAgUElE
OiA2NjAgQ29tbTogZGQgTm90IHRhaW50ZWQgNC4xNC4wLTAwMDQ1LWdmNWQwODE5MjcwNGYtZGly
dHkgIzYKSGFyZHdhcmUgbmFtZTogU1QgU1BFQXI2MDAgKEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSkK
dGFzazogYzdhMDUwODAgdGFzay5zdGFjazogYzdiZDIwMDAKUEMgaXMgYXQgbWVtY3B5KzB4Y2Mv
MHgzMzAKTFIgaXMgYXQgMHgxM2YwZWMyOApwYyA6IFs8YzA0NDM0NGM+XSAgICBsciA6IFs8MTNm
MGVjMjg+XSAgICBwc3I6IDgwMDAwMDEzCnNwIDogYzdiZDNlNDQgIGlwIDogMDAwMDAwMTggIGZw
IDogMDAwMDAzZTkKcjEwOiAwMDAwMDAwMCAgcjkgOiBjN2E5OTU5YyAgcjggOiBjN2JkM2VhYwpy
NyA6IGM3YTk5NTkwICByNiA6IGM3YWZiNDM4ICByNSA6IDAwMDAwMzAwICByNCA6IDUxNzE0MzZj
CnIzIDogMDAwMDAwNTggIHIyIDogODAwMDAwMDAgIHIxIDogYzdiZTRiZTkgIHIwIDogYzkwNzAz
ZTgKRmxhZ3M6IE56Y3YgIElSUXMgb24gIEZJUXMgb24gIE1vZGUgU1ZDXzMyICBJU0EgQVJNICBT
ZWdtZW50IG5vbmUKQ29udHJvbDogMDAwNTMxN2YgIFRhYmxlOiAwN2JlODAwMCAgREFDOiAwMDAw
MDA1MQpQcm9jZXNzIGRkIChwaWQ6IDY2MCwgc3RhY2sgbGltaXQgPSAweGM3YmQyMTkwKQpTdGFj
azogKDB4YzdiZDNlNDQgdG8gMHhjN2JkNDAwMCkKM2U0MDogICAgICAgICAgYzkwNzAzMDAgMDAw
MDAwZTkgYzAyOTBkMTQgYzkwNzAzMDAgYzdiZTRiMDAgMDAwMTA0NmYgYzkwNzAwMDAKM2U2MDog
YzdhZmI0MTggMDAwMDAwMDAgYzdiZDNlOTggMDAwMDAzZTkgYzdiZDNmODggMDAwMDAzZTkgMDAw
MDAwMDAgMDAwYzAwMDgKM2U4MDogMDAwMDAwNTEgYzdiZDIwMDAgYzdiZTQ4MDAgYzAyOGU1N2Mg
MDAwMDAzZTkgYzdiZDNlYWMgYzdiZTQ4MDAgMDAwMDAwMDAKM2VhMDogYzdiZjczYzAgYzdhZGRj
MDAgMDAwMDAzZTkgMDAwMDAzMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAK
M2VjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAz
ZTkgYzAyOGU0YmMgYzc5NjJhODAKM2VlMDogYzdiZDNmODggMDAwMDAwMDAgYzdiZDIwMDAgMDAw
MDAwMDAgMDAwYmY5OTAgYzAwYmRiMGMgMDAwYmY5OTAgYzAwYmQ4NzgKM2YwMDogMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgYzdiZDNmMTAgYzdhNjg4YzAgYzAwOWVlZGMgYzdiZWNiNTggMDAw
YzAwMDAKM2YyMDogMDAwMDAwMDMgYzc5NjI0NjAgYzc5NjI0ODQgMDAwMDAwMDAgMDAwMDAwMDAg
YzA0NWMyZjggMDAwMDAwMDMgYzAwZDllNTgKM2Y0MDogMDAwMDAzZTkgMDAwYzAwMDggYzc5NjJh
ODAgYzdiZDNmODggMDAwMDAwMDAgYzdiZDIwMDAgMDAwMDAwMDAgYzAwYmRkYjQKM2Y2MDogMDAw
YmY5OTAgYzAwYmRhNmMgMDAwMDAwMDAgYzc5NjJhODAgYzc5NjJhODAgMDAwYzAwMDggMDAwMDAz
ZTkgYzAwMGE4MDQKM2Y4MDogYzdiZDIwMDAgYzAwYmRmYTQgMDAwMDAwMDAgMDAwMDAwMDAgMDAw
MDAwMDAgMDAwYmZkOTQgMDAwMDAwMDEgMDAwYzAwMDgKM2ZhMDogMDAwMDAwMDQgYzAwMGE2NDAg
MDAwYmZkOTQgMDAwMDAwMDEgMDAwMDAwMDEgMDAwYzAwMDggMDAwMDAzZTkgYmU4ZThmNTMKM2Zj
MDogMDAwYmZkOTQgMDAwMDAwMDEgMDAwYzAwMDggMDAwMDAwMDQgMDAwYzAwMDggMDAwYzAwMDgg
MDAwMDAzZTkgMDAwYmY5OTAKM2ZlMDogMDAwMDAwMDAgYmU4ZThiYTQgMDAwMGVhM2MgYjZlYmE3
ZWMgNjAwMDAwMTAgMDAwMDAwMDEgMDAwMDAwMDAgMDAwMDAwMDAKWzxjMDQ0MzQ0Yz5dIChtZW1j
cHkpIGZyb20gWzxjMDI5MGQxND5dIChzcGVhcl9tdGRfd3JpdGUrMHgyNDAvMHgyOTQpCls8YzAy
OTBkMTQ+XSAoc3BlYXJfbXRkX3dyaXRlKSBmcm9tIFs8YzAyOGU1N2M+XSAobXRkY2hhcl93cml0
ZSsweGMwLzB4MjMwKQpbPGMwMjhlNTdjPl0gKG10ZGNoYXJfd3JpdGUpIGZyb20gWzxjMDBiZGIw
Yz5dIChfX3Zmc193cml0ZSsweDFjLzB4MTI4KQpbPGMwMGJkYjBjPl0gKF9fdmZzX3dyaXRlKSBm
cm9tIFs8YzAwYmRkYjQ+XSAodmZzX3dyaXRlKzB4YTAvMHgxNjgpCls8YzAwYmRkYjQ+XSAodmZz
X3dyaXRlKSBmcm9tIFs8YzAwYmRmYTQ+XSAoU3lTX3dyaXRlKzB4M2MvMHg5MCkKWzxjMDBiZGZh
ND5dIChTeVNfd3JpdGUpIGZyb20gWzxjMDAwYTY0MD5dIChyZXRfZmFzdF9zeXNjYWxsKzB4MC8w
eDQ0KQpDb2RlOiBlMWIwMmY4MiAxNGQxMzAwMSAyNGQxNDAwMSAyNGQxYzAwMSAoMTRjMDMwMDEp
IAotLS1bIGVuZCB0cmFjZSBmOWE3MzZjYzI4NDFjZjE0IF0tLS0KU2VnbWVudGF0aW9uIGZhdWx0
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
