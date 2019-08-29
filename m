Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1203EC3A59F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 12:44:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D012339E
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 12:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="euoPqMwb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D012339E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GIShgMDfhSa6cqMFIDS2lQJEpp5CWAEF7Mks0HpCmUs=; b=euoPqMwbDXts7L
	4NkBdnrAsp2YgZEpJzCm0OEQmsKDoq462AseKqxIc3pbCZXFEK2HSgK72giSRQ20URi6zjUUl/1Df
	+zjZRz5Z/2GpIxHuIpXWbrng23C5xIwUTgWdqzwYuEZPiY5txfOYdrHWKfuoNvgUQsIu5uA/uW8mj
	NVlRRnnAEvya9A5FnCiFiU5lLOqvRBzA5Npkjm2CZ+e0e6pUj7oMn4idI3QDdXAxouvL0KScBqBLQ
	iMo2Zide6XEbM/HCOeJup//gKynOs081/5JZ22Cd4Grb6YJiEjTJ+XyL2NsizO92I8dH4DqT/kNSW
	+/YRiVVNvYPw9cVZFKbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Jn7-0001GH-5n; Thu, 29 Aug 2019 12:44:41 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Jn4-0001Fn-8y
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 12:44:39 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 165B16000B;
 Thu, 29 Aug 2019 12:44:28 +0000 (UTC)
Date: Thu, 29 Aug 2019 14:44:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for -rc7
Message-ID: <20190829144428.3cb4d481@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_054438_465957_12D36954 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTGludXMsCgpUaGlzIGlzIGhvcGVmdWxseSB0aGUgbGFzdCBNVEQgZml4ZXMgUFIgZm9y
IHRoZSA1LjMgY3ljbGUgd2l0aCBhCnNpbmdsZSBjaGFuZ2UgdG8gYXZvaWQgYnVpbGQgZmFpbHVy
ZXMgd2hlbiBjb21waWxpbmcgSHlwZXJidXMgc3VwcG9ydC4KClRoYW5rcywKTWlxdcOobAoKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYTU1YWE4OWFhYjkwZmFlN2M4MTViMDU1
MWIwN2JlMzdkYjM1OWQ3NjoKCiAgTGludXggNS4zLXJjNiAoMjAxOS0wOC0yNSAxMjowMToyMyAt
MDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCB0YWdz
L210ZC9maXhlcy1mb3ItNS4zLXJjNwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGRj
OWNmZDI2OTIyMjVhMjE2NGY0ZjIwYjdkZWFmMzhjYTg2NDVkZTM6CgogIG10ZDogaHlwZXJidXM6
IGZpeCBkZXBlbmRlbmN5IGFuZCBidWlsZCBlcnJvciAoMjAxOS0wOC0yOSAxNDozMToyMyArMDIw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KSHlwZXJidXM6Ci0gQWRkIGEgJ2RlcGVuZHMgb24nIGluIHRoZSBjb3JlIEtj
b25maWcgZW50cnkgdG8gYXZvaWQgYnVpbGQgZXJyb3JzLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSYW5keSBEdW5sYXAg
KDEpOgogICAgICBtdGQ6IGh5cGVyYnVzOiBmaXggZGVwZW5kZW5jeSBhbmQgYnVpbGQgZXJyb3IK
CiBkcml2ZXJzL210ZC9oeXBlcmJ1cy9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
