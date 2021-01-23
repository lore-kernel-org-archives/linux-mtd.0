Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ABCC433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 19:00:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328E722B2D
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 19:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328E722B2D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s95h+KE35vIKkIWC2ruY0UnxjRKketY+3o3JvG7vMn4=; b=3NLCuACze0pFQzkCBMW61G4R/y
	DAPDPaxVTtSMYJz1bOuYJdEI7saQjKlCmfoEIf7el/o6WEK1zkW5o2Ht/2HI7ZrRmYfiDeY0LkS1I
	XBddk3MTpMfMe7tNKInHhiUaI1zeSEXAF8eaoW512JbsLY/TR1UdNHTsLiMgCqV+ExZlZYpevVVJU
	QNdI9JMgw9uP11lxud7Km3OtNiNy9Migzsge5UQAhDU3Qjph3cPYlHBgaT2KfsBxbH7RS05tc2hhp
	7bMGDeyYdo2HZ6+cBKoBDg9SKqmrxe9kN5UPxd7jlgCY/BuAy10eLC+RSsaNd7iqo6sxssqnOif0v
	ByRZlMvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3O8X-0005b5-Oh; Sat, 23 Jan 2021 18:59:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3O8V-0005an-5n
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 18:59:52 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0D4B640002;
 Sat, 23 Jan 2021 18:59:41 +0000 (UTC)
Date: Sat, 23 Jan 2021 19:59:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for v5.11-rc5
Message-ID: <20210123195940.2c76e738@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_135951_331344_1F58D750 
X-CRM114-Status: UNSURE (   8.37  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciB0aGUgbmV4dCAtcmMuCgpU
aGFua3MsCk1pcXXDqGwKCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDVjOGZl
NTgzY2NlNTQyYWEwYjg0YWRjOTM5Y2U4NTI5M2RlMzZlNWU6CgogIExpbnV4IDUuMTEtcmMxICgy
MDIwLTEyLTI3IDE1OjMwOjIyIC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0IG10ZC9maXhlcwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGIxMzViMzM1OGQ3M2FhMmE4YjJiZTM1ZDA4ZTQyMjQyMWQxYzYwOWU6CgogIG10ZDogcmF3bmFu
ZDogb21hcDogVXNlIEJDSCBwcml2YXRlIGZpZWxkcyBpbiB0aGUgc3BlY2lmaWMgT09CIGxheW91
dCAoMjAyMS0wMS0yMCAyMzozODowMCArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTWFydGluIEJsdW1lbnN0aW5n
bCAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogaW50ZWw6IGNoZWNrIHRoZSBtdGQgbmFtZSBvbmx5
IGFmdGVyIHNldHRpbmcgdGhlIHZhcmlhYmxlCgpNaXF1ZWwgUmF5bmFsICgzKToKICAgICAgbXRk
OiByYXduYW5kOiBuYW5kc2ltOiBGaXggdGhlIGxvZ2ljIHdoZW4gc2VsZWN0aW5nIEhhbW1pbmcg
c29mdCBFQ0MgZW5naW5lCiAgICAgIG10ZDogc3BpbmFuZDogRml4IE1URF9PUFNfQVVUT19PT0Ig
cmVxdWVzdHMKICAgICAgbXRkOiByYXduYW5kOiBvbWFwOiBVc2UgQkNIIHByaXZhdGUgZmllbGRz
IGluIHRoZSBzcGVjaWZpYyBPT0IgbGF5b3V0CgpTZWFuIE55ZWtqYWVyICgxKToKICAgICAgbXRk
OiByYXduYW5kOiBncG1pOiBmaXggZHN0IGJpdCBvZmZzZXQgd2hlbiBleHRyYWN0aW5nIHJhdyBw
YXlsb2FkCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jICAgfCAg
MiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZWwtbmFuZC1jb250cm9sbGVyLmMgfCAgNSAr
KystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jICAgICAgICAgICAgICAgfCAgNyAr
KystLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jICAgICAgICAgICAgICAgICB8IDE1
ICsrKysrKysrKy0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgICAgICAgICAg
ICAgICAgfCAxNCArKysrKysrKysrKy0tLQogNSBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25z
KCspLCAxNiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
