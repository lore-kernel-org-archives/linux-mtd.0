Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D272C531C7
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LFrmKoUKM3N+Cgcea7uk63md8XjEJh60ONd2bgCZJQ0=; b=2D6JqScU7bbN74
	3I5L4ILjPwvhvbvBsNcsJbv1Cs13BSTKuvMERRZe8P3xn4HpNPhItsvC8e7qEKjZzlDAFR5gx4gO4
	iq9Dxmpoq31YGFuBHvLroCppuCpfCOoi2q2NmnhoJqya7rbXo8OaIFwjiRxldhcUZdh/D0YfEF4iZ
	jOH0XpRUSCAJYVEu8Uk49LIBQyG6a+eQdIQnPnOMwZmVBb3SBLhxtxDgUOWuzQu+0r1sOJEYb9nI7
	rUbqr4mN+rFMUHNtLaT4aGdx5wHAMiIJBQtIJ/n4pcWd4mPCM7biOiHqo0i0PMfh9cXstp+fL5mSV
	uyHZwTinEbTSuFENqnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpYw-0000000DpdI-17jU;
	Thu, 23 Jul 2026 09:17:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpYs-0000000Dpcn-3cIx
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 09:17:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E7C651A11A0
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jul 2026 09:17:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B61C6602B8;
	Thu, 23 Jul 2026 09:17:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3860911C102CB;
	Thu, 23 Jul 2026 11:17:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784798265; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wzpAlNErRH7wC4i3TElD11VHQp8h2JHaBGh1gHFcIyg=;
	b=UrlI5mvFXyd3hbWYTtE8xtmtMfExi4z33/T8ReJoxEA/JDx4eJKoRC7SdR8s449cU5aBVd
	C9pDmQmTGKk8u6YAc0qQsJUiapvZPZ+5hNGjkRnP+KBRlUmKKhwX4thOoIiYqcWJuZqIA8
	sI4bM4IvB1GFp8tYZvabWJU7L0kKFIP6+j1NB2SFdhgCAQf1GvT0BWeAJPA+0OhDFbdFUv
	VVYQBKOw0rW6mGqOr9CWyRQEIYwSuRKH5ixFPk19BE4/dOshO8BRR0ZKW7rrfVqdi2CfxN
	1km+3k0QbE0OqJ2n6jrrlrYOBuicx0cs6W5+KL9M1yuSRGG4suMwqPy8+1T98Q==
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH mtd-www] doc/ubi.xml: clarify from the start that block device on UBI is read-only
Date: Thu, 23 Jul 2026 11:17:28 +0200
Message-ID: <20260723091728.1075673-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_021751_084183_2BFD75EE 
X-CRM114-Status: GOOD (  11.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the introduction, the sentence that introduces ubiblock might let
one think that any read/write block filesystem can be used on top of
UBI, which is wrong. So clarify from the start that this is read-only.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 doc/ubi.xml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 1290735..21bbd00 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -184,9 +184,9 @@ similar because:</p>
 	mechanisms).</li>
 </ul>
 
-<p>UBI also provides a block device that allows regular, block-oriented
-file systems to be mounted on top of an UBI volume. This is possible because UBI
-handles bad-blocks transparently.</p>
+<p>UBI also provides a read-only block device that allows regular, block-oriented
+file systems to be mounted on top of an UBI volume, but only for read-only
+operation. This is possible because UBI handles bad-blocks transparently.</p>
 
 <p>There is an additional driver called <code>gluebi</code> which emulates MTD
 devices on top of UBI volumes. This looks a little strange, because UBI works
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
