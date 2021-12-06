Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BE2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XtURfALEmNP4K5mLqwftIvjRTTTYX1bjZGzyGQZKc84=; b=lwNoHSN1E3LN58
	7blKGd/piU5kg4Hlqu5nvREl0fIt4sEfsFxWmP0nUoDeIK6Uxog6MMniSFtfAKZpQpM9bQgwR5k6U
	9XhxjVlmVOngY17HMv8vZxUx0XBxP1o63sS8HnzfBjC0H2r58oF72EJohKDKNTBEBRrxzkuA9UWeE
	aSuIQd0bLi+VSTkHN5Xt+3ILmGA+p2TmfhyLSYMXXHwDGjC6MHkxkOpf6eQD/c85MeXG1t4TLfn2t
	eqhjW7fQOevEQYm+H/7+2Z+3+GOrsFYb4TWfsnXyKyv1kBntCfF5zlT3M5OVEaMjmjPa51r53PfLR
	uqnDegyLVQ7DiwAdqzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muAmS-003Ebb-2a; Mon, 06 Dec 2021 09:59:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muAmO-003EZD-4y
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 09:59:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 54C5C24000A;
 Mon,  6 Dec 2021 09:59:22 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/3] Stacked/parallel memories bindings
Date: Mon,  6 Dec 2021 10:59:18 +0100
Message-Id: <20211206095921.33302-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_015928_383650_3957EDD3 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gUm9iLCBNYXJrLCBUdWRvciAmIFByYXR5dXNoLAoKSGVyZSBpcyBhIHRoaXJkIHZlcnNp
b25zIGZvciB0aGVzZSBiaW5kaW5ncywgd2hpY2ggYXBwbGllcyBvbiB0b3Agb2YKUHJhdHl1c2gn
cyB3b3JrOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTExMDkxODE5MTEuMjI1MS0x
LXAueWFkYXZAdGkuY29tLwoKQ2hlZXJzLApNaXF1w6hsCgpDaGFuZ2VzIGluIHYzOgoqIFJlYmFz
ZWQgb24gdG9wIG9mIFByYXR5dXNoJ3MgcmVjZW50IGNoYW5nZXMuCiogRHJvcHBlZCB0aGUgY29t
bWl0IGFsbG93aW5nIHRvIHByb3ZpZGUgdHdvIHJlZyBlbnRyaWVzIG9uIHRoZSBub2RlCiAgbmFt
ZS4KKiBEcm9wcGVkIHRoZSBjb21taXQgcmVmZXJlbmNpbmcgc3BpLWNvbnRyb2xsZXIueWFtbCBm
cm9tCiAgamVkZWMsc3BpLW5vci55YW1sLCBub3cgcmVwbGFjZWQgYnkgc3BpLXBlcmlwaGVyYWwt
cHJvcHMueWFtbCBhbmQKICBhbHJlYWR5IGRvbmUgaW4gUHJhdHl1c2gncyBzZXJpZXMuCiogQWRk
ZWQgUm9iJ3MgQWNrLgoqIEVuaGFuY2VkIGEgY29tbWl0IG1lc3NhZ2UuCiogTW92ZWQgdGhlIG5l
dyBwcm9wZXJ0aWVzIHRvIHRoZSBuZXcgU1BJIHBlcmlwaGVyYWwgYmluZGluZyBmaWxlLgoKQ2hh
bmdlcyBpbiB2MjoKKiBEcm9wcGVkIHRoZSBkdGMgY2hhbmdlcyBmb3Igbm93LgoqIE1vdmVkIHRo
ZSBwcm9wZXJ0aWVzIGluIHRoZSBkZXZpY2UncyBub2Rlcywgbm90IHRoZSBjb250cm9sbGVyJ3Mu
CiogRHJvcHBlZCB0aGUgdXNlbGVzcyAjYWRkcmVzcy1jZWxscyBjaGFuZ2UuCiogQWRkZWQgYSBt
aXNzaW5nICJtaW5JdGVtcyIuCiogTW92ZWQgdGhlIG5ldyBwcm9wZXJ0aWVzIGluIHRoZSBzcGkt
Y29udHJvbGxlci55YW1sIGZpbGUuCiogQWRkZWQgYW4gZXhhbXBsZSB1c2luZyB0d28gc3RhY2tl
ZCBtZW1vcmllcyBpbiB0aGUKICBzcGktY29udHJvbGxlci55YW1sIGZpbGUuCiogUmVuYW1lZCB0
aGUgcHJvcGVydGllcyB0byBkcm9wIHRoZSBYaWxpbnggcHJlZml4LgoqIEFkZGVkIGEgcGF0Y2gg
dG8gZml4IHRoZSBzcGktbm9yIGplZGVjIHlhbWwgZmlsZS4KCk1pcXVlbCBSYXluYWwgKDMpOgog
IGR0LWJpbmRpbmdzOiBtdGQ6IHNwaS1ub3I6IEFsbG93IHR3byBDUyBwZXIgZGV2aWNlCiAgc3Bp
OiBkdC1iaW5kaW5nczogRGVzY3JpYmUgc3RhY2tlZC9wYXJhbGxlbCBtZW1vcmllcyBtb2Rlcwog
IHNwaTogZHQtYmluZGluZ3M6IEFkZCBhbiBleGFtcGxlIHdpdGggdHdvIHN0YWNrZWQgZmxhc2hl
cwoKIC4uLi9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sICAgICAgICAgICB8ICAzICsr
LQogLi4uL2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sICAgICAgICAgIHwgIDcgKysr
KysrKwogLi4uL2JpbmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sICAgIHwgMjEg
KysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
