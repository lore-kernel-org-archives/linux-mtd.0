Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0D3C388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:07:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F08221EB
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DMAXU+0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35F08221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lu7GwRz6TJmrIfFGAZ15trESHQ6yBUi3lkcMfvJgTzc=; b=DMAXU+0b139M2N71jABakNb09c
	ypjiiFAMMe5GEzr6rTq8T14/GnlL6gZSRn5djW3zvYtzQclebbKpRLTIzsdqHqzl7HIFrfFFEXTC3
	PvTw4OiB8Lo974eQn8EqPJrOoog7iSXJa4chyRBvRmp2AGlVq6OxP74fuuWwwhVwbvLEFksbaaZxf
	u2sqjMFnpYq3vduPp/O9vUAUXN/r4IrkojZGWaqKChmCqVLBdYW5AyOtIZF3Jjjp+r4pAITqrx/3G
	3lf9n0GhgRS5HH8KZxARawTZzQ1TC1HYumyOUuWwnI4pHw2Y2KakOx/cLrMmTulmmT12aCbwzCXBa
	rcD83P6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfr8i-0001Nf-9q; Thu, 19 Nov 2020 21:06:48 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfr8f-0001MC-LT
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:06:46 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 236081BF204;
 Thu, 19 Nov 2020 21:06:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: au1550: Ensure the presence of the right
 includes
Date: Thu, 19 Nov 2020 22:06:40 +0100
Message-Id: <20201119210640.24342-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113124021.32675-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: df9e79a9f6eae9d6d624c37c231ba43e2c5245e0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160645_884673_94259AAB 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIwLTExLTEzIGF0IDEyOjQwOjIxIFVUQywgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBXaGlsZSB3b3JraW5nIGEgYml0IG9uIHRoaXMgZHJpdmVyIEkgZHJvcHBlZCB0aGUgcGxhdGZv
cm0gaW5jbHVkZXMgYW5kCj4gY29tbWVudGVkIGEgZmV3IGxpbmVzIGp1c3QgdG8gdmVyaWZ5IHRo
ZSBjb3JyZWN0bmVzcyBvZiBteSBjaGFuZ2VzLiBJdAo+IGFwcGVhcmVkIHRoZSBmb2xsb3dpbmc6
Cj4gCj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvYXUxNTUwbmQuYzogSW4gZnVuY3Rpb24g4oCYYXUx
NTUwbmRfd2FpdHJkeeKAmToKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jOjEzMDoz
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdXNsZWVwX3Jhbmdl
4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIHVzbGVlcF9y
YW5nZSgxMCwgMTAwKTsKPiAgICBefn5+fn5+fn5+fn4KPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9h
dTE1NTBuZC5jOiBJbiBmdW5jdGlvbiDigJhhdTE1NTBuZF9leGVjX2luc3Ry4oCZOgo+IGRyaXZl
cnMvbXRkL25hbmQvcmF3L2F1MTU1MG5kLmM6MTg4OjM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJhuZGVsYXnigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCj4gICAgbmRlbGF5KGluc3RyLT5kZWxheV9ucyk7Cj4gICAgXn5+fn5+Cj4g
Cj4gSSB0aGluayB0aGUgZGVsYXkuaCBoZWFkZXIgc2hvdWxkIGJlIGluY2x1ZGVkIGluIHRoaXMg
ZmlsZSBhbmQgbm90Cj4gY29tZSBmcm9tIG9uZSBvZiBpdHMgcGxhdGZvcm0gaW5jbHVkZXMsIHNv
IGxldCdzIGFkZCBpdCBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LgoKTWlx
dWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
