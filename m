Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B949C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nrrS7RI6Ez4+fZwGXN30CG/Yh6YoX7lRNADKBCr0Q1A=; b=Y0k3iFskJmORy9
	ieUXA7uBPzwiq9kOwx/hGDVCrYfIivhKBi+jivT1KZATf7zzMghRKTRJEQ++dEhcBIWwFnYvl6TnW
	H5NBd41FgZKg0bMPjTWhpJZa8TMObDC45bFcGOuetsC8GzdeSOnSw+5ZeWS1a+z6OH+feOychyB/l
	BDvjA2bCRZDf6RjbkD0AkjvlxFzi8+FfqltxXa1FRp5vYvB0qkBFuiHAfxRS7SIMCtwLhf1HIDmoi
	0q+ZLjL66HnFZ2/twIoeiGGNmoRbVOM4CxMRCyoVfIb2T2nFBPaUdgTcaliKBP3C5sgkVrELKfnkR
	8zctX0WNfIRt40txx67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njeBt-000ooL-Nl; Wed, 27 Apr 2022 09:42:33 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njeBq-000omi-E7
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 09:42:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88F3C200006;
 Wed, 27 Apr 2022 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651052546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2Os8UmEkM4YAJJt2iMunVLmf9fDm4xLcC8Rb9y57nPU=;
 b=ZHQ5jcKugqfvVn8sQ9TnnPwi8XcY0PlcsLpmyZAgzkTOMz2XiJ+2ZGWconG18qOLJpLv/G
 8KhzIMo6nqHuzu6v9kvZuXAWRv8QQdYJieYZ0MNekrMLfp5j+IeTYwEqKAsjLVxMwgOttk
 097KYO5ODV+XOYh54EnZCmDDnYwquf4DR7Kiy/iNqOetPddvZ9QQK2xigVnTIV68RDSkmD
 pKhF2TanEAuIY/qE/6cewZH/dAII/mMGXB3bDAnZHesbEUVaQW2qP7ibCNo1EqWnfXLftj
 FgPF8bpubKeSjGuwEr7bqjK/e3N+t4/jtPhsnCbCNwZodZ+pWyNJkHuVMDQ6Zw==
Date: Wed, 27 Apr 2022 11:42:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for 5.18-rc5
Message-ID: <20220427114222.75209cb3@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_024230_677023_8D5D0F0E 
X-CRM114-Status: UNSURE (   8.60  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciB0aGUgbmV4dCAtcmMuCgpU
aGFua3MsCk1pcXXDqGwKCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDMxMjMx
MDkyODQxNzZiMTUzMjg3NDU5MWY3YzgxZjM4MzdiYmRjMTc6CgogIExpbnV4IDUuMTgtcmMxICgy
MDIyLTA0LTAzIDE0OjA4OjIxIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci01LjE4LXJjNQoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIGJhNzU0MmViMmRkNWRmYzc1YzQ1NzE5OGI4ODk4NjY0MmU2MDIw
NjU6CgogIG10ZDogcmF3bmFuZDogcWNvbTogZml4IG1lbW9yeSBjb3JydXB0aW9uIHRoYXQgY2F1
c2VzIHBhbmljICgyMDIyLTA0LTIxIDA5OjI5OjA3ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNVEQgY29yZSBm
aXg6CiogRml4IGEgcG9zc2libGUgZGF0YSBjb3JydXB0aW9uIG9mIHRoZSAncGFydCcgZmllbGQg
aW4gbXRkX2luZm8KClJhd25hbmQgZml4ZXM6CiogRml4IHRoZSBjaGVjayBvbiB0aGUgcmV0dXJu
IHZhbHVlIG9mIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dAoqIEZpeCB3cm9uZyBFQ0MgcGFy
YW1ldGVycyBmb3IgbXQ3NjIyCiogRml4IGEgcG9zc2libGUgbWVtb3J5IGNvcnJ1cHRpb24gdGhh
dCBtaWdodCBwYW5pYyBpbiB0aGUgUWNvbSBkcml2ZXIKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQ2h1YW5ob25nIEd1byAo
MSk6CiAgICAgIG10ZDogcmF3bmFuZDogZml4IGVjYyBwYXJhbWV0ZXJzIGZvciBtdDc2MjIKCk1k
IFNhZHJlIEFsYW0gKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IHFjb206IGZpeCBtZW1vcnkgY29y
cnVwdGlvbiB0aGF0IGNhdXNlcyBwYW5pYwoKTWlhb3FpYW4gTGluICgxKToKICAgICAgbXRkOiBy
YXduYW5kOiBGaXggcmV0dXJuIHZhbHVlIGNoZWNrIG9mIHdhaXRfZm9yX2NvbXBsZXRpb25fdGlt
ZW91dAoKT2xla3NhbmRyIE9jaGVyZXRueWkgKDEpOgogICAgICBtdGQ6IGZpeCAncGFydCcgZmll
bGQgZGF0YSBjb3JydXB0aW9uIGluIG10ZF9pbmZvCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRr
X2VjYy5jICAgIHwgMTIgKysrKysrKystLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMgfCAyNCArKysrKysrKysrKysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L3NoX2ZsY3RsLmMgICB8IDE0ICsrKysrKysrLS0tLS0tCiBpbmNsdWRlL2xpbnV4L210ZC9tdGQu
aCAgICAgICAgICAgfCAgNiArKy0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KSwgMjUgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
