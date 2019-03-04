Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FCAC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:17:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C66020835
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="peYh6xyT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="In/1AgNk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C66020835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dPZECsV+bJFgejTAZOrcpcmp+IGoB2JcUIPIqgcq8DY=; b=peYh6xyTvsXOb6
	6p4iUYQxlLYhRv1TorYhI8USn1MMr1Bo6ZlTSOJ83vxxHKHFIHRvC0Yre3ja3kNwmnGbBWLyQ54dI
	+85CSmgpU+VvoMSksOpLAVSqdW8qWNB2klNfMa6QApZ2WvSrNxtZ4FtdR9fV79HEXXoNIi5PzyvHl
	cePibO4j5nydP5dwExV5+we39rKiVsmE8CouAHYMu7GXOUZubTpYxDAOdW7YFnDPU/nfKzrR/qHr5
	9E17N708wab/SV88zTc6M1CG8xJC/E8ySrpYDLWzdZqCBwmQumP1dlu3TysnFV7iEWZFE3W1kXA4s
	iDX04HBy4SmY0l78eX1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0u1d-0000XM-F6; Mon, 04 Mar 2019 20:17:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u0M-0007Hd-81; Mon, 04 Mar 2019 20:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fWF/VKx/tasO6QwzwjQ4OEQermy5kHubz1sLZhEgX8Q=; b=In/1AgNkjnyIE4LWg6Ui+68RyX
 gWVJEysFAHfsehbXL5+SvaPeuuOHRumOYMbvdGkPytvddeOeEJCfEzU/9dDRmrDG3rqlGwoh4cP+O
 099w7KoGCUSjVsJRQDNYZXkWwZfhyJ5fBtkxn6FfpwgpiXvDpXjXXwQRUivVVq8hKFlmXAofJOFIU
 VRDPpX65lO0DvKsVbdKgRaC/Qh6/B4UWK5kCyzIpKN7rP9KMcSHW7KzLt3Va6PpW5bhe1D46jDo4D
 lE/QSM4BZCllU9wioNMuKmAYPza8yNPa2hSWItinB+9SBApXEjFomNamO/To/r3xzYnDzO6ecJ+MA
 VMwjTilw==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u0I-0006Id-RT; Mon, 04 Mar 2019 20:16:04 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D6D8A240008;
 Mon,  4 Mar 2019 20:15:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 00/15] mtd: rawnand: 5th batch of cleanups
