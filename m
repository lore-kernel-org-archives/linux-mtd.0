Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685E4C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 19:16:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39BDD206E9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 19:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yr882CtT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39BDD206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GYonqnCLdoE67/nQA/STbsgnmTTORfQJUvIZTC5Mazc=; b=yr882CtTayzDlEb0e3+74U4tLk
	U2B23/WlEvictfC5VJJ7P4MQIJbaWD5e0rMBIQDDOoxO+IK/tIqHZJVASVo0rM4w222qWpPCQp6/h
	K9gwF7I5e2jUuvaeYdYHcoiXJHZ5lfp1+XSMOSyqDPurDRsyL4o9WyMWU7bm7k6MA86hTS9VHlyuM
	GcXV0BdIfM9tbxIXrlEdtmdA5dj8u00HyLgF+yiaOPnCp9CEoqlVktm/f+rYu0UmAy29Fut+OA6Tz
	9PSmPQLrqzO02/glN2+WVglrIGGUG47ix8ZSlXPp8d1kGciDEOV4pKkRu+WHKHkPLI17nyyLUp2VP
	5Q0XApzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jst45-00033b-LB; Tue, 07 Jul 2020 19:15:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jst43-00032x-8q
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 19:15:36 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D29FA20006;
 Tue,  7 Jul 2020 19:15:32 +0000 (UTC)
Date: Tue, 7 Jul 2020 21:15:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for v5.8-rc5
Message-ID: <20200707211531.7f762650@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_151535_544129_E9D740B3 
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIHRoZSBNVEQgUFIgZm9yIHRoZSBuZXh0IC1yYy4KClRoYW5r
cywKTWlxdcOobAoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjNhOWUzYjk2
MjJhZTEwMDY0ODI2ZGNjYjRmN2E1MmJkODhjNzQwNzoKCiAgTGludXggNS44LXJjMSAoMjAyMC0w
Ni0xNCAxMjo0NTowNCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdCB0YWdzL210ZC9maXhlcy1mb3ItNS44LXJjNQoKZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDg4MGJjNTI5YmFlMjI1N2QwNWE3NjdmN2Y1YzI0ZmQ2MWE0N2I2MDU6Cgog
IG10ZDogcmF3bmFuZDogeHdheTogRml4IGJ1aWxkIGlzc3VlICgyMDIwLTA3LTA3IDIxOjA0OjM4
ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpNVEQ6CiogU2V0IGEgbWlzc2luZyBtYXN0ZXIgcGFydGl0aW9uIHBh
bmljIHdyaXRlIGZsYWcuCgpSYXcgTkFORDoKKiBGaXggYnVpbGQgaXNzdWUgaW4gdGhlIHh3YXkg
ZHJpdmVyLgoqIEZpeCBhIHdyb25nIHJldHVybiBjb2RlLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpLYW1hbCBEYXN1ICgx
KToKICAgICAgbXRkOiBzZXQgbWFzdGVyIHBhcnRpdGlvbiBwYW5pYyB3cml0ZSBmbGFnCgpNaXF1
ZWwgUmF5bmFsICgxKToKICAgICAgbXRkOiByYXduYW5kOiB4d2F5OiBGaXggYnVpbGQgaXNzdWUK
ClJpY2hhcmQgV2VpbmJlcmdlciAoMSk6CiAgICAgIG5hbmRzaW06IEZpeCByZXR1cm4gY29kZSB0
ZXN0aW5nIG9mIG5zX2ZpbmRfb3BlcmF0aW9uKCkKCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAg
ICAgICAgICB8IDQgKystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jICAgfCAyICst
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYyB8IDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
