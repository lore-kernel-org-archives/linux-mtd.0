Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160D9C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:13:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB90520693
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SmyLEelG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VU/mgNii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB90520693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xtnPyKs8w5ok/LU4u4/s/gW2nsSIfParnKpd5nawjA=; b=SmyLEelGYWid3a
	xxe8lU/csjaTMs5Pf7UWphOT8xdZGnBT7av5VwDoHVePJe2DyYPycdXrUE1ByEosnO85YU4iOk/+j
	/sb2e+TNK+cfJKMvYOrSdiGI2E4b9weqMLsHoNnl+XHA1NAnV2WbR3ypfsMJJjKxFxYCXYrKfoWLy
	T7cytyUU3HEDuZdh/zAYlqjISW244WIth7ox6UMHqUVKYEEgcHJN4YXG0yDEyiBvM84TDWuWlBfAD
	ZLQyIFhI63sIJ98DSbmzVasEj1JjXWJx7SiDcKsIsTRmsGjHCk7A6YA4trPPtSh0Wp3kpqP1pPzWx
	rFToUy3TEoB5xk3DJN9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9fK-0003ok-6G; Thu, 18 Apr 2019 16:13:34 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9fI-0003od-CO
 for linux-mtd@bombadil.infradead.org; Thu, 18 Apr 2019 16:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qXJR5UitWkUHosKgEYC5qIvfSY2XZh78TFsrdWlc+O4=; b=VU/mgNiis8kfGiH/WK8Xp8QRHK
 Tkga5x+fTt3ldmiiyeXh3p5NIu53lF7pjtZzRkHhHAFIYn39qf2BAOf2Ltpm3gnsgF8xjPZoh01K8
 R7Pm3txk5H6f+13r7bLIRu5vOtMNCK+mXer3ggAzS28q9kPfLKo4fZ+ybuTs3Hs0gijLQiPj3xrTC
 RoYiR63LW7W3AYYRbxNVC36KuJEco8rOdpg4iEHp8N6QBn2rZA3FvRmUHXwPQPpQusiC5JEDxBxL2
 ErrGP/2JKTetB6uHcrjE4Bai301eWeXBGQxD+Xp1DnDDYRnVX61YBze95m47bR00e1hsp7zFwK79R
 PL88fwYQ==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9fE-0003bQ-Pr
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:13:30 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5110560007;
 Thu, 18 Apr 2019 16:12:51 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:12:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v5 0/9] mtd: rawnand: denali: exec_op(), controller/chip
 separation, and cleanups
