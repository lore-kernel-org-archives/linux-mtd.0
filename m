Return-Path: <SRS0=jTzi=VC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DA0C46499
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 21:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414FD216E3
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 21:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="puqXcueH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 414FD216E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVw9hN3W92i39ICPzv7nIJ88/uek5jDvsQzpVcmrZRI=; b=puqXcueHQA9sxH
	fxDrLa9dYdchVrqj3B7RLktJ5qL0HLhfH6UivIwpgVFOIRyWjRH2RwDfu4hqenyPrhUk16ZhWLCws
	e6MxPt5gt4ShbAZ437rBBxEW8AoRT6HTkW5LgvDk8pu8J3RUEHtwy0h/CxtDaapJOu9YIOkAX9NG9
	Z8Pv3jNUOgG5DnwPVlfA0JiMGIjSbbS3mUCd5vxKjopJeaFn5lEEG0fV5Nn7GiXPfRkBYQGGomiJJ
	f+vB5D9N+qUBE1Yi2OLAeZvOMNTRaaZVq7ZSySmjwyPeIeNGxbutlwA4TCJ00UjGkVenNGD8AAqw9
	sZNjeDzOBBHDoH1/3cjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjVfq-0004o0-2z; Fri, 05 Jul 2019 21:23:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjVfn-0004nh-1z
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2019 21:23:16 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7FD2F1BF20A;
 Fri,  5 Jul 2019 21:23:10 +0000 (UTC)
Date: Fri, 5 Jul 2019 23:23:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for 5.2 final
Message-ID: <20190705232308.4ff8b304@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190705_142315_258535_6DECFF01 
X-CRM114-Status: UNSURE (   9.81  )
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
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTGludXMsCgpUaGlzIGlzIHRoZSBsYXN0IE1URCBmaXhlcyBQUiBmb3IgNS4yLgoKVGhh
bmtzLApNaXF1w6hsCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2ZmJjNzI3
NWM3YTliYTk3ODc3MDUwMzM1ZjI5MDM0MWExZmQ4ZGJmOgoKICBMaW51eCA1LjItcmM3ICgyMDE5
LTA2LTMwIDExOjI1OjM2ICswODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9t
dGQvbGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci01LjItZmluYWwKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byBjN2E4N2NlYjE3YWVlOTIyMmMwNjlhOTdhZWU0NjQ3MjYwYzdiM2E2
OgoKICBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBBZGQgQTIzL0EzMyBETUEgc3VwcG9ydCB3aXRoIGV4
dHJhIE1CVVMgY29uZmlndXJhdGlvbiAoMjAxOS0wNy0wNSAyMjozMDo1OCArMDIwMCkKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KLSBGaXggdGhlIG1lbW9yeSBvcmdhbml6YXRpb24gc3RydWN0dXJlIG9mIGEgTWFjcm9uaXgg
U1BJLU5BTkQgY2hpcC4KLSBGaXggYSBidWlsZCBkZXBlbmRlbmN5IHdyb25nbHkgZGVzY3JpYmVk
LgotIEZpeCB0aGUgc3VueGkgTkFORCBkcml2ZXIgZm9yIEEyMy9BMzMgU29DcyBieSAxLyByZXZl
cnRpbmcgdGhlCiAgZmF1bHR5IGNvbW1pdCBpbnRyb2R1Y2luZyBicm9rZW4gRE1BIHN1cHBvcnQg
YW5kIDIvIGFwcGx5aW5nIGFub3RoZXIKICBjb21taXQgYnJpbmdpbmcgd29ya2luZyBETUEgc3Vw
cG9ydC4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KRnJpZWRlciBTY2hyZW1wZiAoMSk6CiAgICAgIG10ZDogc3BpbmFuZDog
Rml4IG1heF9iYWRfZXJhc2VibG9ja3NfcGVyX2x1biBpbmZvIGluIG1lbW9yZwoKTWlxdWVsIFJh
eW5hbCAoMik6CiAgICAgIFJldmVydCAibXRkOiByYXduYW5kOiBzdW54aTogQWRkIEEyMy9BMzMg
RE1BIHN1cHBvcnQiCiAgICAgIG10ZDogcmF3bmFuZDogc3VueGk6IEFkZCBBMjMvQTMzIERNQSBz
dXBwb3J0IHdpdGggZXh0cmEgTUJVUyBjb25maWd1cmF0aW9uCgpQYXVsIENlcmN1ZWlsICgxKToK
ICAgICAgbXRkOiByYXduYW5kOiBpbmdlbmljOiBGaXggaW5nZW5pY19lY2MgZGVwZW5kZW5jeQoK
IGRyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICB8ICA0ICsrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2Vj
Yy5jICAgICAgICAgICAgICB8ICA5IC0tLS0tLQogLi4uL3Jhdy9pbmdlbmljL3tpbmdlbmljX25h
bmQuYyA9PiBpbmdlbmljX25hbmRfZHJ2LmN9ICB8ICAwCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dW54aV9uYW5kLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNDAgKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9naWdhZGV2aWNlLmMgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNCArLS0KIDcgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KSwgMzkgZGVsZXRpb25zKC0pCiByZW5hbWUgZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy97
aW5nZW5pY19uYW5kLmMgPT4gaW5nZW5pY19uYW5kX2Rydi5jfSAoMTAwJSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