Date: Mon,  4 Mar 2019 21:15:07 +0100
Message-Id: <20190304201522.11323-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_201602_987263_88EF43F3 
X-CRM114-Status: GOOD (  13.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIHRpbWUgSSBhbSB0aGUgb25lIHdobyBzZW5kIHRoZSBjbGVhbnVwcyBvbiBi
ZWhhbGYgb2YgQm9yaXMsIEkKanVzdCB0b29rIGhpcyBwYXRjaGVzIGJlY2F1c2UgSSBuZWVkZWQg
dGhlbSBmb3IgbXkgJ2dlbmVyaWMgRUNDCmVuZ2luZScgd29yay4gQmV0d2VlbiB0aGlzIGNsZWFu
dXAgc2VyaWVzIGFuZCB0aGUgRUNDIGVuZ2luZSBzZXJpZXMKdGhlcmUgd2lsbCBiZSBhbiBhZGRp
dGlvbmFsIG9uZSwgdG8gcHJlcGFyZSB0aGUgZmllbGQuCgpQYXRjaCAxIGFkZHMgYSBmaWVsZCB0
byB0aGUgbWVtb3JnIHN0cnVjdHVyZSwgcGF0Y2ggMiAmIDMgYWRkIGhlbHBlcnMKaW4gdGhlIHJh
dyBOQU5EIGNvcmUsIGZvbGxvd2luZyBwYXRjaGVzIGFyZSBnZW5lcmFsIGNsZWFudXBzIGluIHRo
ZQpyYXcgTkFORCBhcmVhIHRoYXQgcHJlcGFyZXMgdGhlIHVzZSBvZiB0aGUgKGdlbmVyaWMpIE5B
TkQgY29yZSBzaGFyZWQKYmV0d2VlbiByYXcgTkFORHMgYW5kIFNQSS1OQU5EcyBhbmQgZmluYWxs
eSBhIGZldyBuYW5kX2NoaXAgZW50cmllcwphcmUgZHJvcHBlZC4KClJlZ2FyZHMsCk1pcXXDqGwK
CkNoYW5ncyBmb3IgdjIKPT09PT09PT09PT09PQoqIEZpeGVkIHRoZSBpbmNvbnNpc3RlbmNpZXMg
YmV0d2VlbiBwYXRjaCA3IGFuZCAxMyBwb2ludGVkIG91dCBieSBGcmllZGVyLgoqIEZpeGVkIHRo
ZSBkZXJpdmF0aW9uIG9mIG1lbW9yZy0+cGFnZXNfcGVyX2VyYXNlYmxvY2suCiogQWRkZWQgRnJp
ZWRlciBSZXZpZXdlZC1ieSB0YWdzLgoKCkJvcmlzIEJyZXppbGxvbiAoMTUpOgogIG10ZDogbmFu
ZDogQWRkIG1heF9iYWRfZXJhc2VibG9ja3NfcGVyX2x1biBpbmZvIHRvIG1lbW9yZwogIG10ZDog
bmFuZDogQWRkIGEgaGVscGVyIHJldHVybmluZyB0aGUgbnVtYmVyIG9mIGVyYXNlYmxvY2tzIHBl
ciB0YXJnZXQKICBtdGQ6IG5hbmQ6IEFkZCBhIGhlbHBlciB0byByZXRyaWV2ZSB0aGUgbnVtYmVy
IG9mIHBhZ2VzIHBlciB0YXJnZXQKICBtdGQ6IHNwaW5hbmQ6IEltcGxlbWVudCBtdGQtPl9tYXhf
YmFkX2Jsb2NrcwogIG10ZDogcmF3bmFuZDogVXNlIG5hbmRfdG9fbXRkKCkgaW4gbmFuZF97c2V0
LGdldH1fZmxhc2hfbm9kZSgpCiAgbXRkOiByYXduYW5kOiBQcmVwYXJlIHRoaW5ncyB0byByZXVz
ZSB0aGUgZ2VuZXJpYyBOQU5EIGxheWVyCiAgbXRkOiByYXduYW5kOiBGaWxsIG1lbW9yZyBkdXJp
bmcgZGV0ZWN0aW9uCiAgbXRkOiByYXduYW5kOiBJbml0aWFsaXplIHRoZSBuYW5kX2RldmljZSBv
YmplY3QKICBtdGQ6IHJhd25hbmQ6IFByb3ZpZGUgYSBoZWxwZXIgdG8gZ2V0IGNoaXAtPmRhdGFf
YnVmCiAgbXRkOiByYXduYW5kOiBNb3ZlIGFsbCBwYWdlIGNhY2hlIHJlbGF0ZWQgZmllbGRzIHRv
IGEgc3ViLXN0cnVjdAogIG10ZDogcmF3bmFuZDogVXNlIG5hbmRkZXZfbXRkX21heF9iYWRfYmxv
Y2tzKCkKICBtdGQ6IHJhd25hbmQ6IEdldCByaWQgb2YgY2hpcC0+Yml0c19wZXJfY2VsbAogIG10
ZDogcmF3bmFuZDogR2V0IHJpZCBvZiBjaGlwLT5jaGlwc2l6ZQogIG10ZDogcmF3bmFuZDogR2V0
IHJpZCBvZiBjaGlwLT5udW1jaGlwcwogIG10ZDogcmF3bmFuZDogR2V0IHJpZCBvZiBjaGlwLT5l
Y2Nfe3N0cmVuZ3RoLHN0ZXB9X2RzCgogZHJpdmVycy9tdGQvbmFuZC9jb3JlLmMgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDM0ICsrKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29u
dHJvbGxlci5jICB8ICAgOCArLQogLi4uL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29wc19i
Y200NzA2LmMgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jICAgICAgfCAgIDcgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jICAgICAgICAg
ICAgICAgICB8ICAgNiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hpcC5jICAgICAg
ICAgICAgIHwgICA2ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMgICAg
ICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9pZmNfbmFuZC5jICAgICAg
ICAgICB8ICAgNCArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5j
ICAgIHwgIDE3ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9oaXNpNTA0X25hbmQuYyAgICAgICAg
ICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oICAgICAgICAgICAg
ICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvano0NzQwX25hbmQuYyAgICAgICAgICAg
IHwgICA3ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYyAgICAgICAgICAg
fCAgNDkgKystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyAgICAgICAgICAgICAg
IHwgICA0ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2FtZC5jICAgICAgICAgICAgICAg
fCAgMTEgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAgICAgICAgICB8
IDI1MyArKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0LmMg
ICAgICAgICAgICAgICB8ICA0NSArKy0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2VzbXQu
YyAgICAgICAgICAgICAgfCAgMTAgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaHluaXgu
YyAgICAgICAgICAgICB8ICA5MCArKysrLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2pl
ZGVjLmMgICAgICAgICAgICAgfCAgMjcgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWlj
cm9uLmMgICAgICAgICAgICB8ICAxNCArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9vbmZp
LmMgICAgICAgICAgICAgIHwgIDM1ICsrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9zYW1z
dW5nLmMgICAgICAgICAgIHwgIDQyICstLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF90b3No
aWJhLmMgICAgICAgICAgIHwgIDE5ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kc2ltLmMg
ICAgICAgICAgICAgICAgfCAgMTEgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
YyAgICAgICAgICAgICB8ICAgOCArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYyAg
ICAgICAgICAgICAgIHwgICA5ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMg
ICAgICAgICAgICAgfCAgMTUgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYyAg
ICAgICAgICAgICB8ICAgOCArLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgICAgICAg
ICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvbXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYyAgICAg
ICAgICAgICB8ICAgNiArLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYyAgICAgICAg
ICAgICAgIHwgICA0ICstCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYyAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hpYmEuYyAgICAgICAgICAg
ICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jICAgICAgICAgICAg
ICAgIHwgICA0ICstCiBpbmNsdWRlL2xpbnV4L210ZC9uYW5kLmggICAgICAgICAgICAgICAgICAg
ICAgfCAgMzIgKystCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICAgICAgICAgICAg
ICAgfCAgOTcgKysrKy0tLQogMzggZmlsZXMgY2hhbmdlZCwgNTQ4IGluc2VydGlvbnMoKyksIDM1
MCBkZWxldGlvbnMoLSkKCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
