Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CECBC282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 22:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9E821841
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 22:11:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ux7U6l7t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B9E821841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmRLnLCDZeqSDfLqvTM9/x5iw70k+p3mUEOlcYyDQEc=; b=Ux7U6l7tAWiEBE
	IfdJnvkX3aMTk+75d4MGSYp5cnBBsTuIoIgnoEDK4vfaHR2io3RooG/6Isal5hlEbi+s4DZ88Xvjk
	BLYc55ywQUD/VPBblTgcIW3pcQpvWo2n1bcHwqWzF3T82ZlouPOgTlCpmOQDAAqjw7LJnY/tJBBBB
	0S/lxAlxWXmJO9lDT4yB6GL6TJ/4OM3DhAGkaEI0iRVDQFdrZ/W8AxpKjx9hIW+D/gH+evvRemsNs
	kpdC5nmbML3Ph53Gz/UKgmVmHwsJvMLI8c59KFN2J0dywnqyyqmwQd4I8yY3Y21fSMI9RQwb4K4yO
	INL7z8nkfDeFkPvO5yyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsENE-0007E4-Dj; Fri, 08 Feb 2019 22:11:52 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsENB-0007Dj-8v
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 22:11:50 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7BF60100009;
 Fri,  8 Feb 2019 22:11:45 +0000 (UTC)
Date: Fri, 8 Feb 2019 23:11:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 07/11] mtd: rawnand: denali: use bool type instead of
 int where appropriate
Message-ID: <20190208231144.413a8f6d@xps13>
In-Reply-To: <7e1121479b38e98949b44c9fba91dee3adf97b99.camel@perches.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
 <1549613335-30319-8-git-send-email-yamada.masahiro@socionext.com>
 <7e1121479b38e98949b44c9fba91dee3adf97b99.camel@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_141149_462197_65A80613 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9lLAoKSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGUgb24gRnJpLCAwOCBG
ZWIgMjAxOSAwMToyMzozNyAtMDgwMDoKCj4gT24gRnJpLCAyMDE5LTAyLTA4IGF0IDE3OjA4ICsw
OTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4gPiBVc2UgJ2Jvb2wnIHR5cGUgZm9yIHNvbWUg
ZnVuY3Rpb24gYXJndW1lbnRzLgo+ID4gCj4gPiAgLSB3cml0ZSAod3JpdGUgb3IgcmVhZD8pCj4g
PiAgLSByYXcgKHRoZSByYXcgYWNjZXNzIG1vZGUgb3Igbm90PykKPiA+IAo+ID4gSXQgaXMgdHJ1
ZSB0aGF0IGRlbmFsaV9uYW5kX2luZm86OmRtYV9hdmFpbCBpcyBhbHNvIGJvb2xlYW4sIGJ1dAo+
ID4gSSBhbSBrZWVwaW5nIGl0IGFzICdpbnQnIGJlY2F1c2UgJ3NjcmlwdHMvY2hlY2twYXRjaCAt
LXN0cmljdCcgd291bGQKPiA+IHJlcG9ydCB0aGUgZm9sbG93aW5nOgo+ID4gCj4gPiBDSEVDSzog
QXZvaWQgdXNpbmcgYm9vbCBzdHJ1Y3R1cmUgbWVtYmVycyBiZWNhdXNlIG9mIHBvc3NpYmxlIGFs
aWdubWVudCBpc3N1ZXMKPiA+ICAgLSBzZWU6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE3LzEx
LzIxLzM4NAo+ID4gCj4gPiBJIGRvIG5vdCB0aGluayBpdCBpcyBhIG1hdHRlciBoZXJlLCBidXQg
SSBhbSBzdGlja2luZyB0byB0aGUgc3VnZ2VzdGlvbi4gIAo+IAo+IGp1c3QgZnlpOiB0aGF0IHN1
Z2dlc3Rpb24gaGFzIGJlZW4gcmVtb3ZlZCBieToKPiAKPiBjb21taXQgNzk2NzY1NmZmYmZhNDkz
ZjU1NDZjMGYxOGJmOGEyOGY3MDJjNGJhYQo+IEF1dGhvcjogSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+Cj4gRGF0ZTogICBGcmkgSmFuIDE4IDE1OjUwOjQ3IDIwMTkgLTA3MDAKPiAKPiAg
ICAgY29kaW5nLXN0eWxlOiBDbGFyaWZ5IHRoZSBleHBlY3RhdGlvbnMgYXJvdW5kIGJvb2wKPiAg
ICAgCj4gICAgIFRoZXJlIGhhcyBiZWVuIHNvbWUgY29uZnVzaW9uIHNpbmNlIGNoZWNrcGF0Y2gg
c3RhcnRlZCB3YXJuaW5nIGFib3V0IGJvb2wKPiAgICAgdXNlIGluIHN0cnVjdHVyZXMsIGFuZCBw
ZW9wbGUgaGF2ZSBiZWVuIGF2b2lkaW5nIHVzaW5nIGl0Lgo+ICAgICAKPiAgICAgTWFueSBwZW9w
bGUgZmVlbCB0aGVyZSBpcyBzdGlsbCBhIGxlZ2l0aW1hdGUgcGxhY2UgZm9yIGJvb2wgaW4gc3Ry
dWN0dXJlcywKPiAgICAgc28gcHJvdmlkZSBzb21lIGd1aWRhbmNlIG9uIGJvb2wgdXNhZ2UgZGVy
aXZlZCBmcm9tIHRoZSBlbnRpcmUgdGhyZWFkIHRoYXQKPiAgICAgc3Bhd25lZCB0aGUgY2hlY2tw
YXRjaCB3YXJuaW5nLgo+ICAgICAKPiAgICAgTGluazogaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcv
ci9DQSs1NWFGd1ZaazFPZkI5VDJ2MDE0UFRBS0ZodFZhbl9aajJkT2puQ3kzeAo+IAo+IAo+IAoK
SW50ZXJlc3RpbmcsIHRoYW5rcyBmb3IgdGhlIGxpbmshIEkgd2lsbCBjb25zaWRlciB0aGlzIGZv
ciBteSBvbmdvaW5nCmRldmVsb3BtZW50cy4KCgpSZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