Message-ID: <20190418181250.14d7da9c@xps13>
In-Reply-To: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
References: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_121328_948714_8F9C16F2 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsICAyIEFwcgoyMDE5IDEzOjAzOjAwICswOTAwOgoKPiBJIHRvb2sg
dGltZSBmb3IgdGhlIERlbmFsaSBkcml2ZXIgdG8gY2F0Y2ggdXAgd2l0aCB0aGUgbGF0ZXN0IGZy
YW1ld29yay4KPiAKPiAgLSBzd2l0Y2ggb3ZlciB0byBleGVjX29wKCkgYW5kIHJlbW92ZSBsZWdh
Y3kgaG9va3MKPiAKPiAgLSBzZXBhcmF0ZSBjb250cm9sbGVyL2NoaXBzCj4gCj4gIC0gdmFyaW91
cyBjbGVhbnVwcwo+IAo+IE1ham9yIGNoYW5nZXMgaW4gdjU6Cj4gCj4gICAtIFBhc3NpbmcgYm90
aCBuYW5kX2NoaXAgYW5kIGRlbmFsaSBpcyByZWR1bmRhbnQuCj4gICAgIFBhc3Mgb25seSBuYW5k
X2NoaXAgdG8gbG9jYWwgaGVscGVycy4KPiAKPiBNYWpvciBjaGFuZ2VzIGluIHY0Ogo+ICAgLSBB
ZGQgZGVuYWxpX2V4ZWNfb3V0KCkgYW5kIGRlbmFsaV9leGVjX2luKCkKPiAgICAgaW4gb3JkZXIg
dG8gbWFrZSBkZW5hbGlfZXhlY19pbnN0cigpIHJlYWRhYmxlCj4gCj4gICAtIE1ha2UgLnJlYWRf
cGFnZV9yYXcoKSBhbmQgLndyaXRlX3BhZ2VfcmF3KCkgZXZlbiBzaW1wbGVyCj4gICAgIGJ5IGdp
dmluZyB1cCB0aGUgcGVyZm9ybWFuY2UKPiAKPiBNYWpvciBjaGFuZ2VzIGluIHYzOgo+ICAgLSBE
cm9wICJtdGQ6IHJhd25hbmQ6IGRlbmFsaTogdXNlIG1vcmUgcHJlY2lzZSB0aW1lb3V0IGZvciBO
QU5EX09QX1dBSVRSRFRfSU5TVFIiCj4gICAgIGVudGlyZWx5IGFjY29yZGluZyB0byB0aGUgcmV2
aWV3IGNvbW1lbnRzIGluIHYyCj4gCj4gICAtIEFkZCBjb21tZW50cyB0byBoZWxwZXJzIGluIDIv
OQo+IAo+IAo+IAo+IE1hc2FoaXJvIFlhbWFkYSAoOSk6Cj4gICBtdGQ6IHJhd25hbmQ6IGRlbmFs
aTogdXNlIG1vcmUgbmFuZF9jaGlwIHBvaW50ZXJzIGZvciBpbnRlcm5hbAo+ICAgICBmdW5jdGlv
bnMKPiAgIG10ZDogcmF3bmFuZDogZGVuYWxpOiByZWZhY3RvciByYXcgcGFnZSBhY2Nlc3NvcnMK
PiAgIG10ZDogcmF3bmFuZDogZGVuYWxpOiByZW1vdmUgdW5uZWVkZWQgY2FzdHMgaW4gZGVuYWxp
X3tyZWFkLHdyaXRlfV9waW8KPiAgIG10ZDogcmF3bmFuZDogZGVuYWxpOiBzd2l0Y2ggb3ZlciB0
byAtPmV4ZWNfb3AoKSBmcm9tIGxlZ2FjeSBob29rcwo+ICAgbXRkOiByYXduYW5kOiBkZW5hbGk6
IHVzZSBib29sIHR5cGUgaW5zdGVhZCBvZiBpbnQgd2hlcmUgYXBwcm9wcmlhdGUKPiAgIG10ZDog
cmF3bmFuZDogZGVuYWxpX3BjaTogcmVuYW1lIGdvdG8gbGFiZWxzCj4gICBtdGQ6IHJhd25hbmQ6
IGRlbmFsaTogZGVjb3VwbGUgY29udHJvbGxlciBhbmQgTkFORCBjaGlwcwo+ICAgbXRkOiByYXdu
YW5kOiBkZW5hbGk6IHJlbW92ZSBERU5BTElfTlJfQkFOS1MgbWFjcm8KPiAgIG10ZDogcmF3bmFu
ZDogZGVuYWxpOiBjbGVhbiB1cCBjb2Rpbmcgc3R5bGUKPiAKPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL2RlbmFsaS1uYW5kLnR4dCAgICAgICAgfCAgIDQwICstCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2RlbmFsaS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTE0NiArKysrKysrKysr
LS0tLS0tLS0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuaCAgICAgICAgICAgICAg
ICAgICAgICB8ICAxMTcgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpX2R0LmMgICAg
ICAgICAgICAgICAgICAgfCAgIDk4ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaV9w
Y2kuYyAgICAgICAgICAgICAgICAgIHwgICAzOCArLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDgyMyBp
bnNlcnRpb25zKCspLCA2MTYgZGVsZXRpb25zKC0pCj4gCgoKQXBwbGllZCB0byAKaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCAKYnJh
bmNoIG5hbmQvbmV4dC4KClRoYW5rcywKTWlxdcOobAoKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
