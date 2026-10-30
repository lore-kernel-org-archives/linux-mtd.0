Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3060A2613
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sfRhDk+q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GIHQ6q94
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ww8TWflAQ3f08waJW/UJjK2TN+NCiHkexsaa9B8Nh1E=; b=sfRhDk+qzd0KL7uizCB2+WJtVZ
	PWecUJ1jNjUNK9BZNhbHy9U6Kw/WebkWlid09Yv6dasJw0dBSF9Va7nylbu1KCIUXzPUnuOc/HiLO
	qvGOlWgHqoRi2S0zNlFSWKesUeMTmpSSBqPGHLQ9tEMECXrjFPV5mdjfR+wNYr8Fp8xJ7f8NqjW4c
	EAO9W36AtT6d4mkvBQFRXXpupwO5Sc3vDbxyccUXliF63BqzjhsKPZik93czmJ8gI6BdWKnpEBhtK
	OQtJ9uPBYmsZtWJIRb6YJADlkacNjdU50ckx/ikM2EF8ZuUmL8Yq+ks0lKJMouSu0ou7MeaH+fYRe
	7kxAc/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfe-0000000CH95-1B7l;
	Fri, 30 Oct 2026 17:45:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfX-0000000CH4p-3uRH
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:45:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79B0BC49F57;
	Fri, 30 Oct 2026 17:46:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A8B5603C2;
	Fri, 30 Oct 2026 17:45:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45BA210328D09;
	Fri, 30 Oct 2026 18:45:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2go0p9yvpcIObJSf0p5k000x9/NneUIJMnzDKOu9y1g=;
	b=GIHQ6q94ShdZBB+aACiDcuq+6rAeERoLG6WWWVgqVMDIBfA/FhayllF/jBOW7wCk7ia2Hf
	orwEeKQ1pGppWUkci3TflBtAUeLAY7xbNtzHVM2ZFSr0+fOg8M7L6x7hBmY9jn7Gwegdvu
	7B2Iju8gEi5uvVOrifmkjhDheA8XCNCqMOWqgRZJ4fi1l5trDecSpXyBTo/N927E3eA7A0
	uoKVMJDvKNioSHZ0vLovtZosuxy592H81ILxJms/TzwwFaGy+6ZNKT+6DXqeQVbuPu565X
	h0oKGYjVC2zK8hBimIy+/lycLNcn9DlEXaoFbpKZDoD5vTtlczMoikcO8GjqCg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/13] mtd: spinand winbond: Add support for W25NxxLV and
 W25NxxLW chips
Date: Fri, 30 Oct 2026 18:45:24 +0100
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrB1IIlrbq0gX0UzsgB1LIiYQv
 HuDy7f4v0CkwBTh1RQIdHLkXSp028DysbISsqsGo8ygVacwscy7OPzaeFDAZHrJeTsT6uc4O9t
 Z/1gM1PwXyHO+19P7uv6d4YQoagAAAA==
X-Change-ID: 20261030-winbond-master-w25nxxlvw-198bda3af7c2
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104536_166518_FC09A73B 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These chips mostly reuse the existing infrastructure and have been
tested using the mtd-utils test suite. In particular, I wrote and
contributed a new tool to ease continuous read testing:
https://lore.kernel.org/linux-mtd/20261030144108.2211604-1-miquel.raynal@bootlin.com/T/#u

A bit of reorganization and renaming is being done as well as
preparation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (13):
      mtd: spinand: winbond: Fix an OOB layout inconsistency with W25NxxLW chips
      mtd: spinand: winbond: Generalize the KV OOB layout
      mtd: spinand: winbond: Generalize the LW OOB layout
      mtd: spinand: winbond: Rename the ->set_cont_read() helper
      mtd: spinand: winbond: Rename the ->ecc_get_status() helper
      mtd: spinand: winbond: Add 1S_1S_1S continuous read variant
      mtd: spinand: winbond: Add basic support for W25N02LV
      mtd: spinand: winbond: Add basic support for W25N04LV
      mtd: spinand: winbond: Add basic support for W25N02LW
      mtd: spinand: winbond: Add continuous read support for W25N02LV
      mtd: spinand: winbond: Add continuous read support for W25N04LV
      mtd: spinand: winbond: Add continuous read support for W25N02LW
      mtd: spinand: winbond: Add continuous read support for W25N04LW

 drivers/mtd/nand/spi/winbond.c | 187 +++++++++++++++++++++++++++--------------
 1 file changed, 126 insertions(+), 61 deletions(-)
---
base-commit: b243a89e1b1e8ead7b44fc4eb0d0d4df0c9e3f4b
change-id: 20261030-winbond-master-w25nxxlvw-198bda3af7c2

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
