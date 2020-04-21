Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6272C54FC9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:49:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A54C206A1
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxvtvKxQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A54C206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UbHskOnwnE0yO3Hmm+WReZs3ALAeV8Chr7/5zTEhUQ8=; b=YxvtvKxQnaQ5SI
	18ojtvSXfC9il0FMvb7hEpPnjQi6oFZUDbgdLGEy3bWoptZCRIrossgB2Ie+JbhbqIPk7ICWJFNef
	yZ5dRAemiZBYBG2l8ccQdSOLX51Wpmcwe9UOzFbhgUT9Xk3pOAPnde1XWtXhcFsMgHJWe6BBU/v8r
	rV71q6yDLfAFQnclZ8knSt1IuOR71ixa7wu7/TEwIPG4h/g5Qw2lZQ/HR3+MpVdIHfiO8TmEMjYag
	3MOk8jsYcSphCm8WIeBPfMFBNvpJDQ4SKglEeJ7SEYqDN4lu3Vp2KKzLpBEoYQEP0jRi4aZ6pMpCU
	mrfiYPv6gtGzejH6WkoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQw5A-0006Mm-6a; Tue, 21 Apr 2020 16:49:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQw52-0006EO-Al
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 16:49:06 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E2CA2C0012;
 Tue, 21 Apr 2020 16:48:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/6] Misc Marvell NAND controller driver changes
Date: Tue, 21 Apr 2020 18:48:51 +0200
Message-Id: <20200421164857.8255-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_094904_559676_D4E85627 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVyZSBhcmUgYSBmZXcgY2xlYW51cHMvZml4ZXMgZm9yIHRoZSBNYXJ2ZWxsIE5BTkQgY29udHJv
bGxlcgpkcml2ZXIuIFdoaWxlIHdvcmtpbmcgb24gYW5vdGhlciBkcml2ZXIsIEkgZmlndXJlZCBz
b21lCm1pc3Rha2VzL3VuY2xlYXIgbmFtZXMgdGhhdCBJIHdhbnRlZCB0byBjaGFuZ2UuCgpDaGVl
cnMsCk1pcXXDqGwKCk1pcXVlbCBSYXluYWwgKDYpOgogIG10ZDogcmF3bmFuZDogbWFydmVsbDog
Rml4IHRoZSBjb25kaXRpb24gb24gYSByZXR1cm4gY29kZQogIG10ZDogcmF3bmFuZDogbWFydmVs
bDogVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXMoKQogIG10ZDogcmF3bmFuZDogbWFydmVs
bDogVXNlIG5hbmRfY2xlYW51cCgpIHdoZW4gdGhlIGRldmljZSBpcyBub3QgeWV0CiAgICByZWdp
c3RlcmVkCiAgbXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBGaXggcHJvYmUgZXJyb3IgcGF0aAogIG10
ZDogcmF3bmFuZDogbWFydmVsbDogUmVuYW1lIGEgZnVuY3Rpb24gdG8gY2xhcmlmeQogIG10ZDog
cmF3bmFuZDogbWFydmVsbDogUmVuYW1lIHRoZSAtPmNvcnJlY3QoKSBmdW5jdGlvbgoKIGRyaXZl
cnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIHwgNTQgKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMo
LSkKCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
