Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB12C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:44:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B601C60FD8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B601C60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KLEEiZtrefL7Je39WV+UPJ61wbM53YYroogfNVlhbiw=; b=UEFydajXZ6G73C
	wI3VWGycw0gVjB9K2yf8aMvkXWrA6KU3nab2D8yBIwYeb7OlEjqJciQ+vMp3ZzpdPtoIRxKu1kel9
	oZ2pGrp3Tdmw48qEXsAPcUlMXDx5FGAFVF/JcZ5AZfP2WM+JWaVXtRQFfxfgMEnZtZIdUHRtMDX7D
	9cPHNE9lXbKc1VJ7yX/NQBbO4Y8Dixn3ED8LZ/Us/W5Y+DZ2nulbs1K3rqb4yzIVstR7tqMORZ1wV
	07hfnB9UXK0f7D74unm+nPci/6pIoo2piX69rPL9p0oMeNwrf/CGOh9mYTsuBBzYcHc7N0viuu3ai
	vxWvH8TA1Du01Ieu5FyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md6Gk-003h75-Dj; Wed, 20 Oct 2021 07:44:14 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md6Gg-003h3w-TR
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 07:44:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A451960F6B67;
 Wed, 20 Oct 2021 09:44:03 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4QEm0mEuHRPv; Wed, 20 Oct 2021 09:44:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F41D860F6B6A;
 Wed, 20 Oct 2021 09:44:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dXwyZmJQ0YJk; Wed, 20 Oct 2021 09:44:01 +0200 (CEST)
Received: from blindfold.corp.sigma-star.at (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 81A7360F6B67;
 Wed, 20 Oct 2021 09:44:01 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 hch@lst.de
Subject: [PATCH] MAINTAINERS: Remove joern@lazybastard.org
Date: Wed, 20 Oct 2021 09:43:28 +0200
Message-Id: <20211020074328.20072-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_004411_141936_974C62D9 
X-CRM114-Status: UNSURE (   7.92  )
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

Sm9lcm4ncyBtYWlsIGJvdW5jZXMgYW5kIG5vYm9keSBrbm93cyB3aGVyZSB0byBmaW5kIHRoaW0K
dGhlc2UgZGF5cy4KU28gcmVtb3ZlIGhpbSBmcm9tIE1BSU5UQUlORVJTLgoKQ2M6IGhjaEBsc3Qu
ZGUKU2lnbmVkLW9mZi1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KLS0t
CiBNQUlOVEFJTkVSUyB8IDEyIC0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggMDU5
MGZlMTRiM2JjLi4wOGUwMDU0NjhiMTEgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01B
SU5UQUlORVJTCkBAIC0zMzE4LDEyICszMzE4LDYgQEAgRjoJaW5jbHVkZS9saW51eC9ibGsqCiBG
OglrZXJuZWwvdHJhY2UvYmxrdHJhY2UuYwogRjoJbGliL3NiaXRtYXAuYwogCi1CTE9DSzJNVEQg
RFJJVkVSCi1NOglKb2VybiBFbmdlbCA8am9lcm5AbGF6eWJhc3RhcmQub3JnPgotTDoJbGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKLVM6CU1haW50YWluZWQKLUY6CWRyaXZlcnMvbXRkL2Rl
dmljZXMvYmxvY2sybXRkLmMKLQogQkxVRVRPT1RIIERSSVZFUlMKIE06CU1hcmNlbCBIb2x0bWFu
biA8bWFyY2VsQGhvbHRtYW5uLm9yZz4KIE06CUpvaGFuIEhlZGJlcmcgPGpvaGFuLmhlZGJlcmdA
Z21haWwuY29tPgpAQCAtMTQ3MzQsMTIgKzE0NzI4LDYgQEAgRjoJaW5jbHVkZS9uZXQvcGhvbmV0
LwogRjoJaW5jbHVkZS91YXBpL2xpbnV4L3Bob25ldC5oCiBGOgluZXQvcGhvbmV0LwogCi1QSFJB
TSBNVEQgRFJJVkVSCi1NOglKb2VybiBFbmdlbCA8am9lcm5AbGF6eWJhc3RhcmQub3JnPgotTDoJ
bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKLVM6CU1haW50YWluZWQKLUY6CWRyaXZlcnMv
bXRkL2RldmljZXMvcGhyYW0uYwotCiBQSUNPTENEIEhJRCBEUklWRVIKIE06CUJydW5vIFByw6lt
b250IDxib25ib25zQGxpbnV4LXZzZXJ2ZXIub3JnPgogTDoJbGludXgtaW5wdXRAdmdlci5rZXJu
ZWwub3JnCi0tIAoyLjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
