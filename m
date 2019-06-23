Return-Path: <SRS0=gyp4=UW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A512FC43613
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jun 2019 19:10:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 743D120656
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jun 2019 19:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t2DEhNME"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 743D120656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ImL65EWBzBUAhSSXD8OxWI4SIC9HcjqbFA7MVOQ32tg=; b=t2DEhNMEU8HA/8
	LdKQNZu53pQ/Wk4IcPPcbPUov0sCDGvywWHO60GsBzEahBrwRczcs9IhQptQxw+xhdGXopPpCr0nd
	BTyBYcjZItTa7m7TsKUjUYu3TxYlrqhbwa4Q/bR7YL4QLeXySJvVK/eWzoP1Gsu4TRbPU6GVWvQRv
	nJ/8KOa/KtiM2XHlSX1sykzlBtYYYS9rIsGni1te6TEw9fZv8swpfGNMxq4vC6qPiZv109Zlcr5ju
	3LiWSTrbni/sPt5EPkcpBxhQ9KCjYRk0WDNDXBb0h4X8mkT8uFMLoolP4QKQNhSAHm+bzJx9d7q46
	bHNoLuPM9ZsJ+tnnPN9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hf7si-00048G-7H; Sun, 23 Jun 2019 19:10:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hf7sd-00047P-NR
 for linux-mtd@lists.infradead.org; Sun, 23 Jun 2019 19:10:25 +0000
X-Originating-IP: 81.185.161.93
Received: from xps13 (93.161.185.81.rev.sfr.net [81.185.161.93])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9A3571C0002;
 Sun, 23 Jun 2019 19:10:05 +0000 (UTC)
Date: Sun, 23 Jun 2019 21:10:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for 5.2-rc7
Message-ID: <20190623211004.6743a8dc@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190623_121023_921279_5E8D3BD4 
X-CRM114-Status: GOOD (  11.28  )
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
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTGludXMsCgpIZXJlIGFyZSB0d28gTVREIGZpeGVzIGZvciB0aGUgbmV4dCAtcmMuCgpU
aGFua3MsCk1pcXXDqGwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYTE4ODMz
OWNhNWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJkOToKCiAgTGludXggNS4yLXJjMSAoMjAx
OS0wNS0xOSAxNTo0NzowOSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bXRkL2xpbnV4LmdpdCB0YWdzL210ZC9maXhlcy1mb3ItNS4yLXJjNwoKZm9yIHlvdSB0byBmZXRj
aCBjaGFuZ2VzIHVwIHRvIDE5MWY1YzJlZDRiNmZhYmFjZjFmMzUwMDI0MjA0N2JkODQ0ZDBjM2E6
CgogIG10ZDogc3BpLW5vcjogdXNlIDE2LWJpdCBXUlIgY29tbWFuZCB3aGVuIFFFIGlzIHNldCBv
biBzcGFuc2lvbiBmbGFzaGVzICgyMDE5LTA2LTIzIDIwOjAzOjM0ICswMjAwKQoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQot
IFNldCB0aGUgcmF3IE5BTkQgbnVtYmVyIG9mIHRhcmdldHMgdG8gdGhlIHJpZ2h0IHZhbHVlLgot
IEZpeCBhIGJ1ZyB1bmNvdmVyZWQgYnkgYSByZWNlbnQgcGF0Y2ggb24gU3BhbnNpb24gU1BJLU5P
UiBmbGFzaGVzLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpTYXNjaGEgSGF1ZXIgKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6
IGluaXRpYWxpemUgbnRhcmdldHMgd2l0aCBtYXhjaGlwcwoKVHVkb3IgQW1iYXJ1cyAoMSk6CiAg
ICAgIG10ZDogc3BpLW5vcjogdXNlIDE2LWJpdCBXUlIgY29tbWFuZCB3aGVuIFFFIGlzIHNldCBv
biBzcGFuc2lvbiBmbGFzaGVzCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCAg
IDMgKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jICAgIHwgMTE5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5o
ICAgICAgfCAgIDMgKwogMyBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
